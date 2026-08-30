# HU-020 — Consultar y controlar matrículas y pagos

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar el estado y origen de matrículas y pagos**, para
> **dar soporte y cancelar accesos cuando corresponda sin alterar el historial económico**.

## Alcance incluido

- Matrículas PENDIENTE_PAGO, ACTIVA, CANCELADA y VENCIDA.
- Intentos Culqi y resultados; REGISTRADO_MANUAL y EXONERADO.
- Datos de constancia y referencia.
- Consulta de alumno, curso, fechas, forma de ingreso y responsable administrativo.
- Cancelar una matrícula con motivo; no borrar ni devolver dinero.
- Vencimiento automático de acceso según vigencia.
- La vigencia usa `max(fecha_activacion, fecha_inicio si existe)` como día 1 y vence a las 23:59:59
  de `America/Lima` del día N; si está vacía, el acceso es permanente mientras no se cierre por otra
  regla.
- Conservación de la finalización ya obtenida, la confirmación de datos, la emisión programada y el
  certificado, aunque la matrícula luego venza o sea cancelada.
- Un sobrecupo simultáneo se muestra con los dos pagos APROBADO, las dos matrículas ACTIVA y una
  alerta pendiente de atención. Una aprobación posterior a cancelar un curso muestra el pago
  APROBADO separado de la matrícula CANCELADA y sin acceso, con su caso de atención externa.

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
- **Dado** historial con reintentos, **cuando** se consulta, **entonces** se ven resultados sin
  convertir fallos en APROBADO.
- **Dado** sobrecupo o aprobación posterior a cancelación, **cuando** consulta, **entonces** puede
  explicar por separado resultado de pago, matrícula, cupo, acceso y atención registrada.
- **Dado** una matrícula ya finalizada, **cuando** posteriormente vence o se cancela, **entonces**
  continúa el proceso de certificación sin reabrir el acceso académico.

## Dependencia interna

- Requiere datos de HU-017, HU-018 o HU-019 para integración.
- Puede adelantarse con matrículas y pagos controlados.

## Orientación de trabajo

- **Frontend:** búsqueda, filtros, detalle separado, motivo y estados.
- **Backend:** consulta histórica, vencimiento, cancelación y conservación.
- **Integración:** el detalle debe separar el historial económico del estado de acceso; cancelar o
  vencer una matrícula retira el contenido sin alterar pagos, finalización ni certificados previos.

## Demostración esperada

Demostrar acceso ACTIVA, pago fallido, registro manual, exoneración, vencimiento y cancelación.
