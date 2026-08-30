# HU-021 — Consultar mis cursos y accesos

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Alumno |
| Incremento | Mes 2 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **alumno**, quiero **consultar mis matrículas y continuar los cursos disponibles**, para
> **entender qué puedo usar ahora y conservar mis resultados históricos**.

## Alcance incluido

- “Mis cursos” utiliza dos pestañas de navegación: **En progreso** y **Completados**. No son chips,
  etiquetas ni filtros del catálogo. La pestaña activa se distingue visualmente y al seleccionarla
  cambia la lista mostrada.
- Tarjeta con curso, modalidad, avance disponible y acción “Continuar” cuando procede.
- Cada tarjeta muestra una versión compacta del avance hacia la certificación: condiciones activas,
  valor real, meta y siguiente acción cuando exista.
- ACTIVA es derecho concedido; el uso exige cuenta habilitada y fecha de inicio alcanzada.
- Una matrícula VENCIDA o cancelada individualmente no permite contenido, pero conserva
  finalización y certificado. Si se canceló el curso completo, un alumno que ya tenía acceso puede
  consultar el contenido previamente disponible, excepto enlaces de reuniones futuras; una
  matrícula aprobada después de esa cancelación queda CANCELADA y nunca abre contenido.
- Un curso CERRADO no admite nuevas matrículas, pero el alumno ya matriculado conserva su acceso
  mientras su matrícula siga ACTIVA y vigente.
- Con fecha de inicio futura se muestra el temario completo, pero no el contenido protegido de las
  lecciones; se presenta la fecha y una cuenta regresiva en `America/Lima`.
- VIRTUAL sin inicio abre al activar matrícula; sin fecha de fin permanece hasta cierre manual.
- No muestra cursos de otras personas.

## Flujo principal

1. El alumno inicia sesión y abre “Mis cursos”.
2. ESEJUR abre inicialmente la pestaña “En progreso”, reúne sus matrículas y calcula el acceso actual.
3. El alumno puede cambiar a “Completados” sin usar los filtros del catálogo.
4. Cada pestaña muestra el estado y la acción aplicable de sus cursos.
5. “Continuar” conduce a HU-022 cuando el contenido está habilitado.

## Criterios de aceptación

- **Dado** ACTIVA, cuenta habilitada y fecha alcanzada, **cuando** consulta, **entonces** puede
  continuar.
- **Dado** ACTIVA con inicio futuro, **cuando** consulta, **entonces** ve la fecha y no abre antes.
- **Dado** ACTIVA con inicio futuro, **cuando** revisa la tarjeta o el aula previa, **entonces** ve
  temario y cuenta regresiva, pero ningún video, archivo, enlace ni examen protegido.
- **Dado** matrícula VENCIDA, cancelada individualmente o aprobada después de cancelar el curso,
  **cuando** consulta, **entonces** no abre contenido, pero el certificado propio ya emitido continúa
  disponible en “Mis certificados”.
- **Dado** curso completo CANCELADO y acceso previo, **cuando** consulta, **entonces** puede revisar
  el contenido que ya estuvo disponible en modo lectura, pero no registra nuevos checks, progreso,
  intentos, asistencia ni finalización. Si finalizó antes, su certificación sí continúa.
- **Dado** otro alumno, **cuando** inicia sesión, **entonces** nunca ve estas matrículas.
- **Dado** la pantalla “Mis cursos”, **cuando** cambia entre “En progreso” y “Completados”,
  **entonces** solo una pestaña queda activa y la lista corresponde a esa selección.

## Dependencia interna

- Para datos reales necesita HU-017, HU-018 o HU-019.
- Puede adelantarse con una matrícula controlada.

## Orientación de trabajo

- **Frontend:** tarjetas, estados, fecha futura y acciones.
- **Backend:** propiedad, acceso efectivo y conservación histórica.
- **Integración:** cada tarjeta debe derivarse de la matrícula real y mostrar curso, estado, fechas,
  progreso y acción correcta: esperar inicio, continuar, acceso vencido, cancelado o certificado.

## Demostración esperada

Demostrar matrícula usable, futura, vencida y completada.
