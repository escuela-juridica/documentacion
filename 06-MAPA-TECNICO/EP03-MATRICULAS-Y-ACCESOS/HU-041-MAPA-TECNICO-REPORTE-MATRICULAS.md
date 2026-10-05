# HU-041 — Mapa técnico para reporte de matrículas

## API

- `GET /api/admin/reportes/matriculas?desde=&hasta=&curso=&estado=&origen=&page=`.
- `GET /api/admin/reportes/matriculas/exportacion?...`.

Crear una proyección JPA sobre `matricula`, `usuario`, `persona`, `curso` y el resumen económico
de `pago`. Los filtros se construyen una vez y se reutilizan para pantalla y Excel. No guardar una
tabla de reporte.

El resultado diferencia GRATUITA, ADMINISTRADOR y PAGO_EN_LINEA; en EP03 este último puede quedar
sin datos hasta EP06. Incluir totales por estado sin alterar la paginación. El frontend conserva
filtros al exportar. Probar rango Lima, combinación de filtros, vacío y coincidencia pantalla/Excel.
