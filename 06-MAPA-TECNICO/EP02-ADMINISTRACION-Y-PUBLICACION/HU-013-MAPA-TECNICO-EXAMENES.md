# HU-013 — Mapa técnico para configurar exámenes

## Persistencia

Usa `examen`, `pregunta` y `opcion_pregunta`. En EP02 no crea intentos ni respuestas.

## API

- CRUD `/api/admin/cursos/{cursoId}/examenes`.
- CRUD de preguntas en `/api/admin/examenes/{examenId}/preguntas`.
- Reordenamiento mediante listas completas de identificadores.

## Servicio

Validar CALIFICADO/PRACTICA, tipos de pregunta, puntajes, opciones correctas, intentos, tiempo,
política de respuestas, habilitación y `dias_revision`. PRACTICA fuerza intentos ilimitados y no
bloquea. `AL_AGOTAR` no se admite con intentos ilimitados. VIRTUAL no exige fecha. Una abierta no
tiene clave automática. Tras inicio se bloquean los campos académicos definidos por negocio.

Angular cambia controles según tipo de pregunta y examen. Probar los cuatro tipos, máximo inválido,
respuesta abierta, práctica e intento ilimitado.
