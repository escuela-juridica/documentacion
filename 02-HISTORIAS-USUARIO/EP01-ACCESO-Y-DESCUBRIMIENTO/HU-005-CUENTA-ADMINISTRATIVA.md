# HU-005 — Crear y habilitar una cuenta administrativamente

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Actor secundario | Alumno o nuevo Administrador |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **crear una cuenta con acceso temporal**, para **incorporar a una
> persona sin debilitar la verificación y aceptación obligatorias**.

## Alcance incluido

- Correo, nombres y apellidos obligatorios; teléfono opcional.
- Para una cuenta nueva: contraseña temporal `Escuela1415@` y CAMBIO_PENDIENTE.
- Correo con instrucciones, contraseña temporal y verificación.
- Aviso permanente en el panel hasta verificar correo, aceptar documentos y cambiar contraseña.
- Bloqueo de cursos, exámenes y certificados mientras exista una condición pendiente.
- Una cuenta existente conserva su contraseña y no se duplica.
- La matrícula administrativa se realiza en HU-019, no en esta historia.

## Flujo principal

1. Administración busca primero el correo.
2. Si no existe, completa datos y crea la cuenta temporal.
3. ESEJUR envía instrucciones y deja CAMBIO_PENDIENTE.
4. La persona inicia sesión con la clave temporal.
5. Verifica correo, acepta documentos y establece contraseña propia.
6. La cuenta queda habilitada y desaparece el aviso.

## Excepciones

- Correo existente: se reutiliza la cuenta, se conservan clave e historial y no se envía una nueva
  contraseña temporal.
- Teléfono vacío: válido.
- No se permite omitir ninguna de las tres condiciones de habilitación.
- El fallo de correo no marca el correo como verificado.

## Criterios de aceptación

- **Dado** un correo nuevo, **cuando** administración crea la cuenta, **entonces** queda
  CAMBIO_PENDIENTE con la contraseña temporal y recibe instrucciones.
- **Dado** una condición pendiente, **cuando** la persona entra, **entonces** ve el aviso y no abre
  cursos, exámenes ni certificados.
- **Dado** las tres condiciones completas, **cuando** guarda su contraseña propia, **entonces** la
  cuenta queda habilitada.
- **Dado** un correo existente, **cuando** administración lo selecciona, **entonces** no cambia su
  contraseña ni crea duplicados.

## Notificación

- La cuenta nueva recibe un correo de bienvenida con la contraseña temporal, el enlace de
  verificación y los pasos obligatorios para habilitar el acceso.
- Si el envío falla, la cuenta continúa CAMBIO_PENDIENTE y administración puede reenviar las
  instrucciones. No se controla apertura o entrega posterior al envío.

## Dependencia interna

- Depende de HU-001 para probar el ingreso temporal.
- Puede adelantarse si ambos equipos acuerdan CAMBIO_PENDIENTE y cuenta habilitada.

## Orientación de trabajo

- **Frontend:** creación administrativa, aviso persistente y pasos de habilitación.
- **Backend:** búsqueda por correo, contraseña temporal, restricciones y transición de estado.
- **Integración:** crear → recibir instrucciones → entrar restringido → completar → entrar habilitado.

## Demostración esperada

Crear una cuenta nueva y habilitarla; repetir con correo existente para verificar que no se cambia
la contraseña ni se duplica la persona.

