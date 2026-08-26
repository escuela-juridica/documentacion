# EP03 — Pantallas funcionales para la review

## Cantidad

La épica incorpora **9 pantallas principales nuevas**. Reutiliza inicio de sesión y “Mis cursos”
de las épicas anteriores. El recorrido integrado muestra aproximadamente **11 pantallas
principales**.

## Pantallas nuevas

### PF-020 — Aula y ruta del curso

- **Historias:** HU-022, HU-024 y HU-025.
- **Actor:** alumno.
- **Debe mostrar:** módulos, lecciones, porcentajes, última posición, requisitos aplicables,
  bloqueos y acciones para continuar.
- **Estados importantes:** sin avance, en progreso, completo, evaluación bloqueante y curso
  cerrado con acceso conservado.
- **Acción para la review:** entrar, avanzar, salir y retomar la última posición.

### PF-021 — Reproductor de lección y materiales

- **Historias:** HU-023 y HU-024.
- **Actor:** alumno.
- **Debe mostrar:** video subido o enlazado, materiales, permisos de descarga, avance del video y
  navegación anterior/siguiente.
- **Estados importantes:** video bajo el umbral, video completado, lección solo con material,
  contenido bloqueado y grabación no disponible.
- **Acción para la review:** completar un video y una lección manual sin video.

### PF-022 — Calendario y sesiones del alumno

- **Historias:** HU-026 y HU-027.
- **Actor:** alumno.
- **Debe mostrar:** sesiones próximas y pasadas, fecha, horario, enlace habilitado, asistencia,
  porcentaje y grabación disponible o pendiente.
- **Estados importantes:** programada, reprogramada, cancelada, finalizada con grabación pendiente
  y no elegible para asistencia.
- **Acción para la review:** consultar una sesión, su cambio y el nuevo cálculo de asistencia.

### PF-023 — Resolución del examen

- **Historias:** HU-028 y HU-029.
- **Actor:** alumno.
- **Debe mostrar:** instrucciones, intento disponible, temporizador, preguntas, navegación, marca
  para revisión y confirmación de entrega.
- **Estados importantes:** no habilitado, tiempo agotado, intento agotado, selección única,
  múltiple, verdadero/falso y respuesta abierta.
- **Acción para la review:** resolver y entregar un examen con preguntas automáticas y abiertas.

### PF-024 — Resultado e intentos del examen

- **Historias:** HU-028 y HU-029.
- **Actor:** alumno.
- **Debe mostrar:** nota, mejor intento, aprobación, intentos consumidos y respuestas correctas solo
  cuando la política lo permita.
- **Estados importantes:** aprobado, desaprobado con reintento, intentos agotados, pendiente de
  revisión humana y resultado actualizado.
- **Acción para la review:** comparar resultado automático y respuesta pendiente de calificar.

### PF-025 — Gestión de sesiones y asistencia

- **Historias:** HU-026 y HU-027.
- **Actor:** administrador.
- **Debe mostrar:** sesiones, alumnos elegibles, asistencia, datos anteriores y nuevos, motivo de
  reprogramación o cancelación y situación de la grabación.
- **Estados importantes:** cambio notificado, correo fallido, cancelación y sesión fuera de la
  fecha final del curso.
- **Acción para la review:** corregir asistencia y reprogramar o cancelar una sesión.

### PF-026 — Cola de respuestas abiertas

- **Historias:** HU-030.
- **Actor:** administrador.
- **Debe mostrar:** entregas pendientes ordenadas por fecha máxima, curso, examen, alumno y estado.
- **Estados importantes:** dentro de plazo, próximo a vencer, vencido y sin pendientes.
- **Acción para la review:** filtrar y seleccionar la respuesta más urgente.

### PF-027 — Revisión y calificación de respuestas

- **Historias:** HU-030.
- **Actor:** administrador.
- **Debe mostrar:** pregunta, respuesta del alumno, puntaje máximo, puntaje asignado,
  retroalimentación, plazo y acción para confirmar.
- **Estados importantes:** pendiente, calificada, puntaje inválido y correo fallido con reenvío.
- **Acción para la review:** calificar y comprobar el resultado del alumno.

### PF-028 — Gestión de excepciones académicas

- **Historias:** HU-031.
- **Actor:** administrador.
- **Debe mostrar:** alumno, curso, situación académica, tipo de excepción, justificación e historial.
- **Estados importantes:** corrección de asistencia, intento adicional, certificado ya emitido y
  operación no permitida.
- **Acción para la review:** conceder una excepción válida y demostrar sus límites.

## Pantallas reutilizadas

- **PF-003:** ingreso del alumno y del administrador.
- **PF-019:** selección del curso desde “Mis cursos”.

## Distribución entre las dos reviews

- **Mes 3:** PF-003 → PF-019 → PF-020 → PF-021.
- **Mes 4:** PF-022 → PF-023 → PF-024 → PF-025 → PF-026 → PF-027 → PF-028.

## Elementos que no cuentan como pantallas adicionales

- panel lateral del temario dentro del aula;
- confirmación manual de una lección sin video;
- diálogo de entrega del examen;
- cada tipo de pregunta;
- formulario emergente de reprogramación o excepción;
- alertas por vencimiento o bloqueos académicos.
