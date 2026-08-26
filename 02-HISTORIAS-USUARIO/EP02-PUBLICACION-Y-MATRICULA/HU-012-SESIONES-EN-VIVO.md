# HU-012 — Programar sesiones en vivo

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **programar las sesiones de cursos en vivo o híbridos**, para
> **publicar un calendario utilizable para alumnos y asistencia**.

## Alcance incluido

- Lección en vivo con fecha, hora de inicio, hora de fin y enlace.
- Hora de fin obligatoria y posterior al inicio.
- Fechas dentro del periodo del curso EN_VIVO/HIBRIDO.
- Grabación inicialmente pendiente y agregable después.
- Coherencia de modalidad; VIRTUAL no necesita sesiones.
- Fecha de cierre de matrícula inicialmente igual al inicio si exige asistencia, pero editable.
- ESEJUR no crea reuniones ni obtiene participantes de Zoom.

## Flujo principal

1. Administración elige una lección EN_VIVO.
2. Registra fecha, ventana horaria y enlace.
3. ESEJUR valida periodo, modalidad y horas.
4. La sesión queda programada para calendario, recordatorio y asistencia.

## Criterios de aceptación

- **Dado** EN_VIVO/HIBRIDO, **cuando** guarda una sesión válida, **entonces** queda ordenada y lista
  para calendario.
- **Dado** fin igual o anterior al inicio, **cuando** intenta guardar, **entonces** se rechaza.
- **Dado** VIRTUAL sin lecciones en vivo, **cuando** configura el curso, **entonces** no se exige
  calendario.
- **Dado** enlace de reunión, **cuando** guarda, **entonces** ESEJUR lo conserva sin afirmar que
  administra Zoom.

## Dependencia interna

- Depende de HU-011 para la lección.
- Puede avanzar en paralelo con HU-013.

## Orientación de trabajo

- **Frontend:** programación horaria, validaciones y estado de grabación.
- **Backend:** coherencia temporal y disponibilidad para calendario/asistencia.
- **Integración:** al crear o editar una sesión, su fecha, horario, enlace y estado deben aparecer
  iguales en el constructor del curso, el temario del alumno y el calendario público del curso.

## Demostración esperada

Demostrar una sesión válida y rechazos por modalidad o ventana incorrecta.
