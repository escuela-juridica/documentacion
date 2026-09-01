# HU-007 — Mapa técnico de ficha y vista previa

## Resultado que debe entregar

Un visitante abre `/cursos/{urlAmigable}`, consulta la ficha completa según modalidad, explora el
temario y reproduce o abre únicamente los recursos de lecciones marcadas como vista previa. Los
materiales protegidos nunca se entregan por conocer su dirección.

## Punto de partida y tablas

- Frontend: `features/cursos/ficha-curso` es una pantalla pendiente y no lee el parámetro de ruta.
- Backend: no existe consulta pública de ficha ni autorización de vista previa.
- Tablas: `curso`, maestros, `curso_docente`, `persona`, `modulo`, `leccion`, `material_leccion`,
  `recurso` y `matricula`.
- Se integra con HU-006, pero puede probarse directamente con `/cursos/registral`.

## Contratos que deben acordarse

| Operación | Método y ruta | Resultado conceptual |
|---|---|---|
| Consultar ficha | `GET /api/publico/cursos/{urlAmigable}` | Datos comerciales, docentes y temario seguro |
| Abrir vista previa | `GET /api/publico/cursos/{urlAmigable}/lecciones/{leccionId}/vista-previa` | Recursos permitidos o rechazo |

La ficha puede informar título de todas las lecciones y duración detectada, pero no entrega
`recurso.referencia` de contenido protegido. El endpoint de vista previa vuelve a comprobar curso,
lección, actividad y bandera pública antes de entregar una referencia.

## Trabajo del backend

### Componentes

- proyecciones para cabecera de ficha, docente, módulo, lección y recurso público;
- consultas separadas y por lote para evitar una unión cartesiana difícil de mantener;
- `FichaCursoServicio` de solo lectura que arma un DTO jerárquico;
- reutilización de `CourseCommercialStatusService` de HU-006;
- servicio de autorización de vista previa;
- controlador público con respuesta de no encontrado uniforme.

### Consultas en orden

1. Buscar por `url_amigable`, exigir publicación y excluir borrador o cancelado.
2. Recuperar tipo, categoría, entidad, precios, promoción, modalidad, fechas, capacidad, horas y
   beneficios.
3. Contar matrículas activas para disponibilidad.
4. Obtener docentes activos ordenados, con foto, cargo y biografía.
5. Obtener módulos activos por orden.
6. Obtener todas sus lecciones activas por módulo y orden.
7. Calcular duración visible desde recursos de video sin incluir su referencia protegida.
8. Para la vista previa seleccionada, consultar materiales solo si `es_vista_previa` es verdadero.

### Reglas de presentación preparadas por backend

- Precio promocional solo cuando corresponda por configuración y vigencia.
- Virtual sin fecha: inicio inmediato y sin fin ni calendario.
- Virtual con inicio: muestra inicio, nunca fin.
- En vivo o híbrido: inicio, fin, sesiones fechadas y datos para calendario.
- Capacidad nula: no inventar límite.
- Curso gratuito disponible: acción conceptual “Acceder gratis”.
- Curso pagado disponible: acción conceptual “Pagar ahora”.
- Cerrado o sin cupos: acción deshabilitada y causa visible.
- Todas las fechas se entregan sin textos preformateados para que Angular las muestre en Lima.

## Protección de recursos

- El listado de temario no entrega enlace de reunión ni referencia de material privado.
- La vista previa se autoriza en cada solicitud; no basta con que Angular oculte un botón.
- Una lección no pública devuelve prohibición o no encontrado según el contrato de seguridad.
- Si el origen es YouTube, solo se entrega públicamente cuando la lección es vista previa.
- Los archivos locales de datos iniciales deben existir realmente o sustituirse por recursos de
  prueba servibles; una fila SQL por sí sola no crea el archivo.

## Trabajo del frontend

- Leer `urlAmigable` desde `ActivatedRoute` y reaccionar si cambia sin destruir toda la aplicación.
- Crear método de detalle en `CursoApiService` reutilizando tipos compartidos con catálogo.
- Implementar estados: carga, ficha, no encontrada, error y reintento.
- Sustituir la pantalla pendiente por cabecera, docentes, descripción, panel comercial, ficha
  técnica, beneficios y temario.
