# EP01 — Entregable funcional para la review

## Producto funcional obtenido

Al finalizar la épica queda operativo el **portal público de descubrimiento y acceso de ESEJUR**.
Una persona puede encontrar un curso, revisar su información, crear una cuenta, ingresar y
administrar sus datos sin depender de funciones de las épicas posteriores.

El recorrido que resume el valor entregado es:

> Un visitante entra al portal, encuentra un curso de su interés, consulta su ficha y vista
> previa, se registra, verifica su correo, inicia sesión y completa su perfil.

## Historias incluidas

| Historia | Capacidad que aporta al entregable |
|---|---|
| HU-001 | Inicio de sesión y control de accesos |
| HU-002 | Registro mediante formulario y verificación de correo |
| HU-003 | Registro o ingreso mediante Google |
| HU-004 | Recuperación de contraseña |
| HU-005 | Creación administrativa y habilitación de una cuenta temporal |
| HU-006 | Consulta y actualización de datos personales |
| HU-007 | Catálogo, búsqueda y filtros de cursos |
| HU-008 | Ficha pública y contenido de vista previa |

## Objetivo de la review

Demostrar que los caminos públicos y de autenticación funcionan de forma integrada y que una
persona puede pasar de visitante a usuario identificado. La review debe mostrar resultados
reales en pantalla; no se considera suficiente enseñar formularios aislados, código o diseños.

## Actores de la demostración

- **Visitante:** explora la oferta y crea una cuenta.
- **Alumno:** inicia sesión y administra sus datos.
- **Administrador:** crea una cuenta administrativa para un alumno o para otro administrador.
- **Google:** interviene como alternativa de identidad.
- **Servicio de correo:** permite verificar la cuenta y recuperar la contraseña.

## Preparación previa

Antes de comenzar la review deben existir:

- varios cursos controlados con diferentes modalidades, precios y estados visibles;
- al menos un curso con contenido autorizado para vista previa;
- una cuenta registrada y verificada;
- una cuenta creada con Google;
- una cuenta creada por administración con la contraseña temporal `Escuela1415@`;
- acceso al correo utilizado para mostrar verificación y recuperación;
- una sesión cerrada para iniciar el recorrido como visitante.

Los cursos pueden estar precargados para esta review. Su creación desde administración se
demuestra en la EP02.

## Guion principal de demostración

### 1. Consultar el catálogo

1. Ingresar al portal sin iniciar sesión.
2. Mostrar los cursos mediante tarjetas con su información principal.
3. Buscar un curso y aplicar filtros disponibles.
4. Comparar cursos inmediatos, próximos, en curso, con matrícula cerrada y sin cupos.

**Resultado esperado:** el visitante comprende qué cursos se ofrecen y su disponibilidad real.

### 2. Revisar la ficha y la vista previa

1. Seleccionar un curso desde el catálogo.
2. Mostrar modalidad, precio o gratuidad, promoción válida, fechas cuando correspondan, docente,
   beneficios, temario organizado y demás información pública.
3. Abrir únicamente una lección marcada como vista previa.
4. Intentar acceder a contenido no autorizado.

**Resultado esperado:** la información pública puede consultarse, pero el contenido protegido no
queda expuesto.

### 3. Registrar una cuenta mediante formulario

1. Completar nombres, apellidos, correo y contraseña.
2. Aceptar los documentos públicos aplicables desde sus enlaces.
3. Enviar el registro y mostrar la solicitud de verificación de correo.
4. Verificar el correo e iniciar sesión con la nueva cuenta.

**Resultado esperado:** se crea una sola cuenta válida y queda registrado el consentimiento
aceptado. El DNI no se solicita durante este registro.

### 4. Administrar los datos personales

1. Abrir el perfil de la cuenta autenticada.
2. Completar o actualizar sus datos editables.
3. Mostrar que el correo de acceso se consulta, pero no se modifica desde el perfil.
4. Guardar y volver a abrir el perfil para comprobar la conservación de cambios.

**Resultado esperado:** el alumno controla sus datos sin alterar su identidad de acceso ni datos
que ya hayan quedado congelados en certificados emitidos.

### 5. Ingresar o registrarse con Google

1. Cerrar la sesión actual.
2. Ingresar con una cuenta de Google personal o corporativa.
3. Mostrar los datos obtenidos de Google y el consentimiento registrado.
4. Completar posteriormente los datos que Google no haya entregado.

**Resultado esperado:** Google funciona como camino alternativo hacia una única cuenta, sin crear
duplicados por intentos repetidos.

### 6. Recuperar una contraseña

1. Solicitar recuperación con un correo registrado.
2. Utilizar el enlace recibido y definir una nueva contraseña válida.
3. Iniciar sesión con la nueva contraseña.
4. Comprobar que el enlace utilizado no puede aprovecharse nuevamente.

**Resultado esperado:** el usuario recupera el acceso sin revelar públicamente si otros correos
están registrados.

### 7. Habilitar una cuenta creada por administración

1. Crear la cuenta indicando nombres, apellidos, correo y teléfono opcional; mostrar también la
   creación de otro administrador y el registro de quién concedió ese perfil.
2. Mostrar el aviso enviado al nuevo usuario.
3. Ingresar con la contraseña temporal `Escuela1415@`.
4. Mostrar la advertencia persistente con las tres condiciones: verificar correo, aceptar términos
   y privacidad, y cambiar la contraseña.
5. Completar las tres y comprobar que solo entonces desaparece la advertencia y se habilita el
   acceso. Intentar desactivar al propio administrador y al último habilitado para demostrar ambos
   bloqueos.

**Resultado esperado:** la cuenta administrativa queda habilitada y no conserva de forma
indefinida la contraseña inicial.

## Comprobaciones alternativas durante la review

- Rechazar credenciales incorrectas sin abrir una sesión.
- Impedir el registro duplicado del mismo correo.
- Informar una contraseña que no cumple las condiciones requeridas.
- Mostrar el tratamiento controlado de un correo que no pudo enviarse, sin duplicar la cuenta.
- Impedir que un visitante abra materiales protegidos.
- Registrar el resultado de los intentos de acceso con la información disponible.

## Evidencias que deben conservarse

- capturas o grabación del recorrido completo;
- resultado de verificación y recuperación por correo;
- cuenta creada por formulario, Google y administración;
- evidencia del bloqueo de contenido protegido;
- lista de historias aceptadas y observaciones surgidas en la review.

## Criterios para aceptar el entregable

- Las ocho historias incluidas cumplen sus criterios de aceptación.
- El catálogo y la ficha funcionan sin autenticación.
- Los tres caminos de creación o habilitación de cuenta no producen duplicidad.
- El inicio, cierre y recuperación de acceso funcionan de extremo a extremo.
- Los cambios del perfil se conservan correctamente.
- Los errores mostrados permiten al usuario saber cómo continuar.
- El recorrido puede repetirse sin preparación manual improvisada.

## Límite del entregable

Esta épica no demuestra todavía la creación administrativa de cursos, matrícula, pago, aula
virtual ni certificación. El curso usado aquí sirve para descubrimiento y vista previa; su
publicación y adquisición forman parte de la EP02.

## Mensaje de cierre de la review

> ESEJUR ya permite que una persona descubra su oferta educativa, cree y recupere su cuenta,
> ingrese de manera segura y administre su información personal.
