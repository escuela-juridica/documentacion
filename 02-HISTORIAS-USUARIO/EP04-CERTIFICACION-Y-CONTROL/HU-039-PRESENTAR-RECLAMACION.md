# HU-039 — Presentar una queja o reclamo

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Reclamante, con o sin cuenta |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **persona usuaria o visitante**, quiero **presentar una QUEJA o RECLAMO y recibir
> constancia**, para **dejar formalmente registrada mi disconformidad y fecha máxima de respuesta**.

## Especificación funcional completa

- Página pública enlazada en el pie, accesible con o sin sesión.
- Comparte el pie con las páginas públicas de política de privacidad y términos y condiciones, y
  presenta la indicación de que la institución dispone del Libro conforme al Código de Protección
  y Defensa del Consumidor Peruano.
- Con sesión, prellena datos conocidos; pueden revisarse según el formulario.
- Distingue `QUEJA` y `RECLAMO`; ambos deben responderse.
- Datos de quien reclama: tipo y número de documento, nombres, apellidos, correo electrónico,
  celular y dirección.
- Datos de lo contratado: monto reclamado y descripción del producto o servicio.
- Detalle mediante dos campos obligatorios: “Cuéntenos ¿qué pasó?” y “¿Qué podemos hacer por usted?”.
- QUEJA significa disconformidad con la atención del proveedor sin relación directa con el producto
  o servicio; RECLAMO significa disconformidad con el producto o servicio adquirido. La diferencia
  clasifica el caso, pero ambos exigen respuesta.
- Varias imágenes opcionales, máximo 5 MB cada una.
- Declaración jurada y autorización de respuesta por correo obligatorias.
- Salvo las imágenes, todos los datos listados y los dos campos de detalle son obligatorios. La
  persona debe declarar bajo juramento que es usuaria del servicio y que los hechos son veraces, y
  autorizar expresamente que la respuesta llegue al correo consignado.
- Al enviar genera número correlativo, fecha, PENDIENTE_RESPUESTA y fecha límite de 15 días hábiles
  improrrogables.
- El día hábil posterior a presentar es el día 1; si se presenta en un día no hábil, el conteo
  comienza el siguiente día hábil. Se excluyen sábados, domingos y feriados oficiales del Perú.
- Conserva formulario y adjuntos.
- Envía una constancia con número de caso, copia de los datos presentados y fecha máxima de
  respuesta.
- Solo se controla éxito o fallo del envío; no seguimiento avanzado de entrega.
- No se crea un portal público de seguimiento: la persona conserva la constancia inicial y recibe
  posteriormente la respuesta por correo.

## Flujo principal

1. La persona abre el Libro y elige QUEJA o RECLAMO.
2. Completa/revisa datos, detalle, imágenes y declaraciones.
3. ESEJUR valida y registra el caso una sola vez.
4. Calcula fecha máxima, muestra constancia y la envía por correo.

## Criterios de aceptación

- **Dado** formulario válido, **cuando** envía, **entonces** recibe número, estado, fecha límite y
  constancia.
- **Dado** sesión activa, **cuando** abre, **entonces** datos conocidos aparecen prellenados.
- **Dado** imagen mayor a 5 MB o declaración faltante, **cuando** envía, **entonces** no registra y
  explica la corrección.
- **Dado** un tipo de caso, **cuando** selecciona QUEJA o RECLAMO, **entonces** ve la definición que
  permite clasificarlo y el plazo de respuesta permanece igual para ambos.
- **Dado** fallo de correo, **cuando** el caso ya fue registrado, **entonces** conserva el caso y
  registra el fallo; no lo duplica.

## Notificación

- La persona reclamante recibe por correo la constancia, el número del caso y la fecha máxima de
  respuesta. La Escuela recibe el aviso del nuevo expediente.

## Dependencia interna

- Ninguna; puede desarrollarse en paralelo y no requiere login.
- HU-040 utiliza el caso.

## Orientación de trabajo

- **Frontend:** formulario, prellenado, adjuntos, declaraciones y constancia.
- **Backend:** número, plazo hábil, estado, conservación y correo.
- **Integración:** enviar el formulario debe crear un expediente único con número, adjuntos, fecha
  límite y estado PENDIENTE_RESPUESTA, mostrar constancia y remitir los correos de recepción.

## Demostración esperada

Demostrar con/sin cuenta, QUEJA/RECLAMO y validación de imagen.
