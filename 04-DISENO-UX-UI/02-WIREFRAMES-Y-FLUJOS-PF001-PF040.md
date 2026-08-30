# ESEJUR — Especificación de wireframes y flujos PF-001 a PF-040

## 1. Cómo usar este documento

Este archivo convierte el mapa funcional en instrucciones directas para Figma y frontend. Cada
pantalla indica composición, controles, acciones, estados y adaptación. Las medidas, campos,
botones, tablas, modales, colores y accesibilidad se toman del sistema de componentes de esta misma
carpeta; aquí se define dónde aparecen y cómo se conectan.

Reglas comunes:

- frame base de escritorio 1440 px y móvil 390 px;
- encabezado público de 72 px; barra administrativa de 264 px; área útil máxima de 1200 px;
- una acción primaria visible por bloque y secundarias con menor jerarquía;
- formularios con etiqueta superior, ayuda debajo y error junto al campo;
- los modales solo confirman acciones breves o irreversibles; la edición extensa usa página o panel;
- diseñar para vacío, carga, error, éxito, bloqueo y datos extensos;
- todas las horas y fechas se presentan en `America/Lima`;
- en móvil no se elimina información: se reordena, colapsa o convierte tabla en tarjetas.

## 2. Wireframes del portal y acceso

| PF | Composición exacta | Controles y acción principal | Estados y adaptación |
|---|---|---|---|
| **001 Inicio y catálogo** | Encabezado; hero azul con título, buscador y acento coral; chips de tipo/categoría/modalidad; barra de orden; cuadrícula de 3 tarjetas; paginación; pie legal. | Buscar, limpiar filtros y abrir tarjeta. Cada tarjeta: imagen 16:9, badges, título, modalidad, fecha/inicio inmediato, precio o Gratis y CTA “Ver curso”. | Skeleton, sin resultados con limpiar filtros, matrícula cerrada y sin cupos. Móvil: buscador ancho completo, filtros en cajón y una tarjeta por fila. |
| **002 Ficha y vista previa** | Breadcrumb; hero con información a la izquierda y resumen comercial fijo a la derecha; beneficios; docente; temario en acordeón; sección de muestra; cursos relacionados; pie. | “Matricularme”, “Iniciar sesión” si hace falta y “Ver vista previa”. VIRTUAL no muestra fin; EN_VIVO/HIBRIDO sí muestran calendario. | Precio normal/promoción/gratis, cierre y sin cupos. Contenido no autorizado bloqueado. Móvil: resumen comercial pasa bajo hero y CTA fija inferior sin ocultar contenido. |
| **003 Inicio de sesión** | Tarjeta de 440 px centrada, logo, título, correo, contraseña, recordar sesión opcional, enlaces y separador Google. | “Ingresar”, “Continuar con Google”, “¿Olvidaste tu contraseña?” y registro. | Carga en botón, credenciales neutrales, CAMBIO_PENDIENTE y cuenta restringida. Móvil: tarjeta sin sombra y ancho completo. |
| **004 Registro** | Formulario de 480 px por bloques: identidad, contacto, contraseña, consentimientos y anti-robot; lateral ilustrativo solo en escritorio. | Nombres, apellidos separados, correo, WhatsApp opcional, contraseña/confirmación, checks legales, “Crear cuenta” y contacto por WhatsApp. | Fortaleza y requisitos en vivo, correo existente sin revelar de más, fallo de envío. No pedir DNI. Móvil: una columna y CTA al final. |
| **005 Verificación de correo** | Estado centrado con icono, correo parcialmente oculto, instrucciones y temporizador informativo de 24 h. | “Ir a iniciar sesión” cuando se verificó o “Reenviar enlace”. | Válido, vencido, usado, reemplazado y envío fallido. Reenviar invalida el anterior. |
| **006 Solicitar recuperación** | Tarjeta centrada con texto neutral y campo correo. | “Enviar enlace” y volver al ingreso. | Siempre muestra la misma confirmación pública; error técnico permite reintentar. |
| **007 Nueva contraseña** | Tarjeta centrada con contraseña, confirmación y lista de cuatro requisitos. | “Guardar nueva contraseña”. | Enlace válido, vencido, usado o reemplazado; éxito conduce al ingreso. Vigencia 60 minutos. |
| **008 Panel inicial** | Variante alumno: saludo, acceso a Mis cursos, calendario cuando aplica y navegación. Variante admin: navegación lateral y contenido inicial; no confundir con PF-040. | Accesos según rol. Cuenta temporal muestra alerta fija superior con tres pasos y CTA “Completar habilitación”. | La alerta desaparece solo con correo verificado, documentos aceptados y contraseña cambiada. Móvil: menú en cajón. |
| **009 Mi perfil** | Encabezado, pestañas Datos y Seguridad; formulario en tarjeta de 720 px; bloque de datos congelados informativo. | Guardar datos editables y cambiar contraseña. Correo de acceso solo lectura. | Cambios sin guardar, guardado, validación y datos usados por certificado. |
| **010 Gestión de usuarios** | Barra admin; título y CTA; filtros; tabla; panel lateral de detalle/creación. | Buscar por correo antes de crear; campos de identidad, teléfono opcional y rol Alumno/Administrador; crear, reenviar instrucciones o deshabilitar. | Cuenta existente, CAMBIO_PENDIENTE, habilitada, último admin y auto-desactivación bloqueados. Mostrar otorgante del rol. |
| **011 Documentos legales** | Encabezado público; índice fijo en escritorio; cuerpo de lectura; selector Términos/Privacidad; pie. | Navegar secciones e imprimir. | Versión y fecha vigentes visibles. Móvil: índice como selector superior. |

