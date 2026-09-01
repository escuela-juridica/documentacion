# HU-002 — Mapa técnico de creación de cuenta

## Resultado que debe entregar

Un visitante crea una única cuenta de alumno mediante formulario o completa una identidad Google
nueva. Los datos opcionales no bloquean. El formulario deja el correo pendiente; Google lo deja
verificado. La aceptación legal se exige, pero no se persiste por separado.

## Punto de partida y tablas

- Frontend: `features/auth/registro` es una pantalla sin formulario funcional.
- Backend: no existen entidades ni servicios de cuenta.
- Tablas principales: `persona`, `usuario`, `rol`, `usuario_rol` y, para formulario,
  `codigo_verificacion_correo`.

## Dependencias

- No depende de HU-001 para el formulario.
- Recibe de HU-001 una referencia temporal cuando Google detecta un correo nuevo.
- Entrega una cuenta pendiente a HU-003.

## Contratos que deben acordarse

| Operación | Método y ruta | Resultado conceptual |
|---|---|---|
| Registro por formulario | `POST /api/auth/registro` | Cuenta pendiente y destino de verificación |
| Preparar registro Google | `GET /api/auth/registro/google/{referencia}` | Datos autorizados y vigencia del contexto |
| Completar registro Google | `POST /api/auth/registro/google` | Cuenta verificada y sesión iniciada |

La petición de formulario incluye nombres, apellidos, correo, teléfono, documento, contraseña,
confirmación, aceptación legal y evidencia válida del control anti-robot. La confirmación y la
aceptación se validan, pero no se guardan. La respuesta nunca devuelve contraseña ni código.

## Trabajo del backend

### Componentes

- Entidades de persona, usuario, rol, asignación de rol y código.
- Repositorios con búsqueda de correo sin distinguir mayúsculas y búsqueda de `ROLE_ALUMNO` activo.
- DTO diferentes para formulario y Google; no reutilizar una entidad como petición.
- validador común de contraseña.
- `RegistroServicio` con transacción completa.
- servicio de generación y hash de códigos reutilizable por HU-003.
- `MailService` compartido para entregar el código con `mail/verification-code.html`.
- `RegistroControlador` y documentación Swagger.

### Operación por formulario

1. Validar campos obligatorios y opcionales.
2. Comprobar coincidencia y política de contraseña.
3. Comprobar aceptación legal y anti-robot antes de insertar.
4. Normalizar el correo y comprobar duplicidad.
5. Crear `persona` con valores opcionales nulos cuando estén vacíos.
6. Crear `usuario` de origen `FORMULARIO`, activo, con hash BCrypt y correo sin verificar.
7. Obtener el rol alumno y crear una asignación principal.
8. Generar un código numérico de seis dígitos y almacenar únicamente su hash.
9. Enviar el código visible al único correo registrado mediante `MailService` y cambiar
   `estado_envio` de `PENDIENTE` a `ENVIADO` cuando el servidor SMTP acepte el mensaje.
10. Si el envío falla, conservar la cuenta con correo pendiente, marcar la emisión como `ERROR`,
    invalidar el código no entregado y permitir que HU-003 solicite uno nuevo.
11. Confirmar la transacción y orientar a HU-003.

La restricción única de PostgreSQL sigue siendo la defensa final ante dos registros simultáneos. El
servicio debe transformar esa colisión en un conflicto comprensible, no en un error interno.

### Operación Google

1. Validar que la referencia temporal proviene de una identidad Google ya comprobada y no venció.
2. No aceptar correo o `googleSubject` sustituidos por el navegador.
3. Solicitar solo los datos obligatorios que Google no entregó y la aceptación legal.
4. Comprobar nuevamente que el correo no exista.
5. Crear persona y usuario con origen `GOOGLE`, vínculo Google y correo verificado.
6. Asignar rol alumno principal.
7. Iniciar sesión sin generar código adicional.

