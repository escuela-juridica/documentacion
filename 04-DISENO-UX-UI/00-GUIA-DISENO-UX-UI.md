# ESEJUR — Guía maestra de diseño UX/UI

## 1. Propósito

Definir una dirección visual y de experiencia consistente para la plataforma de cursos de la
Escuela Jurídica ESEJUR. Esta guía sirve como base para:

- construir wireframes;
- diseñar las pantallas en Figma;
- crear un prototipo navegable para las reviews;
- implementar frontend sin improvisar estilos;
- conservar la misma identidad entre catálogo, matrícula, aula y administración.

Este documento explica **cómo debe verse y sentirse la plataforma**. Las historias de usuario
siguen definiendo qué debe hacer cada función.

## 2. Fuentes visuales consideradas

La propuesta parte de tres referencias:

1. **Identidad real de Escuela Jurídica:** el logotipo y el certificado proporcionado utilizan
   azul jurídico profundo, turquesa y blanco.
2. **Udeapolis:** se aprovecha como referencia para jerarquía de tarjetas, ficha comercial y
   presentación del temario, pero no se copia su identidad ni su color rojo principal.
3. **Udemy:** se toma como referencia de facilidad para continuar una clase, reconocer el progreso
   y navegar una ruta de aprendizaje.

Los colores principales extraídos visualmente del certificado proporcionado son:

- azul aproximado `#103860`;
- turquesa aproximado `#00D8D8`.

Estos valores son suficientemente consistentes para wireframes de alta fidelidad y prototipos.
Antes de cerrar el diseño final se debe solicitar el logotipo original, preferentemente en SVG, y
confirmar el manual de marca si existe.

## 3. Concepto de diseño recomendado

### Nombre conceptual

**Autoridad clara, aprendizaje cercano.**

### Personalidad

La interfaz debe transmitir simultáneamente:

- seriedad jurídica;
- confianza institucional;
- educación moderna;
- claridad operativa;
- cercanía con el alumno;
- autonomía para aprender y certificarse.

No debe sentirse como un expediente judicial antiguo ni como una plataforma financiera. Tampoco
debe parecer una copia de Moodle. La sensación buscada es la de una escuela especializada,
contemporánea y confiable.

### Principios visuales

1. **El contenido es protagonista:** títulos, docentes, fechas, avance y requisitos se reconocen
   antes que la decoración.
2. **Una acción principal por bloque:** cada tarjeta o sección debe dejar claro qué puede hacer el
   usuario a continuación.
3. **Azul para confianza; turquesa para avance:** el azul sostiene navegación y acciones
   principales; el turquesa destaca progreso, selección y elementos de marca.
4. **Blanco y grises para respirar:** la mayoría de superficies son claras para evitar una
   experiencia pesada.
5. **Estados explícitos:** no depender solo del color; todo estado lleva texto y, cuando aporte,
   icono.
6. **Consistencia antes que novedad:** el mismo botón, estado o formulario se comporta igual en
   todas las áreas.
7. **Responsive desde el inicio:** ninguna pantalla se diseña únicamente para escritorio.

### Equilibrio cromático

La interfaz no debe ser predominantemente azul. El azul conserva la autoridad institucional, pero
se combina con una paleta educativa más expresiva:

- **60 % superficies claras y neutrales:** fondos, formularios, lectura y tablas;
- **25 % azul institucional y turquesa de marca:** navegación, hero, acciones y progreso;
- **10 % acentos de contexto:** violeta, celeste, coral y dorado para distinguir evaluación,
  sesiones, oferta y certificación;
- **5 % colores semánticos:** verde, ámbar, rojo e información, únicamente cuando exista un estado
  real. Este cinco por ciento no es decoración y puede ser menor si la pantalla no tiene estados.

Los acentos ayudan a reconocer contextos; no se aplican al azar ni convierten cada tarjeta en un
color diferente. El resultado debe sentirse moderno y vivo, pero todavía jurídico y profesional.

## 4. Paleta cromática

### 4.1 Colores de marca

| Token | Color | Uso principal |
|---|---|---|
| `marca-900` | `#103860` | Encabezados, navegación, botones principales y fondos institucionales |
| `marca-800` | `#164A73` | Hover del azul, secciones secundarias y gráficos |
| `marca-700` | `#1F5F8B` | Enlaces destacados e información secundaria |
| `acento-700` | `#006F73` | Botón o enlace turquesa con texto blanco accesible |
| `acento-500` | `#00D8D8` | Progreso, selección, líneas y detalles de marca |
| `acento-100` | `#D9FAFA` | Fondos suaves de selección e información |
| `acento-050` | `#F0FFFF` | Superficie turquesa muy ligera |
| `blanco` | `#FFFFFF` | Superficies, tarjetas y texto sobre azul |

### 4.2 Colores complementarios

| Token | Color | Uso principal |
|---|---|---|
| `violeta-700` | `#6941C6` | Exámenes, preguntas y actividad académica evaluable |
| `violeta-050` | `#F4F3FF` | Fondo suave de evaluaciones |
| `celeste-700` | `#026AA2` | Sesiones, calendario y comunicación académica |
| `celeste-050` | `#F0F9FF` | Fondo suave de sesiones |
| `coral-400` | `#FF8A7A` | Modalidad En vivo y llamadas comerciales seleccionadas |
| `coral-050` | `#FFF1EF` | Fondo suave de modalidad En vivo |
| `dorado-500` | `#F4B740` | Certificación, logro y elementos de prestigio |
| `dorado-050` | `#FFF8E1` | Fondo suave de certificación |

