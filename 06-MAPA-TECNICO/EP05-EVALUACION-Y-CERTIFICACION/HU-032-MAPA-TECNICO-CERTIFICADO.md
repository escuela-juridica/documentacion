# HU-032 - Obtener certificado

Centraliza requisitos de `regla_curso`, progreso, asistencia e intentos en `logro_certificacion`.
Solo crea un `certificado` vigente por logro y registra su historial y firmantes.

Calcula finalizacion, fecha base y espera en America/Lima. Con espera cero deja al alumno generar o
seguir mejorando; con espera positiva programa emision. Antes de emitir confirma datos requeridos,
congela nota, nivel y datos, y bloquea nuevos intentos CALIFICADO.
