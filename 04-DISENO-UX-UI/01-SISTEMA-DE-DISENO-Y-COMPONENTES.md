# ESEJUR — Sistema de diseño y especificación de componentes

## 1. Propósito

Definir con precisión cómo deben construirse los componentes visuales de ESEJUR en Figma y en el
frontend. Este documento elimina ambigüedades sobre tamaños, espaciado, colores, estados,
comportamiento responsive y accesibilidad.

Debe utilizarse junto con:

- `00-GUIA-DISENO-UX-UI.md`, que define la dirección visual general;
- las historias de usuario, que definen reglas y resultados funcionales;
- el mapa de pantallas PF-001 a PF-040, que define dónde se utiliza cada componente.

Una pantalla no se considera diseñada si solo contiene cajas estáticas. Debe representar sus
estados normales, alternativos, vacíos, de carga, error, bloqueo y confirmación cuando correspondan.

## 2. Reglas generales

1. Utilizar Auto Layout en Figma para todos los componentes y contenedores adaptables.
2. No dibujar variantes manualmente si pueden resolverse con propiedades de componente.
3. Utilizar variables para colores, espacios, radios, sombras y tipografía.
4. Usar Inter como fuente principal de interfaz.
5. Reservar Merriweather para títulos editoriales seleccionados del portal público.
6. Mantener un área táctil mínima de `44 × 44 px`.
7. Utilizar texto además de color para comunicar estados.
8. Mostrar siempre el foco de teclado.
9. No utilizar texto blanco sobre el turquesa `#00D8D8`.
10. Los nombres internos de componentes se escriben en español sin tildes ni `ñ`.

### 2.1 Jerarquía y carga visual

- Cada pantalla identifica una tarea principal y la expresa con un solo botón de máxima jerarquía.
- Estado, explicación y siguiente paso ocupan el primer nivel; historial y detalle técnico se
  muestran después o bajo demanda.
- No colocar a la vez tabla, formulario completo, historial completo y confirmación. El listado
  abre el detalle; el detalle abre la acción; la acción solicita confirmación solo si corresponde.
- Los campos condicionales permanecen ocultos hasta que una selección los vuelve necesarios.
- Una acción no disponible se oculta cuando nunca aplica al estado; se deshabilita con explicación
  cuando verla ayuda a entender qué requisito falta.
- No repetir el mismo estado en badge, alerta y tarjeta dentro del mismo bloque. Elegir una forma
  principal y usar las demás solo si aportan información distinta.
- En móvil, priorizar una tarea por vista y utilizar paneles temporales para navegación, filtros o
  detalle. Nunca apilar varias barras fijas que reduzcan el área útil.
- Un badge informa, una pestaña cambia de sección, un selector filtra y un botón ejecuta. La forma
  visual no puede sustituir el comportamiento correspondiente.

## 3. Variables fundamentales

### 3.1 Colores de marca

| Variable Figma | Valor | Aplicación |
|---|---|---|
| `Color/Marca/900` | `#103860` | Navegación, botón primario, fondo institucional |
| `Color/Marca/800` | `#164A73` | Hover de marca y gráficos |
| `Color/Marca/700` | `#1F5F8B` | Enlaces y elementos secundarios |
| `Color/Acento/700` | `#006F73` | Acción educativa con texto blanco |
| `Color/Acento/500` | `#00D8D8` | Progreso, selección y detalles de marca |
| `Color/Acento/100` | `#D9FAFA` | Fondo de selección |
| `Color/Acento/050` | `#F0FFFF` | Superficie informativa suave |
| `Color/RojoMarca/600` | `#C83E4D` | Acento institucional, focos editoriales y destacados comerciales |
| `Color/RojoMarca/050` | `#FFF1F3` | Superficie cálida suave y etiquetas destacadas |

### 3.2 Colores complementarios

Antes de los neutrales, la interfaz dispone de colores complementarios para diferenciar contextos.
No reemplazan los estados semánticos.

| Variable Figma | Valor | Contexto |
|---|---|---|
| `Color/Violeta/700` | `#6941C6` | Exámenes y evaluación |
| `Color/Violeta/050` | `#F4F3FF` | Fondo de evaluación |
| `Color/Celeste/700` | `#026AA2` | Sesiones y calendario |
| `Color/Celeste/050` | `#F0F9FF` | Fondo de sesiones |
| `Color/Coral/400` | `#FF8A7A` | Modalidad En vivo y acento comercial |
| `Color/Coral/050` | `#FFF1EF` | Fondo de modalidad En vivo |
| `Color/Dorado/500` | `#F4B740` | Certificación y logro |
| `Color/Dorado/050` | `#FFF8E1` | Fondo de certificación |

Distribución recomendada: 60 % neutrales, 25 % azul y turquesa de marca, 10 % rojo institucional y
acentos de contexto, y hasta 5 % colores semánticos vinculados a estados reales. En administración
se reduce el acento decorativo, pero se mantiene el mismo 60/25/10/5 como límite visual.

`Color/RojoMarca/600` y `Error` no son intercambiables. El primero da energía y jerarquía visual; el
segundo comunica fallos, rechazos, anulaciones o peligro. Nunca utilizar rojo institucional para
disfrazar una acción destructiva ni rojo de error como decoración.

### 3.3 Colores neutrales

| Variable Figma | Valor |
|---|---|
| `Color/Neutral/950` | `#101828` |
| `Color/Neutral/800` | `#344054` |
| `Color/Neutral/600` | `#475467` |
| `Color/Neutral/500` | `#667085` |
| `Color/Neutral/400` | `#98A2B3` |
| `Color/Neutral/300` | `#D0D5DD` |
| `Color/Neutral/200` | `#EAECF0` |
| `Color/Neutral/100` | `#F2F4F7` |
| `Color/Neutral/050` | `#F8FAFC` |
| `Color/Blanco` | `#FFFFFF` |

### 3.4 Colores semánticos

| Variable | Fuerte | Fondo suave | Borde suave |
|---|---|---|---|
| `Exito` | `#027A48` | `#ECFDF3` | `#ABEFC6` |
| `Advertencia` | `#B54708` | `#FFFAEB` | `#FEDF89` |
| `Error` | `#B42318` | `#FEF3F2` | `#FECDCA` |
| `Informacion` | `#175CD3` | `#EFF8FF` | `#B2DDFF` |

### 3.5 Espaciado

| Variable | Valor |
|---|---:|
| `Espacio/01` | 4 px |
| `Espacio/02` | 8 px |
| `Espacio/03` | 12 px |
| `Espacio/04` | 16 px |
| `Espacio/05` | 20 px |
| `Espacio/06` | 24 px |
| `Espacio/08` | 32 px |
| `Espacio/10` | 40 px |
| `Espacio/12` | 48 px |
| `Espacio/16` | 64 px |
| `Espacio/20` | 80 px |
| `Espacio/24` | 96 px |

