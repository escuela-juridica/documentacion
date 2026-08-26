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

### Sobrecupo simultáneo

- Antes de checkout se comprueba disponibilidad; PENDIENTE no reserva.
- Si dos operaciones distintas son aprobadas simultáneamente para el último cupo, ambas matrículas
  quedan ACTIVA porque ambas fueron cobradas.
- ESEJUR registra alerta de sobrecupo; esta es la única excepción a la capacidad.
- Administración consulta alumnos, curso, pagos y registra atención. No existe lista de espera.

### Aprobación posterior a cancelación de curso

- Si Culqi informa APROBADO después de CANCELADO, el pago se registra una vez.
- La matrícula permanece CANCELADA, no ocupa acceso utilizable ni entrega contenido.
- Se muestra como caso de atención externa.
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
