# HU-013 — Configurar exámenes

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **crear exámenes interactivos con sus reglas**, para **evaluar o
> practicar de forma automática y permitir revisión humana cuando corresponda**.

## Alcance incluido

- Examen `CALIFICADO` o `PRACTICA`, claramente distinguible.
- Preguntas `SELECCION_UNICA`, `SELECCION_MULTIPLE`, `VERDADERO_FALSO` y `RESPUESTA_ABIERTA`.
- Al agregar una pregunta, `SELECCION_UNICA` aparece como tipo inicial; administración puede
  cambiarlo a cualquiera de los otros tres tipos antes de guardar.
- Puntaje por pregunta, 1 por defecto; respuestas correctas para tipos objetivos.
- Los intentos son ilimitados por defecto; administración puede fijar un máximo entero mayor que
  cero. Agotar intentos sin aprobar deja al alumno sin una nueva oportunidad hasta una excepción
  administrativa con motivo.
- Tiempo límite opcional en minutos; vacío significa sin límite. El tiempo corre desde el inicio y
  no se pausa por cerrar la página, salir de la cuenta o perder conexión.
- Barajado opcional de preguntas y opciones en cada intento.
- Mostrar respuestas correctas al aprobar, al agotar intentos o nunca; “al agotar” no disponible
  con intentos ilimitados.
- En VIRTUAL no existe fecha de habilitación: con secuencia activa, un examen de módulo abre al
  completar sus lecciones y el final al completar todos los módulos; sin secuencia, abre desde que
  la matrícula está ACTIVA.
- EN_VIVO/HIBRIDO puede tener fecha de habilitación opcional. Con fecha, deben cumplirse tanto el
  avance previo como la fecha; sin fecha se usa la apertura automática por avance.
- Decidir si un examen calificado de módulo bloquea el siguiente cuando hay secuencia.
- `dias_revision` para abiertas, tres días calendario por defecto.
- La nota del intento se calcula como `puntaje_obtenido / puntaje_total × 20`, se muestra con hasta
  dos decimales y aprueba desde la nota mínima del curso, 12 por defecto. No existe penalización.
- En selección múltiple solo se entrega el puntaje completo si se marcan todas las alternativas
  correctas y ninguna incorrecta; no existe puntaje parcial automático.
- De varios intentos cuenta la nota más alta. La nota final es el promedio simple de todos los
  exámenes CALIFICADO usando el mejor intento de cada uno; los de PRACTICA no participan.

## Flujo principal

1. Administración ubica el examen en el recorrido.
2. Define finalidad, preguntas, opciones, puntajes y respuestas correctas.
3. Configura intentos, tiempo, barajado, publicación de respuestas y habilitación.
4. Si hay abiertas, define el plazo de revisión.
5. Decide el bloqueo académico permitido y guarda.

## Excepciones y validaciones

- Un examen calificado no puede quedar sin preguntas o puntaje total válido.
- Una pregunta objetiva exige configuración suficiente para calificación automática.
- RESPUESTA_ABIERTA no exige respuesta correcta automática.
- Examen de práctica no bloquea navegación ni certificación.
- El examen final no bloquea el siguiente módulo.
- Si varios exámenes calificados del mismo módulo están configurados como bloqueantes, deben
  aprobarse todos para abrir el módulo siguiente.
- No se configura “aprobar al menos N exámenes”: cada examen que deba contar se marca CALIFICADO y
  todos los calificados deben aprobarse; los demás se marcan PRACTICA.

## Criterios de aceptación

- **Dado** preguntas objetivas válidas, **cuando** se guarda, **entonces** queda definida su
  calificación automática en escala de 0 a 20 con la fórmula y nota mínima del curso.
- **Dado** una pregunta abierta, **cuando** se configura, **entonces** queda con plazo de revisión y
  sin corrección automática.
- **Dado** intentos ilimitados, **cuando** configura publicación de respuestas, **entonces** no
  aparece “al agotar”.
- **Dado** VIRTUAL, **cuando** configura habilitación, **entonces** no necesita fecha programada.
- **Dado** un examen nuevo, **cuando** no se configura límite de intentos, **entonces** permite
  intentos ilimitados y no ofrece mostrar respuestas “al agotar”.

## Dependencia interna

- Depende de HU-011 para ubicación.
- Se integra con HU-014 y HU-015.

## Orientación de trabajo

- **Frontend:** editor de examen y preguntas con opciones condicionales.
- **Backend:** validación de configuración, reglas por modalidad y copia al reutilizar módulos.
- **Integración:** crear un automático y otro abierto, ambos listos para las historias académicas.

## Demostración esperada

Configurar un examen objetivo temporizado y un examen abierto, mostrando diferencias entre
calificado/práctica, intentos, respuestas y bloqueo.