No crear valores nuevos si uno existente resuelve la separación con una diferencia mínima.

### 3.6 Radios

| Variable | Valor | Uso |
|---|---:|---|
| `Radio/XS` | 4 px | Elementos internos pequeños |
| `Radio/SM` | 6 px | Badge rectangular y control compacto |
| `Radio/MD` | 8 px | Botón, input y selector |
| `Radio/LG` | 12 px | Tarjeta |
| `Radio/XL` | 16 px | Modal y panel destacado |
| `Radio/Completo` | 999 px | Badge, avatar y chip |

### 3.7 Sombras

| Variable | Valor | Uso |
|---|---|---|
| `Sombra/XS` | `0 1px 2px rgba(16,24,40,0.06)` | Campo o tarjeta básica |
| `Sombra/SM` | `0 2px 8px rgba(16,24,40,0.08)` | Tarjeta elevada |
| `Sombra/MD` | `0 8px 24px rgba(16,24,40,0.12)` | Menú y panel flotante |
| `Sombra/LG` | `0 20px 40px rgba(16,24,40,0.18)` | Modal |

### 3.8 Capas

| Capa | Valor conceptual |
|---|---:|
| Contenido normal | 0 |
| Encabezado fijo | 100 |
| Menú desplegable | 300 |
| Fondo de modal | 500 |
| Modal | 600 |
| Toast | 700 |
| Tooltip | 800 |

## 4. Tipografía de componentes

| Estilo Figma | Familia | Tamaño/alto | Peso | Uso |
|---|---|---:|---:|---|
| `Texto/Display` | Merriweather | 48/56 px | 700 | Hero público |
| `Texto/H1` | Inter | 40/48 px | 700 | Título de pantalla |
| `Texto/H2` | Inter | 32/40 px | 700 | Sección principal |
| `Texto/H3` | Inter | 24/32 px | 700 | Tarjeta o módulo |
| `Texto/H4` | Inter | 20/28 px | 600 | Subsección y modal |
| `Texto/CuerpoLG` | Inter | 18/28 px | 400 | Introducción |
| `Texto/CuerpoMD` | Inter | 16/24 px | 400 | Contenido normal |
| `Texto/CuerpoSM` | Inter | 14/20 px | 400 | Ayuda y tabla |
| `Texto/EtiquetaMD` | Inter | 14/20 px | 600 | Label y botón |
| `Texto/EtiquetaSM` | Inter | 12/16 px | 600 | Badge y metadato |
| `Texto/NumeroLG` | Inter | 32/40 px | 700 | Indicador de dashboard |

No utilizar más de tres pesos tipográficos visibles en una misma pantalla.

## 5. Botones

### 5.1 Anatomía

```text
[Icono opcional] [Texto] [Indicador opcional]
```

- El texto es obligatorio salvo en botones exclusivamente icónicos.
- Separación entre icono y texto: 8 px.
- Icono: 20 px en tamaño regular; 16 px en compacto.
- Radio: 8 px.
- Alineación: centrada.

### 5.2 Tamaños

| Tamaño | Alto | Padding horizontal | Texto | Uso |
|---|---:|---:|---|---|
| Compacto | 36 px | 12 px | 14/20 px | Tablas administrativas |
| Regular | 44 px | 16 px | 14/20 px | Uso general |
| Grande | 48 px | 20 px | 16/24 px | Registro, matrícula y acciones principales |

El botón compacto mantiene un área táctil envolvente de 44 px cuando se utiliza en móvil.

### 5.3 Variantes

#### Primario

- Fondo: `#103860`.
- Texto e icono: blanco.
- Hover: `#164A73`.
- Presionado: oscurecer a `#0B2C4C`.
- Focus: anillo exterior de 3 px `#A6F4F4` con separación de 2 px.

#### Secundario

- Fondo: blanco.
- Borde: 1 px `#103860`.
- Texto e icono: `#103860`.
- Hover: `#F0FFFF`.
- Presionado: `#D9FAFA`.

#### Acento

- Fondo: `#006F73`.
- Texto: blanco.
- Hover: `#005C60`.
- No utilizar `#00D8D8` con texto blanco.

#### Texto

- Fondo y borde transparentes.
- Texto: `#1F5F8B`.
- Hover: fondo `#F0FFFF`.
- Debe conservar un área de interacción suficiente.

#### Destructivo

- Fondo: `#B42318`.
- Texto: blanco.
- Hover: `#912018`.
- Utilizar solo para cancelar, anular o eliminar una configuración autorizada.

### 5.4 Estados

- `Normal`.
- `Hover`.
- `Focus`.
- `Presionado`.
- `Cargando`: spinner de 18 px, texto opcional “Procesando…”, mismo ancho.
- `Deshabilitado`: fondo `#EAECF0`, texto `#98A2B3`, sin sombra.

Un botón cargando no permite un segundo clic. Un botón deshabilitado debe tener explicación cercana
cuando el motivo no sea evidente.

### 5.5 Nombre en Figma

```text
Boton
Propiedad Tipo: Primario | Secundario | Acento | Texto | Destructivo
Propiedad Tamano: Compacto | Regular | Grande
Propiedad Estado: Normal | Hover | Focus | Presionado | Cargando | Deshabilitado
Propiedad Icono: Ninguno | Inicio | Final
Propiedad Ancho: Contenido | Completo
```

## 6. Botón de icono

- Área: 44 × 44 px.
- Icono: 20 px.
- Radio: 8 px o completo si es avatar/acción circular.
- Fondo normal: transparente.
- Hover: `#F2F4F7`.
- Focus: anillo de 3 px.
- Tooltip obligatorio en escritorio.
- Nombre accesible obligatorio.

No utilizar un icono de papelera sin etiqueta o confirmación en una acción destructiva.

## 7. Enlaces

- Color: `#1F5F8B`.
- Subrayado en hover y focus; conservar subrayado permanente dentro de párrafos extensos.
- Focus visible.
- Los enlaces externos pueden mostrar icono de salida.
- Los enlaces no deben parecer botones si no ejecutan una acción equivalente.

## 8. Campos de entrada

### 8.1 Anatomía

```text
Etiqueta                     Opcional
┌──────────────────────────────────┐
│ Icono  Valor o placeholder   Acción │
└──────────────────────────────────┘
Texto de ayuda o mensaje de error
```

### 8.2 Especificación regular

| Parte | Valor |
|---|---|
| Alto | 48 px |
| Padding horizontal | 14 px |
| Separación interna | 8 px |
| Radio | 8 px |
| Borde | 1 px `#D0D5DD` |
| Fondo | `#FFFFFF` |
| Texto | Inter 16/24, `#101828` |
| Placeholder | Inter 16/24, `#667085` |
| Etiqueta | Inter 14/20, peso 600, `#344054` |
| Ayuda | Inter 14/20, `#475467` |
| Icono | 20 px, `#667085` |

