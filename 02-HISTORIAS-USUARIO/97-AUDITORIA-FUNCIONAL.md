# Auditoría funcional de las historias de usuario

Fecha de revisión final: 30 de agosto de 2026.

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
- Se cerró la finalización de lecciones EN_VIVO: asistencia al terminar, grabación para ausentes,
  exclusión de sesión cancelada y ausencia de avance mientras la grabación está pendiente.
- Se hizo irreversible el check completado, de solo lectura cuando es automático, y se definió
  “Completar lección” para el último elemento.
- Se definieron la ventana real del enlace en vivo, la asistencia “No aplica” con cero sesiones y
  la zona horaria `America/Lima` como convención transversal.
- Se cerraron aprobaciones Culqi tardías tras cierre, fecha o cupo, y su tratamiento sin acceso si
  el curso o la matrícula fueron cancelados.
- Se estableció que PRACTICA siempre tiene intentos ilimitados y que desactivar exámenes impide
  conservar evaluaciones CALIFICADO.
- Se detallaron redondeo de notas, plazo de revisión no modificable tras iniciar, puntaje abierto
  inclusivo y observación opcional visible.
- Se eliminó la selección manual del nivel del certificado: una emisión excepcional solo es
  Refrendada si la nota definitiva alcanza ese umbral; cualquier otro caso es Normal.
- Se definieron días calendario y hora de emisión, lugar institucional, momento del correo de
  confirmación y continuidad de una certificación ya finalizada tras vencimiento o cancelación.
- Se aclaró que una corrección conserva el estado VIGENTE y no crea un estado CORREGIDO.
- Se definieron las fechas que gobiernan cada reporte y se limitó el dashboard exactamente a cuatro
  gráficos sin tarjetas de indicadores ni pendientes.
- Se completaron política de contraseña, vigencia/invalidez de enlaces, creación de administradores,
  otorgante del rol y protección del último administrador habilitado.
- Se añadió la especificación de wireframes PF-001 a PF-040, sus estados, modales, responsive,
  navegación administrativa y paleta contextual 60/25/10/5.

## Comprobaciones automáticas finales

- Se encontraron exactamente 46 archivos `HU-001` a `HU-046`, sin saltos ni duplicados.
- Todas las historias contienen información general, formulación Como/Quiero/Para, criterios de
  aceptación, dependencia, orientación frontend/backend/integración y demostración.
- Ninguna historia recomienda más de dos personas.
- No existen referencias RN, decisiones numeradas ni instrucciones de consultar `01-NEGOCIO.md`
  dentro de las historias.
- El inventario conserva exactamente 109 reglas numeradas y 34 decisiones funcionales.
- Las búsquedas de residuos no encontraron reintento de pago PENDIENTE, límite configurable de
  PRACTICA, selección manual de nivel, dashboard de tres gráficos ni CORREGIDO como estado.

## Conclusión

Con el alcance actualmente acordado no queda una inconsistencia funcional conocida ni una regla
aplicable que obligue a consultar el documento de negocio para comprender una historia. Las
decisiones de base de datos, API, infraestructura y despliegue permanecen fuera de las historias;
el documento técnico solo traduce los resultados funcionales sin alterarlos.
