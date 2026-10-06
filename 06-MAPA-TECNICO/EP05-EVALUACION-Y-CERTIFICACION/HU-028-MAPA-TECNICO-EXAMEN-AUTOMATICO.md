# HU-028 - Examen automatico

Usa `intento_examen`, `respuesta_intento` y `respuesta_opcion`. La API crea o recupera el intento,
guarda respuestas idempotentes y confirma envio; nunca acepta tiempo restante o nota del navegador.

El servicio valida matricula activa, habilitacion, secuencia, limite e intento activo. Calcula nota
sobre 20, conserva el mejor resultado y al vencer envia con cero en pendientes. PRACTICA no afecta
certificacion; CALIFICADO si. Angular muestra temporizador, navegacion, revision y confirmacion.
