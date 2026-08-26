# HU-027 — Administrar cambios en sesiones en vivo

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 4 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **reprogramar, cancelar o completar la información de sesiones**,
> para **mantener calendario, asistencia y alumnos coherentes ante cambios reales**.

## Alcance incluido

- Solo una sesión futura puede reprogramarse o cancelarse, siempre con motivo.
- Reprogramar conserva su lugar/requisitos, guarda horario anterior y actualiza fecha, inicio, fin,
  enlace, calendario y recordatorio.
- Si la nueva fecha supera la fecha de fin del curso, administración debe ampliar primero esa fecha;
  al guardarla se recalcula la fecha programada de los certificados todavía no emitidos.
- Cancelar es definitivo; queda visible CANCELADA, excluida de asistencia/progreso, libera secuencia
  y notifica.
- Al cancelar, ESEJUR elimina el recordatorio pendiente y advierte a administración que revise las
  horas académicas y la fecha de fin si lo ofrecido cambió; esos valores nunca se modifican solos.
- Sesión realizada no cambia fecha ni se cancela; administración puede corregir el enlace, agregar
  o reemplazar la grabación y corregir una asistencia dejando registro del ajuste.
- Grabación se agrega después y queda accesible a alumnos autorizados.

## Flujo principal de reprogramación

1. Administración elige sesión futura y registra motivo/nuevo horario.
2. ESEJUR valida y conserva el horario previo.
3. Si el nuevo horario supera la fecha de fin, solicita ampliarla antes de continuar.
4. Actualiza calendario/recordatorio, recalcula las emisiones aún pendientes afectadas y envía
   aviso.

El aviso se envía incluso si el recordatorio del horario anterior ya había salido, para corregir la
información que el alumno recibió.

## Flujo de cancelación

1. Administración registra motivo.
2. ESEJUR confirma impacto y cancela definitivamente.
3. Excluye la sesión, libera secuencia y envía aviso.

## Criterios de aceptación

- **Dado** sesión futura, **cuando** reprograma con motivo, **entonces** conserva datos anteriores,
  actualiza los vigentes y avisa.
- **Dado** una nueva fecha posterior al fin del curso, **cuando** intenta guardar sin ampliar el
  curso, **entonces** se impide; al ampliar el fin se recalculan los certificados aún no emitidos.
- **Dado** sesión futura, **cuando** cancela, **entonces** queda CANCELADA, excluida y no reversible.
- **Dado** una cancelación que reduce lo ofrecido, **cuando** confirma, **entonces** horas y fecha de
  fin no cambian automáticamente y administración recibe la advertencia de revisión.
- **Dado** sesión realizada, **cuando** intenta reprogramar/cancelar, **entonces** se impide, pero
  permite grabación/enlace/asistencia.
- **Dado** curso completo CANCELADO, **cuando** sus sesiones futuras cambian, **entonces** no se
  envían avisos separados por sesión: cada alumno afectado recibe un solo correo consolidado por la
  cancelación completa, con el curso, motivo y canal de atención.

## Notificación

- Una reprogramación o cancelación envía un aviso inmediato con el motivo y los datos anteriores y
  nuevos cuando existan. Si se reprograma, el recordatorio futuro utiliza el horario actualizado.
- Si el correo falla, el cambio válido no se revierte; el fallo queda visible para reenvío. No se
  implementa seguimiento de apertura o entrega.

## Dependencia interna

- Ninguna dentro de EP03; requiere sesión creada en EP02.
- Puede desarrollarse en paralelo con HU-026.

## Orientación de trabajo

- **Frontend:** acciones según fecha/estado, motivo, confirmación e historial visible.
- **Backend:** restricciones, exclusiones, actualización y aviso único.
- **Integración:** reprogramar o cancelar debe actualizar temario, calendario, recordatorios,
  asistencia y progreso en una sola operación, además de recalcular emisiones pendientes si cambia
  la fecha de fin del curso.

## Demostración esperada

Demostrar reprogramación, cancelación y corrección posterior a realizada.
