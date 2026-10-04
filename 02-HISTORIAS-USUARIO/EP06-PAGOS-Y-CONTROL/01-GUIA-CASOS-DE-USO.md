# EP06 — Guía para el diagrama de casos de uso

## Actores

- Alumno.
- Administrador.
- Reclamante.
- Culqi.
- Servicio de correo.

## Casos de uso

- Pagar matrícula en línea.
- Reintentar pago permitido.
- Consultar resultado y constancia.
- Atender excepción de matrícula o pago.
- Cancelar completamente un curso.
- Emitir certificado manualmente.
- Corregir certificado.
- Anular certificado.
- Presentar queja o reclamo.
- Responder reclamación.
- Consultar y exportar reporte de pagos.
- Consultar dashboard.

## Relaciones

- Reintentar extiende pagar solo después de un resultado que lo admita.
- La constancia se incluye únicamente con APROBADO.
- Corregir o anular extienden la consulta administrativa de un certificado.
- Responder depende de una reclamación registrada.
- El dashboard integra los cinco reportes construidos entre EP03 y EP06.

## Exclusiones

- ESEJUR no procesa operaciones bancarias, devoluciones ni comprobantes SUNAT.
- Una captura o voucher no sustituye el resultado de Culqi.
- El dashboard no contiene tareas, alertas ni acciones operativas.

## Prompt

> Genera un diagrama UML horizontal estilo Rational Rose para “ESEJUR — Pagos y control”. Coloca
> Alumno, Administrador y Reclamante a la izquierda; Culqi y Servicio de correo a la derecha.
> Agrupa pago, control administrativo, reclamaciones y consulta de información.
