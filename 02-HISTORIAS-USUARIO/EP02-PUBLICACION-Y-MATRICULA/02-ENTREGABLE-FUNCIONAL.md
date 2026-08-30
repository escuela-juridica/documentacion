# EP02 — Entregable funcional para la review

## Producto funcional obtenido

Al finalizar la épica queda operativo el **flujo de publicación, comercialización y matrícula de
cursos de ESEJUR**. La escuela puede construir una oferta académica y un alumno puede adquirir el
acceso mediante gratuidad, pago automático con Culqi o matrícula administrativa.

El recorrido que resume el valor entregado es:

> Administración configura y publica un curso; un alumno lo encuentra, se matricula por el flujo
> correspondiente y lo ve habilitado en “Mis cursos”.

## Historias incluidas

| Historia | Capacidad que aporta al entregable |
|---|---|
| HU-009 | Administración de información base |
| HU-010 | Creación y configuración de cursos |
| HU-011 | Organización de módulos, lecciones y materiales |
| HU-012 | Programación de sesiones en vivo |
| HU-013 | Configuración de exámenes |
| HU-014 | Requisitos académicos y de certificación |
| HU-015 | Validación y publicación |
| HU-016 | Ciclo de vida, duplicación y cierre del curso |
| HU-017 | Matrícula gratuita |
| HU-018 | Matrícula con pago automático en línea |
| HU-019 | Matrícula realizada por administración |
| HU-020 | Consulta y control de matrículas y pagos |
| HU-021 | Consulta de cursos y accesos del alumno |

## Objetivo de la review

Demostrar la continuidad entre configuración, publicación, matrícula y acceso. No basta con
mostrar un curso guardado ni una respuesta aislada de pago: el curso publicado debe ser adquirido
por un alumno y aparecer correctamente en su espacio personal.

## Actores de la demostración

- **Administrador:** configura, publica y controla el curso.
- **Alumno:** realiza la matrícula y consulta su acceso.
- **Culqi:** procesa el pago e informa el resultado; ESEJUR no procesa operaciones bancarias.
- **Servicio de correo:** comunica las matrículas confirmadas.

## Preparación previa

Antes de comenzar deben existir:

- un administrador autenticado;
- tres alumnos de prueba: uno para matrícula gratuita, uno para pago y uno para matrícula
  administrativa;
- información base disponible o datos preparados para crearla durante la demostración;
- credenciales de prueba de Culqi y medios de prueba aprobados y rechazados;
- un curso borrador incompleto para mostrar validaciones;
- cupos controlados para demostrar disponibilidad y ausencia de reserva.

## Guion principal de demostración

### 1. Administrar la información base

1. Consultar tipos de curso, categorías, entidades, firmantes y tipos de material.
2. Crear o actualizar un valor que pueda seleccionarse posteriormente en un curso.
3. Comprobar que la información base se reutiliza sin tener que escribirla nuevamente.

**Resultado esperado:** administración dispone de opciones consistentes para configurar cursos.

### 2. Crear y configurar un curso

1. Crear un curso e indicar su información pública, modalidad, precio, promoción y capacidad.
2. Mostrar las diferencias entre `VIRTUAL`, `EN_VIVO` e `HIBRIDO`.
3. Comprobar que un curso virtual no exige fecha de fin ni permite seleccionar asistencia.
4. Configurar fechas y cierre de matrícula cuando la modalidad lo requiera.

**Resultado esperado:** el curso conserva una configuración coherente con su modalidad y no
permite combinaciones inválidas.

### 3. Organizar módulos, lecciones y materiales

1. Crear módulos y ordenar sus lecciones mediante una interacción intuitiva.
2. Incorporar un video subido, un video enlazado y una lección compuesta solo por material.
3. Mostrar la duración detectada cuando se sube un video y la duración opcional del enlazado.
4. Configurar vista previa y permiso de descarga por material.
5. Reutilizar un módulo de otro curso y demostrar que la copia queda independiente.

**Resultado esperado:** el administrador puede publicar contenido con rapidez sin perder control
sobre orden, progreso, protección o duración.

### 4. Programar sesiones y exámenes aplicables

1. Para un curso en vivo o híbrido, registrar fecha, hora de inicio, hora de fin y enlace de una
   sesión.
2. Mostrar el estado pendiente de grabación y la ausencia de integración automática con Zoom.
3. Crear un examen calificable automático y otro con respuesta abierta.
4. Configurar intentos, tiempo, nota aprobatoria, visualización de respuestas y plazo de revisión.

**Resultado esperado:** el curso contiene las actividades requeridas por su modalidad sin obligar
a todos los cursos a usar examen, asistencia o progreso como requisito de certificación.

### 5. Configurar requisitos de certificación

1. Activar o desactivar examen, asistencia y progreso según corresponda.
2. Mostrar valores iniciales lógicos y sus rangos permitidos.
3. Configurar los umbrales Normal y Refrendado; comprobar que el nivel se deriva de la nota y no se
   selecciona manualmente por alumno.
4. Confirmar que el progreso continúa visible aunque no sea requisito de certificación.

