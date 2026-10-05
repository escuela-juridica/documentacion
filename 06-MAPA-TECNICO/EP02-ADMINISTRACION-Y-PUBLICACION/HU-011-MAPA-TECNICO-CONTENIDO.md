# HU-011 — Mapa técnico para organizar contenido

## Persistencia

Usa `modulo`, `leccion`, `recurso`, `material_leccion`, `tipo_material` y `regla_archivo`.

## API principal

- CRUD ordenado en `/api/admin/cursos/{cursoId}/modulos` y sus lecciones.
- `POST /api/admin/lecciones/{id}/materiales`: valida y asocia un recurso.
- `PUT /api/admin/lecciones/{id}/orden` y `/api/admin/modulos/{id}/orden`.
- `POST /api/admin/cursos/{id}/copias-modulo/{moduloOrigenId}`.

## Implementación

El servicio verifica que todo pertenezca al curso editado. La copia crea nuevos módulos,
lecciones, materiales, exámenes, preguntas y opciones; solo puede reutilizar la referencia física
del archivo. El orden se recibe como lista completa de identificadores y se guarda en transacción.
La vista previa solo aplica a lecciones grabadas y nunca expone una sesión o examen. El backend
valida extensión/tamaño y detecta duración cuando la fuente la proporciona.

Angular usa árbol ordenable y carga con progreso visible. Probar independencia de copia, orden,
descarga desactivada, preview público y archivo inválido.
