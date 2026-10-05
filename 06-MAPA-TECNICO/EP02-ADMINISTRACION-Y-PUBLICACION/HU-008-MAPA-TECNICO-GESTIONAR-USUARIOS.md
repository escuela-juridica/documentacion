# HU-008 — Mapa técnico para gestionar usuarios

## Persistencia

Lee y escribe `persona`, `usuario` y `usuario_rol`; genera `codigo_verificacion_correo` y
`notificacion`. No crea matrículas. La búsqueda debe proyectar nombre, correo, activo, origen,
roles y rol principal sin devolver hashes ni códigos.

## API

- `GET /api/admin/usuarios?texto=&activo=&rol=&page=`: listado paginado.
- `GET /api/admin/usuarios/{id}`: detalle administrativo.
- `POST /api/admin/usuarios`: crea persona, cuenta, rol inicial y envío de instrucciones.
- `POST /api/admin/usuarios/{id}/roles`: concede solo el rol faltante.
- `PATCH /api/admin/usuarios/{id}/activo`: habilita o deshabilita con motivo.
- `POST /api/admin/usuarios/{id}/reenviar-habilitacion`: genera el código vigente y reenvía.

## Backend paso a paso

1. Normalizar el correo y buscar antes de insertar.
2. Si existe, conservar contraseña, identidad, historial y rol principal.
3. Si es nueva, cifrar `Escuela1415@`, activar `requiere_cambio_contrasena` y asignar un principal.
4. Registrar otorgante en `usuario_rol` al conceder Administrador.
5. Impedir deshabilitar la sesión propia o al último administrador activo.
6. Confirmar la transacción antes de solicitar el correo; un fallo de envío permite reintentar.

## Frontend y pruebas

Construir listado, búsqueda, detalle, alta y confirmación de deshabilitación. Probar correo nuevo,
correo existente, rol repetido, segundo rol, opcionales vacíos, cuenta propia y último administrador.
