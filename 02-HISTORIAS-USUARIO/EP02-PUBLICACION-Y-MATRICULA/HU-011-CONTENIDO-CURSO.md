# HU-011 — Organizar el contenido de un curso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **construir y ordenar módulos, lecciones y materiales**, para
> **ofrecer un recorrido cursable y reutilizar contenido sin mezclar historiales**.

## Alcance incluido

- Jerarquía Curso → Módulo → Lección → Material.
- Lección `GRABADA` o `EN_VIVO`, ordenada y marcable.
- Cada lección se enfoca editorialmente en un concepto y puede contener varios materiales; la
  preparación y división del contenido corresponde a la Escuela y no bloquea la carga técnica.
- Un módulo pertenece a un solo curso. “Agregar módulo existente” crea una copia completa dentro
  del curso actual; nunca comparte una misma instancia editable entre cursos.
- Crear, editar y ordenar módulos, lecciones, materiales y ubicación de exámenes.
- Materiales permitidos: PDF, DOC, PPT, EXCEL, IMAGEN, AUDIO, VIDEO, ZIP y ENLACE.
- Tres orígenes: archivo local, video de YouTube no listado o enlace de nube externa; se intenta la
  visualización en línea cuando el formato y el origen lo permiten.
- Los materiales se muestran en línea sin descarga por defecto; administración habilita la descarga
  de manera independiente para cada material.
- Sin material principal; orden mediante arrastrar y soltar.
- Vista previa definida por lección.
- Duración de video detectada cuando sea posible; advertencia no bloqueante fuera de 10–15 minutos.
- La duración detectada se muestra al alumno en el temario.
- Al registrar YouTube se exige que el administrador indique un video no listado. Si la fuente no
  permite comprobarlo, se muestra una advertencia explícita sin impedir la carga rápida.
- Los exámenes pueden colocarse dentro de un módulo como parciales o al nivel del curso como examen
  final, siempre en la posición ordenada por administración.
- Copiar un módulo existente con lecciones, materiales, exámenes, preguntas y opciones; la copia
  queda independiente y solo reutiliza referencias físicas de archivos.

## Flujo principal

1. Administración abre un BORRADOR.
2. Crea módulos y lecciones o agrega una copia de un módulo existente.
3. Adjunta y ordena materiales; decide visualización, descarga y vista previa.
4. ESEJUR detecta duración cuando puede y muestra advertencias editoriales.
5. Guarda el orden cursable.

## Excepciones

- No exige duración a una lección sin video ni a una fuente que no permite detectarla.
- La duración se detecta para un video local y para YouTube cuando la fuente la proporciona; en un
  enlace de nube que no la expone, el dato es opcional y no se intenta adivinar.
- La advertencia de microlearning o YouTube no listado no bloquea la carga.
- Editar la copia de un módulo nunca altera su origen.
- No se copian matrículas, progreso, intentos, asistencia o certificados.
- Un enlace compartido no concede acceso a material protegido.
- Un archivo cuya extensión o tamaño incumple la configuración activa se rechaza indicando el
  límite aplicable antes de incorporarlo a la lección.

## Criterios de aceptación

- **Dado** contenido creado, **cuando** se reordena, **entonces** alumno y administrador ven el
  mismo orden persistido.
- **Dado** un módulo existente, **cuando** se agrega a otro curso, **entonces** se copia completo y
  sus cambios futuros son independientes.
- **Dado** un video detectable, **cuando** se carga, **entonces** se calcula duración y solo se
  advierte si queda fuera del rango recomendado.
- **Dado** un enlace de nube sin duración accesible, **cuando** se guarda, **entonces** no se exige
  duración y la carga puede completarse.
- **Dado** un material no descargable, **cuando** el alumno lo consulta, **entonces** puede verlo
  según autorización sin descargarlo desde la interfaz.
- **Dado** un material nuevo, **cuando** se guarda sin cambiar permisos, **entonces** queda visible
  en línea y con descarga desactivada.

## Dependencia interna

- Depende de HU-010.
- HU-012 y HU-013 requieren una estructura para ubicarse.

## Orientación de trabajo

- **Frontend:** constructor ordenable, carga, advertencias y controles por material.
- **Backend:** copia profunda lógica, independencia, referencias protegidas y orden.
- **Integración:** crear contenido nuevo, copiar un módulo, modificar la copia y demostrar que el
  origen permanece igual.

## Demostración esperada

Construir un módulo con videos/materiales, reordenarlo, habilitar una vista previa y una descarga,
copiar otro módulo y comprobar independencia.
