# HU-041 — Consultar el reporte de matrículas

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **filtrar y exportar las matrículas**, para **conocer quién ingresó,
> cómo obtuvo el acceso y cuál es su situación actual**.

## Especificación completa

Columnas: alumno, curso, modalidad, fecha de matrícula, fecha de activación, estado de matrícula,
forma de ingreso, situación académica y estado del certificado.

- Estados: PENDIENTE_PAGO, ACTIVA, CANCELADA o VENCIDA.
- Forma de ingreso: pago en línea APROBADO, REGISTRADO_MANUAL, EXONERADO o curso gratuito por
  autoservicio.
- Situación académica: no iniciado, en curso o finalizado; finalizado usa `fecha_finalizacion` y no
  se confunde con estado de acceso.
- Filtros: rango de fechas aplicado a `fecha_matricula`, curso, modalidad, estado y alumno.
- Exportación Excel conserva filtros y columnas.
- Una matrícula/confirmación repetida aparece y cuenta una sola vez.

## Criterios de aceptación

- **Dado** matrículas de distintos orígenes, **cuando** filtra, **entonces** muestra origen/estado
  correctos sin mezclar pago y acceso.
- **Dado** alumno finalizado con matrícula vencida, **cuando** consulta, **entonces** ve ambas
  condiciones distintas.
- **Dado** filtros activos, **cuando** exporta, **entonces** Excel contiene exactamente el conjunto
  filtrado.

## Dependencia interna

- Ninguna interna; requiere datos operativos de matrículas para validación real.
- Puede desarrollarse en paralelo con HU-042 a HU-045.

## Orientación de trabajo

- **Frontend:** filtros, tabla y descarga.
- **Backend:** clasificación sin duplicados y exportación coherente.
- **Integración:** tabla, totales y archivo Excel deben usar exactamente los mismos filtros y una
  sola fila por matrícula, distinguiendo estado de acceso, origen y situación académica.

## Demostración esperada

Demostrar filtros combinados y Excel.
