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
| 1 | `01-tablas-y-llaves-ep01.sql` | 19 tablas, llaves, relaciones y descripciones | Obligatorio |
| 2 | `02-datos-iniciales-ep01.sql` | Datos maestros y registros mínimos para probar la épica | Desarrollo/review |

Ejecución con `psql` desde esta carpeta:

```powershell
psql -v ON_ERROR_STOP=1 -d esejur -f "01-tablas-y-llaves-ep01.sql"
psql -v ON_ERROR_STOP=1 -d esejur -f "02-datos-iniciales-ep01.sql"
```

El segundo archivo carga los maestros completos del negocio y el mínimo de registros conectados
para probar las siete historias: dos roles, cuatro personas, dos cuentas, dos asignaciones de rol,
dos documentos legales, un código, un token, un intento de acceso, dos docentes públicos, dos cursos,
un módulo, una lección, un recurso, un material y una
matrícula activa. No incorpora datos repetidos solo para llenar listados.

## Tablas funcionales

### Cuenta y acceso

| Tabla | Dato que conserva |
|---|---|
| `rol` | Roles disponibles para organizar el acceso a las funciones del sistema |
| `persona` | Identidad y perfil personal o profesional, tenga o no una cuenta |
| `usuario` | Cuenta, medios de acceso y estado del alumno o administrador |
| `usuario_rol` | Uno o varios roles asignados a cada cuenta |
| `documentos_legales` | Versiones de política de privacidad y términos del servicio |
| `consentimientos_usuario` | Documento y versión aceptados por cada usuario |
| `codigos_verificacion_correo` | Códigos emitidos para verificar el correo y su estado |
| `tokens_recuperacion_acceso` | Enlaces de recuperación emitidos, vencimiento y estado |
| `intentos_acceso` | Resultado de cada intento de acceso con correo o Google |

### Catálogo y ficha del curso

| Tabla | Dato que conserva |
|---|---|
| `tipos_curso` | Clasificación comercial: diplomado, seminario, taller y otros |
| `categorias_tematicas` | Área jurídica usada como filtro del catálogo |
| `entidades_certificadoras` | Entidad que refrenda el curso |
| `cursos` | Ficha, modalidad, precio, promoción, fechas, cupo y beneficios |
| `curso_docente` | Personas que aparecen como docentes de un curso y su orden de presentación |
| `modulos` | Módulos ordenados del temario |
| `lecciones` | Lecciones grabadas o en vivo, incluidas las habilitadas como vista previa |
| `recursos` | Archivo, enlace o video que puede utilizarse como material |
| `materiales_leccion` | Posición y forma de uso de cada recurso dentro de una lección |
| `matriculas` | Estado mínimo requerido para contar los cupos ocupados del catálogo |

`matriculas` solo aporta a EP01 la relación necesaria para que HU-006 y HU-007 cuenten como ocupado
un cupo con estado `ACTIVA`. Las tablas de pagos, operaciones de Culqi y el flujo completo de
matrícula se incorporarán en EP02.

## Relación con las historias

| Historia | Tablas principales |
|---|---|
| HU-001 — Iniciar sesión con correo o Google | `persona`, `usuario`, `rol`, `usuario_rol`, `intentos_acceso` |
| HU-002 — Crear cuenta con formulario o Google | `persona`, `usuario`, `documentos_legales`, `consentimientos_usuario` |
| HU-003 — Verificar correo | `usuario`, `codigos_verificacion_correo` |
| HU-004 — Recuperar acceso | `usuario`, `tokens_recuperacion_acceso` |
| HU-005 — Consultar y actualizar mis datos | `persona`, `usuario` |
| HU-006 — Explorar, buscar y filtrar cursos | `cursos`, maestros, `persona`, `curso_docente`, `matriculas` |
| HU-007 — Consultar ficha y vista previa | `cursos`, `persona`, `curso_docente`, `modulos`, `lecciones`, `recursos`, `materiales_leccion` |

## Valores que deberá controlar el backend

Estos valores se documentan para que los equipos utilicen la misma nomenclatura, pero no se
automatizan en los scripts:

- rol del sistema: `ROLE_ALUMNO` o `ROLE_ADMINISTRADOR`;
- origen del registro: `FORMULARIO`, `GOOGLE` o `ADMINISTRATIVO`;
- estado de usuario: `PENDIENTE_VERIFICACION`, `CAMBIO_PENDIENTE`, `HABILITADO` o `DESHABILITADO`;
- modalidad: `VIRTUAL`, `EN_VIVO` o `HIBRIDO`;
- tipo de venta: `GRATUITO` o `PAGADO`;
- estado de curso: `BORRADOR`, `PUBLICADO`, `EN_CURSO`, `CERRADO` o `CANCELADO`;
- estado de código o token: `VIGENTE`, `UTILIZADO` o `INVALIDADO`;
- estado de matrícula: `PENDIENTE`, `ACTIVA`, `VENCIDA` o `CANCELADA`.

El backend también será responsable de normalizar el correo, calcular fechas, invalidar códigos o
enlaces anteriores, actualizar `modificado_en`, validar las reglas del curso y contar solamente
matrículas `ACTIVA` para determinar la disponibilidad de cupos.

Una cuenta puede tener varios registros en `usuario_rol`. El docente no recibe un rol ni acceso en
el alcance actual: se identifica por la relación entre `persona` y `curso_docente`, y sus datos son
gestionados por un administrador.

## Datos legales

La política de privacidad y los términos incluidos están marcados como `DEMO-1.0`. Deben
reemplazarse por los textos aprobados por la Escuela antes de utilizar el sistema en producción.
