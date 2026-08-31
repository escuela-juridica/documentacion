# ESEJUR — Índice y plan de historias de usuario

> Documento maestro del backlog funcional. **La colección es autosuficiente:** ninguna persona,
> equipo ni IA necesita abrir otro documento para comprender, implementar, probar o presentar una
> historia. La colección consolida dentro de sí todos los acuerdos funcionales vigentes.
> Las decisiones de implementación técnica no cambian los resultados funcionales aquí definidos.

## Propósito

Organizar todo el negocio de ESEJUR en historias asignables a un máximo de dos personas, con
dependencias explícitas y entregables funcionales demostrables durante un ciclo de cinco meses.
Ninguna historia se considera terminada si solo existe su frontend o su backend: debe quedar
integrada y cumplir sus criterios de aceptación.

## Convenciones funcionales transversales

- Todas las fechas, horas, ventanas, vencimientos, cuentas regresivas y tareas programadas se
  interpretan en `America/Lima`, aunque el servidor o el dispositivo usen otra zona.
- Los porcentajes se muestran con su numerador, denominador y meta cuando ayude a comprenderlos;
  nunca se divide entre cero.
- Las notas se redondean convencionalmente a dos decimales antes de comparar aprobación, mejor
  intento, promedio o nivel de certificado.
- Una acción repetida o una notificación externa duplicada no puede duplicar cuenta, matrícula,
  pago, cupo, progreso, intento, asistencia ni certificado.
- Los estados se explican con texto e icono; el color por sí solo no comunica una decisión.
- Estas convenciones forman parte de los criterios de todas las historias que manejen esos datos,
  aunque no se repitan literalmente en cada sección.

## Actores

| Actor | Responsabilidad |
|---|---|
| **Visitante** | Explora el catálogo, revisa vistas previas, crea una cuenta y puede presentar una reclamación |
| **Alumno** | Se matricula, paga, aprende, rinde exámenes, controla su avance y obtiene certificados |
| **Administrador** | Configura y opera la plataforma, atiende excepciones, reclamaciones y reportes |
| **Verificador externo** | Comprueba públicamente la validez de un certificado |
| **Culqi** | Servicio externo que procesa el pago e informa su resultado; ESEJUR no procesa operaciones bancarias |
| **Google** | Servicio externo de identidad para registro e ingreso |
| **Servicio de correo** | Medio externo usado por las once notificaciones del negocio |

El docente solo tiene perfil público. No inicia sesión ni posee historias de gestión.

## Reglas de asignación

- Cada historia recomienda **una o dos personas**.
- Con dos personas, una atiende principalmente frontend y otra backend, pero ambas responden por
  la integración.
- Los nombres se asignarán después. Los archivos conservan `Por asignar`.
- Si una historia no cabe en un sprint con dos personas, se refina o divide sin romper su valor.
- Las tareas técnicas se crean durante la planificación del sprint; no sustituyen la historia.
- Una dependencia indica el orden de aceptación, no obliga a mantener inactivo al siguiente
  equipo: puede adelantarse trabajo con datos controlados, pero la historia no se acepta hasta
  integrar el flujo real.

## Cinco incrementos demostrables

| Mes | Épica | Entregable funcional de la presentación |
|---:|---|---|
| 1 | EP01 | Un visitante descubre un curso, crea o recupera su cuenta, inicia sesión y administra su perfil |
| 2 | EP02 | Administración construye y publica un curso; un alumno se matricula gratis, en línea o por administración y lo ve en “Mis cursos” |
| 3 | EP03 | El alumno abre un curso, consume materiales, completa lecciones y conserva su avance |
| 4 | EP03 | El alumno participa en vivo, rinde exámenes y administración atiende la revisión y las excepciones académicas |
| 5 | EP04 | El alumno obtiene y descarga su certificado; se verifica públicamente y administración atiende reclamaciones, excepciones, reportes y dashboard |

## Documentos para las reviews

Cada carpeta de épica contiene `02-ENTREGABLE-FUNCIONAL.md`. Este documento convierte las
historias terminadas en una presentación funcional y define:

- el producto obtenido al cerrar la épica;
- la preparación y los datos necesarios para la demostración;
- el recorrido funcional que debe presentarse;
- los escenarios alternativos que conviene comprobar;
- las evidencias que deben conservarse;
- los criterios para aceptar el entregable;
- el límite frente a las capacidades de la siguiente épica.

La EP03 puede demostrarse parcialmente en los meses 3 y 4, pero se acepta como producto integrado
al finalizar su segundo bloque. La EP04 cierra la presentación funcional completa del sistema.

