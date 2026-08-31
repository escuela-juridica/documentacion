# HU-003 — Registrarme o ingresar con Google

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Visitante o Alumno |
| Actor secundario | Google |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **visitante**, quiero **usar mi cuenta de Google**, para **crear o recuperar mi acceso a
> ESEJUR sin mantener una identidad duplicada**.

## Alcance incluido

- Google entrega correo verificado, nombre, apellidos en el formato disponible y foto.
- El botón admite cuentas personales y cuentas corporativas administradas mediante Google
  Workspace; el dominio del correo no cambia el flujo.
- Una cuenta nueva debe aceptar términos y política antes de matricularse; ESEJUR conserva la fecha
  y la versión aceptada.
- Si el correo ya existe por formulario, ambos accesos se vinculan a una sola cuenta.
- No se envía correo de verificación al correo confirmado por Google.
- Como Google puede entregar los apellidos en un solo bloque, no se obliga a separarlos al ingresar;
  se completan como apellido paterno y materno antes de emitir un certificado.
- Google no proporciona el DNI. La persona puede registrarlo posteriormente desde su perfil como
  dato opcional; dejarlo vacío no limita la cuenta ni la certificación.
- Desde su perfil, la persona puede definir una contraseña propia y conservar ambos métodos de
  acceso: Google y correo con contraseña.
- Toda contraseña propia que se defina debe tener como mínimo ocho caracteres, una letra mayúscula,
  una letra minúscula y un número.
- La fecha y hora de aceptación de los documentos se muestran y conservan en `America/Lima`.

## Flujo principal

1. La persona selecciona Google y autoriza la identificación.
2. ESEJUR recibe un correo verificado.
3. Busca una cuenta con el mismo correo.
4. Si existe, vincula el acceso; si no, crea la cuenta con datos disponibles.
5. Solicita los consentimientos pendientes.
6. Inicia la sesión cuando las condiciones quedan completas.

## Excepciones

- Autorización cancelada o inválida: no se crea ni modifica la cuenta.
- Datos faltantes: se solicitan solo los necesarios para completar el perfil.
- Correo coincidente: jamás se crea una segunda cuenta.
- Si la cuenta coincidente está CAMBIO_PENDIENTE, Google puede confirmar el correo, pero la persona
  todavía debe aceptar los documentos y definir una contraseña propia antes de abrir cursos,
  exámenes o certificados.

## Criterios de aceptación

- **Dado** un correo nuevo verificado por Google, **cuando** acepta los documentos, **entonces** se
  crea una sola cuenta habilitada sin correo de verificación adicional.
- **Dado** el mismo correo registrado por formulario, **cuando** usa Google, **entonces** accede a
  la cuenta existente y conserva matrículas, progreso y certificados.
- **Dado** que cancela Google, **cuando** vuelve a ESEJUR, **entonces** no queda una cuenta parcial.
- **Dado** una cuenta creada mediante Google, **cuando** define una contraseña desde su perfil,
  **entonces** puede usar cualquiera de los dos métodos sin crear otra cuenta ni perder historial.
- **Dado** una contraseña propia que no cumple todas las condiciones mínimas, **cuando** intenta
  guardarla, **entonces** se rechaza sin retirar el acceso con Google.
- **Dado** una cuenta creada mediante Google sin DNI, **cuando** usa la plataforma o confirma los
  nombres de su certificado, **entonces** el dato ausente no bloquea ninguna operación.

## Privacidad y conservación

Solo se utilizan los datos autorizados y necesarios. Vincular un acceso no reemplaza el historial
ni los consentimientos existentes.

## Dependencia interna

- Puede desarrollarse en paralelo con HU-001 y HU-002.
- Se integra con HU-001 para el destino posterior al ingreso.

## Orientación de trabajo

- **Frontend:** acción Google, cancelación, consentimientos pendientes y mensajes.
- **Backend:** validar identidad, vincular por correo y evitar duplicidad.
- **Integración:** comprobar cuenta nueva y cuenta previamente creada por formulario.

## Demostración esperada

Ingresar con Google usando un correo nuevo y luego uno ya registrado; demostrar una sola cuenta y
la ausencia del correo de verificación innecesario.

