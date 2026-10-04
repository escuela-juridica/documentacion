# EP02 — Guía para el diagrama de casos de uso

## Sistema

`ESEJUR — Administración y publicación de cursos`.

## Actores

- Administrador.
- Servicio de correo, como actor secundario para instrucciones de cuentas.

## Casos de uso

- Gestionar usuarios.
- Administrar información base.
- Crear y configurar curso.
- Asignar docentes.
- Organizar módulos, lecciones y materiales.
- Programar sesiones iniciales.
- Configurar exámenes.
- Configurar requisitos académicos.
- Validar curso.
- Publicar curso.
- Duplicar curso.
- Cerrar matrícula o curso mediante el ciclo ordinario.

## Relaciones

- Publicar incluye validar el curso.
- Configurar curso incluye asignar docentes y requisitos.
- Organizar contenido incluye gestionar módulos, lecciones y materiales.
- Duplicar extiende la gestión del curso y siempre produce un borrador independiente.

## Exclusiones

- No incluir matrícula, aula, resolución de exámenes, asistencia real, Culqi ni certificados.
- No mostrar al docente como usuario autenticado.
- No incluir cancelación completa; corresponde a EP06.

## Prompt

> Genera un diagrama UML horizontal, blanco y negro, estilo Rational Rose, para “ESEJUR —
> Administración y publicación de cursos”. Coloca Administrador a la izquierda y Servicio de
> correo a la derecha. Usa actores, elipses, límite del sistema y relaciones include/extend.