En administración puede utilizarse una altura compacta de 44 px en filtros y tablas. Los
formularios públicos, checkout y perfil usan 48 px.

### 8.3 Estados

| Estado | Borde | Fondo | Complemento |
|---|---|---|---|
| Normal | `#D0D5DD` | Blanco | — |
| Hover | `#98A2B3` | Blanco | — |
| Focus | `#006F73` | Blanco | Anillo 3 px `#D9FAFA` |
| Con valor | `#D0D5DD` | Blanco | Texto oscuro |
| Error | `#B42318` | Blanco | Mensaje e icono de error |
| Éxito validado | `#027A48` | Blanco | Solo cuando aporta confirmación |
| Deshabilitado | `#EAECF0` | `#F2F4F7` | Texto `#98A2B3` |
| Solo lectura | `#D0D5DD` | `#F8FAFC` | Texto seleccionable |
| Cargando | `#D0D5DD` | Blanco | Spinner final |

El correo del perfil utiliza `Solo lectura`, no `Deshabilitado`, para permitir copiarlo y explicar
que no se modifica desde esa sección.

### 8.4 Campo obligatorio y opcional

- Mostrar “Opcional” junto a la etiqueta cuando el campo lo sea.
- En formularios donde casi todo es obligatorio, puede mostrarse “* Obligatorio” de forma global.
- No depender solo de un asterisco rojo.
- El teléfono en registro y creación administrativa debe identificarse como opcional.

### 8.5 Nombre en Figma

```text
Campo/Texto
Propiedad Tamano: Regular | Compacto
Propiedad Estado: Normal | Hover | Focus | Error | Deshabilitado | SoloLectura | Cargando
Propiedad Contenido: Vacio | ConValor
Propiedad IconoInicio: Si | No
Propiedad AccionFinal: Ninguna | Limpiar | MostrarClave | Calendario
```

## 9. Variantes de campos

### 9.1 Contraseña

- Acción mostrar/ocultar al final.
- No cambiar el valor al alternar visibilidad.
- Lista de condiciones debajo durante creación o cambio.
- Las cuatro condiciones visibles son: mínimo ocho caracteres, una mayúscula, una minúscula y un
  número. No se exige símbolo.
- Indicadores de condición con texto e icono.
- No comunicar seguridad mediante una barra de color sin explicación.

### 9.2 Búsqueda

- Icono de lupa inicial.
- Acción para limpiar cuando existe texto.
- En catálogo: 48 px de alto.
- En tablas: 44 px.
- El resultado se actualiza al confirmar o con espera breve; no dispara una solicitud por cada
  tecla sin control.

### 9.3 Área de texto

- Alto mínimo: 120 px.
- Padding: 14 px.
- Redimensionable verticalmente en escritorio.
- Contador visible solo cuando exista límite.
- Para respuesta abierta o reclamación, conservar saltos de línea.

### 9.4 Número, precio y porcentaje

- Alinear números a la derecha en tablas y a la izquierda en formularios.
- Mostrar unidad fuera del valor editable: `S/`, `%`, horas o días.
- Respetar rangos definidos por la historia.
- No alterar silenciosamente un valor inválido; explicar el rango permitido.

### 9.5 Fecha y hora

- Campo de fecha con icono y selector accesible.
- Mostrar formato natural en lectura y formato inequívoco al editar.
- Indicar que las horas corresponden a Lima cuando pueda existir duda.
- Hora de inicio y fin deben poder compararse visualmente.

### 9.6 Selector simple

- Alto: 48 px público y 44 px administrativo compacto.
- Flecha final de 20 px.
- Menú máximo de 320 px de alto antes de desplazarse.
- Opción seleccionada con check y fondo `#F0FFFF`.
- Si las opciones superan aproximadamente diez valores, usar combobox con búsqueda.

### 9.7 Combobox

- Integra búsqueda, opciones, estado vacío y selección.
- Mantener visible el valor seleccionado.
- Para selección múltiple, mostrar chips y resumen “+N” si no caben.
- No utilizar selección múltiple para decisiones que el negocio define como únicas.

### 9.8 Checkbox

- Control visual: 20 × 20 px.
- Radio: 4 px.
- Área interactiva mínima: 44 px de alto.
- Seleccionado: fondo `#103860`, check blanco.
- Indeterminado: línea blanca.
- Focus: anillo turquesa suave.
- Etiqueta clicable.

### 9.9 Radio

- Control visual: 20 × 20 px.
- Punto interior: 8 px.
- Separación entre opciones: 12 px vertical o 24 px horizontal.
- Utilizar cuando solo una opción puede elegirse.

### 9.10 Interruptor

- Tamaño: 44 × 24 px.
- Círculo: 20 px.
- Apagado: `#D0D5DD`.
- Encendido: `#006F73`.
- Siempre acompañado de etiqueta y explicación cuando cambie una regla importante.
- No utilizar para acciones irreversibles.

## 10. Carga de archivos e imágenes

### 10.1 Zona de carga

- Borde discontinuo de 1 px `#98A2B3`.
- Radio: 12 px.
- Padding: 24 px.
- Icono de 24 px.
- Texto de acción y formatos o límites permitidos.
- Soportar selección mediante botón; arrastrar y soltar es adicional.
- Focus y navegación por teclado obligatorios.

### 10.2 Archivo cargado

Mostrar:

- nombre;
- tipo;
- tamaño;
- progreso de carga;
- estado correcto o fallido;
- acción reintentar;
- acción retirar cuando esté permitido.

### 10.3 Imagen de curso

- Previsualización `16:9`.
- Herramienta para reemplazar.
- Validación de formato y tamaño.
- Mantener una portada por defecto claramente identificada.
- La portada por defecto no se presenta como lección de vista previa.

### 10.4 Imágenes de reclamación

- Cuadrícula de miniaturas.
- Mostrar límite de 5 MB por imagen.
- Permitir retirar antes de enviar.
- Una imagen fallida no debe borrar los demás datos del formulario.

## 11. Formularios

### 11.1 Ancho y composición

- Formulario de acceso: máximo 480 px.
- Formulario administrativo medio: máximo 720 px.
- Formulario extenso: máximo 960 px y dividido por secciones.
- Dos columnas solo cuando los datos son cortos y relacionados.
- En móvil todos los campos pasan a una columna.
- Mostrar primero los campos frecuentes. Los campos que dependen de modalidad, estado o respuesta
  previa aparecen únicamente cuando aplican.
- Las secciones avanzadas comienzan cerradas si el usuario puede completar la tarea común sin ellas.

### 11.2 Acciones

- Acción principal a la derecha en escritorio y ancho completo en móvil.
- Acción secundaria antes de la principal.
- En formularios extensos, mantener acciones visibles al final de la sección o en barra fija que
  no cubra contenido.
- No habilitar doble envío.

### 11.3 Validación

