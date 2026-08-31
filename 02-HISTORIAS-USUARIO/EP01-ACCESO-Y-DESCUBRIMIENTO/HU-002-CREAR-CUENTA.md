# HU-002 — Crear una cuenta con formulario o Google

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Visitante |
| Actor secundario | Google |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Joel y Juan |
| Prioridad / puntos | Alta / Por estimar |

## Historia

> Como **visitante**, quiero **crear una única cuenta mediante formulario o Google**, para
> **identificarme en ESEJUR y matricularme posteriormente**.

## Alcance común

- Nunca se crea más de una cuenta para el mismo correo.
- La aceptación de términos y política de privacidad es obligatoria y conserva versión, fecha y
  hora en `America/Lima`.
- Las páginas vigentes de términos y privacidad pueden consultarse antes de aceptar.
- El apellido materno, teléfono o WhatsApp y documento de identidad son opcionales.
- El documento de identidad vacío no bloquea cuenta, matricula, pago, actividad ni certificado.
- El teléfono se presenta como WhatsApp, pero las notificaciones automáticas se envian por correo.
- El contacto por WhatsApp solo solicita ayuda; no crea una cuenta ni una matricula.

## Creación mediante formulario

- Son obligatorios nombres, apellido paterno, correo, contraseña y confirmacion.
- La contraseña debe tener al menos ocho caracteres, una mayúscula, una minúscula y un número.
- Las dos contraseñas deben coincidir.
- La persona debe aceptar los documentos y superar la protección anti-robot.
- La cuenta se crea con correo pendiente y continua en HU-003.

## Creación mediante Google

- Google puede ser personal o corporativo y entrega correo verificado, nombres, apellidos en el
  formato disponible y foto.
- Si la persona llega desde PF-003 porque su correo Google era nuevo, PF-004 muestra los datos
  disponibles y solicita solamente lo necesario para completar la cuenta.
- Como Google puede entregar los apellidos en un bloque, no se exige separarlos durante este
  paso; se completan antes de emitir un certificado cuando corresponda.
- Google no entrega documento de identidad y este permanece opcional.
- No se envía un código de verificación al correo ya confirmado por Google.
- La cuenta queda habilitada al completar los datos obligatorios y aceptar los documentos.

## Flujo principal mediante formulario

1. El visitante completa sus datos, contraseña y confirmacion.
2. Acepta términos y privacidad y supera la protección anti-robot.
3. ESEJUR válida obligatoriedad, formato y unicidad del correo.
4. Crea una sola cuenta con correo pendiente y registra los consentimientos.
5. Envia la bienvenida con un código de seis dígitos.
6. Conduce a HU-003 para verificar el correo.

## Flujo principal mediante Google

1. El visitante selecciona Google desde la creación de cuenta o llega derivado desde HU-001.
2. Autoriza la identidad y ESEJUR recibe el correo verificado.
3. ESEJUR busca una cuenta con el mismo correo.
4. Si no existe, presenta los datos disponibles y solicita los consentimientos pendientes.
5. Crea y habilita una sola cuenta sin enviar un código de verificación adicional.
6. Permite continuar al panel correspondiente.

## Alternativas y excepciones

- Sin consentimientos o protección anti-robot válida no se crea la cuenta por formulario.
- Autorizacion Google cancelada: no se crea ni modifica una cuenta.
- Correo ya registrado: no se duplica; se orienta al ingresó o recuperacion.
- Correo existente por otro medio: se conserva una sola cuenta y sus accesos pueden vincularse.
- Fallo al enviar el código del registro por formulario: la cuenta permanece pendiente y HU-003
  permite solicitar un nuevo envío.
- Telefono, apellido materno o documento vacíos son validos y no generan tareas pendientes.
- Solicitar ayuda por WhatsApp no sustituye consentimientos ni la posterior habilitacion.

## Criterios de aceptación

### Cuenta mediante formulario

- **Dado** datos validos, consentimientos aceptados y control anti-robot superado,
- **cuando** se envía el formulario,
- **entonces** se crea una sola cuenta pendiente, se guardan los consentimientos y se conduce a
  HU-003.

### Cuenta mediante Google

- **Dado** un correo nuevo verificado por Google,
- **cuando** la persona completa los datos obligatorios y acepta los documentos,
- **entonces** se crea una sola cuenta habilitada sin solicitar verificación adicional.

### Correo existente

- **Dado** un correo ya vinculado a una cuenta,
- **cuando** se intenta crearla por formulario o Google,
- **entonces** no se duplica la cuenta ni se pierde su historial.

### Campos opcionales

- **Dado** apellido materno, teléfono o documento de identidad vacíos,
- **cuando** se crea la cuenta,
- **entonces** la ausencia de esos datos no bloquea el resultado.

### Contraseña propia

- **Dado** una contraseña que no cumple longitud, mayúscula, minúscula y número, o cuya
  confirmacion no coincide,
- **cuando** se intenta registrar,
- **entonces** no se crea la cuenta y se muestran las condiciones pendientes.

### Consentimientos

- **Dado** una creación por formulario o Google,
- **cuando** la persona no acepta términos y privacidad,
- **entonces** la cuenta no queda habilitada para continuar.

### Solicitud asistida

- **Dado** un visitante que selecciona el contacto por WhatsApp,
- **cuando** se abre el canal,
- **entonces** ESEJUR no afirma que la cuenta o matricula ya fue creada.

## Notificaciones

- El registro por formulario envía bienvenida y código; HU-003 controla su uso y reenvio.
- El registro por Google no envía verificación porque el correo ya fue confirmado por Google.
- ESEJUR registra si el envío fue aceptado o fallo, sin seguimiento de apertura o entrega.

## Dependencia interna

- Depende de: ninguna.
- HU-003 necesita una cuenta por formulario pendiente de verificar.
- Se integra con HU-001 para recibir una identidad Google nueva y para el ingresó posterior.

## Orientación de trabajo

- **Frontend:** PF-004 con formulario, alternativa Google, consentimientos, anti-robot, campos
  opcionales, validaciones y estados.
- **Backend:** unicidad, creación por ambos medios, vinculación por correo, consentimiento
  versionado y preparacion de la verificación por formulario.
- **Integración:** formulario hacia HU-003; Google nuevo desde HU-001 hacia PF-004 y panel.

## Demostración esperada

Crear una cuenta mediante formulario y dejarla pendiente para HU-003; crear otra mediante Google
sin verificación adicional; repetir con un correo existente para demostrar que nunca se duplica.
