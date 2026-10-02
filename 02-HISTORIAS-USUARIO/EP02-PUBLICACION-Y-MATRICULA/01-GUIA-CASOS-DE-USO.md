# EP02 — Guía para generar el diagrama de casos de uso

## Objetivo para la IA diagramadora

Generar el diagrama UML de la épica con estética clásica **Rational Rose**. Debe mostrar cómo
administración prepara la oferta y cómo el alumno obtiene una matrícula, sin describir componentes
de software.

## Estilo

- Fondo blanco, líneas y texto negros.
- Rectángulo titulado `ESEJUR — Publicación y matrícula`.
- Actores de palo fuera; elipses dentro.
- Relaciones `<<include>>` y `<<extend>>` en notación UML.
- Orientación horizontal y separación suficiente para Word.
- No incluir tablas, API, base de datos, webhook, frontend o backend.

## Actores

### Primarios

- `Administrador`
- `Alumno`

### Secundarios

- `Servicio de correo`

## Casos de uso

- Administrar datos maestros.
- Gestionar usuarios.
- Crear cuenta administrativamente.
- Conceder un rol faltante sin cambiar el rol principal.
- Completar habilitación de cuenta temporal.
- Crear y configurar curso.
- Organizar módulos, lecciones y materiales.
- Reutilizar módulos existentes.
- Programar sesiones en vivo.
- Configurar exámenes.
- Configurar requisitos de certificación.
- Validar curso.
- Publicar curso.
- Administrar ciclo de vida.
- Duplicar curso como nueva convocatoria.
- Matricularse gratis.
- Registrar pago manual o exoneración dentro de una matrícula administrativa.
- Matricular alumno administrativamente.
- Consultar matrículas y pagos.
- Consultar mis cursos.

## Asociaciones y relaciones

- Administrador se asocia con la gestión de usuarios y con todos los casos de configuración,
  validación, publicación, ciclo de vida, matrícula administrativa y consulta operativa.
- Alumno se asocia con completar la habilitación de su cuenta temporal.
- Alumno se asocia con matrícula gratuita y “Mis cursos”.
- Servicio de correo se asocia con verificación de cuenta, instrucciones de habilitación,
  confirmación de matrícula y pago no completado.
- `Gestionar usuarios` incluye `Crear cuenta administrativamente`.
- `Crear cuenta administrativamente` incluye `Completar habilitación de cuenta temporal`.
- `Publicar curso` incluye `Validar curso`.
- `Crear y configurar curso` incluye organizar contenido, configurar sesiones cuando aplique,
  configurar exámenes cuando aplique y configurar certificación.
- `Reutilizar módulos` extiende `Organizar módulos, lecciones y materiales`.
- Los tres caminos de matrícula incluyen la activación de la matrícula cuando cumplen sus reglas.
- `Matricular alumno administrativamente` utiliza una cuenta que ya posee rol Alumno; si no existe,
  el administrador debe resolverla antes mediante `Gestionar usuarios`.

## Restricciones visuales y conceptuales

- No dibujar una reserva de cupo: no existe.
- No mostrar checkout ni procesamiento automático: la integración con Culqi pertenece a HU-047 de EP04.
- No mostrar devolución automática ni comprobante SUNAT.
- No convertir estados de pago en actores.
- No representar la cancelación completa del curso como capacidad entregada en EP02; pertenece a
  HU-038. El ciclo de vida de esta épica termina en CERRADO.

## Prompt listo para otra IA

> Genera un diagrama UML de casos de uso horizontal, blanco y negro, estilo Rational Rose, para
> “ESEJUR — Publicación y matrícula”. Coloca Administrador y Alumno a la izquierda y Servicio de
> correo a la derecha. Usa el rectángulo del sistema, actores de palo, elipses y
> relaciones UML include/extend. Respeta exactamente los casos y restricciones de este archivo.
