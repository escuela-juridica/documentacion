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

- Estados BORRADOR, PUBLICADO, EN CURSO, CERRADO y CANCELADO.
- BORRADOR solo es visible para administración; PUBLICADO aparece en catálogo y admite matrícula;
  EN CURSO ya inició y puede seguir admitiendo matrícula mientras haya cupo y no exista cierre;
  CERRADO deja de venderse pero conserva el acceso de matriculados; CANCELADO representa que la
  Escuela decidió detener el curso y activa la atención de afectados.
- Transiciones automáticas por fechas cuando existen y posibilidad administrativa de forzar
  adelanto o retraso válido.
- VIRTUAL sin fecha de fin: permanece hasta cierre manual.
- Un VIRTUAL sin fecha de inicio pasa a EN CURSO al publicarse; con fecha de inicio permanece
  PUBLICADO hasta ese día y luego cambia automáticamente. Nunca se cierra por una fecha de fin.
- Un curso con matrículas no vuelve a BORRADOR ni se borra; se cierra u oculta.
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
- La cancelación completa no forma parte de esta operación ordinaria: exige motivo, bloquea nuevas
  matrículas/pagos, cancela sesiones futuras, conserva todo el historial y notifica a afectados en
  un solo correo por curso.

## Flujo principal

1. Administración consulta estado y acciones válidas.
2. Corrige, destaca, cierra o fuerza una transición con el contexto disponible.
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
- **Backend:** transiciones, restricciones, copia independiente y conservación.
- **Integración:** cada transición administrativa debe reflejarse inmediatamente en catálogo y
  matrícula. CERRADO conserva el acceso vigente; CANCELADO conserva para alumnos que ya tenían
  acceso únicamente el contenido previamente disponible y retira los enlaces de sesiones futuras.

## Demostración esperada

Demostrar cierre/forzado, edición permitida/prohibida, destacado y duplicación sin historial.
