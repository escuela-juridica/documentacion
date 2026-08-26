# HU-009 — Administrar información base

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 2 |
| Personas recomendadas | 1 |
| Responsable | Por asignar |

## Historia

> Como **administrador**, quiero **mantener la información reutilizable de la oferta**, para
> **configurar cursos y certificados sin depender de cambios de código**.

## Alcance incluido

- Tipos de curso y categorías temáticas como clasificaciones independientes.
- Docentes públicos: nombre, foto, cargo y biografía; sin cuenta, acceso, panel ni página pública
  independiente. Sus datos se muestran dentro de las tarjetas y fichas de los cursos asignados.
- Entidades certificadoras/refrendantes.
- Firmantes: nombre, cargo, imagen de firma y estado activo.
- Extensiones de archivo permitidas y tamaño máximo.
- Activar o desactivar elementos sin borrar la información usada históricamente.

## Valores iniciales administrables

Los valores iniciales forman parte de la entrega, pero no quedan fijos: administración puede
agregar, editar, activar o desactivar valores sin modificar código.

- **Tipos de curso:** Diplomado; Programa de actualización; Curso especializado; Seminario;
  Taller de casos prácticos; Congreso / Conferencia; In-house.
- **Duraciones de referencia, no bloqueantes:** Diplomado de 92 a 180 horas; Curso de 24 a 50
  horas; Seminario de 12 horas o más. Sirven como orientación y no impiden guardar otra duración.
- **Categorías:** Derecho Registral; Derecho Notarial; Derecho Inmobiliario; Derecho Urbanístico;
  Derecho Administrativo; Gestión Pública; Habilidades profesionales (redacción y argumentación
  jurídica).
- **Entidades iniciales:** Colegio de Abogados de Lima; Colegio de Abogados de Lima Sur; Ilustre
  Colegio de Abogados de Cañete.
- **Firmantes iniciales:** Mgt. Lilia Mercedes Guerra Macedo, Directora Ejecutiva; Mgt. Yourka
  Lisbeth Lucich Berrio, Comité Consultivo de Asuntos Académicos.
- **Tipos de material:** PDF, DOC, PPT, EXCEL, IMAGEN, AUDIO, VIDEO, ZIP y ENLACE.

“In-house” se conserva únicamente como etiqueta comercial de tipo de curso. No crea grupos,
matrículas corporativas, accesos cerrados ni reglas especiales de venta.

## Flujo principal

1. Administración selecciona el tipo de información.
2. Consulta activos e inactivos.
3. Crea o edita un elemento válido.
4. Activa el elemento para nuevas selecciones o lo desactiva para impedir nuevas asignaciones sin
   eliminar las referencias históricas.
5. El elemento queda disponible para nuevas configuraciones sin alterar cursos o certificados
   históricos.

## Criterios de aceptación

- **Dado** un docente, **cuando** se guarda, **entonces** solo existe como perfil público y no se
  crea acceso al sistema.
- **Dado** una entidad o firmante utilizado, **cuando** se desactiva, **entonces** no aparece para
  nuevas selecciones, pero los certificados emitidos conservan su copia.
- **Dado** tipo y categoría, **cuando** se asignan a un curso, **entonces** permanecen como dos ejes
  independientes.
- **Dado** una regla de archivo, **cuando** se configura, **entonces** se aplica a nuevas cargas y se
  informa antes de aceptar un archivo inválido.
- **Dado** los valores iniciales, **cuando** se habilita la administración, **entonces** están
  disponibles para nuevas configuraciones y pueden desactivarse sin alterar usos históricos.
- **Dado** el tipo In-house, **cuando** se asigna a un curso, **entonces** funciona solo como
  clasificación visible y no cambia la matrícula ni el acceso.

## Dependencia interna

- Ninguna dentro de la épica.
- HU-010 utiliza estos valores; puede adelantarse con valores acordados.

## Orientación de trabajo

- **Frontend:** listados, formularios, activos/inactivos y validaciones visibles.
- **Backend:** conservación histórica, selección de activos y reglas de archivo.
- **Integración:** altas y desactivaciones disponibles en configuración de cursos/certificados.

## Demostración esperada

Demostrar alta, edición y desactivación, más la conservación de una referencia histórica. Una
persona puede desarrollarla y otra debe revisar la integración.
