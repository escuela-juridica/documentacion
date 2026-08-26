# HU-XXX — Título orientado al resultado

## Información general

| Campo | Valor |
|---|---|
| Épica | EPXX |
| Actor principal | Actor |
| Actores secundarios | Si corresponde |
| Incremento | Mes X |
| Personas recomendadas | 1 o 2 |
| Responsable principal | Por asignar |
| Participante | Por asignar |
| Prioridad | Por priorizar |
| Puntos | Por estimar durante refinamiento |

## Historia

> Como **actor**, quiero **objetivo**, para **beneficio**.

## Valor y resultado funcional

Explicar el resultado observable para la persona y la Escuela. La historia no describe tablas,
endpoints, componentes ni tecnologías.

> **Regla:** este archivo debe comprenderse sin consultar otra especificación funcional, otra
> historia ni una lista RN. Si una dependencia entrega datos previos, se explica aquí qué datos y estados se
> esperan.

> **Nivel de detalle obligatorio:** la historia debe permitir que el usuario comprenda el recorrido
> y que el equipo pueda construirlo sin inventar decisiones funcionales. Debe decir expresamente qué
> se muestra, qué ingresa cada actor, qué valida el sistema, qué datos son obligatorios u opcionales,
> qué cambia, qué se conserva, qué ocurre ante error o repetición y cuál es el resultado observable.
> Expresiones como “cuando corresponda”, “según la configuración” o “usar el flujo anterior” solo
> son válidas si la condición o el flujo se explican por completo dentro del mismo archivo.

## Alcance incluido

- Funcionalidades que pertenecen a la historia.
- Automatizaciones y notificaciones que nacen de la misma acción.
- Flexibilidad que el negocio permite.

## Fuera de esta historia

- Funcionalidades expresamente excluidas o atendidas por otra historia.

## Precondiciones

- Estado y permisos necesarios antes de comenzar.

## Flujo principal

1. Acción del actor.
2. Respuesta del sistema.
3. Validación.
4. Resultado.

## Flujos alternativos y excepciones

- Validaciones.
- Errores.
- Reintentos.
- Duplicidad.
- Estados no permitidos.

## Criterios de aceptación

### Escenario 1 — Resultado exitoso

- **Dado** un contexto verificable.
- **Cuando** ocurre la acción.
- **Entonces** se obtiene el resultado observable.

### Escenario 2 — Alternativa o validación

- **Dado** otro contexto.
- **Cuando** ocurre la acción.
- **Entonces** el sistema responde sin romper las reglas.

## Estados y datos del negocio

- Estados iniciales y resultantes.
- Datos obligatorios y opcionales.
- Origen de cada dato, valor inicial y quién puede modificarlo.
- Cálculos o condiciones exactas que derivan valores mostrados.
- Información que debe conservarse.

## Permisos, privacidad y conservación

- Actor autorizado.
- Datos protegidos.
- Historial que no se elimina.

## Notificaciones

- Correo o aviso, momento y comportamiento ante fallo.

## Dependencias dentro de la épica

- Depende de: Ninguna o HU-XXX.
- Es bloqueante: Sí o No.
- Puede adelantarse en paralelo: Sí o No, con condición.

## Orientación de trabajo

### Frontend

- Experiencia, estados visuales y validaciones inmediatas.

### Backend

- Reglas definitivas, estados, automatizaciones y conservación.

### Integración

- Resultado completo y específico que une ambos trabajos. No usar frases genéricas como “integrar
  frontend y backend”: indicar qué acción debe producir qué cambio visible y persistente.

## Demostración esperada

Recorrido observable que se ejecutará en la revisión del sprint.
