# Guía para convertir las historias en un documento Word

## Instrucción principal para la IA

Crear un documento Word académico, ordenado y visualmente profesional a partir de esta carpeta,
**sin resumir ni eliminar reglas, flujos, excepciones, cálculos, estados, permisos, dependencias o
criterios de aceptación**. Las historias son autosuficientes y constituyen el contenido funcional
completo.

## Orden obligatorio del Word

1. Portada del proyecto ESEJUR.
2. Índice automático.
3. Objetivo, actores, regla de máximo dos personas y seis épicas funcionales.
4. Épica 1: descripción, entregable, dependencias, diagrama de casos de uso e historias HU-001 a
   HU-007.
5. Épica 2 — Administración y publicación: descripción, entregable, dependencias, diagrama e
   historias HU-008 a HU-016.
6. Épica 3 — Matrículas y accesos: descripción, entregable, dependencias, diagrama e historias
   HU-017, HU-019, HU-020, HU-021 y HU-041.
7. Épica 4 — Aula, progreso y sesiones: descripción, entregable, dependencias, diagrama e historias
   HU-022 a HU-027 y HU-045.
8. Épica 5 — Evaluación y certificación: descripción, entregable, dependencias, diagrama e
   historias HU-028 a HU-034, HU-043 y HU-044.
9. Épica 6 — Pagos y control: descripción, entregable, dependencias, diagrama e historias HU-035 a
   HU-040, HU-042, HU-046 y HU-047.

HU-018 permanece retirado. Su alcance de pago automático mediante Culqi está consolidado en
HU-047 y no debe generarse como una historia adicional.

La matriz de cobertura y la auditoría son instrumentos internos de control y no se incorporan al
Word, salvo que el usuario las solicite expresamente como anexos.

## Tratamiento de cada historia

- Mantener ID y título.
- Presentar información general en tabla.
- Destacar la frase `Como / quiero / para`.
- Conservar alcance, precondiciones, flujo principal, alternativas y excepciones.
- Conservar todos los escenarios `Dado / Cuando / Entonces` sin fusionarlos.
- Separar frontend, backend e integración.
- Mostrar dependencia interna, personas recomendadas y demostración esperada.
- Mantener los códigos RN/decisiones como anexo de trazabilidad, no como sustituto del texto.

## Diagramas de casos de uso

Antes de las historias de cada épica, generar el diagrama siguiendo exactamente el archivo
`01-GUIA-CASOS-DE-USO.md` de esa carpeta:

- UML clásico estilo Rational Rose.
- Blanco y negro, fondo blanco.
- Actores de palo fuera del límite de ESEJUR.
- Casos como elipses y relaciones `<<include>>`/`<<extend>>`.
- Formato horizontal y legible en página apaisada si fuera necesario.
- No inventar actores, funcionalidades o integraciones.

## Presentación visual sugerida

- Títulos numerados y consistentes.
- Tablas con encabezado gris claro y bordes discretos.
- Escenarios de aceptación en bloques separados.
- Dependencias mediante tabla y diagrama simple de flechas.
- Saltos de página entre historias.
- Encabezado con épica e ID; pie con numeración de página.
- No usar colores intensos ni gráficos decorativos que resten legibilidad.

## Prohibiciones

- No reducir varias historias a un resumen.
- No transformar reglas funcionales en decisiones técnicas.
- No inventar fechas, contraseñas, estados, montos, porcentajes o actores.
- No cambiar `VIRTUAL`, `EN_VIVO`, `HIBRIDO` ni estados definidos.
- No afirmar que ESEJUR procesa pagos, controla Zoom, factura SUNAT o devuelve dinero.
- No omitir escenarios de error o duplicidad.
- No presentar una historia como terminada solo con frontend o backend.

## Prompt listo para usar

> Genera un Word profesional y académico con todas las historias de usuario de esta carpeta. Lee
> primero 00-INDICE-Y-PLAN.md y después cada carpeta de épica en orden. No incluyas la matriz de
> cobertura interna en el Word. Conserva íntegramente cada regla, flujo, excepción, criterio,
> dependencia y orientación frontend/backend. Inserta al inicio de cada épica un diagrama UML de
> casos de uso estilo Rational Rose siguiendo su 01-GUIA-CASOS-DE-USO.md. No resumas ni inventes
> funcionalidad. Cada épica debe cerrar mostrando su entregable funcional demostrable.
