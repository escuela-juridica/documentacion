# EP06 — Dependencias y orden de ejecución

## Entregable funcional

ESEJUR incorpora el pago automático con Culqi y completa su control administrativo: certificados
excepcionales, incidencias de matrícula y pago, cancelación total, reclamaciones, reporte de pagos
y dashboard.

## Dependencias

| Historia | Depende de | Puede adelantarse |
|---|---|---|
| HU-035 | Base de certificación de HU-032 | Sí, con certificado controlado |
| HU-036 | HU-032 o HU-035 | Sí, con certificado controlado |
| HU-037 | HU-047 para casos automáticos reales | Sí, con casos controlados |
| HU-038 | Integra HU-037 | Sí, excepto la aprobación posterior real |
| HU-039 | Ninguna | Sí |
| HU-040 | HU-039 | Sí, con reclamación controlada |
| HU-042 | HU-047 para pagos automáticos reales | Sí, con pagos manuales |
| HU-046 | HU-041 a HU-045 | Puede maquetarse; se acepta al integrar todos los reportes |
| HU-047 | Curso publicado y base de matrícula de EP03 | Sí, con curso controlado |

## Olas

1. HU-035, HU-039 y HU-047 en paralelo.
2. HU-036, HU-037, HU-040 y HU-042 en paralelo.
3. HU-038.
4. HU-046 como cierre.

## Integraciones obligatorias

- Culqi procesa el dinero; ESEJUR solo inicia y recibe resultados.
- Solo APROBADO activa matrícula y ocupa cupo.
- PENDIENTE no reserva cupo ni permite otro intento simultáneo.
- Confirmaciones repetidas no duplican pago, matrícula, acceso, constancia ni cupo.
- Una cancelación total conserva historial y no ejecuta devoluciones automáticas.
- Corregir y anular certificados son operaciones diferentes; anular es irreversible.
- QUEJA y RECLAMO se responden en quince días hábiles.
- El dashboard contiene únicamente gráficos simples y no muestra pendientes.
