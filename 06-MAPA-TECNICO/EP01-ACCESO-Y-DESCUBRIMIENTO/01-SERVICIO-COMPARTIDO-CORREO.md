# Servicio compartido de correo HTML

## Propósito

Este documento explica cómo reutilizar el correo ya implementado en el backend. Aplica a HU-002
para el primer código de verificación, HU-003 para el reenvío del código y HU-004 para el enlace de
recuperación. Ningún equipo debe crear otra configuración SMTP ni otro servicio de correo.

## Componentes disponibles

| Componente | Responsabilidad |
|---|---|
| `MailService` | Contrato que utilizan los servicios del negocio |
| `SmtpMailService` | Construye y envía el mensaje HTML mediante el servidor SMTP configurado |
| `HtmlMailMessage` | Transporta destinatarios, asunto, ruta de plantilla y campos variables |
| `MailTemplateRenderer` | Lee la plantilla, valida su ruta y reemplaza campos de forma segura |
| `MailDeliveryException` | Representa un fallo del servidor de correo sin revelar información interna |

Las clases están en `pe.edu.utp.escuela.app.mail`; la excepción se encuentra en
`pe.edu.utp.escuela.app.exception`. La dependencia Spring Mail y la configuración SMTP compartida
ya existen. Los archivos por perfil no deben duplicar esa configuración.

## Regla sobre destinatarios

El contrato interno puede contener una lista de destinatarios. Sin embargo, los flujos de EP01 son
personales y deben enviar el mensaje solo al correo de la cuenta correspondiente. Se utiliza
`HtmlMailMessage.to(...)`, que recibe un destinatario. No se agrupan alumnos en el campo `Para`, no
se usan copias y no se muestran direcciones de terceros.

El endpoint de prueba también recibe exactamente un campo `recipient`. Esta decisión no limita el
servicio compartido para una necesidad futura, pero evita exponer correos durante EP01.

## Cómo crear una plantilla

1. Crear un archivo HTML debajo de `src/main/resources/mail`.
2. Usar un nombre descriptivo en inglés y terminado en `.html`.
3. Escribir los valores variables con la forma `{{fieldName}}`.
4. Usar estilos compatibles con clientes de correo, preferentemente estilos en línea y estructura
   simple mediante tablas.
5. No cargar JavaScript, formularios, contraseñas, tokens de seguimiento ni recursos privados.
6. No insertar HTML recibido del usuario: el renderizador escapa todos los valores variables.

Plantillas requeridas por las historias:

| Flujo | Ruta | Campos mínimos |
|---|---|---|
| Verificación y reenvío | `mail/verification-code.html` | `name`, `code` |
| Recuperación | `mail/password-recovery.html` | `name`, `recoveryUrl` |

Si la plantilla contiene un campo que no se entrega en el mapa, el renderizador rechaza el envío.
La ruta también se rechaza si intenta salir de la carpeta `mail`.

## Cómo usarlo desde una historia

El servicio del negocio inyecta la interfaz `MailService`, no la clase `SmtpMailService`:

```java
private final MailService mailService;

mailService.sendHtml(HtmlMailMessage.to(
        user.getEmail(),
        "Asunto visible para el usuario",
        "mail/verification-code.html",
        Map.of("name", fullName, "code", visibleCode)));
```

El código anterior ilustra el contrato común. Los nombres definitivos de entidades y accesores se
adaptan al modelo implementado. El código o token visible solo vive el tiempo necesario para formar
el correo; la base de datos conserva su hash.

## Reglas por historia

### HU-002 — Crear cuenta

- Después de guardar la cuenta, el rol y el hash del código, enviar el código al correo registrado.
- Empezar el registro de emisión con `estado_envio = 'PENDIENTE'` y cambiarlo a `ENVIADO` cuando el
  servidor acepte el mensaje.
- Si el envío lanza `MailDeliveryException`, conservar la cuenta con correo pendiente, marcar la
  emisión como `ERROR` e invalidar el código que no fue entregado. La respuesta orienta a HU-003,
  donde la persona puede solicitar otro envío.
- La respuesta de registro nunca incluye el código.

### HU-003 — Verificar y reenviar

- La confirmación de un código no envía correo.
- El reenvío invalida los códigos anteriores, genera uno nuevo y lo envía con
  `mail/verification-code.html`.
- Solicitar el reenvío invalida los códigos anteriores. Si falla el nuevo envío, marcar la nueva
  emisión como `ERROR` e invalidarla también; la cuenta continúa pendiente y permite otro reenvío.
- La API devuelve aceptación o error, pero nunca devuelve el código visible.

### HU-004 — Recuperar acceso

