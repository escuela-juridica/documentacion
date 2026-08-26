# HU-008 — Consultar la ficha y vista previa de un curso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Visitante |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **visitante**, quiero **revisar la información y una muestra real del curso**, para
> **decidir si me conviene matricularme**.

## Alcance incluido

- Título, descripción con “Leer más” cuando sea larga, portada, tipo, categoría, modalidad,
  docentes con foto y biografía, horas y lista de beneficios escrita libremente para ese curso.
- Panel comercial con precio regular tachado, precio promocional vigente y botón de compra cuando
  corresponda. Si no hay promoción vigente se muestra únicamente el precio aplicable.
- Temario completo desplegable por módulo, indicando cantidad y lista ordenada de lecciones, sin
  entregar contenido protegido.
- Cuando existe una duración de video detectada, se muestra junto a la lección en el temario.
- Ficha técnica con horas académicas, entidad que refrenda y mención de validación por QR.
- `VIRTUAL`: “Inicio inmediato” cuando no hay fecha, sin fecha de fin ni calendario.
- En `VIRTUAL` se comunica que el contenido está disponible las 24 horas y se estudia al propio
  ritmo; si tiene fecha de inicio la muestra, pero nunca muestra fecha de fin.
- `EN_VIVO`/`HIBRIDO`: inicio, fin, hora, número de sesiones, duración de las sesiones, fecha de
  cada sesión dentro del temario y calendario mensual; muestra “Matrícula cerrada” cuando se alcanzó
  la fecha o el cierre administrativo.
- Si el curso tiene capacidad configurada, muestra disponibilidad o “Sin cupos” al alcanzar el
  límite de matrículas ACTIVA. Si la capacidad está vacía, no presenta un límite artificial.
- Lecciones marcadas como vista previa, públicas sin registro.
- Badge “En vivo” según modalidad.

## Flujo principal

1. El visitante abre la ficha desde catálogo o URL amigable.
2. ESEJUR presenta los datos según modalidad y estado.
3. El visitante despliega el temario y abre una lección de vista previa.
4. Puede crear una cuenta y, si el curso está disponible, iniciar matrícula gratuita o pago en
   línea; la ficha no concede acceso por sí sola.

## Excepciones

- Una lección no marcada como vista previa solicita matrícula válida.
- Un curso pagado sin muestra real no puede llegar publicado; esta historia no sustituye esa
  validación.
- El enlace directo a material protegido no concede acceso.
- Un video de YouTube solo se entrega públicamente cuando pertenece a una lección marcada como
  vista previa. En las demás lecciones, conocer la dirección del video no sustituye la validación
  de acceso realizada por ESEJUR.

## Criterios de aceptación

- **Dado** un VIRTUAL sin fecha, **cuando** consulta la ficha, **entonces** ve “Inicio inmediato” y
  nunca fecha de fin.
- **Dado** un EN_VIVO o HIBRIDO, **cuando** consulta la ficha, **entonces** ve fechas y calendario.
- **Dado** una descripción larga, **cuando** abre la ficha, **entonces** puede desplegarla con
  “Leer más” sin perder los demás datos comerciales.
- **Dado** un curso con promoción vigente, **cuando** consulta el panel comercial, **entonces** ve
  el precio regular tachado y el precio promocional que realmente se usará al iniciar el pago.
- **Dado** un EN_VIVO o HIBRIDO, **cuando** revisa el temario y el calendario, **entonces** puede
  conocer las fechas de sus sesiones antes de matricularse.
- **Dado** una lección de vista previa, **cuando** la abre sin sesión, **entonces** accede al
  contenido real permitido.
- **Dado** material no público, **cuando** intenta abrir su enlace, **entonces** no obtiene acceso.

## Dependencia interna

- Se integra con HU-007 para el recorrido desde catálogo.
- Puede desarrollarse en paralelo usando una URL y curso controlados.

## Orientación de trabajo

- **Frontend:** ficha adaptable, temario, vista previa y estados comerciales.
- **Backend:** datos públicos, vigencia promocional y autorización de vista previa.
- **Integración:** catálogo → ficha → contenido público → llamado a registro/matrícula.

## Demostración esperada

Comparar una ficha VIRTUAL y una HIBRIDA, abrir una vista previa sin sesión y demostrar el rechazo
de un material protegido.