## Trabajo del frontend

- Implementar formulario reactivo en `features/auth/registro`.
- Separar visualmente campos obligatorios y opcionales.
- Mantener apellido materno, teléfono y documento como opcionales.
- Mostrar en tiempo real las condiciones de contraseña sin considerar eso validación suficiente del
  backend.
- Exigir confirmación coincidente, casilla legal y anti-robot.
- Abrir términos y privacidad sin perder el formulario.
- En contexto Google, precargar datos autorizados y bloquear el correo verificado para que no sea
  sustituido.
- Crear servicio Angular de registro separado del servicio de acceso.
- Evitar doble envío deshabilitando la acción durante la solicitud.
- Interpretar errores por campo, correo duplicado, Google vencido y fallo general.
- Tras formulario, navegar a verificación; tras Google, restaurar sesión y abrir el panel.

## Pruebas mínimas

- creación completa por formulario;
- tres campos opcionales vacíos;
- cada condición de contraseña incumplida;
- confirmación diferente;
- casilla legal o anti-robot ausente;
- correo repetido y dos solicitudes simultáneas;
- transacción revertida si falla rol o código;
- correo dirigido únicamente a la cuenta creada y con la plantilla esperada;
- fallo SMTP que conserva una sola cuenta pendiente y permite reenviar desde HU-003;
- Google nuevo completo, cancelado, alterado o vencido;
- Google con correo ya existente sin duplicación;
- comprobación de que no existe tabla ni registro de consentimiento adicional.

## Integración de correo definida

La historia reutiliza `MailService`; no configura SMTP ni instancia `JavaMailSender`. El código
visible se entrega mediante `mail/verification-code.html` y nunca aparece en la respuesta pública,
los logs o la base de datos sin hash. La implementación común y sus pruebas se describen en
`01-SERVICIO-COMPARTIDO-CORREO.md`.

## Terminado cuando

Los registros por formulario y Google respetan una sola identidad, las operaciones relacionadas son
atómicas, el formulario intenta entregar su código por correo y Angular conduce al siguiente
recorrido correcto incluso cuando debe solicitarse un reenvío.

## Implementación guiada para copiar y adaptar

### 1. Orden de archivos

1. Reutilizar `Persona`, `Usuario`, `Rol` y `UsuarioRol`; no duplicarlos.
2. Crear `CodigoVerificacionCorreo`, sus repositorios y los DTO de registro.
3. Crear `mail/verification-code.html` y reutilizar `MailService`.
4. Crear `RegistroServicio` y `RegistroControlador`.
5. Crear `registro-api.service.ts` y convertir `registro.ts` en formulario reactivo.

### 2. Petición exacta

```java
public record RegistroPeticion(
        @NotBlank @Size(max = 120) String nombres,
        @NotBlank @Size(max = 80) String apellidoPaterno,
        @Size(max = 80) String apellidoMaterno,
        @NotBlank @Email @Size(max = 254) String correo,
        @Size(max = 30) String telefono,
        @Size(max = 30) String documentoIdentidad,
        @NotBlank String contrasena,
        @NotBlank String confirmarContrasena
) {}
```

Los opcionales vacíos se convierten a `null`. El documento sigue siendo opcional y no tiene
ninguna regla relacionada con certificados.

### 3. Repositorios

```java
public interface PersonaRepositorio extends JpaRepository<Persona, Long> {
    boolean existsByDocumentoIdentidad(String documentoIdentidad);
}
public interface UsuarioRepositorio extends JpaRepository<Usuario, Long> {
    boolean existsByCorreoIgnoreCase(String correo);
}
public interface RolRepositorio extends JpaRepository<Rol, Long> {
    Optional<Rol> findByCodigoAndActivoTrue(String codigo);
}
```

`existsByCorreoIgnoreCase` equivale conceptualmente a buscar una fila donde
`LOWER(correo)=LOWER(:correo)`. La restricción única de PostgreSQL resuelve la carrera entre dos
peticiones simultáneas.

