# HU-015 — Mapa técnico para validar y publicar

## API única

- `GET /api/admin/cursos/{id}/validacion`: devuelve todos los errores y advertencias.
- `POST /api/admin/cursos/{id}/publicacion`: repite la validación dentro de la transacción y cambia
  el estado si continúa válido.

PF-013 solo navega a este flujo de PF-014. No crear un segundo endpoint rápido que omita errores.

## Backend

Construir validadores por bloque: información, modalidad/fechas, contenido, sesiones, exámenes,
reglas y certificado. Cada hallazgo lleva código, sección, campo, severidad y mensaje. Una
advertencia de duración no bloquea. Con errores se conserva BORRADOR. Sin errores se registra
historial y pasa a PUBLICADO o directamente EN_CURSO para VIRTUAL sin inicio.

Probar múltiples errores simultáneos, dato maestro inactivo, curso pagado sin preview, HIBRIDO sin
ambos componentes y doble solicitud de publicación.