Reglas de uso:

- el violeta no sustituye al rojo de error;
- el coral no comunica rechazo ni cancelación;
- el dorado no comunica advertencia;
- el celeste no reemplaza al turquesa de progreso;
- los acentos siempre incluyen icono o texto que explique su significado.

### 4.3 Colores neutrales

| Token | Color | Uso principal |
|---|---|---|
| `neutral-950` | `#101828` | Texto de máxima jerarquía |
| `neutral-800` | `#344054` | Texto principal |
| `neutral-600` | `#475467` | Texto secundario |
| `neutral-500` | `#667085` | Ayudas y metadatos |
| `neutral-300` | `#D0D5DD` | Bordes de controles |
| `neutral-200` | `#EAECF0` | Divisores y bordes suaves |
| `neutral-100` | `#F2F4F7` | Fondos alternos |
| `neutral-050` | `#F8FAFC` | Fondo general de la aplicación |

### 4.4 Colores semánticos

| Estado | Texto o fondo fuerte | Fondo suave | Ejemplos |
|---|---|---|---|
| Éxito | `#027A48` | `#ECFDF3` | Pago aprobado, guardado, certificado vigente |
| Advertencia | `#B54708` | `#FFFAEB` | Plazo próximo, pago pendiente, cambio de contraseña |
| Error | `#B42318` | `#FEF3F2` | Pago rechazado, dato inválido, certificado anulado |
| Información | `#175CD3` | `#EFF8FF` | Fecha futura, aviso general, ayuda contextual |

### 4.5 Reglas obligatorias de color

- Sobre `#103860` se utiliza texto blanco. Su contraste es aproximadamente `11.95:1`.
- Sobre `#00D8D8` se utiliza texto `#103860`. Su contraste es aproximadamente `6.73:1`.
- **No utilizar texto blanco sobre `#00D8D8`**, porque su contraste aproximado de `1.78:1` no es
  suficiente.
- Si se requiere un botón turquesa con texto blanco, utilizar `#006F73`.
- Sobre violeta `#6941C6` y celeste `#026AA2` puede utilizarse texto blanco.
- Sobre coral `#FF8A7A` y dorado `#F4B740` se utiliza texto azul `#103860`, no blanco.
- Rojo, verde y ámbar son semánticos; no se usan como decoración.
- Los gráficos no deben comunicar diferencias solamente mediante rojo y verde.
- El fondo principal debe ser claro. El azul oscuro se reserva para navegación, llamados
  importantes, hero y secciones institucionales.
- Violeta, celeste, coral y dorado se utilizan como acentos de contexto, no como fondos extensos de
  lectura.
- Las tablas administrativas permanecen mayoritariamente neutrales; el color aparece en badges,
  iconos, selección y resúmenes.
- En una misma tarjeta se utiliza un acento principal; no mezclar varios colores complementarios
  dentro del mismo componente.

### 4.6 Paletas por contexto

Estas combinaciones hacen la interfaz más vistosa sin perder la teoría del color. Todas parten del
azul y turquesa de la marca; cada contexto suma un acento análogo o complementario controlado.

| Contexto | Base 60/25 | Acento 10 | Semántico hasta 5 | Sensación buscada |
|---|---|---|---|---|
| Portal y catálogo | blanco, neutral-050, marca-900 | coral-400 y turquesa | solo disponibilidad real | Cercano, comercial y confiable |
| Aula y progreso | blanco, marca-900, acento-500 | celeste-700 | éxito solo al completar | Continuidad y concentración |
| Exámenes | blanco, neutral-050, marca-900 | violeta-700/050 | éxito/error por resultado | Enfoque sin ansiedad visual |
| Sesiones | blanco, marca-900, celeste-050 | celeste-700 y coral-400 | aviso por cambio/cancelación | Tiempo y presencia |
| Certificación | blanco, marca-900, dorado-050 | dorado-500 y turquesa | vigente/anulado reales | Prestigio y logro |
| Administración | neutral-050, blanco, marca-900 | turquesa, violeta o celeste por módulo | estados operativos | Precisión y lectura rápida |

Reglas de armonía:

- azul–turquesa–celeste forman la familia análoga estable;
- coral aporta contraste cálido frente al azul y se limita a focos comerciales o modalidad;
- violeta se reserva a evaluación para que el usuario aprenda su significado;
- dorado se reserva a certificación y logro, nunca a advertencias;
- una pantalla elige un acento contextual dominante y como máximo uno auxiliar;
- superficies saturadas no deben colocarse una junto a otra; se separan mediante blanco o neutral;
- cada gráfico mantiene orden de color estable para que una categoría no cambie de color entre
  dashboard, reporte y review.

## 5. Tipografía

### 5.1 Familias recomendadas

- **Inter:** interfaz, botones, formularios, tablas, navegación y texto general.
- **Merriweather:** títulos editoriales del portal público, nombres de programas y piezas
  institucionales seleccionadas.

La administración y el aula utilizan principalmente Inter. Merriweather se usa con moderación para
transmitir autoridad académica sin reducir legibilidad.

### 5.2 Escala tipográfica

