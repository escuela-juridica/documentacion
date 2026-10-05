# EP02 — Pantallas funcionales

## Pantallas nuevas

| ID | Pantalla | Historias | Actor |
|---|---|---|---|
| PF-010 | Gestión administrativa de usuarios | HU-008 | Administrador |
| PF-012 | Administración de información base | HU-009 | Administrador |
| PF-013 | Gestión y listado de cursos | HU-010, HU-015, HU-016 | Administrador |
| PF-014 | Editor integral del curso | HU-010 a HU-015 | Administrador |

## Contenido mínimo

- PF-010: listado, búsqueda, creación, roles, estado y acciones seguras sobre cuentas.
- PF-012: tipos, categorías, docentes, entidades, firmantes, materiales y reglas de archivo.
- PF-013: crear, editar, duplicar, administrar estados permitidos e iniciar la acción rápida de
  publicación. Esta acción no publica por una ruta diferente: abre el mismo resumen de validación
  de HU-015 dentro de PF-014.
- PF-014: Información, Contenido, Sesiones, Exámenes, Certificación y Publicación. La sección
  Publicación es el único flujo funcional que presenta todos los errores, permite navegar a las
  correcciones, solicita confirmación y ejecuta la transición atómica de HU-015.

## Pantallas reutilizadas

- PF-003 para ingresar como administrador.
- PF-001 y PF-002 para comprobar el curso publicado.

## Orden de review

PF-003 → PF-010 → PF-012 → PF-013 → PF-014 → PF-001 → PF-002.
