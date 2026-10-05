# Base de datos PostgreSQL de ESEJUR

La fuente vigente es la carpeta `BASE-DE-DATOS-DEFINITIVA`. Contiene el modelo acumulado para las
seis épicas y reemplaza los antiguos scripts separados por incremento.

## Archivo vigente

- `BASE-DE-DATOS-DEFINITIVA/esejur-base-de-datos-completa.sql`

El archivo ejecuta, en este orden, la limpieza total, la creación de la estructura y la carga de
datos. Todo se encuentra dentro de una sola transacción: si algún bloque falla, PostgreSQL revierte
la operación completa.

## Convenciones

- Motor: PostgreSQL 15 o superior.
- Esquema de aplicación: `public`.
- Identificadores internos: `bigint` autogenerado.
- Fechas de eventos: `timestamp with time zone` (`timestamptz`).
- Zona de presentación del negocio: `America/Lima`.
- Tablas en singular y nombres técnicos en español, minúsculas, sin tildes y con guion bajo.
- No se almacenan contraseñas, códigos ni tokens en texto plano; solo sus hashes.
- Las eliminaciones funcionales importantes se representan mediante estados para conservar
  historial.
- Los reportes y el dashboard consultan las tablas operativas; no duplican información.
- No se crean triggers, funciones, procedimientos ni vistas en esta entrega.

La estructura de EP01 se conservó dentro del modelo definitivo para mantener compatibilidad con el
backend ya implementado. Las tablas posteriores amplían ese mismo modelo sin exigir una base
separada por épica.
