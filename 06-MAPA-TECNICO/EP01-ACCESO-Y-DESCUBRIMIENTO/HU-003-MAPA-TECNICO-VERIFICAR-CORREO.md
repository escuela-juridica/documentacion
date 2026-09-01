# HU-003 — Mapa técnico de verificación de correo

## Resultado que debe entregar

Una cuenta pendiente confirma su correo con el código más reciente. El código se usa una sola vez;
un reenvío invalida inmediatamente los anteriores. La operación no crea otra cuenta.

## Punto de partida, tablas y dependencia

- Frontend: `features/auth/verificar-correo` es una pantalla pendiente.
- Tablas: `usuario` y `codigo_verificacion_correo`.
- Depende de una cuenta pendiente creada por HU-002 o, posteriormente, HU-008.
- Entrega una cuenta con correo verificado a HU-001.

## Contratos que deben acordarse

| Operación | Método y ruta | Resultado conceptual |
|---|---|---|
| Confirmar código | `POST /api/auth/verificacion` | Correo verificado o motivo seguro de rechazo |
| Solicitar otro código | `POST /api/auth/verificacion/reenvio` | Nuevo intento registrado sin revelar el código |

Confirmación y reenvío reciben el correo en el cuerpo, nunca en la URL. Angular conserva el correo
escrito durante registro o acceso solo en memoria de navegación y lo muestra parcialmente oculto;
si la página se recarga, solicita escribirlo otra vez. Conocer el correo no verifica la cuenta y la
API nunca revela si otro correo existe.

## Trabajo del backend

### Componentes

- repositorio de códigos con consulta del más reciente por usuario;
- operación de bloqueo o control transaccional para evitar dos consumos simultáneos;
- `VerificacionCorreoServicio` para confirmar y reenviar;
- DTO de código de seis posiciones y DTO de contexto;
- controlador público sin exposición de hashes;
- `MailService` compartido y plantilla `mail/verification-code.html` para la emisión y el reenvío.

### Confirmación paso a paso

1. Normalizar el correo recibido y resolver internamente una cuenta pendiente.
2. Si el correo ya está verificado, responder de forma idempotente sin volver a modificar fechas.
3. Obtener el código más reciente dentro de una transacción.
4. Comprobar que no tenga `utilizado_en` ni `invalidado_en`.
5. Comparar el valor recibido con `codigo_hash`; nunca buscar por el valor sin protección.
6. Marcar `utilizado_en`.
7. Establecer `usuario.correo_verificado_en`.
8. Determinar si existe cambio de contraseña pendiente y comunicar el siguiente paso.
9. Confirmar ambos cambios juntos.

### Reenvío paso a paso

1. Comprobar que la cuenta exista y continúe pendiente.
2. Invalidar todos los códigos anteriores no utilizados.
3. Generar un nuevo código y almacenar su hash.
4. Enviar el nuevo código al único correo de la cuenta mediante `MailService`.
5. Marcar el registro como `ENVIADO` cuando el servidor SMTP acepte el mensaje.
6. Si falla la entrega, marcar la nueva emisión como `ERROR` e invalidarla. Los códigos anteriores
   permanecen invalidados; la cuenta continúa pendiente y permite solicitar otro reenvío.
7. Responder sin revelar el código y comunicar si el envío fue aceptado o debe reintentarse.

## Trabajo del frontend

- Convertir la pantalla en formulario reactivo de seis dígitos.
- Aceptar solo caracteres numéricos y facilitar pegar el código completo.
- Mostrar el correo parcialmente oculto obtenido desde backend.
- Mantener estados: listo, verificando, incorrecto, reemplazado, utilizado, verificado y fallo.
- Deshabilitar confirmación si faltan dígitos.
- Implementar reenvío sin perder el contexto.
- Tras éxito normal, ofrecer ingreso; si existe cambio de contraseña pendiente, mostrar ese paso.
- No afirmar que el envío llegó, únicamente que la solicitud fue procesada según el resultado
  disponible.

## Consultas y concurrencia

El repositorio debe recuperar el código más reciente ordenando por solicitud descendente. La
confirmación debe impedir que dos peticiones simultáneas consuman el mismo código. El reenvío y la
inserción nueva forman una sola transacción para que nunca queden dos códigos vigentes por un fallo
intermedio.

## Pruebas mínimas

- código reciente correcto;
- código incorrecto, vacío o incompleto;
- código utilizado e invalidado;
- reenvío que invalida el anterior;
- segundo uso después de una confirmación;
- dos confirmaciones simultáneas;
- cuenta ya verificada;
- cuenta administrativa con cambio pendiente;
- fallo de entrega sin marcar el correo como verificado;
- fallo de reenvío que deja la cuenta pendiente y permite solicitar otro código;
- correo dirigido únicamente al propietario de la cuenta;
- navegación final hacia acceso.

## Integración de correo definida

