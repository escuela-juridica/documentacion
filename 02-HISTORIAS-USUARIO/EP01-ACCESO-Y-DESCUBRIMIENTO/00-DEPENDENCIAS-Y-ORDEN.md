# EP01 — Dependencias y orden de ejecución

## Entregable funcional

Al cerrar la épica, un visitante puede explorar la oferta, revisar un curso, crear o recuperar su
cuenta, iniciar sesión y administrar sus datos.

## Dependencias internas

| Historia | Depende de | Bloqueante para aceptar | Puede adelantarse |
|---|---|---|---|
| HU-001 | Ninguna | No | Sí |
| HU-002 | Ninguna; integra HU-001 | No | Sí |
| HU-003 | Ninguna; integra HU-001 | No | Sí |
| HU-004 | Ninguna | No | Sí, con cuenta controlada |
| HU-005 | HU-001 | Sí | Sí, con sesión controlada |
| HU-006 | Ninguna | No | Sí, con cursos controlados |
| HU-007 | HU-006 para el recorrido completo | No para trabajar por URL; sí para la demostración | Sí |

## Olas recomendadas

1. **Ola A, paralela:** HU-001, HU-002, HU-003, HU-004 y HU-006.
2. **Ola B, paralela:** HU-005 después de estabilizar HU-001; HU-007 después de acordar
   cómo se selecciona un curso desde HU-006.
3. **Integración:** registro → verificación → ingreso → perfil; catálogo → ficha → vista previa.

## Asignación sin bloqueo

- No asignar HU-001 y HU-005 a equipos que esperen integrarse el mismo día; primero se acuerda el
  resultado de una sesión válida.
- HU-002 y HU-003 pueden ser equipos distintos porque son caminos alternativos hacia una misma
  cuenta.
- HU-006 y HU-007 pueden avanzar simultáneamente si comparten desde el inicio los datos mínimos de
  tarjeta, ficha, modalidad, precio y estado.
- Para la primera demostración se admite información controlada; antes de cerrar la épica debe
  sustituirse por el recorrido integrado.

## Secuencia de demostración

1. Explorar y filtrar cursos sin iniciar sesión.
2. Abrir la ficha y una lección de vista previa.
3. Crear una cuenta por formulario, aceptar documentos y verificar el correo.
4. Iniciar sesión y actualizar datos personales.
5. Mostrar alternativamente Google y recuperación de contraseña.
