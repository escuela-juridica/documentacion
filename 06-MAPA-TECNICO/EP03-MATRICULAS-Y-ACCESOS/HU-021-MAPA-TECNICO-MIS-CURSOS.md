# HU-021 — Mapa técnico para Mis cursos y acceso

## API

- `GET /api/mis-cursos?grupo=en-progreso|completados`.
- `GET /api/mis-cursos/{matriculaId}/acceso` para resolver navegación al aula.

La consulta parte del usuario autenticado y une `matricula`, `curso`, estado, portada y docentes.
“Completados” usa `fecha_finalizacion`; los demás vigentes se muestran en progreso. El DTO informa
estado, fecha de acceso, vencimiento y motivo de bloqueo sin entregar enlaces de material.

Antes de abrir el aula, validar ACTIVA, cuenta habilitada, fecha de inicio y vigencia. CERRADO no
retira el acceso concedido; CANCELADA/VENCIDA sí lo bloquean salvo consultas históricas permitidas.
Angular no calcula autorización. Probar los dos grupos y cada motivo de bloqueo.
