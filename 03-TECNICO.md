# esejur — Decisiones técnicas

> Documento técnico del proyecto. Las reglas de negocio viven en `01-NEGOCIO.md`;
> aquí solo va **cómo** se construye.
>
> Última actualización: 2026-08-30

---

## 1. Stack

| Capa | Tecnología |
|---|---|
| **Backend** | Spring Boot (Java) |
| **Frontend** | Angular |
| **Base de datos** | PostgreSQL |
| **Archivos** | Disco del VPS propio + enlaces externos (YouTube, nube) |

### Versiones

- **Java 21** (LTS)
- **Spring Boot 3.x**
- **Angular** última estable
- **PostgreSQL 16**

### Repositorios

- `esejur-backend` → github.com/IHenrix/esejur-backend
- `esejur-frontend` → github.com/IHenrix/esejur-frontend

---

## 2. Autenticación

**JWT con *refresh token*.**

El token de acceso es de vida corta y el de refresco lo renueva sin que el alumno note nada.
Sin refresco, la sesión se cierra a media clase — inaceptable en una plataforma donde alguien
puede estar 40 minutos viendo un video.

- Contraseñas con hash **BCrypt**, y **confirmación de contraseña** en el registro.
- La validación compartida exige al menos ocho caracteres, mayúscula, minúscula, número y símbolo.
- Los tokens de verificación duran 24 horas y los de recuperación 60 minutos; son de un solo uso y
  una nueva emisión invalida los anteriores del mismo propósito.
- **Verificación de correo** obligatoria al registrarse por formulario: es el canal por el que
  llega el certificado.
- **Recuperación de contraseña** por correo — imprescindible: si el alumno se registra solo a
  las 2 a.m., no hay administrador que le resetee la clave.
- **Registro de accesos** (quién, cuándo, desde dónde), base para detectar cuentas compartidas.
- **Protección anti-robot** en el formulario de registro.

### Acceso con Google

Segundo camino de entrada, en un clic. Se implementa con **OAuth 2.0 / OpenID Connect**.

- Google entrega el correo **ya verificado**, `given_name`, `family_name` y la foto. Ese usuario
  **se salta el flujo de verificación** por correo.
- ⚠️ `family_name` viene como **un solo campo**: no separa apellido paterno de materno. El
  desglose se completa en la pantalla de confirmación previa al certificado.
- **Vinculación por correo:** si el correo de Google ya existe como cuenta creada por formulario,
  se **vincula a esa misma cuenta** en vez de crear una nueva. Sin esto aparecen cuentas
  duplicadas y alumnos que "perdieron" sus cursos.
- Un usuario que entró por Google puede **definirse una contraseña** después; su cuenta queda con
  los dos accesos.

> 📋 **Trámite previo:** hay que **registrar la aplicación en Google Cloud Console** para obtener
> el *client ID* y el *client secret*, y declarar las URLs de redirección (una para desarrollo,
> otra para producción). Es gratuito y rápido, pero **es un requisito bloqueante**: sin esas
> credenciales el botón no funciona. Conviene hacerlo junto con el trámite de la pasarela (§5.4),
> que es el otro elemento que no depende de nosotros.

> **Sin passwordless.** Se evaluó el acceso solo con correo y código, como hace udeapolis, y se
> descartó: el público son funcionarios con correo institucional filtrado, y si el correo no llega
> no hay forma de entrar. La justificación completa está en `01-NEGOCIO.md` §10.

---

## 3. Entrega de archivos — la regla que sostiene el pago

**Ningún archivo se sirve por una ruta directa.**

Si un PDF viviera en `esejur.pe/uploads/curso-12/leccion-3.pdf`, cualquiera con ese enlace lo
descargaría sin pagar, y los enlaces se comparten por WhatsApp en minutos. Lo mismo con el PDF
del certificado: en una ruta adivinable, la privacidad prometida sería decorativa.

