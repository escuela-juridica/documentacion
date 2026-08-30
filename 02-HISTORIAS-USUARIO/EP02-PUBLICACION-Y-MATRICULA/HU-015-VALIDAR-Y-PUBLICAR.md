# HU-015 — Validar y publicar un curso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **validar integralmente un borrador antes de publicarlo**, para
> **evitar vender o habilitar un curso que no pueda cursarse ni certificarse**.

## Validaciones incluidas

- Título, descripción, modalidad, tipo, categoría, horas académicas y al menos un módulo con una
  lección obligatoria que pueda cursarse.
- Fechas, precios, promoción, cupo, vigencia y modalidad coherentes.
- Curso pagado con al menos una lección de vista previa de contenido real.
- Sesiones válidas cuando modalidad/reglas las necesitan.
- Exámenes completos cuando se exigen.
- Progreso y asistencia configurados de forma aplicable.
- Datos de certificado, entidad y firmantes suficientes.
- Todos los errores se muestran juntos; bloquean publicación.
- Advertencia de video fuera de 10–15 minutos no bloquea.

También se valida de manera explícita:

- precio regular no negativo; promoción no mayor que el regular y fechas promocionales coherentes;
- porcentajes de progreso, video y asistencia entre 0 y 100;
- nota mínima y Refrendado entre 0 y 20, con Refrendado mayor que la mínima;
- al menos un examen CALIFICADO con preguntas y puntaje positivo si se exigen exámenes;
- ningún examen CALIFICADO si `requiere_examenes` está desactivado;
- al menos una lección obligatoria completable si se exige progreso;
- modalidad EN_VIVO/HIBRIDO y al menos una sesión futura completa si se exige asistencia;
- ausencia de sesiones y asistencia en VIRTUAL; fechas de inicio, fin y sesiones coherentes en
  EN_VIVO/HIBRIDO;
- hora final posterior a la inicial y cierre de matrícula no posterior al fin;
- firmantes y datos impresos completos; entidad activa cuando puede emitirse Refrendado.

## Flujo principal

1. Administración solicita publicar el BORRADOR.
2. ESEJUR evalúa todas las reglas aplicables.
3. Si hay problemas, muestra la lista completa y conserva BORRADOR.
4. Administración corrige y vuelve a validar.
5. Sin bloqueos, pasa a PUBLICADO, salvo VIRTUAL sin fecha de inicio, que queda inmediatamente EN
   CURSO; en ambos casos queda disponible según fechas y cupo.

## Criterios de aceptación

- **Dado** varios faltantes, **cuando** valida, **entonces** se muestran juntos y no se publica.
- **Dado** un curso pagado sin vista previa real, **cuando** valida, **entonces** permanece BORRADOR.
- **Dado** solo advertencia de duración, **cuando** publica, **entonces** no se bloquea.
- **Dado** configuración completa con inicio futuro, **cuando** confirma, **entonces** cambia una
  sola vez a PUBLICADO.
- **Dado** VIRTUAL sin fecha de inicio, **cuando** confirma la publicación, **entonces** queda EN
  CURSO en la misma operación, sin estado PUBLICADO intermedio visible.
- **Dado** reglas activas, **cuando** falta un examen, lección completable, sesión futura o dato de
  certificado requerido, **entonces** la publicación permanece bloqueada y señala cada faltante.

## Dependencia interna

- Depende de HU-010 y HU-011; también HU-012, HU-013 y HU-014 cuando la configuración los exige.
- Es el punto bloqueante antes de HU-016 a HU-021.

## Orientación de trabajo

- **Frontend:** resumen de validación, navegación a cada corrección y confirmación.
- **Backend:** evaluación completa y transición atómica de estado.
- **Integración:** probar curso incompleto, corregir y publicar.

## Demostración esperada

Intentar publicar con varios errores, corregirlos y completar la publicación; comprobar que una
advertencia editorial no bloquea.