- Implementar “Leer más” solo cuando la descripción lo requiera.
- Crear acordeones accesibles de módulos y lecciones.
- Mostrar duración solo cuando venga informada.
- Construir calendario únicamente para en vivo e híbrido.
- Solicitar la vista previa cuando el visitante la selecciona; no precargar referencias privadas.
- Mostrar reproductor o recurso según tipo y limpiar el anterior al cambiar.
- Para lección protegida, mostrar requisito de matrícula sin realizar petición pública de recurso.
- Las acciones de pago o acceso se muestran, pero su operación completa pertenece a EP02; si
  requieren cuenta, orientan a acceso o registro sin conceder contenido.

## Pruebas mínimas

- ficha virtual inmediata, en vivo e híbrida;
- promoción vigente y ausencia de promoción;
- gratuito y pagado;
- capacidad libre, ilimitada y sin cupos;
- docentes múltiples y biografías;
- módulos y lecciones ordenados;
- duración presente y ausente;
- vista previa válida sin sesión;
- lección protegida por interfaz y por llamada directa;
- slug inexistente, borrador y cancelado;
- ausencia de fin/calendario en virtual;
- calendario y zona Lima en sesiones;
- cambio de slug desde catálogo y recarga directa de la URL.

## Terminado cuando

Las fichas se generan completamente desde PostgreSQL, catálogo y ficha muestran el mismo estado
comercial, una vista previa real funciona sin cuenta y ninguna referencia protegida aparece en las
respuestas públicas.

## Implementación guiada para copiar y adaptar

### 1. Corregir primero la ruta Angular

En `app.routes.ts` se reemplaza `path: 'cursos/:id'` por:

```ts
{
  path: 'cursos/:urlAmigable',
  loadComponent: () =>
    import('./features/cursos/ficha-curso/ficha-curso').then(m => m.FichaCurso),
}
```

Catálogo y ficha comparten exactamente `urlAmigable`.

### 2. Consultas de cabecera y estructura

```java
public interface CursoRepositorio extends JpaRepository<Curso, Long> {
    @EntityGraph(attributePaths = {
        "tipoCurso", "categoriaTematica", "entidadCertificadora", "estadoCurso"
    })
    @Query("""
        select c from Curso c join c.estadoCurso e
        where c.urlAmigable = :slug and c.publicadoEn is not null
          and e.codigo not in ('BORRADOR', 'CANCELADO')
        """)
    Optional<Curso> buscarFichaPublica(String slug);
}

public interface ModuloRepositorio extends JpaRepository<Modulo, Long> {
    List<Modulo> findByCursoIdAndActivoTrueOrderByOrdenAsc(Long cursoId);
}

public interface LeccionRepositorio extends JpaRepository<Leccion, Long> {
    @Query("""
        select l from Leccion l
        where l.modulo.id in :moduloIds and l.activo = true
        order by l.modulo.id, l.orden
        """)
    List<Leccion> buscarActivasDeModulos(Collection<Long> moduloIds);
}
```

Docentes y matrículas activas reutilizan las consultas de HU-006.

### 3. Duración sin exponer el recurso

```java
public interface DuracionLeccionFila {
    Long getLeccionId();
    Integer getDuracionSegundos();
}

@Query("""
    select ml.leccion.id as leccionId, max(r.duracionSegundos) as duracionSegundos
    from MaterialLeccion ml join ml.recurso r
    where ml.leccion.id in :leccionIds
      and ml.activo = true and r.activo = true and r.tipo = 'VIDEO'
    group by ml.leccion.id
    """)
List<DuracionLeccionFila> buscarDuraciones(Collection<Long> leccionIds);
```

La proyección no contiene `referencia`, `enlaceReunion`, archivo privado ni descarga.

### 4. Armar la ficha

