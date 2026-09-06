# ESEJUR — SVG de la Epica 1

## Alcance

Solo las 11 pantallas de la Epica 1 incluidas en el selector del HTML principal: PF-001 a PF-009, PF-011a y PF-011b. No incluye las otras epicas ni las pantallas administrativas.

Fuente: `../../PROTOTIPO HTML/Prototipo ESEJUR.dc.html`. El HTML original no se modifica. Se utiliza su renderizado real en Chromium, con sus imagenes, colores, tipografias y datos de demostracion. Se oculta la barra superior de revision mediante la propiedad del propio prototipo.

## Escritorio y celular

- `escritorio/`: pantallas completas de 1440 px de ancho, con altura segun el contenido.
- `celular/`: vistas de **390 x 844 px**, sin reducir el texto para meter una pagina larga. Representan una ventana de celular, no toda la pagina desplazable.
- El catalogo incluye una vista inicial y otra desplazada a los cursos.
- El registro incluye una vista del formulario y otra de la parte final. La vista del formulario empieza despues del bloque editorial superior del HTML.
- Las demas pantallas moviles muestran su primera ventana visible. El contenido inferior sigue existiendo en el HTML y en la exportacion completa de escritorio; no se ha eliminado del sistema.
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
