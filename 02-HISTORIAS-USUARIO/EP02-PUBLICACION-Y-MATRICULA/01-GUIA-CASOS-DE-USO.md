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

- `Culqi`
- `Servicio de correo`

## Casos de uso

- Administrar datos maestros.
- Gestionar usuarios.
- Crear cuenta administrativamente.
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
- Pagar matrícula en línea.
- Reintentar pago no completado.
- Matricular alumno administrativamente.
- Consultar matrículas y pagos.
- Consultar mis cursos.
- Emitir constancia de pago.

## Asociaciones y relaciones

- Administrador se asocia con la gestión de usuarios y con todos los casos de configuración,
  validación, publicación, ciclo de vida, matrícula administrativa y consulta operativa.
- Alumno se asocia con completar la habilitación de su cuenta temporal.
- Alumno se asocia con matrícula gratuita, pago, reintento, constancia y “Mis cursos”.
- Culqi se asocia con pagar y reintentar pago.
- Servicio de correo se asocia con verificación de cuenta, instrucciones de habilitación,
  confirmación de matrícula y pago no completado.
- `Gestionar usuarios` incluye `Crear cuenta administrativamente`.
- `Crear cuenta administrativamente` incluye `Completar habilitación de cuenta temporal`.
- `Publicar curso` incluye `Validar curso`.
- `Crear y configurar curso` incluye organizar contenido, configurar sesiones cuando aplique,
  configurar exámenes cuando aplique y configurar certificación.
- `Reutilizar módulos` extiende `Organizar módulos, lecciones y materiales`.
- `Reintentar pago` extiende `Pagar matrícula en línea`.
- `Pagar matrícula en línea` incluye `Emitir constancia` solo si el resultado es APROBADO.
- Los tres caminos de matrícula incluyen la activación de la matrícula cuando cumplen sus reglas.

## Restricciones visuales y conceptuales

- No dibujar una reserva de cupo: no existe.
- No mostrar a ESEJUR procesando el pago; Culqi es el actor externo que comunica el resultado.
- No mostrar devolución automática ni comprobante SUNAT.
- No convertir estados de pago en actores.

## Prompt listo para otra IA

> Genera un diagrama UML de casos de uso horizontal, blanco y negro, estilo Rational Rose, para
> “ESEJUR — Publicación y matrícula”. Coloca Administrador y Alumno a la izquierda; Culqi y
> Servicio de correo a la derecha. Usa el rectángulo del sistema, actores de palo, elipses y
> relaciones UML include/extend. Respeta exactamente los casos y restricciones de este archivo.
