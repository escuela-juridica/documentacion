# HU-027 — Mapa técnico para cambios de sesiones

## API

- `POST /api/admin/sesiones/{leccionId}/reprogramacion`.
- `POST /api/admin/sesiones/{leccionId}/cancelacion`.
- `GET /api/admin/sesiones/{leccionId}/historial`.

En una transacción, bloquear la lección, comprobar que es futura y no realizada, exigir motivo,
insertar `historial_sesion` con antes/después y actualizar `leccion`. CANCELADA conserva la tarjeta,
libera la secuencia y deja de contar para progreso/asistencia. Después de confirmar se solicita una
sola notificación por alumno; el fallo del correo no revierte el cambio.

Angular presenta resumen de impacto antes de confirmar. Probar sesión realizada, horas inválidas,
reprogramación, cancelación repetida, historial y actualización del calendario.
