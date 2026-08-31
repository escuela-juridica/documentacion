# EP01 — Tablas de acceso y descubrimiento

## Alcance

Esta carpeta contiene únicamente:

- tablas funcionales de HU-001 a HU-007;
- columnas necesarias para conservar sus datos;
- llaves primarias;
- llaves foráneas;
- reglas de unicidad necesarias para evitar duplicados;
- descripciones funcionales de todas las tablas y columnas mediante `COMMENT ON`;
- datos maestros indispensables y una cantidad mínima de datos ficticios conectados.

No contiene triggers, funciones, procedimientos almacenados, vistas, índices adicionales ni
automatizaciones. La validación de estados, fechas, contraseñas, códigos, cupos y demás reglas se
programará posteriormente en el backend.

## Archivos y orden

| Orden | Archivo | Contenido | Uso |
|---:|---|---|---|
| 1 | `01-tablas-y-llaves-ep01.sql` | 17 tablas, llaves, relaciones y descripciones | Obligatorio |
| 2 | `02-datos-iniciales-ep01.sql` | Datos maestros y registros mínimos para probar la épica | Desarrollo/review |

Ejecución con `psql` desde esta carpeta:

```powershell
psql -v ON_ERROR_STOP=1 -d esejur -f "01-tablas-y-llaves-ep01.sql"
psql -v ON_ERROR_STOP=1 -d esejur -f "02-datos-iniciales-ep01.sql"
```

El segundo archivo carga los maestros completos del negocio y el mínimo de registros conectados
para probar las siete historias: dos roles, cinco estados de curso, cinco personas, tres cuentas,
cuatro asignaciones de rol —una secundaria de ejemplo—, un código, un token, dos docentes públicos, tres cursos,
tres módulos, cuatro lecciones, dos recursos, dos materiales y una
matrícula activa. No incorpora datos repetidos solo para llenar listados.

## Tablas funcionales

### Cuenta y acceso

| Tabla | Dato que conserva |
|---|---|
| `rol` | Roles disponibles para organizar el acceso a las funciones del sistema |
| `persona` | Identidad y perfil personal o profesional, tenga o no una cuenta |
| `usuario` | Cuenta, medios de acceso, disponibilidad administrativa y condiciones de habilitación |
| `usuario_rol` | Uno o varios roles, el rol principal y el administrador que concedió cada asignación |
| `codigo_verificacion_correo` | Códigos emitidos, resultado de envío y fechas de uso o invalidación |
| `token_recuperacion_acceso` | Enlaces emitidos, resultado de envío, vencimiento, uso e invalidación |

### Catálogo y ficha del curso

| Tabla | Dato que conserva |
|---|---|
| `tipo_curso` | Clasificación comercial: diplomado, seminario, taller y otros |
| `categoria_tematica` | Área jurídica usada como filtro del catálogo |
| `entidad_certificadora` | Entidad que refrenda el curso |
| `estado_curso` | Los cinco estados del ciclo de vida del curso |
| `curso` | Ficha, modalidad, precio, promoción, fechas, cupo y beneficios |
| `curso_docente` | Personas que aparecen como docentes de un curso y su orden de presentación |
| `modulo` | Módulos ordenados del temario |
| `leccion` | Lecciones grabadas o en vivo, incluidas las habilitadas como vista previa |
| `recurso` | Archivo, enlace o video que puede utilizarse como material |
| `material_leccion` | Posición y forma de uso de cada recurso dentro de una lección |
| `matricula` | Estado mínimo requerido para contar los cupos ocupados del catálogo |

`matricula` solo aporta a EP01 la relación necesaria para que HU-006 y HU-007 cuenten como ocupado
un cupo con estado `ACTIVA`. Las tablas de pagos, operaciones de Culqi y el flujo completo de
matrícula se incorporarán en EP02.

## Relación con las historias

| Historia | Tablas principales |
|---|---|
| HU-001 — Iniciar sesión con correo o Google | `persona`, `usuario`, `rol`, `usuario_rol` |
| HU-002 — Crear cuenta con formulario o Google | `persona`, `usuario` |
| HU-003 — Verificar correo | `usuario`, `codigo_verificacion_correo` |
| HU-004 — Recuperar acceso | `usuario`, `token_recuperacion_acceso` |
| HU-005 — Consultar y actualizar mis datos | `persona`, `usuario` |
| HU-006 — Explorar, buscar y filtrar cursos | `curso`, `estado_curso`, maestros, `persona`, `curso_docente`, `matricula` |
| HU-007 — Consultar ficha y vista previa | `curso`, `estado_curso`, `persona`, `curso_docente`, `modulo`, `leccion`, `recurso`, `material_leccion` |

## Valores que deberá controlar el backend

Estos valores se documentan para que los equipos utilicen la misma nomenclatura, pero no se
automatizan en los scripts:

- rol del sistema: `ROLE_ALUMNO` o `ROLE_ADMINISTRADOR`;
- origen del registro: `FORMULARIO`, `GOOGLE` o `ADMINISTRATIVO`;
- disponibilidad de la cuenta: `activo = true` para una cuenta utilizable y `activo = false` para
  una cuenta inactiva;
- condiciones visibles de la cuenta: `PENDIENTE_VERIFICACION` se deriva de la ausencia de
  `correo_verificado_en` y `CAMBIO_PENDIENTE` de `requiere_cambio_contrasena`;
- modalidad: `VIRTUAL`, `EN_VIVO` o `HIBRIDO`;
- tipo de venta: `GRATUITO` o `PAGADO`;
- estado de curso almacenado en `estado_curso`: `BORRADOR`, `PUBLICADO`, `EN_CURSO`, `CERRADO` o `CANCELADO`;
- estado de matrícula: `PENDIENTE`, `ACTIVA`, `VENCIDA` o `CANCELADA`.

El backend también será responsable de normalizar el correo, calcular fechas, invalidar códigos o
enlaces anteriores, derivar si están vigentes, utilizados, invalidados o vencidos a partir de sus
fechas, actualizar `modificado_en`, validar las reglas del curso y contar solamente matrículas
`ACTIVA` para determinar la disponibilidad de cupos.

La activación general se conserva mediante valores booleanos. Los estados de proceso mantienen su
significado completo: el curso conserva sus cinco estados, la matrícula mantiene `PENDIENTE`,
`ACTIVA`, `VENCIDA` y `CANCELADA`, y la lección conserva su situación de disponibilidad o
programación.

La autenticación valida cada solicitud de ingreso, pero en este alcance no conserva historial de
intentos, direcciones IP ni información del dispositivo.

Una cuenta puede tener varios registros en `usuario_rol`, pero exactamente uno debe mantener
`es_principal = true`. En la versión actual ese rol define el panel inicial y no existe un selector
para alternar roles; esa posibilidad queda preparada para una versión futura. Cuando el rol fue
concedido por administración, `asignado_por_usuario_id` identifica al administrador responsable;
permanece vacío para el registro automático y la configuración inicial. El docente no recibe un
rol ni acceso en el alcance actual: se identifica por la relación entre `persona` y
`curso_docente`, y sus datos son gestionados por un administrador.

Un mismo `recurso` puede relacionarse con lecciones diferentes para permitir su reutilización. La
restricción única de `material_leccion` impide agregar ese mismo recurso dos veces dentro de una
sola lección.

## Datos legales

La política de privacidad y los términos se publican como páginas HTML. El formulario exige marcar
su aceptación antes de crear la cuenta; la existencia de `usuario` representa que esa condición fue
superada. La base de datos no conserva contenido, versión, fecha ni historial de aceptación.