- Generar un token aleatorio, guardar únicamente su hash y construir una URL hacia
  `/nueva-password?token=...`.
- La URL base del frontend se agrega a `application.properties` cuando se implemente HU-004 y se consume
  desde una clase de configuración; no se escribe directamente dentro del servicio.
- Enviar el enlace mediante `mail/password-recovery.html`.
- La API siempre conserva la misma respuesta `202`, exista o no la cuenta. Un fallo SMTP tampoco
  debe revelar que el correo está registrado.
- Si falla la entrega, registrar `estado_envio = 'ERROR'` y conservar la respuesta neutral. El token
  fallido no debe presentarse en la API, interfaz ni logs.

## Reutilización en historias posteriores

Cuando se elaboren los mapas técnicos de las siguientes épicas, estas historias deben reutilizar el
mismo `MailService`. La regla funcional de cada historia determina si un fallo revierte o no la
operación principal:

| Historia | Correo | Comportamiento ante fallo |
|---|---|---|
| HU-008 | Bienvenida, contraseña temporal y código | Conserva la cuenta restringida y permite reenvío |
| HU-017 | Confirmación de matrícula gratuita | No revierte matrícula ni libera cupo |
| HU-018 | Resultado del pago y acceso | No cambia el resultado de Culqi ni duplica el pago |
| HU-019 | Instrucciones de cuenta nueva y confirmación administrativa | Conserva cuenta y matrícula según su estado; permite reenvío |
| HU-027 | Reprogramación o cancelación de sesión | No revierte el cambio; permite reenviar el aviso |
| HU-030 | Examen de respuesta abierta calificado | No revierte la nota ni el estado calificado |
| HU-032 | Solicitud de datos y certificado disponible | No elimina el certificado ni reabre evaluaciones |
| HU-035 | Certificado emitido manualmente | No revierte la emisión ni crea otro certificado |
| HU-038 | Cancelación consolidada de curso | No revierte la cancelación; se envía uno por curso y afectado |
| HU-039 | Constancia de queja o reclamo | Conserva el caso registrado y no lo duplica |
| HU-040 | Respuesta de queja o reclamo | Conserva la respuesta, pero no pasa a `RESPONDIDO` hasta enviar |

Los envíos para varias personas se procesan como mensajes individuales. Aunque `HtmlMailMessage`
acepta una lista, no debe colocarse a todos los alumnos en un mismo campo `Para`, porque expondría
sus direcciones. Cada mensaje puede reutilizar la misma plantilla y los datos comunes del evento.

## Estados de entrega

Las tablas `codigo_verificacion_correo` y `token_recuperacion_acceso` ya poseen `estado_envio`. Para
EP01 se utilizan solamente estos valores:

| Estado | Significado |
|---|---|
| `PENDIENTE` | El registro fue creado y el intento todavía no concluyó |
| `ENVIADO` | El servidor SMTP aceptó el mensaje |
| `ERROR` | El intento de entrega falló |

`ENVIADO` no significa que la persona abrió el correo ni que su proveedor lo colocó en la bandeja
principal. No se implementan confirmaciones de lectura, seguimiento de aperturas ni control de
rebotes en EP01.

## Endpoint manual de prueba

`POST /api/testing/mail` solo existe con los perfiles `local` y `dev`. Recibe:

```json
{
  "recipient": "destinatario@correo.com",
  "subject": "Prueba ESEJUR",
  "name": "Nombre de prueba",
  "message": "El servicio funciona correctamente."
}
```

La respuesta `SENT` se produce únicamente después de que el servidor SMTP acepta el mensaje. El
endpoint no está disponible en `prod` y no debe reutilizarse desde Angular como funcionalidad del
usuario.

## Pruebas obligatorias

- Renderizado correcto de todos los campos y escape de caracteres HTML.
- Rechazo de una plantilla inexistente, una ruta insegura y un campo faltante.
- Destinatario, asunto, contenido HTML y codificación UTF-8 correctos.
- Conversión de un fallo del proveedor en `MailDeliveryException`.
- HU-002 conserva la cuenta pendiente y deja la emisión fallida en `ERROR` e invalidada.
- HU-003 invalida los códigos anteriores y permite volver a solicitar un envío si el nuevo falla.
- HU-004 devuelve la misma respuesta neutral para cuenta inexistente y fallo de entrega.
- Ninguna prueba real depende del servidor SMTP: `MailService` se reemplaza por un mock.

## Datos que nunca deben exponerse

- contraseña SMTP;
- contraseña o hash del usuario;
- código de verificación o su hash;
- token de recuperación, su hash o la URL privada completa;
- cuerpo completo del correo en logs;
- lista de destinatarios en logs o respuestas de error.
