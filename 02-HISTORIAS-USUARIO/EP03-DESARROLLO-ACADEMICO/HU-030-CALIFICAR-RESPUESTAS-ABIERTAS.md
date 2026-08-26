# HU-030 — Calificar respuestas abiertas

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 4 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **revisar y puntuar respuestas abiertas dentro del plazo**, para
> **publicar la nota definitiva del intento y liberar la finalización cuando corresponda**.

## Alcance incluido

- Bandeja de intentos PENDIENTE_REVISION con alumno, curso, examen, envío y fecha límite.
- La bandeja permite identificar pendientes, próximos a vencer y vencidos, ordenados por la fecha
  límite más cercana.
- Respuesta completa y puntaje máximo por pregunta.
- Puntaje administrativo válido y finalización de revisión.
- Recalcular nota del intento y mejor resultado; después CALIFICADO.
- Liberar nuevo intento, avance/finalización y certificación según reglas.
- Enviar correo “Tu examen fue calificado”.
- La fecha vencida se señala; no publica nota ficticia ni cierra automáticamente.
- Mientras continúe PENDIENTE_REVISION después del límite, administración mantiene un aviso hasta
  completar la calificación; el vencimiento no aprueba ni altera la respuesta.

## Flujo principal

1. Administración selecciona un intento pendiente.
2. Revisa respuestas y asigna puntajes válidos.
3. Confirma calificación completa.
4. ESEJUR calcula nota, cambia a CALIFICADO y reevalúa el curso.
5. Envía el aviso al alumno.

## Excepciones

- Puntaje fuera del máximo o preguntas pendientes de revisar: no finaliza.
- Intento ya calificado: evita una segunda publicación no controlada.
- Fecha vencida: mantiene obligación y señala demora, sin modificar la respuesta.

## Criterios de aceptación

- **Dado** puntajes completos, **cuando** confirma, **entonces** queda CALIFICADO, publica nota y
  reevalúa finalización.
- **Dado** revisión incompleta, **cuando** intenta finalizar, **entonces** se impide.
- **Dado** plazo vencido, **cuando** consulta bandeja, **entonces** aparece vencido hasta calificarse.
- **Dado** varios pendientes, **cuando** abre la bandeja, **entonces** puede distinguir próximos y
  vencidos y atender primero la fecha límite más cercana.
- **Dado** publicación correcta, **cuando** termina, **entonces** envía al alumno un correo indicando
  que su examen fue calificado y que ya puede consultar el resultado.

## Notificación

- Al publicarse la calificación se avisa por correo que el resultado ya está disponible; la nota no
  se incluye necesariamente en el mensaje y se consulta dentro de la cuenta del alumno.
- Un fallo de correo no devuelve el intento a PENDIENTE_REVISION ni cambia la nota; el aviso puede
  reenviarse y no se controla su apertura o entrega.

## Dependencia interna

- Depende de HU-029.
- HU-031 y HU-032 consumen el resultado.

## Orientación de trabajo

- **Frontend:** bandeja, fecha límite, puntajes y confirmación.
- **Backend:** validación, nota, transición, reevaluación y correo.
- **Integración:** al publicar la revisión, puntajes y comentario deben cerrar el intento como
  CALIFICADO, avisar al alumno y recalcular nota, aprobación, avance y certificación afectada.

## Demostración esperada

Demostrar calificación en plazo y un caso vencido.
