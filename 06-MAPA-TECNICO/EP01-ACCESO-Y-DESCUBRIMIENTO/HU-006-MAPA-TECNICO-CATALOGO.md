# HU-006 — Mapa técnico de catálogo, búsqueda y filtros

## Resultado que debe entregar

Un visitante consulta los 15 cursos cargados, busca por título o descripción, combina un tipo y una
categoría, limpia filtros, pagina resultados y abre la ruta correcta de cada ficha. No necesita
sesión y no recibe información protegida.

## Punto de partida y tablas

- Frontend: `features/cursos/catalogo` presenta seis tarjetas estáticas, texto de nueve cursos y
  enlaces repetidos incorrectos.
- Backend: no existen entidades ni endpoints de catálogo.
- Tablas: `curso`, `tipo_curso`, `categoria_tematica`, `estado_curso`, `curso_docente`, `persona` y
  `matricula`.

## Contratos que deben acordarse

| Operación | Método y ruta | Resultado conceptual |
|---|---|---|
| Listar cursos | `GET /api/publico/cursos` | Página de tarjetas según búsqueda y filtros |
| Consultar filtros | `GET /api/publico/cursos/filtros` | Tipos y categorías activos y ordenados |

El listado acepta texto, código de tipo, código de categoría, página y tamaño. La ausencia de tipo o
categoría significa “Todos”. Modalidad no es un filtro.

Cada tarjeta debe recibir: `urlAmigable`, título, descripción breve, portada, modalidad, tipo,
categoría, docentes mínimos, horas, precio aplicable, precio regular cuando hay promoción,
destacado y estado comercial ya calculado con sus datos necesarios.

## Trabajo del backend

### Componentes

- entidades y repositorios del agregado de catálogo;
- proyección específica para la tarjeta, sin cargar la ficha completa;
- filtro dinámico que solo aplica criterios presentes;
- consulta agrupada para matrículas activas;
- consulta por lote de docentes para todos los cursos de la página;
- `CourseCommercialStatusService` compartido con HU-007;
- `CatalogoServicio` de solo lectura;
- `CatalogoControlador` público y documentado.

### Selección de cursos

1. Excluir borradores y cancelados.
2. Exigir publicación real.
3. Buscar sin distinguir mayúsculas en título y descripción.
4. Aplicar tipo y categoría por código estable.
5. Contar únicamente matrículas `ACTIVA`.
6. Obtener docentes respetando `curso_docente.orden` sin una consulta por tarjeta.
7. Calcular estado comercial en `America/Lima`.
8. Ordenar destacados antes que no destacados.
9. Dentro de cada grupo ordenar inicio inmediato, futuros más próximos y cursos en progreso.
10. Paginar después de aplicar filtros y orden.

### Estado comercial único

El servicio compartido evalúa de forma consistente:

- sin cupos cuando capacidad existe y activos alcanzan el máximo;
- matrícula cerrada cuando el curso o cierre comercial no permite ingreso;
- inicio inmediato para virtual sin inicio;
- fecha próxima antes de iniciar;
- en progreso después del inicio;
- badge “En vivo” para `EN_VIVO` e `HIBRIDO`.

La misma función conceptual se usa en ficha; no se duplican condiciones en dos servicios.

## Trabajo del frontend

- Crear modelos de tarjeta, docente breve, filtro y página.
- Crear `CursoApiService` para listado y filtros.
- Configurar `HttpClient` y URL base en un solo lugar.
- Sustituir todas las tarjetas escritas a mano por un recorrido de la respuesta.
- Enlazar buscador y dos selectores a un estado controlado.
- Esperar brevemente al escribir antes de consultar para evitar una petición por tecla.
- Reiniciar a primera página al cambiar búsqueda o filtro.
- Mantener página al navegar solo cuando siga siendo válida.
- Actualizar cantidad con `totalElements`, no con texto fijo.
- Mostrar esqueletos o carga, error recuperable, grilla y vacío de forma excluyente.
- “Limpiar todo” restablece texto, tipo, categoría y página.
- Cada botón usa `/cursos/{urlAmigable}`; se elimina `/cursos/registral-notarial`.
- Conservar el hero visual sin mezclar su lógica con la consulta de catálogo.

