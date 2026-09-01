# HU-001 — Mapa técnico de acceso con correo o Google

## Resultado que debe entregar

Una cuenta existente puede ingresar con correo y contraseña o con una identidad Google válida. El
backend determina el rol principal y el estado de habilitación. Angular conduce al panel, a la
verificación pendiente o al registro complementario sin crear cuentas duplicadas.

## Punto de partida

- Frontend: `features/auth/acceso` contiene la pantalla, pero no tiene formulario ni llamadas.
- Sesión: `core/session/session.ts` conserva datos solo en memoria.
- Backend: ya existen JWT, cookie, CORS y configuración común de permisos; todavía no existen las
  entidades, repositorios ni endpoints de acceso de esta historia.
- Tablas: `usuario`, `persona`, `usuario_rol` y `rol`.

## Dependencias

- Puede comenzar sin otra HU usando las cuentas del SQL de prueba.
- Se integra con HU-002 cuando Google entrega un correo nuevo.
- Se integra con HU-003 cuando el correo de una cuenta por formulario está pendiente.
- Entrega la sesión requerida por HU-005.

## Contratos que deben acordarse

| Operación | Método y ruta | Resultado conceptual |
|---|---|---|
| Acceso con contraseña | `POST /api/auth/acceso` | Sesión iniciada o condición que impide ingresar |
| Acceso con Google | `POST /api/auth/acceso/google` | Sesión existente o derivación segura al registro |
| Consultar sesión | `GET /api/auth/sesion` | Usuario actual, nombre y rol principal |
| Cerrar sesión | `POST /api/auth/cierre` | Cookie invalidada y sesión Angular limpia |

La petición normal contiene correo y contraseña. La respuesta exitosa no devuelve hash ni JWT en
el cuerpo: el backend establece la cookie. La respuesta de Google nuevo entrega solo una referencia
temporal verificable y los datos autorizados necesarios para HU-002; no crea `persona` ni `usuario`.

## Trabajo del backend

### Archivos y responsabilidades

- Entidades `Usuario`, `Persona`, `UsuarioRol` y `Rol` con sus relaciones mínimas.
- `UsuarioRepositorio` con búsqueda normalizada por correo y carga del rol principal.
- DTO de petición para acceso normal y Google.
- DTO de sesión sin campos internos.
- `AccesoServicio` para validar estados, contraseña e identidad Google.
- `JwtService` para emitir y validar la sesión.
- componente de cookie para crearla y eliminarla siempre con los mismos atributos.
- `AccesoControlador` limitado a recibir, delegar y responder.
- configuración de seguridad que permita endpoints públicos y proteja `/api/perfil`.

### Consulta que debe resolver

Por correo normalizado debe obtener en una sola operación: cuenta, hash, vínculo Google, indicador
activo, fecha de verificación, cambio de contraseña pendiente, persona y rol marcado como principal.
Si aparecen cero cuentas, se responde como credenciales inválidas. Si aparecieran varios roles
principales por datos incorrectos, no se elige uno arbitrariamente: se registra el problema y se
rechaza el ingreso.

### Reglas en orden

1. Normalizar el correo sin modificar la contraseña.
2. Buscar la cuenta sin revelar si existe.
3. Comprobar `activo`.
4. Para contraseña, comprobar que existe hash y compararlo con BCrypt.
5. Comprobar `correo_verificado_en` cuando el medio es contraseña.
6. Comprobar `requiere_cambio_contrasena` y devolver la condición correspondiente.
7. Obtener exactamente un rol principal.
8. Emitir una sesión con identificador de usuario, correo y autoridad; no incluir datos sensibles.
9. Crear la cookie y devolver el perfil mínimo.

Google debe validarse en el backend: emisor, firma, audiencia configurada, vigencia y correo
verificado. Después busca primero el vínculo estable de Google y luego el correo normalizado. Si la
cuenta por correo existe y aún no tiene vínculo, se vincula sin reemplazar persona, rol o historial.

## Trabajo del frontend

### Pantalla de acceso

- Convertir la maqueta en formulario reactivo.
- Añadir controles de correo y contraseña con mensajes junto al campo.
- Deshabilitar el envío mientras sea inválido o exista una solicitud en curso.
- Mantener botón Google independiente del formulario normal.
- Conservar enlaces hacia registro y recuperación.
- No informar si un correo específico existe.

### Servicios y sesión

