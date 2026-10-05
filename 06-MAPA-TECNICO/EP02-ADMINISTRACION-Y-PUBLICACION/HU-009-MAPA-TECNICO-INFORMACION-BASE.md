# HU-009 — Mapa técnico para información base

## Persistencia

Usa `tipo_curso`, `categoria_tematica`, `persona` para docentes, `entidad_certificadora`,
`firmante`, `tipo_material`, `regla_archivo` y `configuracion_institucional`.

## API

- `GET /api/admin/informacion-base/{tipo}?incluirInactivos=true`.
- `POST /api/admin/informacion-base/{tipo}`.
- `PUT /api/admin/informacion-base/{tipo}/{id}`.
- `PATCH /api/admin/informacion-base/{tipo}/{id}/activo`.

## Implementación

Cada tipo usa DTO propio y un servicio de aplicación; no recibir un nombre de tabla desde el
navegador. Las consultas para nuevos cursos devuelven solo activos. Desactivar mantiene la fila y
las referencias históricas. Docente significa una `persona` con perfil profesional y sin obligación
de `usuario`. Firmante referencia `persona` y conserva cargo e imagen de firma.

La pantalla usa navegación secundaria por tipo, formularios breves y un interruptor Activos / Todos.
Probar unicidad, desactivación usada, extensiones por material, enlace sin extensión y docente sin
cuenta.