- Todo material y todo certificado pasa por un **punto de acceso** que identifica al solicitante,
  verifica que tenga matrícula activa (o que sea el dueño del certificado) y recién entonces
  entrega el archivo.
- El **video propio** se transmite por ese mismo camino.
- Las lecciones de **vista previa** son la única excepción: públicas por diseño.

> Hacerlo bien desde el inicio cuesta poco. Arreglarlo después obliga a rehacer la entrega de
> archivos completa.

### Detección de reproducción

| Fuente | ¿Se puede detectar que vio el video? |
|---|---|
| Archivo local (VPS) | ✅ Sí, con el reproductor propio |
| YouTube | ✅ Sí, con la IFrame API |
| Enlace externo (Drive, otro cloud) | ❌ No — solo marcado manual |

Cuando la fuente no lo permite, el marcado automático se desactiva y el panel muestra al
administrador el motivo técnico. El alumno nunca ve ese mensaje.

### Límites de subida

Extensiones permitidas y tamaño máximo **configurables**. Sin tope, alguien sube un archivo de
2 GB al VPS.

---

## 4. Posicionamiento en buscadores

**Sin renderizado en servidor en la primera versión.**

Angular es una aplicación de una sola página y Google la indexa mal. Agregar renderizado en
servidor complica el despliegue, así que queda fuera de V1 — pero se deja preparado:

- **URLs amigables** desde el inicio (`/cursos/diplomado-derecho-registral`)
- Metadatos por curso listos para usarse

> ⚠️ **Hay que avisarle al cliente.** Hoy su web sí aparece en Google; el catálogo nuevo no lo
> hará. Como esejur vive en un subdominio y la web institucional se mantiene, el daño está
> acotado — pero el cliente probablemente asume que sí aparecerá.

---

## 5. Decisiones técnicas y servicios externos

### 5.1 Migraciones de base de datos
**Alternativas:** Flyway · Liquibase · dejar que Hibernate cree las tablas (`ddl-auto`).

**Riesgo conocido:** con `ddl-auto`, en cuanto haya datos reales una modificación del esquema
puede borrarlos. Una herramienta de migraciones deja además cada cambio como archivo versionado.

### 5.2 Generación del PDF del certificado
**Alternativas:** HTML + CSS → PDF · librería de composición directa.

La plantilla actual está hecha en Canva y hay que rehacerla dentro del sistema. El QR se genera
al vuelo apuntando a la página pública de verificación.

*Estado: se decide al final, cuando se construya la certificación.*

### 5.3 Servicio de correo
**Alternativas:** Brevo · SendGrid · SMTP propio.

Se necesitan once plantillas funcionales: bienvenida/verificación, recuperación de contraseña,
matrícula gratuita, matrícula pagada aprobada, matrícula administrativa, recordatorio de sesión,
cambio o cancelación de sesión, examen abierto calificado, solicitud de datos del certificado,
certificado listo y constancia/respuesta del Libro de Reclamaciones. Una misma infraestructura de
correo sirve a todas; no se rastrea apertura o entrega, solo aceptación o fallo del envío.

El recordatorio de sesión en vivo es el único que necesita **envío programado** — el día antes
de cada sesión — no una reacción a un evento del usuario.

### 5.4 Pasarela de pago — Culqi

**Requisito que manda sobre todo lo demás:** debe cobrar con **tarjeta, Yape y Plin** y
**confirmar el pago automáticamente** al sistema, por webhook. Son los tres medios de esta
versión (`01-NEGOCIO.md` §9); el pago en efectivo quedó fuera.

> ⚠️ **Yape y Plin sin confirmación automática no sirven.** Se pueden cobrar a mano — el alumno
> transfiere y manda la captura — pero eso es exactamente el proceso manual que el sistema viene
> a eliminar. Si el proveedor elegido no avisa solo cuando el pago se aprueba, **la matrícula 24/7
> deja de existir**. Es el criterio con el que hay que descartar opciones.

