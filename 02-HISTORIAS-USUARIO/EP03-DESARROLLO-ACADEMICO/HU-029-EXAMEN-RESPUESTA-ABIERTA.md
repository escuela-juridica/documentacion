# HU-029 — Rendir un examen con respuesta abierta

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 4 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno**, quiero **responder preguntas abiertas y conservar mi intento para revisión**,
> para **ser evaluado cuando la respuesta no admite corrección automática**.

## Alcance incluido

- La respuesta se escribe dentro del examen junto con preguntas objetivas si existen.
- El alumno navega entre preguntas, puede volver a una respuesta antes de enviar y ve cuáles están
  contestadas, pendientes o marcadas para revisar.
- Las respuestas se conservan durante el intento. Si existe tiempo límite, se muestra el tiempo
  restante y, al agotarse, el intento se envía automáticamente con lo respondido.
- Antes del envío voluntario se presenta una revisión y una advertencia por preguntas sin responder;
  una vez enviado, el alumno no puede editar el intento.
- Las preguntas objetivas incluidas se corrigen automáticamente, pero la nota del intento no queda
  definitiva mientras exista al menos una respuesta abierta pendiente de revisión.
- Al agotarse el tiempo, las preguntas no respondidas reciben cero y el intento se consume antes de
  pasar a PENDIENTE_REVISION si contiene alguna respuesta abierta.
- El intento pasa a PENDIENTE_REVISION si contiene abiertas.
- Se calcula `fecha_limite_revision` desde envío y `dias_revision`, tres calendario por defecto.
- `dias_revision` ya no puede modificarse después del inicio del curso.
- No puede iniciar otro intento mientras uno está pendiente.
- Si el examen es calificado, bloquea finalización/certificado hasta CALIFICADO.
- La fecha límite informa el compromiso administrativo, no califica automáticamente.

## Flujo principal

1. El alumno inicia y responde texto abierto.
2. Revisa y envía.
3. ESEJUR conserva respuestas y marca PENDIENTE_REVISION.
4. Muestra la fecha máxima de calificación.
5. El intento queda disponible para revisión administrativa sin que el alumno pierda sus respuestas.

## Criterios de aceptación

- **Dado** una respuesta abierta, **cuando** envía, **entonces** no se califica automáticamente y
  queda PENDIENTE_REVISION con fecha límite.
- **Dado** intento pendiente, **cuando** intenta otro, **entonces** se impide hasta la revisión.
- **Dado** examen calificado pendiente, **cuando** cumple otros requisitos, **entonces** no se fija
  finalización ni se emite certificado.
- **Dado** examen de práctica abierto, **cuando** está pendiente, **entonces** no afecta la nota final.
- **Dado** un examen CALIFICADO pendiente, **cuando** se intenta finalizar o emitir incluso de forma
  manual, **entonces** se bloquea hasta que la revisión produzca una nota definitiva.
- **Dado** tiempo agotado con preguntas pendientes, **cuando** ESEJUR envía el intento, **entonces**
  asigna cero a las no respondidas, consume la oportunidad y conserva las abiertas para revisión.

## Dependencia interna

- Ninguna para iniciar; HU-030 depende de esta historia.

## Orientación de trabajo

- **Frontend:** editor, conservación, estado pendiente y fecha límite.
- **Backend:** persistencia, estado, bloqueo de otro intento y certificación.
- **Integración:** las respuestas conservadas y enviadas deben crear un intento PENDIENTE_REVISION,
  mostrar al alumno la fecha límite y aparecer en la bandeja administrativa sin permitir otro
  intento simultáneo.

## Demostración esperada

Demostrar envío, intento pendiente y bloqueo de un segundo intento.