- Validar formato al salir del campo cuando sea útil.
- Validar el conjunto al enviar.
- Llevar el foco al primer error.
- Mostrar resumen superior si existen varios errores.
- Conservar los valores válidos.
- El mensaje indica qué ocurrió y cómo corregirlo.

## 12. Navegación principal

### 12.1 Encabezado público

| Propiedad | Escritorio | Móvil |
|---|---:|---:|
| Alto | 72 px | 64 px |
| Fondo | Blanco | Blanco |
| Borde inferior | 1 px `#EAECF0` | Igual |
| Logo | Hasta 172 × 44 px | Hasta 136 × 36 px |
| Contenido | Máximo 1200 px | Margen 16 px |

- Logo a la izquierda.
- Navegación al centro o después del logo.
- Acciones de sesión a la derecha.
- En móvil, menú de 44 px y panel lateral.
- Puede volverse fijo al desplazarse, sin ocultar el título de destino.

### 12.2 Navegación del alumno

- Encabezado de 64 px.
- Logo, Mis cursos, Mis certificados y perfil.
- Indicador de sección activa con texto y línea turquesa.
- El aviso de cambio de contraseña se coloca debajo del encabezado, no dentro de un menú oculto.

### 12.3 Barra lateral administrativa

- Ancho abierto: 264 px.
- Ancho colapsado: 72 px.
- Fondo: `#103860`.
- Texto: blanco o blanco con opacidad suficiente.
- Elemento activo: fondo blanco al 12 % y línea turquesa de 3 px.
- Grupos: Inicio, Cursos, Matrículas y pagos, Académico, Certificados, Reclamaciones, Reportes y
  Configuración.
- En móvil funciona como panel temporal con fondo superpuesto.

### 12.4 Breadcrumb

- Alto visual: 20 px.
- Texto: 14/20 px.
- Separador de 16 px.
- Último nivel sin enlace y con contraste principal.
- Utilizar en edición de curso, operación de certificado y detalle de reclamación.

## 13. Pestañas, acordeones y pasos

### 13.1 Pestañas

- Alto: 44 px.
- Texto: 14/20 px, peso 600.
- Activa: texto `#103860` y línea inferior turquesa de 3 px.
- Inactiva: `#475467`.
- Focus independiente.
- Si no caben en móvil, desplazamiento horizontal con indicación visual; no reducir texto.
- Solo el contenido de la pestaña activa permanece visible.
- Una pestaña no ejecuta acciones ni actúa como filtro múltiple; únicamente cambia de sección.
- Cuando haya muchas pestañas en móvil, mostrar el nombre de la sección actual y un selector de
  secciones, evitando una fila interminable.

Usos principales:

- perfil;
- editor del curso;
- información base;
- centro de reportes.

### 13.2 Acordeón

- Encabezado mínimo de 52 px.
- Chevron de 20 px.
- Título y metadatos separados.
- Área completa clicable.
- Estado abierto con borde o fondo suave.
- Conservar el estado cuando el usuario vuelve desde una lección si aporta continuidad.

### 13.3 Indicador de pasos

Utilizar solo cuando exista una secuencia real, por ejemplo publicación de curso o checkout.

- Paso: círculo de 28 px más texto.
- Completado: check y color éxito o marca.
- Actual: azul oscuro con contraste.
- Pendiente: borde neutro.
- Error: indicador rojo y texto.
- En móvil mostrar paso actual y cantidad total.

## 14. Tarjetas

### 14.1 Base

- Fondo: blanco.
- Borde: 1 px `#EAECF0`.
- Radio: 12 px.
- Sombra: `Sombra/XS`; `Sombra/SM` en hover cuando sea interactiva.
- Padding habitual: 20–24 px.
- Focus: anillo de 3 px.
- La tarjeta completa solo es clicable si no contiene acciones internas contradictorias.

### 14.2 Tarjeta de catálogo

| Parte | Especificación |
|---|---|
| Ancho | Flexible; objetivo 368–384 px en escritorio |
| Imagen | `16:9`, ancho completo, esquinas superiores de 12 px |
| Contenido | 20 px |
| Modalidad | Badge sobre imagen o primer elemento del contenido |
| Tipo/categoría | 12/16 px, color secundario |
| Título | 20/28 px, peso 650–700, máximo tres líneas |
| Docente | 14/20 px |
| Fecha/estado | 14/20 px con icono opcional |
| Precio | 20/28 px, peso 700 |
| Acción | Botón regular o enlace claramente visible |

Estados: normal, destacado, inmediato, próximo, en progreso, cerrado y sin cupos.

- Mostrar como máximo dos badges simultáneos: modalidad y el estado comercial más importante. El
  tipo o categoría permanece como texto secundario para no convertir la tarjeta en una colección
  de etiquetas.
- No repetir modalidad, estado o fecha en dos zonas de la misma tarjeta.

Color contextual por modalidad:

- `Virtual`: badge y detalle turquesa;
- `En vivo`: badge coral con texto azul oscuro;
- `Híbrido`: badge violeta;
- la modalidad se escribe siempre; el color no la sustituye.

### 14.3 Tarjeta de “Mis cursos”

- Imagen `16:9` o miniatura horizontal.
- Título hasta tres líneas.
- Estado de acceso.
- Barra de progreso con porcentaje.
- Resumen de certificación solo cuando exista información.
- Una sola acción dominante según estado: “Continuar”, “Ver certificado” o “Ver temario”.
- Si no existe acceso, explicar el motivo y no mostrar una acción falsa.

### 14.4 Tarjeta de certificado

- Icono o miniatura del documento.
- Curso y nivel.
- Código y fecha.
- Badge `Vigente` o `Anulado`.
- Acción “Ver certificado”.
- Para anulado, descarga según regla aplicable y explicación visible.

### 14.5 Tarjeta de indicador

- Padding: 20–24 px.
- Etiqueta: 14/20 px.
- Valor: 32/40 px.
- Comparación solo si existe un periodo comparable real.
- Icono de 24 px opcional.
- No convertirla en una tarea pendiente.

## 15. Badges y chips

### Badge

- Alto: 24 px.
- Padding: 4 px vertical y 8 px horizontal.
- Radio completo.
- Texto: 12/16 px, peso 600.
- Icono opcional: 12–14 px.
- Siempre contiene una palabra o frase breve.

### Chip de filtro

- Alto: 32 px.
- Padding horizontal: 12 px.
- Se utiliza únicamente para **resumir un filtro ya aplicado**, por ejemplo “Categoría: Derecho
  registral ×”; no reemplaza al selector donde se elige el valor.
- Incluye una acción clara para retirar ese filtro.
- Seleccionado: fondo `#D9FAFA`, texto `#103860`.
- No utilizar más de una línea.
- Nunca representar una selección mediante una etiqueta visual sin comportamiento interactivo.
  Todo elemento accionable debe tener estados normal, foco, activo y deshabilitado reconocibles.
- En el catálogo, los controles principales son los selectores de Tipo y Categoría. En “Mis
  cursos” se utilizan pestañas En progreso/Completados, no chips de filtro.

