# Auditoría funcional de las historias de usuario

Fecha de revisión: 24 de agosto de 2026.

## Objetivo de la auditoría

Comprobar que cada historia pueda entregarse de forma independiente a una persona usuaria, analista,
programador o herramienta de generación documental sin consultar el documento de negocio.

“Todo el negocio en cada historia” significa que cada archivo contiene íntegramente las reglas que
afectan a su funcionalidad. No significa repetir pagos, exámenes y certificados dentro de una
historia de inicio de sesión cuando no intervienen en ese flujo.

## Criterios aplicados

Cada historia fue revisada para confirmar:

- actor, objetivo y resultado observable;
- datos obligatorios, opcionales, valores iniciales y cálculos;
- precondiciones y permisos;
- flujo exitoso, alternativas, errores y reintentos;
- estados iniciales, transiciones y estados finales;
- duplicidad, conservación histórica y privacidad;
- diferencias entre VIRTUAL, EN_VIVO e HIBRIDO cuando afectan el flujo;
- contenido y comportamiento de correos o avisos;
- responsabilidades concretas de frontend, backend e integración;
- criterios de aceptación demostrables;
- dependencias y demostración funcional.

## Resultado por épica

| Épica | Historias | Resultado |
|---|---:|---|
| EP01 — Acceso y descubrimiento | 8 | Completa y autosuficiente |
| EP02 — Publicación y matrícula | 13 | Completa y autosuficiente |
| EP03 — Desarrollo académico | 10 | Completa y autosuficiente |
| EP04 — Certificación y control | 15 | Completa y autosuficiente |

## Cobertura comprobada

- 46 historias con numeración continua.
- 109 reglas funcionales inventariadas y ubicadas en las historias que las ejecutan.
- 34 decisiones funcionales comprobadas.
- 11 notificaciones comprobadas por destinatario, momento, contenido y efecto ante fallo.
- 4 guías de dependencias y orden.
- 4 guías para diagramas de casos de uso.
- Máximo de dos personas recomendado por historia.
- Cero referencias a códigos de trazabilidad o al documento de negocio dentro de las historias.

## Hallazgos corregidos durante la revisión

- Se aclaró que cancelar completamente un curso conserva para alumnos con acceso previo el contenido
  ya disponible, pero retira reuniones futuras; una aprobación recibida después de cancelar no abre
  contenido.
- Se detallaron fórmula de notas, selección múltiple sin puntaje parcial, intentos ilimitados por
  defecto, habilitación por modalidad, revisión de respuestas abiertas y bloqueos académicos.
- Se completaron las reglas de Google, datos personales, páginas legales y registros de acceso.
- Se ampliaron las validaciones exactas antes de publicar un curso.
- Se detallaron duplicación, restricciones de edición y comportamiento de CERRADO y CANCELADO.
- Se completó la matrícula tardía y su efecto sobre asistencia y certificación.
- Se detallaron constancias de pago, ausencia de reserva de cupo, idempotencia y separación entre
  pago y matrícula.
- Se completaron los estados previos, periodos, niveles y congelamiento del certificado.
- Se incorporaron todos los campos, clasificación, adjuntos, declaraciones, orden y respuesta del
  Libro de Reclamaciones.
- Se explicitó que los correos no utilizan seguimiento avanzado de apertura o entrega y que un fallo
  no modifica la operación funcional ya confirmada, salvo el caso especial de respuesta a una
  reclamación, que permanece pendiente hasta enviarse correctamente.

## Conclusión

No queda una inconsistencia funcional conocida ni una regla del negocio que requiera consultar otra
especificación para comprender una historia. Las decisiones de base de datos, API, infraestructura y
despliegue permanecen fuera de estos archivos porque no cambian el comportamiento funcional que el
equipo debe construir y demostrar.
