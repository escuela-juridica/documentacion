# HU-043 — Consultar el reporte de seguimiento académico

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar el avance y requisitos de cada matriculado**, para
> **identificar su situación académica sin imponer condiciones que el curso no exige**.

## Especificación completa

Por alumno/curso muestra:

- progreso general;
- exámenes calificados requeridos y aprobados;
- nota final cuando existen exámenes obligatorios;
- respuestas abiertas PENDIENTE_REVISION y fecha límite;
- asistencia únicamente en EN_VIVO/HIBRIDO;
- condiciones pendientes con valor real y meta;
- `fecha_finalizacion`;
- estado/situación del certificado.

No presenta como pendientes condiciones desactivadas. Progreso puede mostrarse aunque no sea
requisito; asistencia nunca se calcula en VIRTUAL. Filtros: rango, curso, modalidad, alumno,
situación académica, cumplimiento y estado de certificado. El rango se aplica a `fecha_matricula`
para definir la cohorte analizada. Exportación Excel respeta filtros.

## Criterios de aceptación

- **Dado** curso sin exámenes, **cuando** consulta, **entonces** no muestra nota final pendiente.
- **Dado** VIRTUAL, **cuando** consulta, **entonces** no muestra asistencia.
- **Dado** respuesta abierta pendiente, **cuando** consulta, **entonces** muestra estado y límite y
  no considera finalizado.
- **Dado** filtros activos, **cuando** exporta, **entonces** Excel conserva datos y metas visibles.

## Dependencia interna

- Ninguna interna; requiere progreso/exámenes/asistencia reales para aceptación final.

## Orientación de trabajo

- **Frontend:** filtros y lectura comparativa valor/meta.
- **Backend:** reglas variables por curso y exportación.
- **Integración:** consulta y Excel deben calcular para el mismo alumno las condiciones activas,
  valores reales, metas, finalización y certificado, sin inventar asistencia o notas no aplicables.

## Demostración esperada

Demostrar VIRTUAL, EN_VIVO y curso sin exámenes.
