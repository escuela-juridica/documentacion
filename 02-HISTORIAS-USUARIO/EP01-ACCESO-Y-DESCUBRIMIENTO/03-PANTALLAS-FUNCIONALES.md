# EP01 — Pantallas funcionales para la review

## Cantidad

La épica incorpora **10 pantallas principales nuevas**. En su review se muestran las diez porque
no depende visualmente de pantallas construidas en otra épica.

## Pantallas principales

### PF-001 — Inicio y catálogo de cursos

- **Historias:** HU-006.
- **Actor:** visitante y alumno.
- **Debe mostrar:** oferta de cursos, búsqueda, selector de tipo, selector de categoría y tarjetas
  con nombre, imagen, modalidad, precio o gratuidad y disponibilidad. Los selectores comienzan en
  “Todos”; modalidad es información de la tarjeta y no un filtro.
- **Estados importantes:** inmediato, próximo, en curso, matrícula cerrada, sin cupos y sin
  resultados de búsqueda.
- **Acción para la review:** buscar, filtrar y abrir un curso.

### PF-002 — Ficha pública y vista previa del curso

- **Historias:** HU-007.
- **Actor:** visitante y alumno.
- **Debe mostrar:** información comercial, modalidad, precio y promoción vigente, fechas cuando
  correspondan, docente, beneficios, temario, duración disponible y lecciones de vista previa.
- **Jerarquía:** primero título, modalidad, disponibilidad, precio y una sola acción comercial;
  después beneficios, temario, docente y muestra. No incluye cursos relacionados.
- **Estados importantes:** curso virtual, en vivo, híbrido, gratuito, sin cupos, contenido
  protegido y promoción vencida.
- **Acción para la review:** abrir una vista previa e intentar acceder a una lección protegida.

### PF-003 — Acceso con correo o Google

- **Historias:** HU-001.
- **Actor:** visitante, alumno y administrador.
- **Debe mostrar:** correo, contraseña, acción de ingreso, “Continuar con Google”, acceso al
  registro y recuperación de contraseña.
- **Estados importantes:** credenciales inválidas, correo pendiente de verificar, autorización
  Google cancelada, Google vinculado, correo Google nuevo derivado a PF-004 e ingreso correcto por
  rol. El estado de contraseña temporal se incorpora al reutilizar esta pantalla en HU-008 de EP02.
- **Acción para la review:** ingresar como alumno y como administrador.

### PF-004 — Creación de cuenta

- **Historias:** HU-002.
- **Actor:** visitante.
- **Debe mostrar:** nombres, apellido paterno, apellido materno opcional, correo, teléfono opcional,
  DNI opcional, contraseña, aceptación de documentos, alternativa de Google y contacto por
  WhatsApp para solicitar ayuda. Si llega desde PF-003 con un correo Google nuevo, conserva los
  datos autorizados y solicita solo lo necesario para crear la cuenta.
- **Jerarquía:** en escritorio utiliza dos columnas: panel institucional visual a la izquierda y
  formulario de una columna a la derecha. En móvil queda únicamente el formulario en una columna.
  “Crear cuenta” es la única acción principal y WhatsApp aparece como ayuda secundaria.
- **Estados importantes:** correo existente, contraseña inválida, consentimientos faltantes y
  registro enviado.
- **Acción para la review:** crear una cuenta dejando vacío el DNI y mostrar que también puede
  registrarse o editarse como dato opcional.

### PF-005 — Verificación del correo

- **Historias:** HU-003.
- **Actor:** usuario con correo pendiente.
- **Debe mostrar:** correo parcialmente oculto, campo para el código de seis dígitos, código
  incorrecto, verificación exitosa y acciones para verificar o reenviar el código.
- **Acción para la review:** ingresar el código más reciente y habilitar la cuenta.

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

- **Historias:** HU-001.
- **Actor:** alumno y administrador.
- **Debe mostrar:** identidad de la sesión y navegación permitida. En administrador, la barra lateral muestra Dashboard, Cursos, Usuarios,
  Matrículas y pagos, Operación académica, Certificados, Reclamaciones, Reportes y Configuración.
- **Jerarquía:** alumno prioriza “Mis cursos”; administrador ve navegación sin gráficos ni tarjetas
  que dupliquen el dashboard.
- **Estados importantes:** sesión de alumno y sesión de administrador.
- **Acción para la review:** ingresar con ambos roles y comprobar el destino correspondiente.

### PF-009 — Mi perfil, datos y seguridad

- **Historias:** HU-005.
- **Actor:** alumno y administrador.
- **Debe mostrar:** datos personales editables, correo de acceso de solo lectura y sección para
  definir o cambiar contraseña.
- **Jerarquía:** dos pestañas, Datos y Seguridad, con una sola visible; el aviso de datos congelados
  solo aparece si existe un certificado emitido afectado.
- **Estados importantes:** cuenta creada por formulario o Google; datos
  incompletos y guardado correcto.
- **Acción para la review:** actualizar datos y definir o cambiar la contraseña.

### PF-011 — Documentos legales públicos

- **Historias:** HU-002.
- **Actor:** visitante y usuario.
- **Debe mostrar:** política de privacidad y términos vigentes en secciones o pestañas accesibles
  desde el registro y el pie de página.
- **Jerarquía:** un documento visible a la vez, con selector superior e índice desplegable.
- **Acción para la review:** abrir ambos documentos sin abandonar definitivamente el registro.

## Elementos que no cuentan como pantallas adicionales

- selector externo de cuentas de Google;
- mensajes de validación o envío de correo;
- confirmación de cierre de sesión.

## Orden recomendado de presentación

PF-001 → PF-002 → PF-004 → PF-011 → PF-005 → PF-003 → PF-008 → PF-009 → PF-006 → PF-007.
