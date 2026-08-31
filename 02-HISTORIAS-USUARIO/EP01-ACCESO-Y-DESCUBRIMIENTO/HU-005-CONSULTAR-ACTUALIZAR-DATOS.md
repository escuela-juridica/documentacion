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
> personal correcta dentro de ESEJUR**.

## Alcance incluido

- Consulta y edición de nombres, apellido paterno obligatorio, apellido materno opcional, teléfono
  opcional y DNI opcional según permisos definidos.
- El correo se muestra como identidad de la cuenta y no se modifica desde este formulario.
- Registro, edición o eliminación del DNI por decisión del alumno; dejarlo vacío es válido.
- El DNI no se imprime en el certificado ni condiciona el registro, la matrícula, el pago, el
  aprendizaje, las evaluaciones o la certificación.
- La confirmación de los datos que se imprimirán en un certificado pertenece a HU-032 de la Épica
  4 y no se registra desde este perfil.
- Una cuenta creada con Google puede definir una contraseña propia desde el perfil sin eliminar el
  acceso con Google ni crear otra cuenta.
- La nueva contraseña debe tener al menos ocho caracteres, una mayúscula, una minúscula, un número
  y debe cumplir las mismas reglas del registro.

La edición del perfil no modifica certificados emitidos. Ese comportamiento se valida cuando las
tablas y el flujo de certificación sean incorporados en la Épica 4.

## Flujo principal

1. El alumno abre su perfil.
2. Consulta los datos conocidos y completa los faltantes.
3. Guarda el teléfono y el DNI cuando decida proporcionarlos, o los deja vacíos.
4. Si su cuenta solo tenía acceso con Google, puede crear una contraseña propia y conservar ambos
   métodos de ingreso.

## Criterios de aceptación

- **Dado** una sesión de alumno, **cuando** actualiza datos válidos, **entonces** vuelve a verlos
  conservados.
- **Dado** teléfono vacío, **cuando** guarda el perfil, **entonces** no se bloquea la operación.
- **Dado** un DNI vacío, **cuando** guarda el perfil,
  **entonces** la operación termina sin bloquearse ni crear una condición pendiente.
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

- **Frontend:** formulario prellenado, teléfono y DNI opcionales y validaciones comprensibles.
- **Backend:** autorización y conservación de los datos personales editables.
- **Integración:** consultar y editar el perfil sin cambiar el correo de acceso.

## Demostración esperada

Mostrar la consulta y edición de nombres, apellidos, teléfono y DNI opcionales; guardar con DNI
vacío y definir una contraseña propia para una cuenta que inicialmente solo utilizaba Google.
