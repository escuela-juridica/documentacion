# HU-025 — Mapa técnico para la ruta académica

## Servicio de cálculo

Crear `RutaAcademicaServicio` que consulta orden de módulos/lecciones, `regla_curso`,
`progreso_leccion` y la configuración de exámenes. No almacenar “módulo desbloqueado” como una
verdad independiente: calcularlo desde las reglas y resultados disponibles.

Con secuencia apagada, las actividades se abren según disponibilidad temporal. Con secuencia
activa, una lección obligatoria o examen de módulo bloqueante debe cumplirse antes de avanzar. Una
sesión CANCELADA se trata como liberada. Práctica y examen final no bloquean el módulo siguiente.

La API de HU-022 devuelve `BLOQUEADA`, `DISPONIBLE` o `COMPLETADA` con un motivo. Angular solo
representa ese estado. Probar secuencia flexible, obligatoria, múltiples exámenes bloqueantes y
sesión cancelada.
