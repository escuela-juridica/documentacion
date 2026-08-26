# EP04 — Dependencias y orden de ejecución

## Entregable funcional

El alumno completa su recorrido, confirma datos, obtiene y descarga un certificado que un tercero
puede verificar. Administración controla emisiones y cancelaciones, atiende reclamaciones y
consulta cinco reportes. El dashboard informativo se integra al final.

## Dependencias internas

| Historia | Depende de | Bloqueante para aceptar | Puede adelantarse |
|---|---|---|---|
| HU-032 | Ninguna dentro de la épica | No; requiere resultados académicos externos | Sí, con alumno finalizado controlado |
| HU-033 | HU-032 | Sí | Sí, con certificado controlado |
| HU-034 | HU-032 | Sí | Sí, con certificado controlado |
| HU-035 | Base de emisión de HU-032 | Sí para consistencia | Sí, acordando el certificado |
| HU-036 | HU-032 o HU-035 | Sí | Sí, con certificado controlado |
| HU-037 | Ninguna dentro de la épica | No | Sí, con pago/matrícula controlados |
| HU-038 | Integra HU-037 | No para iniciar; sí para excepción posterior a cancelación | Sí |
| HU-039 | Ninguna | No | Sí |
| HU-040 | HU-039 | Sí | Sí, con reclamación controlada |
| HU-041 | Ninguna dentro de la épica | No | Sí, con matrículas controladas |
| HU-042 | Ninguna dentro de la épica | No | Sí, con pagos controlados |
| HU-043 | Ninguna dentro de la épica | No | Sí, con resultados controlados |
| HU-044 | HU-032 o HU-035 para datos reales | Sí para integración | Sí, con certificados controlados |
| HU-045 | Ninguna dentro de la épica | No | Sí, con asistencias controladas |
| HU-046 | HU-041 a HU-045 | Sí y además es el último componente | Puede maquetarse, no aceptarse antes |

## Olas recomendadas

1. **Ola A, paralela:** HU-032, HU-037, HU-038, HU-039, HU-041, HU-042, HU-043 y HU-045.
2. **Ola B, paralela:** HU-033, HU-034, HU-035 y HU-040.
3. **Ola C, paralela:** HU-036 y HU-044.
4. **Ola D final:** HU-046.

## Puntos de integración obligatorios

- La emisión automática, la confirmada por el alumno y la manual generan un único certificado por
  curso y respetan datos, privacidad e historial.
- Corregir y anular son resultados distintos; anular es irreversible.
- La cancelación completa preserva historial y no entrega automáticamente certificados a quien no
  cumplió.
- QUEJA y RECLAMO deben responderse en 15 días hábiles; un fallo de envío no cierra el caso.
- Los reportes respetan los estados y exclusiones de sus procesos fuente.
- El dashboard no muestra pendientes ni alertas y se acepta únicamente después de los reportes.

## Secuencia de demostración

1. Completar condiciones y confirmar datos.
2. Emitir, descargar y verificar el certificado.
3. Mostrar emisión manual, corrección y anulación.
4. Cancelar un curso con historial preservado.
5. Presentar y responder una reclamación.
6. Filtrar y exportar los cinco reportes.
7. Mostrar el dashboard como cierre del producto.

