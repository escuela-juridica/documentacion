# HU-045 — Consultar el reporte de asistencia

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar y exportar asistencia de cursos en vivo o híbridos**,
> para **controlar sesiones, correcciones y cumplimiento del mínimo cuando aplique**.

## Especificación completa

- Solo disponible para `EN_VIVO` e `HIBRIDO`; nunca VIRTUAL.
- Columnas: curso, sesión, fecha, alumno, asistió/no, origen automático o corrección administrativa,
  porcentaje acumulado y cumplimiento del mínimo cuando sea condición.
- Asistencia automática solo por abrir el enlace desde ESEJUR entre inicio y fin, una vez.
- CANCELADA excluida del total.
- Matrícula tardía usa solo sesiones posteriores a la matrícula.
- Grabación no cuenta asistencia.
- Porcentaje acumulado = sesiones asistidas / sesiones elegibles × 100. Son elegibles solo las
  sesiones no canceladas posteriores a la matrícula del alumno.
- Filtros: rango, curso, sesión, alumno, modalidad, asistencia, origen y cumplimiento.
- Exportación Excel conserva filtros.

## Criterios de aceptación

- **Dado** curso VIRTUAL, **cuando** busca el reporte, **entonces** no se ofrece asistencia.
- **Dado** sesión CANCELADA, **cuando** calcula, **entonces** no entra al denominador.
- **Dado** matrícula tardía, **cuando** calcula acumulado, **entonces** excluye sesiones anteriores.
- **Dado** corrección, **cuando** reporta, **entonces** distingue origen administrativo.

## Dependencia interna

- Ninguna interna; requiere asistencias reales para validación final.

## Orientación de trabajo

- **Frontend:** filtros, tabla, origen y Excel.
- **Backend:** denominador correcto, modalidad y exclusiones.
- **Integración:** tabla, porcentaje y Excel deben usar el mismo denominador por alumno, excluyendo
  sesiones canceladas y anteriores a una matrícula tardía, y mostrando el origen de cada asistencia.

## Demostración esperada

Demostrar sesión normal, cancelada, corrección y matrícula tardía.