| Estilo | Escritorio | Móvil | Peso | Uso |
|---|---|---|---:|---|
| Display | 48/56 px | 36/44 px | 700 | Título principal del catálogo o ficha destacada |
| H1 | 40/48 px | 32/40 px | 700 | Título principal de pantalla pública |
| H2 | 32/40 px | 28/36 px | 700 | Secciones principales |
| H3 | 24/32 px | 22/30 px | 650–700 | Tarjetas destacadas y módulos |
| H4 | 20/28 px | 18/26 px | 600 | Subsecciones y diálogos |
| Cuerpo | 16/24 px | 16/24 px | 400 | Lectura normal |
| Cuerpo pequeño | 14/20 px | 14/20 px | 400–500 | Tablas, ayudas y metadatos |
| Etiqueta | 12/16 px | 12/16 px | 600 | Badges y textos auxiliares |

### 5.3 Reglas tipográficas

- Evitar textos generales menores de 14 px.
- Utilizar mayúsculas completas solo en etiquetas breves.
- No justificar párrafos; alinearlos a la izquierda.
- Limitar textos de lectura a aproximadamente 65–75 caracteres por línea.
- En tarjetas, truncar visualmente títulos extensos a dos o tres líneas, pero conservar el título
  completo para tecnologías de asistencia y detalle.
- Los números importantes, precios y porcentajes deben poder reconocerse al escanear la pantalla.

## 6. Retícula, espaciado y dimensiones

### 6.1 Frames de Figma

| Dispositivo | Frame recomendado | Columnas | Margen | Separación |
|---|---:|---:|---:|---:|
| Escritorio | 1440 px | 12 | 80–120 px | 24 px |
| Portátil | 1280 px | 12 | 48 px | 24 px |
| Tableta | 768 px | 8 | 32 px | 20 px |
| Móvil | 390 px | 4 | 16 px | 16 px |

- Contenedor público máximo: `1200 px`.
- Contenedor de formularios de acceso: `440–480 px`.
- Área de lectura o examen: máximo `960 px` cuando no requiere panel lateral.
- Barra lateral administrativa: `264 px`, colapsable a iconos.
- Barra lateral del aula: `320 px` en escritorio y panel deslizable en móvil.

### 6.2 Sistema de espaciado

Usar una base de 8 px:

```text
4, 8, 12, 16, 24, 32, 40, 48, 64, 80 y 96 px
```

- Espacio entre icono y texto: 8 px.
- Espacio entre etiqueta y control: 8 px.
- Espacio entre campos: 20–24 px.
- Relleno de tarjeta: 20–24 px.
- Separación entre secciones: 48–64 px.

### 6.3 Bordes, radios y sombras

| Elemento | Radio recomendado |
|---|---:|
| Botón, campo y selector | 8 px |
| Tarjeta | 12 px |
| Panel destacado y modal | 16 px |
| Badge | 999 px |

- Borde normal: `1 px solid #D0D5DD`.
- Borde seleccionado: `2 px solid #00D8D8`.
- Sombra de tarjeta: suave, sin efecto flotante exagerado.
- Sombra elevada: solo en menús, modales y ficha comercial fija.
- Evitar radios excesivamente redondos que resten seriedad institucional.

## 7. Iconografía e imágenes

### 7.1 Iconos

- Utilizar una sola familia de iconos lineales.
- Tamaños habituales: 16, 20 y 24 px.
- Mantener grosor visual uniforme.
- Todo icono de acción debe acompañarse de texto o etiqueta accesible.
- No utilizar emojis como iconos de interfaz.

### 7.2 Fotografía

Priorizar:

- docentes y especialistas reales;
- grupos profesionales en contexto académico;
- espacios institucionales reconocibles;
- actividades de formación jurídica;
- logos de entidades certificadoras autorizadas.

Evitar como recurso dominante:

- mazos de juez genéricos;
- balanzas doradas repetidas;
- bibliotecas artificiales sin relación con el curso;
- fotografías de banco demasiado corporativas;
- imágenes con texto incrustado que repita el título de la tarjeta.

Las portadas deben soportar una capa azul suave para conservar legibilidad de etiquetas cuando sea
necesario.

### 7.3 Uso del logotipo

- Mantener proporción original.
- No estirar, rotar ni cambiar sus colores arbitrariamente.
- Conservar un área libre equivalente a la altura del símbolo alrededor del logo.
- Utilizar versión principal sobre blanco y versión blanca sobre azul oscuro.
- Definir una versión compacta del símbolo para avatar, favicon y navegación colapsada.
- No reconstruir el logo desde una captura para producción; solicitar el archivo original.

### 7.4 Recurso gráfico propio

El certificado utiliza formas geométricas angulares en azul y turquesa. Ese lenguaje puede
convertirse en un recurso distintivo de ESEJUR:

- líneas finas y polígonos en esquinas del hero;
- bloques geométricos pequeños detrás de títulos editoriales;
- formas suaves en estados vacíos y portada del prototipo;
- combinación ocasional con coral o dorado en baja proporción.

No utilizar estos elementos detrás de formularios, tablas, preguntas de examen o textos largos.
Su función es dar identidad, no decorar cada pantalla.

## 8. Arquitectura visual por contexto

### 8.1 Portal público

Debe sentirse abierto, comercial y académico.

**Encabezado:**

- logo a la izquierda;
- acceso a catálogo;
- verificación de certificados;
- “Iniciar sesión” como acción secundaria;
- “Registrarme” como acción principal;
- menú compacto en móvil.

