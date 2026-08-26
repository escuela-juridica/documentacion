# HU-010 — Crear y configurar un curso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **crear una convocatoria de curso con su configuración comercial
> y temporal**, para **preparar una oferta coherente antes de cargar contenido y publicarla**.

## Alcance incluido

- Cada curso es una convocatoria concreta, inicialmente BORRADOR.
- Título, descripción, portada, URL amigable, tipo, categoría, modalidad, docente, horas, beneficios,
  entidad y firmantes.
- Modalidades `VIRTUAL`, `EN_VIVO` e `HIBRIDO`; presencial fuera.
- Precio neto en soles: gratuito o pagado; regular, promocional y vigencia opcional de promoción.
- Capacidad de venta opcional; vacío significa sin límite.
- Vigencia de acceso en días opcional; vacío significa permanente.
- `VIRTUAL`: inicio opcional y sin fecha de fin ni cierre de matrícula.
- `EN_VIVO`/`HIBRIDO`: inicio y fin obligatorios y cierre de matrícula configurable.
- Si asistencia es obligatoria en `EN_VIVO` o `HIBRIDO`, el cierre de matrícula propone inicialmente
  la fecha de inicio; administración puede extenderlo, pero nunca después de la fecha de fin. Si la
  asistencia no es obligatoria, el cierre es opcional y vacío permite matricular hasta el cierre
  administrativo, el fin o el agotamiento del cupo.
- Advertencia si modalidad y lecciones posteriores no coinciden.
- Seleccionar “In-house” solo clasifica comercialmente el curso; no crea grupos, cupos corporativos,
  accesos privados ni una matrícula diferente.

## Flujo principal

1. Administración crea un BORRADOR y completa los datos básicos.
2. Selecciona modalidad y ESEJUR adapta las fechas disponibles.
3. Define condición comercial, capacidad y vigencia.
4. Selecciona clasificaciones, docente y datos certificadores.
5. Guarda y obtiene la URL amigable del curso.

La URL amigable se define desde la creación. Antes de modificarla, ESEJUR advierte que los enlaces
ya compartidos dejarían de conducir a la ficha anterior.

## Excepciones

- Fechas incoherentes no se guardan como configuración válida para publicación.
- En VIRTUAL nunca se ofrece fecha de fin.
- Precio promocional sin fechas queda permanente; con fechas solo rige dentro del periodo.
- Precio negativo, fin anterior a inicio o capacidad inválida se rechazan.
- Una promoción mayor que el precio regular, un cierre de matrícula posterior al fin o una vigencia
  de promoción con inicio posterior a su fin se rechazan.
- La imagen por defecto puede ser portada, no una vista previa real.
- Un curso In-house conserva exactamente las reglas de modalidad, pago, cupo, acceso y matrícula
  que administración configure; la etiqueta por sí sola no altera ninguna de ellas.

## Criterios de aceptación

- **Dado** modalidad VIRTUAL, **cuando** configura fechas, **entonces** inicio es opcional y fin no
  aparece.
- **Dado** EN_VIVO o HIBRIDO, **cuando** guarda, **entonces** exige inicio y fin coherentes.
- **Dado** una promoción sin fechas, **cuando** consulta la configuración, **entonces** permanece
  vigente hasta edición administrativa.
- **Dado** capacidad o vigencia vacías, **cuando** guarda, **entonces** se interpretan sin límite y
  permanente respectivamente.
- **Dado** asistencia obligatoria en EN_VIVO/HIBRIDO, **cuando** crea el curso, **entonces** el cierre
  se propone igual al inicio y puede modificarse únicamente dentro del periodo del curso.

## Dependencia interna

- Depende de HU-009 para selecciones reales.
- HU-011 a HU-016 utilizan el curso creado.

## Orientación de trabajo

- **Frontend:** formulario adaptable por modalidad y validaciones comprensibles.
- **Backend:** BORRADOR, coherencia, URL, precios, límites y reglas temporales.
- **Integración:** crear tres cursos de modalidades distintas y comprobar diferencias.

## Demostración esperada

Crear un VIRTUAL de inicio inmediato y un HIBRIDO con fechas, cupo y promoción; mostrar que los
campos inválidos o no aplicables no se aceptan.
