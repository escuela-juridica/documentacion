# HU-047 — Matricularme pagando en línea mediante Culqi

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Actor secundario | Culqi |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |
| Prioridad | Crítica |

## Historia

> Como **alumno con cuenta habilitada**, quiero **pagar un curso disponible**, para **obtener acceso
> automático únicamente cuando Culqi apruebe la operación**.

## Alcance incluido

- Tarjeta de crédito/débito, Yape y Plin; cuotas si Culqi las ofrece.
- PagoEfectivo, depósito en efectivo, voucher enviado por WhatsApp y validación manual de capturas
  no forman parte de este flujo. Yape y Plin también deben ser procesados y confirmados por Culqi.
- ESEJUR comprueba disponibilidad antes de iniciar, pero no reserva cupo.
- Antes de enviar la operación, el alumno confirma el importe vigente. Cada intento conserva curso,
  alumno, número de pedido, precio regular, promoción aplicada, importe final en soles, medio,
  fecha y hora e identificador comunicado por Culqi.
- El importe aceptado de un intento no cambia aunque después se modifique el precio o termine la
  promoción. Un reintento posterior vuelve a mostrar el precio vigente y exige nueva confirmación.
- Culqi procesa e informa PENDIENTE, APROBADO, RECHAZADO, ERROR o EXPIRADO.
- Solo el primer APROBADO activa la matrícula y ocupa cupo.
- Un intento no aprobado puede reintentarse sobre la misma matrícula, conservando historial y sin
  dos intentos PENDIENTE simultáneos.
- ESEJUR no asigna vencimiento propio a PENDIENTE ni convierte fallos en aprobados.
- Mientras no exista APROBADO, la matrícula permanece PENDIENTE_PAGO y no concede contenido.
- Confirmaciones repetidas son idempotentes: no duplican pago, matrícula, acceso ni cupo.
- Si aprobaciones simultáneas o tardías iniciadas válidamente superan el cupo, todas reciben acceso
  y se registra una alerta de sobrecupo.
- Cuando no queda cupo se muestra “Sin cupos”; no se reserva un lugar ni se crea lista de espera.
- Constancia imprimible: número de pedido, importe y moneda, método, fecha y hora, datos del alumno,
  curso y, para tarjeta, últimos dígitos. No es comprobante SUNAT.
- La constancia solo existe para APROBADO. PENDIENTE, RECHAZADO, ERROR y EXPIRADO muestran su
  resultado, pero nunca una constancia que aparente un pago realizado.
- Pago y certificado están incluidos en un único importe.
- La vigencia, si existe, comienza en la fecha posterior entre APROBADO/activación e inicio del
  curso; esa fecha es el día 1 y vence a las 23:59:59 de `America/Lima` del día N.

## Flujo principal

1. El alumno elige comprar y ESEJUR valida curso, cuenta, duplicidad, cierre y cupo.
2. Confirma el precio vigente y ESEJUR conserva las condiciones aceptadas para ese intento antes
   de iniciar la operación con Culqi.
3. ESEJUR conserva el intento PENDIENTE hasta el resultado comunicado.
4. Culqi informa APROBADO.
5. Sin revisión humana, ESEJUR registra el pago una vez, activa matrícula, ocupa cupo, genera
   constancia y confirma.
6. El acceso abre inmediatamente o desde la fecha de inicio.

## Alternativas y excepciones

- RECHAZADO/ERROR/EXPIRADO: no activa ni ocupa cupo; informa y permite reintentar cuando aplica.
- Ninguna captura, voucher o declaración del alumno sustituye el resultado APROBADO de Culqi.
- Repetición del mismo resultado: no cambia cantidades ni genera otro correo/constancia.
- Cambio de precio después de iniciar: no modifica el intento en curso; si se necesita reintentar,
  se muestra el nuevo importe y el alumno debe aceptarlo antes de crear otra operación.
- Otro intento ya PENDIENTE: no inicia un segundo simultáneo.
- Sin cupo antes de pagar: muestra “Sin cupos” y no inicia operación.
- Aprobación simultánea que causa sobrecupo: acceso para ambos y alerta administrativa.
- Curso CANCELADO mientras Culqi procesa: registra APROBADO, matrícula CANCELADA, sin contenido y
  caso para atención externa; ESEJUR no devuelve automáticamente.
