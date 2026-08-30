# EP03 — Entregable funcional para la review

## Producto funcional obtenido

Al finalizar la épica queda operativa el **aula virtual académica de ESEJUR**. El alumno puede
consumir el contenido, conservar su avance, participar en sesiones, resolver evaluaciones y
conocer su situación académica; administración puede atender calificaciones y excepciones.

El recorrido que resume el valor entregado es:

> Un alumno entra a un curso matriculado, completa su ruta de aprendizaje, participa en las
> actividades aplicables, rinde sus evaluaciones y obtiene resultados académicos verificables.

## Historias incluidas

| Historia | Capacidad que aporta al entregable |
|---|---|
| HU-022 | Entrada y continuidad del curso |
| HU-023 | Consulta protegida de materiales |
| HU-024 | Finalización de lecciones y cálculo del progreso |
| HU-025 | Navegación por la ruta académica |
| HU-026 | Participación y asistencia en sesiones en vivo |
| HU-027 | Reprogramación y cancelación de sesiones |
| HU-028 | Examen de calificación automática |
| HU-029 | Examen con respuestas abiertas |
| HU-030 | Revisión y calificación de respuestas abiertas |
| HU-031 | Excepciones académicas justificadas |

## Objetivo de la review

Demostrar que el acceso obtenido en la EP02 se transforma en aprendizaje medible. La review debe
recorrer contenido, progreso, secuencia, asistencia y evaluación, mostrando tanto la experiencia
del alumno como el control de administración.

## Presentación en el ciclo de cinco meses

Por su tamaño, esta épica puede presentarse en dos reviews sin dividir su producto final:

- **Review del mes 3:** ingreso, materiales, finalización de lecciones, progreso y ruta académica.
- **Review del mes 4:** sesiones, asistencia, exámenes, calificación abierta y excepciones.

El entregable de la épica se acepta al concluir ambas partes y demostrar su integración.

## Actores de la demostración

- **Alumno:** aprende, participa y rinde evaluaciones.
- **Administrador:** modifica sesiones, califica respuestas y atiende excepciones.
- **Servicio de correo:** comunica cambios de sesiones y resultados de revisión.

## Preparación previa

Antes de comenzar deben existir:

- un alumno con matrícula y acceso vigentes;
- un curso virtual con videos subidos, videos enlazados y lecciones solo con materiales;
- un curso en vivo o híbrido con sesiones elegibles para asistencia;
- un examen automático con más de un tipo de pregunta;
- un examen con al menos una respuesta abierta;
- requisitos académicos conocidos para comparar avance real y meta;
- cuentas diferenciadas de alumno y administrador.

## Guion principal de demostración

### 1. Ingresar y continuar el curso

1. Abrir “Mis cursos” e ingresar a un curso habilitado.
2. Mostrar la estructura de módulos y lecciones.
3. Abrir una lección, salir del curso y volver a ingresar.
4. Utilizar la acción de continuar.

**Resultado esperado:** el alumno retoma la última posición válida y conserva su historial de
avance.

### 2. Consultar materiales protegidos

1. Abrir archivos, enlaces, videos y otros materiales de una lección.
2. Descargar únicamente un material que tenga permiso de descarga.
3. Intentar acceder a un recurso mediante una cuenta sin matrícula o con acceso individual
   cancelado.

**Resultado esperado:** el alumno autorizado consulta el contenido y cada material respeta su
permiso de descarga; el acceso protegido no se vuelve público.

### 3. Completar lecciones y calcular progreso

1. Reproducir un video detectable sin alcanzar el porcentaje requerido.
2. Mostrar que la lección todavía no se completa.
3. Alcanzar el umbral del video y comprobar la finalización.
4. Completar manualmente una lección de solo material mediante la acción disponible, como
   “Siguiente”, “Completar lección” en la última o una marca de completado pendiente; comprobar que
   un check automático o manual ya completado no puede desmarcarse.
5. Mostrar el cálculo `lecciones completadas / lecciones consideradas × 100`.

**Resultado esperado:** cada tipo de lección se completa de forma comprensible y el progreso se
conserva sin cambiar su denominador de manera inesperada.

### 4. Avanzar por la ruta académica

1. Navegar entre módulos mediante lista, acción “Siguiente” u otra interacción equivalente.
2. Mostrar una evaluación que bloquea el avance hasta aprobarse.
3. Comparar avance actual, meta requerida y acción necesaria.
4. Comprobar que todos los bloqueos configurados deben cumplirse.

**Resultado esperado:** el alumno entiende qué puede abrir, qué está pendiente y por qué no puede
continuar cuando existe una condición académica.

### 5. Participar en una sesión en vivo

1. Consultar calendario, fecha y horario; mostrar la tarjeta antes de la ventana con botón
   deshabilitado y sin exponer el enlace.
