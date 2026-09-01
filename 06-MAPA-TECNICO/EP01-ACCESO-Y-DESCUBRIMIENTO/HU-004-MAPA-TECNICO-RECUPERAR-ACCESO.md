# HU-004 — Mapa técnico de recuperación de acceso

## Resultado que debe entregar

Una persona solicita recuperar su cuenta sin revelar públicamente si el correo existe. Un token
vigente permite definir una nueva contraseña; se consume una sola vez y toda solicitud nueva
invalida tokens anteriores.

## Punto de partida y tablas

- Frontend: `recuperar-password` y `nueva-password` existen como pantallas pendientes.
- Backend: no existe servicio de recuperación.
- Tablas: `usuario` y `token_recuperacion_acceso`.
- Puede desarrollarse con una cuenta controlada sin esperar HU-002.

## Contratos que deben acordarse

| Operación | Método y ruta | Resultado conceptual |
|---|---|---|
| Solicitar recuperación | `POST /api/auth/recuperacion` | Respuesta neutral para cualquier correo |
| Consultar enlace | `GET /api/auth/recuperacion/{token}` | Indica si permite mostrar el formulario |
| Definir contraseña | `POST /api/auth/recuperacion/{token}` | Credencial actualizada o token rechazado |

La respuesta de solicitud debe ser indistinguible para correo existente, inexistente, no
recuperable o con fallo de entrega. El token real solo aparece en el enlace enviado por correo; la
base conserva su hash.

## Trabajo del backend

### Componentes

- repositorio de usuario por correo normalizado;
- repositorio de recuperación por hash y usuario;
- generador criptográficamente seguro de token;
- servicio común de política y hash de contraseña;
- `RecuperacionAccesoServicio` con operaciones transaccionales;
- DTO de solicitud y nueva contraseña;
- controlador público;
- `MailService` compartido y plantilla `mail/password-recovery.html` para entregar el enlace.
- propiedad de URL base del frontend agregada a `application.yml` al implementar esta HU.

### Solicitud paso a paso

1. Validar formato del correo sin cambiar el mensaje público.
2. Buscar la cuenta internamente.
3. Si no existe, terminar con la misma respuesta neutral y sin insertar.
4. Si la cuenta solo admite Google según las reglas vigentes, conservar la neutralidad y aplicar el
   tratamiento que se acuerde para ese caso.
5. Invalidar tokens anteriores no usados.
6. Generar un token impredecible y guardar únicamente su hash.
7. Establecer vencimiento exactamente 60 minutos después de la solicitud.
8. Construir una URL hacia `/nueva-password?token=...` usando la URL base configurada del frontend.
9. Enviar el enlace al único correo de la cuenta mediante `MailService`.
10. Marcar `estado_envio` como `ENVIADO` si SMTP acepta el mensaje o como `ERROR` si falla.
11. Devolver siempre la respuesta neutral.

### Uso paso a paso

1. Transformar el token recibido en el mismo hash utilizado al guardarlo.
2. Consultar el registro y bloquearlo durante la operación.
3. Rechazar si no existe, fue utilizado, invalidado o venció.
4. Validar contraseña y confirmación.
5. Guardar el nuevo BCrypt en `usuario.contrasena_hash`.
6. Marcar el token como utilizado.
7. Invalidar cualquier otro token pendiente del mismo usuario.
8. Confirmar todos los cambios en una transacción.

## Trabajo del frontend

### Solicitud

- Implementar formulario reactivo de correo en `recuperar-password`.
- Mostrar siempre el mismo resultado después de una petición aceptada.
- No cambiar el mensaje según errores de existencia de cuenta.
- Evitar envíos repetidos mientras la petición está en curso.

### Nueva contraseña

- Leer el token de la ruta acordada sin guardarlo en almacenamiento del navegador.
- Consultar primero su validez para decidir entre formulario y estado inválido.
- Validar longitud, mayúscula, minúscula, número y confirmación.
- Representar token inválido, vencido, consumido, éxito y error inesperado.
- Tras éxito, limpiar el formulario y orientar a `/acceso`.