La pasarela funcional elegida es **Culqi**. Antes de integrar se verifican en la cuenta comercial
contratada la disponibilidad real de tarjeta, Yape y Plin, sus credenciales de prueba/producción,
webhooks y comisiones. ESEJUR nunca determina si un pago fue aprobado: valida autenticidad del
aviso y aplica exactamente el resultado informado por Culqi.

> ⚠️ **Es el elemento de plazo más largo del proyecto.** Abrir la cuenta necesita RUC, cuenta
> bancaria, representante legal y un tiempo de aprobación que no depende de nosotros. Conviene
> que el cliente inicie el trámite mucho antes de necesitarlo.

### 5.5 Despliegue en el VPS
**Alternativas:** Docker Compose (backend + base de datos + servidor web) · instalación directa.

**Requisito firme:** dominio y **HTTPS** funcionando **antes** de integrar pagos — el aviso de
confirmación de la pasarela necesita una dirección pública alcanzable. En desarrollo se resuelve
con un túnel temporal.

---

## 6. Puntos técnicos que exige el negocio

Lista de control derivada de `01-NEGOCIO.md`:

| Requisito del negocio | Implicancia técnica |
|---|---|
| Matrícula automática al pagar | **Webhook** de la pasarela, procesado de forma **idempotente**: el mismo aviso puede llegar dos veces y la matrícula debe activarse una sola vez |
| Avance del curso | Se conserva la finalización de cada lección y se calcula sobre el conjunto estable de lecciones obligatorias fijado al iniciar. Los materiales complementarios posteriores no cambian el denominador ni reducen avances existentes |
| Certificado instantáneo | Emisión disparada al cumplirse la regla y confirmarse los datos. Puede haber preguntas abiertas, pero ninguna de examen CALIFICADO puede permanecer PENDIENTE_REVISION |
| Certificado privado + QR público | Dos caminos distintos: PDF tras verificación de identidad; página de verificación pública con datos mínimos |
| Persona ≠ usuario | Los datos personales y las credenciales viven en entidades separadas; un docente es persona sin usuario |
| Duplicar módulo | Copia profunda: módulo, lecciones, materiales, exámenes, preguntas y opciones |
| Reglas de certificación configurables | Tres condiciones independientes: exámenes, progreso y asistencia; VIRTUAL no expone asistencia |
| Nota final | Promedio de exámenes CALIFICADO, tomando el mejor intento de cada uno y redondeando convencionalmente a dos decimales antes de comparar umbrales |
| Sesiones en vivo | Sin API de Zoom: el enlace y la grabación los carga el administrador. La asistencia se infiere de quién abre el enlace desde la plataforma, con corrección manual |
| Asistencia de matriculados tardíos | Se calcula solo sobre sesiones posteriores a la fecha de matrícula, no sobre todas las del curso |
| Examen interrumpido | Las respuestas se guardan parcialmente; el intento se retoma mientras no venza el tiempo. El cronómetro corre en el servidor, no en el navegador |
| Recordatorio de sesión | Tarea programada diaria, el único envío no reactivo |
| Nada se borra con gente dentro | Baja lógica en cursos, módulos y lecciones con matrículas o progreso |
| Consentimiento de datos | Se guarda fecha y versión del texto aceptado por cada usuario |
| Zona horaria | Fechas de negocio, vencimientos y tareas programadas usan `America/Lima`, no la zona del servidor |
| Webhook tardío | La idempotencia identifica la operación de Culqi. Un APROBADO iniciado válidamente se respeta tras cierre, plazo o cupo; si curso o matrícula están CANCELADOS, registra pago sin acceso y crea atención externa |
| Emisión programada | `dias_espera` usa días calendario y un proceso ejecuta la emisión a las 00:00 de Lima; una finalización ya obtenida sobrevive a vencimiento o cancelación posteriores |

---

*Escuela Jurídica · Proyecto esejur*
