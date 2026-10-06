# Mapa maestro tecnico - EP05 Evaluacion y certificacion

## Estado y dependencias

Planificado. Consume cursos publicados de EP02, matriculas de EP03 y progreso o asistencia de
EP04. `regla_curso` es la unica fuente de requisitos para aprobar y certificar.

## Orden

1. HU-028, HU-029, HU-031 y HU-043 con datos controlados.
2. HU-030 sobre intentos pendientes.
3. HU-032 centraliza cumplimiento y emision.
4. HU-033, HU-034 y HU-044 en paralelo.

## Tablas y rutas

`intento_examen`, `respuesta_intento`, `respuesta_opcion`, `revision_respuesta`,
`excepcion_academica`, `logro_certificacion`, `certificado`, `certificado_firmante` e
`historial_certificado`.

```text
/app/mis-cursos/:matriculaId/examenes/:examenId
/app/mis-certificados
/verificar-certificado
/admin/evaluaciones/pendientes
/admin/reportes/academico
/admin/reportes/certificados
```

## Reglas transversales

- El backend define tiempo, intentos, puntaje y estado.
- Respuestas abiertas pendientes bloquean certificacion.
- Emitir un certificado congela datos, nota y nivel.
- La verificacion publica no expone DNI, correo, telefono, nota, PDF ni firmas.