- Crear un servicio Angular exclusivo para acceso y cierre.
- Hacer que las solicitudes de sesión incluyan credenciales de cookie.
- Ampliar `Session` para representar carga inicial, sesión válida y visitante.
- Al iniciar la aplicación, consultar `/api/auth/sesion` antes de decidir rutas protegidas.
- Aplicar `sessionGuard` al grupo `/app`.
- Cerrar sesión en backend antes de limpiar el estado local.

### Destinos

- Alumno autenticado: `/app/panel`.
- Administrador: destino administrativo acordado; mientras no exista, no enviarlo al panel de
  alumno como si tuviera el mismo rol.
- Correo pendiente: `/verificar-correo`; Angular conserva el correo ya escrito solo en el estado de
  navegación y nunca lo coloca en la URL. Si la página se recarga, solicita escribirlo nuevamente.
- Google nuevo: `/registro` con el contexto temporal de Google.
- Credenciales inválidas: permanecer en acceso y mostrar mensaje neutral.

## Pruebas mínimas

- contraseña correcta e incorrecta;
- correo inexistente con el mismo mensaje público;
- cuenta inactiva;
- correo pendiente;
- alumno y administrador con destino diferente;
- Google existente por vínculo y por correo coincidente;
- Google nuevo sin creación parcial;
- autorización Google inválida;
- cookie creada, restaurada y eliminada;
- ruta `/app` rechazada sin sesión y admitida con sesión.

## Terminado cuando

Los cinco recorridos de demostración funcionan de extremo a extremo, el JWT no está disponible para
JavaScript, no se duplica ninguna cuenta y actualizar el navegador conserva o rechaza correctamente
la sesión según la cookie.

## Implementación guiada para copiar y adaptar

### 1. Archivos que se crean en orden

1. `dto/AccesoPeticion.java`, `dto/SesionRespuesta.java` y `dto/ResultadoAcceso.java`.
2. `repository/UsuarioRepositorio.java` y `repository/UsuarioRolRepositorio.java`.
3. `security/JwtService.java`, `security/SessionCookieService.java` y
   `config/SecurityConfig.java`.
4. `service/AccesoServicio.java` y `controller/AccesoControlador.java`.
5. En Angular: `core/session/acceso-api.service.ts`, la ampliación de `session.ts` y el formulario
   `features/auth/acceso`.

Las cuatro entidades son compartidas con HU-002. El primer equipo las entrega y el otro las
reutiliza; no se crean versiones distintas.

### 2. DTO que entra y DTO que sale

```java
public record AccesoPeticion(
        @NotBlank @Email String correo,
        @NotBlank String contrasena
) {}

public record SesionRespuesta(
        Long usuarioId,
        String nombreCompleto,
        String correo,
        String rolPrincipal,
        boolean requiereCambioContrasena
) {}

public record ResultadoAcceso(String jwt, SesionRespuesta sesion) {}
```

Los tres pertenecen al paquete `pe.edu.utp.escuela.app.dto`. Se agregan los imports de
`jakarta.validation.constraints`. Nunca se incluyen hash, `googleSubject` o JWT en
`SesionRespuesta`; `ResultadoAcceso` solo circula dentro del backend.

### 3. Consultas JPA

```java
public interface UsuarioRepositorio extends JpaRepository<Usuario, Long> {
    @EntityGraph(attributePaths = "persona")
    Optional<Usuario> findByCorreoIgnoreCase(String correo);

    @EntityGraph(attributePaths = "persona")
    Optional<Usuario> findByGoogleSubject(String googleSubject);
}
```

```java
public interface UsuarioRolRepositorio extends JpaRepository<UsuarioRol, UsuarioRolId> {
    @Query("""
        select ur from UsuarioRol ur
        join fetch ur.rol r
        where ur.usuario.id = :usuarioId
          and ur.esPrincipal = true
          and r.activo = true
        """)
    List<UsuarioRol> buscarRolesPrincipales(@Param("usuarioId") Long usuarioId);
}
```

Se devuelve una lista deliberadamente: cero o más de un rol principal representa datos
inconsistentes. `findFirst` ocultaría ese error.

### 4. Servicio de acceso con Lombok

