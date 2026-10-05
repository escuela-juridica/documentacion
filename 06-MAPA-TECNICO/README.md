# Mapa técnico de ESEJUR

La documentación técnica se organiza con la misma distribución funcional de seis épicas. En esta
entrega se encuentra desarrollada hasta EP04.

## Orden vigente

1. `EP01-ACCESO-Y-DESCUBRIMIENTO`: implementación existente y mapas HU-001 a HU-007.
2. `EP02-ADMINISTRACION-Y-PUBLICACION`: administración, construcción y publicación del curso.
3. `EP03-MATRICULAS-Y-ACCESOS`: matrícula gratuita/administrativa y control de accesos.
4. `EP04-AULA-PROGRESO-Y-SESIONES`: consumo académico, progreso y asistencia.
5. EP05 y EP06: pendientes de desarrollar como mapas técnicos específicos.

Todos los mapas nuevos utilizan como referencia única la base ubicada en
`05-BASE-DE-DATOS/BASE-DE-DATOS-DEFINITIVA`. No deben crearse tablas alternativas con nombres
distintos. Las reglas funcionales completas permanecen dentro de cada historia de usuario.

## Convenciones de implementación

- Backend: Spring Boot, Spring Web, Spring Data JPA, Validation, Security y Lombok.
- Frontend: Angular, componentes por funcionalidad, formularios reactivos e interfaces tipadas.
- Los controladores coordinan HTTP; las reglas se ejecutan en servicios transaccionales.
- Los repositorios encapsulan las consultas JPA y las proyecciones de reportes.
- Las entidades no se entregan directamente como cuerpos HTTP.
- Fechas de eventos se guardan como `Instant`; fechas académicas sin hora como `LocalDate`.
- Los errores funcionales deben conservar un código estable y un mensaje entendible.
- No se implementan reglas mediante triggers: los servicios ejecutan y prueban cada transición.
