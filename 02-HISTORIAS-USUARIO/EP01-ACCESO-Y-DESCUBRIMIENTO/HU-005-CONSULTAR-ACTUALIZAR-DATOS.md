# HU-005 — Consultar y actualizar mis datos personales

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Gabriel y Ariana |

## Historia

> Como **alumno**, quiero **consultar y actualizar mis datos**, para **mantener mi información
> personal y confirmar correctamente el nombre que aparecerá en mis certificados**.

## Alcance incluido

- Consulta y edición de nombres, apellido paterno obligatorio, apellido materno opcional, teléfono
  opcional y DNI opcional según permisos definidos.
- El correo se muestra como identidad de la cuenta y no se modifica desde este formulario.
- Registro, edición o eliminación del DNI por decisión del alumno; dejarlo vacío es válido.
- El DNI no se imprime en el certificado ni condiciona el registro, la matrícula, el pago, el
  aprendizaje, las evaluaciones o la certificación.
- Confirmación explícita de nombres y apellidos para certificación, registrada con fecha.
- Posibilidad de confirmar antes o después de completar el curso.
- Una cuenta creada con Google puede definir una contraseña propia desde el perfil sin eliminar el
  acceso con Google ni crear otra cuenta.
- La nueva contraseña debe tener al menos ocho caracteres, una mayúscula, una minúscula, un número
  y un número.
- La fecha y hora de la confirmación de identidad se registran y muestran en `America/Lima`.

No permite cambiar silenciosamente los datos congelados de un certificado ya emitido. Después de
la emisión, solo administración puede corregir nombres mediante una acción con motivo, historial y
conservación del mismo código; editar el perfil no modifica el documento.

## Flujo principal

1. El alumno abre su perfil.
2. Consulta los datos conocidos y completa los faltantes.
3. Guarda el teléfono y el DNI cuando decida proporcionarlos, o los deja vacíos.
4. Cuando confirma los datos de certificación, ESEJUR registra la confirmación.
5. Si su cuenta solo tenía acceso con Google, puede crear una contraseña propia y conservar ambos
   métodos de ingreso.

## Criterios de aceptación

- **Dado** una sesión de alumno, **cuando** actualiza datos válidos, **entonces** vuelve a verlos
  conservados.
- **Dado** teléfono vacío, **cuando** guarda el perfil, **entonces** no se bloquea la operación.
- **Dado** nombres o cualquiera de los dos apellidos incompletos, **cuando** intenta confirmar los datos del certificado,
  **entonces** se indican los faltantes y no se marca confirmado.
- **Dado** un DNI vacío, **cuando** guarda el perfil o confirma sus nombres y apellidos,
  **entonces** ambas operaciones terminan sin bloquearse ni crear una condición pendiente.
- **Dado** un certificado ya emitido, **cuando** cambia el perfil, **entonces** el certificado no se
  recalcula ni cambia automáticamente.
- **Dado** el correo de la cuenta, **cuando** edita el perfil, **entonces** puede consultarlo pero no
  sustituirlo por otro correo desde esta pantalla.
- **Dado** una cuenta de Google, **cuando** intenta definir una contraseña que no cumple todas las
  condiciones mínimas, **entonces** no se guarda y su acceso con Google permanece intacto.

## Privacidad

- Solo el alumno y administración autorizada consultan los datos privados.

## Dependencia interna

- Depende de HU-001 para la sesión.
- Puede adelantarse con una sesión controlada.

## Orientación de trabajo

- **Frontend:** formulario prellenado, teléfono y DNI opcionales, faltantes y confirmación de nombres.
- **Backend:** autorización, conservación y fecha/hora de la última confirmación.
- **Integración:** editar y confirmar sin alterar documentos congelados.

## Demostración esperada

Mostrar edición, teléfono y DNI opcionales, confirmación de nombres registrada y guardado válido
con DNI vacío; comprobar que un certificado emitido conserva su copia histórica.