No se duplican las páginas institucionales que permanecen en la web principal de la Escuela.

**Contenido:**

- hero con gradiente controlado de azul a turquesa oscuro, formas geométricas de marca y propuesta
  de valor breve;
- buscador visible;
- cursos destacados primero;
- tarjetas limpias con información comparable y un solo acento por modalidad;
- secciones con mucho espacio blanco;
- fondos alternos muy suaves en turquesa, violeta, celeste o dorado para separar secciones sin
  llenar toda la página de azul;
- pie de página en cuatro grupos: identidad breve, navegación de cursos, contacto/WhatsApp y legal;
  el grupo legal contiene Términos, Privacidad, Libro de Reclamaciones y Verificar certificado,
  además del enlace a la web institucional. En móvil los grupos usan acordeones, pero los enlaces
  legales permanecen accesibles sin iniciar sesión.

### 8.2 Área del alumno

Debe sentirse clara, motivadora y orientada a continuar.

- navegación principal breve: Mis cursos, Mis certificados y Mi perfil;
- tarjeta de curso con acción “Continuar” dominante;
- avance y requisitos visibles sin abrumar;
- estados explicados en lenguaje natural;
- alertas importantes persistentes pero no invasivas;
- contenido académico con máximo espacio para el video o material.
- color contextual: turquesa para progreso, celeste para sesiones, violeta para exámenes y dorado
  para certificación.

### 8.3 Administración

Debe sentirse eficiente y densa, pero legible.

- barra lateral estable y agrupada por función;
- encabezado con título, contexto y acción principal;
- filtros antes de las tablas;
- tablas con encabezado fijo cuando sean extensas;
- acciones destructivas alejadas de acciones habituales;
- edición compleja mediante pestañas o pasos, no una página interminable;
- confirmaciones claras para publicar, cancelar, anular o emitir.
- superficies y tablas neutrales, con acentos de color limitados a estados, indicadores y contexto;
  no convertir el panel administrativo en un mosaico multicolor.

## 9. Componentes principales

### 9.1 Botones

| Variante | Diseño | Uso |
|---|---|---|
| Primario | Fondo `#103860`, texto blanco | Una acción principal por bloque |
| Secundario | Fondo blanco, borde `#103860`, texto azul | Alternativa segura |
| Acento | Fondo `#006F73`, texto blanco | Progreso o acción educativa destacada |
| Texto | Sin fondo, texto azul | Acciones de baja jerarquía |
| Destructivo | Fondo `#B42318`, texto blanco | Cancelar, anular o eliminar cuando corresponda |

Estados obligatorios: normal, hover, focus, presionado, cargando y deshabilitado.

- Altura mínima: 44 px; recomendada: 48 px.
- El botón cargando conserva su ancho y evita envíos repetidos.
- “Pagar ahora”, “Publicar curso”, “Entregar examen” y “Emitir certificado” requieren una jerarquía
  inequívoca.

### 9.2 Campos y formularios

- Etiqueta siempre visible sobre el campo.
- Placeholder como ejemplo, nunca como único nombre del dato.
- Ayuda debajo del campo cuando evita un error.
- Error junto al dato y resumen superior si el formulario es largo.
- Campos obligatorios identificados de forma textual.
- Teléfono identificado como opcional donde corresponda.
- Correo de perfil visible como solo lectura, no aparenta estar roto.
- Contraseñas con mostrar/ocultar y lista clara de condiciones.
- Guardado con confirmación visible y sin borrar lo ingresado ante un error recuperable.

### 9.3 Tarjeta de curso

Debe incluir según corresponda:

- imagen en proporción `16:9`;
- badge de modalidad;
- tipo o categoría en segundo nivel;
- título de dos o tres líneas;
- docente o docentes;
- fecha o “Inicio inmediato”;
- precio actual y precio anterior tachado cuando la promoción esté vigente;
- estado de disponibilidad;
- acción “Ver curso”, “Continuar” o equivalente.

No llenar la tarjeta con todos los beneficios; esos se reservan para la ficha.

### 9.4 Badges de estado

Los badges deben contener texto, no solo color.

| Estado | Tratamiento sugerido |
|---|---|
| Virtual | Turquesa suave, texto azul oscuro |
| En vivo | Coral suave, texto azul oscuro e icono de transmisión |
| Híbrido | Violeta suave, texto violeta oscuro |
| Inicio inmediato | Turquesa suave con texto azul oscuro |
| Próximamente | Celeste suave |
| En progreso | Turquesa suave |
| Matrícula cerrada | Gris neutro |
| Sin cupos | Gris oscuro o advertencia según contexto |
| Aprobado o vigente | Verde suave |
| Pendiente | Ámbar suave |
| Rechazado, cancelado o anulado | Rojo suave |

### 9.5 Alertas

- Franja o tarjeta con icono, título, explicación y acción.
- Las alertas persistentes, como cambio de contraseña, aparecen al inicio del contenido sin cubrir
  la navegación.
- Un toast confirma acciones breves; no sustituye información que el usuario necesita conservar.
- Los errores críticos permanecen visibles hasta ser atendidos.

### 9.6 Tablas

- Encabezado con fondo neutro y texto oscuro.
- Filas de 52–56 px como mínimo.
- Acciones agrupadas al final de la fila.
- Filtros y búsqueda arriba.
- Paginación clara.
- En móvil, transformar filas en tarjetas o mostrar columnas prioritarias; no reducir el texto
  hasta volverlo ilegible.

