# HU-044 — Consultar el reporte de certificados

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar y exportar certificados emitidos**, para **controlar
> nivel, vigencia y forma de emisión sin exponer el PDF en el reporte**.

## Especificación completa

Columnas: alumno, curso, nivel, entidad certificadora, fecha de finalización, fecha de emisión,
estado, código y forma de emisión.

- Forma: automática programada, confirmada por alumno o manual administrativa.
- Estado definitivo: VIGENTE o ANULADO.
- Un corregido permanece VIGENTE y conserva el mismo código; el reporte muestra datos vigentes.
- Filtros: rango, curso, alumno, nivel, entidad, estado y forma de emisión.
- Exportación Excel respeta filtros y no contiene DNI, nota, firmas ni PDF.

## Criterios de aceptación

- **Dado** emisiones de los tres tipos, **cuando** consulta, **entonces** las distingue.
- **Dado** corregido, **cuando** reporta, **entonces** conserva código y datos actuales.
- **Dado** ANULADO, **cuando** filtra, **entonces** aparece como no vigente sin habilitar PDF.
- **Dado** exportación, **cuando** descarga, **entonces** no incluye información privada excluida.

## Dependencia interna

- Para datos reales depende de HU-032 o HU-035; puede adelantarse con certificados controlados.

## Orientación de trabajo

- **Frontend:** filtros, estado y exportación.
- **Backend:** clasificación, privacidad y versión vigente.
- **Integración:** consulta y Excel deben compartir filtros y mostrar la versión vigente de cada
  certificado sin exponer DNI, nota, firmas ni archivo PDF.

## Demostración esperada

Demostrar automático, alumno, manual, corregido y anulado.
