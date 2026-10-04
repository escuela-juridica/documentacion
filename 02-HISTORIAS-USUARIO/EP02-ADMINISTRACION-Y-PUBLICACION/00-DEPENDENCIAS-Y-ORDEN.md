# EP02 — Dependencias y orden de ejecución

## Entregable funcional

Administración gestiona usuarios e información base, construye un curso completo, valida su
coherencia y lo publica en el catálogo. Esta épica no matricula alumnos.

## Dependencias internas

| Historia | Depende de | Puede adelantarse |
|---|---|---|
| HU-008 | Capacidades de acceso de EP01 | Sí, con cuentas controladas |
| HU-009 | Ninguna | Sí |
| HU-010 | HU-009 | Sí, con catálogos controlados |
| HU-011 | HU-010 | Sí, con un curso de prueba |
| HU-012 | HU-011 | Sí, acordando la estructura de lección |
| HU-013 | HU-011 | Sí, acordando la estructura de evaluación |
| HU-014 | HU-010; integra HU-012 y HU-013 cuando aplican | Sí |
| HU-015 | HU-010 a HU-014 según modalidad y reglas | Solo puede aceptarse al integrar todo |
| HU-016 | HU-015 | Puede prepararse con cursos controlados |

## Olas recomendadas

1. HU-008 y HU-009 en paralelo.
2. HU-010.
3. HU-011 y HU-014 en paralelo.
4. HU-012 y HU-013 en paralelo.
5. HU-015.
6. HU-016.

## Integraciones obligatorias

- VIRTUAL no exige fecha final ni permite asistencia como requisito.
- EN_VIVO exige al menos una sesión válida antes de publicar.
- HIBRIDO exige al menos una sesión y contenido grabado.
- Varios docentes pueden asociarse y ordenarse sin crearles una cuenta.
- Las reglas se congelan al iniciar el curso o registrarse la primera actividad.
- Duplicar crea una copia independiente sin matrículas, pagos, progreso ni resultados.
- El ciclo ordinario termina en CERRADO; la cancelación completa pertenece a HU-038 de EP06.

## Tarea de backlog

TAREA-001 integra Google con HU-001 y HU-002. Puede desarrollarse en paralelo y no bloquea la
publicación de cursos.