## Pruebas mínimas

- correo existente e inexistente con la misma respuesta;
- token creado con vencimiento de 60 minutos;
- nueva solicitud que invalida el anterior;
- token válido, vencido, usado, invalidado y aleatorio;
- política de contraseña;
- dos consumos simultáneos;
- actualización atómica de contraseña y token;
- acceso posterior con la nueva contraseña y rechazo de la anterior;
- comprobación de que el token no queda almacenado en Angular.
- correo dirigido únicamente al propietario de la cuenta;
- fallo SMTP almacenado como `ERROR` sin cambiar la respuesta neutral.

## Integración de correo definida

El enlace se entrega con el `MailService` ya implementado y la plantilla
`mail/password-recovery.html`. La historia no configura SMTP ni crea otro cliente. El token no se
devuelve en la respuesta neutral, no se escribe en logs y no se sustituye por otro canal. La guía
común se encuentra en `01-SERVICIO-COMPARTIDO-CORREO.md`.

## Terminado cuando

La respuesta no filtra existencia ni fallos de entrega, los tokens cumplen uso único y reemplazo, y
el recorrido completo desde el correo hasta el nuevo ingreso funciona.

## Implementación guiada para copiar y adaptar

### 1. Archivos en orden

1. `entity/TokenRecuperacionAcceso.java`.
2. `repository/TokenRecuperacionAccesoRepositorio.java`.
3. `dto/SolicitarRecuperacionPeticion.java` y `dto/NuevaContrasenaPeticion.java`.
4. `security/TokenAleatorioServicio.java` y `security/HashTokenServicio.java`.
5. `mail/password-recovery.html`, reutilizando el `MailService` común.
6. `service/RecuperacionAccesoServicio.java` y `controller/RecuperacionAccesoControlador.java`.
7. Los servicios y formularios Angular de `recuperar-password` y `nueva-password`.

### 2. Repositorio con bloqueo

```java
public interface TokenRecuperacionAccesoRepositorio
        extends JpaRepository<TokenRecuperacionAcceso, Long> {
    @Modifying
    @Query("""
        update TokenRecuperacionAcceso t
           set t.invalidadoEn = :ahora, t.modificadoEn = :ahora
         where t.usuario.id = :usuarioId
           and t.utilizadoEn is null and t.invalidadoEn is null
        """)
    int invalidarPendientes(@Param("usuarioId") Long usuarioId,
                            @Param("ahora") Instant ahora);

    @Modifying
    @Query("""
        update TokenRecuperacionAcceso t
           set t.invalidadoEn = :ahora, t.modificadoEn = :ahora
         where t.usuario.id = :usuarioId and t.id <> :tokenUsadoId
           and t.utilizadoEn is null and t.invalidadoEn is null
        """)
    int invalidarOtrosPendientes(@Param("usuarioId") Long usuarioId,
            @Param("tokenUsadoId") Long tokenUsadoId, @Param("ahora") Instant ahora);

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("""
        select t from TokenRecuperacionAcceso t
        join fetch t.usuario u
        where t.tokenHash = :hash
        """)
    Optional<TokenRecuperacionAcceso> bloquearPorHash(@Param("hash") String hash);
}
```

El token tiene suficiente entropía y su hash SHA-256 sirve para búsqueda exacta; no se usa BCrypt
aquí porque el token aleatorio no es una contraseña elegida por una persona.

```java
@Component
public class TokenAleatorioServicio {
    private final SecureRandom random = new SecureRandom();
    public String generar() {
        byte[] bytes = new byte[32];
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
}
```

`HashTokenServicio` calcula SHA-256 en UTF-8 y lo expresa en hexadecimal. Ese mismo método se usa al
guardar y al recibir el enlace.

### 3. Solicitar recuperación

