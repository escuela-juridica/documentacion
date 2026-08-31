# HU-003 — Verificar mi correo electrónico

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Usuario con correo pendiente |
| Actor secundario | Servicio de correo |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Joel y Juan |
| Prioridad / puntos | Alta / Por estimar |

## Historia

> Como **usuario con correo pendiente**, quiero **confirmarlo mediante el código recibido**, para
> **habilitar mi acceso sin crear otra cuenta**.

## Valor y alcance

Esta historia comienza cuando ya existe una cuenta pendiente creada mediante formulario en HU-002
o administrativamente en HU-008. No crea otra cuenta ni solicita nuevamente todos los datos.

Incluye:

- correo de bienvenida y verificación;
- código numerico de seis dígitos;
- correo parcialmente oculto en pantalla;
- ingresó, validación y reenvio del código;
- resultado correcto, incorrecto, utilizado, reemplazado o envío fallido;
- continuidad hacia el ingresó o hacia los requisitos administrativos que aún falten.

Las cuentas creadas mediante Google no utilizan este recorrido porque Google ya confirmó el
correo.

## Precondiciones

- Existe una sola cuenta con correo pendiente.
- El correo pertenece al usuario que realiza la verificación.
- Para el primer intento existe un código emitido o puede solicitarse un nuevo envío.

## Reglas de verificación

- Solo el código más reciente puede ser válido.
- Cada código se utiliza una sola vez.
- Solicitar un reenvio inválida inmediatamente cualquier código anterior no utilizado.
- Un fallo de envío no convierte el correo en verificado.
- La verificación del correo no sustituye el cambio de una contraseña temporal cuando la cuenta
  fue creada administrativamente.
- Emision, reenvio, uso y resultado se registran con fecha y hora en `America/Lima`.

## Flujo principal

1. La persona llega a PF-005 con su correo parcialmente oculto.
2. Ingresa el código de seis dígitos más reciente.
3. ESEJUR válida que corresponda a la cuenta, siga vigente y no haya sido utilizado o reemplazado.
4. Marca el correo como verificado y consume el código.
5. Si no existen otros requisitos pendientes, permite continuar al inicio de sesión.
6. Si la cuenta fue creada administrativamente y falta cambiar la contraseña temporal, informa el
   siguiente paso sin afirmar que la habilitacion termino.

## Alternativas y excepciones

- Código vacío o incompleto: se solicita completar los seis dígitos.
- Código incorrecto, utilizado o reemplazado: no se verifica y se permite intentar con el vigente.
- Reenvio: se informa el nuevo envío y el código anterior deja de servir.
- Fallo del servicio de correo: la cuenta permanece pendiente y puede reintentarse el envío.
- Intento sobre una cuenta ya verificada: no modifica nuevamente el estado; permite continuar.

## Criterios de aceptación

### Código correcto

- **Dado** el código más reciente, vigente y no utilizado,
- **cuando** la persona lo ingresa correctamente,
- **entonces** el correo queda verificado una sola vez y puede continuar.

### Código anterior

- **Dado** que se solicitó un reenvio,
- **cuando** se ingresa un código anterior,
- **entonces** se rechaza y solo el código más reciente puede utilizarse.

### Código utilizado

- **Dado** un código consumido correctamente,
- **cuando** se intenta utilizar de nuevo,
- **entonces** no genera una segunda verificación ni altera la cuenta.

### Envío fallido

- **Dado** un fallo al enviar o reenviar,
- **cuando** ESEJUR informa el resultado,
- **entonces** el correo permanece pendiente y se ofrece un nuevo intento.

### Cuenta administrativa

- **Dado** una cuenta creada por administración,
- **cuando** verifica correctamente el correo pero conserva otros requisitos pendientes,
- **entonces** ESEJUR muestra esos pasos y no la presenta todavía como completamente habilitada.

## Notificación y conservación

- Se registra si el servicio acepto o rechazo el envío, sin controlar apertura ni entrega final.
- No se expone el código en listados administrativos ni mensajes posteriores.
- La cuenta y sus datos se conservan; reenviar nunca crea otra cuenta.

## Dependencia interna

- Para el registro propio depende de HU-002.
- Para una cuenta administrativa recibe la cuenta de HU-008 en EP02.
- Entrega el correo verificado a HU-001 y, cuando corresponde, al resto de la habilitacion de
  HU-008.

## Orientación de trabajo

- **Frontend:** PF-005, campo de seis dígitos, correo oculto, verificación, reenvio y estados.
- **Backend:** emisión, reemplazó, consumo unico, resultado del envío y cambio del estado del correo.
- **Integración:** HU-002 hacia HU-003 y luego HU-001; HU-008 hacia HU-003 y regreso a su
  habilitacion.

## Demostración esperada

Crear una cuenta por formulario, rechazar un código incorrecto, reenviar, comprobar que el anterior
ya no sirve, verificar con el código más reciente e iniciar sesión sin crear otra cuenta.
