# HU-039 - Presentar reclamacion

Registra `reclamacion` con tipo QUEJA o RECLAMO, detalle, fecha y usuario autenticado. La API evita
que el navegador suplante al autor y devuelve codigo de seguimiento.

La interfaz permite adjuntar el contexto de matricula o pago sin alterar sus estados. Crear el caso
envia constancia individual; si el correo falla, el caso permanece registrado.