## 16. Alertas y notificaciones visuales

### 16.1 Alerta en contenido

- Fondo y borde según estado semántico.
- Radio: 8 px.
- Padding: 16 px.
- Icono: 20 px.
- Título: 14/20 px, peso 600.
- Descripción: 14/20 px.
- Acción opcional alineada al contenido.

Variantes: información, éxito, advertencia y error.

### 16.2 Toast

- Ancho de escritorio: 360–420 px.
- Ancho móvil: `calc(100% - 32 px)`.
- Padding: 16 px.
- Radio: 12 px.
- Sombra: `Sombra/MD`.
- Posición: esquina superior derecha en escritorio; parte superior con margen en móvil.
- Confirmación simple: 5 segundos aproximados.
- Error que requiere acción: permanece hasta cerrar o resolver.
- Máximo tres visibles; los demás se agrupan.

Un toast nunca es el único lugar donde se muestra un código, comprobante o plazo que el usuario
necesita conservar.

### 16.3 Aviso persistente de contraseña

- Ubicación: debajo del encabezado en todas las pantallas autenticadas mientras siga pendiente.
- Variante: advertencia.
- Texto breve y acción “Cambiar contraseña”.
- No puede cerrarse definitivamente sin realizar el cambio.
- No muestra la contraseña temporal en pantalla.

## 17. Modales

### 17.1 Anatomía

```text
Fondo superpuesto
┌─────────────────────────────────────┐
│ Icono opcional   Título       Cerrar │
│ Descripción                         │
├─────────────────────────────────────┤
│ Contenido                            │
├─────────────────────────────────────┤
│ Acción secundaria  Acción principal │
└─────────────────────────────────────┘
```

### 17.2 Tamaños

| Tamaño | Ancho máximo | Uso |
|---|---:|---|
| Pequeño | 400 px | Confirmación breve |
| Mediano | 560 px | Formulario o decisión común |
| Grande | 720 px | Comparación o detalle estructurado |
| Extra grande | 960 px | Vista compleja excepcional |

- Margen móvil: 16 px.
- Alto máximo: `calc(100vh - 48 px)`.
- Contenido interno desplazable; encabezado y acciones permanecen visibles si es extenso.
- Fondo superpuesto: `rgba(16,24,40,0.60)`.
- Radio: 16 px.
- Sombra: `Sombra/LG`.
- Padding: 24 px; móvil 20 px.

### 17.3 Acciones

- Escritorio: secundaria a la izquierda de la principal dentro del grupo de acciones.
- Móvil: botones apilados, principal primero visualmente.
- Un modal destructivo nunca usa “Aceptar”; indica la acción: “Cancelar curso” o “Anular
  certificado”.
- Deshabilitar confirmación hasta completar el motivo cuando sea obligatorio.

### 17.4 Comportamiento

- Escape cierra solo cuando no exista riesgo de perder una operación crítica.
- Clic fuera no cierra un modal destructivo ni un formulario con cambios.
- El foco comienza en el título o primer control útil.
- El foco no sale del modal.
- Al cerrar, vuelve a la acción que lo abrió.

### 17.5 Cuándo no usar modal

No utilizar un modal para:

- editor completo del curso;
- examen;
- libro de reclamaciones;
- respuesta extensa de reclamación;
- configuración extensa de preguntas;
- visor del certificado.

### 17.6 Modal de cancelación completa del curso

Tamaño grande. Debe mostrar:

1. nombre del curso;
2. campo obligatorio de motivo;
3. resumen de alumnos y situación conocida;
4. advertencia de que se bloquean nuevas ventas y nuevos accesos;
5. aviso de que no se publicará contenido nuevo;
6. explicación de que alumnos previamente habilitados conservan contenido ya disponible, excepto
   enlaces de reuniones futuras;
7. aviso de que no se genera devolución automática;
8. checkbox de confirmación consciente;
9. botón destructivo “Cancelar curso”.

Después de confirmar, PF-013 muestra badge `Cancelado`, motivo resumido y acceso al historial.

### 17.7 Modal de emisión del certificado

Tamaño mediano. Debe mostrar:

- datos que aparecerán en el certificado;
- requisitos cumplidos;
- nivel calculado;
- advertencia de que no podrán realizarse nuevos intentos calificables después de emitir;
- acción “Emitir certificado”.

### 17.8 Modal de entrega de examen

- Preguntas respondidas, pendientes y marcadas.
- Aviso de consumo del intento.
- Acción secundaria “Seguir revisando”.
- Acción primaria “Entregar examen”.

## 18. Diálogos no modales y panel lateral

Un panel lateral se utiliza para creación breve o consulta sin perder el listado.

- Ancho: 480 px escritorio, máximo 40 % de la ventana.
- Móvil: ocupa toda la pantalla.
- Fondo: blanco.
- Sombra: `Sombra/LG`.
- Encabezado y acciones fijas.
- Permite consultar el elemento anterior al cerrar.
- No abrir un segundo panel encima del primero. Una acción compleja conduce a una vista dedicada o
  reemplaza el contenido del panel conservando una acción clara para volver.

Usos recomendados:

- crear una cuenta administrativa;
- consultar detalle de matrícula o pago;
- aplicar filtros móviles;
- ver información breve de una sesión.

## 19. Tablas

### 19.1 Anatomía

- Barra de título y acción.
- Filtros y búsqueda.
- Resumen opcional.
- Encabezado.
- Filas.
- Estado vacío o carga.
- Paginación.

### 19.2 Medidas

| Parte | Valor |
|---|---:|
| Encabezado | 44 px |
| Fila compacta | 52 px |
| Fila regular | 60 px |
| Padding horizontal de celda | 16 px |
| Texto | 14/20 px |
| Borde | 1 px `#EAECF0` |

- Encabezados alineados según el contenido.
- Texto a la izquierda; números comparables a la derecha.
- Primera columna puede permanecer fija en tablas muy anchas.
- Acciones al final mediante menú si son más de dos.
- Selección múltiple solo si existe una operación válida sobre varios elementos.

### 19.3 Estados

- Hover: `#F8FAFC`.
- Seleccionada: `#F0FFFF` con indicador turquesa.
- Error: no colorear toda la fila de rojo intenso; usar badge y fondo suave.
- Cargando: skeleton de filas.
- Vacía: mensaje, explicación y acción pertinente.
- Sin resultados: conservar filtros y ofrecer limpiarlos.

### 19.4 Móvil

- Priorizar dos o tres datos esenciales.
- Convertir cada fila en tarjeta cuando la lectura horizontal sea inviable.
- Mantener acciones visibles.
- Permitir desplazamiento horizontal únicamente cuando comparar columnas sea esencial.

## 20. Paginación

- Altura mínima de controles: 40–44 px.
- Mostrar anterior, siguiente y página actual.
- En escritorio puede mostrar páginas cercanas.
- En móvil mostrar “Página X de Y”.
- Conservar búsqueda y filtros al cambiar de página.
- Volver al inicio del listado después del cambio.

