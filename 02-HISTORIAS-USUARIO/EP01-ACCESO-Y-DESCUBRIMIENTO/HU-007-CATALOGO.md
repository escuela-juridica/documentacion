# HU-007 — Explorar, buscar y filtrar cursos

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Visitante |
| Incremento | Mes 1 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **visitante**, quiero **explorar, buscar y filtrar la oferta**, para **encontrar un curso
> jurídico adecuado sin registrarme primero**.

## Alcance incluido

- Catálogo público con tarjetas que muestran imagen, tipo de curso, título, avatares de docentes,
  fecha de inicio o estado y el botón “Ver detalles”.
- Búsqueda sobre título y descripción.
- Dos selectores independientes: **Tipo de curso** y **Categoría temática**. Cada selector permite
  un valor a la vez y comienza en “Todos”. El visitante puede combinar ambos entre sí y con el
  buscador.
- La modalidad aparece como información de la tarjeta, pero no forma parte de los filtros.
- Curso destacado antes que no destacado.
- Dentro de cada grupo: VIRTUAL con inicio inmediato, fechas futuras más próximas y luego cursos en
  progreso.
- Badge “En vivo” para `EN_VIVO` e `HIBRIDO`.
- Estados comerciales visibles derivados de los datos reales: “Inicio inmediato” para VIRTUAL sin
  fecha de inicio; “Inicia el [fecha]” antes de una fecha futura; “En progreso” después de iniciar;
  “Matrícula cerrada” al alcanzar el cierre comercial; y “Sin cupos” cuando las matrículas ACTIVA
  alcanzan la capacidad configurada.
- Resultado vacío comprensible.
- Todas las fechas y horas comerciales se muestran en la zona `America/Lima`.

## Flujo principal

1. El visitante abre el catálogo sin iniciar sesión.
2. Visualiza la oferta en el orden acordado.
3. Escribe una búsqueda o elige un tipo y una categoría en sus selectores.
4. ESEJUR muestra solo coincidencias y permite volver individualmente a “Todos” o limpiar todo.
5. Selecciona un curso para HU-008.

## Criterios de aceptación

- **Dado** cursos destacados y no destacados, **cuando** abre el catálogo, **entonces** los
  destacados aparecen primero y cada grupo respeta el orden temporal definido.
- **Dado** una palabra en título o descripción, **cuando** busca, **entonces** obtiene coincidencias.
- **Dado** tipo y categoría, **cuando** combina filtros, **entonces** se aplican ambos ejes.
- **Dado** un selector sin elección específica, **cuando** conserva “Todos”, **entonces** ese eje
  no excluye cursos.
- **Dado** la modalidad de un curso, **cuando** consulta los filtros, **entonces** la modalidad no
  aparece como tercer selector; se comunica en la tarjeta mediante su etiqueta informativa.
- **Dado** un curso EN_VIVO o HIBRIDO, **cuando** aparece, **entonces** muestra el badge “En vivo”.
- **Dado** cualquier tarjeta visible, **cuando** se presenta, **entonces** contiene imagen, tipo,
  título, docentes, fecha o estado y una acción para consultar los detalles.
- **Dado** ningún resultado, **cuando** filtra, **entonces** recibe un estado vacío y puede limpiar.
- **Dado** un curso con fecha u hora, **cuando** se muestra su estado comercial, **entonces** la
  comparación y el texto visible utilizan `America/Lima`.

## Datos y permisos

El catálogo nunca expone matrículas, alumnos, materiales protegidos ni certificados. No requiere
sesión.

## Dependencia interna

- Ninguna. Puede comenzar con cursos controlados.
- HU-008 se integra mediante la selección de una tarjeta.

## Orientación de trabajo

- **Frontend:** tarjetas, búsqueda, selectores de tipo y categoría, orden y estados vacíos.
- **Backend:** selección pública de cursos, búsqueda y orden coherente.
- **Integración:** combinación de búsqueda, filtros y navegación a ficha.

## Demostración esperada

Buscar por descripción, elegir tipo y categoría, volver a “Todos”, limpiar la búsqueda y comprobar
el orden con cursos virtuales, futuros, en progreso y destacados.
