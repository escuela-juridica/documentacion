# HU-040 - Responder reclamacion

Consulta casos abiertos y guarda `respuesta_reclamacion` con contenido, responsable y fecha. El
servicio controla el plazo de quince dias habiles y conserva cada respuesta para auditoria.

Solo cambia a RESPONDIDO despues de guardar respuesta valida; el aviso por correo se intenta luego
y un fallo queda registrable sin borrar la respuesta.