## Pruebas mínimas

- catálogo público con 15 datos de prueba y paginación;
- búsqueda por título y descripción;
- cada filtro, combinación y “Todos”;
- modalidad ausente de filtros;
- orden de destacados e inicio;
- virtual, futuro, progreso, cerrado y sin cupos;
- docentes en orden y cursos con dos docentes;
- página vacía y limpieza;
- navegación de varias tarjetas a slugs distintos;
- comprobación de que la respuesta no contiene alumnos, enlaces protegidos ni certificados.

## Terminado cuando

No quedan cursos ni conteos estáticos, toda interacción consulta datos reales, los 15 slugs navegan
correctamente y el catálogo cumple filtros, orden, estados y protección de información.

## Implementación guiada para copiar y adaptar

### 1. Archivos en orden

1. Mapear `Curso`, `TipoCurso`, `CategoriaTematica`, `EstadoCurso`, `Matricula`, `CursoDocente` y
   `Persona` con Lombok y nombres del SQL.
2. Crear los DTO de tarjeta y reutilizar `PageResponse` para la paginación.
3. Crear repositorios de curso, matrícula, docentes, tipos y categorías.
4. Reutilizar `CourseCommercialStatusService`, luego crear el servicio de catálogo y el controlador.
5. Crear modelos, `curso-api.service.ts` y reemplazar las tarjetas estáticas.

### 2. Consulta principal paginada

`CursoRepositorio` extiende `JpaRepository<Curso, Long>`. Esta consulta filtra antes de paginar:

```java
@Query(value = """
    select new pe.edu.utp.escuela.app.dto.CursoTarjetaFila(
        c.id, c.urlAmigable, c.titulo, c.descripcion, c.imagenPortadaUrl,
        c.modalidad, c.tipoVenta, c.destacado, c.precioRegular,
        c.precioPromocional, c.promocionInicioEn, c.promocionFinEn,
        c.fechaInicio, c.fechaFin, c.fechaCierreMatricula, c.cupoMaximo,
        c.horasAcademicas, t.codigo, t.nombre, ca.codigo, ca.nombre, e.codigo)
    from Curso c left join c.tipoCurso t left join c.categoriaTematica ca
    join c.estadoCurso e
    where c.publicadoEn is not null
      and e.codigo not in ('BORRADOR', 'CANCELADO')
      and (:texto is null or lower(c.titulo) like concat('%', :texto, '%')
           or lower(coalesce(c.descripcion, '')) like concat('%', :texto, '%'))
      and (:tipo is null or t.codigo = :tipo)
      and (:categoria is null or ca.codigo = :categoria)
    order by case when c.destacado = true then 0 else 1 end,
             case when c.fechaInicio is null then 0
                  when c.fechaInicio >= current_date then 1 else 2 end,
             c.fechaInicio asc nulls first, c.id asc
    """,
    countQuery = """
    select count(c.id) from Curso c
    left join c.tipoCurso t left join c.categoriaTematica ca join c.estadoCurso e
    where c.publicadoEn is not null
      and e.codigo not in ('BORRADOR', 'CANCELADO')
      and (:texto is null or lower(c.titulo) like concat('%', :texto, '%')
           or lower(coalesce(c.descripcion, '')) like concat('%', :texto, '%'))
      and (:tipo is null or t.codigo = :tipo)
      and (:categoria is null or ca.codigo = :categoria)
    """)
Page<CursoTarjetaFila> buscarPublicados(String texto, String tipo,
                                        String categoria, Pageable pageable);
```

Antes de llamar se transforma texto vacío a `null`, se pasa a minúsculas y se limita el tamaño
entre 1 y 50. La consulta de conteo no une docentes ni matrículas para no duplicar filas.

### 3. Consultas por lote

