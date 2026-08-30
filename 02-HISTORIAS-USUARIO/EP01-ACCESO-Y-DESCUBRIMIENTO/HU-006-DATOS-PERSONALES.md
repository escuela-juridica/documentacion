# HU-006 — Administrar mis datos personales

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 1 |
| Personas recomendadas | 1 |
| Responsable | Por asignar |

## Historia

> Como **alumno**, quiero **consultar y actualizar mis datos**, para **mantener mi contacto y
> confirmar correctamente la identidad que aparecerá en mis certificados**.

## Alcance incluido

- Consulta y edición de nombres, apellidos y teléfono opcional según permisos definidos.
- El correo se muestra como identidad de la cuenta y no se modifica desde este formulario.
- Captura de DNI para certificación.
- Confirmación explícita de nombres, apellidos y DNI, registrada con fecha.
- Posibilidad de confirmar antes o después de completar el curso.
- Una cuenta creada con Google puede definir una contraseña propia desde el perfil sin eliminar el
  acceso con Google ni crear otra cuenta.
- La nueva contraseña debe tener al menos ocho caracteres, una mayúscula, una minúscula, un número
  y un carácter especial.
- La fecha y hora de la confirmación de identidad se registran y muestran en `America/Lima`.

No permite cambiar silenciosamente los datos congelados de un certificado ya emitido. Después de
la emisión, solo administración puede corregir nombres mediante una acción con motivo, historial y
conservación del mismo código; editar el perfil no modifica el documento.

## Flujo principal

1. El alumno abre su perfil.
2. Consulta los datos conocidos y completa los faltantes.
3. Guarda el teléfono opcional y demás información editable.
4. Cuando confirma los datos de certificación, ESEJUR registra la confirmación.
5. Si su cuenta solo tenía acceso con Google, puede crear una contraseña propia y conservar ambos
   métodos de ingreso.

## Criterios de aceptación

- **Dado** una sesión de alumno, **cuando** actualiza datos válidos, **entonces** vuelve a verlos
  conservados.
- **Dado** teléfono vacío, **cuando** guarda el perfil, **entonces** no se bloquea la operación.
- **Dado** nombres, apellidos o DNI incompletos, **cuando** intenta confirmar identidad, **entonces**
  se indican los faltantes y no se marca confirmado.
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

- **Frontend:** formulario prellenado, teléfono opcional, faltantes y confirmación de identidad.
- **Backend:** autorización, conservación y fecha/hora de la última confirmación.
- **Integración:** editar y confirmar sin alterar documentos congelados.

## Demostración esperada

Mostrar edición, teléfono opcional, validación de identidad y confirmación registrada; comprobar
que un certificado emitido conserva su copia histórica.
