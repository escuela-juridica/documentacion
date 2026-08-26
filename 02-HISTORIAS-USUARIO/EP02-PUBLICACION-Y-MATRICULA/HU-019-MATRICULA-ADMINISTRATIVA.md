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

- Buscar por correo y reutilizar una única cuenta existente. Si no existe, administración registra
  correo, nombres, apellido paterno, apellido materno y teléfono opcional; se crea con la contraseña
  temporal `Escuela1415@`, correo pendiente de verificar y estado CAMBIO_PENDIENTE.
- `REGISTRADO_MANUAL` si hubo dinero: importe, medio, referencia y motivo obligatorios.
- `EXONERADO` si no hubo dinero: importe cero y motivo obligatorio.
- Responsable y fecha siempre registrados.
- Ambas opciones activan matrícula y ocupan cupo.
- Puede realizarse después del cierre de matrícula. Si asistencia es obligatoria y ya no quedan
  sesiones futuras, ESEJUR muestra antes de confirmar que el alumno no podrá alcanzar por sí solo
  la certificación automática basada en asistencia; la advertencia no impide la excepción manual.
- La cuenta puede tener matrícula ACTIVA antes de habilitarse, pero no usar contenido hasta
  verificar correo, aceptar documentos y cambiar clave temporal.
- No cambia contraseña de una cuenta existente.

## Flujo principal

1. Administración busca correo y selecciona curso disponible.
2. Si la cuenta no existe, completa sus datos y ESEJUR envía las instrucciones de verificación,
   aceptación de documentos y cambio obligatorio de la contraseña temporal.
3. Elige registro manual con pago o exoneración.
4. Completa los datos y motivo.
5. ESEJUR valida duplicidad/cupo y activa la matrícula.
6. Envía confirmación; el acceso real respeta la habilitación de la cuenta y la fecha de inicio.

## Criterios de aceptación

- **Dado** que hubo dinero, **cuando** matrícula, **entonces** exige importe, medio, referencia y
  motivo y registra REGISTRADO_MANUAL.
- **Dado** que no hubo dinero, **cuando** matrícula, **entonces** el importe es cero y queda
  EXONERADO con motivo.
- **Dado** cuenta CAMBIO_PENDIENTE, **cuando** matrícula, **entonces** el derecho queda ACTIVA, pero
  el contenido continúa bloqueado.
- **Dado** una matrícula previa, **cuando** intenta repetir, **entonces** no duplica.
- **Dado** cierre alcanzado y ausencia de sesiones futuras con asistencia obligatoria, **cuando**
  administración matricula, **entonces** debe confirmar la advertencia académica y queda registrada
  la matrícula sin afirmar que el alumno certificará automáticamente.

## Notificación

- Al activarse la matrícula se envía la confirmación del curso y del origen administrativo. Si la
  cuenta es nueva, además recibe por separado la contraseña temporal, verificación y pasos de
  habilitación.
- Un fallo de envío no revierte la matrícula ni cambia el registro económico; administración puede
  reenviar. No se rastrea la apertura o entrega del mensaje.

## Dependencia interna

- Depende de HU-015 y utiliza cuenta de EP01/HU-005.
- HU-020 y HU-021 consumen su resultado.

## Orientación de trabajo

- **Frontend:** búsqueda, elección clara, campos condicionales y resumen.
- **Backend:** registro económico, responsable, fecha, matrícula/cupo y restricciones de cuenta.
- **Integración:** la acción administrativa debe dejar sincronizados cuenta, registro económico,
  matrícula, cupo y acceso; si la cuenta no está habilitada, conserva el derecho pero bloquea el
  contenido hasta completar verificación, aceptación y cambio de contraseña.

## Demostración esperada

Demostrar REGISTRADO_MANUAL, EXONERADO y cuenta nueva pendiente de habilitación.
