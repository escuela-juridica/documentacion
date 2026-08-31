# EP01 — Dependencias, responsables y orden de ejecución

## Entregable funcional

Al cerrar la épica, un visitante puede explorar la oferta, revisar un curso, crear y verificar su
cuenta cuando corresponda, iniciar sesión, recuperar el acceso y administrar sus datos.

## Asignación por equipo

| Equipo | Integrantes | Historias | Bloque funcional |
|---|---|---|---|
| Equipo 1 | Enrique y Miguel | HU-006 y HU-007 | Catálogo, filtros, ficha y vista previa |
| Equipo 2 | Joel y Juan | HU-002 y HU-003 | Creación y verificación de cuenta |
| Equipo 3 | Gabriel y Ariana | HU-001, HU-004 y HU-005 | Sesión, recuperación y perfil |

## Dependencias internas

| Historia | Depende de | Bloqueante para aceptar | Puede adelantarse |
|---|---|---|---|
| HU-001 | Ninguna | No | Sí |
| HU-002 | Ninguna; acuerda con HU-001 el traspaso de una identidad Google nueva | No | Sí |
| HU-003 | HU-002 para registro propio; HU-008 para cuenta administrativa | Sí para demostrar una cuenta real | Sí, con cuenta pendiente controlada |
| HU-004 | Ninguna; al completar retorna a HU-001 | No | Sí, con cuenta controlada |
| HU-005 | HU-001 | Sí | Sí, con sesión controlada |
| HU-006 | Ninguna | No | Sí, con cursos controlados |
| HU-007 | HU-006 para el recorrido completo | No para trabajar por URL; sí para la demostración | Sí |

## Orden de trabajo comunicado a los equipos

| Etapa | Enrique y Miguel | Joel y Juan | Gabriel y Ariana |
|---|---|---|---|
| Primera, en paralelo | HU-006 | HU-002 | HU-001 |
| Segunda, en paralelo | HU-007 | HU-003 | HU-005 |
| Tercera | Probar HU-006 → HU-007 | Probar HU-002 → HU-003 | HU-004 |
| Integración final | Catálogo → ficha | Creación → verificación | Sesión → panel → perfil y recuperación |

Los tres equipos comienzan al mismo tiempo con HU-006, HU-002 y HU-001. Ninguno debe esperar a
otro equipo para iniciar.

## Puntos de integración entre equipos

### Identidad Google nueva

1. HU-001 recibe de Google un correo verificado.
2. Si ya existe una cuenta, HU-001 inicia la sesión.
3. Si no existe, HU-001 conduce a PF-004 conservando solamente los datos autorizados necesarios.
4. HU-002 completa los datos, exige la casilla legal y crea la cuenta.

Gabriel y Ariana son responsables de PF-003. Joel y Juan son responsables de PF-004. El acuerdo
entre ambos equipos es el conjunto mínimo de datos que pasa de una pantalla a otra; no comparten la
propiedad de la misma pantalla.

### Cuenta por formulario

1. HU-002 crea una cuenta con correo pendiente.
2. HU-003 verifica el correo con el código más reciente.
3. HU-001 recibe la cuenta ya verificada para iniciar sesión.

### Catálogo y ficha

HU-006 y HU-007 pertenecen al mismo equipo. Pueden adelantarse en paralelo si desde el primer día
se acuerdan los datos mínimos de tarjeta, curso seleccionado, modalidad, precio y estado.

## Propiedad de pantallas

| Equipo | Pantallas principales |
|---|---|
| Enrique y Miguel | PF-001 y PF-002 |
| Joel y Juan | PF-004, PF-005, PF-011a y PF-011b |
| Gabriel y Ariana | PF-003, PF-006, PF-007, PF-008 y PF-009 |

## Secuencia de demostración

1. Explorar y filtrar cursos sin iniciar sesión.
2. Abrir la ficha y una lección de vista previa.
3. Crear una cuenta mediante formulario, marcar la casilla legal y verificar el correo.
4. Iniciar sesión y actualizar datos personales.
5. Recuperar el acceso mediante correo.
6. Mostrar una cuenta Google existente y una identidad Google nueva derivada a la creación de
   cuenta.
