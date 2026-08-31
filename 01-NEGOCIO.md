# esejur — Definición del negocio

> **Fuente de verdad del negocio de esejur.** Todo lo que define qué hace el sistema y por qué
> está aquí. Las decisiones técnicas quedan fuera de la etapa documental actual.
>
> Fuentes: `PROYECTO 2026 AV.docx` (brief del cliente), investigación del sitio real de Escuela
> Jurídica y de udeapolis, y las decisiones acordadas en el análisis.
>
> Última actualización: 2026-08-30 · Estado: 🟢 **cerrado** — negocio e historias funcionales validados

---

## Contenido

| § | Sección | Qué contiene |
|---|---|---|
| [1](#1-qué-es-esejur) | **Qué es esejur** | Definición, dónde vive y convenciones del sistema |
| [2](#2-el-cliente) | **El cliente** | Escuela Jurídica: quién es y qué la diferencia |
| [3](#3-cómo-funciona-hoy) | **Cómo funciona hoy** | El circuito manual que hay que reemplazar |
| [4](#4-objetivo-del-rediseño) | **Objetivo del rediseño** | Lo que pide el cliente y dónde queda resuelto cada requisito |
| [5](#5-modelo-de-negocio) | **Modelo de negocio** | Freemium, precios y vista previa |
| [6](#6-actores) | **Actores** | Quién usa el sistema · persona ≠ usuario |
| [7](#7-estructura-del-contenido) | **Estructura del contenido** | Curso → Módulo → Lección → Material · modalidad · archivos |
| [8](#8-ciclo-de-vida-del-curso) | **Ciclo de vida del curso** | Estados, transiciones y qué no se borra |
| [9](#9-matrícula-y-pago) | **Matrícula y pago** | Flujos, estados, matrícula manual, cupo y cancelación |
| [10](#10-cuentas-y-datos-personales) | **Cuentas y datos personales** | Registro con formulario, Google o creación administrativa, login, consentimiento y cuentas compartidas |
| [11](#11-progreso-del-alumno) | **Progreso del alumno** | Secuencia definida por el administrador, marcado de lecciones y asistencia |
| [12](#12-exámenes) | **Exámenes** | Calificados y de práctica, cuándo se habilitan, control y cálculo de notas |
| [13](#13-certificación) | **Certificación** | Reglas, niveles, emisión, privacidad y verificación |
| [14](#14-catálogo-público) | **Catálogo público** | Tarjeta, ficha, orden, buscador y tipos de curso |
| [15](#15-pantallas-privadas) | **Pantallas privadas** | Panel del alumno, el aula, avance hacia el certificado, calendario y gestión |
| [16](#16-notificaciones) | **Notificaciones** | Los once correos del sistema |
| [17](#17-reglas-de-negocio-consolidadas) | **Reglas de negocio** | Las 109 reglas, agrupadas en 9 bloques |
| [18](#18-alcance-del-proyecto) | **Alcance del proyecto** | Qué se construye, qué se prepara y qué queda fuera |
| [19](#19-registro-de-decisiones) | **Registro de decisiones** | Qué se discutió y cómo se resolvió |
| [20](#20-consultas-al-cliente) | **Consultas al cliente** | Lo que se preguntó y qué respondió |
| [21](#21-documentos-relacionados) | **Documentos relacionados** | El resto de la documentación |

---

## 1. Qué es esejur

**Plataforma propia de cursos jurídicos en línea, con matrícula y pago automáticos, que
reemplaza el Moodle actual de Escuela Jurídica.**

No es solo un sistema de matrícula: es el aula virtual completa. La diferencia con Moodle
es que **aquí se cobra**: el alumno compra el curso y se le abre solo, sin intervención humana.

**Referencia visual y funcional:** udeapolis.com (catálogo y ficha de curso) y Udemy
(vista previa, progreso por lección, "mis certificados").

### Dónde vive esejur

Hoy el cliente tiene dos sitios separados: la web institucional (`escuelajuridica.edu.pe`) y el
Moodle (`aulavirtual.escuelajuridica.edu.pe`).

**esejur vive en su propio subdominio y reemplaza tres cosas: el aula virtual, el catálogo y la
matrícula.** La web institucional se queda como está y enlaza al catálogo nuevo.

Consecuencias:
- Conservan el posicionamiento en buscadores que ya tienen.
- **No se construyen páginas institucionales** ("Quiénes somos", "Contáctanos", "Tesis", etc.):
  esas siguen en la web actual.
- El alcance queda acotado a la plataforma de cursos.

### Convenciones del sistema

| Concepto | Valor |
|---|---|
| **Idioma** | Español. Sin segundo idioma. |
| **Zona horaria** | Hora de Lima (UTC−5). Todas las fechas y horas se muestran en ella. |
| **Moneda** | Soles (S/). |
| **Precios** | **Netos.** No se desglosa IGV ni comisión de plataforma. Si más adelante se decide desglosarlos, se agrega sin cambiar lo ya construido. |
| **Escala de notas** | 0 a 20 (escala peruana). |

La zona `America/Lima` rige promociones, matrículas, sesiones, exámenes, recordatorios,
certificados, reclamaciones, reportes y cualquier fecha límite. Una fecha sin zona nunca se
interpreta con la configuración local del navegador del alumno.

**Nomenclatura interna de modalidad:** `VIRTUAL`, `EN_VIVO` y `HIBRIDO`, siempre en español y sin
tildes. En las pantallas se muestran las etiquetas naturales **Virtual**, **En vivo** e
**Híbrido**.

---

## 2. El cliente

**Escuela Superior de Formación Jurídica y Comunicación Estratégica — Escuela Jurídica (ESEJUR)**

| Dato | Valor |
|---|---|
| Fundada | 2015 |
| Sede | Calle Elías Aguirre 126, Of. 302 — Miraflores, Lima |
| Sitio | escuelajuridica.edu.pe |
| Aula virtual actual | aulavirtual.escuelajuridica.edu.pe (Moodle) |
| Contacto | WhatsApp 926 812 819 · eventos@escuelajuridica.edu.pe |
| Redes | FB escuela.juridica.esejur · IG escuelajuridica7 · LinkedIn escuelajurídicaperú |

**Especialidades:** Derecho Registral, Notarial, Inmobiliario y Urbanístico. Complementa con
Derecho Administrativo, Gestión Pública y habilidades profesionales (redacción y argumentación
jurídica).

**Público:** profesionales, funcionarios y ejecutivos del sector público y privado.

**Clientes institucionales reales**, que respaldan la credibilidad de la Escuela: Cortes
Superiores de Justicia de Huancavelica y La Libertad, Zona Registral, Notarías Raúl Camacho y
Paino, Superintendencia de Bienes Nacionales.

**Diferenciador clave:** sus certificados son avalados por un Colegio de Abogados, lo que los
hace **válidos para concursos públicos**. Es la razón principal por la que un alumno paga.

---

## 3. Cómo funciona hoy

**El problema que hay que reemplazar.** Todo el circuito es manual y depende de una persona.

**Matrícula**
1. El interesado envía datos y voucher de pago por **WhatsApp**
2. Alguien lo matricula **a mano** en el Moodle
3. Se le envían usuario y contraseña por correo

**Aprendizaje**
- Sesiones grabadas de **2 horas** cada una, subidas a YouTube y embebidas en Moodle
- Cada sesión trae además un PDF de presentación

**Certificación**
1. El alumno rinde los exámenes y **avisa** para que le emitan el certificado
2. Se elabora **a mano en Canva**, con el QR también creado manualmente
3. Se envía por correo y se avisa por WhatsApp
4. Se archiva en **Google Drive, en carpetas donde todos ven los certificados de todos**

**Los cuatro dolores:** nada funciona fuera del horario de oficina, todo depende de una persona,
las sesiones de 2 horas no se terminan, y los certificados de todos están expuestos.

---

## 4. Objetivo del rediseño

> Migrar hacia una **edtech de microlearning**: enseñar en cápsulas pequeñas de contenido.

Los cinco requisitos textuales del cliente:

1. El alumno **se matricula solo, 24/7**
2. Cada lección dura **10 a 15 minutos** y enseña **un solo concepto**
3. **Unidades modulares** que se pueden combinar y reordenar
4. El alumno **descarga su certificado solo, 24/7**
5. **Cada alumno ve únicamente sus propios certificados**

### Dónde queda resuelto cada uno

| # | Requisito | Estado | Dónde |
|---|---|---|---|
| 1 | Matrícula 24/7 por el propio alumno | ✅ **Completo** | §9 — registro propio, pago en línea, apertura automática al confirmarse. Sin intervención humana. |
| 2 | Lecciones de 10-15 minutos, un concepto | ✅ **Completo** | §7 — cuando la fuente del video lo permite, la duración se detecta automáticamente y el sistema advierte, sin bloquear, si está fuera del rango recomendado. Las lecciones sin video no exigen duración y la carga de contenido no requiere escribirla manualmente. |
| 3 | Unidades modulares combinables y reordenables | ✅ **Completo** | §7 — al editar un curso, el administrador puede agregar copias completas de módulos existentes de otros cursos, combinarlas y reordenarlas. Para un recorrido dirigido a personas concretas, arma el curso con los módulos necesarios y las matricula manualmente. |
| 4 | Certificado descargable por el alumno, 24/7 | ✅ **Completo** | §13.4 — con días de espera se emite automáticamente y, sin espera, el alumno lo genera cuando confirma su nota. En ambos casos queda disponible siempre y no requiere intervención administrativa. |
| 5 | Cada alumno ve solo sus certificados | ✅ **Completo** | §13.7 — el PDF es privado; el QR lleva a una verificación pública que no expone datos personales. |

---

## 5. Modelo de negocio

**Freemium al estilo Udemy: se paga por el contenido, con vista previa gratuita.**

| Tipo de curso | Qué ve quien no pagó | Qué obtiene al pagar |
|---|---|---|
| **Curso gratuito** | Todo el contenido | — (ya tiene acceso completo) |
| **Curso pagado** | Solo las lecciones marcadas como **vista previa** | Todo el contenido |

**Reglas del modelo:**

- Un curso pagado **no se puede publicar sin al menos una lección de vista previa con contenido
  real disponible**. Es el gancho comercial y la validación es obligatoria, no una sugerencia.
  Una imagen por defecto puede utilizarse como portada del curso, pero **no reemplaza una lección
  de muestra**.
- Las lecciones de vista previa son **públicas**: se ven sin registro y sin matrícula.
- **Un solo pago cubre todo.** Se paga por el contenido; el certificado se obtiene al final,
  al cumplir las reglas del curso. No hay un segundo cobro por certificar. Es el modelo de
  Udemy y udeapolis.
- **Los cursos gratuitos también certifican**, bajo las mismas reglas.
- El precio se muestra con **precio regular tachado** y precio promocional vigente. La promoción
  puede tener **fechas de vigencia opcionales**; sin fechas, es permanente.
- El botón **"Acceder gratis"** solo aparece en cursos gratuitos. En los pagados el único
  camino es "Pagar ahora".

> ### ⚠️ Sobre el "mockup" del cliente
>
> El documento del cliente cierra con una sección titulada *"RESULTADO ESPERADO (APROXIMADO)"*.
> **Esas imágenes son capturas literales de udeapolis**, no un diseño propio: al comparar con las
> páginas reales de udeapolis coinciden **una a una** el título del curso, su descripción, las
> fechas 31/08 al 22/10, la hora 8:30 p.m., los precios S/150 y S/300, el aval del Colegio de
> Abogados de Cañete, las 300 horas académicas y hasta los nombres y fechas de las 16 sesiones.
>
> **Consecuencias, y son importantes:**
>
> - El cliente **nunca especificó un modelo de cobro**. El botón "Acceder gratis" es de udeapolis,
>   para un curso de udeapolis. Llegó junto con la captura, no como una decisión de la Escuela.
> - **Los precios S/150 y S/300 son de udeapolis**, no referencias de precio de Escuela Jurídica.
> - **El Colegio de Abogados de Cañete es el aval de udeapolis**, no de la Escuela (§13.3).
> - Lo que el cliente sí pidió está **solo en el texto** de su documento (§4): microlearning,
>   autoservicio 24/7 y certificados privados. Nada sobre precios ni sobre acceso gratuito.
>
> Por eso el modelo de cobro de esta sección **no contradice al cliente**: llena un vacío que él
> dejó. Igual conviene confirmárselo, porque le pusieron su nombre a esa captura.

---

## 6. Actores

| Actor | Qué hace |
|---|---|
| **Visitante** | Navega el catálogo, ve fichas de curso y lecciones de vista previa. Sin cuenta. |
| **Alumno** | Se registra, se matricula, consume lecciones, rinde exámenes, descarga sus certificados. |
| **Administrador** | Gestiona cursos, módulos, lecciones, materiales, exámenes, precios, alumnos, pagos, reclamaciones, tablas maestras y certificados. Es el único rol de gestión interna. |
| **Docente** | **Solo perfil público**, como en udeapolis: nombre, foto, cargo y bio que aparecen en la tarjeta y en la ficha del curso. **No entra al sistema.** Un acceso propio podrá evaluarse como ampliación futura. |
| **Verificador externo** | Cualquier tercero (empleador, jurado de concurso) que escanea el QR de un certificado para comprobar que es auténtico. |

Para mapear historias de usuario, los roles que realizan acciones son **Visitante, Alumno,
Administrador y Verificador externo**. Docente no origina historias propias porque no ingresa; sus
datos son gestionados por el Administrador. Culqi participa como servicio externo dentro de las
historias de matrícula y pago, no como usuario humano.

### Perfil y acceso son responsabilidades diferentes

- El docente tiene un perfil público con nombre, foto, cargo y biografía, pero no recibe acceso al
  sistema.
- El alumno y el administrador sí utilizan una cuenta para ingresar y realizar sus actividades.
- Los nombres y apellidos se conservan separados porque así deben mostrarse en los certificados.
- Si en el futuro un docente necesita ingresar, esa decisión se evaluará como una ampliación del
  negocio; no forma parte del alcance actual.

---

## 7. Estructura del contenido

Al estilo Moodle, en cuatro niveles:

```
CURSO
 └── MÓDULO            (varios por curso, ordenados)
      └── LECCIÓN      (varias por módulo, ordenadas — la "Sesión 01")
           └── MATERIAL (varios por lección: el video + el PDF + lo que haga falta)
```

**Reglas:**

- Cada **curso representa una convocatoria concreta**. Si la Escuela vuelve a dictar
  el mismo curso en otras fechas, el administrador usa **"Duplicar curso"** y trabaja sobre una
  copia independiente; no se construye una entidad adicional de edición o cohorte.
- Al duplicar un curso se copian su información general, módulos, lecciones, materiales,
  exámenes, preguntas, opciones, reglas de certificación, docentes y beneficios. El nuevo curso
  queda en **BORRADOR**, sin matrículas ni actividad académica, para que el administrador revise
  sus nuevas fechas, precio, cupo y sesiones antes de publicarlo.
- La URL amigable no se copia. ESEJUR propone una nueva dirección única y el administrador debe
  confirmarla antes de guardar el BORRADOR; nunca dos convocatorias comparten la misma URL.
- La duplicación **nunca copia** matrículas, pagos, progreso, intentos, asistencia ni certificados.
  Tampoco duplica los archivos físicos: los nuevos materiales apuntan al mismo archivo almacenado
  o a la misma URL externa. Internamente se conserva la referencia al curso de origen.
- La lección es la **unidad ordenada y marcable** — equivale a "Sesión 01" en el Moodle actual.
- Una lección contiene **varios materiales de distinto tipo**. La captura del Moodle lo muestra:
  Sesión 1 = un video de YouTube **más** un PDF de presentación.
- Los materiales no se dividen en principal y complementarios dentro de la lección. El
  administrador simplemente los ordena arrastrando y soltando, y el alumno los ve en ese orden.
- Cada lección debe enfocarse editorialmente en **un solo concepto**. Cortar y preparar el
  contenido sigue siendo responsabilidad de la Escuela; la plataforma facilita el control sin
  hacer más lenta la carga.
- Cuando la lección tiene un video local o una fuente que entrega metadatos —como YouTube—, el
  sistema **calcula automáticamente su duración**. El administrador no tiene que escribirla.
- Si el video detectado está fuera del rango recomendado de **10 a 15 minutos**, el sistema
  muestra una **advertencia sin bloquear** el guardado ni la publicación. Antes de publicar se
  puede consultar el resumen de videos fuera del rango.
- Una lección **sin video no requiere duración**. Si el video proviene de un enlace externo que
  no permite detectarla, la duración queda opcional y su ausencia no impide cargar ni publicar.
- La duración detectada, cuando existe, se muestra al alumno en el temario.
- Un módulo **pertenece a un solo curso**, pero al editar un curso el administrador puede
  **crear un módulo nuevo** o **agregar un módulo existente**. La segunda opción busca módulos de
  otros cursos y copia el elegido completo dentro del curso actual.
- Los módulos copiados pueden **combinarse y reordenarse libremente** con los demás módulos del
  curso. Para construir un recorrido dirigido a personas concretas, el administrador arma un
  curso con la combinación necesaria y las matricula manualmente.
- Al agregar un módulo existente se copian sus lecciones, materiales y **también sus exámenes**,
  con sus preguntas y opciones. Los archivos físicos no se duplican: las nuevas referencias
  apuntan al mismo archivo almacenado o a la misma URL externa.
- Cada copia queda **independiente**. Si el módulo original cambia, la copia no se actualiza;
  cualquier corrección necesaria se realiza en cada copia.
- Los **exámenes** pueden colgar del **curso** (examen final) o de un **módulo** (examen parcial).
- Cada curso tiene una **URL amigable** propia (`/cursos/diplomado-derecho-registral` en vez de
  `/cursos/12`). Se define desde el inicio: cambiarla después rompe los enlaces ya compartidos.
- **El administrador arma todo el orden.** Ordena los módulos dentro del curso, las lecciones
  dentro de cada módulo, los materiales dentro de cada lección y la posición de los exámenes.
  Nada se ordena solo: el temario que ve el alumno es exactamente el que el administrador armó.

### Modalidad del curso y lecciones en vivo

Las sesiones en vivo **entran en el alcance**. Las imágenes que adjuntó el cliente las muestran
dentro de los módulos (`Módulo 1 — 9 clases` → `Sesión 01 · 31 de agosto`), por lo que forman parte
del mismo recorrido académico.

**Una lección puede ser de dos tipos:**

| Tipo | Qué tiene |
|---|---|
| **`GRABADA`** | Sus materiales, disponibles cuando el alumno quiera |
| **`EN_VIVO`** | Fecha, hora de inicio, hora de fin y **enlace de la reunión**. Después de dictarse se le sube la grabación y **pasa a comportarse como grabada** |

**Modalidad del curso:**

| Modalidad | Significado |
|---|---|
| **VIRTUAL** | Todo grabado, asincrónico. Es lo que hay hoy. |
| **EN_VIVO** | Sesiones con fecha y hora, luego disponibles como grabación. |
| **HIBRIDO** | Mezcla de ambas. |

*(Presencial queda fuera: la Escuela es 100% en línea.)*

**La modalidad la elige el administrador** al crear el curso — hace falta para publicarlo antes
de cargar ninguna lección, porque de ella depende el badge del catálogo. El sistema **avisa** si
no coincide con las lecciones cargadas (por ejemplo, un curso `VIRTUAL` con lecciones en vivo).

**Quién carga qué:**
- El **enlace de la reunión** lo pega el administrador a mano al crear la lección. La plataforma
  no crea reuniones ni consulta participantes directamente en Zoom.
- La **grabación** la sube el administrador después de la sesión, con el mismo flujo actual
  (editan el video y lo publican en YouTube).

### Reprogramación y cancelación de sesiones

Solo las sesiones futuras de cursos con modalidad `EN_VIVO` o `HIBRIDO` pueden reprogramarse o
cancelarse. Estas
opciones no aparecen en VIRTUAL.

#### Reprogramar

- El administrador indica la nueva fecha, hora de inicio, hora de fin y enlace, y registra el
  motivo del cambio.
- Se conservan la fecha, hora de inicio y hora de fin anteriores junto con el motivo y el
  responsable.
- El calendario de todos los alumnos matriculados se actualiza inmediatamente.
- El recordatorio de la fecha anterior se descarta y se programa uno para la nueva fecha.
- Todos los matriculados reciben un correo con el curso, la sesión, la fecha anterior, la nueva
  fecha y el nuevo enlace cuando corresponda.
- Si el recordatorio anterior ya había sido enviado, el aviso de reprogramación se envía de todas
  formas para corregir la información recibida.
- Si la nueva fecha supera `fecha_fin`, antes de guardar debe extenderse también la fecha de fin
  del curso. La fecha programada de certificados aún no emitidos se recalcula con ese cambio.

La sesión conserva su lugar dentro del módulo, su requisito de asistencia y su efecto sobre el
progreso; solo cambia su programación.

#### Cancelar

- El administrador registra obligatoriamente el motivo.
- La sesión permanece visible en el temario y calendario como **CANCELADA** para que el alumno
  entienda qué ocurrió; no se elimina del historial.
- Deja de contar para el total de asistencia y para el progreso obligatorio.
- En una secuencia obligatoria se considera liberada, por lo que no bloquea la siguiente lección
  ni el siguiente módulo.
- Se elimina cualquier recordatorio pendiente y todos los matriculados reciben el aviso de
  cancelación.
- Si la cancelación modifica lo ofrecido, el administrador recibe una advertencia para revisar las
  horas académicas y `fecha_fin`; esos valores no cambian solos.
- La cancelación es definitiva. Si la sesión sí se dictará en otra fecha, debe usarse
  **Reprogramar**, no Cancelar.

Una sesión ya realizada no puede reprogramarse ni cancelarse. Después de realizada solo se puede
corregir su enlace, grabación o asistencia, conservando el registro del cambio.

### Tipos de material

PDF · DOC · PPT · EXCEL · IMAGEN · AUDIO · VIDEO · ZIP · ENLACE

Con extensiones permitidas y tamaño máximo configurables.

### Origen de los archivos

El sistema soporta **tres fuentes** para un mismo material:

| Fuente | Uso | ¿Permite detectar reproducción? |
|---|---|---|
| **Archivo local** | Subido directamente a la plataforma | ✅ Sí |
| **YouTube** | Video no listado, como hoy | ✅ Sí |
| **Enlace externo** | Google Drive, Vimeo, otro cloud | ❌ No |

> ⚠️ Si los videos de YouTube están **públicos**, el contenido pagado es accesible gratis y el
> modelo de negocio se rompe. El sistema debe **exigir y advertir** que sean *no listados*.

### 🔒 Cómo se entregan los archivos

Regla que sostiene todo el modelo de pago: **compartir el enlace de un material no debe permitir
que otra persona acceda sin autorización.**

- Los materiales solo están disponibles para alumnos con derecho de acceso al curso.
- Cada alumno descarga exclusivamente sus propios certificados.
- Compartir un enlace no evita la validación de identidad, matrícula o propiedad del certificado.
- Las lecciones de **vista previa** son la única excepción: son públicas por diseño.

### Ver en línea vs. descargar

Los materiales **se ven en un visor dentro de la plataforma, sin botón de descarga** por defecto.
Cada material tiene un interruptor para permitir la descarga cuando el administrador lo quiera.
Es un negocio de contenido: si el alumno baja todo el primer día, se acabó el valor del acceso.

---

## 8. Ciclo de vida del curso

```
BORRADOR  →  PUBLICADO  →  EN CURSO  →  CERRADO
                  ↓            ↓
               CANCELADO  ←────┘
```

| Estado | Significado |
|---|---|
| **BORRADOR** | Se está armando. No visible para nadie más que el administrador. |
| **PUBLICADO** | Visible en el catálogo y **matriculable**. |
| **EN CURSO** | Ya inició. Sigue visible y admite matrícula mientras no se haya alcanzado su cierre de matrícula, su cupo o el cierre administrativo. Quien entra tarde ve como grabación lo que ya pasó, y su asistencia se calcula solo sobre las sesiones posteriores a su matrícula (§11). |
| **CERRADO** | Terminado. No admite matrículas nuevas; los alumnos matriculados conservan su acceso. |
| **CANCELADO** | La Escuela decidió que el curso no continuará. No admite matrículas ni pagos nuevos, conserva todo su historial y activa el flujo de atención a los alumnos afectados. |

### Validaciones obligatorias antes de publicar

Un curso solo puede pasar de BORRADOR a PUBLICADO cuando su configuración permite que un alumno
realmente lo curse y, cuando corresponda, obtenga su certificado. La publicación se bloquea y se
muestra una lista completa de lo que falta cuando no se cumple alguna de estas reglas:

- Debe tener título, descripción, modalidad, tipo, categoría, horas académicas y al menos un
  módulo con una lección obligatoria disponible.
- Un curso pagado debe tener al menos una lección de vista previa con contenido real. Una portada
  por defecto no cuenta como vista previa.
- El precio regular no puede ser negativo. Cuando existe precio promocional, no puede ser mayor
  que el regular y su fecha de inicio no puede ser posterior a su fecha de fin.
- Los porcentajes de progreso, video y asistencia deben encontrarse entre 0% y 100%.
- La nota mínima y la nota de refrendado deben encontrarse entre 0 y 20, y la nota de refrendado
  debe ser mayor que la nota mínima.
- Si `requiere_examenes` está activo, debe existir al menos un examen calificado con preguntas y
  puntaje total mayor que cero.
- Si `requiere_examenes` está desactivado, no puede quedar ningún examen `CALIFICADO`: antes de
  guardar, el administrador debe convertirlo a `PRACTICA` o retirarlo. Esta validación también
  bloquea la publicación. Un examen `PRACTICA` siempre tiene intentos ilimitados.
- Si `requiere_progreso` está activo, debe existir al menos una lección obligatoria que pueda
  completarse mediante detección de video o confirmación manual.
- Si `requiere_asistencia` está activo, el curso debe tener modalidad `EN_VIVO` o `HIBRIDO` y debe tener al menos
  una sesión futura con fecha, hora de inicio y hora de fin.
- Un curso `VIRTUAL` no puede tener sesiones `EN_VIVO` ni reglas de asistencia. `EN_VIVO` e `HIBRIDO`
  deben tener `fecha_inicio`, `fecha_fin` y sus sesiones dentro de ese periodo.
- La hora de fin de cada sesión debe ser posterior a su hora de inicio. La fecha de cierre de
  matrícula, cuando exista, no puede ser posterior a `fecha_fin`.
- Deben estar definidos los firmantes y los demás datos que aparecerán en el certificado. Si el
  curso puede emitir nivel Refrendado, también debe tener una entidad certificadora activa.

La advertencia editorial de videos fuera de 10 a 15 minutos continúa sin bloquear la publicación:
no es una inconsistencia funcional, sino una recomendación de microlearning.

### Quién mueve el curso entre estados

Las transiciones **PUBLICADO → EN CURSO → CERRADO** son **automáticas según las fechas de inicio
y fin**, cuando existen. El administrador puede **forzarlas** cuando haga falta: adelantar un
cierre, retrasar una apertura o publicar antes de tiempo.

Un curso **VIRTUAL no tiene `fecha_fin`**. Si tampoco tiene `fecha_inicio`, publicar significa que
puede comenzar de inmediato: pasa a EN CURSO y el contenido queda disponible para cada alumno
cuando se activa su matrícula. Si tiene `fecha_inicio`, comienza automáticamente ese día. En ambos
casos permanece EN CURSO hasta que el administrador lo cierre.

Los cursos de modalidad `EN_VIVO` e `HIBRIDO` sí requieren `fecha_inicio`, `fecha_fin` y las fechas de sus
sesiones.

**Un curso que ya tiene matrículas no puede volver a BORRADOR.** Para retirarlo de venta se pasa
a CERRADO: desaparece del catálogo pero los alumnos matriculados conservan su acceso. Nunca se
le quita el contenido a alguien que pagó.

### Nada se borra si tiene gente dentro

- **No se puede borrar un curso** que tenga matrículas. Se retira pasándolo a CERRADO.
- **No se puede borrar un módulo o una lección** cuyo progreso ya esté registrado por algún
  alumno. Se ocultan, pero el registro se conserva.
- Borrar una lección completada por 40 alumnos destruiría su avance y podría invalidar
  certificaciones en curso. El historial académico no se toca.

### Cancelación completa de un curso

Cerrar y cancelar no significan lo mismo. **CERRADO** es el final normal o el retiro de la venta;
**CANCELADO** indica que la Escuela decidió que el curso no continuará.

- Solo el administrador puede cancelar un curso PUBLICADO o EN CURSO y debe registrar el motivo.
- El curso deja de mostrarse para nuevas matrículas y no permite iniciar pagos nuevos.
- Las matrículas que ya estaban ACTIVA forman parte de los alumnos afectados y conservan su pago
  e historial para que la Escuela atienda cada caso.
- Un intento que seguía PENDIENTE no activa acceso por sí mismo. Si Culqi comunica APROBADO después
  de la cancelación, el pago se registra, la matrícula queda CANCELADA y el caso se incorpora a la
  atención externa de pagos; no se abre contenido de un curso que ya no continuará.
- Todas sus sesiones futuras pasan a CANCELADA, se liberan de la secuencia y dejan de contar para
  asistencia y progreso.
- Todos los alumnos matriculados reciben un aviso con el motivo y el canal por el que la Escuela
  atenderá su caso. La cancelación completa envía **un solo correo consolidado por curso**; no
  envía además un correo separado por cada sesión cancelada.
- No se eliminan matrículas, pagos, progreso, asistencia, intentos ni certificados. El contenido
  que ya estuvo disponible permanece consultable por quienes tenían acceso, excepto los enlaces
  de reuniones futuras canceladas.
- Los alumnos que ya habían cumplido todas las condiciones conservan su finalización y continúan
  con la emisión normal de su certificado.
- Quienes todavía no habían cumplido no reciben un certificado automático por el solo hecho de la
  cancelación. La Escuela puede emitirlo manualmente cuando corresponda, con motivo registrado.
- Para quien no había finalizado, el contenido conservado queda **solo en lectura**: puede revisar
  lo que ya estuvo habilitado, pero no completar checks, aumentar progreso, registrar asistencia,
  iniciar o reintentar exámenes ni obtener una nueva `fecha_finalizacion`.
- Si `fecha_finalizacion` ya existía antes de cancelar, una emisión PROGRAMADA continúa, y el
  alumno puede confirmar los datos que falten. Cancelar o vencer después la matrícula tampoco
  retira ese derecho ya obtenido.
- El sistema no ejecuta devoluciones. La Escuela resuelve cada pago por su canal y registra en la
  matrícula afectada la fecha, observación y resultado de esa atención.
- Un certificado ya emitido no cambia ni se anula automáticamente por la cancelación del curso.

---

## 9. Matrícula y pago

**Flujo de un curso pagado — todo automático, sin intervención humana:**

```
Ve la vista previa (sin cuenta)
   → se registra y verifica su correo
   → Culqi procesa el pago
   → Culqi informa el resultado
   → si Culqi informa APROBADO y el curso no fue cancelado, la matrícula se activa sola
   → el contenido se abre de inmediato o en la fecha de inicio configurada
```

**Flujo de un curso gratuito:** se registra y verifica su correo → se matricula → acceso
inmediato o en la fecha de inicio configurada.

**Reglas:**

- En el flujo de autoservicio, el alumno **se registra solo** — por formulario o con Google — y
  necesita el **correo verificado** antes de poder matricularse (§10). La creación administrativa
  de cuenta y matrícula es una excepción controlada.
- Un alumno **no puede matricularse dos veces** en el mismo curso.
- Si Culqi informa varias veces el mismo resultado APROBADO, la matrícula se activa una sola vez.

### Métodos de pago

**Tres medios: tarjeta, Yape y Plin.** Las billeteras cubren al alumno individual, que es el
grueso del público; la tarjeta cubre a quien compra desde una institución o prefiere pagar en
cuotas.

| Método | Estado |
|---|---|
| **Tarjeta de crédito o débito** | ✅ En esta versión. Con cuotas, si Culqi lo ofrece |
| **Yape** | ✅ En esta versión |
| **Plin** | ✅ En esta versión |
| **PagoEfectivo / depósito en efectivo** | ❌ Fuera |

> ### Culqi procesa el pago; ESEJUR aplica el resultado
>
> Yape y Plin también se pueden cobrar "a mano": el alumno transfiere y manda la captura. **Eso
> no sirve aquí**, porque es exactamente lo que hace hoy la Escuela por WhatsApp y lo que este
> sistema viene a eliminar.
>
> **ESEJUR no cobra, no autoriza, no rechaza ni corrige una operación bancaria.** Culqi realiza el
> pago y determina su resultado. ESEJUR solo registra el estado informado y aplica su consecuencia:
> APROBADO activa la matrícula; cualquier resultado no aprobado no concede acceso y permite volver
> a intentar cuando Culqi lo autorice. Todo ocurre automáticamente, sin revisión administrativa.

**Quien no pueda pagar por ninguno de los tres medios de Culqi** — típicamente una institución que compra para
varios trabajadores y paga por transferencia bancaria contra factura — se atiende por la
**matrícula manual del administrador**, que registra el pago externo y su referencia. Ese camino
ya existe y cubre los casos que Culqi no alcanza.

La **constancia de pago** que ve el alumno al terminar incluye número de pedido, importe, moneda,
método de pago, fecha y hora, sus datos y el curso comprado — y si pagó con tarjeta, sus últimos
dígitos. Es **imprimible**: mucha gente lo necesita para rendir el gasto ante su institución.
No es un comprobante tributario SUNAT; la Escuela emite ese documento por su canal actual.

### Estados del pago

Cada intento de pago en línea conserva su propio resultado, separado del estado de acceso de la
matrícula:

| Estado | Cuándo |
|---|---|
| **PENDIENTE** | Culqi todavía no comunica un resultado final. No habilita acceso ni ocupa cupo. |
| **APROBADO** | Culqi confirmó el pago. Activa automáticamente la matrícula y ocupa el cupo cuando existe, salvo que el curso o esa matrícula hayan sido CANCELADOS mientras se realizaba la operación. |
| **RECHAZADO** | Culqi informó que el pago fue rechazado. No habilita acceso ni ocupa cupo. |
| **ERROR** | Culqi informó que la operación no pudo completarse. No habilita acceso ni ocupa cupo. |
| **EXPIRADO** | Culqi informó que la operación perdió vigencia sin ser aprobada. No habilita acceso ni ocupa cupo. |
| **REGISTRADO_MANUAL** | El administrador confirmó dinero recibido fuera de Culqi. Activa la matrícula. |
| **EXONERADO** | La matrícula es una cortesía, beca u otro caso sin cobro. Importe cero y activa la matrícula. |

- Una matrícula puede acumular varios intentos no aprobados; **el primer pago aprobado** es el que
  activa su acceso, salvo la cancelación total del curso o la cancelación individual de esa
  matrícula explicadas en §8 y §9.
- Todos los intentos se conservan para que el alumno y la Escuela puedan comprobar qué ocurrió.
- Si Culqi repite la confirmación de una misma operación, no se genera otro pago ni se
  activa nuevamente la matrícula.
- Un curso gratuito obtenido por autoservicio no genera pago.
- Toda matrícula creada por el administrador genera un registro: REGISTRADO_MANUAL cuando hubo
  dinero o EXONERADO cuando no lo hubo.
- REGISTRADO_MANUAL exige importe, medio, referencia y motivo. EXONERADO exige importe cero y
  motivo. En ambos casos se registra quién realizó la matrícula y cuándo.

**Resultado tardío de una operación iniciada válidamente:**

| Situación al llegar `APROBADO` | Consecuencia automática |
|---|---|
| El cierre de matrícula ya pasó | Se honra el pago iniciado antes del cierre y se activa la matrícula. |
| El curso pasó a `CERRADO` | Se activa la matrícula y conserva el acceso conforme a su vigencia, porque `CERRADO` es un cierre normal, no una cancelación. |
| Otro alumno ocupó el último cupo | Se activa también y se genera una alerta de sobrecupo; una persona cobrada no queda sin curso. |
| La matrícula fue `CANCELADA` | Se registra el pago una sola vez, la matrícula permanece `CANCELADA`, no concede acceso y queda para atención externa. |
| El curso fue `CANCELADO` | Se registra el pago una sola vez, la matrícula permanece `CANCELADA`, no concede acceso y queda para atención externa. |

El cierre, la fecha comercial o el cupo se vuelven a validar para **iniciar** una operación nueva,
pero no invalidan un cobro que Culqi aprobó después de haberse iniciado correctamente. ESEJUR no
cambia ni revierte el resultado bancario.

### Estados de la matrícula

```
PENDIENTE_PAGO  →  ACTIVA  →  VENCIDA
        ↓            ↓
     CANCELADA    CANCELADA
```

| Estado | Cuándo |
|---|---|
| **PENDIENTE_PAGO** | El alumno inició la compra, pero todavía no existe un pago aprobado. |
| **ACTIVA** | El alumno tiene concedido el acceso porque el pago fue aprobado, el curso es gratuito o la operación administrativa quedó REGISTRADO_MANUAL o EXONERADO. Para utilizarlo, la cuenta también debe estar habilitada y debe haber llegado la fecha de inicio cuando exista. |
| **CANCELADA** | Solo por el administrador, con motivo registrado. |
| **VENCIDA** | Se agotó la vigencia del acceso, si el curso tenía una. |

El estado de la matrícula representa el **derecho de acceso concedido**. La disponibilidad real
del contenido también depende de que la cuenta esté habilitada y de que haya llegado la fecha de
inicio cuando exista. La finalización académica se
registra por separado mediante **`fecha_finalizacion`** cuando el alumno cumple todos los
requisitos académicos del curso:

- Sin fecha de finalización: el alumno todavía está avanzando.
- Con fecha de finalización: el alumno terminó académicamente, aunque su matrícula siga ACTIVA.
- Si después la matrícula pasa a VENCIDA, conserva la fecha de finalización y los certificados
  obtenidos.
- Cancelar o vencer el acceso no borra el historial académico.

### Reintentos de pago

Si Culqi comunica un resultado **RECHAZADO**, **ERROR** o **EXPIRADO**, el alumno puede seleccionar
**"Volver a pagar"**.
La matrícula se mantiene en PENDIENTE_PAGO y el nuevo intento queda asociado a esa misma compra;
no se crea otra matrícula.

- Solo puede existir un intento PENDIENTE a la vez para la misma matrícula. Su vigencia y resultado
  dependen de Culqi; ESEJUR no le asigna un plazo propio.
- Cada reintento conserva su propio resultado y no reemplaza el historial anterior.
- Al aprobarse uno, la matrícula pasa a ACTIVA y deja de mostrarse la opción de volver a pagar.
- Solo el resultado APROBADO comunicado por Culqi concede acceso. ESEJUR no cambia por su cuenta un
  RECHAZADO, ERROR o EXPIRADO a APROBADO.

ESEJUR no presume que hubo un cobro ni cambia estados por el transcurso del tiempo: únicamente el
resultado comunicado por Culqi determina si el alumno puede reintentar o si su matrícula se activa.

### Matrícula manual del administrador

Autoservicio no significa *solo* autoservicio. La Escuela va a necesitar matricular a mano —
pagos por transferencia bancaria, cortesías, cursos in-house, un pago que falló — igual que hace
hoy el 100% de las veces.

- El administrador puede **crear una matrícula directamente**, sin pasar por Culqi.
- Si hubo dinero, registra REGISTRADO_MANUAL con importe, medio, referencia y motivo.
- Si fue cortesía, beca u otra exoneración, registra EXONERADO con importe cero y motivo.
- Así el registro de ingresos queda completo aunque el cobro no haya pasado por el sistema, y
  la Escuela tiene el dato para emitir su comprobante.

### Cuándo se abre el contenido

En cursos **VIRTUALES**, `fecha_inicio` es opcional y la opción `fecha_fin` **no se muestra**:

- Sin `fecha_inicio`, el catálogo muestra **"Inicio inmediato"** y el contenido se abre al
  activarse la matrícula.
- Con `fecha_inicio`, el catálogo muestra la fecha. Antes de ella, el alumno matriculado ve el
  temario completo y una cuenta regresiva, pero no las lecciones.
- El curso permanece disponible hasta que el administrador lo cierre. No se programa un cierre
  automático por fecha.
- Cada alumno puede avanzar mientras su matrícula permanezca ACTIVA.

En cursos de modalidad `EN_VIVO` e `HIBRIDO`, `fecha_inicio`, `fecha_fin` y las fechas de las sesiones son
obligatorias.

Las **lecciones en vivo** son la excepción: su tarjeta aparece en el temario desde el primer día,
pero el botón **"Ingresar a la sesión"** solo se habilita desde la hora de inicio hasta la hora de
fin. Antes se muestra la hora y una cuenta regresiva con el botón deshabilitado; después se
reemplaza por **"Grabación pendiente"** o por la grabación disponible. No se entrega el enlace de
reunión fuera de la ventana, por lo que tampoco puede registrar asistencia fuera de ella.

### Cierre de matrícula en cursos con sesiones en vivo

Los cursos de modalidad `EN_VIVO` e `HIBRIDO` pueden tener `fecha_cierre_matricula`:

- Si la asistencia es obligatoria, su valor inicial es `fecha_inicio`.
- El administrador puede extenderla para aceptar alumnos después de iniciado el curso.
- Si la asistencia no es obligatoria, la fecha es opcional; vacía significa que se admite
  matrícula hasta que el curso se cierre o complete su cupo.
- Si ya no quedan sesiones futuras y la asistencia es obligatoria, no se permite la matrícula
  automática aunque la fecha de cierre todavía no haya llegado.
- Al alcanzarse el cierre, el curso sigue visible, pero muestra **"Matrícula cerrada"** y no
  permite iniciar el pago.
- El administrador puede matricular manualmente después del cierre, con una advertencia de que el
  alumno no podrá certificar automáticamente por asistencia.

Los cursos VIRTUALES no muestran `fecha_cierre_matricula`: admiten matrículas mientras permanezcan
abiertos, exista cupo y el administrador no los cierre.

### Cupo

El curso puede definir una **capacidad de venta**. Vacío significa sin límite. Se utiliza
principalmente en modalidades `EN_VIVO` o `HIBRIDO`, porque las salas de videoconferencia tienen
tope. Un curso `VIRTUAL` puede dejarla vacía.

En los cursos con límite, **el cupo se ocupa únicamente cuando la matrícula queda ACTIVA**:

- Antes de mostrar o iniciar el pago se comprueba que exista cupo disponible.
- Un intento PENDIENTE no reserva ni ocupa cupo y no concede acceso.
- Cuando Culqi informa APROBADO, la matrícula se activa automáticamente y recién entonces ocupa
  el cupo.
- RECHAZADO, ERROR o EXPIRADO no ocupan cupo.
- Una matrícula gratuita o manual ocupa el cupo en el momento de activarse.
- Si una operación que se inició con cupo llega APROBADA después de que otra matrícula ocupó el
  último lugar, ambos alumnos reciben acceso porque ambos pagaron. La administración recibe una
  alerta de sobrecupo para ajustar la capacidad operativa. Esta excepción incluye aprobaciones
  simultáneas y confirmaciones tardías de operaciones iniciadas válidamente.
- Los cursos sin límite simplemente activan la matrícula cuando corresponde.

**Cuando el cupo se llena**, el curso sigue visible en el catálogo pero se muestra como
**"Sin cupos"** y deja de admitir nuevos pagos o matrículas. **No hay lista de espera**.

### Vigencia del acceso

Campo opcional de días. Vacío = **acceso permanente**, que es la decisión por defecto.

Cuando existe un número `N`:

1. La fecha base es la posterior entre la activación de la matrícula y `fecha_inicio` del curso,
   cuando exista.
2. La fecha base cuenta como día 1.
3. El último día de acceso es `fecha_base + (N - 1) días calendario`.
4. El acceso vence a las 23:59:59 de ese último día en hora de Lima y pasa a `VENCIDA`.

Así una compra anticipada no consume vigencia antes de que el contenido pueda utilizarse.

> El "acceso ilimitado" que aparece en las imágenes del documento del cliente es de udeapolis,
> no un compromiso de la Escuela (§5). El permanente por defecto es decisión propia.

**Cuando la vigencia se agota**, la matrícula pasa a **VENCIDA** y el alumno pierde el acceso al
contenido del curso. Pero **conserva para siempre el certificado ya emitido**, su descarga y su
página pública de verificación: se ganó cuando el acceso era válido y no se le quita nunca.

### Cancelación

- Solo el **administrador** puede cancelar una matrícula, y debe registrar el **motivo**.
- Si cancela una matrícula con un intento PENDIENTE, ESEJUR no cancela ni altera la operación de
  Culqi. Si posteriormente llega APROBADO, registra el pago, mantiene la matrícula CANCELADA y
  crea el caso de atención externa sin entregar contenido.
- **El sistema no devuelve dinero.** No hay política de reembolso en la plataforma: la Escuela
  resuelve caso por caso por su canal. En el sistema solo queda el registro de la cancelación
  con su motivo.

---

## 10. Cuentas y datos personales

### Cómo se registra y entra el alumno

Hay **tres caminos**, y los tres llevan a una sola cuenta por correo.

#### Camino A — Formulario

Sigue la forma del formulario de udeapolis, con tres diferencias: **apellido materno separado**,
**contraseña** y **confirmación de contraseña**.

| Campo | |
|---|---|
| Correo electrónico | obligatorio |
| Nombres | obligatorio |
| Apellido paterno | obligatorio |
| Apellido materno | **opcional** durante el registro; obligatorio al confirmar los datos del certificado |
| WhatsApp | **opcional**; se guarda como `telefono` |
| DNI | **opcional**; se registra como dato personal y no se utiliza para emitir el certificado |
| Contraseña | obligatorio |
| Confirmar contraseña | obligatorio |
| ☐ Acepto la política de privacidad y los términos | obligatorio |

**La contraseña se escribe dos veces.** Es un campo más, pero evita el problema que no tiene
arreglo cómodo: alguien se equivoca al tipear, queda registrado con una clave que no conoce, y
tiene que pasar por recuperar contraseña antes siquiera de haber entrado la primera vez.

Toda contraseña propia debe tener al menos ocho caracteres e incluir una letra mayúscula, una letra
minúscula y un número. La interfaz muestra estas cuatro condiciones mientras se escribe y no
permite guardar si falta alguna.

Los apellidos van **separados desde el inicio**: el paterno es obligatorio y el materno puede
dejarse vacío durante el registro o la edición del perfil. Antes de emitir un certificado, la
persona debe completar y confirmar ambos apellidos porque así aparecerán en el documento. El
alumno puede registrar su **DNI de manera opcional** durante el registro o
después desde su perfil. Dejarlo vacío no impide crear la cuenta, matricularse, estudiar, pagar,
rendir evaluaciones ni obtener el certificado.

**WhatsApp es la etiqueta visible; `telefono` es el dato común.** Es el canal por el que la
Escuela opera hoy — matrícula, avisos y consultas — y el que sus alumnos realmente usan. Sigue
siendo opcional y las notificaciones automáticas se envían por correo (§16).

El formulario lleva **protección anti-robot**. Un registro público sin ella se llena de cuentas
basura en semanas.

Este camino exige **verificar el correo**: sin verificar se puede navegar y ver la vista previa,
pero no matricularse. Si no, se le cobra a alguien y el certificado va a un correo inexistente.

#### Camino B — Continuar con Google

Un clic. Google entrega **el correo ya verificado**, el nombre, los apellidos y la foto.

- Ese usuario **se salta el correo de verificación**: Google ya validó que la cuenta es suya. Es
  el paso donde más gente se pierde, así que ahorrarlo importa.
- Antes de habilitar la cuenta para matricularse, debe aceptar la política de privacidad y los
  términos vigentes. La aceptación se registra igual que en el formulario.
- ⚠️ **Google entrega los apellidos en un solo bloque** (*"Pérez García"*), no separados en
  paterno y materno: esa separación es una convención peruana que Google no maneja. Por eso el
  desglose se completa después, en la pantalla del certificado.
- No es "gmail o no gmail": un correo corporativo alojado en Google Workspace — por ejemplo
  `@escuelajuridica.edu.pe` — **también entra por este botón**. Lo que distingue los caminos es
  el método elegido, no el dominio del correo.

#### Camino C — "Que me creen la cuenta"

Un botón de **WhatsApp** en la misma pantalla de registro: *"Contáctanos para que creemos una
cuenta por ti"*.

Reconoce algo cierto: una parte del público de la Escuela no se va a registrar solo. En vez de
perder a esa persona, la captura por el canal que ya usa y el administrador completa el proceso:

- Ingresa correo, nombres, apellidos, `telefono` opcional y DNI opcional.
- Si el correo ya tiene cuenta, utiliza esa misma cuenta y **no cambia su contraseña**.
- Si es una cuenta nueva, su contraseña temporal es **`Escuela1415@`** y queda con la condición
  **CAMBIO_PENDIENTE**.
- Puede crear al mismo tiempo la matrícula manual y su operación REGISTRADO_MANUAL o EXONERADO
  (§9).
- El DNI puede dejarse vacío o registrarse como dato personal opcional; no forma parte de los
  requisitos del certificado.

Al crear una cuenta nueva, el sistema envía un correo de bienvenida con un código de verificación
de seis dígitos, la contraseña temporal y el orden de los pasos que debe completar. La administración también
puede comunicar esas instrucciones por el canal mediante el cual el alumno solicitó ayuda.

Una cuenta con rol Administrador solo puede ser creada por otro administrador habilitado. Se
registra quién concedió el rol. Un administrador no puede desactivarse a sí mismo y el sistema no
permite dejar a la plataforma sin al menos un administrador habilitado. El nuevo administrador
entra restringido a su propia habilitación; no ejecuta operaciones administrativas hasta verificar
el correo, aceptar los documentos y cambiar la contraseña temporal.

En el primer ingreso, el alumno debe completar, en este orden, la verificación de su correo, la
aceptación de los términos y la política de privacidad, y la definición de una contraseña propia.
Puede entrar al panel principal, donde ve en todo momento un aviso que no puede ocultar:

> **Estás usando una contraseña temporal. Cámbiala para proteger tu cuenta.**

Mientras alguna de las tres condiciones continúe pendiente puede revisar su panel, pero no abrir
cursos, rendir exámenes ni consultar certificados. El aviso desaparece y la cuenta queda
habilitada únicamente después de verificar el correo, aceptar los documentos y cambiar la
contraseña. Entonces puede utilizar el acceso correspondiente a sus matrículas ACTIVA.

#### Iniciar sesión

Correo y contraseña, o el botón de Google. Más **"¿Olvidaste tu contraseña?"**.

Una cuenta administrativa con CAMBIO_PENDIENTE puede iniciar sesión con `Escuela1415@`, pero solo
accede al panel y al cambio de contraseña hasta completar la verificación y seguridad inicial.

La verificación del correo utiliza un **código de seis dígitos** enviado a la dirección registrada.
Solo el código más reciente puede utilizarse una vez; solicitar un reenvío invalida el anterior.
El enlace para recuperar contraseña dura **60 minutos**; usarlo o solicitar uno nuevo invalida el
anterior. Un código incorrecto o un enlace vencido o consumido explica el problema y ofrece una
acción segura para volver a solicitarlo sin revelar públicamente si el correo existe.

> **Por qué con contraseña y no sin ella.** Existe la opción de entrar solo con el correo, sin
> contraseña, recibiendo un código en cada login — es lo que hace udeapolis. Se descartó por una
> razón concreta: **el público de la Escuela son funcionarios de Cortes Superiores, Zona
> Registral y notarías**, con correos institucionales de filtros agresivos. Si ese filtro retiene
> el correo, el alumno pagó y **no puede entrar, sin plan B**. Con contraseña, un correo demorado
> es una molestia; sin contraseña, es un bloqueo total. Además la fricción sería en cada visita,
> no solo la primera. Quien quiera entrar sin contraseña ya tiene el botón de Google, que hace lo
> mismo mejor y en un clic.

**El login no bloquea nada público.** El catálogo, la ficha de curso y las lecciones de vista
previa se ven sin cuenta. La sesión se pide recién al momento de matricularse — como en Udemy.

#### Un correo, una sola cuenta

Si alguien se registró por formulario con `juan@gmail.com` y después hace clic en "Continuar con
Google" con ese mismo correo, **entra a la misma cuenta**: los dos accesos quedan vinculados.

Sin esta regla terminarías con cuentas duplicadas y un alumno convencido de que perdió los cursos
que pagó.

A la inversa también: quien entró por Google puede **definirse una contraseña** desde su perfil
cuando quiera — por ejemplo, para entrar desde una computadora donde no tiene su sesión abierta.
Su cuenta queda con los dos accesos.

#### Dónde se completan los datos personales y del certificado

Los tres caminos convergen en la pantalla **"Confirma tus datos"** (§13.8), antes de emitir el
certificado. El alumno puede completarla desde su perfil o desde el avance del curso, incluso
antes de terminar:

| Se registró por... | Qué le falta completar ahí |
|---|---|
| **Formulario** | Puede registrar o editar el **DNI opcional**. Los nombres y apellidos ya vienen desglosados. |
| **Google** | Debe **separar los apellidos** en paterno y materno para el certificado. Puede registrar el DNI opcionalmente. |
| **Creación administrativa** | Completa cualquier nombre o apellido faltante. Puede registrar el DNI opcionalmente. |

Los tres caminos permiten conservar el DNI cuando el propio alumno decide proporcionarlo, sin
convertirlo en una condición de acceso o certificación. Para emitir el certificado solo deben
estar completos y confirmados los nombres, apellido paterno y apellido materno.

### Datos personales y condiciones de uso

El sistema recolecta nombres, apellidos y correo; el teléfono y el DNI solo se registran cuando la
persona decide proporcionarlos. En Perú estos datos están regulados por la **Ley N.º 29733 de
Protección de Datos Personales**.

- El registro por formulario o Google exige aceptar la política de privacidad y los términos
  antes de habilitar la cuenta para matricularse. Una cuenta creada por administración puede
  existir antes de esa aceptación, pero no permite utilizar cursos, exámenes ni certificados hasta
  que el alumno acepte los documentos en su primer ingreso.
- Existen dos páginas públicas: **política de privacidad** y **términos y condiciones**.
- Se guarda **cuándo** aceptó cada usuario y **qué versión** del texto aceptó.

Es barato de implementar y evita un problema real: son datos de abogados y funcionarios públicos.

### Libro de Reclamaciones

**Obligatorio por el Código de Protección y Defensa del Consumidor** para todo negocio que vende
al consumidor en Perú — y la plataforma va a cobrar en línea. Es una **página pública**, enlazada
desde el **pie de toda la plataforma** junto a la política de privacidad y los términos.

Encabeza con la fórmula legal: *"Conforme a lo establecido en el Código de Protección y Defensa
del Consumidor Peruano, esta institución cuenta con un Libro de Reclamaciones a tu disposición."*

#### Datos de quien reclama

Tipo y número de documento · Nombres · Apellidos · Correo electrónico · Celular · Dirección.

Si la persona tiene sesión abierta, **vienen prellenados** con los de su cuenta. Pero la página
**funciona sin cuenta**: cualquiera puede reclamar, esté registrado o no.

#### Datos de lo contratado

Monto reclamado · Descripción del producto o servicio.

#### Queja o reclamo — no son lo mismo

La ley los distingue, y el formulario obliga a elegir:

| | Qué es |
|---|---|
| **Queja** | Disconformidad con la atención del proveedor, **sin relación directa** con el producto o servicio adquirido. |
| **Reclamo** | Disconformidad **con el producto o servicio** en sí. |

Luego, dos campos abiertos: **"Cuéntenos ¿qué pasó?"** y **"¿Qué podemos hacer por usted?"**.

La diferencia sirve para clasificar el caso, no para decidir si se responde: **la Escuela debe
responder tanto las QUEJAS como los RECLAMOS** dentro del mismo plazo máximo de 15 días hábiles
improrrogables.

#### Adjuntos

Imágenes opcionales que evidencien el reclamo — típicamente el comprobante de pago. Hasta 5 MB
por imagen.

#### Declaración jurada

Dos afirmaciones que el usuario acepta al enviar:

1. Declara ser el usuario del servicio y **manifiesta bajo declaración jurada** la veracidad de
   los hechos descritos.
2. Autoriza que se le comunique cualquier respuesta al correo consignado.

#### Qué hace el sistema

El Libro cubre el flujo completo entre el consumidor y la Escuela, sin exigir una cuenta y sin
crear un portal adicional de seguimiento.

##### 1. Presentación

- Valida los datos obligatorios, la declaración jurada y la autorización para responder al correo
  indicado.
- Acepta varias imágenes opcionales; cada una puede pesar hasta 5 MB.
- Al enviar, asigna un **número correlativo**, registra la fecha y deja la reclamación en
  **PENDIENTE_RESPUESTA**.
- Calcula `fecha_limite_respuesta` a **15 días hábiles**, plazo máximo e improrrogable para
  reclamos y quejas conforme a la [regla vigente de Indecopi](https://www.gob.pe/institucion/indecopi/noticias/1296574-los-emprendedores-ya-pueden-generar-su-libro-de-reclamaciones-de-manera-rapida-y-sencilla-sin-costo-alguno).
- El día hábil siguiente a la presentación es el día 1. No se cuentan sábados, domingos ni
  feriados oficiales peruanos. Si se presenta en un día no hábil, el conteo comienza el siguiente
  día hábil. Todo se calcula con fecha de Lima y con el calendario oficial peruano vigente.
- Muestra una confirmación con número, fecha de presentación, estado y fecha máxima de respuesta.
- Envía al consumidor una constancia con la copia de los datos presentados y su número. Ese
  correo es su prueba y su medio de seguimiento.
- Avisa inmediatamente a la Escuela que existe una nueva reclamación pendiente.

##### 2. Atención por la Escuela

El administrador dispone de una bandeja exclusiva del Libro de Reclamaciones:

- Muestra número, fecha, tipo QUEJA o RECLAMO, nombre, correo, producto o servicio, estado y
  `fecha_limite_respuesta`.
- Los casos PENDIENTE_RESPUESTA se ordenan por la fecha de vencimiento más próxima.
- Permite filtrar entre pendientes y respondidos y buscar por número, documento, nombre o correo.
- Resalta los casos próximos a vencer y los vencidos. El vencimiento no impide responder ni cambia
  el contenido presentado por el consumidor.
- El administrador abre el caso, consulta todos los datos y adjuntos y redacta la respuesta de la
  Escuela.
- Para responder se exige el texto de respuesta; se registran la fecha y el administrador
  responsable.

##### 3. Respuesta al consumidor

- La respuesta se envía al correo que el consumidor autorizó en el formulario.
- Solo cuando el envío se completa, el caso pasa a **RESPONDIDO**.
- El correo incluye el número de reclamación, el resumen del pedido, la respuesta de la Escuela y
  la fecha de atención.
- Si el correo no puede enviarse, el caso continúa PENDIENTE_RESPUESTA y la administración ve una
  alerta para corregir el correo o reintentar el envío.
- Una respuesta enviada queda cerrada para edición y se conserva como evidencia. El administrador
  puede reenviar la misma respuesta sin alterar su contenido ni la fecha original.

No se construye una sección de seguimiento para el consumidor: recibe la constancia inicial y la
respuesta final por correo. El formulario, la reclamación original, sus imágenes, la respuesta y
los datos de atención se conservan juntos.

### Cuentas compartidas

Riesgo real en formación profesional: una persona compra y pasa la clave a cinco colegas del
estudio. **Se registra cada acceso** (quién, cuándo, desde dónde), que es la base para
detectarlo. Limitar las sesiones simultáneas queda identificado pero **no se implementa ahora**.

---

## 11. Progreso del alumno

**Automático donde se puede, manual solo donde no se puede.** Las dos formas no conviven en la
misma lección: cada lección es de un tipo o del otro, según su fuente de video. **Una lección sin
video** — por ejemplo, solo un PDF — **se marca siempre a mano**: no hay nada que detectar.

**Lecciones con detección (video propio o YouTube):**
- Se marcan **solas** al alcanzar un **porcentaje configurable del video**.
- El check es **solo de lectura**: el alumno no puede marcarlo ni desmarcarlo. Refleja la evidencia
  de reproducción registrada por ESEJUR.

#### Cuánto hay que ver para que cuente

**Un porcentaje configurable por curso, con 50% por defecto** — el mismo umbral que usa udeapolis,
que se lo avisa al alumno: *"para marcar esta clase como completada necesitas ver al menos el 50%
del video"*.

Exigir el 100% sería contraproducente: nadie ve los últimos segundos, y la lección quedaría
eternamente incompleta por diez segundos de cierre. El curso que quiera ser más estricto sube el
número; el que quiera ser laxo lo baja. **Al alumno se le muestra cuánto le falta**, no se le
deja adivinando por qué no se marca.

**Lecciones sin detección (enlace externo, o lecciones sin video):**
- No hay marcado automático posible: **solo existe la casilla manual**.
- El **administrador** ve un aviso técnico al elegir esa fuente, explicando el motivo.
- El **alumno** no ve ningún mensaje técnico: solo su casilla.
- La casilla manual puede accionarse únicamente mientras la lección está pendiente. Una vez
  completada queda fija, igual que un check automático, para que el avance no retroceda por una
  pulsación accidental.

Un curso puede **mezclar** lecciones de ambos tipos sin problema. En cualquier caso, el
**porcentaje de avance del curso es calculado** a partir de las lecciones completadas, no un
número que alguien escribe.

> **Limitación conocida y aceptada:** en las lecciones de marcado manual el progreso es
> *declarado por el alumno*. Si un curso certificara solo por progreso y todo su contenido
> estuviera en enlaces externos, el alumno podría marcarlo sin ver nada. Se acepta el riesgo;
> se mitiga combinando la regla de progreso con exámenes.

### El orden lo define el administrador, y el alumno lo sigue

**El administrador arma el orden con total libertad** — módulos, lecciones dentro de cada módulo,
materiales dentro de cada lección. Ese orden no es decorativo: **es la ruta que el alumno
recorre**.

- Para abrir una lección, el alumno debe haber **completado la anterior**.
- Para entrar a un módulo, debe haber **completado el módulo anterior**.
- Cada lección muestra un **check** en la lista, como una lista de avance. Dentro de la lección
  también existe el botón **"Siguiente"**; en la última se muestra **"Completar lección"**.

**Qué cuenta como completar**, según lo que tenga la lección:

| La lección tiene | Se completa cuando |
|---|---|
| Uno o más videos con detección | El alumno alcanza el **umbral configurado** en cada video detectable (50% por defecto). El check refleja automáticamente el resultado |
| Video sin detección, contenido escrito o solo otros materiales | El alumno marca el **check** de la lección o pulsa **"Siguiente"**; ambas acciones la completan |
| Sesión `EN_VIVO` | Al terminar su horario, queda completada para quien tiene asistencia automática o corregida. Quien no asistió la completa posteriormente con la grabación: por umbral si es detectable o mediante check/"Siguiente" si no lo es |

No existe un material principal. Los materiales se presentan en el orden definido por el
administrador. En las lecciones de completado manual, el alumno elige entre marcar el check desde
la lista o avanzar con el botón; en las de video detectable, ninguna de esas acciones evita el
umbral de reproducción.

Las lecciones ya completadas quedan **siempre accesibles**: puede volver atrás cuantas veces
quiera. Lo que no puede es adelantarse a lo que todavía no vio.

Una sesión todavía futura o en estado **"Grabación pendiente"** no completa la lección para quien
no asistió y puede mantener la secuencia bloqueada. Subir posteriormente una grabación no elimina
el completado de quienes asistieron. Una sesión CANCELADA se excluye del progreso obligatorio y se
considera liberada para la secuencia.

Los **exámenes siguen la misma lógica**: el de un módulo se habilita al completar sus lecciones, y
el final al completar todos los módulos (§12). Cada examen calificado de módulo tiene la opción
**"Bloquea el siguiente módulo"**:

- Se activa por defecto cuando el curso utiliza secuencia obligatoria.
- Si está activa, el alumno debe aprobar ese examen antes de abrir el siguiente módulo.
- El administrador puede desactivarla para permitir el paso normal entre módulos aunque el examen
  siga siendo obligatorio para certificar.
- Los exámenes de práctica y el examen final no muestran esta opción.
- Si varios exámenes del mismo módulo bloquean el avance, hay que aprobarlos todos.
- Cuando la secuencia del curso está desactivada, ningún examen bloquea la navegación.

#### Se puede desactivar por curso

Es un **interruptor del curso**, activo por defecto. Un curso que prefiera dejar todo abierto
—una recopilación de conferencias sueltas, por ejemplo— lo apaga y el alumno navega libremente.

> ⚠️ **La contraparte de secuenciar:** si una lección se rompe —un enlace externo caído, un video
> que se despublicó— el alumno **queda trabado y no puede avanzar en nada**. Con orden libre se
> saltaba el problema; aquí no. Es una razón más para que el administrador pueda desactivar la
> secuencia de un curso sin tener que rehacerlo.

### Asistencia a sesiones en vivo

Es el dato que alimenta la condición de asistencia para certificación (§13.1). Y tiene un límite que
conviene tener claro: como Zoom no comparte directamente sus participantes con la plataforma, el
sistema no puede saber quién permaneció realmente en la reunión.

Lo que sí se puede hacer, y es lo que se hace:

- **Registro automático:** el sistema anota al alumno que **abre el enlace desde la plataforma
  entre la hora de inicio y la hora de fin de la sesión**. Solo registra una asistencia por alumno
  y sesión. Abrir el enlace antes o después no cuenta.
- **Corrección manual:** el administrador puede ajustar la asistencia de cualquier sesión usando
  como respaldo el reporte de participantes que obtiene de Zoom.

La hora de fin es obligatoria y debe ser posterior a la hora de inicio. Esta ventana evita que un
alumno marque asistencia entrando cuando la clase ya terminó. Sigue siendo una señal aproximada:
demuestra que abrió la reunión durante su horario, no cuánto tiempo permaneció conectado.

Si un alumno no tiene ninguna sesión elegible, la asistencia se muestra como **"No aplicable — sin
sesiones elegibles"**, no como 0%. Cuando la asistencia es requisito, esa condición permanece
incumplida y bloquea la certificación automática; la matrícula manual advierte esta consecuencia y
la salida disponible es una excepción administrativa documentada.

**Quien se matricula tarde no queda castigado.** Si alguien entra en la semana 5, su asistencia
se calcula **solo sobre las sesiones posteriores a su matrícula**. Las anteriores las ve
grabadas. Sin esta regla, cualquiera que se matricule después del inicio no podría certificar
nunca por asistencia — le venderías un curso que no puede aprobar.

Las grabaciones anteriores pueden contar para progreso, pero **nunca reemplazan asistencia**. Si
la asistencia es obligatoria y ya no quedan sesiones futuras, la matrícula automática se cierra.
Una matrícula manual posterior muestra la advertencia de que no podrá certificar automáticamente
por asistencia.

Como el administrador sube la grabación **después** de la sesión, hay una ventana en la que la
lección ya pasó y todavía no hay video. En ese lapso la lección se muestra como **"grabación
pendiente"**, para que el alumno sepa que falta subirla y no que se perdió algo.

### Qué pasa cuando cambia el contenido de un curso

Las condiciones académicas no pueden cambiar después de que el alumno empezó. La regla depende
del estado del curso:

- En **BORRADOR**, el administrador modifica libremente módulos, lecciones, materiales, exámenes
  y reglas de certificación.
- En **PUBLICADO**, mientras todavía no inicia, puede seguir modificándolos. Si ya existen
  matrículas, el sistema muestra una advertencia antes de cambiar el temario o los requisitos.
- En **EN CURSO**, o desde que algún alumno empezó a avanzar, no puede eliminar módulos o
  lecciones, agregar nuevas lecciones obligatorias, eliminar exámenes calificados, aumentar la
  nota mínima, el progreso o la asistencia exigidos, ni cambiar las reglas de certificación.
- Un examen que ya tiene intentos no permite editar sus preguntas u opciones.

Una vez iniciado sí se permiten correcciones que **no cambian las condiciones académicas**:

- Corregir títulos y descripciones.
- Reemplazar un video o archivo dañado y corregir enlaces.
- Agregar materiales complementarios que no cuenten para el avance.
- Ocultar temporalmente contenido con problemas mientras se corrige.
- Corregir enlaces y reprogramar o cancelar sesiones futuras con motivo registrado. Las sesiones
  realizadas no cambian de fecha ni se cancelan.

El avance continúa calculándose, pero su conjunto de lecciones obligatorias queda estable y no se
reduce por contenido agregado después. Si la Escuela necesita incorporar contenido obligatorio o
cambiar requisitos, duplica el curso y aplica los cambios a la nueva convocatoria.

---

## 12. Exámenes

- Un curso puede tener **varios exámenes**; cuelgan del curso o de un módulo.
- En un examen `CALIFICADO`, los reintentos son configurables: ilimitados o con tope de N. El
  valor inicial es ilimitado. Un examen `PRACTICA` es siempre ilimitado y no muestra un campo de
  máximo de intentos.
- **Escala peruana 0-20.** Nota mínima de aprobación **12** por defecto, editable por curso.
- El comportamiento principal es **automático**: cuando todas las preguntas son para marcar, la
  nota se calcula y se muestra al enviar el intento.

### Tipos de pregunta

| Tipo | Respuesta | Calificación |
|---|---|---|
| **SELECCION_UNICA** | Marca una alternativa | Automática |
| **SELECCION_MULTIPLE** | Marca una o varias alternativas | Automática |
| **VERDADERO_FALSO** | Marca verdadero o falso | Automática |
| **RESPUESTA_ABIERTA** | Escribe una respuesta | Revisión del administrador |

Al crear una pregunta se ofrece primero SELECCION_UNICA, porque los tipos automáticos serán los
más usados. RESPUESTA_ABIERTA es opcional y solo se utiliza cuando la Escuela necesita evaluar
una explicación escrita.

### Calificado o no calificado

Cada examen es de uno de dos tipos, y el alumno **lo ve antes de entrar**:

| Tipo | Qué significa | Lo que ve el alumno |
|---|---|---|
| **Calificado** | Cuenta para la nota final y **hay que aprobarlo** para certificar | Badge **"Debes aprobarlo"** |
| **No calificado** | Práctica. No afecta la nota ni el certificado | Badge **"Práctica"** |

El badge importa: sin él, el alumno no distingue el examen que decide su certificado del que es
para practicar, y se entera tarde. Los no calificados se pueden rendir las veces que quiera sin
consecuencia — son para estudiar, no para medir. Esta regla no puede ser reducida por la
configuración de intentos de un examen calificado.

### Cuándo se habilita un examen

- En un curso **VIRTUAL** no se muestra una configuración de fecha para el examen. Con secuencia
  activa, el examen de un módulo se habilita al completar sus lecciones y el examen final al
  completar todos los módulos. Con secuencia desactivada, queda disponible desde que la matrícula
  está ACTIVA.
- En cursos de modalidad `EN_VIVO` o `HIBRIDO` se puede indicar opcionalmente `fecha_habilitacion`. Sin
  fecha se aplica la apertura automática por avance. Con fecha, el alumno debe haber completado el
  contenido requerido y además haber llegado a esa fecha.

Es la misma lógica de secuencia que rige las lecciones (§11): se avanza sobre lo ya completado.
Un examen que se puede rendir sin haber visto nada no mide aprendizaje, mide suerte — y en un
certificado válido para concursos públicos, eso importa.

Habilitar un examen y usarlo como bloqueo son decisiones diferentes. Un examen calificado de
módulo puede tener activa la opción **"Bloquea el siguiente módulo"**. Si el alumno lo desaprueba,
puede revisar lo anterior y volver a intentarlo, pero no abre el siguiente módulo hasta aprobar.
Al agotar sus intentos, se aplica la solicitud de intento adicional. El administrador también
puede dejar la opción desactivada para que el alumno continúe normalmente y apruebe el examen
antes de certificar.

### Control del examen

Tres ajustes configurables **por examen**, para que la Escuela decida cuán exigente es cada uno:

| Ajuste | Comportamiento |
|---|---|
| **Tiempo límite** | En minutos. Vacío = sin límite. |
| **Barajar** | Preguntas y opciones en orden distinto en cada intento. |
| **Mostrar respuestas correctas** | Al aprobar, al agotar los intentos, o nunca. |

Con **intentos ilimitados**, la opción "al agotar los intentos" no se ofrece: nunca se agotan.
En ese caso se elige entre "al aprobar" o "nunca".

Cuando existe tiempo límite, empieza a correr al iniciar el intento y no se detiene por cerrar la
página, perder conexión o salir de la cuenta. El alumno ve el tiempo restante durante todo el
examen.

> **Por qué importan.** Con reintentos ilimitados, nota más alta, sin tiempo y con las preguntas
> siempre en el mismo orden, cualquiera entra, mira, sale y repite hasta memorizar — y estos
> certificados son **válidos para concursos públicos**. Estos tres ajustes permiten cerrar esa
> puerta cuando el curso lo amerite, sin obligar a hacerlo en todos.

### Cómo se rinde un examen

- El alumno puede **avanzar y retroceder** entre las preguntas.
- Un listado numerado distingue las preguntas respondidas, pendientes y marcadas para revisar.
- Puede marcar alternativas o escribir una respuesta, según el tipo de pregunta.
- **Lo respondido se conserva a medida que avanza.** Si se le cae el internet o cierra el
  navegador, no pierde lo que ya respondió.
- **Un intento interrumpido se retoma** con el tiempo que todavía le quede. Cerrar la página o
  perder conexión no pausa ni reinicia el límite.
- Al llegar a cero, el intento se **envía automáticamente**, las preguntas no respondidas reciben
  cero y el intento consume una oportunidad.
- Si el tiempo terminó mientras el alumno estaba desconectado, al volver ve el intento enviado y
  su resultado o estado PENDIENTE_REVISION, según los tipos de pregunta.
- Antes de enviar, ve un resumen de las preguntas sin responder y confirma el envío definitivo.
- Si todas las preguntas son automáticas, la nota aparece inmediatamente.

Una falla excepcional puede atenderse mediante el intento adicional que el administrador ya puede
otorgar con motivo registrado; no se modifica ni se elimina el intento vencido.

### Revisión de respuestas abiertas

Cuando un intento contiene al menos una RESPUESTA_ABIERTA:

1. Las preguntas para marcar se califican automáticamente.
2. El intento queda **PENDIENTE_REVISION** y el alumno ve que aún no tiene nota definitiva.
3. El administrador revisa cada respuesta abierta, asigna un valor inclusivo entre cero y el
   puntaje máximo de la pregunta y puede escribir una observación opcional. Si la escribe, el
   alumno la consulta junto al resultado publicado.
4. Al terminar todas las revisiones, el intento queda **CALIFICADO** y la nota se publica
   automáticamente.

Cada examen con respuesta abierta tiene `dias_revision`: **3 días calendario por defecto**,
editable antes de iniciar el curso. Al enviar el intento se calcula `fecha_limite_revision` y el
alumno ve un mensaje como *"Tu examen será calificado como máximo el 15 de septiembre"*.

Una vez iniciado el curso, `dias_revision` queda bloqueado para no cambiar el compromiso ya
comunicado a los alumnos.

- La administración ve los intentos pendientes, próximos a vencer y vencidos.
- Al superarse el plazo, el intento no se aprueba solo: continúa PENDIENTE_REVISION y se generan
  avisos administrativos hasta que sea calificado.
- No se permite iniciar otro intento mientras el anterior siga PENDIENTE_REVISION.
- En un examen calificado, la revisión pendiente bloquea la finalización académica y la emisión
  del certificado. Al terminarla, se recalculan automáticamente la nota y todas las condiciones.
- En un examen de práctica también se informa la fecha máxima de revisión, pero su resultado no
  afecta la certificación.
- El alumno recibe un aviso cuando su examen queda CALIFICADO.

### Si agota los intentos sin aprobar

Solo puede pasar en exámenes con tope de intentos — con reintentos ilimitados, que es el valor por
defecto, no ocurre. Pero cuando pasa, el alumno queda en un punto muerto: **no puede aprobar, no
puede reintentar y no obtiene una fecha de finalización**.

- El aula **se lo dice con todas las letras**: agotó sus intentos, no aprobó, y por eso no puede
  certificar. No se le deja adivinando.
- El **administrador puede otorgarle un intento adicional**, registrando el motivo.

Es la misma válvula que el documento usa en todos lados: el sistema resuelve solo el caso normal,
y queda una salida humana para la excepción — igual que la matrícula manual (§9) y la emisión
manual de certificados (§13.4).

### Cómo se calculan las notas

- Cada pregunta tiene un puntaje; **1 por defecto**. El administrador puede asignar más puntaje a
  una pregunta que requiera mayor desarrollo.
- En SELECCION_MULTIPLE se obtiene el puntaje completo solo si se marcan todas las alternativas
  correctas y ninguna incorrecta. No hay puntaje parcial automático.
- Una respuesta incorrecta o no respondida obtiene cero. **No existe penalización** por error.
- La nota del intento se convierte a la escala de 0 a 20 con la fórmula:

  `puntaje_obtenido / puntaje_total × 20`

- La nota se muestra con un máximo de dos decimales y se aprueba cuando es igual o mayor que
  `nota_minima` del curso.
- **De un examen con varios intentos, cuenta el intento con la nota más alta.** Es lo que hacen
  Udemy, Cisco y Moodle: si se permiten reintentos, castigar el último intento no tiene sentido.
- **La nota final del curso es el promedio de los exámenes calificados**, cada uno con su mejor
  intento. Los no calificados no afectan la nota final.
- Todos los exámenes calificados tienen el mismo peso.
- Esa nota final es la que decide el **nivel del certificado** (§13.2).

**Redondeo único y visible:** la nota de cada intento se redondea a dos decimales con redondeo
decimal convencional antes de compararla con `nota_minima`. El mejor intento se elige entre esas
notas visibles. La nota final promedia las mejores notas ya redondeadas, vuelve a redondearse a dos
decimales y ese mismo valor visible decide Normal o Refrendado. Nunca se muestra `12.00` y se trata
internamente como desaprobado.

---

## 13. Certificación

### 13.1 Reglas configurables por curso

El administrador arma la regla con **tres condiciones independientes**: exámenes, progreso y
asistencia. Cada una puede activarse o desactivarse antes de iniciar el curso.

| Condición | Configuración y valor inicial |
|---|---|
| **Exámenes** | `requiere_examenes`: sí · `nota_minima`: 12 · `nota_refrendado`: 14 |
| **Progreso** | `requiere_progreso`: según modalidad · `progreso_minimo`: 80% · `umbral_video`: 50% |
| **Asistencia** | `requiere_asistencia`: solo disponible en `EN_VIVO` o `HIBRIDO` · `asistencia_minima`: 80% |

**Valores iniciales según modalidad:**

| Modalidad | Exámenes | Progreso | Asistencia |
|---|---:|---:|---:|
| **VIRTUAL** | Sí | Sí | **No se muestra la opción** |
| **En vivo** | Sí | No | Sí |
| **Híbrido** | Sí | Sí | Sí |

Son valores iniciales, no restricciones. El administrador puede desactivar exámenes o progreso en
cualquier modalidad y puede desactivar asistencia en `EN_VIVO` o `HIBRIDO`. En `VIRTUAL` la opción de
asistencia **no aparece**, porque no existen sesiones a las que asistir.

**Exámenes:** si la condición está activa, hay que aprobar todos los exámenes calificados. Un
intento PENDIENTE_REVISION todavía no está aprobado y bloquea la finalización y el certificado
hasta que el administrador califique las respuestas abiertas. Si la condición se desactiva, el
curso puede no tener exámenes o conservar exámenes de práctica; sus notas no afectan la
certificación. Sin exámenes obligatorios no existe nota final ni certificado refrendado.

**Progreso:** se calcula y muestra siempre, aunque no sea requisito para certificar. Una lección
con video local o YouTube se completa automáticamente al alcanzar `umbral_video` en cada video
detectable; cuando la fuente externa no permite detectar reproducción o la lección no tiene video,
se completa marcando su check o pulsando "Siguiente".
Solo el contenido obligatorio entra en el porcentaje; los materiales complementarios no cuentan.

**Asistencia:** se registra en cursos de modalidad `EN_VIVO` o `HIBRIDO` aunque el administrador no la exija para
certificar. Nunca se ofrece ni se calcula en cursos VIRTUALES.

**No existe la opción "al menos N exámenes".** Sería un segundo mecanismo para lo mismo y
chocaría con el cálculo de la nota final: si un curso pidiera "aprobar 2 de 3" y el alumno nunca
rinde el tercero, no habría forma de saber si su promedio se calcula sobre dos exámenes o sobre
tres contando un cero — y de ese número depende el nivel del certificado.

**El tipo de examen ya resuelve ese caso.** Si la Escuela quiere que solo dos cuenten, marca dos
como **calificados** y deja el tercero como **práctica**. Un solo mecanismo, sin ambigüedad.

Con esto se cubren: *"solo exámenes"*, *"solo progreso"*, *"solo asistencia"*, cualquier
combinación de dos o las tres condiciones. Si las tres están desactivadas, no existe una forma
automática de demostrar la finalización y el certificado solo puede emitirse manualmente, con
motivo registrado.

### 13.2 Niveles de certificado

| Nota final | Nivel |
|---|---|
| ≥ 12 | **Normal** — emitido por Escuela Jurídica |
| ≥ 14 | **Refrendado** — avalado además por un Colegio de Abogados |

**Los tres números tienen que ser coherentes entre sí**, y el sistema lo valida al configurarlos:

- El umbral del nivel **Normal es siempre la nota mínima del curso** — no un número aparte. Si un
  curso exige 15 para aprobar, quien apruebe con 15 obtiene certificado Normal.
- El umbral **Refrendado debe ser mayor** que la nota mínima. Si no, todo el que aprobara saldría
  refrendado y el nivel Normal no se emitiría nunca.
- Por defecto son 12 y 14, los valores que usa hoy la Escuela.

El nivel refrendado es el que da valor para concursos públicos.

**Si el curso no exige exámenes, el certificado es siempre Normal.** Las tres condiciones
permiten certificar solo por progreso o solo por asistencia; en esos casos no existe nota final,
y sin nota no hay forma de decidir el nivel. **El Refrendado exige nota, es decir, exige
exámenes.**

### 13.3 Entidades y firmantes — tablas maestras

- **Entidad certificadora:** nombre, logo, activo. **Cada curso indica cuál lo refrenda**, porque
  la Escuela cambia de aval según el curso y no puede estar fijo en ninguna parte.

  Se cargan **tres**:

  | Entidad | Origen |
  |---|---|
  | **Colegio de Abogados de Lima** | Aval declarado en la web de Escuela Jurídica |
  | **Colegio de Abogados de Lima Sur** | Aval declarado en la web de Escuela Jurídica |
  | **Ilustre Colegio de Abogados de Cañete** | Aparece en el documento del cliente *(llegó con la captura de udeapolis, §5)* |

  Si alguna resultara no corresponder, **se desactiva desde el panel** — no se borra, para no
  afectar a los certificados ya emitidos, que conservan copia de su entidad (§13.5).
- **Firmante:** nombre, cargo, imagen de firma, activo. *(Hoy: Mgt. Lilia Mercedes Guerra Macedo
  — Directora Ejecutiva; Mgt. Yourka Lisbeth Lucich Berrio — Comité Consultivo de Asuntos
  Académicos.)*

Ambos se administran desde el panel. **Un cambio de directora no debe requerir tocar código.**

### 13.4 Emisión y contenido

**La emisión no requiere revisión ni autorización administrativa.** Puede quedar programada por
los días de espera del curso o generarse inmediatamente cuando el alumno confirma que ya no desea
mejorar su nota. En ambos casos deben cumplirse las condiciones académicas y temporales, y el
alumno debe haber confirmado sus datos.

| # | Condición | |
|---|---|---|
| 1 | El alumno **cumple la regla de certificación** del curso | §13.1 |
| 2 | El curso **llegó a su fecha de fin**, si tiene una | |
| 3 | Pasaron los **días de espera** configurados para ese curso, o el alumno confirmó la emisión inmediata cuando son cero | 0 por defecto |
| 4 | El alumno confirmó **nombres, apellido paterno y apellido materno** | §13.8 |

**Por qué la condición 2.** Sin ella se emitirían documentos con fechas futuras. En un diplomado
en vivo de diez semanas, un alumno puede cumplir la regla en la semana tres — y el certificado
diría *"Cursado del 31 de agosto al 22 de octubre"* estando en septiembre. Es un documento con
valor legal certificando un periodo que todavía no ocurrió. Un curso VIRTUAL sin fecha de fin no
se ve afectado: puede continuar con la emisión al cumplir la regla. En ese caso, el periodo del
certificado se determina con `fecha_matricula` y `fecha_finalizacion` del alumno.

**Por qué la condición 3.** `dias_espera` es configurable por curso, se cuenta en **días
calendario** y vale cero por defecto. Le da
a la Escuela margen para cerrar notas, imprimir certificados físicos o revisar casos antes de que
salgan. Es lo que hace udeapolis con su *"dentro de 3 días al finalizar el curso"*, pero aquí es
decisión de cada curso.

La fecha se calcula sin que el administrador tenga que escribirla para cada alumno:

1. `fecha_base_emision` es la fecha en que el alumno cumple todos los requisitos académicos o la
   `fecha_fin` del curso si esta es posterior.
2. `fecha_emision_programada` es `fecha_base_emision + dias_espera`.
3. La emisión programada se ejecuta desde las 00:00 de esa fecha en `America/Lima`.

En VIRTUAL no existe `fecha_fin`, por lo que se usa la fecha en que el alumno cumple sus
requisitos. `EN_VIVO` e `HIBRIDO` nunca pueden programar una emisión anterior a su `fecha_fin`.

#### Cuando hay días de espera

Si `dias_espera` es mayor que cero, el certificado se genera automáticamente en
`fecha_emision_programada`. Hasta ese momento el alumno puede utilizar los reintentos disponibles
para mejorar su promedio. El aula muestra el promedio actual, el nivel proyectado, la fecha
límite para mejorar y un mensaje como *"Tu certificado estará disponible el 25 de octubre"*.

#### Cuando la emisión es inmediata

Si `dias_espera` es cero, antes de crear el certificado se muestra una confirmación clara con el
promedio actual, el nivel que obtendrá y este aviso:

> **Al generar tu certificado, tu nota y nivel quedarán cerrados. Ya no podrás realizar nuevos
> intentos en los exámenes calificados.**

El alumno puede elegir:

- **"Generar certificado ahora"** — se emite inmediatamente, sin intervención administrativa.
- **"Seguir mejorando mi nota"** — no se genera todavía y conserva los reintentos disponibles.

Mientras no lo genere, el aula mantiene visible el botón para emitirlo cuando esté conforme.

#### Después de emitir

El nivel Normal o Refrendado se decide con el mejor promedio existente al momento de emisión. En
ese instante quedan cerrados los nuevos intentos de todos los exámenes calificados. Si el alumno
intenta volver a rendir uno, ve: *"Tu certificado ya fue emitido con la nota final registrada; ya
no es posible modificarla"*. Los exámenes de práctica pueden seguir disponibles.

Si las condiciones académicas y temporales ya se cumplieron pero faltan datos, el certificado
queda pendiente sin generar el PDF. El aula muestra **"Confirma tus datos para emitir tu
certificado"** y el alumno recibe un correo con acceso directo al formulario. Si la fecha
programada ya llegó, la emisión continúa al confirmar; si la emisión es inmediata, después de
confirmar se muestra el aviso final antes de generarlo.

- Un alumno recibe **un solo certificado por curso**.
- **Contenido del PDF** (según la plantilla real de la Escuela): nombre completo del alumno,
  tipo y título del curso, rango de fechas cursadas, total de horas académicas, lugar y fecha
  de emisión, **QR de verificación**, logo y las firmas configuradas.
- El lugar de emisión se obtiene de la configuración institucional de la Escuela y su valor
  inicial es **"Lima, Perú"**; no se escribe nuevamente en cada curso.
- **Emisión manual:** igual que existe la matrícula manual (§9), el administrador puede emitir un
  certificado a mano, registrando el motivo. Sirve para lo que la automatización no cubre: un
  alumno que cumplió pero quedó trabado por un error, un acuerdo especial, una corrección tardía.
  Si el alumno todavía no tiene `fecha_finalizacion`, la emisión manual la registra con la fecha
  de la acción. No puede ser anterior a la matrícula ni futura. Puede resolver una excepción
  académica o temporal, pero no omite los datos obligatorios del alumno, la regla de un certificado
  por curso, la conservación del historial ni la privacidad.

La emisión manual tampoco permite dejar una calificación abierta sin resolver. Si existe un
intento `PENDIENTE_REVISION` de un examen calificado, primero debe calificarse. Después:

- si existe una nota final definitiva igual o superior al umbral Refrendado, el nivel es
  **Refrendado**;
- en cualquier otra excepción manual, el nivel es **Normal**;
- si existe una nota definitiva se congela y conserva aunque sea menor que la mínima; si no existe
  nota, el certificado Normal se emite sin nota;
- el administrador nunca elige libremente el nivel.

La excepción y su motivo quedan en el historial privado. La verificación pública conserva los
mismos datos mínimos y no expone que existió una excepción.

### 13.5 El certificado congela sus datos

**Al emitirse, el certificado guarda una copia de todo lo que imprime** — nombre del alumno,
título y tipo del curso, horas académicas, fechas, entidad que refrenda y firmantes — y **nunca
se recalcula**.

La plataforma muestra al alumno la situación previa que corresponda:

- **PENDIENTE_REQUISITOS** — todavía no termina académicamente.
- **PENDIENTE_DATOS** — terminó, pero falta confirmar sus datos.
- **PROGRAMADO** — cumplió todo y espera la fecha de emisión.
- **LISTO_PARA_EMITIR** — cumplió todo, no tiene días de espera y debe decidir si genera ahora o
  continúa mejorando su nota.

Estas situaciones explican qué falta, pero el certificado definitivo existe al emitirse. Desde
ese momento su **`estado_certificado`** es **VIGENTE** o **ANULADO**. La anulación no elimina la
fecha de finalización ni el historial académico.

Si no fuera así, el día que el administrador corrija las horas de un curso de 120 a 100, **todos
los certificados ya emitidos cambiarían solos**. Son documentos con valor legal: dicen lo que
era cierto el día que se ganaron.

### 13.6 Corregir un certificado emitido

Corregir y anular son acciones diferentes:

#### Corrección

- **Solo el administrador** puede corregir nombres, título del curso, horas, entidad o firmantes,
  registrando el motivo.
- El PDF se regenera manteniendo el mismo código de verificación y el certificado continúa
  VIGENTE.
- La versión anterior deja de estar disponible para descargar. El alumno y la página pública ven
  siempre la versión corregida.
- El contenido anterior se conserva en el historial administrativo junto con el motivo, la fecha
  y el administrador responsable.
- La corrección no permite cambiar libremente la nota ni el nivel congelado del certificado.
- El alumno no puede editar sus datos por su cuenta después de la emisión.

#### Anulación

- Solo el administrador puede pasar un certificado a ANULADO y debe registrar el motivo.
- El PDF deja de estar disponible para descargar, pero el certificado y su historial no se
  eliminan.
- El QR y el código continúan funcionando para informar **"Certificado anulado — no válido"**.
- Públicamente se muestra el estado y la fecha de anulación, pero no el motivo completo.
- El motivo, la fecha y el responsable quedan disponibles para administración.
- Un certificado ANULADO no puede volver a VIGENTE.

### 13.7 Privacidad y verificación — modelo Cisco

Son dos cosas distintas y no se contradicen:

- El **PDF es privado**. Cada alumno ve exclusivamente los suyos, en su sección
  **"Mis certificados"**. Se acabó la carpeta de Drive donde todos veían los de todos.
- El **QR lleva a una página pública mínima** de verificación. El alumno decide a quién le entrega
  el enlace.
- Cada certificado tiene un **código único verificable**.
- Si el tercero no puede escanear el QR, puede escribir manualmente ese código.

Para un certificado VIGENTE se muestra:

- Código de verificación.
- Nombre completo del alumno.
- Nombre del curso.
- Horas académicas.
- Nivel Normal o Refrendado.
- Entidad que refrenda, cuando corresponda.
- Fecha de emisión.
- Estado **"Certificado vigente"**.

Nunca se muestran públicamente el DNI, correo, teléfono, nota obtenida, firmas, PDF descargable ni
otros datos personales.

Para un certificado ANULADO se muestran nombre, curso, código, fecha de emisión y fecha de
anulación, junto al estado **"Certificado anulado — no válido"**. El motivo completo permanece
privado para administración.

Si el certificado fue corregido, el mismo código muestra siempre los datos vigentes corregidos.
Si el código no existe, la página responde **"Certificado no encontrado"** sin mostrar datos de
ninguna persona.

### 13.8 Los datos del certificado

El certificado es **válido para concursos públicos**: si el nombre está mal, es un problema real.

Antes de emitirlo, el alumno pasa por la pantalla **"Confirma tus datos — así aparecerán en tu
certificado"**. Puede hacerlo desde su perfil o desde el bloque de avance, antes o después de
completar el curso:

```
Nombres            [ ................ ]
Apellido paterno   [ ................ ]
Apellido materno   [ ................ ]
```

- Viene **prellenada** con lo que el alumno ya tiene en su cuenta.
- **Los tres son obligatorios.** Sin ellos no se genera el certificado.
- **Todos pasan por aquí, por los tres caminos de registro** (§10): a quien se registró por
  formulario normalmente ya le aparecen completos; quien entró con Google puede necesitar
  **separar sus apellidos**, porque Google puede entregarlos en un solo bloque; y quien recibió una
  cuenta creada por administración completa cualquier nombre o apellido que todavía falte.
- El **DNI es un dato opcional del perfil**. Puede registrarse o editarse allí, pero no aparece en
  esta confirmación, no se imprime en el certificado y su ausencia nunca bloquea la emisión.
- Mientras no se haya emitido, el alumno puede volver a modificar y confirmar sus datos.
- El sistema registra la fecha y hora de la última confirmación.
- Una vez emitido, el nombre **no se edita libremente** — solo el administrador puede corregirlo
  (§13.6).

---

## 14. Catálogo público

Basado en udeapolis, que es la referencia que el cliente adjuntó en su documento (§5).

### La lista de cursos

- **Tarjeta de curso:** imagen, tipo de curso, título, **avatares de los docentes**, fecha de
  inicio o estado, y botón "Ver detalles".
- **Estados visibles** derivados de las fechas: *Inicio inmediato* · *Inicia el 31 de agosto* ·
  *En progreso* · *Matrícula cerrada*.
- **Badge "En vivo":** se muestra en los cursos de modalidad `EN_VIVO` o `HIBRIDO`. Ahora sí
  hay funcionalidad detrás, así que el badge deja de ser decorativo.
- **Orden:** primero los cursos que el administrador marcó como destacados. Dentro de cada grupo
  aparecen primero los VIRTUAL con **"Inicio inmediato"**, después los cursos con la fecha de
  inicio futura más próxima y finalmente los que ya están en progreso.
- **Buscador:** busca en **título y descripción** del curso.
- **Filtros:** dos selectores independientes, **Tipo de curso** y **Categoría temática**, cada uno
  con la opción inicial **“Todos”**. Se puede elegir un valor en cada selector y combinar ambos
  con el buscador. La modalidad se muestra en la tarjeta, pero no es un filtro del catálogo.

### La ficha del curso

Lo que toda ficha lleva, sea cual sea la modalidad:

- Portada, tipo de curso y título
- Descripción, con "Leer más" si es larga
- Panel de precio: **regular tachado + promocional**, y el botón de compra
- **Lista de beneficios** del curso *(ver abajo)*
- **Temario completo desplegable por módulo** — `Módulo 1 — 9 clases` → lista de lecciones
- Ficha técnica: horas académicas, entidad que refrenda, validación por QR
- Los **docentes** con foto y bio

**Y cambia según la modalidad**, porque un curso grabado y uno en vivo no venden lo mismo:

| | **Virtual** | **En vivo / Híbrido** |
|---|---|---|
| Portada | **Inicio inmediato** si no tiene fecha de inicio; si la tiene, muestra su inicio. Nunca muestra fecha de fin ni calendario de sesiones | **Fecha de inicio, fecha de fin y hora** |
| Cómo se describe | *"El contenido está disponible las 24 horas, estudia a tu propio ritmo"* | *"N sesiones en vivo de X horas"* |
| Temario | Lecciones sin fecha | **Cada sesión con su fecha** |
| Calendario | No se muestra | **Calendario mensual con las sesiones marcadas** |

Poner fechas de sesión en un curso grabado no significa nada, y esconder el calendario en uno en
vivo le quita al alumno el dato que más necesita antes de comprar: **si puede o no asistir**.

### Beneficios del curso

Una **lista de texto libre que el administrador escribe por curso**, y que aparece en la ficha
junto al precio. No se deduce de ningún dato del sistema: es lo que vende el curso.

En udeapolis dice cosas como *"certificación válida para convocatorias públicas y privadas"*,
*"material académico: libros digitales, revistas y presentaciones de los ponentes"*, *"asesoría
permanente sobre su proceso de certificación"*, *"ingreso libre a todas las ponencias
programadas"* o *"sorteos de becas"*.

Ninguna de esas frases sale de una tabla — las escribe quien arma el curso, y cambian de un curso
a otro. Por eso es un campo, no una lista fija.

### Dos clasificaciones, no una

Un curso se clasifica por **dos ejes independientes**. Es como lo hace udeapolis, y hace falta:
sin el segundo, un alumno que busca "Derecho Registral" tendría que revisar todo el catálogo.

**Eje 1 — Tipo de curso** *(qué formato es)*

Diplomado · Programa de actualización · Curso especializado · Seminario · Taller de casos
prácticos · Congreso / Conferencia · In-house

Duraciones reales de referencia: Diplomado 92-180 h · Curso 24-50 h · Seminario ≥12 h.

**Eje 2 — Categoría temática** *(de qué trata)*

Derecho Registral · Derecho Notarial · Derecho Inmobiliario · Derecho Urbanístico · Derecho
Administrativo · Gestión Pública · Habilidades profesionales (redacción y argumentación jurídica)

Son las especialidades reales de la Escuela (§2). **Ambos ejes son tablas maestras** y ambos
sirven de filtro en el catálogo.

> **Nota sobre in-house:** en realidad no es un formato de contenido sino un modelo de venta
> (una empresa contrata un curso cerrado para su personal). Se deja como etiqueta porque es la
> palabra que el cliente usa comercialmente, pero **sin lógica de acceso asociada**. Se
> convierte en funcionalidad real cuando se resuelva el tema de grupos (§18, pendiente).

---

## 15. Pantallas privadas

### Lo que ve el alumno al entrar

Es la pantalla que más usa el alumno:

| Sección | Contenido |
|---|---|
| **Mis cursos** | Dos pestañas de navegación, **En progreso** y **Completados**, con su porcentaje de avance y un botón para **continuar** donde se quedó. No utiliza los filtros del catálogo. |
| **Próximas sesiones** | Las sesiones en vivo de todos sus cursos, ordenadas por fecha, con acceso directo al enlace cuando se habilite |
| **Mis certificados** | Los suyos, y solo los suyos. Con descarga y enlace de verificación |
| **Mi perfil** | Datos personales, incluido el DNI opcional, y confirmación de nombres y apellidos para el certificado *(§13.8)* |

### Dentro del curso — el aula

Es donde el alumno pasa casi todo su tiempo, y donde ocurren la mayoría de las reglas de este
documento. No hace falta describir el diseño, pero sí **dónde vive cada cosa**:

| Zona | Qué contiene |
|---|---|
| **Temario lateral** | Los módulos con sus lecciones, en el orden que armó el administrador. Cada lección muestra si está completada, disponible o bloqueada. Los exámenes aparecen en la posición que les tocó, y al final el certificado |
| **Contenido** | La lección abierta: su video o material en el visor, y sus recursos descargables solo si el administrador lo habilitó *(§7)* |
| **Avance de la lección** | El botón **"Siguiente"** —o **"Completar lección"** en la última— y el check manual cuando la fuente no permite detección. Si hay detección, el check es automático y de solo lectura, y se muestra cuánto falta del video *(§11)* |
| **Encabezado** | El porcentaje de avance del curso completo |
| **Tu avance hacia el certificado** | *(ver abajo)* |

Las lecciones en vivo se ven en este mismo temario: la tarjeta conserva fecha y horario, pero el
enlace real solo se expone y el botón se habilita **entre la hora de inicio y la hora de fin** en
`America/Lima`; después muestra su grabación o el aviso de "grabación pendiente" *(§9, §11)*.

### Tu avance hacia el certificado

**El alumno tiene que poder ver, en todo momento, qué le falta para certificar.** Sin esto, los
las tres condiciones de §13.1 son una caja negra: alguien que terminó el curso y no ve su
certificado no sabe si le falta un examen, si su nota quedó en 11 o si no llegó a la asistencia
mínima. Y lo que hace entonces es escribirle a la Escuela por WhatsApp — exactamente lo que este
sistema existe para eliminar.

El bloque muestra **cada condición que ese curso activó**, con su valor real y su meta:

```
✅ Progreso del curso        100%   (mínimo 80%)
✅ Exámenes calificados      2 de 2 aprobados
⬜ Nota final                11.5   (mínimo 12)
✅ Asistencia                14 de 16 sesiones  (mínimo 80%)

Te falta subir tu nota. Puedes reintentar el Examen Final. →
```

Cuatro reglas de comportamiento:

- **Siempre visible**, desde el primer día. No es un resumen final: es lo que se le pide, dicho
  desde el principio.
- **Solo las condiciones activas** de ese curso. Si no exige asistencia, esa fila no existe.
  Mostrar requisitos que no aplican confunde más de lo que informa.
- **Valores reales, no un sí o no.** "Nota 11.5 de 12" le dice qué hacer; "no aprobado" no.
- **Una frase de qué hacer**, con enlace directo a la acción.

Y los cuatro cierres posibles:

| Situación | Lo que ve |
|---|---|
| Cumplió todo, faltan sus datos | *"Confirma tus datos para emitir tu certificado."* → enlace al formulario |
| Cumplió todo, falta la fecha | *"Ya cumpliste todo. Tu certificado estará disponible el 25 de octubre."* |
| Cumplió todo, no tiene días de espera y todavía no emitió | *"Ya cumpliste todo. Genera tu certificado ahora o continúa mejorando tu nota."* → botón de emisión |
| Cumplió todo y ya se emitió | El botón de descarga |

**En la tarjeta de "Mis cursos"** aparece la versión compacta del mismo dato, para no tener que
entrar a cada curso a saber cómo va.

### Mi calendario académico

Vista **mensual** de todas las sesiones en vivo del alumno, de todos sus cursos a la vez.
*"Organiza tu horario para no perderte ninguna clase en vivo."*

| Elemento | Detalle |
|---|---|
| **Rejilla mensual** | Lunes a domingo, con el mes completo |
| **Navegación** | Mes anterior y siguiente, más un botón **"Hoy"** para volver al actual |
| **Cada sesión muestra** | Curso al que pertenece, título de la sesión y hora de inicio |
| **Acceso directo** | Al llegar el día y la hora, la sesión enlaza a la reunión desde el propio calendario |
| **Sesiones pasadas** | Quedan visibles y enlazan a su grabación, o indican "grabación pendiente" (§11) |

**Por qué hace falta y no basta con la lista.** "Próximas sesiones" responde *"¿qué tengo ahora?"*;
el calendario responde *"¿cómo se me arma el mes?"*. Un alumno matriculado en dos diplomados con
16 sesiones cada uno necesita ver los choques de horario antes de que ocurran, no el día de la
clase.

**Solo aparece si el alumno tiene cursos de modalidad `EN_VIVO` o `HIBRIDO`.** A quien solo lleva cursos grabados
no se le muestra un calendario vacío.

### Lo que ve el administrador

La entrada administrativa muestra un dashboard informativo sencillo y el acceso a la gestión. El
dashboard permite reconocer cómo evolucionan las matrículas y los pagos sin convertir esta
pantalla en una bandeja de trabajo.

Además, para poder dar soporte, puede **consultar a cualquier alumno**: su avance por lección,
sus intentos de examen y sus notas. Es una vista de solo lectura. Sin ella, la primera vez que
alguien escriba *"no me sale el certificado"* no habría forma de averiguar por qué.

### Reportes administrativos

Los reportes permiten consultar la operación de la Escuela sin reemplazar su contabilidad. Todos
son privados para administración, muestran información vigente del sistema y pueden descargarse
en **Excel**.

Como filtros comunes ofrecen rango de fechas, curso, modalidad, estado y alumno. Cada reporte
solo muestra los filtros que corresponden a sus datos y puede agregar los propios, como estado del
pago, estado del certificado o cumplimiento académico.

El rango de fechas tiene un único significado por reporte, tanto en pantalla como en Excel:

| Reporte | Fecha filtrada |
|---|---|
| Matrículas | `fecha_matricula` |
| Pagos registrados | fecha del resultado de Culqi o fecha del registro administrativo |
| Seguimiento académico | `fecha_matricula`, para trabajar por cohorte de ingreso |
| Certificados | `fecha_emision` |
| Asistencia | fecha de la sesión |

Todas se interpretan en hora de Lima. La tabla, los totales y el archivo exportado utilizan
exactamente el mismo rango inclusivo.

#### 1. Reporte de matrículas

Permite consultar alumno, curso, modalidad, fecha de matrícula, fecha de activación, estado de la
matrícula, forma de ingreso y situación académica actual. La forma de ingreso distingue pago en
línea aprobado, registro manual con pago, exoneración y matrícula gratuita por autoservicio. La
situación académica distingue no iniciado, en curso y finalizado. También muestra el estado del
certificado cuando exista.

#### 2. Reporte de pagos registrados

Muestra fecha, alumno, curso, monto, medio de pago, resultado, referencia, origen en línea o
administrativo y motivo cuando corresponda. Incluye los resultados informados por Culqi y los
registros REGISTRADO_MANUAL y EXONERADO.

Cuando se presenta un total de pagos confirmados, suma únicamente APROBADO y
REGISTRADO_MANUAL con importe mayor que cero. PENDIENTE, RECHAZADO, ERROR, EXPIRADO y EXONERADO
no aumentan ese total. Una comunicación repetida del mismo pago nunca se cuenta dos veces.

Se denomina **"pagos registrados"** porque sirve para el control de la plataforma; no constituye
un reporte contable, no calcula impuestos y no reemplaza los comprobantes tributarios de la
Escuela.

#### 3. Reporte de seguimiento académico

Por cada alumno matriculado muestra progreso general, exámenes requeridos y aprobados, nota final
cuando corresponda, respuestas abiertas pendientes de revisión, asistencia solo en `EN_VIVO` o
`HIBRIDO`, condiciones pendientes para finalizar, fecha de finalización y estado del certificado.
Las condiciones se evalúan según la configuración de cada curso: no se muestran como pendientes
los exámenes, el progreso o la asistencia que ese curso no exige.

#### 4. Reporte de certificados

Muestra alumno, curso, nivel obtenido, entidad certificadora, fecha de finalización, fecha de
emisión, estado, código de verificación y forma de emisión. La forma de emisión distingue emisión
automática, generación confirmada por el alumno y emisión manual administrativa.

#### 5. Reporte de asistencia

Está disponible únicamente para cursos `EN_VIVO` e `HIBRIDO`. Muestra curso, sesión, fecha,
alumno, asistencia, origen automático o corrección administrativa, porcentaje acumulado y si
cumple el mínimo cuando la asistencia sea condición de certificación. Las sesiones CANCELADA no
forman parte del total y la asistencia de una matrícula tardía conserva la regla de §11.

### Dashboard administrativo

Es una vista informativa básica con gráficos simples:

| Gráfico | Qué permite identificar |
|---|---|
| **Evolución de matrículas activadas** | Cuántas matrículas llegaron a ACTIVA durante cada periodo |
| **Matrículas por curso** | En qué cursos se concentran las matrículas activadas |
| **Forma de ingreso** | Cuántas provienen de pago en línea, registro manual con pago, exoneración o matrícula gratuita por autoservicio |
| **Pagos confirmados por periodo** | Cómo evoluciona el importe de APROBADO y REGISTRADO_MANUAL con monto mayor que cero |

Al abrirse utiliza el año calendario actual y permite cambiar el rango de fechas, curso y
modalidad. No muestra tareas pendientes, vencimientos, alertas ni acciones por realizar. Los
detalles se consultan en los reportes correspondientes.

El dashboard es **el último componente del alcance acordado que se implementa**: primero deben
estar operativos los procesos principales y los cinco reportes de los que obtiene su información.

### Todo lo que puede hacer el administrador

Las capacidades están definidas a lo largo del documento; aquí quedan reunidas. **Es la lista de
pantallas que hay que construir del lado de gestión.**

| Área | Qué puede hacer |
|---|---|
| **Cursos** | Crear y editar: título, descripción, imagen, URL amigable, tipo, categoría temática, modalidad, precio regular y promocional con su vigencia, cupo, vigencia de acceso, fecha de inicio opcional y sin fecha de fin en `VIRTUAL`, fechas obligatorias y cierre de matrícula en `EN_VIVO` o `HIBRIDO`, horas académicas, lista de beneficios, entidad que refrenda y firmantes |
| **Estados** | Publicar, cerrar, cancelar con motivo y **forzar las transiciones** cuando haga falta adelantar o retrasar |
| **Contenido** | Crear módulos y lecciones, **ordenar todo**, marcar lecciones como vista previa y definir el tipo de lección (grabada o en vivo). La duración del video se detecta automáticamente cuando la fuente lo permite y se advierten, sin bloquear, los videos fuera de 10-15 minutos. Una vez iniciado el curso, solo se permiten correcciones y materiales complementarios que no alteren el avance ni la certificación |
| **Sesiones en vivo** | Cargar fecha, hora de inicio, hora de fin y **enlace de la reunión** · reprogramar o cancelar sesiones futuras con motivo y aviso a los alumnos · subir la **grabación** después |
| **Materiales** | Subir archivos o enlazar YouTube y nube, ordenarlos arrastrando y soltando, y **habilitar la descarga material por material**. No se elige un material principal |
| **Duplicar** | Agregar a un curso una copia de un módulo existente, con sus lecciones, materiales y exámenes, para combinarlo y reordenarlo · duplicar un curso como nueva convocatoria en BORRADOR, sin copiar matrículas, pagos, progreso, intentos, asistencia ni certificados |
| **Exámenes** | Crear exámenes calificados o de práctica con selección única, selección múltiple, verdadero/falso y respuesta abierta. Configurar puntajes, reintentos, tiempo límite, barajado, respuestas correctas, plazo de revisión, fecha de habilitación cuando corresponda y si un examen calificado bloquea el siguiente módulo |
| **Reglas del curso** | Las tres condiciones de certificación —exámenes, progreso y asistencia—, sus valores mínimos, el umbral de video, la **secuencia obligatoria** y los días de espera del certificado. En VIRTUAL no se ofrece asistencia. Una vez iniciado el curso, no puede aumentar sus requisitos académicos |
| **Matrículas** | Crear cuentas con contraseña temporal y teléfono opcional · **matricular a mano** con REGISTRADO_MANUAL o EXONERADO · **cancelar** con motivo · consultar el avance, los intentos y las notas de cualquier alumno |
| **Pagos** | Consultar resultados informados por Culqi, operaciones REGISTRADO_MANUAL y EXONERADO, alertas de sobrecupo y pagos aprobados después de cancelar un curso |
| **Libro de Reclamaciones** | Consultar QUEJAS y RECLAMOS, revisar adjuntos y fechas límite, responder por correo y reenviar una respuesta ya registrada |
| **Exámenes rendidos** | Calificar respuestas abiertas y consultar sus fechas límite · **otorgar un intento adicional** a quien agotó los suyos sin aprobar, con motivo registrado |
| **Asistencia** | **Corregir a mano** la asistencia de cualquier sesión en vivo |
| **Certificados** | **Emitir a mano** con motivo · **corregir uno emitido**, manteniendo su código e historial · **anularlo** de forma definitiva, registrando motivo, fecha y responsable |
| **Catálogo** | **Destacar** cursos para que aparezcan primero |
| **Docentes** | Crear y editar sus perfiles públicos: nombre, foto, cargo y biografía |
| **Tablas maestras** | Tipos de curso · categorías temáticas · entidades certificadoras · firmantes |
| **Archivos** | Configurar extensiones permitidas y tamaño máximo |
| **Reportes** | Consultar y exportar a Excel los reportes de matrículas, pagos registrados, seguimiento académico, certificados y asistencia |
| **Dashboard** | Consultar al final de la implementación los cuatro gráficos informativos de matrículas y pagos, sin pendientes ni tareas administrativas |

---

## 16. Notificaciones

Once correos del sistema:

| # | Correo | Cuándo |
|---|---|---|
| 1 | **Bienvenida, acceso inicial y verificación de correo** | Al registrarse. En una cuenta creada por administración incluye la contraseña temporal y los pasos de habilitación. Sin verificar no se puede utilizar una matrícula. |
| 2 | **Matrícula confirmada** | Al activarse la matrícula. **Sirve igual para curso gratuito y pagado**; en el pagado incluye el detalle del pago. |
| 3 | **Pago no completado** | Cuando Culqi informa un resultado no aprobado que permite reintentar, avisando que no se activó la matrícula. |
| 4 | **Sesión en vivo** | El día antes como recordatorio y también inmediatamente cuando una sesión se reprograma o cancela. |
| 5 | **Confirma tus datos para emitir tu certificado** | Cuando ya se cumplieron las condiciones académicas y temporales, pero faltan nombres o apellidos confirmados. |
| 6 | **Recuperar contraseña** | Imprescindible: si el alumno se registra solo a las 2 a.m., no hay administrador que le resetee la clave. |
| 7 | **Tu certificado está listo** | Al emitirse, después de cumplirse las condiciones de §13.4, incluidos los datos confirmados y los días de espera del curso. |
| 8 | **Tu examen fue calificado** | Cuando el administrador termina de revisar las respuestas abiertas y se publica la nota. |
| 9 | **Constancia de reclamación** | Al presentarse una QUEJA o RECLAMO, con número, copia de los datos y fecha máxima de respuesta. |
| 10 | **Respuesta a tu reclamación** | Cuando la Escuela registra y envía su respuesta desde el Libro de Reclamaciones. |
| 11 | **Curso cancelado** | Cuando la Escuela cancela un curso completo, con el motivo y el canal de atención para cada alumno afectado. |

*(udeapolis ofrece además un correo de "notificación de nuevos cursos" — queda fuera del alcance
actual.)*

### El correo del certificado no lleva el PDF adjunto

Cuando el certificado se emite —al instante o tras los días de espera que tenga el curso— el
alumno recibe el aviso por correo con **un enlace para descargarlo**, no el archivo pegado.

Es coherente con la regla que sostiene toda la privacidad (§7): el PDF solo se entrega a quien
demuestra ser su dueño. Un adjunto sale del sistema y queda para siempre en una bandeja que se
puede reenviar a cualquiera.

> Es un cambio frente a cómo trabaja hoy la Escuela, que **envía el certificado adjunto por
> correo**. Vale avisárselo: el alumno lo va a recibir igual de rápido, pero entrando a la
> plataforma. A cambio, deja de existir un PDF suelto circulando por correo.

---

## 17. Reglas de negocio consolidadas

### Contenido y estructura

| # | Regla |
|---|---|
| RN-01 | El curso se organiza en Curso → Módulo → Lección → Material. |
| RN-02 | La lección es la unidad ordenada y marcable y se enfoca editorialmente en un concepto. La duración del video se detecta automáticamente cuando la fuente lo permite; se advierte, sin bloquear, si está fuera de 10-15 minutos. Sin video no se exige duración y, si la fuente externa no permite detectarla, el dato es opcional. |
| RN-03 | Una lección es `GRABADA` o `EN_VIVO`. |
| RN-04 | La lección en vivo tiene fecha, hora de inicio, hora de fin y enlace. Una sesión futura puede reprogramarse o cancelarse con motivo; se actualiza el calendario y se avisa a los matriculados. CANCELADA permanece visible, no cuenta para asistencia ni progreso y no bloquea la secuencia. Una sesión realizada no cambia de fecha ni se cancela. |
| RN-05 | El curso tiene modalidad `VIRTUAL`, `EN_VIVO` o `HIBRIDO`; la define el administrador y el sistema avisa si no coincide con las lecciones cargadas. Presencial queda fuera. |
| RN-06 | Un módulo pertenece a un solo curso. Al editar otro curso, el administrador puede agregar una copia completa de ese módulo, combinarla con otros y reordenarla. Cada copia es independiente. |
| RN-07 | Al agregar un módulo existente se copian sus lecciones, materiales, exámenes, preguntas y opciones; los archivos físicos se reutilizan mediante sus referencias. |
| RN-08 | Cada curso tiene una URL amigable propia, definida desde su creación. |
| RN-09 | El administrador define el orden de módulos, lecciones, materiales y exámenes; los materiales se reordenan arrastrando y soltando y no existe uno principal. |

### Ciclo de vida del curso

| # | Regla |
|---|---|
| RN-10 | Las transiciones PUBLICADO → EN CURSO → CERRADO son automáticas según las fechas cuando existen; el administrador puede forzarlas. Un VIRTUAL sin fecha de inicio queda EN CURSO en la misma publicación; con inicio futuro permanece PUBLICADO hasta esa fecha, nunca tiene fecha de fin y se cierra manualmente. PUBLICADO o EN CURSO también puede pasar a CANCELADO con motivo. |
| RN-11 | Un curso con matrículas no puede volver a BORRADOR; se retira de venta pasándolo a CERRADO. |
| RN-12 | No se borra ningún curso, módulo ni lección con matrículas o progreso asociado; se oculta o se cierra. |

### Acceso y pago

| # | Regla |
|---|---|
| RN-13 | Un curso pagado no se puede publicar sin al menos una lección de vista previa con contenido real; una imagen por defecto puede ser portada, pero no reemplaza la muestra. |
| RN-14 | Las lecciones de vista previa son públicas: sin registro ni matrícula. |
| RN-15 | Un solo pago cubre contenido y certificado. No hay un segundo cobro por certificar. |
| RN-16 | Los cursos gratuitos también certifican, bajo las mismas reglas. |
| RN-17 | Los precios son netos, en soles, sin desglose de impuestos. |
| RN-18 | Culqi procesa los pagos en línea con tarjeta, Yape o Plin e informa PENDIENTE, APROBADO, RECHAZADO, ERROR o EXPIRADO. Una operación administrativa queda REGISTRADO_MANUAL si hubo dinero o EXONERADO si el importe es cero. El pago en efectivo queda fuera. |
| RN-19 | ESEJUR no cobra, autoriza ni rechaza operaciones bancarias. Registra el resultado comunicado por Culqi y aplica automáticamente su consecuencia. |
| RN-20 | Cada pago aprobado genera una constancia imprimible con número de pedido, importe, método, fecha y curso. No reemplaza el comprobante tributario SUNAT emitido por la Escuela. |
| RN-21 | El precio promocional puede tener fechas de vigencia; sin fechas, es permanente. |
| RN-22 | La matrícula se activa automáticamente solo cuando Culqi informa APROBADO, sin intervención humana. Una operación iniciada válidamente se honra aunque después cierre la matrícula, el curso pase a CERRADO o se llene el cupo. Si el curso o la matrícula quedaron CANCELADOS, se registra el pago pero no se activa acceso. |
| RN-23 | El primer resultado APROBADO se registra una vez. Una repetición no genera otro pago ni matrícula y ESEJUR no convierte fallos en APROBADO. Una aprobación posterior a CANCELADO mantiene la matrícula CANCELADA y abre atención externa; una aprobación que encuentra el cupo lleno activa y genera alerta de sobrecupo. |
| RN-24 | Solo puede existir un intento PENDIENTE por matrícula. ESEJUR no le asigna un plazo propio y no permite reintentarlo mientras siga PENDIENTE. Solo RECHAZADO, ERROR o EXPIRADO permiten un nuevo intento sobre la misma matrícula, conservando historial. |
| RN-25 | Toda matrícula manual genera REGISTRADO_MANUAL con importe, medio, referencia y motivo, o EXONERADO con importe cero y motivo; ambas registran responsable y fecha y activan la matrícula. |
| RN-26 | En autoservicio no se matricula sin correo verificado y documentos aceptados. Administración puede crear cuenta y matrícula, pero el contenido queda bloqueado hasta verificar el correo, aceptar los documentos y cambiar la contraseña temporal. ACTIVA representa el derecho concedido; utilizarlo también exige una cuenta habilitada y que haya llegado la fecha de inicio cuando exista. |
| RN-27 | Un alumno no puede matricularse dos veces en el mismo curso. |
| RN-28 | Los cursos PUBLICADO y EN CURSO admiten matrícula mientras tengan cupo y no se haya alcanzado su cierre de matrícula o cierre administrativo. VIRTUAL no usa fecha de cierre de matrícula. |
| RN-29 | Un curso puede definir una capacidad de venta; vacío significa sin límite. Un pago PENDIENTE no reserva cupo. El cupo se ocupa cuando Culqi informa APROBADO y la matrícula pasa a ACTIVA, o cuando se activa una matrícula gratuita o administrativa. |
| RN-30 | La disponibilidad considera matrículas ACTIVA. Antes de iniciar un pago se comprueba el cupo y, al llenarse, se muestra "Sin cupos". Si una operación iniciada con cupo llega APROBADA cuando el límite ya se llenó, activa el acceso y genera alerta de sobrecupo. No hay lista de espera. |
| RN-31 | El acceso puede tener vigencia en días; vacío significa permanente. Su día 1 es la fecha posterior entre activación e inicio del curso; vence a las 23:59:59 de Lima del día N. |
| RN-32 | Al agotarse la vigencia la matrícula pasa a VENCIDA y pierde contenido, pero conserva finalización y certificados. Si ya había finalizado, la emisión pendiente continúa aunque después venza o se cancele la matrícula. |
| RN-33 | En `VIRTUAL`, `fecha_inicio` es opcional y `fecha_fin` no se ofrece: sin inicio, el contenido se abre al activarse la matrícula y el curso continúa hasta su cierre manual. `EN_VIVO` e `HIBRIDO` requieren ambas fechas y las de sus sesiones. |
| RN-34 | El estado ACTIVA representa el derecho de acceso concedido. Para utilizarlo, la cuenta debe estar habilitada y debe haber llegado la fecha de inicio cuando exista. Al cumplir los requisitos académicos se registra `fecha_finalizacion`; cancelar o vencer el acceso no borra la finalización ni los certificados obtenidos. |
| RN-35 | Solo el administrador cancela una matrícula, con motivo. El sistema no devuelve dinero ni altera Culqi; una aprobación posterior se registra, mantiene CANCELADA y queda para atención externa. |

### Progreso y asistencia

| # | Regla |
|---|---|
| RN-36 | La lección sin video detectable puede completarse desde el check o con "Siguiente"; en la última se usa "Completar lección". El control manual solo es accionable mientras está pendiente. |
| RN-37 | Si existen videos detectables, la lección se completa al alcanzar en cada uno el porcentaje configurable, 50% por defecto; el check es de solo lectura y no permite omitir el umbral. |
| RN-38 | Una lección completada conserva un check fijo que el alumno no puede desmarcar y permanece accesible; volver a abrirla no elimina el avance. |
| RN-39 | El avance del curso se calcula a partir de las lecciones completadas. |
| RN-40 | El avance se calcula sobre las lecciones obligatorias definidas al iniciar el curso. El contenido complementario agregado después no reduce el avance y un certificado emitido nunca se revoca por cambios de contenido. |
| RN-41 | El alumno avanza en el orden que definió el administrador: para abrir una lección debe haber completado la anterior. Un examen calificado de módulo puede bloquear el siguiente hasta ser aprobado. |
| RN-42 | Lo ya completado queda siempre accesible; lo que no se puede es adelantarse. |
| RN-43 | Después de iniciado el curso no se agregan lecciones obligatorias ni se aumentan requisitos. Se permiten correcciones y materiales complementarios que no alteren el avance ni la certificación. |
| RN-44 | La secuencia obligatoria es una opción por curso, activa por defecto. Cada examen calificado de módulo permite decidir si bloquea el siguiente; si la secuencia se desactiva, ningún examen bloquea la navegación. |
| RN-45 | La tarjeta de sesión siempre es visible, pero el enlace solo se habilita entre inicio y fin. Abrirlo registra una asistencia. Después se muestra grabación o pendiente. Una sesión CANCELADA se excluye del total. |
| RN-46 | El administrador puede corregir manualmente la asistencia de cualquier sesión. |
| RN-47 | `EN_VIVO` e `HIBRIDO` pueden definir cierre. La asistencia tardía usa sesiones posteriores a matrícula. Al terminar una sesión, asistir completa su lección; quien no asistió la completa con la grabación. Cero sesiones elegibles muestra N/A y no cumple una asistencia requerida. |

### Exámenes y notas

| # | Regla |
|---|---|
| RN-48 | Un examen es CALIFICADO o PRACTICA; solo los calificados cuentan y deben aprobarse. PRACTICA siempre tiene intentos ilimitados. Si `requiere_examenes` está apagado no puede quedar CALIFICADO. |
| RN-49 | El alumno ve un badge que distingue el examen que debe aprobar del que es de práctica. |
| RN-50 | En `VIRTUAL`, el examen se habilita automáticamente por avance o al activar la matrícula si no hay secuencia. `EN_VIVO` e `HIBRIDO` pueden agregar `fecha_habilitacion`; cuando existe también debe cumplirse. Habilitarlo no implica que deba bloquear el siguiente módulo. |
| RN-51 | Si el alumno agota los intentos sin aprobar, el aula se lo indica y el administrador puede otorgarle un intento adicional con motivo registrado. |
| RN-52 | Cada pregunta tiene puntaje, 1 por defecto. La nota es `puntaje_obtenido / puntaje_total × 20`, se redondea convencionalmente a dos decimales y ese valor visible se compara con `nota_minima`, 12 por defecto. No hay penalización. |
| RN-53 | De un examen con varios intentos, cuenta el intento de nota más alta. Al emitirse el certificado se cierran los nuevos intentos calificados y la nota queda definitiva. |
| RN-54 | La nota final es el promedio de los exámenes calificados usando la mejor nota visible de cada uno y el mismo peso; se redondea a dos decimales antes de decidir el nivel. |
| RN-55 | Un examen puede tener tiempo límite en minutos; vacío significa sin límite. El tiempo corre desde que inicia el intento y no se pausa al cerrar la página ni al perder conexión. |
| RN-56 | Un examen puede barajar sus preguntas y opciones en cada intento. |
| RN-57 | Las respuestas correctas se muestran al aprobar, al agotar los intentos o nunca; con intentos ilimitados no se ofrece "al agotar". |
| RN-58 | El alumno navega entre preguntas, distingue respondidas, pendientes y marcadas para revisar, conserva lo respondido y confirma el envío. Un intento interrumpido se retoma con el tiempo restante; al llegar a cero se envía automáticamente, las preguntas pendientes obtienen cero y se consume el intento. |

### Certificación

| # | Regla |
|---|---|
| RN-59 | La certificación se configura con tres condiciones independientes: exámenes, progreso y asistencia. Sus valores iniciales dependen de la modalidad y pueden modificarse antes de iniciar. En VIRTUAL la opción de asistencia no se muestra. Si `requiere_examenes` está desactivado, no puede permanecer ningún examen CALIFICADO: antes de iniciar se debe convertir a PRACTICA o retirar. Si las tres condiciones se desactivan, el certificado solo puede emitirse manualmente con motivo. |
| RN-60 | El umbral del certificado normal es la nota mínima del curso y el del refrendado debe ser mayor; por defecto 12 y 14. |
| RN-61 | Si el curso no exige exámenes, el certificado es siempre Normal. |
| RN-62 | El certificado se emite sin intervención administrativa cuando se cumple la regla de certificación, no existe ningún examen calificado PENDIENTE_REVISION, llegó la fecha de fin si existe y el alumno confirmó sus datos. Con espera se emite a las 00:00 de `America/Lima` de la fecha programada; con cero días, después de la confirmación final del alumno. Una finalización obtenida válidamente no se pierde si después la matrícula vence o se cancela. |
| RN-63 | Si el curso tiene fecha de fin, el certificado nunca se emite antes de ella. En un VIRTUAL sin fecha de fin, su periodo se determina con `fecha_matricula` y `fecha_finalizacion`. |
| RN-64 | Cada curso tiene `dias_espera`, cero por defecto, contado en días calendario. La fecha programada se calcula desde la fecha posterior entre el cumplimiento académico y `fecha_fin` cuando existe. Durante la espera se puede mejorar la nota. |
| RN-65 | Con espera, el alumno ve promedio, nivel proyectado, fecha límite para mejorar y fecha exacta de emisión. Sin espera, ve una confirmación antes de generar y puede emitir ahora o seguir mejorando. |
| RN-66 | Un alumno recibe un solo certificado por curso. |
| RN-67 | El certificado congela sus datos, nota y nivel al emitirse y nunca se recalcula. Desde entonces los exámenes calificados no admiten nuevos intentos; los de práctica sí. |
| RN-68 | Solo el administrador corrige o anula un certificado. Corregir mantiene código y estado VIGENTE, reemplaza la descarga y conserva el historial; no cambia libremente nota ni nivel. Anular retira la descarga, mantiene el QR informativo y es irreversible. Ninguna acción elimina la finalización académica. |
| RN-69 | El administrador puede emitir un certificado manualmente, con motivo registrado, siempre que no exista una respuesta abierta de examen CALIFICADO en PENDIENTE_REVISION. Si la nota definitiva alcanza el umbral refrendado, el nivel es Refrendado; cualquier otra excepción manual emite nivel Normal. El administrador no elige el nivel. Si ya existe nota se congela; si no existe, el certificado se emite sin nota. Si todavía no existe `fecha_finalizacion`, se registra la fecha de la acción; no puede ser anterior a la matrícula ni futura. La excepción no omite datos obligatorios, unicidad, historial ni privacidad. |
| RN-70 | El alumno solo ve sus propios certificados. |
| RN-71 | El correo para confirmar datos del certificado se envía únicamente cuando el alumno ya cumple las condiciones académicas y temporales de emisión y solo faltan sus datos. Una vez emitido, el correo del certificado lleva un enlace de descarga, nunca el PDF adjunto. |
| RN-72 | El QR o el código manual llevan a una verificación pública con código, nombre, curso, horas, nivel, entidad, fecha y estado. Nunca muestra DNI, contacto, nota, firmas ni PDF. Un ANULADO muestra su fecha y que no es válido; una corrección muestra los datos vigentes y un código inexistente responde "Certificado no encontrado". |
| RN-73 | Sin nombres, apellido paterno y apellido materno confirmados no se genera el certificado. La confirmación puede realizarse antes o después de completar el curso y queda registrada. El DNI es opcional, se administra desde el perfil y nunca condiciona la emisión. |
| RN-74 | Cada curso indica qué entidad lo refrenda; entidades, firmantes, tipos de curso y categorías temáticas son tablas maestras. El lugar de emisión proviene de la configuración institucional y su valor inicial es "Lima, Perú". |

### Contenido protegido

| # | Regla |
|---|---|
| RN-75 | Los videos de YouTube deben ser no listados; el sistema lo advierte. |
| RN-76 | Compartir el enlace de un material o certificado no concede acceso: siempre se valida la identidad, la matrícula o la propiedad del certificado. |
| RN-77 | Los materiales se ven en línea; la descarga se habilita material por material. |

### Cuentas y acceso

| # | Regla |
|---|---|
| RN-78 | El docente tiene un perfil público sin acceso al sistema; el alumno y el administrador sí utilizan una cuenta. |
| RN-79 | Se registra cada acceso al sistema. |
| RN-80 | El registro por formulario o Google exige aceptar la política de privacidad y los términos, guardando cuándo y qué versión se aceptó. Una cuenta creada por administración puede existir antes, pero no queda habilitada hasta que el alumno los acepte. La contraseña propia debe tener al menos 8 caracteres e incluir mayúscula, minúscula y número. La verificación usa un código de 6 dígitos de un solo uso; reenviarlo invalida el anterior. El enlace de recuperación dura 60 minutos y usarlo o solicitar uno nuevo invalida el anterior. |
| RN-81 | La plataforma ofrece Libro de Reclamaciones como página pública enlazada en el pie y accesible con o sin cuenta; con sesión, completa los datos conocidos. |
| RN-82 | La reclamación distingue QUEJA de RECLAMO, admite varias imágenes opcionales de hasta 5 MB cada una y exige declaración jurada y autorización de respuesta por correo. |
| RN-83 | Cada QUEJA o RECLAMO debe ser respondido. Recibe número, fecha, PENDIENTE_RESPUESTA y una fecha límite de 15 días hábiles improrrogables. El primer día hábil posterior a la presentación es el día 1; si se presenta en día no hábil, el conteo comienza el siguiente día hábil. Se excluyen sábados, domingos y feriados oficiales del Perú. Se envía constancia; la administración responde por correo y solo entonces pasa a RESPONDIDO. Si el envío falla, permanece pendiente. |
| RN-84 | Existen tres caminos de registro: formulario, Google y creación administrativa. Formulario y creación administrativa usan correo, nombres, apellido paterno obligatorio, apellido materno opcional, `telefono` opcional y DNI opcional; Google entrega el correo verificado y sus datos disponibles, y permite completar después los apellidos separados y el DNI opcional. El apellido materno solo pasa a ser obligatorio al confirmar los datos que se imprimirán en el certificado. |
| RN-85 | El correo que llega por Google ya está verificado: ese usuario no recibe el correo de verificación. |
| RN-86 | Un mismo correo es una sola cuenta: los accesos por formulario y por Google se vinculan entre sí. |
| RN-87 | El login no bloquea el catálogo ni las lecciones de vista previa; la sesión se pide solo al matricularse. |
| RN-88 | El registro guarda el WhatsApp del alumno como dato de contacto opcional; las notificaciones automáticas van por correo. |
| RN-89 | La pantalla de registro ofrece WhatsApp para solicitar una cuenta manual. Cualquier administrador HABILITADO puede crear otro administrador o un alumno usando correo, nombres, apellido paterno obligatorio, apellido materno opcional y `telefono` y DNI opcionales; se registra quién concedió el perfil. No puede deshabilitarse a sí mismo ni dejar al sistema sin al menos un administrador habilitado. Una cuenta nueva recibe por correo las instrucciones, el código de verificación de seis dígitos y `Escuela1415@`, y queda con CAMBIO_PENDIENTE. Puede entrar al panel, pero no abrir cursos, exámenes ni certificados hasta verificar el correo, aceptar los documentos y cambiar la contraseña. Una cuenta existente nunca cambia su clave. |
| RN-90 | El formulario de registro lleva protección anti-robot. |

### Catálogo y administración

| # | Regla |
|---|---|
| RN-91 | El catálogo muestra primero los cursos destacados. Dentro de cada grupo ordena primero los VIRTUAL con "Inicio inmediato", luego las fechas futuras más próximas y finalmente los cursos en progreso. |
| RN-92 | El buscador busca en título y descripción del curso. |
| RN-93 | La ficha cambia según la modalidad: `VIRTUAL` muestra "Inicio inmediato" cuando no tiene fecha de inicio y nunca muestra fecha de fin ni calendario; `EN_VIVO` e `HIBRIDO` muestran sus fechas, calendario y "Matrícula cerrada" cuando corresponde. |
| RN-94 | Cada curso tiene una lista de beneficios de texto libre que escribe el administrador y se muestra en su ficha. |
| RN-95 | Cada curso se clasifica por dos ejes independientes: tipo de curso y categoría temática; ambos filtran el catálogo. |
| RN-96 | El badge "En vivo" se muestra en los cursos de modalidad `EN_VIVO` o `HIBRIDO`. |
| RN-97 | El administrador puede consultar el avance, los intentos y las notas de cualquier alumno. |
| RN-98 | El alumno ve en todo momento su avance hacia el certificado: cada condición activa del curso, con su valor real y su meta. |
| RN-99 | El alumno tiene un calendario mensual con las sesiones en vivo de todos sus cursos; solo se muestra si tiene cursos `EN_VIVO` o `HIBRIDO`. |
| RN-100 | Cada curso representa una convocatoria concreta. Al duplicarlo se copia su configuración y estructura académica en un nuevo BORRADOR, reutilizando los archivos físicos; se genera una nueva dirección amigable única y nunca se copian matrículas, pagos, progreso, intentos, asistencia ni certificados. |
| RN-101 | SELECCION_UNICA, SELECCION_MULTIPLE y VERDADERO_FALSO se califican al instante. Un intento con RESPUESTA_ABIERTA queda PENDIENTE_REVISION hasta que el administrador lo califique; tiene `dias_revision`, 3 días calendario por defecto y no modificable después del inicio del curso, muestra `fecha_limite_revision`, impide otro intento pendiente y bloquea la finalización y el certificado si el examen es CALIFICADO. Cada respuesta recibe un puntaje inclusivo entre 0 y su puntaje máximo y una observación opcional visible para el alumno. |
| RN-102 | Antes de publicar se valida que el curso tenga estructura cursable, reglas coherentes, fechas válidas y todos los elementos requeridos por sus condiciones de examen, progreso, asistencia y certificación. Si falta algo, la publicación se bloquea mostrando la lista completa de pendientes. |
| RN-103 | Cancelar un curso completo exige motivo, detiene matrículas y pagos nuevos, cancela sus sesiones futuras y envía un solo aviso consolidado por curso, sin correos separados por cada sesión. Conserva todo el historial. Quien no había finalizado conserva como consulta solo el contenido ya liberado, pero no puede registrar nuevos checks, progreso, intentos, asistencia ni finalización. Quien finalizó antes conserva la confirmación de datos y la emisión programada aunque después la matrícula venza o se cancele. Una aprobación de Culqi recibida después de cancelar registra el pago, pero mantiene la matrícula CANCELADA para atención externa. No ejecuta devoluciones. |
| RN-104 | Administración dispone de cinco reportes: matrículas, pagos registrados, seguimiento académico, certificados y asistencia. Pueden filtrarse según los datos que contengan y descargarse en Excel. El rango de fechas usa `fecha_matricula` en matrículas y seguimiento, fecha del resultado o registro administrativo en pagos, `fecha_emision` en certificados y fecha de sesión en asistencia. |
| RN-105 | El reporte de matrículas distingue estado de matrícula, forma de ingreso, situación académica y estado del certificado. Una matrícula o confirmación repetida se contabiliza una sola vez. |
| RN-106 | El reporte de pagos conserva todos los resultados. Sus totales confirmados incluyen APROBADO y REGISTRADO_MANUAL con monto mayor que cero; excluyen PENDIENTE, RECHAZADO, ERROR, EXPIRADO y EXONERADO. Es un control de pagos registrados, no un reporte contable ni tributario. |
| RN-107 | El seguimiento académico muestra únicamente las condiciones aplicables al curso. Incluye progreso, exámenes, nota, revisión de respuestas abiertas, asistencia cuando corresponda, finalización y certificado. |
| RN-108 | El reporte de certificados distingue su estado y forma de emisión. El reporte de asistencia solo existe para `EN_VIVO` e `HIBRIDO` y respeta las exclusiones de sesiones canceladas y la matrícula tardía. |
| RN-109 | El dashboard muestra exactamente cuatro gráficos simples: evolución de matrículas, matrículas por curso, forma de ingreso y pagos confirmados. No muestra tarjetas de indicadores, pendientes, alertas ni tareas y se implementa después de los procesos principales y los reportes. |
---

## 18. Alcance del proyecto

### 🟢 Se construye

**Cuentas y acceso** — registro por formulario o con Google, creación administrativa con
contraseña temporal y cambio obligatorio, login, recuperación de contraseña, aceptación de
política de privacidad y términos, registro de accesos.

**Catálogo** — público, con filtros por tipo, buscador por título y descripción, orden por fecha
de inicio, cursos destacados, badge "En vivo", ficha con temario y vista previa gratuita.

**Contenido** — Curso → Módulos → Lecciones → Materiales, con las tres fuentes de archivo,
**lecciones grabadas y en vivo**, agregar copias de módulos existentes para combinarlos y
reordenarlos, duplicar cursos como nuevas convocatorias, validación obligatoria antes de publicar
y entrega de archivos verificada.

**Matrícula y pago** — autoservicio 24/7 gratuito y pagado, **pago procesado por Culqi con apertura
automática cuando es aprobado**, reintento de operaciones no aprobadas, **matrícula manual del
administrador**, cupo, vigencia y cancelación.

**Aprendizaje** — progreso por lección (automático y manual), **asistencia dentro del horario de
la sesión, reprogramación y
cancelación de sesiones en vivo**, exámenes interactivos con selección única, selección
múltiple, verdadero/falso y respuesta abierta, reintentos, tiempo límite, barajado y revisión
administrativa cuando corresponda.

**Certificación** — **regla configurable con tres condiciones independientes**, valores iniciales
según modalidad, dos niveles, emisión
programada o inmediata por confirmación del alumno 24/7, emisión y corrección manual, PDF con QR, página pública de verificación,
"Mis certificados".

**Libro de Reclamaciones** — formulario público basado en Udeapolis, constancia por correo,
plazo de 15 días hábiles, bandeja administrativa, respuesta de la Escuela y conservación de la
evidencia completa.

**Administración** — panel completo, tablas maestras, consulta del avance y notas de cualquier
alumno, revisión de respuestas abiertas, cancelación completa de cursos, atención de reclamaciones
y los **11 correos**.

**Reportes** — matrículas, pagos registrados, seguimiento académico, certificados y asistencia,
con filtros aplicables y descarga en Excel.

**Dashboard administrativo** — cuatro gráficos simples sobre matrículas y pagos, sin pendientes
ni tareas. Se construye como el último componente del alcance acordado.

### 🟡 Definido para una ampliación futura

Grupos y matrícula corporativa (in-house) · desglose de IGV y comisión de plataforma · límite
de sesiones simultáneas por cuenta.

### 🔴 Fuera del alcance

- **Comprobantes electrónicos SUNAT** — ✅ decidido: **los emite la Escuela por su canal actual**,
  el sistema no factura. El sistema sí guarda el registro del pago y su referencia, para que la
  Escuela pueda emitir el comprobante con ese dato.
- **Migración de datos históricos del Moodle y del Drive** — queda como *posible* funcionalidad
  futura, no comprometida. Si se hace, sería una carga masiva de certificados antiguos para que
  un egresado los encuentre en "Mis certificados".
- **Páginas institucionales** ("Quiénes somos", "Contáctanos", "Tesis", "In house"): siguen en
  la web actual del cliente. esejur es solo la plataforma de cursos *(§1)*.
- **Automatización directa con Zoom.** Las sesiones en vivo sí entran, pero el enlace de la
  reunión lo pega el administrador y la grabación la sube después. El sistema no crea reuniones
  ni consulta directamente la lista de asistentes *(§7 y §11)*.
- **Página propia del docente.** udeapolis le da a cada ponente un enlace "Ver perfil" y una
  sección "Nuestros ponentes" en su home. Se evaluó y **se descartó**: el docente aparece con
  foto, cargo y bio en la tarjeta y en la ficha del curso (§6), que es donde el alumno lo mira
  antes de comprar. Una página aparte no agrega nada a esa decisión.
- **Preguntas y respuestas por lección.** udeapolis tiene un hilo de consultas en cada clase, con
  respuesta del instituto. Se evaluó y **se descartó**: el costo no es programarlo, es sostenerlo.
  Compromete a la Escuela a responder siempre, y hoy no tiene a nadie dedicado a eso — todo pasa
  por WhatsApp con una sola persona. Un curso lleno de preguntas sin contestar se ve peor que un
  curso sin preguntas.
- **Calificación del curso por el alumno.** Estrellas y comentario al terminar, como udeapolis.
  Se descartó por volumen: con pocos alumnos, tres reseñas tibias hacen más daño que ninguna.
- **Lista de espera** cuando un curso llena su cupo: el curso simplemente se muestra "Sin cupos".
- Renderizado en servidor para posicionamiento en buscadores.
- Foros, gamificación, app móvil, notificación masiva de nuevos cursos.

---

## 19. Registro de decisiones

Decisiones que estuvieron abiertas durante el análisis y cómo se resolvieron. Se dejan
registradas para no volver a discutirlas y para poder explicar el porqué de cada una.

**19.1 — Rol DOCENTE** ✅ *Resuelto: perfil público únicamente. El administrador maneja todo. Un
acceso propio del docente queda fuera del alcance actual y podrá evaluarse posteriormente.* (§6)

**19.2 — Nota final del curso** ✅ *Resuelto: promedio de los exámenes calificados.* (§12)

**19.3 — Qué nota queda con varios intentos** ✅ *Resuelto: la más alta.* (§12)

**19.4 — Datos del certificado** ✅ *Resuelto: nombres, apellido paterno y apellido materno son
obligatorios y deben confirmarse antes de emitir. Pueden modificarse mientras el certificado no
exista; una vez emitido quedan congelados y solo el administrador puede corregirlos. El DNI es un
dato opcional del perfil: no se imprime ni condiciona la emisión. Si las demás condiciones ya se
cumplieron, el sistema solicita únicamente los datos obligatorios y, al confirmarse, continúa con
la emisión programada o muestra el aviso final si la emisión es inmediata.* (§13.8)

**19.5 — Preguntas de respuesta abierta** ✅ *Resuelto: están habilitadas y requieren revisión
del administrador. El intento queda PENDIENTE_REVISION, tiene una fecha máxima visible y, si el
examen es calificado, bloquea la finalización y el certificado hasta obtener una nota definitiva.*
(§12)

**19.6 — Separación de la documentación** ✅ *Resuelto: este documento solo define el negocio.
Las decisiones de construcción, base de datos y despliegue se abordarán en una etapa posterior y
no condicionan la definición funcional actual.*

**19.7 — Repetición de un curso** ✅ *Resuelto: cada curso es una convocatoria
concreta. Para volver a dictarlo se duplica su configuración y estructura académica en un nuevo
BORRADOR, reutilizando los archivos físicos y sin copiar ningún dato transaccional ni académico
de los alumnos.* (§7)

**19.8 — Unidades modulares combinables y reordenables** ✅ *Resuelto: al editar un curso, el
administrador puede agregar copias completas de módulos existentes de otros cursos, combinarlas y
reordenarlas. Cada copia queda independiente. Para un recorrido dirigido, arma el curso con los
módulos necesarios y matricula manualmente a las personas correspondientes.* (§7)

**19.9 — Duración y microlearning** ✅ *Resuelto: la duración del video se calcula
automáticamente cuando la fuente lo permite. Se advierte, sin bloquear, si está fuera de 10-15
minutos. Las lecciones sin video no requieren duración y, cuando una fuente externa no permite
detectarla, el dato es opcional. La carga de contenido nunca exige escribirla manualmente.* (§7)

**19.10 — Cambios con alumnos en curso** ✅ *Resuelto: en BORRADOR el contenido y las reglas se
editan libremente; en PUBLICADO se advierte si ya existen matrículas. Una vez iniciado, no se
eliminan ni agregan requisitos obligatorios y no se editan exámenes con intentos. Se permiten
correcciones y materiales complementarios que no cambien el avance ni la certificación. Los
cambios estructurales se realizan duplicando el curso para una nueva convocatoria.* (§11)

**19.11 — Matrícula, finalización y certificado** ✅ *Resuelto: el estado de la matrícula
representa el acceso; la finalización académica se registra por separado mediante
`fecha_finalizacion`; y el certificado emitido tiene su propio `estado_certificado`, VIGENTE o
ANULADO. Vencer o cancelar el acceso no borra la finalización ni los certificados obtenidos.*
(§9, §13)

**19.12 — Condiciones de certificación** ✅ *Resuelto: exámenes, progreso y asistencia son tres
condiciones independientes con valores iniciales según modalidad. El progreso se calcula y se
muestra aunque no sea requisito. La asistencia puede desactivarse en `EN_VIVO` e `HIBRIDO` y no se
muestra en VIRTUAL. Si las tres condiciones están desactivadas, la certificación solo puede
emitirse manualmente con motivo registrado; esa acción establece `fecha_finalizacion` cuando aún
no exista.* (§13.1 y §13.4)

**19.13 — Fechas de los cursos virtuales** ✅ *Resuelto: `fecha_inicio` es opcional en VIRTUAL
y `fecha_fin` no se ofrece. Sin inicio, se muestra "Inicio inmediato" y el contenido se abre al
activar la matrícula; el curso continúa hasta que el administrador lo cierre. `EN_VIVO` e `HIBRIDO`
requieren inicio y fin. En VIRTUAL, el periodo del certificado se determina con `fecha_matricula`
y `fecha_finalizacion`.* (§8, §9, §13 y §14)

**19.14 — Estados del pago** ✅ *Resuelto: cada intento de pago conserva su resultado como
PENDIENTE, APROBADO, RECHAZADO, ERROR o EXPIRADO, separado del estado de acceso de la matrícula.
Culqi procesa el pago y determina el resultado; ESEJUR no cobra, autoriza ni rechaza. Solo el
resultado APROBADO activa el acceso y una confirmación repetida no duplica el pago ni la
matrícula. Un APROBADO tardío iniciado válidamente se respeta aunque después cierre la matrícula,
venza el cierre o se complete el cupo; si el curso o esa matrícula fueron CANCELADOS, el pago se
registra una sola vez, no concede acceso y pasa a atención externa. ESEJUR no impone un plazo
propio a PENDIENTE. Una matrícula administrativa genera
REGISTRADO_MANUAL cuando hubo dinero o EXONERADO cuando no lo hubo; ambas activan la matrícula.*
(§9)

**19.15 — Reintentos de pago** ✅ *Resuelto: un pago RECHAZADO, ERROR o EXPIRADO puede reintentarse
sobre la misma matrícula, conservando cada resultado y sin permitir dos intentos pendientes a la
vez. El primer resultado APROBADO informado por Culqi activa el
acceso. ESEJUR no cambia por su cuenta un resultado fallido a APROBADO y una comunicación repetida
no duplica el acceso.* (§9)

**19.16 — Ocupación del cupo al activar la matrícula** ✅ *Resuelto: ningún pago PENDIENTE reserva
cupo. Antes de iniciar el pago se comprueba disponibilidad y el cupo se ocupa únicamente cuando
Culqi informa APROBADO y la matrícula queda ACTIVA. RECHAZADO, ERROR y EXPIRADO no ocupan nada.
Las matrículas gratuitas y administrativas ocupan al activarse. Si dos aprobaciones simultáneas
o una aprobación tardía iniciada válidamente generan sobrecupo, reciben acceso y se avisa a la administración, porque ninguna persona
cobrada queda sin curso; es la única excepción a la capacidad de venta.* (§9)

**19.17 — Finalización flexible de lecciones** ✅ *Resuelto: no existe un material principal;
los materiales se ordenan arrastrando y soltando. Si hay videos detectables, todos deben alcanzar
el umbral configurado y el check automático es de solo lectura. Sin video detectable, el alumno
puede completar la lección desde el check pendiente de la lista o pulsando "Siguiente" —y
"Completar lección" en la última— dentro de ella. Una lección completada no puede desmarcarse. En
una lección EN_VIVO, la asistencia válida completa al terminar la sesión; el ausente espera la
grabación y la completa mediante progreso detectable o acción manual según su fuente.* (§7 y §11)

**19.18 — Exámenes interactivos y calificación** ✅ *Resuelto: selección única, selección
múltiple y verdadero/falso se califican automáticamente al enviar; respuesta abierta requiere
revisión del administrador. El alumno navega entre preguntas, conserva sus respuestas y revisa
pendientes antes de enviar. La nota se calcula por puntaje en escala de 0 a 20. En VIRTUAL la
habilitación es automática por avance; `EN_VIVO` e `HIBRIDO` pueden usar `fecha_habilitacion`. Una
respuesta abierta tiene 3 días calendario de revisión por defecto, muestra su fecha máxima y
bloquea la finalización y el certificado hasta quedar CALIFICADO. Las notas se redondean de forma
convencional a dos decimales antes de comparar umbrales. Los exámenes PRACTICA siempre tienen
intentos ilimitados; solo los CALIFICADO configuran límite.* (§12 y §13)

**19.19 — Exámenes que controlan el avance** ✅ *Resuelto: cada examen calificado de módulo
permite decidir si bloquea el siguiente hasta ser aprobado. La opción se activa inicialmente con
la secuencia obligatoria, pero el administrador puede apagarla para mantener el paso normal entre
módulos. Los exámenes de práctica y el final no bloquean navegación; sin secuencia, ninguno lo
hace.* (§11 y §12)

**19.20 — Matrícula tardía y asistencia** ✅ *Resuelto: `EN_VIVO` e `HIBRIDO` pueden definir
`fecha_cierre_matricula`; si exigen asistencia, inicialmente coincide con `fecha_inicio`, pero el
administrador puede extenderla. La asistencia del alumno tardío se calcula solo sobre sesiones
posteriores a su matrícula y las grabaciones anteriores solo aportan progreso. Sin sesiones
futuras no hay matrícula automática cuando la asistencia es obligatoria. VIRTUAL no usa fecha de
cierre de matrícula ni fecha de fin.* (§9, §11 y §14)

Si no existe ninguna sesión elegible, la asistencia se presenta como "No aplica": no se divide
entre cero y, cuando la asistencia es requisito, no se considera cumplida ni permite la emisión
automática; queda disponible la excepción manual motivada.

**19.21 — Nota definitiva y fecha del certificado** ✅ *Resuelto: con `dias_espera` mayor que
cero se calcula y muestra `fecha_emision_programada`; `dias_espera` se cuenta en días calendario
y la emisión se ejecuta a las 00:00 de `America/Lima`; hasta ese momento el alumno puede mejorar su
nota y el certificado se genera automáticamente al llegar la fecha. Con cero días, se muestra una
confirmación con promedio y nivel antes de generar; el alumno puede emitir o seguir mejorando. Al
emitirse, la nota y el nivel quedan congelados y se cierran los nuevos intentos de exámenes
calificados. Mientras todavía no decide, el aula muestra que ya puede generar el certificado o
continuar mejorando.* (§12, §13 y §15)

**19.22 — Corrección y anulación de certificados** ✅ *Resuelto: una corrección mantiene el
código y el estado VIGENTE, reemplaza la versión descargable y conserva el historial
administrativo; no permite cambiar libremente nota ni nivel. La anulación retira el PDF, mantiene
el QR para informar que no es válido, registra motivo, fecha y responsable, y no puede revertirse.*
(§13.6)

**19.23 — Verificación pública del certificado** ✅ *Resuelto: el QR y el ingreso manual del
código muestran nombre, curso, horas, nivel, entidad, fecha y estado, sin exponer DNI, contacto,
nota, firmas ni PDF. Un certificado corregido muestra sus datos vigentes; uno anulado indica que
no es válido y su fecha de anulación; un código inexistente no revela información.* (§13.7)

**19.24 — Cuenta y matrícula creadas por administración** ✅ *Resuelto: el administrador puede
crear una cuenta con correo, nombres, apellidos, teléfono opcional y DNI opcional. Una cuenta nueva recibe la
contraseña temporal `Escuela1415@` y CAMBIO_PENDIENTE; puede ver el panel, pero el aviso permanece
y no accede a cursos, exámenes ni certificados hasta verificar el correo, aceptar los documentos
y cambiar la contraseña. Recibe por correo las instrucciones y el código de verificación de seis dígitos. Una
cuenta existente conserva su clave. Toda matrícula administrativa
genera REGISTRADO_MANUAL o EXONERADO según exista cobro.* (§9 y §10)

El código de verificación es de un solo uso y su reenvío invalida el anterior; la recuperación dura
60 minutos y usarla o solicitar otra invalida la anterior. La contraseña propia exige al menos
ocho caracteres, mayúscula, minúscula y número. Un administrador habilitado puede crear a otro,
queda registrado como otorgante, no puede deshabilitarse a sí mismo ni dejar al sistema sin un
administrador habilitado.

**19.25 — Libro de Reclamaciones** ✅ *Resuelto: se replica el formulario público de Udeapolis,
con datos prellenados cuando existe sesión, QUEJA o RECLAMO, imágenes y declaración jurada. Al
enviar se genera número, constancia, PENDIENTE_RESPUESTA y fecha límite de 15 días hábiles. La
Escuela debe responder tanto QUEJAS como RECLAMOS desde su bandeja y el caso solo pasa a
RESPONDIDO cuando la respuesta se envía al
correo autorizado. Se conserva el formulario, adjuntos, respuesta, fechas y responsable.* (§10)

**19.26 — Reprogramación y cancelación de sesiones** ✅ *Resuelto: solo una sesión futura de
modalidad `EN_VIVO` o `HIBRIDO` puede reprogramarse o cancelarse, siempre con motivo. Reprogramar conserva su lugar
y requisitos, actualiza fecha, horas de inicio y fin, enlace, calendario y recordatorio, y avisa a los matriculados.
Cancelar es definitivo: mantiene la sesión visible como CANCELADA, la excluye de asistencia y
progreso, libera la secuencia y envía un aviso. Las sesiones realizadas solo admiten correcciones
de enlace, grabación o asistencia.* (§7, §11 y §16)

**19.27 — Validación antes de publicar** ✅ *Resuelto: BORRADOR solo pasa a PUBLICADO cuando tiene
estructura cursable, fechas y valores coherentes, una muestra real si es pagado y todos los
elementos exigidos por sus reglas de exámenes, progreso, asistencia y certificación. La validación
muestra todos los pendientes y bloquea la publicación; la advertencia de duración 10-15 minutos no
bloquea.* (§5 y §8)

**19.28 — Ventana de asistencia automática** ✅ *Resuelto: cada sesión exige hora de inicio y
hora de fin. Abrir su enlace desde la plataforma cuenta una sola vez únicamente dentro de esa
ventana. La tarjeta de sesión permanece visible, pero el enlace real no se expone y el botón está
deshabilitado fuera de la ventana; al terminar muestra la grabación o GRABACION_PENDIENTE. La
corrección manual cubre excepciones y se
mantiene aceptado que abrir el enlace no demuestra permanencia en Zoom.* (§7, §9 y §11)

**19.29 — Habilitación de cuentas creadas por administración** ✅ *Resuelto: existen tres caminos
de registro. Una cuenta administrativa puede existir y tener una matrícula ACTIVA antes de la
aceptación, pero ACTIVA representa el derecho concedido, no que la cuenta ya pueda utilizarlo. El
correo de bienvenida entrega instrucciones, código de verificación de seis dígitos y contraseña temporal; el acceso se
habilita después de verificar el correo, aceptar los documentos y cambiar la contraseña. Google
también exige aceptar los documentos antes de matricular.* (§9, §10 y §16)

**19.30 — Cancelación completa de un curso** ✅ *Resuelto: CANCELADO se diferencia del cierre
normal. Detiene matrículas y pagos nuevos, cancela sesiones futuras, avisa a los alumnos y conserva
todo el historial. El aviso es único por curso y reemplaza los avisos individuales de sus sesiones.
Quien ya finalizó mantiene la confirmación y emisión programada incluso si después su matrícula
vence o se cancela. Quien no finalizó conserva como consulta el contenido ya liberado, pero no
puede crear nuevos checks, progreso, intentos, asistencia, finalización ni certificado. Si Culqi
comunica APROBADO después de la cancelación, se registra el pago y la
matrícula permanece CANCELADA para atención externa. La Escuela resuelve los pagos fuera del
sistema y registra la atención de cada matrícula.* (§8, §9 y §16)

**19.31 — Vencimiento del tiempo de un examen** ✅ *Resuelto: el tiempo corre desde el inicio y no
se pausa por cerrar la página ni perder conexión. Al llegar a cero, el intento se envía, las
preguntas pendientes reciben cero y se consume la oportunidad. Una excepción se atiende otorgando
un intento adicional con motivo, sin borrar el anterior.* (§12)

**19.32 — Respuesta de QUEJAS y RECLAMOS** ✅ *Resuelto: la clasificación distingue el origen de
la disconformidad, pero no la obligación de atención. La Escuela responde ambos tipos dentro del
plazo máximo de 15 días hábiles improrrogables.* (§10)

**19.33 — Orden del catálogo** ✅ *Resuelto: los destacados aparecen primero. Dentro de cada
grupo se muestran los cursos VIRTUAL de inicio inmediato, luego los que tienen la fecha futura más
próxima y finalmente los que ya están en progreso. Así los virtuales sin fecha tienen una posición
definida.* (§14)

**19.34 — Reportes y dashboard administrativo** ✅ *Resuelto: administración dispone de cinco
reportes exportables a Excel: matrículas, pagos registrados, seguimiento académico, certificados
y asistencia. El rango temporal tiene un significado definido por reporte. El dashboard es
únicamente informativo y utiliza exactamente cuatro gráficos simples de
matrículas y pagos; no muestra pendientes, alertas ni tareas. Se implementa al final, después de
los procesos principales y los reportes.* (§15 y §18)

---

## 20. Consultas al cliente

Registro de lo que se consultó y cómo quedó.

| Consulta | Resolución |
|---|---|
| **¿El sistema emite comprobantes SUNAT?** | ❌ No. La Escuela los emite por su canal actual. El sistema guarda el registro del pago y su referencia para que ella pueda hacerlo. |
| **¿Se migra lo histórico del Moodle y del Drive?** | Posible más adelante, sin compromiso. No entra en el alcance actual. |
| **¿Cuánto dura el acceso?** | Permanente por defecto, con vigencia opcional preparada. *(§9)* |
| **¿Los videos de YouTube están públicos?** | ✅ **Son no listados.** El modelo de cobro está protegido. El sistema igual lo exige y lo advierte al pegar el enlace. |
| **¿Entran las sesiones en vivo?** | ✅ **Sí, entran.** Dejan de ser una previsión: se implementan. *(§7 y §11)* |
| **¿Se cobra el contenido o el certificado?** | ✅ **El contenido**, modelo Udemy. El mockup es "aproximado" y no es especificación. *(§5)* |
| **¿Moodle y esejur conviven?** | **Conviven, sin fecha de corte definida.** No hay una fecha límite que obligue a apagar el Moodle. |
| **¿Hay política de reembolso?** | ❌ Sin reembolsos en el sistema. La Escuela resuelve caso por caso fuera de la plataforma. |
| **¿Qué Colegio de Abogados refrenda?** | ✅ Se cargan **los tres**: Colegio de Abogados de Lima, de Lima Sur y el Ilustre Colegio de Abogados de Cañete. El administrador elige por curso y puede desactivar el que no aplique. *(§13.3)* |
| **¿El catálogo debe aparecer en Google?** | Sin posicionamiento en el alcance actual; puede evaluarse posteriormente. |

---

## 21. Documentos relacionados

| Documento | Contenido | Estado |
|---|---|---|
| `01-NEGOCIO.md` | Este documento: el negocio, las reglas y el alcance | 🟢 vigente |
| `02-HISTORIAS-USUARIO/` | Historias, dependencias, entregables y pantallas funcionales | 🟢 vigente |
| `04-DISENO-UX-UI/` | Guía visual, componentes y wireframes de las 40 pantallas | 🟢 vigente |

---

*Escuela Jurídica · Proyecto esejur*
