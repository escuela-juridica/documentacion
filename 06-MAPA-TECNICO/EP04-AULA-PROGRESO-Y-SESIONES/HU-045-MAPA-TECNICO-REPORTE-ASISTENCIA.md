# HU-045 — Mapa técnico para asistencia y su reporte

## API

- `GET /api/admin/cursos/{cursoId}/asistencia?sesion=&texto=`.
- `PUT /api/admin/asistencias`: alta o actualización con motivo de corrección.
- `GET /api/admin/reportes/asistencia?...` y `/exportacion`.

`AsistenciaServicio` solo acepta lecciones EN_VIVO no canceladas. Conserva una fila por matrícula y
sesión. Una corrección exige administrador y motivo. El porcentaje usa únicamente sesiones
elegibles posteriores a la matrícula; si no hay ninguna, informa “sin sesiones elegibles” y no
divide entre cero.

La pantalla permite registrar por sesión y el reporte filtra curso, alumno y resultado. Pantalla y
Excel comparten la misma consulta. Probar presente/ausente/justificada, corrección, matrícula tardía,
sesión cancelada y curso VIRTUAL.
