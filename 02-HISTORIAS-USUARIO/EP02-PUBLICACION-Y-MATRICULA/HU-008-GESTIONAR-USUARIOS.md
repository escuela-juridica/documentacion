# HU-008 — Gestionar usuarios administrativamente

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Actor secundario | Alumno o nuevo Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **buscar, crear, consultar y habilitar o deshabilitar usuarios**,
> para **administrar sus accesos sin duplicar cuentas ni perder su historial**.

## Alcance incluido

- Listado y búsqueda de usuarios por nombre o correo, mostrando sus roles, el rol principal,
  origen y estado de cuenta.
- Consulta del detalle de un usuario y de quién concedió el perfil cuando posee rol Administrador.
- Correo, nombres y apellido paterno obligatorios; apellido materno, teléfono y DNI opcionales.
- Para una cuenta nueva: contraseña temporal `Escuela1415@` y condición CAMBIO_PENDIENTE.
- Correo con instrucciones, contraseña temporal y verificación.
- Aviso permanente en el panel hasta verificar correo y cambiar contraseña.
- Bloqueo de cursos, exámenes y certificados mientras exista una condición pendiente.
- Una cuenta existente conserva su contraseña, identidad e historial y no se duplica.
- Una cuenta puede acumular los roles Alumno y Administrador. El primer rol asignado queda como
  principal y una asignación posterior se agrega como secundaria sin cambiarlo.
- Cada cuenta conserva exactamente un rol principal. En esta versión no se elimina roles, no se
  cambia el rol principal y no se ofrece alternar paneles durante la sesión.
- Si se concede a una cuenta existente un rol que todavía no posee, se registra el administrador
  que lo concedió y la fecha y hora. Conceder nuevamente el mismo rol no duplica la asignación.
- La contraseña propia que reemplaza a la temporal debe tener al menos ocho caracteres, una letra
  mayúscula, una letra minúscula y un número.
- La verificación utiliza un código de seis dígitos y de un solo uso. Reenviarlo invalida el código
  anterior y no crea otra cuenta.
- Cualquier administrador habilitado puede crear otra cuenta con rol Administrador. El nuevo
  administrador queda restringido al panel y a completar su habilitación hasta verificar correo y
  reemplazar la contraseña temporal.
- Cada creación con rol Administrador registra quién concedió el perfil, además de fecha y hora.
- Un administrador no puede desactivarse a sí mismo y una operación nunca puede dejar al sistema
  sin al menos un administrador habilitado y activo.
- Una cuenta se deshabilita para impedir nuevos accesos, pero no se elimina ni pierde matrículas,
  pagos, progreso, intentos, certificados o historial relacionados.
- Fechas y horas de creación, verificación y habilitación se registran en `America/Lima`.
- La matrícula administrativa se realiza en HU-019, no en esta historia.

## Flujo principal

1. Administración abre el listado y busca por nombre o correo.
2. Si encuentra la cuenta, consulta su detalle y ejecuta únicamente acciones válidas para su
   estado. Si no existe, abre “Crear usuario”.
3. Completa los datos, selecciona el rol inicial y crea la cuenta temporal. Si la cuenta ya
   existe, puede concederle el rol faltante sin cambiar su contraseña ni su rol principal.
4. ESEJUR envía instrucciones y deja activa la condición CAMBIO_PENDIENTE.
5. La persona inicia sesión con la clave temporal.
6. Verifica correo con el código más reciente y establece contraseña propia.
7. La cuenta queda plenamente operativa y desaparece el aviso.

## Excepciones

- Correo existente: se reutiliza la cuenta, se conservan clave e historial y no se envía una nueva
  contraseña temporal. Si ya posee el rol seleccionado tampoco se duplica la asignación.
- Teléfono vacío: válido.
- DNI vacío: válido; la persona puede registrarlo o editarlo después desde su perfil y nunca es un
  requisito de habilitación o certificación.
