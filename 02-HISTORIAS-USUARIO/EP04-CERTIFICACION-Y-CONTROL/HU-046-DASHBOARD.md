# HU-046 — Consultar el dashboard administrativo

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5, último componente |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar gráficos simples de matrículas y pagos**, para
> **reconocer la evolución de la Escuela sin convertir el dashboard en una bandeja de tareas**.

## Especificación completa

Al abrir usa el año calendario actual. Permite cambiar rango de fechas, curso y modalidad. Presenta
exactamente cuatro gráficos:

1. **Evolución de matrículas activadas:** cuántas llegaron a ACTIVA por periodo.
2. **Matrículas por curso:** distribución de matrículas activadas.
3. **Forma de ingreso:** pago en línea APROBADO, REGISTRADO_MANUAL, EXONERADO y curso gratuito por
   autoservicio.
4. **Pagos confirmados por periodo:** importe de APROBADO y REGISTRADO_MANUAL con monto mayor que
   cero; excluye PENDIENTE, RECHAZADO, ERROR, EXPIRADO y EXONERADO.

Una matrícula/pago repetido cuenta una vez. No muestra tarjetas de indicadores, métricas extra,
tareas pendientes, vencimientos, alertas, reclamaciones por atender ni acciones. Los cuatro
gráficos y sus filtros constituyen todo el dashboard. El detalle pertenece a los reportes. No es
contabilidad.

## Criterios de aceptación

- **Dado** ingreso inicial, **cuando** abre, **entonces** usa el año actual y muestra cuatro gráficos.
- **Dado** filtros, **cuando** cambian, **entonces** todos los gráficos usan el mismo conjunto.
- **Dado** estados no confirmados o exonerados, **cuando** calcula pagos, **entonces** no suman.
- **Dado** información operativa pendiente, **cuando** abre, **entonces** no aparece como tarea o
  alerta.

## Dependencia interna

- Depende de HU-041 a HU-045 y se implementa al final.

## Orientación de trabajo

- **Frontend:** cuatro gráficos y filtros simples.
- **Backend:** agregaciones idénticas a reportes y deduplicación.
- **Integración:** los cuatro gráficos deben usar filtros y reglas de conteo idénticos a los reportes,
  de modo que una cifra del dashboard pueda comprobarse con el detalle filtrado correspondiente.

## Demostración esperada

Demostrar filtros y coherencia con reportes, sin pendientes visibles.
