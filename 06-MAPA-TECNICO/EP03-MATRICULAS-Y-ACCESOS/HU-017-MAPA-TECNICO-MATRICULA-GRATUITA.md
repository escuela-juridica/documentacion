# HU-017 — Mapa técnico para matrícula gratuita

## API y tablas

`POST /api/cursos/{slug}/matricula-gratuita` escribe `matricula`,
`historial_estado_matricula` y `notificacion`. No escribe `pago`.

## Transacción

1. Obtener la cuenta autenticada y comprobar rol Alumno, activo, correo verificado y clave propia.
2. Bloquear/consultar el curso y validar PUBLICADO/EN_CURSO, GRATUITO, cierre y cupo.
3. Buscar `usuario_id + curso_id`; si ya existe, devolver el resultado existente sin duplicar.
4. Crear ACTIVA, calcular activación y vencimiento y registrar historial.
5. Confirmar; luego solicitar el correo sin revertir la matrícula si falla.

Angular muestra un resumen y confirmación, nunca un checkout. Probar doble clic, curso pagado,
cuenta pendiente, curso cerrado, cupo y vigencia.
