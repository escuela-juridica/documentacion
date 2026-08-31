# HU-001 — Iniciar sesión

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno o Administrador |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |
| Prioridad / puntos | Alta / Por estimar |

## Historia

> Como **usuario con cuenta**, quiero **iniciar sesión de forma segura**, para **acceder a las
> funciones autorizadas para mi perfil**.

## Valor y alcance

Incluye ingreso con correo y contraseña, reconocimiento del perfil, registro de cada intento de
acceso y mensajes sin revelar información sensible. El catálogo y las vistas previas continúan
públicos.

La pantalla también presenta “Continuar con Google” y “¿Olvidaste tu contraseña?” como caminos
alternativos. Usarlos no cambia las reglas del acceso con contraseña descrito en esta historia.

No incluye registro, Google ni recuperación de contraseña, que tienen historias propias.

## Precondiciones

- Existe una cuenta vinculada al correo.
- Para iniciar una sesión normal, el correo debe estar verificado.

## Flujo principal

1. La persona ingresa correo y contraseña.
2. ESEJUR valida las credenciales y el estado de la cuenta.
3. Registra quién intentó acceder, fecha y hora, origen disponible y resultado exitoso o fallido.
4. Redirige al panel de alumno o de administración.

Todas las fechas y horas visibles o registradas en este flujo se interpretan y muestran en la zona
horaria `America/Lima`.

## Alternativas y excepciones

- Credenciales incorrectas: no se inicia sesión y se informa sin confirmar si el correo existe.
- Cuenta con correo sin verificar: no abre el panel y se dirige al ingreso del código de
  verificación.
- Un visitante puede seguir usando catálogo y vistas previas sin iniciar sesión.

## Criterios de aceptación

### Acceso habilitado

- **Dado** un usuario con credenciales válidas y cuenta habilitada,
- **cuando** inicia sesión,
- **entonces** accede a su panel y se registra el acceso.

### Credenciales inválidas

- **Dado** datos incorrectos,
- **cuando** intenta ingresar,
- **entonces** no obtiene sesión ni información sobre la existencia del correo.

### Hora de los accesos

- **Dado** cualquier intento de inicio de sesión,
- **cuando** ESEJUR registra o muestra su fecha y hora,
- **entonces** utiliza la zona horaria `America/Lima` y no la zona del servidor o del dispositivo.

## Estados, permisos y conservación

- Estados relevantes: cuenta habilitada y correo pendiente de verificar.
- Alumno y administrador acceden a capacidades distintas.
- El docente no posee acceso.
- Cada intento de acceso queda registrado con cuenta cuando pueda identificarse, fecha, hora,
  origen disponible y resultado. Estos registros son privados para administración.
- En esta entrega no se limita la cantidad de sesiones simultáneas de una cuenta; los registros de
  acceso permiten analizar el uso sin bloquear automáticamente a la persona.

## Dependencia interna

- Depende de: ninguna.
- HU-005 necesita su resultado integrado; HU-008 de EP02 reutiliza este ingreso para las cuentas
  temporales.

## Orientación de trabajo

- **Frontend:** formulario, estados de carga/error, panel correcto y desvío a verificación.
- **Backend:** validación, permisos, verificación del correo y registro de acceso.
- **Integración:** demostrar acceso completo y correo pendiente con cuentas controladas.

## Demostración esperada

Ingresar como alumno habilitado y como administrador; comprobar destinos, desvío de un correo sin
verificar y rechazo de credenciales inválidas.