Cada carpeta también contiene `03-PANTALLAS-FUNCIONALES.md`, con las vistas que deben desarrollarse
y mostrarse en la review. El mapa consolidado se encuentra en `01-MAPA-PANTALLAS-FUNCIONALES.md`.
El conteo considera pantallas principales, no pestañas, modales, alertas ni estados del mismo
flujo. La propuesta consolidada contempla **40 pantallas principales únicas**.

## Catálogo de historias

### EP01 — Acceso y descubrimiento

| ID | Historia | Personas | Dependencia interna |
|---|---|---:|---|
| HU-001 | Iniciar sesión con correo o Google | 2 | Ninguna |
| HU-002 | Crear una cuenta con formulario o Google | 2 | Ninguna; acuerda con HU-001 el traspaso de Google |
| HU-003 | Verificar mi correo electrónico | 2 | HU-002 para el registro propio |
| HU-004 | Recuperar el acceso a mi cuenta | 2 | Ninguna; retorna a HU-001 |
| HU-005 | Consultar y actualizar mis datos personales | 2 | HU-001 |
| HU-006 | Explorar, buscar y filtrar cursos | 2 | Ninguna |
| HU-007 | Consultar la ficha y vista previa de un curso | 2 | HU-006 para el recorrido integrado |

### EP02 — Publicación y matrícula

| ID | Historia | Personas | Dependencia interna |
|---|---|---:|---|
| HU-008 | Gestionar usuarios administrativamente | 2 | Reutiliza HU-001, HU-003 y HU-005 de EP01 |
| HU-009 | Administrar información base | 1 | Ninguna |
| HU-010 | Crear y configurar un curso | 2 | HU-009 |
| HU-011 | Organizar el contenido de un curso | 2 | HU-010 |
| HU-012 | Programar sesiones en vivo | 2 | HU-011 |
| HU-013 | Configurar exámenes | 2 | HU-011 |
| HU-014 | Configurar requisitos académicos y de certificación | 2 | HU-010; integra HU-012 y HU-013 cuando aplican |
| HU-015 | Validar y publicar un curso | 2 | HU-010 a HU-014 según configuración |
| HU-016 | Administrar el ciclo de vida del curso | 2 | HU-015 |
| HU-017 | Matricularme en un curso gratuito | 2 | HU-015 |
| HU-018 | Matricularme pagando en línea | 2 | HU-015 |
| HU-019 | Matricular administrativamente a un alumno | 2 | HU-008 y HU-015 |
| HU-020 | Consultar y controlar matrículas y pagos | 2 | Al menos una de HU-017, HU-018 o HU-019 |
| HU-021 | Consultar mis cursos y accesos | 2 | Al menos una de HU-017, HU-018 o HU-019 |

### EP03 — Desarrollo académico

| ID | Historia | Personas | Dependencia interna |
|---|---|---:|---|
| HU-022 | Ingresar y continuar un curso | 2 | Ninguna dentro de la épica |
| HU-023 | Consultar materiales protegidos | 2 | HU-022 |
| HU-024 | Completar lecciones y registrar progreso | 2 | HU-022 |
| HU-025 | Avanzar por la ruta académica | 2 | HU-024; integra HU-028 cuando bloquea |
| HU-026 | Participar en sesiones en vivo | 2 | Ninguna dentro de la épica |
| HU-027 | Administrar cambios en sesiones en vivo | 2 | Ninguna dentro de la épica |
| HU-028 | Rendir un examen automático | 2 | Ninguna dentro de la épica |
| HU-029 | Rendir un examen con respuesta abierta | 2 | Ninguna dentro de la épica |
| HU-030 | Calificar respuestas abiertas | 2 | HU-029 |
| HU-031 | Atender excepciones académicas | 2 | Información generada por HU-024, HU-026, HU-028 o HU-030 |

### EP04 — Certificación y control

| ID | Historia | Personas | Dependencia interna |
|---|---|---:|---|
| HU-032 | Obtener mi certificado | 2 | Ninguna dentro de la épica; requiere resultados académicos |
| HU-033 | Consultar y descargar mis certificados | 1 | HU-032 |
| HU-034 | Verificar públicamente un certificado | 1 | HU-032 |
| HU-035 | Emitir manualmente un certificado | 2 | Base de emisión de HU-032 |
| HU-036 | Corregir o anular un certificado | 2 | HU-032 o HU-035 |
| HU-037 | Atender excepciones de matrículas y pagos | 2 | Ninguna dentro de la épica |
| HU-038 | Cancelar completamente un curso | 2 | Se integra con HU-037 |
| HU-039 | Presentar una queja o reclamo | 2 | Ninguna |
| HU-040 | Responder una queja o reclamo | 2 | HU-039 |
| HU-041 | Consultar el reporte de matrículas | 2 | Ninguna dentro de la épica; requiere datos operativos |
| HU-042 | Consultar el reporte de pagos | 2 | Ninguna dentro de la épica; requiere datos operativos |
| HU-043 | Consultar el reporte académico | 2 | Ninguna dentro de la épica; requiere datos académicos |
| HU-044 | Consultar el reporte de certificados | 2 | HU-032 o HU-035 para datos reales |
| HU-045 | Consultar el reporte de asistencia | 2 | Ninguna dentro de la épica; requiere asistencias |
| HU-046 | Consultar el dashboard | 2 | HU-041 a HU-045 |

