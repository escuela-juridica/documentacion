# HU-022 — Mapa técnico para ingresar y continuar el curso

## API

- `GET /api/aula/matriculas/{matriculaId}`: resumen, módulos y siguiente actividad.
- `GET /api/aula/matriculas/{matriculaId}/ruta`: estados de módulos, lecciones y exámenes.

Resolver siempre la matrícula con el usuario autenticado. Validar cuenta, estado ACTIVA, inicio y
vigencia. Consultar `curso`, `regla_curso`, `modulo`, `leccion`, `progreso_leccion` y exámenes, sin
entregar todavía respuestas correctas ni enlaces fuera de ventana.

El backend calcula la siguiente actividad según orden y secuencia. Angular muestra sidebar/lista,
avance y acción Continuar. Probar acceso ajeno, pendiente, vencido, cancelado, curso cerrado con
vigencia y reanudación desde la última lección.
