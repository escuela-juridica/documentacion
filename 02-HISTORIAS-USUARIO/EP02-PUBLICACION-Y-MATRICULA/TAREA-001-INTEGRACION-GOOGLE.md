# TAREA-001 — Integrar el acceso y la creación de cuenta con Google

## Propósito

Completar en la Épica 2 la integración real con Google retirada del alcance de la Épica 1. La
tarea debe permitir ingresar a una cuenta existente o comenzar la creación de una cuenta nueva,
sin duplicar usuarios ni reemplazar su información o historial.

No debe presentarse Google como funcional hasta que este recorrido esté integrado y probado de
extremo a extremo.

## Alcance funcional

- Mostrar “Continuar con Google” en acceso y registro únicamente cuando la integración esté
  disponible; mientras tanto debe ocultarse o identificarse como próxima, sin simular éxito.
- Permitir que la persona autorice su identidad mediante Google.
- Validar en el servidor la identidad recibida y obtener un correo verificado.
- Buscar la cuenta ESEJUR mediante el correo normalizado, sin distinguir mayúsculas y minúsculas.
- Si la cuenta existe y está habilitada, iniciar sesión sobre esa misma cuenta.
- Si no existe, abrir la creación de cuenta con los datos autorizados por Google y solicitar los
  datos obligatorios faltantes.
- Exigir la casilla de conformidad con los términos y la política antes de crear una cuenta nueva.
- Considerar verificado el correo confirmado por Google; no enviar el código de HU-003.
- Mantener opcionales el apellido materno, teléfono y documento de identidad.
- Crear la sesión con el mismo mecanismo seguro utilizado por el acceso con contraseña.
- Conservar roles, matrículas, pagos, progreso, intentos y certificados de una cuenta existente.

## Reglas obligatorias

1. Un mismo correo identifica una sola cuenta ESEJUR, independientemente del medio de acceso.
2. Google no crea automáticamente una cuenta incompleta.
3. Una identidad nueva debe pasar por la confirmación de datos y la casilla legal.
4. La cancelación, rechazo o fallo de Google no crea, vincula ni modifica una cuenta.
5. Una cuenta deshabilitada no puede ingresar mediante Google.
6. No se solicita contraseña ni código de verificación a una cuenta creada solo con Google.
7. Vincular Google no reemplaza datos personales ya conservados por ESEJUR.
8. El backend debe verificar el resultado de Google; un correo enviado por el navegador no prueba
   la identidad de la persona.
9. Los errores no deben revelar información sensible de otras cuentas.

## Flujo A — Cuenta existente

1. La persona selecciona “Continuar con Google”.
2. Google solicita autorización y devuelve el resultado de identidad.
3. ESEJUR valida el resultado en el servidor y obtiene el correo verificado.
4. ESEJUR encuentra una cuenta habilitada con ese correo.
5. ESEJUR vincula o reconoce la identidad Google sin crear otro usuario.
6. Se crea la sesión y se abre el panel del rol principal.

## Flujo B — Identidad Google nueva

1. La persona autoriza su identidad Google.
2. ESEJUR valida que el correo no corresponde a una cuenta.
3. Se abre el registro con los datos autorizados disponibles.
4. La persona revisa o completa los datos obligatorios y marca la casilla legal.
5. ESEJUR vuelve a comprobar la unicidad del correo antes de guardar.
6. Se crea una sola cuenta con correo verificado.
7. Se inicia la sesión sin ejecutar HU-003.

## Alternativas y excepciones

- Autorización cancelada: volver al origen sin crear datos.
- Resultado inválido, vencido o emitido para otra aplicación: rechazar el acceso.
- Correo ausente o no verificado por Google: no iniciar sesión ni crear cuenta.
- Cuenta existente deshabilitada: impedir el ingreso y no reactivarla.
- Correo registrado durante el recorrido: reutilizar la cuenta válida sin duplicarla.
- Fallo de conexión: informar que Google no está disponible y permitir el acceso tradicional.
- Datos obligatorios incompletos o casilla legal sin marcar: conservar el formulario sin crear la
  cuenta.
