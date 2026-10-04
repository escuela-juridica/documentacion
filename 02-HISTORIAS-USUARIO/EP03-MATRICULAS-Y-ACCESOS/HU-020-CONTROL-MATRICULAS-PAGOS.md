# HU-020 — Consultar y controlar matrículas y pagos

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Épica 3 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar el estado y origen de matrículas y pagos**, para
> **dar soporte y cancelar accesos cuando corresponda sin alterar el historial económico**.

## Alcance incluido

- Matrículas ACTIVA, CANCELADA y VENCIDA generadas por gratuidad o administración.
- Condiciones REGISTRADO_MANUAL y EXONERADO. PENDIENTE_PAGO e intentos Culqi se agregan mediante
  HU-047 de EP06 sin reemplazar este control.
- Datos de constancia y referencia.
- Consulta de alumno, curso, fechas, forma de ingreso y responsable administrativo.
- Cancelar una matrícula con motivo; no borrar ni devolver dinero.
- Una cancelación no reactiva automáticamente otra matrícula, no transforma el pago ni habilita una
  devolución. Cualquier nueva decisión se atiende posteriormente como excepción documentada.
- Vencimiento automático de acceso según vigencia.
- La vigencia usa `max(fecha_activacion, fecha_inicio si existe)` como día 1 y vence a las 23:59:59
  de `America/Lima` del día N; si está vacía, el acceso es permanente mientras no se cierre por otra
  regla.
- Conservación de la finalización ya obtenida, la confirmación de datos, la emisión programada y el
  certificado, aunque la matrícula luego venza o sea cancelada.

## Flujo principal

1. Administración filtra y abre una matrícula.
2. Consulta estado de acceso e historial de pago separado.
3. Si corresponde, cancela con motivo.
4. ESEJUR retira acceso, conserva historial y muestra el resultado.

## Criterios de aceptación

- **Dado** una matrícula, **cuando** se consulta, **entonces** pago y acceso aparecen separados.
- **Dado** vigencia agotada, **cuando** se actualiza el acceso, **entonces** pasa a VENCIDA sin
  borrar certificado.
- **Dado** matrícula ACTIVA, **cuando** administración cancela con motivo, **entonces** pasa a
  CANCELADA y no ejecuta devolución.
- **Dado** una matrícula CANCELADA, **cuando** se consulta posteriormente, **entonces** conserva su
  historial y no ofrece reactivación automática ni altera los pagos registrados.
- **Dado** una matrícula ya finalizada, **cuando** posteriormente vence o se cancela, **entonces**
  continúa el proceso de certificación sin reabrir el acceso académico.

## Dependencia interna

- Requiere datos de HU-017 o HU-019 para integración en EP03. Los intentos automáticos de Culqi se
  incorporan posteriormente mediante HU-047 de EP06.
- Puede adelantarse con matrículas y pagos controlados.

## Orientación de trabajo

- **Frontend:** búsqueda, filtros, detalle separado, motivo y estados.
- **Backend:** consulta histórica, vencimiento, cancelación y conservación.
- **Integración:** el detalle debe separar el historial económico del estado de acceso; cancelar o
  vencer una matrícula retira el contenido sin alterar pagos, finalización ni certificados previos.

## Demostración esperada

Demostrar acceso ACTIVA, registro manual, exoneración, vencimiento y cancelación. Los intentos y
resultados automáticos se incorporan posteriormente en la demostración de HU-047.
