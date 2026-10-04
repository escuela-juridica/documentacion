# Base de datos PostgreSQL de ESEJUR

La base de datos se construye de manera acumulativa por épicas. Cada carpeta incorpora solamente
las estructuras que necesita su entregable, pero una tabla se crea una sola vez y queda disponible
para las épicas posteriores.

## Orden funcional vigente

1. `EP01-ACCESO-Y-DESCUBRIMIENTO`
2. `EP02-ADMINISTRACION-Y-PUBLICACION`
3. `EP03-MATRICULAS-Y-ACCESOS`
4. `EP04-AULA-PROGRESO-Y-SESIONES`
5. `EP05-EVALUACION-Y-CERTIFICACION`
6. `EP06-PAGOS-Y-CONTROL`

Los scripts acumulativos existentes fueron preparados antes de esta reorganización funcional. Su
separación física por las seis épicas se realizará cuando se prepare la base de cada incremento;
la reorganización de historias no elimina tablas ni modifica datos por sí sola.

Cada épica separa la creación de tablas y llaves de sus datos iniciales. Los datos ficticios se
limitan a los registros necesarios para probar el entregable. En esta etapa no se incluyen
triggers, funciones, procedimientos, vistas ni automatizaciones de base de datos.

## Convenciones

- Motor: PostgreSQL 15 o superior.
- Esquema de aplicación: `public`.
- Identificadores internos: `bigint` autogenerado.
- Fechas de eventos: `timestamp with time zone` (`timestamptz`).
- Zona de presentación del negocio: `America/Lima`.
- Nombres técnicos: español, minúsculas, sin tildes y con guion bajo.
- No se almacenan contraseñas, códigos ni tokens en texto plano; solo sus hashes.
- Las eliminaciones funcionales importantes se representan mediante estados para conservar
  historial.