## 21. Menús desplegables y tooltips

### Menú

- Ancho mínimo: 200 px.
- Padding exterior: 6–8 px.
- Opción: 40 px de alto.
- Radio: 8 px.
- Sombra: `Sombra/MD`.
- Separador para acciones destructivas.
- Navegación con flechas y Escape.

### Tooltip

- Solo para información breve.
- Máximo aproximado: 240 px.
- Texto: 12/16 px.
- Fondo: `#101828`, texto blanco.
- Aparece con hover y focus.
- No contiene acciones indispensables.

## 22. Estados vacíos, carga y error de página

### Vacío

- Icono o ilustración simple de hasta 96 px.
- Título breve.
- Explicación de una o dos líneas.
- Acción solo cuando exista un siguiente paso real.

Ejemplos diferentes:

- todavía no tiene cursos;
- no hay respuestas abiertas pendientes;
- no existen resultados para los filtros;
- aún no tiene certificados.

### Skeleton

- Imita la estructura del contenido.
- Fondo neutro; animación suave opcional.
- No mostrar skeleton más spinner simultáneamente en el mismo bloque.
- Respetar reducción de movimiento.

### Error de página

- Explicación comprensible.
- Acción reintentar.
- Navegación alternativa segura.
- Código técnico solo como referencia secundaria cuando ayude a soporte.

## 23. Progreso y requisitos

### Barra de progreso

- Alto: 8 px; 12 px en resumen destacado.
- Pista: `#EAECF0`.
- Progreso: `#00D8D8`.
- Radio completo.
- Porcentaje visible como texto.
- Animación máxima: 250 ms.

### Lista de requisitos

Cada requisito presenta:

- nombre;
- valor actual;
- meta cuando aplique;
- estado textual;
- icono;
- acción para continuar si existe.

Un curso puede no exigir examen, asistencia o progreso para certificar. En ese caso el componente
no lo presenta como pendiente. El progreso puede seguir visible como información académica.

Mapa de acentos académicos:

| Contexto | Acento | Fondo suave |
|---|---|---|
| Progreso y lecciones | `#00D8D8` | `#F0FFFF` |
| Sesiones y calendario | `#026AA2` | `#F0F9FF` |
| Exámenes | `#6941C6` | `#F4F3FF` |
| Certificación | `#F4B740` | `#FFF8E1` |
| Modalidad En vivo | `#FF8A7A` | `#FFF1EF` |

Estos colores ayudan a orientarse, pero aprobado, pendiente, rechazado y anulado conservan siempre
su color semántico.

## 24. Reglas visuales según modalidad

### Virtual

- Mostrar “Inicio inmediato” o fecha de inicio configurada.
- No exigir ni mostrar un campo obligatorio de fecha de fin.
- No mostrar la opción de asistencia en la configuración del curso.
- No mostrar calendario de sesiones si el curso no tiene actividades en vivo aplicables.
- El acceso permanece mientras administración no cambie el curso o la matrícula.

### En vivo

- Mostrar inicio, fin, calendario y sesiones.
- Mostrar asistencia aunque no sea requisito de certificación.
- Mostrar grabación disponible o pendiente después de cada sesión.

### Híbrido

- Combinar ruta virtual y sesiones.
- Diferenciar claramente contenido asincrónico y actividades con horario.
- Mostrar asistencia de sesiones elegibles.

### Requisitos opcionales

- Examen, asistencia y progreso aparecen como requisitos solo si administración los activó.
- El editor no debe aparentar que todos son obligatorios.
- Los valores iniciales pueden venir seleccionados según las reglas, pero administración puede
  desactivarlos donde esté permitido.
- Si existen varios exámenes bloqueantes, la interfaz muestra que todos deben cumplirse.

## 25. Componentes del aula

### 25.1 Ruta del curso

- Panel de 320 px en escritorio.
- Módulos como acordeones.
- Lección de al menos 48 px de alto.
- Estado: bloqueada, disponible, actual o completada.
- Check de 20 px.
- Duración cuando exista.
- En móvil abre como panel deslizable de pantalla completa.

### 25.2 Reproductor de lección

- Proporción principal `16:9`.
- Fondo negro o azul muy oscuro.
- Controles con contraste.
- Indicador de avance disponible cuando la fuente permita medirlo.
- Aviso visible si debe alcanzarse un porcentaje para completar.
- No permitir que un check manual sustituya la visualización detectable requerida.

### 25.3 Material

Fila de 56–64 px con:

- icono de tipo;
- nombre;
- formato y tamaño cuando se conozcan;
- acción abrir;
- acción descargar solo si fue permitida.

### 25.4 Navegación de lección

- “Anterior” secundario.
- “Siguiente” primario o acento.
- En la última lección la acción se denomina “Completar lección”; no se muestra “Siguiente” sin
  destino.
- En una lección manual, check y “Siguiente” completan la lección de manera equivalente.
- El check automático es de solo lectura; el manual es accionable solo mientras está pendiente.
  Ningún check completado puede desmarcarse.
- En una lección con video detectable, la acción explica por qué aún no se completa si falta el
  umbral.

## 26. Sesiones y calendario

### Calendario

- Vista mensual con días de 44 px como mínimo.
- Sesión marcada con punto y texto disponible al seleccionar.
- Día actual con borde; día seleccionado con fondo turquesa suave.
- Alternativa en lista obligatoria para móvil y accesibilidad.
- Mes y Lista son vistas alternas; nunca se muestran completas al mismo tiempo.
- Seleccionar una sesión abre su detalle sin insertar toda la información dentro de la celda del
  calendario.

### Tarjeta o detalle de sesión

- Título.
- Fecha y horario de Lima.
- Estado.
- La tarjeta siempre permanece visible. Fuera de la ventana muestra el botón deshabilitado y nunca
  expone el enlace real; entre inicio y fin en `America/Lima` habilita “Ingresar a la sesión”.
- Asistencia.
- Grabación disponible o pendiente.
- Datos anteriores y nuevos si fue reprogramada.

Una sesión cancelada no se presenta como pendiente de asistencia.

## 27. Exámenes

### 27.1 Encabezado

- Título y número de intento.
- Temporizador con dígitos tabulares.
- Advertencia visual al acercarse al final sin utilizar parpadeos.
- Acción “Entregar examen”.
- En móvil permanece fijo sin cubrir la pregunta.

### 27.2 Navegador de preguntas

- Botones de 36 px dentro de un área interactiva de 44 px.
- Estados: actual, respondida, pendiente y marcada.
- Leyenda textual visible.
- Escritorio: panel lateral.
- Móvil: panel desplegable.

### 27.3 Pregunta

