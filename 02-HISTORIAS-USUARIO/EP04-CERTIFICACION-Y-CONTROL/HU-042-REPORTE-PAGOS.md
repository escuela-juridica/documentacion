# HU-042 — Consultar el reporte de pagos registrados

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar y exportar pagos registrados**, para **controlar
> operaciones de plataforma sin confundirlas con contabilidad o comprobantes SUNAT**.

## Especificación completa

Columnas: fecha, alumno, curso, monto, medio, resultado, referencia, origen en línea/administrativo
y motivo cuando corresponda.

- Incluye PENDIENTE, APROBADO, RECHAZADO, ERROR, EXPIRADO, REGISTRADO_MANUAL y EXONERADO.
- Total de pagos confirmados suma APROBADO y REGISTRADO_MANUAL con monto mayor que cero.
- Excluye del total PENDIENTE, RECHAZADO, ERROR, EXPIRADO y EXONERADO.
- Confirmación repetida de un mismo pago cuenta una sola vez.
- Filtros: rango, curso, alumno, resultado, medio y origen.
- Exportación Excel respeta filtros.
- No calcula impuestos, comisiones, devoluciones ni comprobantes tributarios.

## Criterios de aceptación

- **Dado** todos los estados, **cuando** consulta, **entonces** conserva cada resultado y calcula el
  total únicamente con confirmados monetarios.
- **Dado** EXONERADO, **cuando** totaliza, **entonces** aparece en detalle con cero y no suma.
- **Dado** confirmación repetida, **cuando** reporta, **entonces** no duplica monto.
- **Dado** filtros, **cuando** exporta, **entonces** Excel coincide con la consulta.

## Dependencia interna

- Ninguna interna; usa pagos operativos existentes.
- Paralela con los otros reportes.

## Orientación de trabajo

- **Frontend:** filtros, detalle, total claramente rotulado y Excel.
- **Backend:** clasificación, idempotencia y suma exacta.
- **Integración:** detalle, total y Excel deben compartir filtros y deduplicación; solo APROBADO y
  REGISTRADO_MANUAL con monto mayor que cero suman como pagos confirmados.

## Demostración esperada

Demostrar APROBADO, manual, exonerado, fallo y repetición.