- Cuenta sin contraseña propia: permitir crearla posteriormente desde el perfil.

## Trabajo de frontend

- Integrar el botón de Google en acceso y registro.
- Mostrar carga y evitar envíos repetidos durante la autorización.
- Manejar cancelación, indisponibilidad y rechazo sin perder el contexto.
- Enviar al backend el resultado de Google acordado; nunca un correo editable como prueba.
- Precargar los datos autorizados y permitir completar los faltantes.
- Mantener disponible el camino con correo y contraseña.
- Retirar los mensajes temporales de “integración pendiente” al aceptar la tarea.

## Trabajo de backend

- Configurar las credenciales de Google por entorno, sin secretos en el repositorio.
- Validar autenticidad, destinatario, emisor, vigencia y correo verificado.
- Resolver transaccionalmente la búsqueda, vinculación o creación para impedir duplicados.
- Mantener opcional la contraseña para cuentas creadas exclusivamente con Google.
- Emitir la sesión mediante la cookie segura utilizada por ESEJUR.
- Responder de forma controlada para cuenta existente, creación pendiente, cuenta deshabilitada,
  autorización inválida y conflicto de correo.

## Pruebas necesarias

- Ingreso con Google a una cuenta habilitada.
- Reutilización de una cuenta creada por formulario con el mismo correo.
- Derivación de una identidad nueva hacia el registro.
- Creación con Google sin código adicional de verificación.
- Rechazo de resultados inválidos, vencidos, dirigidos a otra aplicación o sin correo verificado.
- Cancelación sin cambios persistidos.
- Bloqueo de una cuenta deshabilitada.
- Solicitudes simultáneas con el mismo correo sin duplicidad.
- Consulta de la sesión creada y conservación del acceso tradicional.

## Criterios de aceptación

### Cuenta existente

- **Dado** un correo verificado por Google perteneciente a una cuenta habilitada,
- **cuando** la persona autoriza el acceso,
- **entonces** inicia sesión en esa misma cuenta sin crear otra identidad.

### Cuenta nueva

- **Dado** un correo verificado por Google que no existe en ESEJUR,
- **cuando** la persona completa los datos obligatorios y marca la casilla legal,
- **entonces** se crea una sola cuenta habilitada sin solicitar HU-003.

### Autorización rechazada

- **Dado** un resultado cancelado, inválido o no verificable,
- **cuando** ESEJUR intenta procesarlo,
- **entonces** no crea sesión, cuenta ni vinculación y mantiene disponible el acceso tradicional.

### Cuenta no disponible

- **Dado** que el correo pertenece a una cuenta deshabilitada,
- **cuando** se intenta ingresar,
- **entonces** se rechaza el acceso sin duplicar ni reactivar la cuenta.

### Idempotencia

- **Dadas** solicitudes repetidas o simultáneas para el mismo correo,
- **cuando** ESEJUR las procesa,
- **entonces** conserva una sola cuenta y una sola vinculación Google.

## Dependencias

- Reutiliza acceso, sesión y roles de HU-001.
- Reutiliza formulario, casilla legal y unicidad de HU-002.
- No utiliza HU-003 porque Google confirma el correo.
- Reutiliza la creación de contraseña desde el perfil de HU-005.
- Puede desarrollarse en paralelo con HU-008 y HU-009 de la Épica 2.
- No bloquea publicación ni matrícula, pero sí bloquea presentar Google como funcional.

## Fuera de alcance

- Importar contactos, calendario, archivos u otros datos de Google.
- Usar Google para asignar roles, matrículas o permisos.
- Cambiar entre varias cuentas Google dentro de una sesión.
- Sustituir el acceso tradicional con correo y contraseña.

## Resultado demostrable

Una persona ingresa con Google a su cuenta existente o completa una cuenta nueva sin duplicidad,
sin verificación innecesaria y conservando el mismo perfil e historial.
