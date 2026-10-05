# HU-020 — Mapa técnico para controlar matrículas y pagos

## API

- `GET /api/admin/matriculas?...`: filtros paginados.
- `GET /api/admin/matriculas/{id}`: acceso, historial y pagos separados.
- `POST /api/admin/matriculas/{id}/cancelacion`: exige motivo.

## Implementación

Consultar `matricula`, `historial_estado_matricula` y `pago`. El vencimiento se determina con la
fecha almacenada y actualiza a VENCIDA de forma idempotente. Cancelar solo cambia acceso y agrega
historial; nunca edita el resultado económico ni ejecuta devolución. Una finalización previa no se
elimina.

Frontend presenta encabezados separados “Acceso” e “Historial económico”. Probar ACTIVA,
VENCIDA, CANCELADA, pago manual, exoneración, cancelación repetida y matrícula finalizada.
