# EP04 — Guía para generar el diagrama de casos de uso

## Objetivo para la IA diagramadora

Generar un diagrama UML de casos de uso estilo **Rational Rose** que muestre pago automático,
certificación, control administrativo, reclamaciones y consulta de información. Debe mantenerse legible aunque la épica
tenga varias ramas.

## Estilo

- Fondo blanco y trazos negros.
- Rectángulo `ESEJUR — Certificación y control`.
- Actores de palo fuera y elipses dentro.
- Usar agrupación espacial por certificación, reclamaciones y reportes, sin dibujar contenedores
  adicionales que parezcan subsistemas.
- Relaciones include/extend UML, sin flechas de flujo temporal.
- Formato horizontal de alta resolución para Word.

## Actores

### Primarios

- `Alumno`
- `Administrador`
- `Verificador externo`
- `Reclamante` — puede tener o no una cuenta

### Secundario

- `Servicio de correo`
- `Culqi`

## Casos de uso

- Pagar matrícula en línea.
- Reintentar pago no completado.
- Consultar resultado y constancia informativa.
- Confirmar datos para certificado.
- Obtener certificado.
- Mejorar nota antes de emitir.
- Consultar y descargar certificados.
- Verificar certificado.
- Emitir certificado manualmente.
- Corregir certificado.
- Anular certificado.
- Atender excepciones de matrícula y pago.
- Cancelar matrícula.
- Cancelar curso completo.
- Presentar queja o reclamo.
- Emitir constancia de reclamación.
- Responder reclamación.
- Reenviar respuesta registrada.
- Consultar reporte de matrículas.
- Consultar reporte de pagos.
- Consultar reporte académico.
- Consultar reporte de certificados.
- Consultar reporte de asistencia.
- Exportar reporte a Excel.
- Consultar dashboard.

## Asociaciones y relaciones

- Alumno: pagar matrícula, reintentar cuando corresponda y consultar su resultado.
- Culqi: procesar la operación y comunicar su resultado.
- Alumno: confirmar datos, obtener, mejorar antes de emitir, consultar y descargar certificados.
- Verificador externo: verificar certificado.
- Reclamante: presentar queja o reclamo y recibir constancia/respuesta.
- Administrador: emisiones administrativas, vigencia del certificado, excepciones, cancelaciones,
  respuesta de reclamaciones, reportes y dashboard.
- Servicio de correo: datos pendientes, certificado listo, constancia y respuesta de reclamación,
  curso cancelado.
- `Obtener certificado` incluye confirmar datos si están pendientes.
- `Reintentar pago no completado` extiende `Pagar matrícula en línea` solo después de un resultado
  que permita otro intento.
- `Consultar resultado y constancia` se incluye después del pago; la constancia solo existe para APROBADO.
- `Mejorar nota antes de emitir` extiende obtener certificado mientras no se haya emitido.
- `Corregir certificado` y `Anular certificado` extienden la consulta administrativa de un
  certificado emitido; no deben unirse entre sí.
- `Presentar queja o reclamo` incluye emitir constancia.
- `Reenviar respuesta` extiende responder reclamación solo si ya existe una respuesta registrada.
- Cada reporte puede incluir `Exportar reporte a Excel`.
- `Consultar dashboard` no incluye pendientes ni acciones administrativas.

## Exclusiones

- No mostrar devolución automática, comprobantes SUNAT o contabilidad.
- No representar a ESEJUR como procesador bancario ni una captura o voucher como aprobación.
- No exponer DNI, correo, teléfono, nota, firmas ni PDF en la verificación pública.
- No modelar dashboard como dependencia funcional de las acciones del alumno.

## Prompt listo para otra IA

> Genera un diagrama UML de casos de uso horizontal, estilo Rational Rose, blanco y negro, para
> “ESEJUR — Certificación y control”. Coloca Alumno, Administrador, Verificador externo y
> Reclamante a la izquierda, y Culqi y Servicio de correo a la derecha. Agrupa visualmente las
> elipses por pago, certificación, reclamaciones y reportes sin crear subsistemas adicionales. Aplica exactamente las
> relaciones y exclusiones indicadas y optimiza la legibilidad para Word.
