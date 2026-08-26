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

Incluye ingreso con correo y contraseña, reconocimiento del perfil, registro de cada intento de acceso,
mensajes sin revelar información sensible y aplicación de las restricciones de una cuenta creada
por administración. El catálogo y las vistas previas continúan públicos.

La pantalla también presenta “Continuar con Google” y “¿Olvidaste tu contraseña?” como caminos
alternativos. Usarlos no cambia las reglas del acceso con contraseña descrito en esta historia.

No incluye registro, Google ni recuperación de contraseña, que tienen historias propias.

## Precondiciones

- Existe una cuenta vinculada al correo.
- Para acceso completo, correo verificado, documentos aceptados y contraseña definitiva.

## Flujo principal

1. La persona ingresa correo y contraseña.
2. ESEJUR valida las credenciales y el estado de la cuenta.
3. Registra quién intentó acceder, fecha y hora, origen disponible y resultado exitoso o fallido.
4. Redirige al panel de alumno o de administración.

## Alternativas y excepciones

- Credenciales incorrectas: no se inicia sesión y se informa sin confirmar si el correo existe.
- Cuenta con CAMBIO_PENDIENTE: entra solo al panel y cambio de contraseña; el aviso permanente no
  puede ocultarse.
- Cuenta de alumno no habilitada: puede entrar al panel, pero no abrir cursos, exámenes o
  certificados.
- Un visitante puede seguir usando catálogo y vistas previas sin iniciar sesión.

## Criterios de aceptación

### Acceso habilitado

- **Dado** un usuario con credenciales válidas y cuenta habilitada,
- **cuando** inicia sesión,
- **entonces** accede a su panel y se registra el acceso.

### Contraseña temporal

- **Dado** una cuenta CAMBIO_PENDIENTE,
- **cuando** inicia con `Escuela1415@`,
- **entonces** solo ve el panel, el aviso y la opción de completar su habilitación.

### Credenciales inválidas

- **Dado** datos incorrectos,
- **cuando** intenta ingresar,
- **entonces** no obtiene sesión ni información sobre la existencia del correo.

## Estados, permisos y conservación

- Estados relevantes: cuenta habilitada y CAMBIO_PENDIENTE.
- Alumno y administrador acceden a capacidades distintas.
- El docente no posee acceso.
- Cada intento de acceso queda registrado con cuenta cuando pueda identificarse, fecha, hora,
  origen disponible y resultado. Estos registros son privados para administración.
- En esta entrega no se limita la cantidad de sesiones simultáneas de una cuenta; los registros de
  acceso permiten analizar el uso sin bloquear automáticamente a la persona.

## Dependencia interna

- Depende de: ninguna.
- HU-005 y HU-006 necesitan su resultado integrado.

## Orientación de trabajo

- **Frontend:** formulario, estados de carga/error, panel correcto y aviso CAMBIO_PENDIENTE.
- **Backend:** validación, permisos, estado de habilitación y registro de acceso.
- **Integración:** demostrar acceso completo y acceso restringido con dos cuentas controladas.

## Demostración esperada

Ingresar como alumno habilitado, como administrador y como cuenta temporal; comprobar destinos,
restricciones y rechazo de credenciales inválidas.

