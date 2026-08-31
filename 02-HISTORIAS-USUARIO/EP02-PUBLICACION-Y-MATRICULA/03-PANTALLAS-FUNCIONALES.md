# EP02 — Pantallas funcionales para la review

## Cantidad

La épica incorpora **9 pantallas principales nuevas**. Su review reutiliza seis pantallas de EP01:
inicio de sesión, verificación del correo, panel, perfil, catálogo y ficha pública. Por ello, el
recorrido completo puede mostrar aproximadamente **15 pantallas principales**, aunque solo nueve
se desarrollan como incremento de esta épica.

## Pantallas nuevas

### PF-010 — Gestión administrativa de usuarios

- **Historias:** HU-008.
- **Actor:** administrador.
- **Debe mostrar:** búsqueda y listado de usuarios, datos principales, rol, origen y estado de la
  cuenta; permite crear un alumno o administrador y consultar quién concedió el perfil.
- **Jerarquía:** el listado aparece primero y la creación o el detalle se abre en panel. Reenviar
  instrucciones y deshabilitar quedan dentro del detalle y no compiten con “Crear usuario”.
- **Estados importantes:** correo existente sin duplicidad, apellido materno/teléfono/DNI vacíos,
  código de verificación reenviado, CAMBIO_PENDIENTE, cuenta habilitada, correo fallido,
  auto-desactivación bloqueada y último administrador protegido.
- **Acción para la review:** crear una cuenta con `Escuela1415@`, completar código de verificación,
  documentos y contraseña propia, y comprobar su habilitación.

### PF-012 — Administración de información base

- **Historias:** HU-009.
- **Actor:** administrador.
- **Debe mostrar:** selector de sección para tipos de curso, categorías, docentes públicos,
  entidades, firmantes y tipos de material; solo un listado visible, con creación o edición en
  panel. En escritorio puede representarse como pestañas cuando quepan sin comprimirse.
- **Estados importantes:** valor activo, inactivo, repetido o usado por cursos existentes.
- **Acción para la review:** crear o actualizar un valor y seleccionarlo después en un curso.

### PF-013 — Gestión y listado de cursos

- **Historias:** HU-010, HU-015, HU-016 y HU-038 cuando se incorpora EP04.
- **Actor:** administrador.
- **Debe mostrar:** listado, búsqueda, estado, modalidad, acciones para crear, editar, duplicar,
  cerrar matrícula y administrar el ciclo de vida.
- **Jerarquía:** “Crear curso” es primaria; editar abre el curso y las demás acciones se muestran en
  un menú únicamente cuando el estado las permite.
- **Estados importantes:** borrador, publicado, iniciado o disponible, cerrado y cancelado cuando
  corresponda.
- **Acción para la review:** crear un curso, abrirlo, duplicarlo y mostrar sus cambios permitidos.

### PF-014 — Editor integral del curso

- **Historias:** HU-010 a HU-016.
- **Actor:** administrador.
- **Debe mostrar mediante secciones:** datos generales, modalidad y fechas, precio y promoción,
  módulos y lecciones, materiales, sesiones, exámenes, requisitos de certificación y validación de
  publicación.
- **Jerarquía:** pestañas Información, Contenido, Sesiones, Exámenes, Certificación y Publicación,
  con una sola visible. Cada una permite “Guardar y continuar”; las validaciones completas y
  “Publicar” se concentran en Publicación.
- **Editor de exámenes:** tipo CALIFICADO/PRACTICA, cuatro tipos de pregunta, opciones y respuestas,
  puntajes, tiempo, barajado, publicación de respuestas, intentos —solo CALIFICADO—,
  `dias_revision` y bloqueo de secuencia. PRACTICA siempre se muestra ilimitado.
- **Estados importantes:** borrador incompleto, error por modalidad, validaciones pendientes,
  publicación correcta y restricciones posteriores al inicio.
- **Acción para la review:** configurar el curso completo e intentar publicarlo antes y después de
  resolver sus errores.

### PF-015 — Control de matrículas y pagos

- **Historias:** HU-019 y HU-020.
- **Actor:** administrador.
- **Debe mostrar:** filtros, alumno, curso, origen de matrícula, estado de acceso, condición de pago
  y detalle relacionado cuando exista.
- **Jerarquía:** listado y búsqueda primero; al seleccionar se muestra un resumen de Alumno,
  Matrícula y Pago, con Pagos e Historial desplegables. Las excepciones no aparecen en todas las filas.
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
- **Acción para la review:** ejecutar un rechazo y luego reintentar; mostrar que PENDIENTE espera a
  Culqi y no ofrece un segundo intento.

### PF-018 — Resultado del pago y comprobante informativo

- **Historias:** HU-018.
- **Actor:** alumno.
- **Debe mostrar:** resultado, orden, importe, moneda, medio, fecha y hora, alumno, curso y últimos
  dígitos de tarjeta cuando correspondan.
- **Estados importantes:** aprobado con acceso, rechazado o pendiente sin acceso y confirmación
  repetida sin duplicidad; APROBADO tardío tras cierre/cupo y APROBADO sin acceso tras cancelación.
- **Acción para la review:** mostrar un pago aprobado y su matrícula única.

### PF-019 — Mis cursos

- **Historias:** HU-021.
- **Actor:** alumno.
- **Debe mostrar:** cursos con acceso, modalidad, situación, progreso disponible, condición de
  certificación resumida y acción para ingresar.
- **Jerarquía:** pestañas En progreso y Completados; cada tarjeta muestra solo la acción que
  corresponde a su estado, sin reutilizar filtros del catálogo.
- **Estados importantes:** acceso vigente, cerrado con acceso conservado, matrícula individual
  cancelada o vencida y cancelación total con contenido previo conservado.
- **Acción para la review:** comprobar que cada matrícula aparece con el acceso correspondiente.

## Pantallas reutilizadas de EP01

- **PF-003:** ingreso del administrador y de los alumnos.
- **PF-005:** ingreso y reenvío del código de verificación.
- **PF-008:** aviso y acceso restringido de la cuenta temporal.
- **PF-009:** aceptación pendiente y definición de la contraseña propia.
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

PF-003 → PF-010 → PF-005 → PF-008 → PF-009 → PF-012 → PF-013 → PF-014 → PF-001 → PF-002 →
PF-016 → PF-017 → PF-018 → PF-015 → PF-019.
