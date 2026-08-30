# HU-002 — Registrarme mediante formulario

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Visitante |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |
| Prioridad / puntos | Alta / Por estimar |

## Historia

> Como **visitante**, quiero **crear una cuenta con mis datos y verificar mi correo**, para
> **matricularme posteriormente sin intervención administrativa**.

## Alcance incluido

- Correo, nombres y apellidos separados; teléfono o WhatsApp opcional y DNI opcional.
- El visitante decide si registra su DNI. Dejarlo vacío no impide crear o habilitar la cuenta ni
  condiciona ninguna matrícula, pago, actividad académica o certificado.
- El teléfono se muestra al visitante con la etiqueta “WhatsApp”, pero las notificaciones
  automáticas del sistema se envían por correo; no se envían avisos automáticos por WhatsApp.
- Contraseña elegida por la persona y un segundo ingreso que debe coincidir antes de guardar.
- La contraseña propia debe tener como mínimo ocho caracteres e incluir al menos una letra
  mayúscula, una letra minúscula, un número y un carácter especial.
- Aceptación obligatoria de términos y política, conservando versión y fecha.
- Política de privacidad y términos y condiciones existen como páginas públicas enlazadas desde el
  pie de la plataforma. El visitante puede leerlas antes de aceptarlas.
- Protección anti-robot.
- Correo de bienvenida y verificación.
- En la misma pantalla se ofrece un botón de WhatsApp con el mensaje “Contáctanos para que creemos
  una cuenta por ti”. Este botón solo abre el canal de contacto para solicitar atención; la cuenta
  se crea posteriormente por el flujo administrativo y no queda creada al presionarlo.
- Reutilización de la cuenta si el correo ya corresponde a un acceso con Google; nunca duplicarla.

## Flujo principal

1. El visitante completa los datos, acepta documentos y supera la protección anti-robot.
2. ESEJUR valida obligatoriedad, formato, unicidad del correo y contraseña.
3. Crea la cuenta todavía no habilitada y registra los consentimientos.
4. Envía el correo de bienvenida/verificación.
5. La persona abre el enlace y el correo queda verificado.
6. La cuenta queda habilitada cuando todas las condiciones están completas.

El enlace de verificación es válido durante 24 horas desde su emisión. Solicitar un nuevo envío
invalida inmediatamente cualquier enlace de verificación anterior que todavía no se haya usado.
Las fechas y horas de registro, consentimiento, emisión y vencimiento se muestran en
`America/Lima`.

## Alternativas y excepciones

- Sin aceptación o protección anti-robot válida no se crea la cuenta.
- Teléfono vacío es válido.
- DNI vacío es válido y no genera una tarea pendiente posterior.
- Un correo ya registrado no produce una segunda cuenta; se orienta al ingreso o recuperación.
- Si existe por Google, se vincula el acceso por formulario a la misma cuenta.
- Un fallo al enviar la verificación no convierte el correo en verificado.
- Un enlace de verificación vencido, utilizado o invalidado por un reenvío no verifica la cuenta;
  la persona puede solicitar uno nuevo sin crear otra cuenta.
- Solicitar ayuda por WhatsApp no evita la verificación del correo, la aceptación de documentos ni
  el cambio de contraseña que correspondan a una cuenta creada por administración.

## Criterios de aceptación

### Registro correcto

- **Dado** datos válidos, consentimientos aceptados y control anti-robot superado,
- **cuando** se registra,
- **entonces** existe una sola cuenta, se guardan versión/fecha de aceptación y se envía la
  verificación.
- **Dado** el formulario de registro, **cuando** el visitante deja vacío el DNI, **entonces** puede
  crear y verificar la cuenta con normalidad; los enlaces públicos permiten consultar la versión
  vigente de términos y privacidad.
- **Dado** que el visitante decide proporcionar el DNI, **cuando** completa y envía el formulario,
  **entonces** el dato queda registrado como información personal opcional y puede consultarse o
  editarse posteriormente desde su perfil.

### Verificación pendiente

- **Dado** una cuenta sin correo verificado,
- **cuando** intenta usar una matrícula de autoservicio,
- **entonces** no puede continuar y se le indica cómo verificar.

### Correo existente

- **Dado** un correo ya vinculado,
- **cuando** se intenta registrar nuevamente,
- **entonces** no se duplica la persona ni la cuenta.

### Contraseña propia

- **Dado** el registro por formulario,
- **cuando** las dos contraseñas coinciden pero no tienen ocho caracteres, mayúscula, minúscula,
  número y carácter especial,
- **entonces** la cuenta no se crea y se indican las condiciones faltantes.

### Vigencia de verificación

- **Dado** un enlace de verificación emitido,
- **cuando** se usa dentro de las 24 horas y no fue reemplazado,
- **entonces** puede verificar el correo una sola vez.
- **Dado** que se solicita un reenvío,
- **cuando** se intenta usar un enlace anterior,
- **entonces** se rechaza y solo el enlace más reciente permanece vigente.

### Solicitud de cuenta asistida

- **Dado** un visitante que no desea registrarse por sí mismo,
- **cuando** selecciona el botón de WhatsApp,
- **entonces** se abre el canal de contacto con la Escuela sin crear una cuenta ni afirmar que ya
  quedó matriculado.

## Notificación

- Se envía un correo de bienvenida y verificación. No habilita la cuenta por sí solo: la persona
  debe abrir y confirmar el enlace recibido.
- ESEJUR registra si el envío fue aceptado o falló, sin seguimiento de apertura o entrega. Si falla,
  la cuenta permanece sin verificar y debe poder solicitarse un nuevo envío.

## Dependencia interna

- No depende de otra historia para desarrollarse.
- Se integra con HU-001 para demostrar el ingreso posterior.

## Orientación de trabajo

- **Frontend:** formulario, consentimiento visible, teléfono y DNI opcionales, validaciones y confirmación.
- **Backend:** unicidad, protección anti-robot, consentimiento versionado y verificación de correo.
- **Integración:** registro → correo → verificación → inicio de sesión.

## Demostración esperada

Crear una cuenta válida, comprobar el bloqueo previo a verificar, verificar el correo e ingresar;
repetir con correo existente para demostrar que no se duplica.
