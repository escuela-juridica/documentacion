# HU-029 - Examen con respuesta abierta

Reutiliza el intento y registra texto en `respuesta_intento`. Al enviar abiertas pasa a
`PENDIENTE_REVISION` y calcula la fecha limite con los dias del examen.

Objetivas se corrigen al enviar, pero no existe nota definitiva hasta completar la revision. Un
intento pendiente impide otro del mismo examen y uno CALIFICADO pendiente bloquea certificado.
Angular conserva borrador, muestra fecha limite y no inventa calificacion.
