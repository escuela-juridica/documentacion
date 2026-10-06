# HU-038 - Cancelar curso

La cancelacion total cambia estado del curso y matriculas afectadas en una transaccion, registra
motivo e historial y conserva pagos, certificados y evidencia. No ejecuta devoluciones automaticas.

La pantalla exige confirmacion y resume afectados antes de confirmar. Las notificaciones se envian
despues y su fallo no deshace la cancelacion.
