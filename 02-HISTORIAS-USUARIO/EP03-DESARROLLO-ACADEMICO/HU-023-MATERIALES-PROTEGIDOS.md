# HU-023 — Consultar materiales protegidos

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 3 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno matriculado**, quiero **ver los materiales y descargar solo los autorizados**, para
> **estudiar sin exponer contenido privado a terceros**.

## Alcance incluido

- Visualización de archivos, YouTube no listado y enlaces de nube dentro de la lección.
- Recursos en el orden administrativo, sin material principal.
- Descarga disponible únicamente si ese material la permite.
- Cada solicitud valida identidad, matrícula, estado de acceso y pertenencia al curso.
- Compartir un enlace directo no concede acceso.
- Solo una lección marcada por administración como vista previa permite contenido público sin
  matrícula; todas las demás exigen identidad y acceso válido en cada solicitud.
- En un curso completamente CANCELADO, un alumno que ya tenía acceso conserva únicamente los
  materiales que estuvieron disponibles antes de la cancelación. Esta excepción no abre contenido
  nuevo ni aplica a una matrícula CANCELADA individualmente o aprobada después de cancelar.

## Flujo principal

1. El alumno abre una lección autorizada.
2. ESEJUR valida acceso y muestra materiales en orden.
3. El alumno visualiza y descarga solo cuando la opción está habilitada.

## Criterios de aceptación

- **Dado** matrícula válida, **cuando** abre material, **entonces** puede verlo en línea.
- **Dado** descarga desactivada, **cuando** consulta, **entonces** no se ofrece descarga.
- **Dado** un enlace compartido a otra persona, **cuando** lo abre sin autorización, **entonces** no
  obtiene el archivo.
- **Dado** matrícula vencida o cancelada individualmente, **cuando** solicita material, **entonces**
  se rechaza.
- **Dado** cancelación completa con acceso previo, **cuando** solicita un material previamente
  disponible, **entonces** puede consultarlo mientras no sea un enlace de reunión futura.

## Dependencia interna

- Depende de HU-022 para el acceso integrado.
- Puede adelantarse con sesión y material controlados.

## Orientación de trabajo

- **Frontend:** visor, orden y acción de descarga condicional.
- **Backend:** autorización en cada entrega y conservación de referencias.
- **Integración:** el visor y la descarga deben consultar la matrícula, la vigencia y el permiso del
  material en cada acceso; copiar una dirección directa no debe evitar estas validaciones.

## Demostración esperada

Demostrar visualización, descarga permitida y rechazo con enlace copiado.
