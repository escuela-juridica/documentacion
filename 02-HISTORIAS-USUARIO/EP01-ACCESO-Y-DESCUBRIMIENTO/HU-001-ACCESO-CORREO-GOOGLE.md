# HU-001 — Iniciar sesión con correo o Google

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno o Administrador |
| Actor secundario | Google |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Gabriel y Ariana |
| Prioridad / puntos | Alta / Por estimar |

## Historia

> Como **usuario con cuenta**, quiero **iniciar sesión mediante correo y contraseña o mediante
> Google**, para **acceder a las funciones autorizadas para mi perfil sin crear otra identidad**.

## Valor y alcance

La historia ofrece dos medios para ingresar a una cuenta existente:

- correo y contraseña propia;
- una cuenta personal o corporativa de Google vinculada al mismo correo.

Ambos medios conducen a una sola cuenta y conservan sus matrículas, avances, pagos y certificados.
La pantalla también ofrece acceso al registro y a la recuperacion de contraseña, pero esos
recorridos pertenecen a HU-002 y HU-004.

Si Google confirma un correo que aún no corresponde a una cuenta ESEJUR, no se crea una cuenta
incompleta desde esta historia: la persona es enviada a HU-002 para revisar sus datos y aceptar los
documentos requeridos.

## Precondiciones

- Existe una cuenta vinculada al correo utilizado.
- Para un ingresó normal mediante correo y contraseña, el correo ya fue verificado.
- Para ingresar con Google, Google entrega un correo verificado y la autorización es válida.

## Flujo principal con correo y contraseña

1. La persona ingresa su correo y contraseña.
2. ESEJUR válida las credenciales y el estado de la cuenta.
3. Registra la fecha, hora, origen disponible y resultado del intento.
4. Abre el panel correspondiente al alumno o administrador.

## Flujo principal con Google

1. La persona selecciona "Continuar con Google" y autoriza su identidad.
2. ESEJUR recibe el correo verificado y busca una cuenta con ese mismo correo.
3. Si la cuenta existe, vincula o reconoce el acceso sin duplicarla.
4. Registra el intento y abre el panel autorizado.
5. Si la cuenta no existe, conserva los datos autorizados durante el recorrido y conduce a HU-002
   para completar la creación de cuenta.

Todas las fechas y horas visibles o registradas se interpretan y muestran en `America/Lima`.

## Alternativas y excepciones

- Credenciales incorrectas: no se inicia sesión y no se confirma si el correo existe.
- Correo pendiente de verificar: no se abre el panel y se dirige a HU-003.
- Autorizacion de Google cancelada o inválida: no se crea, vincula ni modifica una cuenta.
- Correo de Google nuevo: se dirige a HU-002; no se crea una cuenta parcial.
- Correo de Google coincidente: se utiliza la cuenta existente y se conserva todo su historial.
- Cuenta con habilitacion pendiente: se informa el requisito pendiente antes de permitir acceso a
  cursos, examenes o certificados.
- Un visitante puede consultar el catalogo y las vistas previas sin iniciar sesión.

## Criterios de aceptación

### Acceso mediante contraseña

- **Dado** un usuario con credenciales válidas, correo verificado y cuenta habilitada,
- **cuando** inicia sesión,
- **entonces** accede a su panel y queda registrado el intento.

### Acceso mediante Google existente

- **Dado** un correo de Google vinculado a una cuenta ESEJUR,
- **cuando** la persona autoriza el acceso,
- **entonces** ingresa a esa misma cuenta sin duplicar su identidad ni historial.

### Google sin cuenta existente

- **Dado** un correo verificado por Google que no existe en ESEJUR,
- **cuando** se intenta ingresar,
- **entonces** se abre la creación de cuenta de HU-002 con los datos disponibles y no se deja una
  cuenta parcial.

### Acceso rechazado

- **Dado** credenciales incorrectas o una autorización de Google cancelada,
- **cuando** se intenta ingresar,
- **entonces** no se obtiene una sesión ni información sensible sobre otras cuentas.

### Correo pendiente

- **Dado** una cuenta creada por formulario cuyo correo no está verificado,
- **cuando** intenta ingresar,
- **entonces** se conduce a HU-003 para ingresar o reenviar el código.

### Registro horario

- **Dado** cualquier intento de acceso,
- **cuando** ESEJUR registra o muestra su fecha y hora,
- **entonces** utiliza `America/Lima`.

## Estados, permisos y conservación

- Estados relevantes: cuenta habilitada, correo pendiente y habilitacion pendiente.
- Alumno y administrador reciben capacidades diferentes; el docente no posee acceso propio.
- Cada intento queda registrado con cuenta cuando pueda identificarse, fecha, hora, origen
  disponible y resultado.
- Los registros de acceso son privados para administración.
- No se limita automáticamente la cantidad de sesiones simultáneas.
- Vincular Google nunca reemplaza datos, consentimientos ni historial existentes.

## Dependencia interna

- Depende de: ninguna.
- Entrega una sesión válida a HU-005.
- Se integra con HU-002 cuando Google identifica un correo nuevo y con HU-003 cuando el correo de
  una cuenta por formulario sigue pendiente.
- HU-008 de EP02 reutiliza este ingresó para las cuentas creadas administrativamente.

## Orientación de trabajo

- **Frontend:** pantalla de acceso, correo y contraseña, alternativa Google, carga, errores y
  destinos por estado.
- **Backend:** validación de credenciales, identidad Google, vinculación por correo, permisos y
  registro de intentos.
- **Integración:** demostrar correo y contraseña, Google existente, Google nuevo, correo pendiente
  y rechazo de acceso.

## Demostración esperada

Ingresar como alumno y administrador mediante correo; ingresar con una cuenta Google existente;
mostrar que un correo Google nuevo conduce a HU-002; comprobar el desvío a HU-003 y el rechazo de
credenciales inválidas.