### 9.7 Modales

- Usarlos para confirmaciones o formularios breves.
- Evitar formularios extensos dentro de un modal.
- Mostrar impacto concreto de una acción irreversible.
- El foco entra al modal, queda contenido y vuelve a la acción de origen al cerrar.

### 9.8 Progreso

- Barra horizontal con porcentaje y descripción.
- Color `#00D8D8` sobre pista neutra, con texto azul oscuro.
- Mostrar valor actual, meta y acción pendiente cuando la certificación depende de él.
- No utilizar anillos decorativos para todos los datos; reservarlos para un resumen compacto.

## 10. Diseño por grupo de pantallas

### PF-001 — Inicio y catálogo

- Hero con gradiente `#103860 → #164A73 → #006F73`, de altura moderada y no a pantalla completa.
- Formas geométricas turquesa, coral o dorado con baja presencia y sin competir con el texto.
- Título breve, buscador central y acceso a categorías.
- Filtros en barra lateral de escritorio y panel deslizable en móvil.
- Cuadrícula de tres tarjetas en 1440 px, dos en tableta y una en móvil.
- Cursos destacados antes del resto, con etiqueta discreta.
- Badge de modalidad con color contextual: Virtual turquesa, En vivo coral e Híbrido violeta.
- Estado sin resultados con acción para limpiar filtros.

### PF-002 — Ficha y vista previa

- Encabezado azul con título, descripción corta, modalidad, docente y datos esenciales.
- Columna principal para beneficios, temario y docente.
- Tarjeta comercial derecha fija al desplazarse, sin cubrir el pie de página.
- Precio, promoción, disponibilidad y acción principal juntos.
- Temario en acordeones por módulo.
- Vista previa integrada en reproductor o panel amplio, sin exponer contenido protegido.

### PF-003 a PF-011 — Acceso y cuenta

- Formularios centrados de máximo 480 px.
- Fondo claro con bloque institucional azul discreto en escritorio.
- El registro no debe parecer un formulario legal extenso; consentimientos al final con enlaces.
- Google se presenta como alternativa equivalente, no como botón dominante sobre el registro.
- Verificación y recuperación usan estados simples con icono, título, explicación y siguiente paso.
- Perfil dividido en Datos personales y Seguridad.
- Gestión administrativa de usuarios utiliza tabla más panel lateral de creación.

### PF-012 a PF-015 — Configuración administrativa

- Listados con filtros y acción principal en el encabezado.
- Editor de curso dividido en pestañas: General, Contenido, Sesiones, Exámenes, Certificación y
  Publicación.
- Guardado visible por pestaña y resumen de pendientes antes de publicar.
- Contenido organizado como árbol reordenable mediante asa de arrastre; también ofrecer controles
  accesibles para subir o bajar.
- Matrículas y pagos se consultan juntos en la pantalla, pero sus estados se presentan por
  separado.

### PF-016 a PF-019 — Matrícula y acceso

- Confirmación gratuita breve con resumen del curso.
- Checkout en dos columnas: datos del pago y resumen fijo del pedido.
- No mostrar contador de reserva, porque ESEJUR no reserva cupos.
- Estado procesando bloquea el doble envío sin afirmar aprobación.
- Resultado aprobado, pendiente o rechazado debe ser inequívoco y mostrar el siguiente paso.
- “Mis cursos” prioriza el botón “Continuar” y el progreso real.

### PF-020 a PF-022 — Aula, lecciones y sesiones

- Aula en tres zonas posibles: navegación del curso, contenido y panel contextual; reducir a una
  columna en móvil.
- Reproductor de video como elemento principal.
- Materiales debajo del contenido, con tipo, nombre, tamaño cuando aplique y permiso de descarga.
- Acción “Siguiente” siempre en posición predecible.
- Check de lección visible en la ruta, diferenciando automático y manual mediante explicación, no
  mediante un icono diferente sin texto.
- Calendario y lista como vistas alternas de las mismas sesiones.
- Progreso turquesa y sesiones celestes; los fondos amplios continúan blancos o neutrales.

### PF-023 y PF-024 — Exámenes

- Encabezado con título, intento, tiempo restante y acción de entrega.
- Navegador numerado lateral o superior que distinga respondida, pendiente, actual y marcada para
  revisar.
- Una pregunta principal por bloque para reducir carga cognitiva.
- Respuestas grandes y fáciles de seleccionar.
- En móvil, temporizador fijo y navegador de preguntas desplegable.
- Confirmación antes de entregar; al agotarse el tiempo se explica el envío automático.
- Resultado con nota, aprobación, mejor intento, intentos disponibles y respuestas visibles según
  configuración.
- Respuesta abierta pendiente presenta fecha máxima de calificación.
- Violeta como acento académico en navegador, selección y encabezado; éxito o error conservan sus
  colores semánticos.

### PF-025 a PF-028 — Operación académica

- Sesiones y asistencia mediante tabla con resumen de elegibles y porcentaje.
- Reprogramación muestra claramente valor anterior y nuevo.
- Cola de respuestas abiertas ordenada por vencimiento con badges de urgencia.
- Calificación presenta respuesta completa y puntaje en un panel fijo.
- Excepción académica exige motivo y muestra historial antes de confirmar.

### PF-029 a PF-034 — Certificación

