# HU-028 — Rendir un examen de calificación automática

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 4 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno**, quiero **rendir un examen objetivo y recibir el resultado automático**, para
> **continuar si apruebo o usar otro intento disponible si no alcanzo la nota mínima**.

## Alcance incluido

- Exámenes de práctica o calificados con selección única, múltiple y verdadero/falso.
- Habilitación por avance; EN_VIVO/HIBRIDO puede además exigir fecha.
- Badge visible de práctica/calificado.
- Navegación, respondidas, pendientes, marcadas para revisar y confirmación de envío.
- Respuestas conservadas durante el intento.
- Tiempo opcional: corre desde inicio, no pausa al cerrar/perder conexión y se retoma con restante.
- Al llegar a cero: envío automático, pendientes cero y consumo del intento.
- Barajado cuando se configuró.
- Nota `puntaje_obtenido / total × 20`, redondeada convencionalmente a dos decimales antes de
  comparar aprobación, mejor intento o umbrales, sin penalización.
- En selección múltiple, solo obtiene el puntaje si marca todas las correctas y ninguna incorrecta;
  no existe puntaje parcial automático. Una respuesta incorrecta o vacía vale cero.
- Aprobación desde nota mínima, mejor intento y promedio final con igual peso.
- CALIFICADO admite intentos ilimitados por defecto o hasta el máximo configurado; PRACTICA es
  siempre ilimitado. Las respuestas correctas se
  muestran al aprobar, al agotar el límite o nunca; “al agotar” no existe con intentos ilimitados.
- En VIRTUAL con secuencia, un examen de módulo abre al completar sus lecciones y el final al
  completar todos los módulos; sin secuencia abre con matrícula ACTIVA. En EN_VIVO/HIBRIDO, una
  fecha configurada se suma al requisito de avance y nunca lo sustituye.

## Flujo principal

1. El alumno abre un examen habilitado e inicia intento.
2. Navega, responde y revisa.
3. Confirma envío o el tiempo lo envía automáticamente.
4. ESEJUR califica al instante y publica nota/resultado.
5. Libera recorrido si correspondía o permite reintentar.

Si agota un límite sin aprobar, el aula indica expresamente que no puede reintentar ni certificar y
que administración debe otorgar un intento adicional justificado para continuar.

## Criterios de aceptación

- **Dado** examen objetivo, **cuando** envía, **entonces** se calcula automáticamente en escala 20.
- **Dado** tiempo agotado, **cuando** llega a cero, **entonces** se envía, pendientes valen cero y
  consume intento.
- **Dado** cierre y retorno, **cuando** retoma, **entonces** conserva respuestas y tiempo restante.
- **Dado** varios intentos, **cuando** calcula resultado del examen, **entonces** conserva el mejor.
- **Dado** práctica, **cuando** obtiene nota, **entonces** no afecta certificación ni bloquea.
- **Dado** selección múltiple, **cuando** contiene una opción incorrecta o falta una correcta,
  **entonces** la pregunta obtiene cero sin puntaje parcial.
- **Dado** intentos agotados sin aprobar, **cuando** consulta el resultado, **entonces** ve la causa
  del bloqueo y no se crea otra oportunidad automáticamente.

## Dependencia interna

- Ninguna dentro de EP03; requiere examen configurado y aula.
- HU-025 usa su aprobación si bloquea; HU-031 puede conceder intento adicional.

## Orientación de trabajo

- **Frontend:** navegación, temporizador, revisión, envío y resultado.
- **Backend:** intento, tiempo definitivo, calificación, nota, mejor resultado y límites.
- **Integración:** preguntas, opciones, barajado, temporizador y respuestas del alumno deben producir
  un intento único con puntaje, estado de aprobación y reintentos disponibles calculados al enviar.

## Demostración esperada

Demostrar aprobado, tiempo vencido, retorno y reintento.
