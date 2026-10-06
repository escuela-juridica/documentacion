# Mapa maestro técnico — EP04 Aula, progreso y sesiones

## Resultado técnico

Una matrícula con acceso válido abre el aula, materiales y ruta académica. El sistema registra
avance de video o confirmación manual, controla secuencia y sesiones, conserva reprogramaciones y
permite administrar asistencia.

## Orden de construcción

1. HU-022, HU-026 y HU-027 pueden iniciar en paralelo.
2. HU-023 y HU-024 utilizan el acceso validado por HU-022.
3. HU-025 integra progreso y secuencia.
4. HU-045 cierra con consulta y exportación de asistencia.

## Paquetes backend sugeridos

```text
aula/  material/  progreso/  sesion/  asistencia/  reporteasistencia/
```

Toda operación protegida recibe la identidad desde Spring Security y resuelve la matrícula en el
backend; nunca acepta un `usuario_id` enviado por Angular.

## Rutas frontend planificadas

```text
/mis-cursos/:matriculaId/aula
/mis-cursos/:matriculaId/lecciones/:leccionId
/mis-cursos/calendario
/admin/sesiones
/admin/asistencia
/admin/reportes/asistencia
```

## Tablas

`matricula`, `curso`, `regla_curso`, `modulo`, `leccion`, `material_leccion`, `recurso`,
`progreso_material`, `progreso_leccion`, `historial_sesion`, `asistencia` y `notificacion`.

## Condiciones de aceptación técnica

- ACTIVA y dentro de vigencia abre contenido; PENDIENTE_PAGO, VENCIDA o CANCELADA no lo abre.
- Las vistas previas públicas no revelan enlaces protegidos ni sesiones.
- El porcentaje de video se limita entre 0 y 100 y debe alcanzar el umbral del curso.
- Una lección sin video usa confirmación explícita e idempotente.
- La secuencia se calcula, no se confía en un botón habilitado por Angular.
- Reprogramar/cancelar exige motivo y conserva antes/después.
- El enlace de reunión solo se entrega durante su ventana.
- El reporte considera exclusivamente sesiones elegibles para cada matrícula.
