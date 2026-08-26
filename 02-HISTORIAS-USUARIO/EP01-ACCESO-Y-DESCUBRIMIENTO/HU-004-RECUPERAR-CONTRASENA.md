# HU-004 — Recuperar mi contraseña

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno o Administrador |
| Incremento | Mes 1 |
| Personas recomendadas | 1 |
| Responsable | Por asignar |

## Historia

> Como **usuario que olvidó su contraseña**, quiero **definir una nueva mediante mi correo**, para
> **recuperar el acceso sin depender de administración**.

## Flujo y alcance

1. La persona solicita recuperación e ingresa su correo.
2. ESEJUR muestra una respuesta neutral.
3. Si existe una cuenta aplicable, envía un enlace de recuperación.
4. La persona abre un enlace válido y define una contraseña propia.
5. El enlace utilizado deja de servir y puede iniciar sesión con la nueva contraseña.

## Excepciones

- La respuesta pública no confirma si el correo existe.
- Un enlace inválido, vencido o ya usado no cambia la contraseña.
- Recuperar una cuenta existente no crea otra ni altera matrículas.
- Una cuenta vinculada exclusivamente a Google puede ser orientada a ese ingreso según su estado.

## Criterios de aceptación

- **Dado** una cuenta recuperable, **cuando** solicita y usa un enlace válido, **entonces** puede
  definir una nueva contraseña y el enlace queda consumido.
- **Dado** un correo inexistente, **cuando** solicita recuperación, **entonces** recibe el mismo
  mensaje público sin envío ni revelación.
- **Dado** un enlace inválido, **cuando** intenta usarlo, **entonces** no cambia ninguna credencial.

## Notificación

- Se envía un correo con un enlace temporal para definir una nueva contraseña. El mensaje no revela
  la contraseña anterior ni confirma públicamente si el correo pertenece a una cuenta.
- Un fallo de envío no cambia la contraseña y permite realizar una nueva solicitud. Solo se registra
  éxito o fallo del envío; no se controla si el destinatario abrió el mensaje.

## Dependencia interna

- Ninguna. Puede probarse con una cuenta controlada sin esperar otras historias.

## Orientación de trabajo

- **Frontend:** solicitud, respuesta neutral, nueva contraseña y estados de enlace inválido/usado.
- **Backend:** emisión y consumo del enlace, cambio de credencial y no revelación del correo.
- **Integración:** solicitud → correo de recuperación → nueva contraseña → ingreso; si una sola persona la
  desarrolla, otra revisa sus criterios.

## Demostración esperada

Recuperar una cuenta válida y comprobar que un enlace reutilizado o inválido no funciona.
