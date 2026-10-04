# ESEJUR — SVG de la Epica 2 (extracto)

## Alcance

Solo 3 pantallas administrativas relacionadas con la Epica 2, incluidas en el selector del HTML principal:

- `adminUsuarios` — PF-010 · HU-008 · Gestión administrativa de usuarios.
- `adminBase` — PF-012 · Información base (HU-009).
- `adminEditor` — PF-014 · Editor del curso, creación y configuración de cursos (HU-010). Esta pantalla está etiquetada internamente como `ADM` (no `EP02`) en el registro propio del HTML; es una particularidad ya existente del prototipo y no se modificó.

No incluye las demas pantallas de la Epica 2 ni las de otras epicas (por ejemplo `adminCursos`, el listado de cursos, queda fuera de este extracto).

Fuente: `../../PROTOTIPO HTML/Prototipo ESEJUR.dc.html`. El HTML original no se modifica. Se utiliza su renderizado real en Chromium, con sus imagenes, colores, tipografias y datos de demostracion. Se oculta la barra superior de revision mediante la propiedad del propio prototipo.

## Escritorio y celular

- `escritorio/`: pantallas completas de 1440 px de ancho, con altura segun el contenido.
- `celular/`: vistas de **390 x 844 px**, sin reducir el texto para meter una pagina larga. Representan una ventana de celular, no toda la pagina desplazable.
- Las 3 pantallas muestran su primera ventana visible (vista `principal`), sin desplazamiento adicional — ninguna de ellas requiere el manejo especial que usan `catalogo` o `registro` en la Epica 1. El contenido inferior sigue existiendo en el HTML y en la exportacion completa de escritorio; no se ha eliminado del sistema.
- Cada SVG tiene un PNG de referencia con el mismo nombre.

## Importar a Figma

1. Abre tu archivo de Figma en modo de edicion.
2. Arrastra un archivo `.svg` desde la carpeta deseada al lienzo.
3. Conserva su escala original: 390 x 844 en celular, 1440 px de ancho en escritorio.
4. Utiliza el PNG correspondiente para comparar visualmente la importacion.

Los SVG son estaticos: los textos son trazados vectoriales para conservar la tipografia y las fotografias estan incrustadas. No son capturas PNG envueltas en SVG, pero tampoco son componentes con Auto Layout, campos de texto editables o botones funcionales. La navegacion de prototipo se configura posteriormente en Figma.

## Verificacion

`validacion.json` registra la pantalla renderizada, dimensiones, errores de JavaScript e imagenes que no cargaron. `comparacion-svg.json` compara cada SVG renderizado en Chromium con su PNG de referencia. La comparacion no sustituye una prueba de importacion dentro de Figma: esa integracion esta bloqueada por la cuota del plan.

Se conservan los estados iniciales de demostracion y las notas que ya contiene el HTML. No se han inventado estados de error, modales abiertos ni reglas de negocio nuevas.

## Regenerar

Requiere Python, Google Chrome y los paquetes `playwright`, `pymupdf` y `Pillow`.

```powershell
python exportar.py
python verificar.py
```

`indice.html` permite recorrer las vistas y abrir sus archivos. Los montajes `vista-general-*.jpg` son indices visuales: no se importan como pantallas de Figma.
