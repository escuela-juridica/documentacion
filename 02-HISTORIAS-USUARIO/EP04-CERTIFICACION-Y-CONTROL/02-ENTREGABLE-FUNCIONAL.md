# EP04 — Entregable funcional para la review

## Producto funcional obtenido

Al finalizar la épica queda operativo el **cierre educativo y administrativo de ESEJUR**. El
alumno obtiene un certificado verificable cuando cumple las reglas; la escuela puede atender
excepciones, cancelaciones, quejas y reclamos, y consultar reportes y gráficos de gestión.

El recorrido que resume el valor entregado es:

> Un alumno completa el curso, recibe y descarga su certificado, un tercero verifica su validez y
> administración controla las incidencias y resultados generales de la operación.

## Historias incluidas

| Historia | Capacidad que aporta al entregable |
|---|---|
| HU-032 | Evaluación de requisitos y emisión del certificado |
| HU-033 | Consulta y descarga de certificados propios |
| HU-034 | Verificación pública del certificado |
| HU-035 | Emisión administrativa manual |
| HU-036 | Corrección y anulación |
| HU-037 | Excepciones de matrícula y pago |
| HU-038 | Cancelación completa de un curso |
| HU-039 | Presentación de queja o reclamo |
| HU-040 | Respuesta institucional a la queja o reclamo |
| HU-041 | Reporte de matrículas |
| HU-042 | Reporte de pagos |
| HU-043 | Reporte académico |
| HU-044 | Reporte de certificados |
| HU-045 | Reporte de asistencia |
| HU-046 | Dashboard de gráficos simples |

## Objetivo de la review

Demostrar el ciclo completo desde el cumplimiento académico hasta la verificación pública, junto
con las funciones mínimas que la escuela necesita para controlar incidencias y consultar sus
resultados. Esta review representa la presentación funcional final del sistema.

## Actores de la demostración

- **Alumno:** recibe, consulta y descarga su certificado.
- **Administrador:** emite, corrige, anula, atiende incidencias y consulta información.
- **Visitante:** presenta una queja o reclamo.
- **Verificador externo:** verifica públicamente un certificado.
- **Servicio de correo:** comunica emisión, cancelación y respuesta institucional.

## Preparación previa

Antes de comenzar deben existir:

- un alumno que cumple inmediatamente todos los requisitos;
- un alumno con certificado programado después de días de espera;
- un alumno con datos obligatorios incompletos;
- un alumno que aún no cumple uno o más requisitos;
- certificados normal y refrendado, además de uno destinado a corrección o anulación;
- matrículas y pagos con casos controlados de excepción;
- un curso con alumnos completos e incompletos para demostrar cancelación;
- una queja o reclamo pendiente y datos suficientes para alimentar todos los reportes.

## Guion principal de demostración

### 1. Validar requisitos y emitir automáticamente

1. Abrir la situación académica del alumno que ya cumplió.
2. Mostrar que el sistema valida todos los requisitos configurados.
3. Mostrar la advertencia previa a la emisión: después de generar el certificado no se podrá
   aumentar la nota mediante nuevos intentos calificables.
4. Confirmar la emisión inmediata.
5. Comprobar código único, nivel normal o refrendado, fechas, periodo y datos congelados.

**Resultado esperado:** se emite un único certificado vigente con información consistente y la
nota queda protegida frente a nuevos intentos calificables.

### 2. Mostrar espera, programación y datos pendientes

1. Consultar un caso con días de espera configurados.
2. Mostrar la fecha calculada de disponibilidad y el estado programado.
3. Consultar un caso con datos personales obligatorios incompletos.
4. Completar los datos y comprobar la reevaluación.
5. Mostrar un caso que todavía no cumple requisitos y la razón exacta.

**Resultado esperado:** el alumno distingue entre requisitos pendientes, datos pendientes,
certificado programado y certificado listo para emitir.

### 3. Consultar y descargar el certificado

1. Abrir la sección de certificados del alumno.
2. Consultar el certificado vigente y descargarlo.
3. Mostrar el aviso por correo sin adjuntar el PDF y acceder mediante el enlace privado.

**Resultado esperado:** solo el titular autenticado accede a su documento privado y un fallo de
correo no elimina una emisión ya confirmada.

### 4. Verificar públicamente

1. Salir de la cuenta del alumno.
2. Escanear el QR o ingresar el código desde la consulta pública.
3. Mostrar los datos mínimos de verificación y el estado `VIGENTE`.
4. Consultar posteriormente un certificado anulado.

**Resultado esperado:** un tercero confirma autenticidad y estado sin acceder a información
privada innecesaria.

### 5. Emitir, corregir y anular administrativamente

1. Emitir manualmente un certificado justificando la operación.
2. Mostrar que el nivel se deriva de la nota y los umbrales; si no existen exámenes corresponde
   nivel Normal. En una excepción con nota bajo el mínimo o sin nota también corresponde Normal;
   Refrendado solo se obtiene si una nota definitiva alcanza su umbral.
3. Corregir un certificado mediante el flujo autorizado, conservando el historial.
4. Anular otro certificado indicando el motivo.
5. Comprobar la respuesta de la verificación pública después del cambio.

**Resultado esperado:** administración resuelve casos excepcionales sin ocultar emisiones
anteriores ni permitir que dos certificados vigentes representen el mismo logro.

### 6. Atender excepciones de matrícula y pago

1. Consultar una confirmación tardía, duplicada o contradictoria.
2. Mostrar los datos que permiten decidir sin volver a cobrar ni crear otra matrícula.
3. Aplicar el resultado autorizado y conservar la justificación.
4. Comprobar el acceso final del alumno y la capacidad del curso.

