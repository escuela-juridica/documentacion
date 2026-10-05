# HU-014 — Mapa técnico para requisitos académicos

## Persistencia y API

Lee/escribe la única fila `regla_curso` mediante
`GET/PUT /api/admin/cursos/{cursoId}/reglas`. También consulta sesiones y exámenes para validar
coherencia.

## Servicio

Aplicar valores iniciales según modalidad. Ocultar y rechazar asistencia en VIRTUAL. Validar
porcentajes 0–100, notas 0–20, refrendado mayor que mínima y espera no negativa. Si se desactivan
exámenes, rechazar mientras exista CALIFICADO. Si asistencia se activa, proponer inicio como cierre
de matrícula; conservar una fecha ya confirmada si sigue siendo válida. Al desactivarla, no borrar
automáticamente el cierre confirmado.

Antes de guardar, revisar `reglas_bloqueadas_en`, estado EN_CURSO y existencia de progreso,
intentos o asistencia. La respuesta devuelve la propuesta separada del valor confirmado para que
Angular no guarde silenciosamente. Probar tres modalidades, todas las condiciones apagadas y reglas
congeladas.
