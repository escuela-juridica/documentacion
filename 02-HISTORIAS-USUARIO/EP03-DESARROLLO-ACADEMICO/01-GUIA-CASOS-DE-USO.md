# EP03 — Guía para generar el diagrama de casos de uso

## Objetivo para la IA diagramadora

Representar el aprendizaje, las sesiones y la evaluación en UML de casos de uso con apariencia
clásica **Rational Rose**. No dibujar el orden temporal como si fuera un diagrama de actividades.

## Estilo

- Blanco y negro, sin sombras ni iconos adicionales.
- Rectángulo `ESEJUR — Desarrollo académico`.
- Actores de palo fuera y casos en elipses dentro.
- Asociaciones continuas; include/extend con línea discontinua y estereotipo.
- Formato horizontal de alta legibilidad.

## Actores

- `Alumno`, actor primario a la izquierda.
- `Administrador`, actor primario a la izquierda, separado del alumno.
- `Servicio de correo`, actor secundario a la derecha.

Zoom no se representa como integración: ESEJUR solo entrega el enlace y no consulta directamente
sus participantes.

## Casos de uso

- Consultar mis cursos.
- Continuar curso.
- Consultar materiales.
- Descargar material autorizado.
- Completar lección.
- Consultar progreso.
- Avanzar por ruta académica.
- Consultar calendario académico.
- Ingresar a sesión en vivo.
- Registrar asistencia.
- Consultar grabación.
- Reprogramar sesión.
- Cancelar sesión.
- Corregir sesión realizada.
- Rendir examen automático.
- Rendir examen con respuesta abierta.
- Reintentar examen.
- Consultar resultado.
- Calificar respuesta abierta.
- Otorgar intento adicional.
- Corregir asistencia.
- Consultar desempeño del alumno.

## Relaciones

- Alumno se asocia con consumo, progreso, sesiones y exámenes.
- Administrador se asocia con cambios de sesión, calificación, intento adicional, corrección de
  asistencia y consulta de desempeño.
- Servicio de correo se asocia con recordatorios/cambios de sesión y examen calificado.
- `Completar lección` incluye registrar progreso.
- `Avanzar por ruta académica` incluye consultar el estado de la lección previa.
- `Descargar material autorizado` extiende consultar materiales.
- `Registrar asistencia` se incluye al ingresar a sesión solo dentro de la ventana válida.
- `Reintentar examen` extiende rendir examen.
- `Calificar respuesta abierta` incluye publicar resultado.
- `Otorgar intento adicional` extiende consultar desempeño.
- `Corregir asistencia` extiende consultar desempeño.

## Exclusiones

- No representar Zoom como si ESEJUR creara reuniones o leyera participantes.
- No dibujar certificado, pago o matrícula.
- No incluir tablas o procesos internos de cálculo como actores.

## Prompt listo para otra IA

> Genera un diagrama UML de casos de uso estilo Rational Rose para “ESEJUR — Desarrollo
> académico”, horizontal, blanco y negro. Usa Alumno y Administrador a la izquierda y Servicio de
> correo a la derecha. Incluye exactamente los casos y relaciones descritos, sin mostrar Zoom como
> integración y sin convertir el diagrama en un flujo de actividades.

