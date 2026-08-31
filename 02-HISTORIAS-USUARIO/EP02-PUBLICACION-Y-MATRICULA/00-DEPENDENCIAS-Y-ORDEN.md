# EP02 — Dependencias y orden de ejecución

## Entregable funcional

Al cerrar la épica, administración gestiona usuarios y crea, configura, valida y publica un curso
completo. Un alumno se matricula mediante el camino gratuito, el pago en línea o la matrícula
administrativa, y el acceso aparece correctamente en “Mis cursos”.

## Dependencias internas

| Historia | Depende de | Bloqueante para aceptar | Puede adelantarse |
|---|---|---|---|
| HU-008 | Reutiliza HU-001, HU-002 y HU-005 de EP01 | Sí para probar la habilitación completa | Sí, con cuentas controladas |
| HU-009 | Ninguna | No | Sí |
| HU-010 | HU-009 | Sí para usar datos maestros reales | Sí, con valores acordados |
| HU-011 | HU-010 | Sí | Sí, con curso controlado |
| HU-012 | HU-011 | Sí para ubicar sesiones en lecciones | Sí, acordando la estructura |
| HU-013 | HU-011 | Sí para ubicar exámenes | Sí, acordando la estructura |
| HU-014 | HU-010 | Sí | Sí; integra sesiones y exámenes cuando se activen |
| HU-015 | HU-010 a HU-014 según modalidad y reglas | Sí | Puede preparar validaciones, no aceptarse antes |
| HU-016 | HU-015 | Sí | Puede preparar estados con cursos controlados |
| HU-017 | HU-015 | Sí | Sí, con curso publicado controlado |
| HU-018 | HU-015 | Sí | Sí, con curso publicado controlado |
| HU-019 | HU-008 y HU-015 | Sí | Sí, con curso publicado y cuenta controlados |
| HU-020 | HU-017, HU-018 o HU-019 | Sí para datos reales | Sí, con operaciones controladas |
| HU-021 | HU-017, HU-018 o HU-019 | Sí para datos reales | Sí, con matrícula activa controlada |

## Olas recomendadas

1. **Ola A, paralela:** HU-008 y HU-009.
2. **Ola B:** HU-010.
3. **Ola C, paralela:** HU-011 y HU-014.
4. **Ola D, paralela:** HU-012 y HU-013; continuar HU-014 con sus integraciones.
5. **Ola E:** HU-015.
6. **Ola F, paralela:** HU-016, HU-017, HU-018 y HU-019.
7. **Ola G, paralela:** HU-020 y HU-021.

## Puntos de integración obligatorios

- HU-015 no se acepta con una publicación parcial: debe validar lo que el curso realmente exige.
- HU-018 debe quedar integrado con el resultado comunicado por Culqi; ESEJUR no simula aprobar un
  pago fallido.
- HU-020 y HU-021 deben leer la misma matrícula y no crear estados diferentes para un mismo alumno.
- Ningún pago pendiente reserva cupo; la ocupación ocurre al activar la matrícula.
- Una confirmación repetida no duplica el pago, la matrícula ni el acceso.

## Secuencia de demostración

1. Mantener datos maestros y crear un curso BORRADOR.
2. Configurar modalidad, fechas, precios, cupo, contenido, sesiones, exámenes y certificación.
3. Mostrar la validación y publicar.
4. Gestionar una cuenta y completar su habilitación administrativa.
5. Ejecutar matrícula gratuita, pagada y administrativa.
6. Mostrar pagos y matrículas en administración.
7. Ingresar como alumno y abrir “Mis cursos”.
