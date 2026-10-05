# HU-019 — Mapa técnico para matrícula administrativa

## API

- `GET /api/admin/alumnos?texto=`: solo cuentas con rol Alumno.
- `POST /api/admin/matriculas`: recibe alumno, curso, condición económica, datos y motivo.

## Transacción

Validar curso PUBLICADO/EN_CURSO, duplicidad y cupo. REGISTRADO_MANUAL exige importe, medio,
referencia y motivo; EXONERADO exige importe cero y motivo. Crear `matricula` ACTIVA,
`historial_estado_matricula` y una fila `pago` con origen MANUAL o EXONERADO. Registrar
`creado_por_usuario_id` y `registrado_por_usuario_id`. No crear cuenta ni rol.

Una cuenta pendiente puede adquirir el derecho, pero el servicio de acceso seguirá bloqueando el
contenido. Si no quedan sesiones y se exige asistencia, devolver una advertencia que requiere
confirmación explícita. Probar alumno inexistente, usuario sin rol, curso/cupo inválido y ambos
orígenes económicos.
