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

## Paquetes backend sugeridos

```text
adminusuario/  maestra/  curso/  contenido/  sesion/  examen/  publicacion/
```

Cada paquete separa controlador, servicio, repositorio, DTO de petición, DTO de respuesta y
proyecciones. `publicacion` puede consultar los demás dominios, pero estos no deben depender de
`publicacion`.

## Rutas frontend sugeridas

```text
/administracion/usuarios
/administracion/informacion-base
/administracion/cursos
/administracion/cursos/nuevo
/administracion/cursos/:id/editar/:seccion
```

El editor conserva las secciones Información, Contenido, Sesiones, Exámenes, Certificación y
Publicación. La acción rápida del listado abre la misma sección Publicación; no existe otro flujo.

## Tablas

`persona`, `usuario`, `usuario_rol`, `tipo_curso`, `categoria_tematica`,
`entidad_certificadora`, `firmante`, `tipo_material`, `regla_archivo`,
`configuracion_institucional`, `curso`, `curso_docente`, `curso_firmante`, `regla_curso`,
`historial_estado_curso`, `modulo`, `leccion`, `recurso`, `material_leccion`, `examen`, `pregunta` y
`opcion_pregunta`.

## Condiciones de aceptación técnica

- Toda escritura administrativa exige rol principal o asignado `ROLE_ADMINISTRADOR`.
- Las operaciones compuestas son transaccionales.
- Los listados se paginan y filtran en backend.
- Desactivar datos maestros no rompe referencias históricas.
- Publicar evalúa todos los errores y cambia estado una sola vez.
- Duplicar genera identidades nuevas sin actividad académica ni comercial.
- Los contratos HTTP se documentan y los errores de negocio no se responden como error 500.
