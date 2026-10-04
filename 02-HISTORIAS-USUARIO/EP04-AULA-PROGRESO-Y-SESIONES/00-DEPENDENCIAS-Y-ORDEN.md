# EP04 — Dependencias y orden de ejecución

## Entregable funcional

El alumno ingresa al aula, consulta materiales, completa lecciones, conserva su progreso y
participa en sesiones en vivo. Administración reprograma sesiones y controla asistencia.

## Dependencias

| Historia | Depende de | Puede adelantarse |
|---|---|---|
| HU-022 | Acceso activo de EP03 | Sí, con matrícula controlada |
| HU-023 | HU-022 | Sí, con material controlado |
| HU-024 | HU-022 | Sí, con lecciones controladas |
| HU-025 | HU-024 | Sí, acordando estados de avance |
| HU-026 | Acceso activo y sesiones configuradas | Sí |
| HU-027 | Sesiones configuradas en HU-012 | Sí, con sesiones controladas |
| HU-045 | HU-026 y HU-027 para datos reales | Sí, con asistencias controladas |

## Olas

1. HU-022, HU-026 y HU-027 en paralelo.
2. HU-023 y HU-024 en paralelo.
3. HU-025.
4. HU-045.

## Integraciones obligatorias

- Solo una matrícula con acceso válido abre contenido protegido.
- Un video se completa al alcanzar el umbral; abrirlo o adelantarlo no basta.
- Una lección sin video puede completarse con check, lista o “Siguiente”.
- La secuencia puede ser obligatoria o flexible según el curso.
- Reprogramar o cancelar conserva historial y comunica al alumno.
- ESEJUR no crea reuniones ni consulta automáticamente asistentes de Zoom.
- El reporte calcula asistencia únicamente sobre sesiones elegibles.
