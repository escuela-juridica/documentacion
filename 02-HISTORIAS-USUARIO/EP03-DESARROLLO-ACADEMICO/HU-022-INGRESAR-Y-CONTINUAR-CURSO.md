# HU-022 — Ingresar y continuar un curso

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 3 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno con acceso**, quiero **abrir mi curso donde lo dejé**, para **continuar el recorrido
> sin perder contenido ya completado**.

## Alcance incluido

- Entrada desde “Mis cursos” mediante “Continuar”.
- Aula con temario lateral, módulos, lecciones, exámenes y certificado en su posición.
- Estados de cada elemento: completado, disponible o bloqueado.
- Apertura de la última lección utilizada o siguiente acción aplicable.
- Porcentaje general visible.
- Lecciones completadas permanecen accesibles; reabrir no borra avance.
- La tarjeta de sesión en vivo permanece visible. Antes del inicio muestra fecha y hora con el botón
  deshabilitado; el enlace real solo se expone y habilita entre inicio y fin en `America/Lima`.
  Después muestra la grabación o “grabación pendiente”.
- Un alumno matriculado después del inicio puede revisar las grabaciones ya disponibles; las
  sesiones anteriores a su matrícula no registran asistencia ni entran en su porcentaje.
- Si el curso completo fue CANCELADO, quien ya tenía acceso conserva la consulta del contenido que
  estuvo disponible antes de la cancelación en modo lectura, sin nuevos checks, progreso, intentos,
  asistencia ni finalización, y nunca los enlaces de reuniones futuras. Una
  matrícula CANCELADA individualmente o aprobada después de cancelar el curso no abre contenido.

## Precondiciones

- Matrícula ACTIVA, cuenta habilitada y fecha de inicio alcanzada cuando existe.

## Flujo principal

1. El alumno selecciona “Continuar”.
2. ESEJUR verifica acceso efectivo.
3. Abre el aula con el temario y el último punto válido.
4. El alumno consulta contenido o el siguiente requisito.

## Excepciones

- Cuenta pendiente, inicio futuro, matrícula VENCIDA o CANCELADA individualmente: no abre y explica
  el motivo. La conservación limitada por cancelación completa solo se aplica a quien ya tenía
  acceso antes de la decisión.
- Lección bloqueada: muestra qué requisito previo falta.
- Curso completado: permite revisar lo ya cursado mientras conserve acceso y dirige al certificado.

## Criterios de aceptación

- **Dado** acceso válido, **cuando** continúa, **entonces** abre el último punto permitido.
- **Dado** una lección completada, **cuando** vuelve a abrirla, **entonces** conserva el check.
- **Dado** acceso no utilizable, **cuando** intenta abrir, **entonces** no entrega contenido y
  muestra la causa real.
- **Dado** alumno tardío, **cuando** entra, **entonces** ve grabaciones previas disponibles sin que
  esas sesiones se registren como asistencia.

## Dependencia interna

- Ninguna dentro de EP03; requiere curso/matrícula de EP02.
- HU-023, HU-024 y HU-025 usan el aula integrada.

## Orientación de trabajo

- **Frontend:** temario, estados, continuar y explicación de bloqueos.
- **Backend:** autorización, último punto y progreso persistente.
- **Integración:** la matrícula y sus fechas deben decidir el ingreso; una vez autorizado, el aula
  carga la estructura vigente y posiciona al alumno en su última lección accesible.

## Demostración esperada

Demostrar retorno al curso y rechazo por inicio futuro o acceso vencido.