- Apellido materno vacío: válido para crear y habilitar la cuenta; deberá completarse posteriormente
  si la persona confirma los datos que se imprimirán en un certificado.
- No se permite omitir ninguna de las dos condiciones de habilitación.
- El fallo de correo no marca el correo como verificado.
- Un código de verificación incorrecto, usado o sustituido por un reenvío no habilita la cuenta.
- La desactivación propia o la desactivación del último administrador activo se rechaza sin
  modificar permisos.

## Criterios de aceptación

- **Dado** un correo nuevo, **cuando** administración crea la cuenta, **entonces** conserva la
  condición CAMBIO_PENDIENTE con la contraseña temporal y recibe instrucciones.
- **Dado** una condición pendiente, **cuando** la persona entra, **entonces** ve el aviso y no abre
  cursos, exámenes ni certificados.
- **Dado** las dos condiciones completas, **cuando** guarda su contraseña propia, **entonces** la
  cuenta queda plenamente operativa.
- **Dado** un correo existente, **cuando** administración lo selecciona, **entonces** no cambia su
  contraseña ni crea duplicados.
- **Dado** una cuenta existente con un solo rol, **cuando** administración le concede el otro,
  **entonces** conserva una sola identidad, agrega el rol secundario, mantiene su rol principal y
  registra quién lo concedió y cuándo.
- **Dado** una cuenta que ya posee el rol solicitado, **cuando** se intenta conceder nuevamente,
  **entonces** no se crea otra asignación ni se altera el rol principal.
- **Dado** apellido materno, teléfono o DNI vacíos, **cuando** se crea la cuenta, **entonces** no se
  bloquea la operación ni se inventa información para esos campos.
- **Dado** un administrador habilitado, **cuando** crea otro administrador, **entonces** la nueva
  cuenta queda CAMBIO_PENDIENTE y no recibe capacidades administrativas completas hasta terminar
  verificación y cambio de contraseña, y queda identificado quién le concedió el rol.
- **Dado** el último administrador activo o el propio administrador autenticado, **cuando** intenta
  desactivarlo, **entonces** ESEJUR impide la operación y conserva al menos un administrador activo.
- **Dado** un código de verificación reenviado, **cuando** usa el anterior, **entonces** se rechaza;
  solo el código más reciente puede utilizarse una vez.
- **Dado** una contraseña propia que incumple alguna condición mínima, **cuando** intenta reemplazar
  la temporal, **entonces** la condición CAMBIO_PENDIENTE se conserva y se indican los requisitos
  faltantes.

## Notificación

- La cuenta nueva recibe un correo de bienvenida con la contraseña temporal, el código de
  verificación y los pasos obligatorios para habilitar el acceso.
- Si el envío falla, la cuenta conserva la condición CAMBIO_PENDIENTE y administración puede reenviar las
  instrucciones. No se controla apertura o entrega posterior al envío.

## Dependencia interna

- Reutiliza HU-001 para probar el ingreso temporal, HU-003 para el código de verificación y HU-005
  para completar datos y definir la contraseña propia.
- Puede adelantarse si los equipos acuerdan la condición booleana activa o inactiva, además de las
  condiciones PENDIENTE_VERIFICACION y CAMBIO_PENDIENTE.

## Orientación de trabajo

- **Frontend:** listado, búsqueda, detalle, creación administrativa, aviso persistente y pasos de
  habilitación.
- **Backend:** búsqueda sin duplicidad, contraseña temporal, asignación no duplicada de roles,
  conservación del rol principal, restricciones, transición de estado y protección para conservar
  al menos un administrador activo.
- **Integración:** crear → recibir instrucciones → entrar restringido → completar → entrar habilitado.

## Demostración esperada

Buscar y consultar usuarios, crear una cuenta nueva y habilitarla; repetir con correo existente
para verificar que no se cambia la contraseña ni se duplica la persona, y demostrar los bloqueos
de deshabilitación administrativa.

