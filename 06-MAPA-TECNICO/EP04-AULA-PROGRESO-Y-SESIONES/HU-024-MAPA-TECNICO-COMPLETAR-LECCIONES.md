# HU-024 — Mapa técnico para completar lecciones

## API y tablas

- `PUT /api/aula/matriculas/{matriculaId}/materiales/{materialId}/progreso` escribe
  `progreso_material`.
- `POST /api/aula/matriculas/{matriculaId}/lecciones/{leccionId}/confirmacion` escribe
  `progreso_leccion`.

El video recibe posición/avance comprobable, limita 0–100 y completa al alcanzar
`regla_curso.umbral_video`; adelantar el reproductor no debe aumentar tiempo reconocido sin
evidencia. Una lección sin video se completa por confirmación explícita. Ambas operaciones son
idempotentes y validan acceso.

Angular guarda avance periódicamente, reanuda posición y ofrece check/Siguiente solo donde aplica.
Probar umbral inferior/superado, eventos repetidos, lección sin video y matrícula bloqueada.
