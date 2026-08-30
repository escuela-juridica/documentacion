# HU-032 — Obtener mi certificado

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |
| Prioridad | Crítica |

## Historia

> Como **alumno que cumplió el curso**, quiero **obtener mi certificado en el momento definido**,
> para **acreditar mi formación con datos, nota y nivel definitivos**.

## Especificación funcional completa

### Condiciones académicas

El curso puede exigir de forma independiente:

- **Exámenes:** aprobar todos los exámenes calificados. Un intento PENDIENTE_REVISION no está
  aprobado. Los exámenes de práctica nunca cuentan.
- **Progreso:** alcanzar el porcentaje mínimo configurado sobre lecciones obligatorias.
- **Asistencia:** alcanzar el mínimo configurado; solo existe en EN_VIVO/HIBRIDO.

Solo se evalúan condiciones activas. Si las tres están desactivadas no existe emisión automática:
el certificado solo puede ser emitido excepcionalmente por administración, con motivo, responsable,
fecha e historial registrados. Si no exige exámenes, no hay nota final y el certificado siempre es
Normal.

Un curso gratuito y uno pagado usan exactamente estas mismas condiciones; el certificado nunca
requiere un segundo pago.

### Finalización, fechas y espera

- Al cumplir condiciones se registra `fecha_finalizacion`.
- Si el curso tiene `fecha_fin`, nunca se emite antes. VIRTUAL nunca tiene fecha de fin.
- `fecha_base_emision` es la fecha posterior entre finalización académica y fecha de fin existente.
- `fecha_emision_programada = fecha_base_emision + dias_espera`.
- `dias_espera` vale cero por defecto y se cuenta en días calendario. La emisión programada ocurre
  a las 00:00 de `America/Lima` del día calculado.
- Con espera mayor que cero, el certificado se genera automáticamente en la fecha programada; hasta
  ese momento puede mejorar usando intentos disponibles.
- Con espera cero queda LISTO_PARA_EMITIR: el alumno elige generar ahora o seguir mejorando.
- Antes de existir el documento se muestran estados explicativos: PENDIENTE_REQUISITOS si falta una
  condición académica; PENDIENTE_DATOS si faltan datos confirmados; PROGRAMADO si espera su fecha;
  y LISTO_PARA_EMITIR si la espera es cero y falta la decisión final del alumno. Después de emitir,
  el certificado solo puede estar VIGENTE o ANULADO.

### Datos obligatorios

Antes de emitir debe confirmar nombres, apellido paterno y apellido materno. La pantalla viene
prellenada, los tres son obligatorios y se registra fecha/hora de confirmación. Si falta alguno,
queda PENDIENTE_DATOS, muestra el acceso al formulario y envía un correo solicitando la
confirmación únicamente cuando ya cumple las condiciones académicas y temporales. Si la fecha
programada ya pasó, la emisión continúa al confirmar.

El sistema completa lo que ya conoce según el origen de la cuenta: el registro por formulario ya
separa nombres y apellidos; una cuenta de Google puede requerir separar apellido paterno y materno
porque Google puede entregar los apellidos en un solo bloque; en una cuenta creada por
administración se solicitará cualquier nombre o apellido que haya quedado incompleto. El alumno
puede corregir y volver a confirmar estos datos mientras el certificado no se haya emitido. El DNI
es opcional, se administra desde el perfil y no interviene en este flujo ni en el PDF.

### Nota y nivel

- Nota de intento, mejor intento y nota final se redondean convencionalmente a dos decimales antes
  de compararse. La nota final es el promedio simple de los exámenes calificados, utilizando el
  mejor intento de cada uno.
- Normal: desde la nota mínima del curso, 12 por defecto.
- Refrendado: desde un umbral estrictamente mayor, 14 por defecto, y utiliza la entidad definida
  por el curso. Una nota aprobatoria menor al umbral Refrendado produce nivel Normal emitido por la
  Escuela Jurídica.
