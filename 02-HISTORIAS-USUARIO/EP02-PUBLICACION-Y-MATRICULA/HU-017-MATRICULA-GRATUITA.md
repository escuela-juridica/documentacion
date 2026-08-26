# HU-017 — Matricularme en un curso gratuito

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno con cuenta habilitada**, quiero **matricularme gratuitamente**, para **obtener
> acceso y certificación bajo las mismas reglas académicas del curso**.

## Alcance incluido

- Autoservicio 24/7 sin operación Culqi.
- Validación de cuenta, estado del curso, cierre de matrícula, cupo y matrícula previa.
- Activación inmediata de matrícula y ocupación de cupo al activarla.
- Acceso inmediato o desde `fecha_inicio`.
- Vigencia en días o acceso permanente.
- Correo de matrícula confirmada.
- Curso gratuito certifica sin segundo cobro.
- La matrícula gratuita por autoservicio no crea un pago APROBADO, REGISTRADO_MANUAL ni EXONERADO;
  su forma de ingreso queda identificada como curso gratuito.

## Flujo principal

1. El alumno solicita matrícula en un curso gratuito disponible.
2. ESEJUR valida cuenta, disponibilidad y duplicidad.
3. Crea una sola matrícula ACTIVA y ocupa cupo si existe.
4. Informa cuándo abre el contenido y envía confirmación.

## Excepciones

- Cuenta no habilitada: orienta a completar sus condiciones.
- Curso sin cupo, cerrado/cancelado o fuera del cierre: no crea matrícula.
- Ya matriculado: no duplica y dirige al acceso existente.
- EN_VIVO/HIBRIDO con asistencia obligatoria y sin sesiones futuras: no admite matrícula automática.

## Criterios de aceptación

- **Dado** curso gratuito disponible, **cuando** confirma, **entonces** queda ACTIVA una sola vez y
  ocupa cupo.
- **Dado** fecha de inicio futura, **cuando** se matricula, **entonces** conserva el derecho ACTIVA,
  pero el contenido abre al llegar la fecha.
- **Dado** curso sin disponibilidad, **cuando** intenta matricularse, **entonces** no se crea acceso.

## Notificación

- Al activarse la matrícula se envía una confirmación con el curso, la modalidad, la fecha de
  acceso y la indicación de que no existió cobro.
- Un fallo de correo se registra y permite reenvío, pero no revierte la matrícula ACTIVA ni libera
  el cupo. No se implementa seguimiento de apertura o entrega.

## Dependencia interna

- Depende de HU-015.
- HU-020 y HU-021 consumen su resultado.

## Orientación de trabajo

- **Frontend:** confirmación, restricciones y resultado de acceso.
- **Backend:** unicidad, cupo, estado ACTIVA, fecha y vigencia.
- **Integración:** una sola confirmación debe producir una matrícula ACTIVA, ocupar un cupo cuando
  exista límite, habilitar “Mis cursos” y enviar la confirmación sin crear ningún registro de pago.

## Demostración esperada

Demostrar matrícula inmediata, inicio futuro, curso lleno y repetición.
