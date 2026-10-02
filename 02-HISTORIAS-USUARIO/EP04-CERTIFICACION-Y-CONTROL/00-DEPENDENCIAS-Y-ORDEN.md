# EP04 — Dependencias y orden de ejecución

## Entregable funcional

El alumno puede completar un pago automático mediante Culqi, finalizar su recorrido, confirmar
datos y obtener un certificado que un tercero puede verificar. Administración controla emisiones,
pagos, cancelaciones y reclamaciones, consulta cinco reportes y finalmente el dashboard.

## Dependencias internas

| Historia | Depende de | Bloqueante para aceptar | Puede adelantarse |
|---|---|---|---|
| HU-032 | Ninguna dentro de la épica | No; requiere resultados académicos externos | Sí, con alumno finalizado controlado |
| HU-033 | HU-032 | Sí | Sí, con certificado controlado |
| HU-034 | HU-032 | Sí | Sí, con certificado controlado |
| HU-035 | Base de emisión de HU-032 | Sí para consistencia | Sí, acordando el certificado |
| HU-036 | HU-032 o HU-035 | Sí | Sí, con certificado controlado |
| HU-037 | HU-047 para casos reales | No | Sí, con pago/matrícula controlados |
| HU-038 | Integra HU-037 | No para iniciar; sí para excepción posterior a cancelación | Sí |
| HU-039 | Ninguna | No | Sí |
| HU-040 | HU-039 | Sí | Sí, con reclamación controlada |
| HU-041 | Ninguna dentro de la épica | No | Sí, con matrículas controladas |
| HU-042 | HU-047 para pagos automáticos reales | No | Sí, con pagos controlados |
| HU-043 | Ninguna dentro de la épica | No | Sí, con resultados controlados |
| HU-044 | HU-032 o HU-035 para datos reales | Sí para integración | Sí, con certificados controlados |
| HU-045 | Ninguna dentro de la épica | No | Sí, con asistencias controladas |
| HU-046 | HU-041 a HU-045 | Sí y además es el último componente | Puede maquetarse, no aceptarse antes |
| HU-047 | Base de curso y matrícula de EP02 | Sí para presentar el pago automático | Sí, con curso publicado controlado |

## Olas recomendadas

1. **Ola A, paralela:** HU-032, HU-039, HU-043, HU-045 y HU-047.
2. **Ola B, paralela:** HU-033, HU-034, HU-035, HU-037, HU-038, HU-040, HU-041 y HU-042.
3. **Ola C, paralela:** HU-036 y HU-044.
4. **Ola D final:** HU-046.

## Puntos de integración obligatorios

- La emisión automática, la confirmada por el alumno y la manual generan un único certificado por
  curso y respetan datos, privacidad e historial.
- Corregir y anular son resultados distintos; anular es irreversible.
- La cancelación completa preserva historial y no entrega automáticamente certificados a quien no
  cumplió.
- HU-047 activa matrícula y ocupa cupo únicamente después de un resultado APROBADO de Culqi; una
  notificación repetida no duplica pago, matrícula, acceso ni cupo.
- HU-037 y HU-042 integran los resultados reales de HU-047 sin modificar el resultado bancario.
- QUEJA y RECLAMO deben responderse en 15 días hábiles; un fallo de envío no cierra el caso.
- Los reportes respetan los estados y exclusiones de sus procesos fuente.
- El dashboard no muestra pendientes ni alertas y se acepta únicamente después de los reportes.

## Secuencia de demostración

1. Completar un pago mediante Culqi y mostrar la matrícula activada.
2. Completar condiciones y confirmar datos.
3. Emitir, descargar y verificar el certificado.
4. Mostrar emisión manual, corrección y anulación.
5. Atender una excepción de pago y cancelar un curso con historial preservado.
6. Presentar y responder una reclamación.
7. Filtrar y exportar los cinco reportes.
8. Mostrar el dashboard como cierre del producto.