### 4. Transacción completa

```java
@Transactional
public RegistroRespuesta registrar(RegistroPeticion p) {
    String correo = textNormalizer.normalizeEmail(p.correo());
    String documento = textNormalizer.trimToNull(p.documentoIdentidad());
    if (!p.contrasena().equals(p.confirmarContrasena()))
        throw new BusinessValidationException("Las contraseñas no coinciden");
    passwordPolicyService.validate(p.contrasena());
    if (usuarioRepositorio.existsByCorreoIgnoreCase(correo))
        throw new DuplicateResourceException("El correo ya se encuentra registrado");
    if (documento != null && personaRepositorio.existsByDocumentoIdentidad(documento))
        throw new DuplicateResourceException("El documento ya se encuentra registrado");

    Persona persona = new Persona();
    persona.setNombres(p.nombres().strip());
    persona.setApellidoPaterno(p.apellidoPaterno().strip());
    persona.setApellidoMaterno(textNormalizer.trimToNull(p.apellidoMaterno()));
    persona.setTelefono(textNormalizer.trimToNull(p.telefono()));
    persona.setDocumentoIdentidad(documento);
    persona.setActivo(true);
    persona = personaRepositorio.save(persona);

    Usuario usuario = new Usuario();
    usuario.setPersona(persona);
    usuario.setCorreo(correo);
    usuario.setOrigenRegistro("FORMULARIO");
    usuario.setActivo(true);
    usuario.setContrasenaHash(passwordEncoder.encode(p.contrasena()));
    usuario = usuarioRepositorio.save(usuario);

    Rol alumno = rolRepositorio.findByCodigoAndActivoTrue("ROLE_ALUMNO")
            .orElseThrow(() -> new IllegalStateException("Falta el rol ROLE_ALUMNO"));
    usuarioRolRepositorio.save(UsuarioRol.principal(usuario, alumno));
    boolean envioAceptado = codigoVerificacionServicio.emitirPara(usuario);
    return new RegistroRespuesta(usuario.getId(), correo, envioAceptado);
}
```

`RegistroServicio` lleva `@Service` y `@RequiredArgsConstructor`; sus dependencias son `final`. El
servicio de emisión utilizado en la última línea guarda el hash, llama a `MailService` y marca el
envío como `ENVIADO`. Si falla SMTP, captura `MailDeliveryException`, marca la emisión como `ERROR`,
la invalida y devuelve `false` sin deshacer la cuenta pendiente. Los fallos de persistencia sí
revierten persona, usuario, rol y código.

### 5. Endpoint y Angular

```java
@PostMapping
public ResponseEntity<RegistroRespuesta> registrar(
        @Valid @RequestBody RegistroPeticion peticion) {
    return ResponseEntity.status(HttpStatus.CREATED)
            .body(registroServicio.registrar(peticion));
}
```

El controlador usa `/api/auth/registro`. En Angular se crea un servicio con
`POST ${API_URL}/auth/registro`. `registro.ts` importa `ReactiveFormsModule`, replica todos los
campos del prototipo, marca los tres opcionales y conserva lo escrito ante un conflicto. En 201
navega a `/verificar-correo` con una referencia de cuenta, nunca con el código.

El ingreso Google nuevo reutiliza esta pantalla con un comprobante temporal validable por backend;
Angular no puede afirmar por sí solo que Google verificó una identidad.

### 6. Pruebas

Se prueban normalización, política, confirmación, duplicidad, opcionales nulos, destinatario,
plantilla y transacción. Un fallo al asignar el rol no debe dejar una `persona` o un `usuario`
parcial. Un fallo SMTP sí conserva la cuenta pendiente, deja la emisión en `ERROR` e invalidada y
permite continuar a HU-003. `MailService` se reemplaza por un mock; esta prueba no envía un correo
real.
