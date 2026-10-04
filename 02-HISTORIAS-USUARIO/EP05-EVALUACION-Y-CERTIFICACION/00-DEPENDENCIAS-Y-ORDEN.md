# EP05 — Dependencias y orden de ejecución

## Entregable funcional

El alumno rinde evaluaciones automáticas o abiertas, recibe calificación, completa requisitos y
obtiene un certificado descargable y verificable. Administración consulta resultados académicos y
certificados.

## Dependencias

| Historia | Depende de | Puede adelantarse |
|---|---|---|
| HU-028 | Exámenes configurados en HU-013 | Sí, con examen controlado |
| HU-029 | Exámenes configurados en HU-013 | Sí |
| HU-030 | HU-029 | Sí, con respuesta controlada |
| HU-031 | Datos de progreso, asistencia o evaluación | Sí, con casos controlados |
| HU-032 | Resultados de EP04 y HU-028/HU-030 según reglas | Sí, con alumno finalizado |
| HU-033 | HU-032 | Sí, con certificado controlado |
| HU-034 | HU-032 | Sí, con certificado controlado |
| HU-043 | Resultados académicos reales | Sí, con datos controlados |
| HU-044 | HU-032 para certificados reales | Sí, con certificados controlados |

## Olas

1. HU-028, HU-029, HU-031 y HU-043 en paralelo.
2. HU-030.
3. HU-032.
4. HU-033, HU-034 y HU-044 en paralelo.

## Integraciones obligatorias

- Las preguntas marcables se califican automáticamente.
- Las respuestas abiertas esperan revisión y respetan su fecha máxima.
- La nota definitiva usa el redondeo y reglas configuradas.
- Antes de emitir, el alumno confirma los datos que aparecerán en el certificado.
- Después de emitir no puede aumentar la nota mediante nuevos intentos calificables.
- Existe un solo certificado vigente por logro; el documento de identidad no se imprime.
- La verificación pública expone únicamente datos mínimos.
