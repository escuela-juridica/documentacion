# HU-037 — Atender excepciones de matrículas y pagos

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **identificar y registrar la atención de excepciones económicas o
> de capacidad**, para **resolverlas fuera del procesamiento bancario sin alterar resultados**.

## Excepciones incluidas

### Sobrecupo por aprobación simultánea o tardía

- Antes de checkout se comprueba disponibilidad; PENDIENTE no reserva.
- Si dos operaciones distintas son aprobadas simultáneamente para el último cupo, o un pago
  iniciado válidamente se aprueba cuando el cupo ya se llenó, las matrículas quedan ACTIVA porque
  fueron cobradas.
- ESEJUR registra alerta de sobrecupo; un pago nuevo nunca puede iniciarse sin cupo.
- Administración consulta alumnos, curso, pagos y registra atención. No existe lista de espera.

### Aprobación tardía después de cambios del curso o matrícula

- Si el pago comenzó cuando el curso admitía matrícula y Culqi informa APROBADO después de que el
  curso quedó CERRADO, venció `fecha_cierre_matricula` o se completó el cupo, se respeta: activa
  matrícula y alerta sobrecupo cuando corresponda.
- Si el curso quedó CANCELADO o esa matrícula fue CANCELADA antes de APROBADO, el pago se registra
  una vez, la matrícula permanece CANCELADA, no concede acceso y pasa a atención externa.

- La Escuela resuelve comunicación/devolución por su canal y registra qué atención brindó; ESEJUR
  no procesa devolución ni cambia el resultado de Culqi.

### Principios generales

- Pago y matrícula permanecen separados.
- Una confirmación repetida no crea una segunda excepción.
- Historial económico y responsable de atención se conservan.

## Criterios de aceptación

- **Dado** sobrecupo por aprobaciones simultáneas, **cuando** consulta, **entonces** ambas están
  ACTIVA y existe una sola alerta atendible.
- **Dado** APROBADO posterior a cancelación, **cuando** se registra, **entonces** el pago existe,
  matrícula CANCELADA y ningún acceso.
- **Dado** APROBADO de una operación iniciada válidamente antes del cierre, fecha o cupo completo,
  **cuando** llega, **entonces** activa la matrícula y alerta sobrecupo si excede la capacidad.
- **Dado** administración registra atención, **cuando** guarda, **entonces** conserva detalle,
  fecha y responsable sin inventar devolución automática.

## Dependencia interna

- No depende internamente para desarrollarse con casos controlados.
- Se integra con HU-038 para aprobación posterior a cancelación.

## Orientación de trabajo

- **Frontend:** alertas, detalle, registro de atención y estados separados.
- **Backend:** detección idempotente, conservación y prohibición de acceso/devolución propia.
- **Integración:** la atención debe mostrar pago, matrícula, acceso y cupo por separado; cualquier
  ajuste autorizado conserva el resultado bancario y registra motivo, responsable, fechas y cierre.

## Demostración esperada

Demostrar sobrecupo y aprobación posterior a cancelación.