## 3. Wireframes de administración, publicación y matrícula

| PF | Composición exacta | Controles y acción principal | Estados y adaptación |
|---|---|---|---|
| **012 Información base** | Barra admin; pestañas Tipos, Categorías, Entidades, Firmantes y Materiales; tabla y panel lateral. | Crear/editar/deshabilitar valor; seleccionar logos o firmas donde corresponda. | Vacío, valor en uso protegido y duplicado. |
| **013 Gestión de cursos** | Filtros y tabla/tarjetas con estado, modalidad, fechas, cupo y acciones. | Crear curso, abrir, duplicar, destacar, cerrar o cancelar según estado. | BORRADOR, PUBLICADO, EN CURSO, CERRADO y CANCELADO. Duplicar abre confirmación y genera dirección única. |
| **014 Editor del curso** | Encabezado con estado y guardado; pestañas Información, Contenido, Sesiones, Exámenes, Certificación y Publicación; resumen lateral de validación. | Inputs condicionales por modalidad; editor drag-and-drop; editor completo de examen con tipo, preguntas, opciones, puntaje, intentos, tiempo, respuestas y `dias_revision`; guardar o publicar. | Errores agrupados con enlace a pestaña. PRACTICA oculta límite; VIRTUAL oculta asistencia/fin. Fuente no detectable avisa que el progreso será manual. Publicar VIRTUAL inmediato termina EN CURSO. |
| **015 Matrículas y pagos** | Filtros; tabla; detalle dividido en Alumno, Matrícula, Pagos e Historial; CTA de matrícula administrativa. | Crear/reusar alumno, elegir curso, monto manual o exoneración, cancelar matrícula con motivo y registrar atención externa. | Pago y acceso nunca se fusionan; mostrar sobrecupo y APROBADO tardío. PENDIENTE no ofrece reintento. |
| **016 Matrícula gratuita** | Resumen de curso, cuenta y reglas; confirmación simple. | “Confirmar matrícula”. | Duplicada, cerrada, sin cupos, cuenta no habilitada y éxito. No crea pago. |
| **017 Checkout** | Dos columnas: medios Culqi y resumen fijo del pedido. | Tarjeta/Yape/Plin ofrecidos por Culqi; “Pagar ahora”. | Carga no repetible, validación previa de cupo, sin contador de reserva. Móvil: resumen colapsable y pago debajo. |
| **018 Resultado de pago** | Icono/estado, explicación, datos de pedido y constancia imprimible. | APROBADO: “Ir a Mis cursos”; RECHAZADO/ERROR/EXPIRADO: “Volver a pagar”; PENDIENTE: “Ver estado”, sin nuevo intento. | Repetición idempotente; cancelación posterior informa atención externa sin prometer acceso o devolución. |
| **019 Mis cursos** | Navegación alumno; pestañas En progreso/Completados; tarjetas con imagen, modalidad, avance y estado. | “Continuar”, “Ver certificado” o “Ver temario”. | Inicio futuro muestra cuenta regresiva y temario sin contenidos protegidos; vencido/cancelado explica acceso. Curso cancelado permite consulta previa solo lectura. |

