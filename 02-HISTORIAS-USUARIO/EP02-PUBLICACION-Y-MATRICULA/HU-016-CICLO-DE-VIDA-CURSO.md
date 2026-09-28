# HU-016 — Administrar el ciclo de vida del curso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **controlar la vigencia, cambios y repetición de un curso**, para
> **mantener la oferta sin alterar el historial de alumnos**.

## Alcance incluido

- Estados ordinarios administrados en esta historia: BORRADOR, PUBLICADO, EN CURSO y CERRADO.
  CANCELADO se reconoce en el modelo general, pero su transición y efectos se implementan en
  HU-038 de EP04.
- BORRADOR solo es visible para administración; PUBLICADO aparece en catálogo y admite matrícula;
  EN CURSO ya inició y puede seguir admitiendo matrícula mientras haya cupo y no exista cierre;
  CERRADO deja de venderse pero conserva el acceso de matriculados; CANCELADO representa que la
  Escuela decidió detener el curso y activa la atención de afectados.
- Transiciones automáticas por fechas cuando existen y acciones administrativas delimitadas para
  adelantar el inicio, retrasarlo antes de comenzar o cerrar anticipadamente.
- VIRTUAL sin fecha de fin: permanece hasta cierre manual.
- Un VIRTUAL sin fecha de inicio pasa a EN CURSO al publicarse; con fecha de inicio permanece
  PUBLICADO hasta ese día y luego cambia automáticamente. Nunca se cierra por una fecha de fin.
- Un curso publicado nunca vuelve a BORRADOR. Un curso con matrículas o actividad no se borra; se
  cierra cuando corresponde.
- Antes de iniciar: edición permitida con advertencia si ya hay matrículas.
- Después de iniciar, o desde el primer avance, no se eliminan módulos o lecciones, no se agregan
  lecciones obligatorias, no se eliminan exámenes CALIFICADO, no se aumentan nota mínima, progreso
  o asistencia y no se cambian reglas de certificación. Un examen con intentos no permite editar
  preguntas ni opciones.
- Después de iniciar sí se pueden corregir títulos/descripciones, reemplazar archivos o videos
  dañados, corregir enlaces, agregar materiales complementarios que no cuenten para avance, ocultar
  temporalmente contenido problemático y ajustar sesiones futuras mediante su flujo con motivo.
- Destacar o dejar de destacar para orden del catálogo.
- Duplicar como nueva convocatoria BORRADOR copiando información general, módulos, lecciones,
  materiales, exámenes, preguntas, opciones, reglas de certificación, docentes y beneficios.
  Reutiliza archivos o URL físicas, conserva referencia al curso de origen y no copia matrículas,
  pagos, progreso, intentos, asistencia ni certificados. La copia es independiente y debe revisar
  nuevas fechas, precio, cupo y sesiones antes de publicarse. ESEJUR propone y valida una nueva
  dirección amigable única; nunca reutiliza la dirección pública del curso original.
- Al duplicar se copian todos los docentes asignados y su orden. Si un dato maestro está inactivo,
  la copia lo conserva para revisión, pero HU-015 impide publicarla hasta corregirlo.
- La cancelación completa no forma parte de esta operación: en EP02 no se muestra su acción, no se
  ejecuta la transición a CANCELADO, no se cancelan sesiones, no se envían avisos ni se crean casos
  de atención. Todo ese flujo corresponde a HU-038.

## Transiciones permitidas

- **BORRADOR → PUBLICADO:** solo después de superar HU-015. Un VIRTUAL sin fecha de inicio pasa
  directamente a EN CURSO al publicarse. BORRADOR solo puede eliminarse si no tiene matrículas ni
  actividad relacionada.
- **PUBLICADO → EN CURSO:** automáticamente al llegar la fecha de inicio o por adelanto
  administrativo. Antes de empezar puede retrasarse la fecha; si ya existen matrículas se advierte
  el impacto. Nunca regresa a BORRADOR.
- **PUBLICADO → CERRADO:** permite retirar anticipadamente el curso de la oferta sin cancelar los
  derechos ya concedidos.
- **EN CURSO → CERRADO:** ocurre automáticamente al finalizar un EN_VIVO/HIBRIDO o por cierre
  administrativo anticipado. VIRTUAL permanece EN CURSO hasta su cierre manual.
- **CERRADO:** no admite nuevas matrículas ni pagos y no retorna a EN CURSO, PUBLICADO o BORRADOR;
  puede duplicarse como una nueva convocatoria.

Cerrar no cancela matrículas, no elimina actividad, no inicia devoluciones ni retira el acceso de
quienes continúen con matrícula ACTIVA y vigente. La fecha de inicio no puede retrasarse después de
que el curso comenzó o algún alumno registró actividad.

## Flujo principal

1. Administración consulta estado y acciones válidas.
2. Corrige, destaca, adelanta o retrasa el inicio cuando todavía corresponde, o ejecuta un cierre
   ordinario válido.
3. Para cambios estructurales futuros, duplica el curso.
4. ESEJUR conserva el curso original y crea un BORRADOR independiente.

## Criterios de aceptación

- **Dado** VIRTUAL publicado, **cuando** no tiene fin, **entonces** no se cierra automáticamente.
- **Dado** curso CERRADO, **cuando** se consulta públicamente, **entonces** deja de ofrecerse para
  nuevas matrículas, mientras sus alumnos conservan el acceso vigente.
- **Dado** curso con matrículas, **cuando** intenta volver a BORRADOR o borrarlo, **entonces** se
  impide.
- **Dado** curso CERRADO, **cuando** un alumno ya matriculado conserva vigencia, **entonces** puede
  seguir consultando su contenido aunque el curso ya no aparezca para nuevas matrículas.
- **Dado** curso PUBLICADO, **cuando** administración adelanta el inicio, **entonces** pasa a EN
  CURSO sin permitir después regresar a PUBLICADO o BORRADOR.
- **Dado** curso EN CURSO o con actividad, **cuando** intenta retrasar su inicio o retroceder su
  estado, **entonces** la operación se rechaza.
- **Dado** curso iniciado, **cuando** intenta agregar requisitos obligatorios, **entonces** se
  rechaza; un material complementario no reduce progreso.
- **Dado** curso duplicado, **cuando** abre la copia, **entonces** conserva estructura/configuración,
  pero no matrículas, pagos, progreso, intentos, asistencia ni certificados, y posee una dirección
  amigable distinta y única.

## Dependencia interna

- Depende de HU-015.
- Puede avanzar en paralelo con las matrículas usando cursos controlados.

## Orientación de trabajo

- **Frontend:** acciones válidas, avisos y estado visible.
- **Backend:** transiciones sin retroceso, restricciones, copia independiente y conservación.
- **Integración:** cada transición administrativa debe reflejarse inmediatamente en catálogo y
  matrícula. CERRADO conserva el acceso vigente. CANCELADO no se ejecuta ni se demuestra hasta
  HU-038.

## Demostración esperada

Demostrar adelanto o retraso permitido, cierre ordinario, edición permitida/prohibida, destacado y
duplicación sin historial; no demostrar cancelación completa.
