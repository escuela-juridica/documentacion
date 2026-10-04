# EP03 — Guía para el diagrama de casos de uso

## Actores

- Alumno.
- Administrador.
- Servicio de correo.

## Casos de uso

- Confirmar matrícula gratuita.
- Matricular administrativamente.
- Registrar pago manual.
- Registrar exoneración.
- Consultar y cancelar matrícula individual.
- Consultar “Mis cursos”.
- Consultar reporte de matrículas.
- Exportar reporte.

## Relaciones

- Matricular administrativamente incluye validar rol Alumno, curso, cierre y cupo.
- Registrar pago manual y registrar exoneración son alternativas de la matrícula administrativa.
- Consultar “Mis cursos” incluye validar el estado del acceso.
- Exportar reporte extiende la consulta del reporte con los filtros aplicados.

## Exclusiones

- No representar checkout, Culqi, pagos automáticos, aula ni progreso.
- No crear cuentas ni asignar roles dentro de la matrícula administrativa.

## Prompt

> Genera un diagrama UML horizontal estilo Rational Rose para “ESEJUR — Matrículas y accesos”.
> Coloca Alumno y Administrador a la izquierda y Servicio de correo a la derecha. Representa
> gratuidad, matrícula administrativa, control, “Mis cursos” y reporte de matrículas.