## Orden de lectura y uso

1. Leer este índice y el archivo `00-DEPENDENCIAS-Y-ORDEN.md` de la épica.
2. Leer íntegramente el MD de la historia asignada; contiene su flujo y reglas completas.
3. Asignar historias de la misma ola a equipos distintos.
4. Refinar puntos y tareas sin reducir el comportamiento funcional descrito.
5. Usar `01-GUIA-CASOS-DE-USO.md` para el diagrama general de la épica.
6. Preparar la review con `02-ENTREGABLE-FUNCIONAL.md` y ejecutar las demostraciones de las
   historias incluidas.
7. Usar `03-PANTALLAS-FUNCIONALES.md` para preparar prototipos y ordenar la navegación visible.
8. La matriz de cobertura es un control interno del análisis y no forma parte de la lectura,
   desarrollo, prueba ni presentación de una historia.

## Criterio general de terminado

Una historia está terminada cuando:

- frontend y backend están integrados cuando ambos son necesarios;
- todos los criterios de aceptación pasan;
- permisos, privacidad, validaciones y estados alternativos funcionan;
- no duplica ni elimina información que el negocio exige conservar;
- las notificaciones asociadas producen el resultado acordado;
- se puede ejecutar su demostración esperada sin intervención improvisada;
- su trazabilidad con reglas y decisiones está actualizada.

## Regla de autosuficiencia documental

Cada historia debe explicar dentro de su propio archivo:

- qué puede hacer cada actor y qué no puede hacer;
- datos obligatorios, opcionales, valores iniciales y cálculos;
- estados iniciales, transiciones, resultados y conservación histórica;
- flujo exitoso, alternativas, errores, reintentos y duplicidad;
- diferencias entre `VIRTUAL`, `EN_VIVO` e `HIBRIDO` cuando afecten el caso;
- correos o avisos y qué sucede si fallan;
- permisos, privacidad y límites explícitos;
- dependencias internas y resultado que frontend/backend deben integrar.

El nivel de detalle se evalúa desde dos perspectivas simultáneas:

- **Usuario:** debe saber qué puede hacer, qué verá, qué debe completar, por qué se bloquea una
  acción y qué resultado obtiene.
- **Equipo de desarrollo:** debe conocer entradas, reglas, estados, transiciones, validaciones,
  duplicidad, conservación, errores y resultado integrado, sin decidir por su cuenta una regla de
  negocio faltante.

## Límites funcionales de la colección

Estos límites evitan interpretar como requisito una función que no forma parte del sistema:

- ESEJUR registra pagos y constancias, pero no emite comprobantes electrónicos SUNAT. La Escuela
  continúa emitiéndolos por su canal actual con la referencia del pago.
- No se migran automáticamente los datos históricos de Moodle ni los certificados de Google Drive.
- Las páginas institucionales, como “Quiénes somos”, “Contáctanos”, “Tesis” e “In house”, continúan
  en la web institucional; ESEJUR cubre la plataforma de cursos.
- ESEJUR no crea reuniones en Zoom ni consulta automáticamente sus asistentes. Administración
  registra el enlace, carga la grabación y controla la asistencia en los flujos descritos.
- El docente no tiene cuenta, panel ni página independiente; aparece con foto, cargo y biografía en
  la oferta pública.
- No existen preguntas y respuestas por lección, valoraciones del curso, lista de espera, foros,
  gamificación, aplicación móvil ni avisos masivos de nuevos cursos.
- Cuando no hay cupo, el curso indica “Sin cupos”; no reserva lugares ni crea una lista de espera.
- No se incluye posicionamiento mediante renderizado en servidor.
- Grupos o matrículas corporativas para cursos In-house, desglose de IGV/comisión de plataforma y
  límites de sesiones simultáneas por cuenta quedan fuera de esta colección.
- No se automatizan devoluciones de dinero. Las excepciones se registran y la Escuela coordina
  cualquier devolución fuera de la plataforma.