**Resultado esperado:** la escuela define reglas flexibles y verificables para completar el curso.

### 6. Validar y publicar

1. Intentar publicar el borrador incompleto.
2. Mostrar todos los datos o relaciones pendientes de corregir.
3. Completar la configuración y publicar nuevamente.
4. Consultar el curso publicado desde el catálogo público.

**Resultado esperado:** solo se publica un curso coherente, completo y disponible según sus fechas.

### 7. Realizar una matrícula gratuita

1. Ingresar con el primer alumno y seleccionar el curso gratuito.
2. Confirmar la matrícula.
3. Mostrar el acceso en “Mis cursos” y el correo correspondiente.

**Resultado esperado:** se crea la matrícula y el acceso sin crear un registro de pago ficticio.

### 8. Realizar una matrícula pagada

1. Ingresar con el segundo alumno y escoger un curso con precio.
2. Pagar mediante el flujo automático de Culqi usando tarjeta, Yape o Plin según disponibilidad.
3. Mostrar primero un rechazo y luego un pago aprobado.
4. Confirmar que el cupo y el acceso se conceden únicamente con el pago aprobado.
5. Consultar el comprobante informativo con orden, importe, moneda, medio, fecha, alumno, curso y
   últimos dígitos cuando correspondan.

**Resultado esperado:** ESEJUR reacciona al resultado de Culqi, no procesa el dinero, no reserva
cupos y no crea accesos ante pagos rechazados o pendientes.

### 9. Realizar una matrícula administrativa

1. Seleccionar o crear una cuenta de alumno.
2. Matricularla indicando si corresponde pago manual o exoneración.
3. Mostrar la advertencia cuando una matrícula tardía dificulte cumplir asistencia.
4. Verificar su aparición en “Mis cursos” y en el control administrativo.

**Resultado esperado:** el acceso administrativo conserva claramente el origen y condición de la
matrícula sin simular un pago automático.

### 10. Controlar matrículas, pagos y accesos

1. Consultar los tres alumnos desde administración.
2. Comparar matrícula gratuita, pagada y administrativa.
3. Consultar sus estados e información de pago cuando exista.
4. Ingresar como alumno y comprobar el acceso correcto desde “Mis cursos”.

**Resultado esperado:** matrícula, pago y acceso están relacionados, pero mantienen su significado
propio y permiten auditar qué ocurrió.

### 11. Administrar el ciclo de vida

1. Mostrar los estados del curso y su cambio permitido.
2. Cerrar la matrícula sin retirar el acceso a quienes ya se matricularon.
3. Duplicar el curso y comprobar que la nueva copia no comparte avances, matrículas ni resultados.
4. Mostrar las restricciones de edición después del inicio o del primer progreso.

**Resultado esperado:** la oferta puede mantenerse y reutilizarse sin alterar el historial de los
alumnos.

## Comprobaciones alternativas durante la review

- Impedir la publicación de un curso incompleto o incoherente.
- Rechazar promociones inválidas y configuraciones incompatibles con la modalidad.
- Impedir matrícula cuando ya no hay cupos o la matrícula está cerrada.
- Repetir la confirmación de Culqi y comprobar que no duplica pago, matrícula ni cupo consumido.
- Permitir un nuevo intento únicamente tras RECHAZADO, ERROR o EXPIRADO; mientras exista PENDIENTE
  no se crea otro intento y ESEJUR espera el resultado de Culqi.
- Demostrar que un APROBADO tardío iniciado válidamente se respeta tras cierre, fecha vencida o
  cupo lleno, mientras una cancelación del curso o matrícula conserva el pago sin entregar acceso.
- Mantener una matrícula confirmada aunque falle su correo; permitir el reenvío.

## Evidencias que deben conservarse

- curso configurado y publicado;
- estructura de módulos, sesiones, exámenes y requisitos;
- tres matrículas con sus diferentes orígenes;
- resultado aprobado y rechazado de Culqi;
- comprobación de idempotencia y capacidad;
- visualización del curso desde catálogo y “Mis cursos”;
- lista de historias aceptadas y observaciones de la review.

## Criterios para aceptar el entregable

- Las trece historias incluidas cumplen sus criterios de aceptación.
- El curso se configura y publica desde administración sin datos precargados manualmente.
- Las reglas de modalidad se mantienen durante todo el flujo.
- Los tres caminos de matrícula conceden el resultado correcto.
- El pago automático nunca reserva cupo antes de ser aprobado.
- Los reintentos y notificaciones repetidas no generan duplicidad.
- El alumno obtiene acceso únicamente cuando su matrícula lo permite.
- Administración puede explicar el estado de cada matrícula y pago mostrado.

## Límite del entregable

La épica habilita el acceso al curso, pero no demuestra todavía consumo académico completo,
asistencia, calificación, progreso real ni emisión de certificados. Esas capacidades corresponden
a las EP03 y EP04.

## Mensaje de cierre de la review

> ESEJUR ya permite construir y publicar cursos, matricular alumnos gratuitamente, mediante pago
> automático o por administración, y entregarles el acceso correcto en “Mis cursos”.
