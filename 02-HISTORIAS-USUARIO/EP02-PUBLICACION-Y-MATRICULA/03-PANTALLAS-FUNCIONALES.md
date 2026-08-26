# EP02 — Pantallas funcionales para la review

## Cantidad

La épica incorpora **8 pantallas principales nuevas**. Su review utiliza además tres pantallas de
EP01: inicio de sesión, catálogo y ficha pública. Por ello, el recorrido completo muestra
aproximadamente **11 pantallas principales**, aunque solo ocho se desarrollan como incremento de
esta épica.

## Pantallas nuevas

### PF-012 — Administración de información base

- **Historias:** HU-009.
- **Actor:** administrador.
- **Debe mostrar:** pestañas para tipos de curso, categorías, docentes públicos, entidades,
  firmantes y tipos de material, con acciones de consulta, creación, edición y activación.
- **Estados importantes:** valor activo, inactivo, repetido o usado por cursos existentes.
- **Acción para la review:** crear o actualizar un valor y seleccionarlo después en un curso.

### PF-013 — Gestión y listado de cursos

- **Historias:** HU-010, HU-015, HU-016 y HU-038 cuando se incorpora EP04.
- **Actor:** administrador.
- **Debe mostrar:** listado, búsqueda, estado, modalidad, acciones para crear, editar, duplicar,
  cerrar matrícula y administrar el ciclo de vida.
- **Estados importantes:** borrador, publicado, iniciado o disponible, cerrado y cancelado cuando
  corresponda.
- **Acción para la review:** crear un curso, abrirlo, duplicarlo y mostrar sus cambios permitidos.

### PF-014 — Editor integral del curso

- **Historias:** HU-010 a HU-016.
- **Actor:** administrador.
- **Debe mostrar mediante secciones:** datos generales, modalidad y fechas, precio y promoción,
  módulos y lecciones, materiales, sesiones, exámenes, requisitos de certificación y validación de
  publicación.
- **Estados importantes:** borrador incompleto, error por modalidad, validaciones pendientes,
  publicación correcta y restricciones posteriores al inicio.
- **Acción para la review:** configurar el curso completo e intentar publicarlo antes y después de
  resolver sus errores.

### PF-015 — Control de matrículas y pagos

- **Historias:** HU-019 y HU-020.
- **Actor:** administrador.
- **Debe mostrar:** filtros, alumno, curso, origen de matrícula, estado de acceso, condición de pago
  y detalle relacionado cuando exista.
- **Estados importantes:** gratuita, pagada, administrativa, exonerada, pendiente, rechazada,
  aprobada, cancelada y casos que exceden capacidad.
- **Acción para la review:** comparar los tres orígenes y realizar una matrícula administrativa.

### PF-016 — Confirmación de matrícula gratuita

- **Historias:** HU-017.
- **Actor:** alumno.
- **Debe mostrar:** curso, gratuidad, disponibilidad y acción explícita para confirmar.
- **Estados importantes:** confirmada, ya matriculado, matrícula cerrada y sin cupos.
- **Acción para la review:** matricular al alumno y dirigirlo a “Mis cursos”.

### PF-017 — Checkout de pago en línea

- **Historias:** HU-018.
- **Actor:** alumno.
- **Debe mostrar:** curso, importe, moneda, promoción vigente y medios habilitados por Culqi.
- **Estados importantes:** procesando, pendiente, rechazado, error recuperable y cupo agotado antes
  de la aprobación.
- **Acción para la review:** ejecutar un rechazo y luego reintentar el pago.

### PF-018 — Resultado del pago y comprobante informativo

- **Historias:** HU-018.
- **Actor:** alumno.
- **Debe mostrar:** resultado, orden, importe, moneda, medio, fecha y hora, alumno, curso y últimos
  dígitos de tarjeta cuando correspondan.
- **Estados importantes:** aprobado con acceso, rechazado o pendiente sin acceso y confirmación
  repetida sin duplicidad.
- **Acción para la review:** mostrar un pago aprobado y su matrícula única.

### PF-019 — Mis cursos

- **Historias:** HU-021.
- **Actor:** alumno.
- **Debe mostrar:** cursos con acceso, modalidad, situación, progreso disponible, condición de
  certificación resumida y acción para ingresar.
- **Estados importantes:** acceso vigente, cerrado con acceso conservado, matrícula individual
  cancelada o vencida y cancelación total con contenido previo conservado.
- **Acción para la review:** comprobar que cada matrícula aparece con el acceso correspondiente.

## Pantallas reutilizadas de EP01

- **PF-003:** ingreso del administrador y de los alumnos.
- **PF-001:** localización del curso publicado.
- **PF-002:** consulta de la ficha y comienzo de la matrícula.

## Elementos que no cuentan como pantallas adicionales

- formulario emergente de matrícula administrativa;
- panel de detalle de pago o matrícula dentro de PF-015;
- confirmaciones de duplicación, cierre o publicación;
- cada pestaña del editor del curso;
- formulario alojado por Culqi dentro del checkout;
- mensajes de correo y alertas de cupo.

## Orden recomendado de presentación

PF-003 → PF-012 → PF-013 → PF-014 → PF-001 → PF-002 → PF-016 → PF-017 → PF-018 → PF-015 →
PF-019.