## 4. Wireframes del aula y evaluación

| PF | Composición exacta | Controles y acción principal | Estados y adaptación |
|---|---|---|---|
| **020 Aula y ruta** | Barra de temario 320 px; cabecera del curso; contenido principal con última acción; panel “Tu avance hacia el certificado”. | Abrir elemento disponible y continuar último punto. | Elementos bloqueado/disponible/actual/completado. Cancelado añade franja y desactiva toda escritura. Móvil: temario en cajón completo. |
| **021 Lección** | Reproductor 16:9; título; progreso del video cuando es detectable; lista de materiales; navegación inferior. | “Anterior”; “Siguiente”; en la última, “Completar lección”. Check automático solo lectura; manual accionable solo pendiente. | Falta de umbral explica porcentaje; no detectable muestra acción manual sin mensaje técnico. Un check completado no se desmarca. EN_VIVO muestra sesión, grabación pendiente o grabación. |
| **022 Calendario y sesiones** | Alternador Mes/Lista; calendario; lista de próximas sesiones; panel de detalle. | “Hoy”; abrir sesión; “Ingresar a la sesión” solo dentro de la ventana; “Ver grabación” después. | Tarjeta siempre visible; botón deshabilitado y enlace oculto fuera de hora; GRABACION_PENDIENTE y CANCELADA. Cero elegibles muestra asistencia “No aplica”. |
| **023 Resolver examen** | Encabezado fijo con título/intento/temporizador; pregunta central; navegador lateral; acciones inferior. | Responder radio, checkbox, verdadero/falso o texto; marcar; anterior/siguiente; “Entregar examen”. | Respuestas guardadas, tiempo agotado autoenvía, confirmación enumera pendientes. Móvil: navegador en panel y temporizador compacto fijo. |
| **024 Resultado del examen** | Resumen con nota, aprobación, mejor intento y política de respuestas; detalle por pregunta. | “Reintentar” solo cuando corresponde o “Continuar”. | PRACTICA siempre ilimitado; CALIFICADO muestra disponibles; PENDIENTE_REVISION muestra fecha máxima y observación al calificarse. Nota a dos decimales. |
| **025 Sesiones y asistencia** | Barra admin; filtros; tabla de sesiones; panel detalle con programación, asistentes y grabación. | Crear/reprogramar/cancelar sesión; corregir asistencia con motivo; cargar grabación. | Comparación antes/después, sesión realizada protegida, CANCELADA excluida y “No aplica” con cero elegibles. |
| **026 Cola de respuestas** | Filtros y tabla ordenada por fecha límite, con badges Próxima/Vencida. | “Revisar respuesta”. | Vacío y vencida sin calificación ficticia. |
| **027 Calificación abierta** | Respuesta del alumno a la izquierda; panel derecho por pregunta con máximo, campo puntaje y observación. | Puntaje inclusivo 0..máximo, observación opcional y “Publicar calificación”. | Revisión incompleta o fuera de rango bloquea; confirmación advierte efecto en nota/finalización/certificado. |
| **028 Excepciones académicas** | Búsqueda alumno/curso; resumen de progreso, nota y asistencia; historial; acciones separadas. | Corregir asistencia o conceder un intento adicional con motivo. | Certificado emitido bloquea intentos CALIFICADO; nunca ofrece editar nota o progreso directamente. |

## 5. Wireframes de certificación, control y gestión