- Curso CERRADO, fecha de cierre vencida o cupo completado después de iniciar válidamente el pago:
  un APROBADO tardío se respeta, activa la matrícula y alerta sobrecupo si corresponde.
- Matrícula individual CANCELADA antes del APROBADO: registra el pago una sola vez, mantiene la
  matrícula CANCELADA, no entrega acceso y deja el caso para atención externa.

## Criterios de aceptación

### Aprobación

- **Dado** curso disponible y cuenta habilitada,
- **cuando** Culqi informa APROBADO,
- **entonces** se registra un pago, una matrícula ACTIVA, un cupo y una constancia.

### Resultado no aprobado

- **Dado** un intento,
- **cuando** Culqi informa RECHAZADO, ERROR o EXPIRADO,
- **entonces** no hay acceso ni cupo y el historial permite un nuevo intento.
- **Dado** un resultado no aprobado que Culqi permite reintentar, **cuando** el alumno selecciona
  “Volver a pagar”, **entonces** el nuevo intento pertenece a la misma matrícula PENDIENTE_PAGO y
  conserva los resultados anteriores.
- **Dado** un resultado no aprobado, **cuando** se muestra su detalle, **entonces** no existe una
  constancia y la interfaz no afirma que el pago fue realizado.

### Importe aceptado

- **Dado** un intento iniciado por un importe confirmado, **cuando** el precio público cambia antes
  de llegar el resultado, **entonces** el intento conserva el importe aceptado y su APROBADO activa
  la matrícula por ese valor.
- **Dado** un reintento después de cambiar el precio, **cuando** el alumno selecciona volver a
  pagar, **entonces** ve y confirma el importe vigente antes de iniciar la nueva operación.

### Idempotencia

- **Dado** un resultado ya aplicado,
- **cuando** Culqi lo repite,
- **entonces** no se duplica ningún efecto.

### Medio no admitido

- **Dado** un alumno que desea pagar en efectivo o enviar una captura,
- **cuando** revisa los medios disponibles,
- **entonces** esas opciones no se ofrecen y se indican únicamente tarjeta, Yape o Plin mediante
  Culqi.

### Cancelación durante operación

- **Dado** un pago iniciado antes de cancelar el curso,
- **cuando** APROBADO llega después,
- **entonces** se registra, pero la matrícula permanece CANCELADA y sin acceso.

### Aprobación tardía válida

- **Dado** un pago iniciado cuando el curso admitía matrícula, **cuando** Culqi informa APROBADO
  después del cierre, del vencimiento de la fecha o de completarse el cupo, **entonces** se activa
  el acceso y, si excede la capacidad, se alerta a administración.
- **Dado** que antes del resultado se canceló el curso o esa matrícula, **cuando** llega APROBADO,
  **entonces** se registra una sola vez, no se reactiva el acceso y queda para atención externa.

## Notificaciones

- Cuando Culqi aprueba y la matrícula se activa, se envía una confirmación con curso, importe,
  medio, referencia y fecha de acceso.
- Cuando Culqi comunica un resultado no aprobado que admite otro intento, se informa que la
  matrícula no se activó y se muestra cómo volver a intentar el pago.
- El fallo de un correo no modifica el resultado Culqi ni el estado de la matrícula y permite
  reenviar el aviso sin duplicar pago, constancia o acceso. No se rastrea apertura o entrega.

## Dependencia interna

- Depende de HU-015 para que el curso esté publicado y de la base de matrícula establecida en EP02.
- HU-037, HU-038, HU-041, HU-042 y HU-046 utilizan sus resultados dentro de EP04.

## Orientación de trabajo

- **Frontend:** checkout, estados, reintento, constancia y mensajes sin afirmar procesamiento propio.
- **Backend:** condiciones aceptadas por intento, resultado Culqi, idempotencia, matrícula, cupo,
  historial y excepción de cancelación preparada para HU-038.
- **Integración:** ejecutar APROBADO, fallo, repetición y cancelación en curso.

## Demostración esperada

Completar pago aprobado, imprimir constancia, demostrar fallo/reintento, conservar el importe
aceptado y repetir una confirmación sin duplicar. La aprobación posterior a una cancelación total
queda documentada, pero no se demuestra hasta HU-038.