2. Dentro de la ventana, habilitar el enlace e ingresar a la sesión.
3. Registrar o ajustar la asistencia de acuerdo con la operación establecida.
4. Mostrar el porcentaje `sesiones asistidas / sesiones elegibles × 100`.
5. Consultar una sesión finalizada cuya grabación aún está pendiente y otra que ya la tiene.
6. Comprobar que la asistencia completa la lección EN_VIVO al terminar; para el ausente, la
   grabación completa por umbral detectable o por acción manual según su fuente.

**Resultado esperado:** el alumno conoce sus sesiones y su asistencia real; las sesiones
canceladas o no elegibles no perjudican el cálculo.

### 6. Reprogramar o cancelar una sesión

1. Desde administración, cambiar fecha u horario indicando el motivo.
2. Mostrar los datos anteriores y nuevos y el aviso enviado al alumno.
3. Reprogramar una sesión más allá del fin actual y comprobar el ajuste correspondiente.
4. Cancelar otra sesión y mostrar la advertencia para revisar horas y fecha final del curso.

**Resultado esperado:** el alumno recibe información clara, la sesión conserva su historial y los
cálculos académicos pendientes utilizan la programación vigente.

### 7. Rendir un examen automático

1. Abrir el examen cuando su modalidad, fecha y secuencia lo habiliten.
2. Responder selección única, selección múltiple o verdadero/falso.
3. Mostrar temporizador, navegación, marcado para revisión y entrega.
4. Obtener la calificación automática sobre veinte.
5. Consultar respuestas correctas según la política configurada.
6. Realizar otro intento y conservar la mejor nota cuando esté permitido.

**Resultado esperado:** el examen se califica sin intervención administrativa, no concede puntaje
parcial indebido y respeta tiempo, intentos y política de resultados.

### 8. Rendir y calificar respuestas abiertas

1. El alumno responde una pregunta abierta y entrega el examen.
2. Mostrar el estado pendiente de revisión y la fecha máxima de calificación.
3. Ingresar como administrador y consultar la cola ordenada por vencimiento.
4. Asignar puntaje y retroalimentación.
5. Volver como alumno para consultar la calificación y el aviso correspondiente.

**Resultado esperado:** ninguna respuesta abierta se aprueba automáticamente; la revisión humana
queda registrada y se realiza dentro del plazo configurado.

### 9. Atender una excepción académica

1. Seleccionar una matrícula y registrar una justificación.
2. Corregir asistencia o conceder un intento adicional, según el caso.
3. Comprobar el nuevo resultado en la experiencia del alumno.
4. Mostrar que la excepción no permite editar directamente progreso, nota o certificado.

**Resultado esperado:** administración resuelve casos justificados sin destruir el historial ni
evadir las reglas académicas.

## Comprobaciones alternativas durante la review

- Impedir acceso académico a una matrícula individual cancelada o vencida.
- Mantener para alumnos previamente habilitados el contenido ya disponible cuando se cancela todo
  el curso en modo lectura, excepto enlaces de futuras reuniones y sin nuevos checks, progreso,
  intentos, asistencia ni finalización.
- No completar un video si no alcanza el umbral requerido.
- Entregar automáticamente al vencer el tiempo y asignar cero a respuestas no contestadas.
- Impedir intentos calificables adicionales después de emitido el certificado.
- Mostrar avisos persistentes de respuestas abiertas próximas a vencer o vencidas.
- Mantener el resultado académico aunque falle el correo y permitir su reenvío.

## Evidencias que deben conservarse

- avance antes y después de completar cada tipo de lección;
- cálculo visible de progreso y asistencia;
- recorrido de una sesión y evidencia de reprogramación;
- intentos y resultado del examen automático;
- entrega, cola de revisión y calificación de la respuesta abierta;
- excepción académica con motivo e historial;
- lista de historias aceptadas y observaciones de ambas reviews.

## Criterios para aceptar el entregable

- Las diez historias incluidas cumplen sus criterios de aceptación.
- El alumno puede retomar su aprendizaje sin perder avance.
- Materiales y videos respetan acceso y descarga.
- Progreso, asistencia y notas utilizan las fórmulas y umbrales configurados.
- Los cursos que no requieren examen, asistencia o progreso no quedan bloqueados por ellos.
- La evaluación automática funciona sin revisión humana cuando no hay respuestas abiertas.
- Toda respuesta abierta recibe revisión humana y una fecha máxima de calificación.
- Las excepciones quedan justificadas y no alteran directamente resultados protegidos.

## Límite del entregable

Esta épica puede dejar al alumno con todos los requisitos académicos cumplidos, pero todavía no
emite el certificado. La emisión, descarga, verificación, corrección y anulación corresponden a la
EP04.

## Mensaje de cierre de la review

> ESEJUR ya funciona como aula virtual: el alumno consume contenido, conserva su avance,
> participa, rinde evaluaciones y obtiene resultados académicos controlados por la escuela.