```java
@Query("""
    select m.curso.id, count(m.id) from Matricula m
    where m.curso.id in :cursoIds and m.estado = 'ACTIVA'
    group by m.curso.id
    """)
List<Object[]> contarActivasPorCurso(Collection<Long> cursoIds);

@Query("""
    select new pe.edu.utp.escuela.app.dto.DocenteCursoFila(
        cd.curso.id, p.id, p.nombres, p.apellidoPaterno,
        p.apellidoMaterno, p.fotoUrl, p.cargoProfesional, cd.orden)
    from CursoDocente cd join cd.persona p
    where cd.curso.id in :cursoIds and p.activo = true
    order by cd.curso.id, cd.orden
    """)
List<DocenteCursoFila> buscarDocentesDeCursos(Collection<Long> cursoIds);
```

Primero se obtiene la página; después se extraen sus IDs y se ejecutan estas consultas. Son tres
consultas por página, no una adicional por tarjeta.

### 4. Servicio

```java
@Transactional(readOnly = true)
public PageResponse<CursoTarjetaRespuesta> listar(
        String texto, String tipo, String categoria, int pagina, int tamano) {
    int limite = Math.max(1, Math.min(tamano, 50));
    Page<CursoTarjetaFila> filas = cursoRepositorio.buscarPublicados(
            normalizarFiltro(texto), normalizarCodigo(tipo), normalizarCodigo(categoria),
            PageRequest.of(Math.max(pagina, 0), limite));
    if (filas.isEmpty()) {
        return PageResponse.from(List.of(), filas);
    }
    List<Long> ids = filas.getContent().stream().map(CursoTarjetaFila::cursoId).toList();
    Map<Long, Long> activas = matriculaRepositorio.contarActivas(ids);
    Map<Long, List<DocenteBreveRespuesta>> docentes = cursoDocenteRepositorio.agrupar(ids);
    List<CursoTarjetaRespuesta> elementos = filas.stream()
            .map(f -> mapear(f, activas.getOrDefault(f.cursoId(), 0L),
                             docentes.getOrDefault(f.cursoId(), List.of())))
            .toList();
    return PageResponse.from(elementos, filas);
}
```

Los auxiliares `contarActivas` y `agrupar` convierten resultados a `Map`, no consultan otra vez.
El mapper llama a `CourseCommercialStatusService`, que ya calcula la promoción con el reloj de Lima.

### 5. Filtros y controlador

```java
List<TipoCurso> findByActivoTrueOrderByOrdenAscNombreAsc();
List<CategoriaTematica> findByActivoTrueOrderByOrdenAscNombreAsc();
```

```java
@GetMapping
public PageResponse<CursoTarjetaRespuesta> listar(
        @RequestParam(required = false) String texto,
        @RequestParam(required = false) String tipo,
        @RequestParam(required = false) String categoria,
        @RequestParam(defaultValue = "0") @Min(0) int pagina,
        @RequestParam(defaultValue = "9") @Min(1) int tamano) {
    return catalogoServicio.listar(texto, tipo, categoria, pagina, tamano);
}
```

La clase usa `/api/publico/cursos`; `GET /filtros` devuelve tipos y categorías activos ordenados.

### 6. Angular

```ts
@Injectable({ providedIn: 'root' })
export class CursoApiService {
  private readonly http = inject(HttpClient);
  listar(f: FiltroCurso) {
    let params = new HttpParams().set('pagina', f.pagina).set('tamano', f.tamano);
    if (f.texto) params = params.set('texto', f.texto);
    if (f.tipo) params = params.set('tipo', f.tipo);
    if (f.categoria) params = params.set('categoria', f.categoria);
    return this.http.get<PageResponse<CursoTarjeta>>(
      `${API_URL}/publico/cursos`, { params });
  }
  filtros() {
    return this.http.get<FiltrosCursoRespuesta>(`${API_URL}/publico/cursos/filtros`);
  }
}
```

`catalogo.ts` usa formulario reactivo y
`valueChanges.pipe(debounceTime(300), distinctUntilChanged(), switchMap(...))`. El HTML recorre
`page.items` y enlaza `['/cursos', curso.urlAmigable]`. Se eliminan tarjetas, conteos y slugs
fijos; carga, error, vacío y grilla son estados excluyentes.

### 7. Prueba manual

Abrir nueve tarjetas, pasar a los otros seis cursos, combinar filtros, limpiar, buscar por título y
descripción y abrir tres slugs distintos. La respuesta no debe contener alumnos ni referencias de
materiales.
