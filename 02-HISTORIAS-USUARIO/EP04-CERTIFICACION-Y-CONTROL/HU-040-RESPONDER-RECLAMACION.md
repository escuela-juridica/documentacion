# HU-040 — Responder una queja o reclamo

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **responder QUEJAS y RECLAMOS por correo dentro del plazo**, para
> **cumplir la atención formal y conservar evidencia completa**.

## Especificación funcional completa

- Bandeja con tipo, número, reclamante, fecha, límite, estado y adjuntos.
- Los pendientes se ordenan por vencimiento más próximo. Administración puede filtrar pendientes o
  respondidos y buscar por número, documento, nombre o correo; los próximos a vencer y vencidos se
  resaltan sin cerrar el caso.
- Tanto QUEJA como RECLAMO exigen respuesta en máximo 15 días hábiles improrrogables.
- Administración consulta el formulario original y escribe una respuesta.
- Al confirmar se conserva texto, fecha, responsable e intento de envío.
- Solo pasa de PENDIENTE_RESPUESTA a RESPONDIDO cuando el correo se envía correctamente.
- Si falla, permanece PENDIENTE_RESPUESTA, conserva la respuesta y permite reenviarla sin
  reescribir ni duplicar el caso.
- Ante un fallo, administración puede corregir el correo de destino dejando historial o reintentar
  el mismo envío; la respuesta redactada y la fecha original no se sustituyen.
- No se implementa seguimiento avanzado de apertura/entrega; solo éxito/fallo de envío.
- Todo el expediente y adjuntos se conservan.
- Una respuesta enviada queda cerrada para edición. Puede reenviarse con el mismo contenido y fecha
  original, conservando cada intento de envío.
- El correo final contiene número del caso, resumen de lo solicitado, respuesta de la Escuela y
  fecha de atención.

## Criterios de aceptación

- **Dado** caso pendiente, **cuando** envía correctamente una respuesta, **entonces** queda
  RESPONDIDO con fecha y responsable, y la persona reclamante recibe la respuesta por correo.
- **Dado** fallo de envío, **cuando** confirma, **entonces** conserva respuesta, permanece pendiente
  y permite reenvío.
- **Dado** respuesta registrada, **cuando** reenvía, **entonces** usa la misma respuesta e historial.
- **Dado** una respuesta ya enviada, **cuando** intenta editar su contenido, **entonces** se impide;
  únicamente puede reenviar la misma evidencia.
- **Dado** varios casos pendientes, **cuando** consulta la bandeja, **entonces** aparecen primero los
  de fecha límite más próxima y puede buscarlos por los campos definidos.
- **Dado** fecha próxima o vencida, **cuando** consulta bandeja, **entonces** la fecha límite sigue
  visible; el vencimiento no cierra el caso.

## Notificación

- La respuesta se envía al correo autorizado por la persona reclamante. Si el envío falla, el caso
  no cambia a RESPONDIDO y la misma respuesta queda disponible para reintento.

## Dependencia interna

- Depende de HU-039.

## Orientación de trabajo

- **Frontend:** bandeja, expediente, respuesta, límite, envío/reenvío y estados.
- **Backend:** conservación, transición solo por éxito e historial de intentos.
- **Integración:** la respuesta escrita debe conservarse antes del envío; solo un correo enviado
  correctamente cambia el expediente a RESPONDIDO, mientras un fallo mantiene el reenvío disponible.

## Demostración esperada

Demostrar envío exitoso, fallo y reenvío.