- Número y puntaje máximo.
- Enunciado con ancho de lectura controlado.
- Alternativas con área completa seleccionable.
- Checkbox para selección múltiple y radio para única.
- Verdadero/falso como dos opciones claras.
- Respuesta abierta como área de texto amplia.
- Acción “Marcar para revisar”.

### 27.4 Resultado

- Nota sobre veinte con hasta dos decimales.
- Badge aprobado o desaprobado.
- Mejor nota.
- Intentos consumidos y disponibles.
- Acción de reintento solo si está permitido.
- Respuestas correctas según política configurada.
- Respuesta abierta pendiente con fecha máxima de revisión.

Después de emitirse el certificado no se muestra una acción para iniciar otro intento calificable.

## 28. Contenido reordenable

### Módulo

- Tarjeta o acordeón con asa de arrastre de 20 px.
- Nombre, cantidad de lecciones y acciones.
- Estado durante arrastre con sombra y borde turquesa.
- Zona de destino visible.
- Acciones accesibles “Subir” y “Bajar” como alternativa al arrastre.

### Lección

- Fila de 52–60 px.
- Asa, tipo, título, duración disponible, vista previa y menú.
- Estado incompleto o con advertencia editorial sin bloquear.
- Copia de módulo identificada como independiente después de completar la acción.

## 29. Pago y matrícula

### 29.1 Resumen comercial

- Nombre del curso.
- Modalidad.
- Precio vigente.
- Precio anterior tachado solo con promoción vigente.
- Moneda.
- Disponibilidad.
- Beneficios esenciales.

### 29.2 Checkout

- Dos columnas en escritorio: pago y resumen.
- Una columna en móvil; resumen antes de confirmar.
- Botón cargando durante la comunicación con Culqi.
- No mostrar contador de reserva ni afirmar que el cupo está separado.
- No almacenar ni representar campos bancarios como si ESEJUR procesara el pago.

### 29.3 Resultados

#### Aprobado

- Icono y título de éxito.
- Matrícula confirmada.
- Comprobante informativo.
- Acción “Ir a Mis cursos”.

#### Pendiente

- Advertencia neutral.
- Explicación de que el acceso aún no está activo.
- Acción de consulta o retorno segura.
- No mostrar un plazo inventado por ESEJUR.

#### Rechazado o error

- Explicación de que Culqi no aprobó el pago o comunicó un error.
- Acción para reintentar cuando corresponda.
- Mantener la misma intención de matrícula.

### 29.4 Comprobante informativo

Bloque de lectura con:

- orden;
- importe y moneda;
- medio;
- fecha y hora;
- alumno;
- curso;
- últimos dígitos de tarjeta cuando correspondan.

No denominarlo comprobante tributario ni documento SUNAT.

## 30. Certificación

### 30.1 Estado

Utilizar los textos naturales:

- “Aún debes completar requisitos”.
- “Completa tus datos”.
- “Tu certificado estará disponible el…”
- “Listo para emitir”.
- “Vigente”.
- “Anulado”.

No exponer códigos internos.

- Presentar primero el estado actual y una sola acción principal. Los requisitos se muestran como
  lista breve y el historial queda fuera del primer nivel.
- Los campos para confirmar nombres solo aparecen cuando faltan o cuando el alumno decide revisarlos
  antes de emitir.

### 30.2 Visor

- Fondo neutro.
- Documento centrado con sombra suave.
- Zoom y desplazamiento accesibles.
- Descarga como acción principal.
- Código y QR legibles.
- No mostrar certificados de otros alumnos.

### 30.3 Verificación pública

- Formulario de código máximo 560 px.
- Resultado en tarjeta.
- Mostrar solo datos mínimos autorizados.
- Diferenciar claramente vigente, anulado e inexistente.
- No ofrecer descarga del documento privado.

## 31. Quejas y reclamos

### Formulario público

Dividir visualmente en cuatro pasos, sin eliminar ningún dato:

1. **Persona:** identificación, contacto y dirección;
2. **Servicio:** producto o servicio e importe;
3. **Detalle y evidencias:** elección Queja/Reclamo, qué ocurrió, qué solicita e imágenes;
4. **Revisión:** resumen, declaración jurada y autorización de respuesta.

- Mostrar la diferencia entre Queja y Reclamo junto a la selección.
- Mostrar “Paso X de 4”; permitir volver sin perder información.
- Validar cada paso antes de continuar y reservar “Presentar” para el resumen final.
- Conservar datos ante un fallo recuperable.
- Antes de enviar, mostrar resumen.
- Después de enviar, mostrar correlativo y fecha máxima de respuesta de quince días hábiles.
- No mostrar enlace de seguimiento público porque no existe ese portal.

### Bandeja administrativa

- Orden inicial por fecha máxima más próxima.
- Badge próximo a vencer y vencido.
- Búsqueda por correlativo o datos permitidos.
- Respuesta enviada queda en modo lectura.
- Si falla el correo, mantener pendiente y ofrecer reintento.

## 32. Reportes

- Contenedor de ancho completo dentro de administración.
- Mostrar en primera línea únicamente rango, curso y el filtro más frecuente del reporte. Los demás
  se abren desde “Más filtros”.
- Botón aplicar cuando la consulta sea pesada; actualización inmediata controlada para filtros
  simples.
- Resumen de resultados.
- Tabla principal.
- Exportación secundaria cuando corresponda.
- Fecha y hora de la última consulta si aporta claridad.
- Solo una pestaña y una tabla se muestran a la vez. En móvil las cinco pestañas se convierten en
  selector de reporte.

Pestañas:

```text
Matrículas | Pagos | Académico | Certificados | Asistencia
```

El estado vacío distingue “no hay información” de “los filtros no encontraron resultados”.

## 33. Dashboard y gráficos

### Estructura

- No usa tarjetas de indicadores.
- Primera fila: evolución de matrículas a 2/3 y matrículas por curso a 1/3.
- Segunda fila: forma de ingreso y pagos confirmados por periodo, cada uno a 1/2.
- Mostrar exactamente esos cuatro gráficos; no agregar otros.
- No mostrar pendientes, tareas ni alertas operativas.

### Gráficos permitidos

- línea para matrículas por periodo;
- barras para comparar cursos;
- barras apiladas para modalidad o estado;
- dona únicamente para una distribución simple con pocas categorías.

### Colores

Secuencia recomendada:

```text
#103860, #00AEB5, #C83E4D, #6941C6, #026AA2, #F4B740, #FF8A7A
```

- Mostrar leyenda y valores mediante tooltip.
- No depender solo del color.
- Evitar gráficos 3D.
- El rojo institucional `#C83E4D` puede representar una serie ordinaria; el rojo de error `#B42318`
  y el verde semántico solo representan estados reales.
- No colocar en un mismo gráfico el rojo institucional y el rojo de error como dos series
  ordinarias, porque resultarían difíciles de distinguir.
- Cuando existan más series, reutilizar tonos neutrales antes de inventar nuevos colores.

## 34. Responsive por componente

