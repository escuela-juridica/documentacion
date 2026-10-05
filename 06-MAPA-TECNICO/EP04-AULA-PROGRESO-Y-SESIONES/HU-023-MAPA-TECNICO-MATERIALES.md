# HU-023 — Mapa técnico para materiales protegidos

## API

- `GET /api/aula/matriculas/{matriculaId}/lecciones/{leccionId}`.
- `GET /api/aula/materiales/{materialId}/acceso`: URL temporal o redirección controlada.
- `GET /api/publico/cursos/{slug}/vista-previa/{leccionId}` para preview permitido.

Antes de entregar cada referencia, comprobar pertenencia de lección y matrícula. En público exigir
`es_vista_previa`; nunca devolver enlace de reunión o examen. En privado respetar
`material_leccion.permite_descarga`: ocultar la acción de descarga y usar entrega en línea cuando
sea viable.

No confiar en una URL Angular como autorización. Probar material ajeno, preview, descarga apagada,
enlace externo, recurso inactivo y sesión protegida.
