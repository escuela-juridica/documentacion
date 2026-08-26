# HU-031 — Atender excepciones académicas

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 4 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **consultar el desempeño y corregir excepciones justificadas**,
> para **dar soporte sin borrar ni alterar silenciosamente el historial del alumno**.

## Alcance incluido

- Vista de solo lectura del avance por lección, intentos, notas, promedio, asistencia, condiciones
  y certificado de cualquier alumno.
- Corregir asistencia de una sesión con el respaldo disponible.
- Otorgar un intento adicional cuando agotó oportunidades sin aprobar, con motivo.
- El intento anterior se conserva; no se cambia un resultado fallido.
- Las correcciones reevalúan progreso/finalización, pero nunca recalculan un certificado emitido.
- No permite aumentar una nota directamente como sustitución del intento o revisión.
- Después de emitirse el certificado no se otorgan nuevos intentos CALIFICADO; la nota y el nivel
  ya están cerrados. Los exámenes de PRACTICA pueden seguir disponibles.

## Flujo principal

1. Administración busca alumno y curso.
2. Consulta datos y condición pendiente.
3. Elige corrección de asistencia o intento adicional.
4. Registra motivo y confirma.
5. ESEJUR conserva el historial y, según la acción elegida, recalcula la asistencia o agrega
   exactamente un intento adicional sin borrar el intento anterior.

## Criterios de aceptación

- **Dado** asistencia incorrecta, **cuando** corrige con motivo, **entonces** el porcentaje se
  recalcula sin borrar el valor previo del historial.
- **Dado** intentos agotados, **cuando** concede uno adicional con motivo, **entonces** aparece una
  nueva oportunidad y el intento anterior permanece.
- **Dado** certificado emitido, **cuando** corrige asistencia o concede intento, **entonces** no
  cambia nota, nivel ni certificado congelado y se impide conceder un intento CALIFICADO adicional.
- **Dado** consulta administrativa, **cuando** abre un alumno, **entonces** ve datos suficientes para
  explicar por qué no finaliza.

## Dependencia interna

- Requiere información generada por HU-024, HU-026, HU-028, HU-029 o HU-030 según el caso.
- Puede adelantarse con casos controlados.

## Orientación de trabajo

- **Frontend:** consulta integral y acciones justificadas.
- **Backend:** historial, motivo, recalculo permitido y protección del certificado.
- **Integración:** cada excepción modifica únicamente la asistencia seleccionada o agrega un intento
  autorizado; después recalcula sus efectos académicos y conserva motivo, responsable, fecha y
  valor anterior. No permite editar directamente progreso, nota o certificado.

## Demostración esperada

Demostrar soporte, corrección de asistencia e intento adicional.
