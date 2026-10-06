# HU-031 - Excepciones academicas

`excepcion_academica` registra motivo, actor, fecha y efecto. Solo permite corregir asistencia con
respaldo u otorgar intento adicional; nunca aumentar una nota directamente.

El servicio confirma pertenencia de alumno, curso y dato corregido. No modifica intentos fallidos;
registra excepcion y habilita oportunidad. Si existe certificado, rechaza cambios que modifiquen
nota o nivel. La interfaz exige motivo y confirmacion.
