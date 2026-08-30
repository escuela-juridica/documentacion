# EP04 — Pantallas funcionales para la review

## Cantidad

La épica incorpora **12 pantallas principales nuevas**. La presentación final reutiliza cuatro
pantallas anteriores para enlazar el recorrido: inicio de sesión, gestión de cursos, “Mis cursos”
y aula. En total pueden mostrarse aproximadamente **16 pantallas principales**.

## Pantallas nuevas

### PF-029 — Estado de certificación y confirmación de datos

- **Historias:** HU-032.
- **Actor:** alumno.
- **Debe mostrar:** progreso frente a requisitos, datos personales que serán certificados, estado
  y fecha prevista cuando exista espera.
- **Jerarquía:** estado y siguiente paso primero; datos, promedio y fecha aparecen solo cuando
  aplican. Existe una sola acción principal para cada estado.
- **Estados importantes:** requisitos pendientes, datos pendientes, programado, listo para emitir
  y advertencia previa a la generación.
- **Acción para la review:** completar datos, revisar condiciones y emitir cuando corresponda.

### PF-030 — Mis certificados

- **Historias:** HU-033.
- **Actor:** alumno.
- **Debe mostrar:** certificados obtenidos, curso, nivel, fecha y estado.
- **Estados importantes:** sin certificados, vigente y anulado.
- **Acción para la review:** seleccionar un certificado vigente.

### PF-031 — Visor privado y descarga del certificado

- **Historias:** HU-033.
- **Actor:** alumno.
- **Debe mostrar:** documento emitido, código, QR y acción de descarga.
- **Estados importantes:** vigente, anulado, enlace privado inválido o sesión no autorizada.
- **Acción para la review:** visualizar, descargar y abrir el QR.

### PF-032 — Verificación pública del certificado

- **Historias:** HU-034 y HU-036.
- **Actor:** verificador externo.
- **Debe mostrar:** consulta por código y datos mínimos de validación.
- **Estados importantes:** vigente, anulado, inexistente o código inválido.
- **Acción para la review:** verificar un certificado vigente y otro anulado.

### PF-033 — Gestión administrativa de certificados

- **Historias:** HU-035, HU-036 y HU-044.
- **Actor:** administrador.
- **Debe mostrar:** listado, filtros, alumno, curso, nivel, fecha, estado y acceso al detalle.
- **Jerarquía:** búsqueda/listado primero; trazabilidad y operaciones aparecen al abrir el registro.
- **Estados importantes:** pendiente, programado, vigente, anulado y sin resultados.
- **Acción para la review:** localizar un certificado y abrir su operación administrativa.

### PF-034 — Emisión, detalle, corrección y anulación

- **Historias:** HU-032, HU-035 y HU-036.
- **Actor:** administrador.
- **Debe mostrar:** requisitos, datos congelados, nivel calculado, historial, motivos y acciones
  permitidas.
- **Jerarquía:** resumen y estado, luego pestañas Detalle, Versiones e Historial. Solo se muestran
  las acciones válidas; emitir, corregir y anular nunca compiten simultáneamente.
- **Estados importantes:** emisión manual, corrección con conservación histórica, anulación y
  acción bloqueada.
- **Acción para la review:** emitir uno, corregir otro y anular un tercero.

### PF-035 — Excepciones de matrículas y pagos

- **Historias:** HU-037.
- **Actor:** administrador.
- **Debe mostrar:** casos contradictorios o tardíos, pago, matrícula, cupo, acceso, historial y
  justificación de resolución.
- **Jerarquía:** resultado final explicado primero; Pago, Matrícula, Acceso/cupo e Historial se
  abren como detalles, evitando tres columnas simultáneas.
- **Estados importantes:** confirmación repetida, aprobación tardía, curso cancelado, exceso de
  capacidad y caso resuelto.
- **Acción para la review:** resolver sin duplicar pago, matrícula o cupo.

### PF-036 — Formulario público de queja o reclamo

- **Historias:** HU-039.
- **Actor:** visitante.
- **Debe mostrar:** tipo y número de documento, nombres, apellidos, correo, celular, dirección,
  importe, producto o servicio, hecho, solución solicitada, imágenes, declaración y autorización.
- **Jerarquía:** cuatro pasos: Persona, Servicio, Detalle/evidencias y Revisión/declaraciones. Volver
  conserva datos y “Presentar” aparece únicamente al final.
- **Estados importantes:** queja, reclamo, archivos inválidos, datos faltantes y constancia enviada.
- **Acción para la review:** registrar el caso y obtener correlativo y fecha máxima de respuesta.

### PF-037 — Bandeja administrativa de quejas y reclamos

- **Historias:** HU-040.
- **Actor:** administrador.
- **Debe mostrar:** búsqueda, filtros, orden por vencimiento, tipo, correlativo, fecha máxima y
  estado.
- **Estados importantes:** pendiente, próximo a vencer, vencido, respondido y bandeja vacía.
- **Acción para la review:** localizar el caso de mayor urgencia.

### PF-038 — Detalle y respuesta de la queja o reclamo

- **Historias:** HU-040.
- **Actor:** administrador.
- **Debe mostrar:** información presentada, imágenes, plazo, respuesta institucional y resultado
  del correo.
- **Jerarquía:** editor de respuesta como contenido principal; expediente, evidencias e historial
  se consultan bajo demanda.
- **Estados importantes:** pendiente, envío fallido, respondido e intento de modificar una
  respuesta ya entregada.
- **Acción para la review:** responder, simular un fallo y completar el envío correcto.

### PF-039 — Centro de reportes

- **Historias:** HU-041 a HU-045.
- **Actor:** administrador.
- **Debe mostrar:** matrículas, pagos, seguimiento académico, certificados y asistencia como cinco
  secciones, pero solo una visible a la vez; filtros frecuentes arriba, adicionales en “Más
  filtros”, resultados y exportación secundaria.
- **Estados importantes:** con datos, sin datos, filtros aplicados y cálculo de asistencia sobre
  sesiones elegibles.
- **Acción para la review:** recorrer las cinco pestañas y comparar información relacionada.

### PF-040 — Dashboard administrativo

- **Historias:** HU-046.
- **Actor:** administrador.
- **Debe mostrar:** exactamente cuatro gráficos con filtros comunes: evolución de matrículas,
  matrículas por curso, forma de ingreso y pagos confirmados por periodo.
- **Estados importantes:** con información, sin datos y filtro sin resultados.
- **Acción para la review:** comparar un gráfico con el reporte de matrículas.
- **Límite visible:** no muestra tarjetas de indicadores, pendientes, tareas ni alertas operativas.

## Pantallas reutilizadas

- **PF-003:** ingreso del alumno y del administrador.
- **PF-019:** acceso del alumno desde “Mis cursos”.
- **PF-020:** origen de la situación de cumplimiento y acceso a certificación.
- **PF-013:** origen de la cancelación completa de un curso; la confirmación no cuenta como otra
  pantalla.

## Elementos que no cuentan como pantallas adicionales

- advertencia anterior a emitir el certificado;
- formulario emergente de cancelación completa;
- confirmación de emisión, corrección o anulación;
- constancia posterior al registro de la queja o reclamo;
- cada pestaña del centro de reportes;
- cada gráfico del dashboard;
- mensajes de envío o reenvío de correo.

## Orden recomendado de presentación

PF-003 → PF-019 → PF-020 → PF-029 → PF-030 → PF-031 → PF-032 → PF-033 → PF-034 → PF-035 →
PF-013 → PF-036 → PF-037 → PF-038 → PF-039 → PF-040.
