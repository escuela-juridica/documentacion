# HU-038 — Cancelar completamente un curso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |
| Prioridad | Alta |

## Historia

> Como **administrador**, quiero **cancelar un curso completo con motivo**, para **detener su
> operación conservando evidencia y atendiendo correctamente a cada alumno**.

## Especificación funcional completa

- Solo PUBLICADO o EN CURSO puede pasar a CANCELADO; exige motivo y confirmación de impacto.
- Detiene inmediatamente nuevas matrículas y nuevos pagos/checkouts.
- Cancela todas las sesiones futuras, que quedan visibles CANCELADA y excluidas de asistencia,
  progreso y secuencia.
- No borra curso, contenido, pagos, matrículas, progreso, intentos, asistencia o certificados.
- Los alumnos que ya tenían acceso conservan la consulta del contenido que estuvo disponible antes
  de cancelar, excepto los enlaces de reuniones futuras. La cancelación no habilita contenido nuevo.
- Envía **un solo correo por curso** a cada afectado, con motivo y canal de atención; reemplaza
  correos individuales de sesiones.
- Alumno que ya cumplió conserva `fecha_finalizacion` y su certificado existente o pendiente según
  condiciones previas.
- Alumno que no cumplió no recibe certificado automático por la cancelación.
- Un certificado ya emitido no cambia ni se anula automáticamente. Quien no cumplió solo puede
  recibir una emisión manual excepcional con motivo; cancelar no crea finalización por sí mismo.
- ESEJUR no devuelve dinero. La Escuela resuelve pagos externamente y registra atención por
  matrícula.
- APROBADO de Culqi posterior: registra el pago sin duplicarlo, mantiene la matrícula CANCELADA y
  sin acceso, crea una alerta administrativa y permite registrar seguimiento, decisión, referencia
  externa y cierre del caso. ESEJUR no ejecuta la devolución.
- CANCELADO se diferencia de CERRADO: cerrar es fin normal de venta/curso; cancelar es decisión
  excepcional con afectados.

## Flujo principal

1. Administración revisa cantidad de alumnos, sesiones futuras y pagos en proceso.
2. Registra motivo y confirma cancelación.
3. ESEJUR cambia estado, bloquea nuevas operaciones y cancela sesiones futuras.
4. Conserva historial y contenido previamente disponible para quienes ya tenían acceso, retirando
   los enlaces de reuniones futuras, y envía el aviso consolidado.
5. Habilita registro de atención externa para afectados.

## Criterios de aceptación

- **Dado** curso operativo, **cuando** cancela con motivo, **entonces** queda CANCELADO, sin nuevas
  matrículas/pagos y con sesiones futuras canceladas.
- **Dado** alumnos afectados, **cuando** cancela, **entonces** reciben un correo consolidado, no uno
  por sesión.
- **Dado** alumno finalizado, **cuando** cancela, **entonces** conserva finalización/certificado.
- **Dado** alumno no finalizado, **cuando** cancela, **entonces** no certifica automáticamente.
- **Dado** alumno con acceso previo, **cuando** cancela, **entonces** conserva los materiales que ya
  estaban disponibles, pero no enlaces de reuniones futuras ni contenido nuevo.
- **Dado** APROBADO posterior, **cuando** llega, **entonces** registra pago sin acceso y genera caso.

## Notificación

- Cada alumno afectado recibe un aviso de cancelación con el nombre del curso, motivo y canal de
  atención. No se envían avisos individuales por cada sesión cancelada.
- Un fallo de envío no revierte la cancelación; queda registrado por alumno para reintentar el mismo
  aviso. No se implementa seguimiento de apertura o entrega.

## Dependencia interna

- Puede comenzar en paralelo con HU-037, pero la excepción APROBADO posterior debe integrarse.

## Orientación de trabajo

- **Frontend:** impacto, motivo, confirmación, estado y afectados.
- **Backend:** transición atómica, sesiones, bloqueos, preservación, correo único y pago tardío.
- **Integración:** confirmar la cancelación debe bloquear ventas y accesos nuevos, cancelar sesiones
  futuras, conservar para alumnos previos el contenido ya disponible, preservar historiales,
  generar casos económicos necesarios y enviar un solo aviso por alumno afectado.

## Demostración esperada

Demostrar curso con sesiones, finalizado/no finalizado y pago en proceso.
