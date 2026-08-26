# HU-033 — Consultar y descargar mis certificados

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 5 |
| Personas recomendadas | 1 |
| Responsable | Por asignar |

## Historia

> Como **alumno**, quiero **consultar y descargar exclusivamente mis certificados vigentes**, para
> **conservar evidencia privada de mis cursos completados**.

## Especificación completa

- “Mis certificados” requiere sesión y solo lista certificados del alumno autenticado.
- Muestra curso, nivel Normal/Refrendado, entidad cuando aplica, fecha de emisión, código y estado.
- Un certificado VIGENTE ofrece descarga de su versión actual.
- Una corrección reemplaza la versión descargable; la anterior no se entrega.
- Un ANULADO permanece listado como no válido, pero su PDF deja de estar disponible.
- Vencer/cancelar la matrícula no elimina certificados emitidos.
- El enlace de correo abre la descarga después de comprobar identidad; compartirlo no concede acceso.
- El correo nunca adjunta el PDF.

## Criterios de aceptación

- **Dado** certificado propio VIGENTE, **cuando** consulta, **entonces** puede descargar la versión
  actual.
- **Dado** certificado ajeno o sesión inexistente, **cuando** usa un enlace directo, **entonces** no
  obtiene datos ni PDF.
- **Dado** certificado ANULADO, **cuando** consulta, **entonces** ve que no es válido y no descarga.
- **Dado** matrícula VENCIDA/CANCELADA, **cuando** consulta, **entonces** conserva su certificado.

## Dependencia interna

- Depende de HU-032 o HU-035 para un certificado real.

## Orientación de trabajo

- **Frontend:** listado privado, estados y descarga solo cuando está VIGENTE.
- **Backend:** propiedad, entrega protegida y selección de versión actual.
- **Integración:** listado → descarga autorizada → rechazo ajeno/anulado.

## Demostración esperada

Mostrar certificado vigente, corregido y anulado; probar enlace propio y ajeno. Una persona puede
desarrollarla y otra debe revisar autorización/privacidad.
