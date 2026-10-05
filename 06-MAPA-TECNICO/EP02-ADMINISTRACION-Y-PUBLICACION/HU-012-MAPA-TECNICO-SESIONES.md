# HU-012 — Mapa técnico para programar sesiones iniciales

## Persistencia y API

La sesión se guarda en una `leccion` de tipo `EN_VIVO`; EP02 todavía no escribe
`historial_sesion`. Usar `POST/PUT /api/admin/lecciones/{id}/sesion` y devolver inicio, fin,
enlace y estado.

## Servicio

1. Resolver módulo y curso desde la lección.
2. Rechazar modalidad VIRTUAL.
3. Exigir inicio, fin posterior y fecha dentro del periodo del curso.
4. Guardar el enlace sin integrarse con Zoom.
5. Dejar la grabación pendiente hasta que se agregue como material.

HU-014 usa estas fechas para proponer/validar el cierre por asistencia. Los datos quedan listos para
el calendario privado de EP04; no crear calendario público. Probar horas inválidas, fuera del
periodo, VIRTUAL y sesión válida.