```java
@Transactional
public void solicitar(String correoRecibido) {
    String correo = correoRecibido.strip().toLowerCase(Locale.ROOT);
    Optional<Usuario> encontrado = usuarioRepositorio.findByCorreoIgnoreCase(correo);
    if (encontrado.isEmpty()) return;

    Usuario usuario = encontrado.get();
    if (!usuario.isActivo() || usuario.getContrasenaHash() == null) return;

    Instant ahora = clock.instant();
    repositorio.invalidarPendientes(usuario.getId(), ahora);
    String visible = tokenAleatorioServicio.generar();

    TokenRecuperacionAcceso token = new TokenRecuperacionAcceso();
    token.setUsuario(usuario);
    token.setTokenHash(hashTokenServicio.sha256(visible));
    token.setEstadoEnvio("PENDIENTE");
    token.setSolicitadoEn(ahora);
    token.setExpiraEn(ahora.plus(60, ChronoUnit.MINUTES));
    repositorio.save(token);

    String recoveryUrl = UriComponentsBuilder.fromUriString(frontendBaseUrl)
            .path("/nueva-password")
            .queryParam("token", visible)
            .build().encode().toUriString();
    try {
        mailService.sendHtml(HtmlMailMessage.to(
                usuario.getCorreo(),
                "Recupera tu acceso a ESEJUR",
                "mail/password-recovery.html",
                Map.of(
                        "name", usuario.getPersona().nombreCompleto(),
                        "recoveryUrl", recoveryUrl)));
        token.setEstadoEnvio("ENVIADO");
    } catch (MailDeliveryException exception) {
        token.setEstadoEnvio("ERROR");
    }
}
```

El controlador siempre responde 202 con el mismo mensaje, tanto si encontró la cuenta como si no y
aunque SMTP falle. El servicio no registra el correo, el token ni la URL completa. Al implementar
esta HU se agrega la URL base a `application.yml`; no se duplica en archivos por perfil.

### 4. Definir la nueva contraseña

```java
@Transactional
public void cambiar(String tokenVisible, NuevaContrasenaPeticion p) {
    if (!p.contrasena().equals(p.confirmacion()))
        throw new BusinessValidationException("Las contraseñas no coinciden");
    passwordPolicyService.validate(p.contrasena());

    TokenRecuperacionAcceso token = repositorio
            .bloquearPorHash(hashTokenServicio.sha256(tokenVisible))
            .orElseThrow(InvalidTokenException::new);
    Instant ahora = clock.instant();
    if (token.getUtilizadoEn() != null || token.getInvalidadoEn() != null
            || !token.getExpiraEn().isAfter(ahora)) {
        throw new InvalidTokenException();
    }

    token.getUsuario().setContrasenaHash(passwordEncoder.encode(p.contrasena()));
    token.getUsuario().setRequiereCambioContrasena(false);
    token.setUtilizadoEn(ahora);
    repositorio.invalidarOtrosPendientes(
            token.getUsuario().getId(), token.getId(), ahora);
}
```

La consulta con bloqueo y la transacción impiden dos consumos simultáneos. La prueba debe confirmar
que el token actual queda usado y los demás, invalidados.

### 5. API y Angular

- `POST /api/auth/recuperacion` recibe un correo y siempre devuelve 202.
- `GET /api/auth/recuperacion/{token}` solo indica `valido: true/false`.
- `POST /api/auth/recuperacion/{token}` recibe contraseña y confirmación y devuelve 204.

`recuperar-password.ts` presenta el mismo resultado neutral. `nueva-password.ts` obtiene `token`
con `ActivatedRoute`, consulta vigencia y muestra formulario, estado inválido o éxito. El token no
se copia a `localStorage`, logs ni mensajes.

### 6. Entrega por correo

`RecuperacionAccesoServicio` inyecta la interfaz común `MailService`, no `SmtpMailService`. Las
pruebas usan un mock para verificar destinatario, plantilla, enlace y comportamiento ante fallo sin
conectarse al servidor SMTP. Nunca se responde el token.