```java
@Service
@RequiredArgsConstructor
public class AccesoServicio {
    private final UsuarioRepositorio usuarioRepositorio;
    private final UsuarioRolRepositorio usuarioRolRepositorio;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    @Transactional(readOnly = true)
    public ResultadoAcceso acceder(AccesoPeticion peticion) {
        String correo = peticion.correo().strip().toLowerCase(Locale.ROOT);
        Usuario usuario = usuarioRepositorio.findByCorreoIgnoreCase(correo)
                .orElseThrow(InvalidCredentialsException::new);

        if (!usuario.isActivo()) throw new InactiveAccountException();
        if (usuario.getContrasenaHash() == null
                || !passwordEncoder.matches(peticion.contrasena(), usuario.getContrasenaHash())) {
            throw new InvalidCredentialsException();
        }
        if (usuario.getCorreoVerificadoEn() == null) {
            throw new PendingEmailVerificationException();
        }

        List<UsuarioRol> principales =
                usuarioRolRepositorio.buscarRolesPrincipales(usuario.getId());
        if (principales.size() != 1) {
            throw new IllegalStateException("La cuenta no tiene un rol principal válido");
        }

        String autoridad = principales.getFirst().getRol().getCodigo();
        String rol = autoridad.replaceFirst("^ROLE_", "");
        String jwt = jwtService.issue(usuario.getId(), usuario.getCorreo(), List.of(rol));
        SesionRespuesta sesion = new SesionRespuesta(
                usuario.getId(), usuario.getPersona().nombreCompleto(), usuario.getCorreo(), rol,
                usuario.isRequiereCambioContrasena());
        return new ResultadoAcceso(jwt, sesion);
    }
}
```

La tabla conserva códigos como `ROLE_ALUMNO` y `ROLE_ADMINISTRADOR`. Antes de emitir el JWT y
responder a Angular se elimina un único prefijo `ROLE_`; `SecurityConfig` vuelve a agregarlo al
convertir el claim en autoridades de Spring Security. Así se evita producir
`ROLE_ROLE_ALUMNO` y Angular recibe solamente `ALUMNO` o `ADMINISTRADOR`.

Los imports principales son `java.util.Locale`, `java.util.List`, Lombok
`RequiredArgsConstructor`, Spring `Service`, `Transactional` y `PasswordEncoder`.

### 5. Controlador y cookie

```java
@PostMapping("/acceso")
public ResponseEntity<SesionRespuesta> acceder(@Valid @RequestBody AccesoPeticion peticion) {
    ResultadoAcceso resultado = accesoServicio.acceder(peticion);
    return ResponseEntity.ok()
            .header(HttpHeaders.SET_COOKIE,
                    sessionCookieService.create(resultado.jwt()).toString())
            .body(resultado.sesion());
}

@GetMapping("/sesion")
public SesionRespuesta sesionActual(Authentication autenticacion) {
    return accesoServicio.obtenerSesion(Long.valueOf(autenticacion.getName()));
}

@PostMapping("/cierre")
public ResponseEntity<Void> cerrar() {
    return ResponseEntity.noContent()
            .header(HttpHeaders.SET_COOKIE, sessionCookieService.delete().toString())
            .build();
}
```

La cookie se crea con nombre `ESEJUR_SESION`, `HttpOnly`, ruta `/`, `SameSite=Lax` y duración igual
al JWT. Al eliminarla se repiten nombre, ruta y `SameSite`, con edad cero. JWT y CORS ya están
configurados en `application.yml`; la propiedad de Google se agrega allí cuando exista su clase
consumidora. Ninguno de esos valores se duplica en los perfiles de base de datos.

### 6. Servicio Angular

```ts
export interface SesionRespuesta {
  usuarioId: number;
  nombreCompleto: string;
  correo: string;
  rolPrincipal: 'ALUMNO' | 'ADMINISTRADOR';
  requiereCambioContrasena: boolean;
}

@Injectable({ providedIn: 'root' })
export class AccesoApiService {
  private readonly http = inject(HttpClient);

  acceder(correo: string, contrasena: string) {
    return this.http.post<SesionRespuesta>(`${API_URL}/auth/acceso`, { correo, contrasena });
  }
  sesion() { return this.http.get<SesionRespuesta>(`${API_URL}/auth/sesion`); }
  cerrar() { return this.http.post<void>(`${API_URL}/auth/cierre`, {}); }
}
```

En `acceso.ts` se importa `ReactiveFormsModule`, se crean correo y contraseña, se bloquea el botón
durante la solicitud y se navega según `rolPrincipal`. `PENDING_EMAIL_VERIFICATION` conduce a
verificación pasando el correo mediante el estado de navegación, no mediante la URL. Un 401 muestra
el mismo mensaje para correo inexistente o contraseña incorrecta. Angular no guarda el token: el
navegador administra la cookie HttpOnly.

### 7. Comprobación incremental

1. Probar repositorios contra PostgreSQL.
2. Probar el servicio con BCrypt real.
3. Probar que el controlador devuelve `Set-Cookie`.
4. Probar en Swagger acceso, sesión y cierre.
5. Conectar Angular y comprobar que recargar `/app/panel` restaura la sesión.
