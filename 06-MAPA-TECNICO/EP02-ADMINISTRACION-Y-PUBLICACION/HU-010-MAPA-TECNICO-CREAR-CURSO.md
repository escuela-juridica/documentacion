# HU-010 — Mapa técnico para crear y configurar un curso

## Persistencia

Escribe `curso`, `curso_docente`, `curso_firmante`, `regla_curso` e
`historial_estado_curso`. Consulta datos maestros activos. El alta siempre usa estado BORRADOR.

## API

- `POST /api/admin/cursos`: crea el borrador mínimo.
- `GET /api/admin/cursos/{id}`: devuelve el editor completo.
- `PUT /api/admin/cursos/{id}/informacion`: guarda información comercial y temporal.
- `PUT /api/admin/cursos/{id}/docentes`: reemplaza orden de asignaciones sin duplicados.
- `PUT /api/admin/cursos/{id}/firmantes`: reemplaza firmantes ordenados.

## Reglas de servicio

Validar modalidad, fechas, precio, promoción, cupo, vigencia y URL única. VIRTUAL no recibe fin ni
cierre. EN_VIVO/HIBRIDO reciben inicio y fin. El cierre inicialmente puede quedar vacío; HU-014
aplica la propuesta de asistencia. La URL se genera y valida en backend. Una asignación docente no
crea usuario.

Angular adapta campos por modalidad, pero envía un DTO explícito y muestra errores por campo.
Probar las tres modalidades, promoción permanente/fechada, URL repetida y varios docentes.
