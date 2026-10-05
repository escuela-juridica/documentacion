# HU-026 — Mapa técnico para participar en sesiones en vivo

## API

- `GET /api/mis-cursos/calendario?desde=&hasta=`.
- `GET /api/aula/matriculas/{matriculaId}/sesiones/{leccionId}/acceso`.

La consulta reúne sesiones EN_VIVO de matrículas accesibles. El endpoint de acceso entrega el
enlace solamente entre inicio y fin; antes devuelve cuenta regresiva y después grabación pendiente
o material disponible. ESEJUR no consulta participantes de Zoom ni registra asistencia automática.

Las sesiones anteriores a la matrícula no integran el denominador de asistencia. Angular muestra
mes, filtros y estados sin incluir cursos exclusivamente VIRTUAL. Probar antes/durante/después,
sesión cancelada, curso ajeno y grabación incorporada.