**Resultado esperado:** la excepción se resuelve de forma controlada e idempotente, preservando
pago, matrícula, cupo e historial.

### 7. Cancelar completamente un curso

1. Seleccionar un curso e indicar el motivo de cancelación.
2. Confirmar la advertencia y comunicar a los alumnos.
3. Comprobar que no admite nuevas ventas ni nuevos accesos.
4. Mostrar que los alumnos previamente habilitados conservan el contenido ya disponible, excepto
   enlaces de reuniones futuras, y que no se publica nuevo contenido.
5. Comparar un alumno que completó requisitos con otro que no los completó.
6. Mostrar que la cancelación no genera devolución automática.

**Resultado esperado:** se detiene la operación futura sin borrar historial; quien ya completó
puede continuar su certificación y quien no completó no recibe certificado automático.

### 8. Presentar una queja o reclamo

1. Ingresar al formulario público.
2. Elegir `QUEJA` o `RECLAMO` y explicar su diferencia.
3. Completar identificación, contacto, dirección, importe, producto o servicio, descripción del
   hecho y solución solicitada.
4. Adjuntar imágenes válidas cuando corresponda y aceptar la declaración y autorización de
   correo.
5. Enviar y mostrar número correlativo y fecha máxima de respuesta de quince días hábiles.

**Resultado esperado:** el visitante obtiene constancia sin requerir cuenta ni portal público de
seguimiento.

### 9. Responder la queja o reclamo

1. Ingresar como administrador y abrir la cola ordenada por vencimiento.
2. Filtrar, buscar y mostrar casos próximos a vencer o vencidos.
3. Redactar y enviar la respuesta institucional.
4. Comprobar el contenido del correo y el cambio a `RESPONDIDO` únicamente después del envío
   exitoso.
5. Mostrar un fallo de envío, corregirlo y reintentar sin alterar una respuesta ya enviada.

**Resultado esperado:** la escuela controla el plazo y conserva una respuesta institucional
inmutable una vez entregada.

### 10. Consultar reportes

1. Abrir el reporte de matrículas y aplicar sus filtros.
2. Abrir el reporte de pagos y diferenciar estados y medios.
3. Abrir el reporte académico y comparar progreso, notas y cumplimiento.
4. Abrir el reporte de certificados y distinguir vigentes y anulados.
5. Abrir el reporte de asistencia y comprobar el porcentaje sobre sesiones elegibles.
6. Mostrar el resultado sin datos y la exportación disponible cuando corresponda.

**Resultado esperado:** administración obtiene información comprensible y consistente con las
operaciones demostradas, sin modificar los registros desde los reportes.

### 11. Consultar el dashboard

1. Abrir el panel principal de administración.
2. Mostrar exactamente los cuatro gráficos: evolución de matrículas, matrículas por curso, forma
   de ingreso y pagos confirmados por periodo.
3. Cambiar filtros aplicables y comparar los resultados con el reporte de matrículas.
4. Confirmar que el dashboard no presenta tarjetas de indicadores, tareas, alertas ni pendientes.

**Resultado esperado:** la escuela identifica visualmente cómo se están matriculando los alumnos
sin convertir el panel en un módulo operativo complejo.

## Comprobaciones alternativas durante la review

- Impedir la emisión cuando falten requisitos o datos obligatorios.
- Evitar certificados duplicados y nuevos intentos calificables después de emitir.
- Mostrar un certificado anulado como no vigente en la verificación pública.
- No deshacer una emisión confirmada por fallo del correo; permitir su reenvío.
- No conceder acceso ante una aprobación de pago recibida después de la cancelación total del
  curso; registrar la matrícula como cancelada para revisión.
- No cambiar un reclamo a respondido mientras falle el correo.
- No calcular devoluciones automáticas por cancelación.
- Mantener consistencia entre reportes, dashboard y datos operativos.

## Evidencias que deben conservarse

- certificado emitido, descargado y verificado;
- casos de programación, requisitos y datos pendientes;
- historial de emisión manual, corrección y anulación;
- excepción de matrícula o pago resuelta;
- cancelación completa y sus efectos diferenciados;
- constancia y respuesta de una queja o reclamo;
- capturas o exportaciones de los cinco reportes;
- gráficos del dashboard comparados con matrículas reales;
- lista final de historias aceptadas y observaciones de la review.

## Criterios para aceptar el entregable

- Las quince historias incluidas cumplen sus criterios de aceptación.
- La emisión automática respeta requisitos, espera, datos personales y protección de la nota.
- Descarga y verificación pública muestran el estado correcto del certificado.
- Emisión manual, corrección y anulación conservan historial y justificación.
- Excepciones y cancelaciones no duplican ni eliminan información del negocio.
- La queja o reclamo puede presentarse y responderse dentro del flujo establecido.
- Los cinco reportes representan correctamente la información disponible.
- El dashboard utiliza gráficos simples, coincide con matrículas reales y no muestra pendientes.
- El recorrido completo desde catálogo hasta certificación puede demostrarse de extremo a extremo.

## Producto completo después de las cuatro épicas

Con la aceptación de esta épica, los incrementos anteriores se unen en un solo producto:

> **Plataforma web integral de formación y certificación de la Escuela Jurídica ESEJUR**, capaz
> de publicar cursos, matricular alumnos, desarrollar el aprendizaje, emitir certificados y
> brindar control administrativo básico.

## Mensaje de cierre de la review

> ESEJUR completa el servicio educativo: valida el logro académico, entrega certificados
> verificables y permite a la escuela atender incidencias y comprender sus resultados.
