# Mapa maestro tecnico - EP06 Pagos y control

Planificado. Culqi procesa el dinero; ESEJUR crea intentos, recibe resultados y aplica una unica vez
los efectos internos. El orden es HU-035, HU-039 y HU-047; luego HU-036, HU-037, HU-040 y HU-042;
despues HU-038 y finalmente HU-046.

## Tablas y rutas

`pago`, `evento_pago`, `matricula`, `atencion_matricula_pago`, `certificado`,
`historial_certificado`, `reclamacion`, `respuesta_reclamacion` y `notificacion`.

```text
/cursos/:urlAmigable/pago
/app/reclamaciones
/admin/pagos
/admin/reclamaciones
/admin/reportes/pagos
/admin/dashboard
```

- Solo APROBADO activa matricula, acceso y cupo.
- PENDIENTE o error no reserva cupo.
- Webhooks repetidos son idempotentes.
- El dashboard muestra solo graficos simples, no pendientes operativos.