El usuario recibe el código por correo mediante el `MailService` ya implementado y la plantilla
`mail/verification-code.html`. Esta historia no configura SMTP ni crea otra implementación. El
código visible no se muestra en la respuesta pública, no se escribe en logs y no se guarda sin hash.
La guía común se encuentra en `01-SERVICIO-COMPARTIDO-CORREO.md`.

## Terminado cuando

La verificación es atómica, idempotente y segura; el reenvío deja un solo código vigente y la
pantalla representa correctamente cada resultado sin crear identidades adicionales.

## Implementación guiada para copiar y adaptar

### 1. Consultas JPA

```java
public interface CodigoVerificacionCorreoRepositorio
        extends JpaRepository<CodigoVerificacionCorreo, Long> {
    List<CodigoVerificacionCorreo>
        findByUsuario_IdAndUtilizadoEnIsNullAndInvalidadoEnIsNull(Long usuarioId);

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("select c from CodigoVerificacionCorreo c join fetch c.usuario where c.id = :id")
    Optional<CodigoVerificacionCorreo> findByIdParaActualizar(@Param("id") Long id);

    @Modifying
    @Query("""
        update CodigoVerificacionCorreo c
           set c.invalidadoEn = :ahora, c.modificadoEn = :ahora
         where c.usuario.id = :usuarioId
           and c.utilizadoEn is null and c.invalidadoEn is null
        """)
    int invalidarPendientes(@Param("usuarioId") Long usuarioId,
                            @Param("ahora") Instant ahora);
}
```

### 2. Emitir y guardar

```java
@Transactional
public void emitirPara(Usuario usuario) {
    Instant ahora = clock.instant();
    repositorio.invalidarPendientes(usuario.getId(), ahora);
    String visible = String.format("%06d", secureRandom.nextInt(1_000_000));

    CodigoVerificacionCorreo registro = new CodigoVerificacionCorreo();
    registro.setUsuario(usuario);
    registro.setCodigoHash(passwordEncoder.encode(visible));
    registro.setEstadoEnvio("PENDIENTE");
    registro.setSolicitadoEn(ahora);
    repositorio.save(registro);

    try {
        mailService.sendHtml(HtmlMailMessage.to(
                usuario.getCorreo(),
                "Código de verificación ESEJUR",
                "mail/verification-code.html",
                Map.of(
                        "name", usuario.getPersona().nombreCompleto(),
                        "code", visible)));
        registro.setEstadoEnvio("ENVIADO");
    } catch (MailDeliveryException exception) {
        registro.setEstadoEnvio("ERROR");
        registro.setInvalidadoEn(ahora);
    }
}
```

BCrypt usa una sal distinta en cada hash. Por eso el servicio carga los pocos códigos pendientes del
usuario y compara con `passwordEncoder.matches`; no intenta buscar recalculando el hash.
`MailService`, `Clock`, `SecureRandom` y el repositorio se inyectan como dependencias. Si el correo
falla, la excepción se captura para conservar la cuenta pendiente y el historial del intento. La
operación devuelve al controlador si el envío fue aceptado, de modo que Angular ofrece otro intento.

### 3. Consumir de manera atómica

```java
@Transactional
public void verificar(String correoRecibido, String codigoVisible) {
    Usuario usuario = usuarioRepositorio.findByCorreoIgnoreCase(
            textNormalizer.normalizeEmail(correoRecibido))
            .orElseThrow(InvalidCodeException::new);
    CodigoVerificacionCorreo candidato = repositorio
            .findByUsuario_IdAndUtilizadoEnIsNullAndInvalidadoEnIsNull(usuario.getId()).stream()
            .filter(c -> passwordEncoder.matches(codigoVisible, c.getCodigoHash()))
            .findFirst().orElseThrow(InvalidCodeException::new);

    CodigoVerificacionCorreo codigo = repositorio.findByIdParaActualizar(candidato.getId())
            .orElseThrow(InvalidCodeException::new);
    if (codigo.getUtilizadoEn() != null || codigo.getInvalidadoEn() != null)
        throw new InvalidCodeException();

    Instant ahora = clock.instant();
    codigo.setUtilizadoEn(ahora);
    codigo.getUsuario().setCorreoVerificadoEn(ahora);
}
```

La duración del código no se inventa: si negocio aprueba una vigencia, se valida desde
`solicitado_en`; hasta entonces se controlan uso e invalidación.

### 4. Endpoints y pantalla

```java
public record VerificarCorreoPeticion(
        @NotBlank @Email @Size(max = 254) String correo,
        @NotBlank @Pattern(regexp = "\\d{6}") String codigo) {}
```

`POST /api/auth/verificacion` consume el código y devuelve 204;
`POST /api/auth/verificacion/reenvio` invalida los anteriores, emite uno nuevo y devuelve 202. En
Angular, la pantalla distribuye los seis dígitos, acepta pegado completo, impide doble envío y
navega a `/acceso` en éxito.

### 5. Entrega por correo

El servicio de verificación inyecta la interfaz común `MailService` y nunca `SmtpMailService`. Las
pruebas usan un mock para comprobar destinatario, asunto, plantilla y campos sin conectarse al
servidor SMTP. La API pública nunca devuelve el código.
