# HU-005 — Mapa técnico de consulta y actualización del perfil

## Resultado que debe entregar

El alumno autenticado consulta y actualiza sus datos permitidos. El correo se muestra sin edición;
teléfono, apellido materno y documento son opcionales. Una cuenta Google sin contraseña puede
definir una propia sin perder el vínculo Google.

## Punto de partida, tablas y dependencia

- Frontend: `features/cuenta/mi-perfil` es una pantalla pendiente dentro del layout de alumno.
- Backend: no existen endpoints protegidos de perfil.
- Tablas: `usuario` y `persona`.
- Depende de la sesión de HU-001.

## Contratos que deben acordarse

| Operación | Método y ruta | Resultado conceptual |
|---|---|---|
| Consultar perfil propio | `GET /api/perfil` | Datos personales editables y correo de solo lectura |
| Actualizar perfil propio | `PUT /api/perfil` | Perfil persistido y normalizado |
| Definir contraseña propia | `PUT /api/perfil/contrasena` | Nuevo medio de acceso sin eliminar Google |

Ninguna petición acepta `usuarioId`, rol, estado, correo nuevo, fecha de verificación o vínculo
Google. El backend obtiene el usuario desde la sesión.

## Trabajo del backend

### Componentes

- repositorios de usuario y persona con consulta conjunta por usuario autenticado;
- servicio para obtener la identidad actual desde Spring Security;
- DTO de respuesta de perfil;
- DTO de actualización con lista blanca de campos;
- DTO independiente para contraseña;
- `PerfilServicio` y `PerfilControlador` protegidos;
- reglas de autorización que admitan al alumno y a la administración autorizada según su propio
  alcance, sin permitir consultar otro perfil por cambiar un ID.

### Consulta

Debe recuperar correo, origen, existencia de contraseña y datos personales. El hash y
`google_subject` no se entregan; la respuesta solo indica si existe acceso Google y si puede definir
una contraseña propia.

### Actualización paso a paso

1. Obtener `usuarioId` desde la autenticación.
2. Cargar usuario y persona activos.
3. Validar nombres y apellido paterno obligatorios.
4. Convertir campos opcionales vacíos en nulos coherentes.
5. Validar formato y longitud de teléfono y documento solo cuando existan.
6. Actualizar únicamente `persona` y su fecha de modificación.
7. Devolver los datos persistidos para que Angular no dependa de valores locales supuestos.

### Contraseña para Google

1. Confirmar que la cuenta autenticada tiene vínculo Google.
2. Determinar si todavía carece de contraseña propia.
3. Validar nueva contraseña y confirmación.
4. Guardar BCrypt sin cambiar `google_subject` ni crear otro usuario.
5. Si ya posee contraseña, no reutilizar este recorrido para un cambio común no definido por la HU.

## Trabajo del frontend

- Aplicar `sessionGuard` antes de abrir el layout autenticado.
- Convertir `mi-perfil` en formulario reactivo prellenado desde `/api/perfil`.
- Mostrar correo deshabilitado y fuera del objeto enviado al actualizar.
- Marcar claramente teléfono y documento como opcionales.
- Permitir borrar sus valores y enviar ausencia válida.
- Mostrar la sección de creación de contraseña solo cuando backend lo autorice.
- Mantener vínculo Google visible sin presentar un botón para eliminarlo.
- Implementar estados de carga inicial, guardando, guardado, validación, no autorizado y error.
- Actualizar el nombre del encabezado de sesión si el usuario cambió sus nombres.
- No presentar cambios locales como guardados hasta recibir la respuesta exitosa.

## Pruebas mínimas

- consulta con sesión y rechazo sin sesión;
- intento de enviar otro `usuarioId`;
- edición completa y edición con opcionales vacíos;
- correo ausente del DTO de modificación;
- nombres o apellido paterno inválidos;
- documento agregado, cambiado y eliminado;
- cuenta Google sin contraseña, contraseña inválida y creación correcta;
- vínculo Google conservado;
- actualización del encabezado y persistencia tras recargar.

## Fuera de alcance

- cambiar correo;
- elegir entre varios roles;
- editar docentes;
- confirmar datos del certificado;
- modificar certificados ya emitidos;
- cambiar una contraseña propia existente por este recorrido.

## Terminado cuando

El perfil siempre corresponde al usuario autenticado, solo cambia campos permitidos, admite datos
opcionales vacíos y conserva ambos medios de acceso de una cuenta Google.

## Implementación guiada para copiar y adaptar

### 1. Consulta del perfil autenticado

