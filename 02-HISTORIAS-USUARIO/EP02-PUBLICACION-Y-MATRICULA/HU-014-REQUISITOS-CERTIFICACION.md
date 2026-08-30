# HU-014 — Configurar requisitos académicos y de certificación

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **configurar las condiciones que debe cumplir un alumno**, para
> **adaptar la certificación a cada modalidad sin imponer requisitos innecesarios**.

## Alcance incluido

- Condiciones independientes: exámenes, progreso y asistencia.
- Valores iniciales: nota mínima 12, refrendado 14, progreso 80%, video 50%, asistencia 80%.
- `VIRTUAL`: exámenes y progreso activos por defecto; asistencia no se muestra.
- `EN_VIVO`: exámenes y asistencia activos por defecto; progreso desactivado inicialmente.
- `HIBRIDO`: las tres activas por defecto.
- Todas configurables antes de iniciar; asistencia solo EN_VIVO/HIBRIDO.
- Secuencia obligatoria activa por defecto, configurable por curso.
- Días de espera del certificado, cero por defecto, contados en días calendario; una emisión
  programada se ejecuta a las 00:00 de `America/Lima` de la fecha calculada.
- Si no exige exámenes, no hay nota final ni nivel Refrendado. No puede guardar ni publicar con un
  examen CALIFICADO restante: antes debe convertirlo a PRACTICA o retirarlo.
- Si desactiva las tres condiciones, emisión únicamente manual con motivo.
- El progreso se calcula y muestra siempre, aunque no sea requisito. La asistencia se registra en
  EN_VIVO/HIBRIDO aunque esté desactivada como requisito; en VIRTUAL no se ofrece ni se calcula.
- Si exámenes está activo, deben aprobarse todos los exámenes CALIFICADO. No existe una condición
  alternativa de “aprobar al menos N”; los exámenes que no deban contar se configuran como PRACTICA.

## Flujo principal

1. ESEJUR propone valores según modalidad.
2. Administración activa/desactiva condiciones y define umbrales válidos.
3. Configura secuencia y espera de certificado.
4. Guarda antes de iniciar el curso.

Los porcentajes de progreso, video y asistencia deben quedar entre 0 y 100. La nota mínima y la de
Refrendado deben quedar entre 0 y 20; el umbral Normal es exactamente la nota mínima y Refrendado
debe ser estrictamente mayor. Los días de espera no pueden ser negativos.

## Criterios de aceptación

- **Dado** VIRTUAL, **cuando** abre reglas, **entonces** asistencia no aparece.
- **Dado** un curso sin exámenes obligatorios, **cuando** guarda, **entonces** no existe nota final
  para certificar ni nivel Refrendado.
- **Dado** `requiere_examenes` desactivado y un examen CALIFICADO, **cuando** intenta guardar,
  **entonces** se bloquea y se indica convertirlo a PRACTICA o retirarlo.
- **Dado** las tres condiciones desactivadas, **cuando** guarda, **entonces** se informa que solo
  habrá emisión manual.
- **Dado** un curso iniciado, **cuando** intenta aumentar requisitos, **entonces** se impide.
- **Dado** valores fuera de rango o Refrendado menor o igual que la nota mínima, **cuando** intenta
  guardar, **entonces** se rechaza y se explica la relación que debe corregir.

## Dependencia interna

- Depende de HU-010.
- Integra HU-012 si usa asistencia y HU-013 si usa exámenes.

## Orientación de trabajo

- **Frontend:** opciones condicionales y valores iniciales claros.
- **Backend:** coherencia por modalidad y protección tras inicio.
- **Integración:** las condiciones y umbrales guardados deben controlar realmente el avance, la
  finalización y la certificación; una condición desactivada no puede aparecer como pendiente.

## Demostración esperada

Demostrar las tres modalidades, incluida una configuración flexible sin examen o sin progreso.
