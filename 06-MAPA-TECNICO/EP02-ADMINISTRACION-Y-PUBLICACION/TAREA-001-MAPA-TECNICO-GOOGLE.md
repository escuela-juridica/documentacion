# TAREA-001 — Mapa técnico para autenticación con Google

## Objetivo

Reemplazar el componente visual pendiente por un flujo real de Google Identity Services. El
backend valida firma, emisor, audiencia, vigencia y `email_verified`; Angular nunca afirma por sí
solo que una identidad es válida.

## Flujo

1. Angular obtiene la credencial de Google y la envía a `POST /api/auth/acceso/google`.
2. Backend valida la credencial con el `client-id` configurado.
3. Busca primero `google_subject` y luego correo normalizado.
4. Cuenta existente: vincula sin duplicar y crea la sesión ESEJUR.
5. Correo nuevo: emite una referencia temporal de un solo uso para completar datos y conformidad.
6. `POST /api/auth/registro/google` consume la referencia, crea la cuenta verificada y la sesión.

## Persistencia y pruebas

Usa `usuario.google_subject`, `persona` y `usuario_rol`; no crea códigos de verificación. Probar
credencial inválida/vencida, audiencia incorrecta, cuenta existente, correo coincidente, cuenta
deshabilitada, referencia repetida y alta nueva sin duplicidad.
