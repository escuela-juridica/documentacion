# HU-024 — Completar lecciones y registrar progreso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 3 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno**, quiero **completar cada lección de forma adecuada a su contenido**, para
> **conservar un progreso real sin dificultar las lecciones que no pueden medirse automáticamente**.

## Alcance incluido

- Si existen videos detectables, cada uno debe alcanzar el umbral del curso, 50% por defecto.
- El check refleja el resultado y no permite omitir el umbral detectable.
- Si no hay video detectable, el alumno completa con check o “Siguiente”; ambas acciones equivalen.
- Una lección sin video no exige duración.
- El avance usa solo lecciones obligatorias fijadas al iniciar.
- El porcentaje se calcula como lecciones obligatorias completadas dividido entre el total estable
  de lecciones obligatorias, multiplicado por 100.
- Material complementario posterior no reduce avance.
- Reabrir una lección no elimina completado.

## Flujo principal automático

1. El alumno reproduce los videos detectables.
2. ESEJUR registra el porcentaje por cada video.
3. Al cumplir todos el umbral, marca la lección completada y recalcula avance.

## Flujo manual

1. La lección carece de reproducción detectable.
2. El alumno marca el check o pulsa “Siguiente”.
3. ESEJUR registra una sola finalización y recalcula avance.

## Excepciones

- Ver un video por debajo del umbral no completa.
- Un material complementario no entra al denominador.
- Repetir el check o recibir el mismo evento no duplica progreso.

## Criterios de aceptación

- **Dado** videos detectables, **cuando** cada uno alcanza el umbral, **entonces** se completa una
  sola vez.
- **Dado** uno por debajo, **cuando** revisa el check, **entonces** sigue pendiente y ve cuánto falta.
- **Dado** una lección sin detección, **cuando** usa check o “Siguiente”, **entonces** ambos generan
  el mismo resultado.
- **Dado** contenido complementario posterior, **cuando** se agrega, **entonces** no disminuye el
  porcentaje existente.
- **Dado** N lecciones obligatorias y C completadas, **cuando** se muestra el avance, **entonces** el
  porcentaje corresponde a `C / N × 100` sin incluir materiales complementarios.

## Dependencia interna

- Depende de HU-022 para recorrido real.
- HU-025 y HU-032 consumen el progreso.

## Orientación de trabajo

- **Frontend:** reproducción/porcentaje, check, “Siguiente” y avance actualizado.
- **Backend:** idempotencia, umbral por video y denominador estable.
- **Integración:** consumo de video, selección manual, check o acción “Siguiente” deben actualizar
  una sola condición de lección completada y recalcular el porcentaje sin duplicar progreso.

## Demostración esperada

Demostrar lección automática, manual y contenido complementario.