| PF | Composición exacta | Controles y acción principal | Estados y adaptación |
|---|---|---|---|
| **029 Estado de certificación** | Encabezado de logro; lista valor/meta; promedio y nivel proyectado; datos personales; bloque temporal. | Confirmar datos; con espera cero “Generar certificado ahora” o “Seguir mejorando”. | PENDIENTE_REQUISITOS, PENDIENTE_DATOS, PROGRAMADO, LISTO_PARA_EMITIR y emitido. Modal final explica congelamiento. |
| **030 Mis certificados** | Cuadrícula/lista de certificados con curso, nivel, entidad, fecha, código y estado. | “Ver certificado”. | VIGENTE o ANULADO; corrección sigue VIGENTE. Vacío orienta a Mis cursos. |
| **031 Visor privado** | Fondo neutral; documento centrado; barra superior con volver y descargar. | “Descargar PDF”. | Solo titular; ANULADO retira documento y explica estado. Móvil ajusta ancho, no corta el certificado. |
| **032 Verificación pública** | Logo; campo código; resultado central mínimo; pie legal. | “Verificar”. | VIGENTE —incluida versión corregida—, ANULADO e inexistente. Nunca DNI, nota, firma, contacto o PDF. |
| **033 Gestión de certificados** | Filtros y tabla con alumno, curso, nivel, emisión y estado; panel de detalle. | Abrir operación. | Automático, confirmado por alumno y manual; VIGENTE/ANULADO. |
| **034 Operación del certificado** | Datos congelados, requisitos, versiones e historial. Acciones separadas Emitir manualmente, Corregir y Anular. | Manual exige motivo; corregir compara antes/después; anular usa modal destructivo. | PENDIENTE_REVISION bloquea emisión manual. Nivel no seleccionable: Refrendado solo por umbral; resto Normal. Corrección permanece VIGENTE. |
| **035 Excepciones de matrícula/pago** | Tres columnas comparables: resultado Culqi, estado matrícula y acceso/cupo; línea de tiempo inferior. | Registrar seguimiento externo y cerrar caso; no modificar resultado Culqi. | APROBADO tardío válido activa; curso/matrícula CANCELADA registra pago sin acceso; repetidos no duplican. |
| **036 Queja o reclamo público** | Formulario largo por secciones con indicador de avance no bloqueante; adjuntos; declaraciones; pie. | Elegir QUEJA/RECLAMO, completar y “Presentar”. | Varias imágenes hasta 5 MB cada una, cuenta opcional/prellenado, éxito con número y límite. |
| **037 Bandeja de reclamaciones** | Filtros; tabla ordenada por límite; badges PENDIENTE_RESPUESTA/RESPONDIDO. | “Abrir caso”. | Próximo, vencido, envío fallido; fecha según 15 días hábiles Perú. |
| **038 Respuesta de reclamación** | Expediente y adjuntos a la izquierda; respuesta y datos de correo a la derecha; historial inferior. | Guardar borrador de respuesta y “Enviar respuesta”. | Solo envío exitoso pasa a RESPONDIDO; fallo conserva texto y permite reenvío/corregir destino con historial. |
| **039 Centro de reportes** | Filtros superiores; pestañas Matrículas/Pagos/Académico/Certificados/Asistencia; resumen breve; tabla; paginación. | Filtrar, limpiar y “Exportar Excel”. | Fecha significa matrícula, resultado/registro, cohorte, emisión o sesión según pestaña. Asistencia no se ofrece para VIRTUAL. Vacío distingue sin datos de sin coincidencias. |
| **040 Dashboard** | Filtros de año/rango, curso y modalidad; cuadrícula 2×2 de gráficos. Fila 1: evolución 2/3 y por curso 1/3; fila 2: forma de ingreso y pagos 1/2 cada uno. | Cambiar filtros y consultar tooltip/leyenda. | Exactamente cuatro gráficos, sin tarjetas KPI, tareas, alertas ni pendientes. Móvil: cuatro gráficos apilados con leyendas visibles. |

## 6. Enlaces obligatorios del prototipo

- PF-001 → PF-002 → PF-003/PF-004 → PF-016/PF-017 → PF-018 → PF-019.
- PF-019 → PF-020 → PF-021/PF-022/PF-023 → PF-024 → PF-029 → PF-030 → PF-031.
- PF-032 debe abrirse tanto directamente como desde el QR simulado de PF-031.
- PF-008 administrador → PF-010/PF-012/PF-013/PF-015/PF-025/PF-026/PF-033/PF-037/PF-039/PF-040.
- PF-013 → PF-014; PF-026 → PF-027; PF-033 → PF-034; PF-037 → PF-038.
- Cada modal debe regresar al estado que lo abrió al cancelar y avanzar al estado resultante al
  confirmar; ningún enlace del prototipo debe terminar en un frame sin salida.

## 7. Lista de frames mínimos en Figma

Crear un frame base de escritorio y móvil por PF. Además crear variantes separadas cuando alteran
la decisión del usuario: pago APROBADO/PENDIENTE/fallido, cuenta restringida/habilitada, sesión
antes/durante/después/cancelada, examen automático/abierto, certificado programado/listo/vigente/
anulado, reclamación pendiente/fallo/respondida y curso normal/cancelado. No hace falta duplicar un
frame por cada mensaje de validación si el componente ya posee variantes documentadas.
