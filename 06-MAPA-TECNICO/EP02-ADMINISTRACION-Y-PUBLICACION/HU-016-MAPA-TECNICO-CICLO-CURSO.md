# HU-016 — Mapa técnico para el ciclo de vida del curso

## Persistencia y API

Usa `curso` e `historial_estado_curso`; duplicar también copia la configuración académica.

- `POST /api/admin/cursos/{id}/adelantar-inicio`.
- `POST /api/admin/cursos/{id}/retrasar-inicio`.
- `POST /api/admin/cursos/{id}/cerrar`.
- `PATCH /api/admin/cursos/{id}/destacado`.
- `POST /api/admin/cursos/{id}/duplicar`.

## Servicio

Aplicar solamente las transiciones ordinarias. CANCELADO pertenece a HU-038. Rechazar retrocesos.
Después del inicio o primera actividad, permitir correcciones no estructurales y bloquear cambios
académicos. Duplicar crea nuevas identidades, URL y BORRADOR; copia datos, contenido, exámenes y
reglas, pero no matrícula, pago, avance, intento, asistencia o certificado.

Probar VIRTUAL sin fin, cierre con acceso conservado, cambio prohibido, URL nueva e independencia
de la copia.