```java
@Transactional(readOnly = true)
public FichaCursoRespuesta obtener(String slug) {
    Curso curso = cursoRepositorio.buscarFichaPublica(slug)
            .orElseThrow(() -> new ResourceNotFoundException("No se encontró el curso"));
    long activas = matriculaRepositorio.contarActivasDelCurso(curso.getId());
    List<DocenteRespuesta> docentes = cursoDocenteRepositorio.buscarDelCurso(curso.getId());
    List<Modulo> modulos = moduloRepositorio
            .findByCursoIdAndActivoTrueOrderByOrdenAsc(curso.getId());
    List<Long> moduloIds = modulos.stream().map(Modulo::getId).toList();
    List<Leccion> lecciones = moduloIds.isEmpty() ? List.of()
            : leccionRepositorio.buscarActivasDeModulos(moduloIds);
    List<Long> leccionIds = lecciones.stream().map(Leccion::getId).toList();
    Map<Long, Integer> duraciones = leccionIds.isEmpty() ? Map.of()
            : materialRepositorio.duracionesPorLeccion(leccionIds);

    CourseCommercialData commercialData = commercialDataMapper.from(curso);
    return fichaMapper.armar(curso, activas, docentes, modulos, lecciones, duraciones,
            courseCommercialStatusService.calculate(commercialData, activas));
}
```

`commercialDataMapper` copia modalidad, tipo de venta, estado, precios, promoción, inicio, cierre y
cupo hacia el contrato `CourseCommercialData` ya definido. El mapper de ficha agrupa lecciones por
`modulo.id` preservando orden. Si no hay módulos devuelve `[]`.

### 5. Vista previa protegida

```java
@Query("""
    select new pe.edu.utp.escuela.app.dto.RecursoVistaPreviaFila(
        l.id, ml.id, ml.titulo, ml.orden, r.tipo, r.origen,
        r.referencia, r.nombreArchivo, r.tipoMime, r.duracionSegundos,
        ml.permiteDescarga)
    from MaterialLeccion ml
    join ml.leccion l join l.modulo m join m.curso c join ml.recurso r
    where c.urlAmigable = :slug and l.id = :leccionId
      and c.publicadoEn is not null
      and m.activo = true and l.activo = true and l.esVistaPrevia = true
      and ml.activo = true and r.activo = true
    order by ml.orden
    """)
List<RecursoVistaPreviaFila> buscarVistaPrevia(String slug, Long leccionId);
```

Solo esta consulta puede incluir `referencia` en una respuesta pública porque vuelve a comprobar
curso, lección y bandera. Una lista vacía se rechaza; no se intenta otra consulta menos estricta.

### 6. Endpoints

```java
@GetMapping("/{urlAmigable}")
public FichaCursoRespuesta obtener(@PathVariable String urlAmigable) {
    return fichaCursoServicio.obtener(urlAmigable);
}

@GetMapping("/{urlAmigable}/lecciones/{leccionId}/vista-previa")
public VistaPreviaRespuesta vistaPrevia(@PathVariable String urlAmigable,
                                        @PathVariable Long leccionId) {
    return fichaCursoServicio.obtenerVistaPrevia(urlAmigable, leccionId);
}
```

Ambos pertenecen a `/api/publico/cursos`. Pagar o matricular pertenece a la Épica 2.

### 7. Angular

```ts
detalle(slug: string) {
  return this.http.get<FichaCurso>(`${API_URL}/publico/cursos/${slug}`);
}
vistaPrevia(slug: string, leccionId: number) {
  return this.http.get<VistaPrevia>(
    `${API_URL}/publico/cursos/${slug}/lecciones/${leccionId}/vista-previa`);
}
```

`ficha-curso.ts` transforma `ActivatedRoute.paramMap` con `map`, `distinctUntilChanged` y
`switchMap`. La plantilla muestra carga, 404, reintento o contenido. Los módulos son acordeones con
`aria-expanded`; solo una lección marcada como previa llama al segundo endpoint. Al cambiar se
limpia el reproductor anterior.

Virtual oculta fin y calendario. En vivo e híbrido muestran fechas cuando existan. Precio,
promoción, cupo y acción se dibujan desde la respuesta; Angular no reimplementa el negocio.

### 8. Prueba de seguridad

Consultar la ficha y buscar URLs privadas en el JSON: no deben existir. La vista previa autorizada
funciona; cambiar manualmente lección o slug se rechaza. Borrador, cancelado y slug inexistente no
filtran información.
