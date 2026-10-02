# HU-019 — Matricular administrativamente a un alumno

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **matricular a una persona registrando el origen económico**, para
> **conceder acceso fuera del checkout sin perder el control de pagos**.

## Alcance incluido

- Buscar por nombre o correo y listar exclusivamente cuentas que posean el rol Alumno. Esta
  historia no crea cuentas, no asigna roles y no modifica el rol principal; esas acciones se
  realizan previamente en HU-008.
- Solo admite cursos PUBLICADO o EN CURSO. BORRADOR, CERRADO y CANCELADO no permiten una nueva
  matrícula administrativa.
- `REGISTRADO_MANUAL` si hubo dinero: importe, medio, referencia y motivo obligatorios.
- `EXONERADO` si no hubo dinero: importe cero y motivo obligatorio.
- Responsable y fecha siempre registrados.
- Ambas opciones activan matrícula y ocupan cupo.
- La matrícula manual no produce sobrecupo: si no hay disponibilidad se bloquea y administración
  debe aumentar primero la capacidad del curso. La excepción por aprobaciones Culqi simultáneas o
  tardías se incorpora posteriormente mediante HU-047 de EP04.
- La vigencia, si existe, usa la fecha posterior entre activación administrativa e inicio del curso
  como día 1 y vence a las 23:59:59 de `America/Lima` del día N.
- Puede realizarse después del cierre de matrícula. Si asistencia es obligatoria y ya no quedan
  sesiones futuras, ESEJUR muestra antes de confirmar que el alumno no podrá alcanzar por sí solo
  la certificación automática basada en asistencia; la advertencia no impide la excepción manual.
- La cuenta puede tener matrícula ACTIVA antes de habilitarse, pero no usar contenido hasta
  verificar correo y cambiar la clave temporal.
- No cambia contraseña de una cuenta existente.

## Flujo principal

1. Administración busca por nombre o correo y selecciona una cuenta que ya tenga rol Alumno.
2. Si no aparece, ESEJUR orienta a crearla o asignarle el rol Alumno desde HU-008 y luego regresar.
3. Selecciona un curso PUBLICADO o EN CURSO y elige registro manual con pago o exoneración.
4. Completa los datos y motivo.
5. ESEJUR valida estado del curso, duplicidad y cupo y activa la matrícula.
6. Envía confirmación; el acceso real respeta la habilitación de la cuenta y la fecha de inicio.

## Criterios de aceptación

- **Dado** que hubo dinero, **cuando** matrícula, **entonces** exige importe, medio, referencia y
  motivo y registra REGISTRADO_MANUAL.
- **Dado** que no hubo dinero, **cuando** matrícula, **entonces** el importe es cero y queda
  EXONERADO con motivo.
- **Dado** cuenta CAMBIO_PENDIENTE, **cuando** matrícula, **entonces** el derecho queda ACTIVA, pero
  el contenido continúa bloqueado.
- **Dado** una matrícula previa, **cuando** intenta repetir, **entonces** no duplica.
- **Dado** una cuenta que no posee rol Alumno, **cuando** administración la busca para matricular,
  **entonces** no aparece como candidata y se orienta a resolver el rol desde HU-008.
- **Dado** un curso BORRADOR, CERRADO o CANCELADO, **cuando** intenta matricular, **entonces** la
  operación se bloquea sin crear acceso ni registro económico.
- **Dado** un curso sin cupo, **cuando** intenta una matrícula administrativa, **entonces** se
  bloquea hasta que administración aumente la capacidad; no se crea sobrecupo manual.
- **Dado** cierre alcanzado y ausencia de sesiones futuras con asistencia obligatoria, **cuando**
  administración matricula, **entonces** debe confirmar la advertencia académica y queda registrada
  la matrícula sin afirmar que el alumno certificará automáticamente.

## Notificación

- Al activarse la matrícula se envía la confirmación del curso y del origen administrativo. Las
  instrucciones de una cuenta creada o modificada previamente pertenecen a HU-008.
- Un fallo de envío no revierte la matrícula ni cambia el registro económico; administración puede
  reenviar. No se rastrea la apertura o entrega del mensaje.

## Dependencia interna

- Depende de HU-008 para disponer de una cuenta con rol Alumno y de HU-015 para disponer del curso
  publicado.
- HU-020 y HU-021 consumen su resultado.

## Orientación de trabajo

- **Frontend:** búsqueda limitada a alumnos, retorno hacia HU-008 cuando no exista uno elegible,
  elección clara, campos condicionales y resumen.
- **Backend:** registro económico, responsable, fecha, matrícula/cupo y restricciones de cuenta.
- **Integración:** la acción administrativa debe dejar sincronizados cuenta, registro económico,
  matrícula, cupo y acceso; si la cuenta no está habilitada, conserva el derecho pero bloquea el
  contenido hasta completar verificación y cambio de contraseña.

## Demostración esperada

Demostrar REGISTRADO_MANUAL, EXONERADO, rechazo de una cuenta sin rol Alumno y bloqueo por estado
o cupo no permitido.