- Estado de certificación mediante lista de requisitos cumplidos y pendientes.
- Fecha programada visible como información, no como alarma.
- Confirmación de datos presenta exactamente cómo aparecerán en el certificado.
- Advertencia anterior a la emisión explica que no habrá nuevos intentos calificables.
- “Mis certificados” utiliza tarjetas sobrias con estado y descarga.
- Visor privado centra el documento y mantiene descargar como acción principal.
- Verificación pública es simple: código, resultado y datos mínimos.
- Administración separa listado de certificados y operación detallada con historial.
- Dorado como acento de logro en iconos, bordes y fondos suaves, nunca como texto claro sobre fondo
  claro.

### PF-035 a PF-038 — Excepciones y reclamaciones

- La excepción de matrícula o pago muestra tres bloques: pago, matrícula y acceso final.
- Los casos contradictorios requieren explicación antes de habilitar una resolución.
- Libro de reclamaciones público como formulario por secciones, con resumen antes de enviar.
- Explicar `QUEJA` y `RECLAMO` cerca de la selección.
- Bandeja administrativa ordenada por plazo, con próximos a vencer y vencidos visibles.
- Respuesta institucional muestra el historial del correo y bloquea edición después del envío
  exitoso.

### PF-039 — Centro de reportes

- Cinco pestañas: Matrículas, Pagos, Académico, Certificados y Asistencia.
- Filtros consistentes en la parte superior.
- Resumen breve antes de la tabla.
- Exportación como acción secundaria.
- Estado vacío explica si no hay datos o si los filtros no producen resultados.

### PF-040 — Dashboard

- No muestra tarjetas de indicadores ni métricas adicionales.
- Muestra exactamente cuatro gráficos: evolución de matrículas, matrículas por curso, forma de
  ingreso y pagos confirmados por periodo.
- Mostrar etiquetas y valores al interactuar.
- No incluir pendientes, tareas ni alertas operativas.
- Aplicar las mismas fechas, deduplicación y conceptos de los reportes correspondientes.
- Distribuir azul, turquesa, violeta, celeste, coral y dorado con leyenda; no repetir variaciones de
  azul que resulten difíciles de diferenciar.

### Matriz visual de las 40 pantallas

Esta matriz confirma que cada pantalla funcional tiene una base visual y una acción reconocible.
Los estados completos permanecen definidos en las historias y en el mapa de pantallas.

| ID | Pantalla | Base visual | Acción principal o propósito |
|---|---|---|---|
| PF-001 | Inicio y catálogo | Hero, buscador, filtros y cuadrícula | Encontrar y abrir un curso |
| PF-002 | Ficha y vista previa | Hero del curso, contenido y tarjeta comercial | Ver muestra o iniciar matrícula |
| PF-003 | Inicio de sesión | Formulario centrado | Ingresar |
| PF-004 | Registro | Formulario por bloques | Crear cuenta |
| PF-005 | Verificación del correo | Estado ilustrado simple | Continuar al ingreso o reenviar |
| PF-006 | Solicitud de recuperación | Formulario centrado | Solicitar enlace |
| PF-007 | Nueva contraseña | Formulario centrado con condiciones | Guardar contraseña |
| PF-008 | Panel inicial | Encabezado, bienvenida y navegación | Acceder a la función principal del rol |
| PF-009 | Mi perfil | Pestañas Datos y Seguridad | Guardar cambios |
| PF-010 | Gestión de usuarios | Tabla y panel lateral | Crear o habilitar cuenta |
| PF-011 | Documentos legales | Lectura con índice o pestañas | Consultar privacidad o términos |
| PF-012 | Información base | Pestañas y listados administrables | Crear o actualizar valor |
| PF-013 | Gestión de cursos | Tabla o tarjetas administrativas | Crear curso |
| PF-014 | Editor del curso | Pestañas con resumen de validación | Guardar o publicar |
| PF-015 | Matrículas y pagos | Filtros, tabla y detalle | Consultar o matricular administrativamente |
| PF-016 | Matrícula gratuita | Resumen del curso | Confirmar matrícula |
| PF-017 | Checkout | Formulario y resumen fijo | Pagar ahora |
| PF-018 | Resultado del pago | Estado y comprobante | Ir a Mis cursos o reintentar |
| PF-019 | Mis cursos | Cuadrícula de tarjetas de aprendizaje | Continuar curso |
| PF-020 | Aula y ruta | Temario, resumen y avance | Continuar última lección |
| PF-021 | Lección | Reproductor, materiales y navegación | Siguiente o Completar lección |
| PF-022 | Calendario y sesiones | Calendario/lista y detalle | Ingresar a sesión o ver grabación |
| PF-023 | Resolución del examen | Pregunta, navegador y temporizador | Entregar examen |
| PF-024 | Resultado del examen | Nota, intentos y retroalimentación | Reintentar o continuar |
| PF-025 | Sesiones y asistencia | Tabla, resumen y detalle | Registrar asistencia o modificar sesión |
| PF-026 | Cola de respuestas abiertas | Filtros y tabla por vencimiento | Revisar respuesta |
| PF-027 | Calificación abierta | Respuesta y panel de puntaje | Confirmar calificación |
| PF-028 | Excepciones académicas | Búsqueda, situación e historial | Aplicar excepción justificada |
| PF-029 | Estado de certificación | Lista de requisitos y datos | Confirmar emisión cuando corresponda |
| PF-030 | Mis certificados | Tarjetas sobrias | Ver certificado |
| PF-031 | Visor privado | Documento centrado | Descargar |
| PF-032 | Verificación pública | Buscador y resultado mínimo | Verificar código |
| PF-033 | Gestión de certificados | Filtros y tabla | Abrir operación administrativa |
| PF-034 | Operación del certificado | Datos, requisitos e historial | Emitir, corregir o anular |
| PF-035 | Excepciones de matrícula y pago | Comparación de pago, matrícula y acceso | Resolver caso |
| PF-036 | Queja o reclamo público | Formulario por secciones | Presentar caso |
| PF-037 | Bandeja de reclamaciones | Tabla ordenada por vencimiento | Abrir caso urgente |
| PF-038 | Respuesta de reclamación | Detalle, evidencia y editor | Enviar respuesta |
| PF-039 | Centro de reportes | Filtros, resumen, tabla y cinco pestañas | Consultar o exportar |
| PF-040 | Dashboard | Filtros y cuatro gráficos simples | Comprender matrículas y pagos confirmados |