- Sin exámenes obligatorios: Normal, sin nota final.
- Al emitir se congelan nota, nivel y datos. Se cierran nuevos intentos calificados; los de práctica
  pueden continuar.

### Contenido del certificado

Un solo certificado por alumno/curso, con código único y QR. El PDF incluye nombre completo, tipo y
título del curso, rango de fechas, horas académicas, lugar/fecha de emisión, entidad cuando aplica,
logos y firmas configuradas. El lugar proviene de la configuración institucional y comienza con
“Lima, Perú”. Para VIRTUAL sin fin, el rango usa matrícula y finalización.

En EN_VIVO/HIBRIDO el rango utiliza las fechas de inicio y fin del curso. En VIRTUAL sin fecha de
fin utiliza la fecha de matrícula del alumno y su fecha de finalización académica.

## Flujo con espera

1. ESEJUR detecta cumplimiento y fecha base.
2. Muestra promedio, nivel proyectado, límite para mejorar y fecha exacta.
3. El alumno puede mejorar hasta la fecha.
4. En la fecha programada, con datos confirmados y sin pendientes, emite automáticamente.
5. Envía un correo con el enlace privado de descarga, nunca el PDF adjunto.

## Flujo inmediato

1. ESEJUR muestra promedio, nivel y advertencia de cierre definitivo.
2. El alumno elige “Generar certificado ahora” o “Seguir mejorando mi nota”.
3. Solo al confirmar emisión se genera y congelan los resultados.

## Criterios de aceptación

- **Dado** condiciones incompletas, **cuando** consulta, **entonces** queda PENDIENTE_REQUISITOS y
  muestra valores reales/metas.
- **Dado** un curso gratuito, **cuando** cumple las condiciones, **entonces** sigue el mismo flujo de
  emisión sin solicitar pago adicional.
- **Dado** una respuesta abierta pendiente, **cuando** cumple lo demás, **entonces** no finaliza ni
  emite.
- **Dado** fecha de fin futura, **cuando** cumple temprano, **entonces** no emite antes.
- **Dado** espera mayor que cero, **cuando** llega la fecha programada con datos completos,
  **entonces** emite automáticamente una sola vez.
- **Dado** espera cero, **cuando** elige seguir mejorando, **entonces** no emite ni cierra intentos.
- **Dado** que confirma generar, **cuando** se emite, **entonces** nota/nivel/datos quedan congelados
  y nuevos intentos calificados se rechazan con explicación.
- **Dado** datos faltantes, **cuando** llega la fecha, **entonces** no crea PDF; al confirmarlos
  continúa según flujo inmediato o programado.
- **Dado** finalización ya registrada, **cuando** la matrícula vence o se cancela después,
  **entonces** conserva la confirmación y la emisión inmediata o programada sin reabrir el aula.

## Notificaciones

- Si faltan datos, se envía una solicitud de confirmación con acceso directo al formulario.
- Cuando el certificado está listo, se envía un enlace autenticado de descarga; el PDF nunca se
  adjunta al correo.
- Un fallo de correo no elimina el certificado ni vuelve a abrir exámenes; el enlace sigue disponible
  en “Mis certificados” y el aviso puede reenviarse. No se rastrea apertura o entrega.

## Dependencia interna

- Ninguna interna para iniciar; necesita resultados académicos completos de EP03.
- HU-033 a HU-036 consumen el certificado emitido.

## Orientación de trabajo

- **Frontend:** estados previos, datos, proyección, fecha, confirmación y mensajes definitivos.
- **Backend:** cálculo de cumplimiento/fecha, unicidad, emisión automática, congelamiento y PDF.
- **Integración:** demostrar pendiente, espera, emisión inmediata, datos faltantes y bloqueo posterior.

## Demostración esperada

Completar un alumno con espera y otro sin espera; mejorar antes de emitir, confirmar datos, emitir,
descargar y comprobar que la nota ya no cambia.
