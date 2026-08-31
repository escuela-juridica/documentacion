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
| HU-001 | Inicio de sesión con correo o Google y control de accesos |
| HU-002 | Creación de una cuenta mediante formulario o Google |
| HU-003 | Verificación del correo mediante código |
| HU-004 | Recuperación del acceso a la cuenta |
| HU-005 | Consulta y actualización de datos personales |
| HU-006 | Catálogo, búsqueda y filtros de cursos |
| HU-007 | Ficha pública y contenido de vista previa |

## Objetivo de la review

Demostrar que los caminos públicos y de autenticación funcionan de forma integrada y que una
persona puede pasar de visitante a usuario identificado. La review debe mostrar resultados
reales en pantalla; no se considera suficiente enseñar formularios aislados, código o diseños.

## Actores de la demostración

- **Visitante:** explora la oferta y crea una cuenta.
- **Alumno:** inicia sesión y administra sus datos.
- **Administrador:** inicia sesión por el acceso correspondiente a su rol.
- **Google:** interviene como alternativa de identidad.
- **Servicio de correo:** permite verificar la cuenta y recuperar la contraseña.

## Preparación previa

Antes de comenzar la review deben existir:

- varios cursos controlados con diferentes modalidades, precios y estados visibles;
- al menos un curso con contenido autorizado para vista previa;
- una cuenta registrada y verificada;
- una cuenta creada con Google;
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

### 3. Crear una cuenta mediante formulario

1. Completar nombres, apellido paterno, correo y contraseña; decidir si se registran el apellido
   materno, teléfono y DNI opcionales.
2. Aceptar los documentos públicos aplicables desde sus enlaces.
3. Enviar el registro y comprobar que la cuenta queda pendiente sin duplicarse.
4. Abrir PF-005, ingresar el código más reciente y verificar el correo.
5. Iniciar sesión con la nueva cuenta.

**Resultado esperado:** se crea una sola cuenta válida y queda registrado el consentimiento
aceptado. El DNI puede registrarse, pero dejarlo vacío no impide completar el flujo.

### 4. Administrar los datos personales

1. Abrir el perfil de la cuenta autenticada.
2. Completar o actualizar sus datos editables.
3. Registrar, editar o retirar el DNI opcional y comprobar que dejarlo vacío es válido.
4. Mostrar que el correo de acceso se consulta, pero no se modifica desde el perfil.
5. Guardar y volver a abrir el perfil para comprobar la conservación de cambios.

**Resultado esperado:** el alumno controla sus datos sin alterar su identidad de acceso ni datos
que ya hayan quedado congelados en certificados emitidos.

### 5. Ingresar o crear una cuenta con Google

1. Cerrar la sesión actual.
2. Ingresar con una cuenta de Google ya vinculada y comprobar que abre la cuenta existente.
3. Repetir con un correo Google nuevo y mostrar el traslado desde PF-003 hacia PF-004.
4. Revisar los datos autorizados, aceptar los documentos y completar la creación.
5. Comprobar que Google no solicita el código de HU-003 porque ya confirmó el correo.

**Resultado esperado:** Google permite ingresar a una cuenta existente o completar una cuenta
nueva en PF-004, sin duplicados ni verificación innecesaria.

### 6. Recuperar una contraseña

1. Solicitar recuperación con un correo registrado.
2. Utilizar el enlace recibido y definir una nueva contraseña válida.
3. Iniciar sesión con la nueva contraseña.
4. Comprobar que el enlace utilizado no puede aprovecharse nuevamente.

**Resultado esperado:** el usuario recupera el acceso sin revelar públicamente si otros correos
están registrados.

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
- cuenta creada por formulario y Google;
- evidencia del bloqueo de contenido protegido;
- lista de historias aceptadas y observaciones surgidas en la review.

## Criterios para aceptar el entregable

- Las siete historias incluidas cumplen sus criterios de aceptación.
- El catálogo y la ficha funcionan sin autenticación.
- Los caminos de creación por formulario y Google no producen duplicidad.
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
