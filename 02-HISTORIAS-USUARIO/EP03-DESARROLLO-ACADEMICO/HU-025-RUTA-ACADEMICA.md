# HU-025 — Avanzar por la ruta académica

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 3 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno**, quiero **conocer y seguir la secuencia y los requisitos activos**, para
> **avanzar sin confusión hacia la certificación**.

## Alcance incluido

- Secuencia obligatoria por curso, activa por defecto.
- Para abrir una lección debe completar la anterior cuando la secuencia está activa.
- Examen calificado de módulo puede bloquear el siguiente si así se configuró.
- Si el módulo contiene varios exámenes calificados configurados como bloqueantes, deben aprobarse
  todos antes de liberar el siguiente módulo.
- Sin secuencia, ningún examen bloquea navegación.
- Práctica y examen final no bloquean el siguiente módulo.
- Lo completado queda accesible.
- Bloque “Tu avance hacia el certificado” siempre visible con cada condición activa, valor real y
  meta; no muestra condiciones desactivadas.
- Frase accionable indicando qué falta.

## Flujo principal

1. El alumno consulta el temario y la siguiente acción habilitada.
2. Completa la lección o examen previo.
3. ESEJUR libera el siguiente elemento según configuración.
4. El bloque de certificación actualiza progreso, exámenes, nota y asistencia aplicable.

## Criterios de aceptación

- **Dado** secuencia activa y previo pendiente, **cuando** intenta adelantarse, **entonces** no abre
  y muestra el requisito.
- **Dado** examen bloqueante aprobado, **cuando** vuelve al temario, **entonces** se libera el módulo.
- **Dado** varios exámenes bloqueantes en un módulo, **cuando** queda uno sin aprobar, **entonces** el
  siguiente módulo permanece bloqueado e identifica cada examen pendiente.
- **Dado** secuencia desactivada, **cuando** navega, **entonces** ningún examen bloquea.
- **Dado** curso sin asistencia requerida, **cuando** ve su avance, **entonces** esa condición no se
  muestra.

## Dependencia interna

- Depende de HU-024.
- Integra HU-028 cuando un examen controla avance.

## Orientación de trabajo

- **Frontend:** estados, bloqueo explicado, valores/metas y acción siguiente.
- **Backend:** evaluación de secuencia y condiciones configurables.
- **Integración:** el índice, los botones anterior/siguiente y el acceso directo deben respetar el
  mismo orden y los mismos bloqueos; aprobar el examen requerido libera el módulo correspondiente.

## Demostración esperada

Demostrar secuencia activa, examen bloqueante, secuencia libre y requisitos variables.