## 11. Navegación

### 11.1 Visitante

```text
Catálogo → Ficha → Vista previa
                   ├─ Registro
                   ├─ Inicio de sesión
                   └─ Matrícula
```

### 11.2 Alumno

```text
Mis cursos → Aula → Lección → Siguiente
                 ├─ Sesiones
                 ├─ Examen
                 └─ Estado de certificación → Mis certificados
```

### 11.3 Administrador

```text
Dashboard
├─ Cursos
├─ Matrículas y pagos
├─ Operación académica
├─ Certificados
├─ Quejas y reclamos
├─ Reportes
└─ Configuración base
```

### 11.4 Reglas de navegación

- El usuario siempre sabe dónde está mediante título y contexto; usar breadcrumb en niveles
  administrativos profundos.
- Conservar una salida clara desde ficha, checkout, examen y visor de certificado.
- No abrir navegación interna en nuevas pestañas sin necesidad.
- Advertir antes de abandonar un formulario con cambios sin guardar o un examen activo.
- El botón Atrás del navegador no debe romper el flujo ni repetir operaciones de pago.

## 12. Responsive

### Escritorio

- Aprovechar columnas y paneles sin extender excesivamente las líneas de lectura.
- Mantener visibles acciones importantes cuando el contenido es largo.
- Permitir tablas completas con desplazamiento controlado cuando sea inevitable.

### Tableta

- Colapsar la barra administrativa a iconos o panel temporal.
- Pasar ficha comercial debajo del encabezado cuando no exista ancho suficiente.
- Mantener dos columnas de tarjetas cuando sean legibles.

### Móvil

- Navegación mediante menú lateral temporal.
- Una tarjeta por fila.
- Botones principales de ancho completo cuando ayuden a tocar con facilidad.
- Checkout y ficha en una sola columna.
- Temario del aula como panel deslizable.
- Tablas convertidas a tarjetas con datos prioritarios.
- Controles táctiles de al menos `44 × 44 px`.

### Puntos de quiebre obligatorios

- `>= 1280 px`: escritorio amplio, doce columnas y barra administrativa de 264 px.
- `1024–1279 px`: escritorio compacto; se reducen márgenes, no controles.
- `768–1023 px`: tableta, ocho columnas; paneles laterales pasan a cajón cuando falte espacio.
- `< 768 px`: móvil, cuatro columnas y flujo vertical.
- `< 480 px`: móvil estrecho; acciones dobles se apilan y las tablas usan tarjetas.
- No diseñar solo los anchos de referencia: probar al menos 1440, 1024, 768, 390 y 320 px sin
  desplazamiento horizontal, salvo tablas dentro de su contenedor accesible.
- No ocultar requisitos, precios, plazos o estados necesarios para decidir.

## 13. Accesibilidad

Objetivo mínimo: contraste y comportamiento equivalentes a WCAG nivel AA.

- Contraste mínimo `4.5:1` para texto normal y `3:1` para texto grande.
- Foco visible de 2–3 px, con separación suficiente del componente.
- Navegación completa mediante teclado.
- Orden de foco coherente.
- Etiquetas programáticas para campos e iconos.
- Texto alternativo para imágenes informativas.
- Subtítulos o alternativa textual para videos cuando el contenido lo proporcione.
- Errores anunciables y asociados al campo correspondiente.
- No depender solo de color para aprobación, vencimiento o error.
- Evitar animaciones obligatorias; respetar reducción de movimiento.
- Temporizador de examen siempre visible y con avisos no invasivos.
- Cambios automáticos importantes deben ser comunicados al usuario.

## 14. Microinteracciones

Utilizar animaciones breves de `150–250 ms` para:

- abrir menús y acordeones;
- mostrar confirmaciones;
- actualizar progreso;
- reordenar módulos;
- cambiar entre estados de botones.

Evitar:

- animaciones decorativas largas;
- carruseles automáticos;
- parpadeos;
- transiciones que bloqueen la navegación;
- confeti en pagos, exámenes o certificados, porque reduce la sobriedad institucional.

## 15. Tono de los textos

- Español claro, directo y respetuoso.
- Usar “tú” de forma consistente en el área del alumno.
- Evitar términos internos como `PENDIENTE_DATOS` en la interfaz; mostrar “Completa tus datos”.
- Explicar cómo continuar, no solo indicar que algo falló.
- Conservar nombres naturales: “Virtual”, “En vivo” e “Híbrido”.
- Fechas y horas en hora de Lima.
- Moneda expresada con el formato `S/ 0.00`; el valor mostrado depende del precio real del curso.
- Notas sobre veinte: `16.50/20` o `16.50`, según el contexto, sin ambigüedad.

