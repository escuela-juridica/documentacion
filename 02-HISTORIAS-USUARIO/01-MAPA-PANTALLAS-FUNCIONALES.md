# ESEJUR — Mapa consolidado de pantallas funcionales

## Propósito

Definir las pantallas principales que permiten implementar y presentar las cuatro épicas. Este
mapa no reemplaza las historias: organiza visualmente las capacidades que ellas describen y ayuda
a preparar prototipos, desarrollo frontend y reviews funcionales.

## Criterio de conteo

Se considera **pantalla principal** una vista con propósito, actor y resultado funcional propios.
No se cuentan por separado:

- pestañas dentro de una misma pantalla;
- formularios emergentes o paneles laterales;
- alertas, confirmaciones y mensajes de error;
- estados vacío, cargando, aprobado, rechazado o pendiente;
- el selector externo de cuentas de Google;
- el formulario alojado por Culqi cuando forma parte del checkout;
- el mismo diseño adaptable mostrado en computadora o celular.

Cuando una pantalla tiene varios estados importantes, todos deben diseñarse y probarse aunque el
conteo siga siendo uno. Si durante el diseño se decide separar una pestaña en otra ruta, aumentará
el número técnico de vistas, pero no el alcance funcional del negocio.

## Resumen

| Épica | Pantallas nuevas | Pantallas anteriores reutilizadas en su review | Total aproximado mostrado en la review |
|---|---:|---:|---:|
| EP01 — Acceso y descubrimiento | 11 | 0 | 11 |
| EP02 — Publicación y matrícula | 8 | 3 | 11 |
| EP03 — Desarrollo académico | 9 | 2 | 11 |
| EP04 — Certificación y control | 12 | 4 | 16 |
| **Producto completo** | **40 pantallas principales únicas** | — | — |

El total de una review cuenta también las pantallas anteriores necesarias para entrar al flujo.
No significa que vuelvan a desarrollarse.

## Pantallas de EP01 — Acceso y descubrimiento

| ID | Pantalla principal | Actor |
|---|---|---|
| PF-001 | Inicio y catálogo de cursos | Visitante y alumno |
| PF-002 | Ficha pública y vista previa del curso | Visitante y alumno |
| PF-003 | Inicio de sesión | Alumno y administrador |
| PF-004 | Registro mediante formulario | Visitante |
| PF-005 | Resultado de verificación del correo | Visitante |
| PF-006 | Solicitud de recuperación de contraseña | Visitante |
| PF-007 | Definición de nueva contraseña | Usuario con enlace válido |
| PF-008 | Panel inicial del usuario | Alumno y administrador |
| PF-009 | Mi perfil, datos y seguridad | Alumno y administrador |
| PF-010 | Gestión administrativa de usuarios | Administrador |
| PF-011 | Documentos legales públicos | Visitante y usuario |

## Pantallas de EP02 — Publicación y matrícula

| ID | Pantalla principal | Actor |
|---|---|---|
| PF-012 | Administración de información base | Administrador |
| PF-013 | Gestión y listado de cursos | Administrador |
| PF-014 | Editor integral del curso | Administrador |
| PF-015 | Control de matrículas y pagos | Administrador |
| PF-016 | Confirmación de matrícula gratuita | Alumno |
| PF-017 | Checkout de pago en línea | Alumno |
| PF-018 | Resultado del pago y comprobante informativo | Alumno |
| PF-019 | Mis cursos | Alumno |

La review reutiliza PF-003 para ingresar, PF-001 para encontrar el curso y PF-002 para abrir su
ficha pública.

## Pantallas de EP03 — Desarrollo académico

| ID | Pantalla principal | Actor |
|---|---|---|
| PF-020 | Aula y ruta del curso | Alumno |
| PF-021 | Reproductor de lección y materiales | Alumno |
| PF-022 | Calendario y sesiones del alumno | Alumno |
| PF-023 | Resolución del examen | Alumno |
| PF-024 | Resultado e intentos del examen | Alumno |
| PF-025 | Gestión de sesiones y asistencia | Administrador |
| PF-026 | Cola de respuestas abiertas | Administrador |
| PF-027 | Revisión y calificación de respuestas | Administrador |
| PF-028 | Gestión de excepciones académicas | Administrador |

La review reutiliza PF-003 para ingresar y PF-019 para seleccionar el curso matriculado.

## Pantallas de EP04 — Certificación y control

| ID | Pantalla principal | Actor |
|---|---|---|
| PF-029 | Estado de certificación y confirmación de datos | Alumno |
| PF-030 | Mis certificados | Alumno |
| PF-031 | Visor privado y descarga del certificado | Alumno |
| PF-032 | Verificación pública del certificado | Verificador externo |
| PF-033 | Gestión administrativa de certificados | Administrador |
| PF-034 | Emisión, detalle, corrección y anulación | Administrador |
| PF-035 | Excepciones de matrículas y pagos | Administrador |
| PF-036 | Formulario público de queja o reclamo | Visitante |
| PF-037 | Bandeja administrativa de quejas y reclamos | Administrador |
| PF-038 | Detalle y respuesta de la queja o reclamo | Administrador |
| PF-039 | Centro de reportes | Administrador |
| PF-040 | Dashboard administrativo | Administrador |

La review reutiliza PF-003 para ingresar, PF-019 para llegar desde “Mis cursos”, PF-020 para
mostrar el cumplimiento académico y PF-013 para ejecutar la cancelación completa de un curso.

## Decisiones de agrupación para mantener el sistema simple

- PF-002 integra ficha y vista previa; la reproducción puede abrirse en la misma vista.
- PF-009 integra datos personales, definición o cambio de contraseña y seguridad de la cuenta.
- PF-010 integra listado, creación y habilitación de usuarios; crear puede ser un formulario
  emergente.
- PF-011 reúne privacidad y términos en secciones o pestañas públicas.
- PF-012 reúne tipos, categorías, docentes, entidades, firmantes y materiales mediante pestañas.
- PF-014 usa secciones para datos generales, contenido, sesiones, exámenes, certificación y
  validación de publicación.
- PF-015 incluye la matrícula administrativa y el detalle de matrícula o pago mediante formularios
  o paneles internos.
- PF-023 utiliza estados para instrucciones, desarrollo, temporizador y confirmación de entrega.
- PF-024 reúne resultado, mejor nota, intentos y respuestas visibles según la política definida.
- PF-025 integra reprogramación, cancelación y asistencia por sesión.
- PF-034 concentra emisión manual, corrección y anulación porque operan sobre el mismo certificado.
- La cancelación completa se ejecuta desde PF-013; no requiere una pantalla independiente.
- PF-039 presenta cinco pestañas: matrículas, pagos, seguimiento académico, certificados y
  asistencia.
- PF-040 contiene exactamente cuatro gráficos —evolución de matrículas, matrículas por curso,
  forma de ingreso y pagos confirmados—, sin tarjetas de indicadores, tareas, alertas ni pendientes.

## Uso durante el diseño y desarrollo

Para cada pantalla se debe preparar al menos:

- estado normal con datos;
- estado vacío cuando aplique;
- validaciones y errores recuperables;
- permisos por actor;
- comportamiento adaptable;
- acciones y resultado esperado;
- relación con la pantalla anterior y siguiente del recorrido;
- evidencia que se mostrará en la review.

Los archivos `03-PANTALLAS-FUNCIONALES.md` de cada épica detallan qué debe verse y demostrarse en
cada una de estas pantallas.
