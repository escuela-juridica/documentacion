# HU-004 — Recuperar el acceso a mi cuenta

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno o Administrador |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Gabriel y Ariana |

## Historia

> Como **usuario que olvidó su contraseña**, quiero **definir una nueva mediante mi correo**, para
> **recuperar el acceso sin depender de administración**.

## Flujo y alcance

1. La persona solicita recuperación e ingresa su correo.
2. ESEJUR muestra una respuesta neutral.
3. Si existe una cuenta aplicable, envía un enlace de recuperación.
4. La persona abre un enlace válido y define una contraseña propia de al menos ocho caracteres,
   con mayúscula, minúscula y número.
5. El enlace utilizado deja de servir y puede iniciar sesión con la nueva contraseña.

El enlace vence 60 minutos después de emitirse. Una nueva solicitud invalida todos los enlaces de
recuperación anteriores de esa cuenta; usar correctamente uno también invalida cualquier otro que
continuara pendiente. Emisión y vencimiento se interpretan en `America/Lima`.

## Excepciones

- La respuesta pública no confirma si el correo existe.
- Un enlace inválido, vencido o ya usado no cambia la contraseña.
- Una nueva solicitud invalida el enlace anterior aunque sus 60 minutos todavía no hayan terminado.
- Recuperar una cuenta existente no crea otra ni altera matrículas.
- Una cuenta vinculada exclusivamente a Google puede ser orientada a ese ingreso según su estado.

## Criterios de aceptación

- **Dado** una cuenta recuperable, **cuando** solicita y usa un enlace válido, **entonces** puede
  definir una nueva contraseña y el enlace queda consumido.
- **Dado** un correo inexistente, **cuando** solicita recuperación, **entonces** recibe el mismo
  mensaje público sin envío ni revelación.
- **Dado** un enlace inválido, **cuando** intenta usarlo, **entonces** no cambia ninguna credencial.
- **Dado** un enlace emitido hace más de 60 minutos, **cuando** intenta usarlo, **entonces** se
  rechaza y puede solicitar uno nuevo.
- **Dado** dos solicitudes de recuperación, **cuando** usa el enlace de la primera, **entonces** se
  rechaza porque solo el enlace más reciente puede continuar vigente.
- **Dado** una nueva contraseña sin alguna condición mínima, **cuando** intenta confirmarla,
  **entonces** no cambia la credencial y se explica qué requisito falta.

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
