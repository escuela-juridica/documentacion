# HU-026 — Participar en sesiones en vivo

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 4 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno de un curso en vivo o híbrido**, quiero **consultar mi calendario, ingresar a una
> sesión y acceder luego a su grabación**, para **participar y conservar evidencia de asistencia**.

## Alcance incluido

- Calendario mensual de todas las sesiones, con navegación, “Hoy”, curso, título y hora.
- Solo aparece si tiene `EN_VIVO` o `HIBRIDO`.
- Próximas sesiones ordenadas y recordatorio por correo el día anterior.
- Enlace visible el día programado; abrirlo entre hora de inicio y fin registra asistencia, mientras
  que abrir antes o después no la registra.
- Asistencia automática una vez al abrir desde ESEJUR entre inicio y fin.
- Abrir antes/después no cuenta; no demuestra permanencia en Zoom.
- Grabación posterior o “grabación pendiente”; grabación no cuenta asistencia.
- Matrícula tardía: denominador solo sesiones posteriores a la matrícula.
- Sesión CANCELADA visible, excluida de asistencia y progreso.
- El porcentaje de asistencia se calcula como sesiones asistidas dividido entre sesiones elegibles,
  multiplicado por 100. Son elegibles únicamente las sesiones no canceladas posteriores a la
  matrícula del alumno.

## Flujo principal

1. El alumno consulta calendario o próximas sesiones.
2. Dentro de la ventana abre el enlace desde ESEJUR.
3. ESEJUR registra una asistencia y dirige a la reunión.
4. Después consulta la grabación cuando esté disponible.

## Criterios de aceptación

- **Dado** sesión vigente y ventana activa, **cuando** abre el enlace, **entonces** registra una sola
  asistencia.
- **Dado** fuera de ventana, **cuando** abre, **entonces** no registra asistencia.
- **Dado** sesión CANCELADA, **cuando** calcula porcentaje, **entonces** no forma parte del total.
- **Dado** alumno solo VIRTUAL, **cuando** entra a su panel, **entonces** no ve calendario vacío.
- **Dado** matrícula tardía, **cuando** calcula asistencia, **entonces** solo usa sesiones posteriores.
- **Dado** sesiones elegibles, **cuando** muestra asistencia, **entonces** utiliza la relación entre
  asistidas y elegibles y excluye canceladas, previas a la matrícula y reproducciones de grabación.

## Notificación

- El día anterior se envía un recordatorio con curso, sesión, fecha, horario y enlace vigente.
- Un fallo de envío no cambia la sesión ni la asistencia y permite reenviar el aviso; no se controla
  si el alumno abrió o recibió efectivamente el correo.

## Dependencia interna

- Ninguna dentro de EP03; requiere sesiones/matrícula de EP02.
- HU-031 puede corregir su asistencia.

## Orientación de trabajo

- **Frontend:** calendario, enlace, estados y grabación.
- **Backend:** ventana, unicidad, denominador y exclusiones.
- **Integración:** calendario, recordatorio y aula deben mostrar la misma programación; abrir el
  enlace desde ESEJUR dentro del horario registra asistencia una sola vez y fuera del horario no.

## Demostración esperada

Demostrar acceso dentro/fuera de horario, repetición y sesión cancelada.
