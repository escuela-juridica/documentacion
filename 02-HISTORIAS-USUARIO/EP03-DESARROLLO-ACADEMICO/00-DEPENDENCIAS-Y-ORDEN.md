# EP03 — Dependencias y orden de ejecución

## Entregable funcional

La épica se demuestra en dos incrementos. Primero, el alumno consume un curso virtual, consulta
materiales, completa lecciones y conserva el progreso. Después participa en vivo, registra
asistencia, rinde exámenes automáticos y abiertos, y administración atiende las revisiones y
excepciones.

## Dependencias internas

| Historia | Depende de | Bloqueante para aceptar | Puede adelantarse |
|---|---|---|---|
| HU-022 | Ninguna dentro de la épica | No | Sí, con matrícula activa controlada |
| HU-023 | HU-022 | Sí para acceso integrado | Sí, con sesión controlada |
| HU-024 | HU-022 | Sí | Sí, acordando los eventos de lección |
| HU-025 | HU-024 | Sí; integra HU-028 si bloquea | Sí, con progreso controlado |
| HU-026 | Ninguna dentro de la épica | No | Sí, con sesión programada controlada |
| HU-027 | Ninguna dentro de la épica | No | Sí, con sesión futura controlada |
| HU-028 | Ninguna dentro de la épica | No | Sí, con examen objetivo controlado |
| HU-029 | Ninguna dentro de la épica | No | Sí, con examen abierto controlado |
| HU-030 | HU-029 | Sí | Sí, con intento pendiente controlado |
| HU-031 | Resultado de HU-024, HU-026, HU-028 o HU-030 | Sí para cada excepción real | Sí, con casos controlados |

## Olas recomendadas

1. **Ola A, paralela:** HU-022, HU-026, HU-027, HU-028 y HU-029.
2. **Ola B, paralela:** HU-023 y HU-024 después del acuerdo del aula; HU-030 después del acuerdo
   del intento abierto.
3. **Ola C, paralela:** HU-025 y HU-031.
4. **Integración del mes 3:** HU-022 a HU-025.
5. **Integración del mes 4:** HU-026 a HU-031.

## Puntos de integración obligatorios

- El progreso y la secuencia deben utilizar el mismo resultado de lección completada.
- Una sesión CANCELADA desaparece del denominador de asistencia y no bloquea la secuencia.
- El temporizador del examen no se pausa y su vencimiento envía el intento.
- Un intento con respuesta abierta permanece PENDIENTE_REVISION y bloquea la finalización cuando
  el examen es calificado.
- La intervención administrativa conserva el intento original y registra el motivo de una
  excepción.

## Secuencia de demostración

### Mes 3

1. Abrir “Mis cursos” y continuar donde se quedó.
2. Consultar material protegido.
3. Completar una lección con video y otra manual.
4. Mostrar secuencia, contenido ya completado y avance hacia certificación.

### Mes 4

1. Consultar calendario y entrar a una sesión dentro de horario.
2. Mostrar asistencia, reprogramación o cancelación y grabación.
3. Rendir un examen automático con tiempo y reintento.
4. Enviar una respuesta abierta y calificarla desde administración.
5. Consultar el desempeño y resolver una excepción con motivo.