```java
public interface UsuarioRepositorio extends JpaRepository<Usuario, Long> {
    @EntityGraph(attributePaths = "persona")
    Optional<Usuario> findByIdAndActivoTrue(Long id);
}
```

El `id` se obtiene con el `CurrentUserService` ya implementado; nunca se recibe en el cuerpo o la URL
de perfil.

### 2. DTO de lectura y modificación

```java
public record PerfilRespuesta(
        String nombres,
        String apellidoPaterno,
        String apellidoMaterno,
        String correo,
        String telefono,
        String documentoIdentidad,
        String fotoUrl,
        boolean accesoGoogle,
        boolean puedeCrearContrasena
) {}

public record ActualizarPerfilPeticion(
        @NotBlank @Size(max = 120) String nombres,
        @NotBlank @Size(max = 80) String apellidoPaterno,
        @Size(max = 80) String apellidoMaterno,
        @Size(max = 30) String telefono,
        @Size(max = 30) String documentoIdentidad
) {}
```

No se agregan correo, rol, activo o `googleSubject` al DTO de actualización.

### 3. Servicio con lista blanca

```java
@Transactional(readOnly = true)
public PerfilRespuesta obtener() {
    Long usuarioId = currentUserService.get().userId();
    Usuario u = usuarioRepositorio.findByIdAndActivoTrue(usuarioId)
            .orElseThrow(UnauthorizedException::new);
    Persona p = u.getPersona();
    return mapear(u, p);
}

@Transactional
public PerfilRespuesta actualizar(ActualizarPerfilPeticion entrada) {
    Long usuarioId = currentUserService.get().userId();
    Usuario u = usuarioRepositorio.findByIdAndActivoTrue(usuarioId)
            .orElseThrow(UnauthorizedException::new);
    Persona p = u.getPersona();
    p.setNombres(entrada.nombres().strip());
    p.setApellidoPaterno(entrada.apellidoPaterno().strip());
    p.setApellidoMaterno(textNormalizer.trimToNull(entrada.apellidoMaterno()));
    p.setTelefono(textNormalizer.trimToNull(entrada.telefono()));
    p.setDocumentoIdentidad(textNormalizer.trimToNull(entrada.documentoIdentidad()));
    p.setModificadoEn(clock.instant());
    return mapear(u, p);
}
```

Si el documento cambia, se comprueba duplicidad excluyendo a la persona actual. PostgreSQL vuelve a
proteger con `uq_persona_documento_identidad`.

### 4. Crear contraseña en cuenta Google

```java
@Transactional
public void crearContrasena(NuevaContrasenaPeticion p) {
    Long usuarioId = currentUserService.get().userId();
    Usuario usuario = usuarioRepositorio.findByIdAndActivoTrue(usuarioId)
            .orElseThrow(UnauthorizedException::new);
    if (usuario.getGoogleSubject() == null || usuario.getContrasenaHash() != null)
        throw new OperationNotAllowedException(
                "La cuenta no puede crear una contraseña por este medio");
    if (!p.contrasena().equals(p.confirmacion()))
        throw new BusinessValidationException("Las contraseñas no coinciden");
    passwordPolicyService.validate(p.contrasena());
    usuario.setContrasenaHash(passwordEncoder.encode(p.contrasena()));
}
```

El método conserva `googleSubject`; la cuenta termina con dos medios de acceso, no con dos usuarios.

### 5. Controlador protegido

```java
@GetMapping
public PerfilRespuesta obtener() {
    return servicio.obtener();
}

@PutMapping
public PerfilRespuesta actualizar(@Valid @RequestBody ActualizarPerfilPeticion peticion) {
    return servicio.actualizar(peticion);
}
```

Las rutas son `GET /api/perfil`, `PUT /api/perfil` y `PUT /api/perfil/contrasena`. Spring Security
rechaza las tres sin cookie válida.

### 6. Angular

1. Agregar `sessionGuard` al nodo `/app` en `app.routes.ts`, no solo a sus hijos.
2. Crear `perfil-api.service.ts` con los tres endpoints.
3. Importar `ReactiveFormsModule` en `mi-perfil.ts` y cargar primero el DTO.
4. Mostrar correo como texto o control deshabilitado y excluirlo del objeto enviado.
5. Convertir opcionales vacíos a `null`.
6. Presentar el formulario de contraseña solo si `puedeCrearContrasena` es verdadero.
7. Después de guardar, usar la respuesta del backend para actualizar formulario y encabezado.

Se prueban carga, 401, guardado, documento duplicado, borrado de opcionales y conservación del
vínculo Google.
