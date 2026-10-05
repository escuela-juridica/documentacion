# Mapa maestro técnico — EP03 Matrículas y accesos

## Resultado técnico

El alumno se matricula gratuitamente o administración registra una matrícula manual/exonerada.
Ambos consultan el mismo estado de acceso. EP03 no llama a Culqi ni simula pagos automáticos.

## Orden de construcción

1. HU-017 y HU-019 en paralelo sobre el mismo servicio de matrícula.
2. HU-020 y HU-021 en paralelo usando la matrícula persistida.
3. HU-041 integra consultas y exportación.

## Paquetes backend sugeridos

```text
matricula/  acceso/  pagomanual/  reportematricula/
```

`MatriculaServicio` centraliza duplicidad, estado de curso, cupo, vigencia y activación. El pago
manual/exonerado se registra dentro de la misma transacción de HU-019. La gratuidad no crea una
fila en `pago`.

## Rutas frontend sugeridas

```text
/cursos/:slug/matricula-gratuita
/mis-cursos
/administracion/matriculas
/administracion/matriculas/nueva
/administracion/reportes/matriculas
```

## Tablas

`usuario`, `usuario_rol`, `curso`, `regla_curso`, `matricula`,
`historial_estado_matricula`, `pago` y `notificacion`.

## Condiciones de aceptación técnica

- `usuario_id + curso_id` impide duplicidad.
- Solo una cuenta con rol Alumno puede matricularse.
- El cupo se ocupa al activar, nunca al consultar o seleccionar.
- Cancelar o vencer retira acceso sin borrar pagos, finalización o certificados.
- Los filtros del reporte y su exportación ejecutan las mismas condiciones.
- Las consultas devuelven pago y acceso como conceptos separados.