| Componente | Escritorio | Móvil |
|---|---|---|
| Encabezado | Navegación visible | Menú lateral temporal |
| Filtros | Línea o lateral | Panel deslizable |
| Tarjetas | 3 columnas | 1 columna |
| Ficha | Contenido + resumen fijo | Una columna |
| Checkout | Pago + resumen | Una columna |
| Aula | Ruta + contenido | Ruta en panel |
| Examen | Navegador lateral | Navegador desplegable |
| Tabla | Columnas completas | Tarjetas o columnas prioritarias |
| Modal | Ancho fijo | Margen 16 px o pantalla completa |
| Acciones | Alineación final | Botones de ancho completo |
| Pestañas | Todas visibles | Desplazamiento horizontal |

Los cambios de composición no deben modificar reglas ni ocultar acciones necesarias.

## 35. Accesibilidad por componente

### Todos los componentes interactivos

- Focus visible.
- Nombre accesible.
- Estado anunciado.
- Orden de teclado lógico.
- Área táctil suficiente.
- Contraste mínimo.

### Formularios

- Etiqueta asociada.
- Error asociado.
- Ayuda asociada.
- Autocompletado apropiado para datos personales.
- No bloquear pegado en contraseña.

### Modales

- Título anunciado.
- Foco contenido.
- Cierre disponible cuando sea seguro.
- Retorno de foco.

### Tablas

- Encabezados identificados.
- Ordenamiento anunciado.
- Contenido alternativo para gráficos.

### Video y examen

- Controles operables por teclado.
- Indicadores no dependientes del color.
- Temporizador anunciado sin interrumpir constantemente.

## 36. Nombres y propiedades en Figma

### Estructura

```text
Componente/Subcomponente
```

Ejemplos:

```text
Boton/Primario
Campo/Texto
Campo/Selector
Navegacion/EncabezadoPublico
Navegacion/BarraAdmin
Tarjeta/CursoCatalogo
Tarjeta/CursoAlumno
Tarjeta/Certificado
Modal/Confirmacion
Modal/Destructivo
Tabla/Fila
Examen/PreguntaUnica
Examen/Navegador
Estado/Vacio
```

### Propiedades comunes

- `Estado`.
- `Tamano`.
- `Tipo`.
- `IconoInicio`.
- `IconoFinal`.
- `TextoAyuda`.
- `AnchoCompleto`.
- `Seleccionado`.
- `Deshabilitado`.

No utilizar nombres como `Frame 132`, `Botón copia 4` o `Nuevo componente`.

## 37. Relación de pantallas y componentes principales

| Pantallas | Componentes dominantes |
|---|---|
| PF-001–PF-002 | Encabezado público, buscador, filtros, tarjeta de curso, acordeón, resumen comercial |
| PF-003–PF-007 | Formulario, campos, contraseña, botones, estados de resultado |
| PF-008–PF-011 | Navegación, alerta persistente, perfil, tabla, panel lateral, lectura legal |
| PF-012–PF-015 | Barra administrativa, tablas, pestañas, formulario, contenido reordenable |
| PF-016–PF-018 | Resumen comercial, checkout, estados de pago y comprobante |
| PF-019–PF-022 | Tarjeta del alumno, aula, progreso, reproductor, materiales y calendario |
| PF-023–PF-024 | Temporizador, navegador, preguntas, entrega y resultado |
| PF-025–PF-028 | Tablas académicas, panel de calificación y modal de excepción |
| PF-029–PF-034 | Requisitos, modal de emisión, tarjetas, visor, verificación e historial |
| PF-035 | Resultado explicado, acordeones de pago/matrícula/acceso e historial plegado |
| PF-036–PF-038 | Formulario en cuatro pasos, carga de imágenes, bandeja y respuesta progresiva |
| PF-039 | Filtros, pestañas, tablas, paginación y exportación |
| PF-040 | Filtros y exactamente cuatro gráficos, sin indicadores |

## 38. Criterio de terminado de un componente

Un componente está listo cuando:

- tiene anatomía definida;
- utiliza variables, no colores o espacios sueltos;
- incluye todas las variantes necesarias;
- incluye normal, hover, focus, presionado, cargando y deshabilitado cuando aplican;
- se adapta a escritorio y móvil;
- funciona con textos cortos y largos;
- tiene nombre y propiedades consistentes en Figma;
- cumple contraste y teclado;
- comunica su función sin depender únicamente de forma, posición o color;
- proporciona retroalimentación para normal, procesando, éxito, error y deshabilitado cuando aplican;
- conserva la información válida y ofrece recuperación después de un error;
- no exige recordar un valor que podría mostrar dentro del contexto actual;
- muestra contenido realista de ESEJUR;
- fue probado dentro de al menos una pantalla real;
- puede implementarse sin que frontend tenga que inventar una medida o comportamiento.

## 39. Lista de validación antes de entregar a frontend

- [ ] Colores vinculados a variables.
- [ ] Rojo institucional y rojo de error utilizan variables diferentes y funciones inequívocas.
- [ ] Cada pantalla tiene como máximo un acento dominante y uno auxiliar.
- [ ] Tipografía vinculada a estilos.
- [ ] Espaciado basado en la escala definida.
- [ ] Inputs con todos sus estados.
- [ ] Botones con carga y deshabilitado.
- [ ] Cada control comunica si informa, navega, selecciona o ejecuta.
- [ ] Toda acción produce retroalimentación y una salida comprensible.
- [ ] Errores explican qué ocurrió, qué se conservó y cómo continuar.
- [ ] La tarea frecuente puede completarse sin abrir opciones avanzadas.
- [ ] El usuario puede volver o cancelar sin perder información válida cuando la acción aún no se confirmó.
- [ ] Modales con tamaños y foco.
- [ ] Tablas con carga, vacío y sin resultados.
- [ ] Tarjetas con estados reales.
- [ ] Pestañas y acordeones adaptables.
- [ ] Componentes de aula y examen completos.
- [ ] Pago pendiente diferente de aprobado.
- [ ] Requisitos opcionales no aparecen como obligatorios.
- [ ] Curso virtual sin asistencia ni fecha de fin obligatoria.
- [ ] Cancelación completa muestra todas sus consecuencias.
- [ ] Certificado privado separado de verificación pública.
- [ ] Reclamo muestra plazo de quince días hábiles.
- [ ] Dashboard sin pendientes y con gráficos simples.
- [ ] Versión móvil de cada patrón.
- [ ] Focus y contraste revisados.
- [ ] Nombres de componentes entendibles.

## 40. Resultado esperado

Con este sistema, una persona debe poder construir en Figma cualquier pantalla de ESEJUR usando
componentes existentes. Frontend debe recibir medidas, estados y comportamientos suficientes para
implementar la interfaz sin reinterpretar el diseño.

El sistema mantiene una identidad jurídica sobria, utiliza el turquesa para comunicar avance y
selección, y reserva los colores semánticos para resultados reales del negocio.
