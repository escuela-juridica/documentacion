# Mapa maestro técnico — EP02 Administración y publicación

## Resultado técnico

El administrador gestiona usuarios y datos maestros, construye un curso completo y ejecuta una
única validación transaccional para publicarlo. El curso publicado aparece en el catálogo de EP01.
EP02 no crea matrículas, pagos ni progreso.

## Orden de construcción

1. HU-008 y HU-009 en paralelo.
2. HU-010.
3. HU-011 y HU-014 en paralelo, acordando contratos.
4. HU-012 y HU-013 en paralelo.
5. HU-015 como integración obligatoria.
6. HU-016 como ciclo de vida y duplicación.
7. TAREA-001 Google puede avanzar en paralelo y no bloquea la publicación.

## Estructura backend vigente

```text
controller/  service/  repository/  entity/  dto/
```

La implementación actual mantiene las capas por responsabilidad. Los servicios de curso, contenido
y examen concentran las reglas de EP02; HU-015 y HU-016 completarán las transiciones de
publicación y ciclo de vida sin duplicar sus validaciones.

## Rutas frontend vigentes

```text
/admin/usuarios
/admin/informacion-base
/admin/cursos
/admin/cursos/:id
```

El editor conserva las secciones Información, Contenido, Sesiones, Exámenes, Certificación y
Publicación. La sección es una pestaña dentro de `/admin/cursos/:id`; no se codifica como segmento
adicional de URL.

## Endpoints EP02 vigentes

- `GET/PUT /api/admin/cursos/{id}/reglas`: requisitos academicos y de certificacion de HU-014.
- `GET/POST/PUT/PATCH /api/admin/cursos`, `/api/admin/modulos`, `/api/admin/lecciones` y
  `/api/admin/materiales`: curso y contenido de HU-010 a HU-012.
- `GET/POST/PUT/PATCH /api/admin/cursos/{cursoId}/examenes` y recursos de preguntas: HU-013.
- La publicacion y el ciclo de vida se documentan en HU-015 y HU-016; no se deben presentar como
  cierre funcional de EP02 mientras sus pestañas no esten integradas en el frontend.

## Tablas

`persona`, `usuario`, `usuario_rol`, `tipo_curso`, `categoria_tematica`,
`entidad_certificadora`, `firmante`, `tipo_material`, `regla_archivo`,
`configuracion_institucional`, `curso`, `curso_docente`, `curso_firmante`, `regla_curso`,
`historial_estado_curso`, `modulo`, `leccion`, `recurso`, `material_leccion`, `examen`, `pregunta` y
`opcion_pregunta`.

## Condiciones de aceptación técnica

- Toda escritura administrativa exige la autoridad `ADMINISTRADOR` de la sesion autenticada.
- Las operaciones compuestas son transaccionales.
- Los listados se paginan y filtran en backend.
- Desactivar datos maestros no rompe referencias históricas.
- Publicar evalúa todos los errores y cambia estado una sola vez.
- Duplicar genera identidades nuevas sin actividad académica ni comercial.
- Los contratos HTTP se documentan y los errores de negocio no se responden como error 500.
