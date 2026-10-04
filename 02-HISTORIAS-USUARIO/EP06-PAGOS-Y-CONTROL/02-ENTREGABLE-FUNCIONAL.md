# EP06 — Entregable funcional para la review

## Producto obtenido

La plataforma queda completa: vende automáticamente mediante Culqi, resuelve situaciones
excepcionales y permite a la Escuela cerrar y analizar su operación.

## Historias incluidas

HU-035, HU-036, HU-037, HU-038, HU-039, HU-040, HU-042, HU-046 y HU-047.

## Guion

1. Seleccionar un curso pagado, confirmar el importe y abrir Culqi.
2. Mostrar un resultado no aprobado y luego un reintento APROBADO.
3. Comprobar matrícula, acceso, cupo y constancia únicos.
4. Repetir la confirmación y demostrar idempotencia.
5. Atender una aprobación tardía o contradictoria sin modificar el resultado bancario.
6. Cancelar completamente un curso y conservar su historial.
7. Emitir manualmente, corregir y anular certificados con justificación.
8. Presentar y responder una queja o reclamo.
9. Consultar y exportar el reporte de pagos.
10. Mostrar el dashboard con los cinco reportes integrados.

## Criterios del incremento

- Las nueve historias cumplen sus criterios.
- El pago automático nunca concede acceso antes de APROBADO.
- El importe confirmado permanece fijo por intento.
- Las excepciones no duplican ni borran información.
- La cancelación no produce devoluciones automáticas.
- Certificados administrativos conservan versiones e historial.
- Reclamaciones respetan plazo y resultado del correo.
- El dashboard coincide con los reportes y muestra solo gráficos simples.

## Cierre del producto

> ESEJUR permite descubrir, publicar, matricular, aprender, evaluar, certificar, cobrar y controlar
> la operación educativa de la Escuela Jurídica.
