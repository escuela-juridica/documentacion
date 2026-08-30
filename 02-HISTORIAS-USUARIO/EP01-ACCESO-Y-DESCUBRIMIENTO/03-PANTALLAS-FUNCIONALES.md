# EP01 — Pantallas funcionales para la review

## Cantidad

La épica incorpora **11 pantallas principales nuevas**. En su review se muestran las once porque
no depende visualmente de pantallas construidas en otra épica.

## Pantallas principales

### PF-001 — Inicio y catálogo de cursos

- **Historias:** HU-007.
- **Actor:** visitante y alumno.
- **Debe mostrar:** oferta de cursos, búsqueda, filtros, tarjetas con nombre, imagen, modalidad,
  precio o gratuidad y disponibilidad.
- **Estados importantes:** inmediato, próximo, en curso, matrícula cerrada, sin cupos y sin
  resultados de búsqueda.
- **Acción para la review:** buscar, filtrar y abrir un curso.

### PF-002 — Ficha pública y vista previa del curso

- **Historias:** HU-008.
- **Actor:** visitante y alumno.
- **Debe mostrar:** información comercial, modalidad, precio y promoción vigente, fechas cuando
  correspondan, docente, beneficios, temario, duración disponible y lecciones de vista previa.
- **Estados importantes:** curso virtual, en vivo, híbrido, gratuito, sin cupos, contenido
  protegido y promoción vencida.
- **Acción para la review:** abrir una vista previa e intentar acceder a una lección protegida.

### PF-003 — Inicio de sesión

- **Historias:** HU-001 y HU-003.
- **Actor:** alumno y administrador.
- **Debe mostrar:** correo, contraseña, acción de ingreso, “Continuar con Google”, acceso al
  registro y recuperación de contraseña.
- **Estados importantes:** credenciales inválidas, cuenta no habilitada, cambio de contraseña
  pendiente e ingreso correcto por rol.
- **Acción para la review:** ingresar como alumno y como administrador.

### PF-004 — Registro mediante formulario

- **Historias:** HU-002 y HU-003.
- **Actor:** visitante.
- **Debe mostrar:** nombres, apellidos, correo, teléfono opcional, contraseña, aceptación de
  documentos, alternativa de Google y contacto por WhatsApp para creación administrativa.
- **Estados importantes:** correo existente, contraseña inválida, consentimientos faltantes y
  registro enviado.
- **Acción para la review:** crear una cuenta sin solicitar DNI.

### PF-005 — Resultado de verificación del correo

- **Historias:** HU-002.
- **Actor:** visitante registrado.
- **Debe mostrar:** verificación exitosa, enlace inválido o vencido y acción para continuar al
  ingreso o solicitar un nuevo aviso.
- **Acción para la review:** abrir el enlace válido y habilitar la cuenta.

### PF-006 — Solicitud de recuperación de contraseña

- **Historias:** HU-004.
- **Actor:** visitante.
- **Debe mostrar:** correo y una confirmación neutral que no revele si la cuenta existe.
- **Estados importantes:** solicitud procesada, dato inválido y fallo controlado del correo.
- **Acción para la review:** solicitar la recuperación.

### PF-007 — Definición de nueva contraseña

- **Historias:** HU-004.
- **Actor:** usuario con enlace válido.
- **Debe mostrar:** nueva contraseña, confirmación, condiciones requeridas y resultado del cambio.
- **Estados importantes:** enlace válido, utilizado o vencido; contraseñas diferentes.
- **Acción para la review:** cambiar la contraseña e ingresar con ella.

### PF-008 — Panel inicial del usuario

- **Historias:** HU-001 y HU-005.
- **Actor:** alumno y administrador.
- **Debe mostrar:** identidad de la sesión, navegación permitida y aviso persistente si utiliza la
  contraseña temporal. En administrador, la barra lateral muestra Dashboard, Cursos, Usuarios,
  Matrículas y pagos, Operación académica, Certificados, Reclamaciones, Reportes y Configuración.
- **Estados importantes:** alumno no habilitado, cambio pendiente y sesión normal.
- **Acción para la review:** ingresar con `Escuela1415@` y mostrar la advertencia.

### PF-009 — Mi perfil, datos y seguridad

- **Historias:** HU-005 y HU-006.
- **Actor:** alumno y administrador.
- **Debe mostrar:** datos personales editables, correo de acceso de solo lectura y sección para
  definir o cambiar contraseña.
- **Estados importantes:** cuenta creada por formulario, Google o administración; datos
  incompletos y guardado correcto.
- **Acción para la review:** actualizar datos y reemplazar la contraseña temporal.

### PF-010 — Gestión administrativa de usuarios

- **Historias:** HU-005.
- **Actor:** administrador.
- **Debe mostrar:** búsqueda o selección de usuarios, datos principales, estado de cuenta y acción
  de creación administrativa con rol Alumno o Administrador y quién concedió el perfil.
- **Estados importantes:** correo duplicado, teléfono omitido, cuenta creada, correo fallido,
  habilitación incompleta, auto-desactivación bloqueada y último administrador protegido.
- **Acción para la review:** crear una cuenta con teléfono opcional y contraseña temporal; mostrar
  que correo, documentos y nueva contraseña son las tres condiciones de habilitación.

### PF-011 — Documentos legales públicos

- **Historias:** HU-002.
- **Actor:** visitante y usuario.
- **Debe mostrar:** política de privacidad y términos vigentes en secciones o pestañas accesibles
  desde el registro y el pie de página.
- **Acción para la review:** abrir ambos documentos sin abandonar definitivamente el registro.

## Elementos que no cuentan como pantallas adicionales

- selector externo de cuentas de Google;
- formulario emergente para crear una cuenta desde PF-010;
- alerta persistente de contraseña temporal;
- mensajes de validación o envío de correo;
- confirmación de cierre de sesión.

## Orden recomendado de presentación

PF-001 → PF-002 → PF-004 → PF-011 → PF-005 → PF-003 → PF-008 → PF-009 → PF-006 → PF-007 →
PF-010.
