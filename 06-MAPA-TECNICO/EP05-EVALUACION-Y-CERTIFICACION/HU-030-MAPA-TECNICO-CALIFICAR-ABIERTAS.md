# HU-030 - Calificar respuestas abiertas

Consulta intentos pendientes y guarda `revision_respuesta` por pregunta. La finalizacion es una
transaccion: valida todos los puntajes, recalcula nota y mejor resultado y cambia a `CALIFICADO`.

Cada puntaje queda entre cero y el maximo. Vencido es alerta, no calificacion automatica. El correo
de resultado se envia despues y su fallo no revierte nota. La bandeja separa pendientes, proximos y
vencidos.