Ejemplos:

| Evitar | Preferir |
|---|---|
| “Error 400” | “No pudimos guardar los cambios. Revisa los campos indicados.” |
| “PENDIENTE_DATOS” | “Completa tus datos para emitir el certificado.” |
| “Sin acceso” | “Esta matrícula no tiene acceso vigente al curso.” |
| “Operación fallida” | “Culqi no aprobó el pago. Puedes intentarlo nuevamente.” |

## 16. Organización recomendada del archivo Figma

```text
00-PORTADA
01-FUNDAMENTOS
02-COMPONENTES
03-PATRONES
10-EP01-ACCESO-Y-DESCUBRIMIENTO
20-EP02-PUBLICACION-Y-MATRICULA
30-EP03-DESARROLLO-ACADEMICO
40-EP04-CERTIFICACION-Y-CONTROL
90-PROTOTIPOS-REVIEW
99-ARCHIVO
```

### Componentes

Nomenclatura interna en español sin tildes ni `ñ`:

```text
Boton/Primario/Normal
Boton/Primario/Cargando
Campo/Texto/Error
Tarjeta/Curso/Catalogo
Badge/Curso/EnVivo
Alerta/Advertencia
Tabla/Fila/Seleccionada
Progreso/Curso
```

### Variables y estilos

Crear variables para:

- colores de marca, neutrales y semánticos;
- espaciado;
- radios;
- tipografía;
- sombras;
- tamaños de controles.

Usar Auto Layout en todos los componentes y pantallas adaptables. No posicionar manualmente cada
elemento si puede resolverse con reglas de distribución.

## 17. Prototipo para las reviews

### EP01

```text
Catálogo → Ficha → Registro → Documentos → Verificación → Login → Panel → Perfil
```

Debe permitir también mostrar recuperación, Google y creación administrativa.

### EP02

```text
Administración → Crear curso → Contenido → Requisitos → Publicar
Catálogo → Ficha → Matrícula gratuita o pago → Resultado → Mis cursos
```

### EP03

```text
Mis cursos → Aula → Lección → Progreso → Sesión → Examen → Resultado
Administración → Calificar respuesta → Excepción
```

### EP04

```text
Estado de certificación → Confirmar datos → Certificado → Verificación pública
Administración → Excepciones → Reclamos → Reportes → Dashboard
```

Para el prototipo se crean caminos alternos controlados mediante botones o variantes: aprobado,
rechazado, pendiente, vacío y error. No es necesario construir una simulación de backend dentro de
Figma.

## 18. Alcance visual inicial

### Incluido

- tema claro;
- escritorio y móvil;
- sistema de componentes;
- estados relevantes;
- navegación de las cuatro épicas;
- cinco prototipos de review correspondientes a los cinco incrementos;
- piezas necesarias para las 40 pantallas funcionales.

### No incluido inicialmente

- modo oscuro;
- personalización de colores por curso;
- animaciones complejas;
- ilustraciones 3D;
- gamificación visual;
- diseño de la web institucional externa;
- rediseño del logotipo;
- páginas públicas que no pertenecen a la plataforma de cursos.

## 19. Criterios para aprobar una pantalla

Una pantalla se considera lista para desarrollo cuando:

- corresponde a una pantalla PF identificada;
- utiliza componentes y variables del sistema de diseño;
- muestra el estado normal y los estados alternativos relevantes;
- tiene versión de escritorio y móvil;
- respeta la jerarquía de acción;
- explica errores y bloqueos;
- utiliza los datos que requiere la historia;
- no introduce una regla de negocio nueva;
- conserva contraste, foco y tamaños táctiles adecuados;
- se conecta correctamente con el prototipo de su épica;
- puede demostrarse siguiendo el entregable funcional de la review.

## 20. Lista de revisión visual final

- [ ] El logotipo conserva su proporción y colores.
- [ ] Azul y turquesa se utilizan según su función.
- [ ] No existe texto blanco sobre turquesa brillante.
- [ ] Hay una sola acción primaria por bloque.
- [ ] Formularios conservan etiquetas visibles.
- [ ] Todos los estados contienen texto comprensible.
- [ ] Botones y campos tienen estados de foco, carga y deshabilitado.
- [ ] La versión móvil no pierde información crítica.
- [ ] Tablas extensas tienen alternativa usable en móvil.
- [ ] El aula permite continuar sin buscar la última lección.
- [ ] El examen mantiene visible tiempo y navegación.
- [ ] Pago pendiente no se presenta como aprobado.
- [ ] El certificado privado no se confunde con la verificación pública.
- [ ] El dashboard solo presenta gráficos simples de matrícula.
- [ ] El diseño puede recorrerse de extremo a extremo en la review.

## 21. Resultado visual esperado

El producto final debe reconocerse como una plataforma propia de Escuela Jurídica incluso sin leer
su nombre: azul profundo institucional, acentos turquesa, superficies claras, tipografía sobria,
tarjetas académicas limpias y una experiencia centrada en continuar, comprender y completar.

La referencia Udeapolis orienta la composición comercial; Udemy orienta la experiencia de
aprendizaje; ESEJUR conserva una identidad visual propia y coherente con su certificado.
