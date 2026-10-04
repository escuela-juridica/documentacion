# EP03 — Dependencias y orden de ejecución

## Entregable funcional

Un alumno obtiene acceso mediante matrícula gratuita o administrativa, consulta el curso en “Mis
cursos” y administración controla y reporta las matrículas. Culqi no forma parte de esta épica.

## Dependencias

| Historia | Depende de | Puede adelantarse |
|---|---|---|
| HU-017 | HU-015 | Sí, con curso publicado controlado |
| HU-019 | HU-008 y HU-015 | Sí, con alumno y curso controlados |
| HU-020 | HU-017 o HU-019 | Sí, con matrículas controladas |
| HU-021 | HU-017 o HU-019 | Sí, con acceso controlado |
| HU-041 | HU-017, HU-019 y HU-020 para datos reales | Sí, con datos preparados |

## Olas

1. HU-017 y HU-019 en paralelo.
2. HU-020 y HU-021 en paralelo.
3. HU-041.

## Reglas de integración

- La gratuidad no crea un pago ficticio.
- La matrícula administrativa solo selecciona cuentas que ya poseen rol Alumno.
- Pago manual y exoneración conservan su condición y responsable.
- Ninguna matrícula administrativa supera el cupo; administración amplía primero la capacidad.
- HU-020 y HU-021 leen la misma matrícula y sus mismos estados.
- “En progreso” y “Completados” se clasifican por `fecha_finalizacion`.
- EP03 no muestra checkout ni simula una aprobación automática; HU-047 lo incorpora en EP06.
