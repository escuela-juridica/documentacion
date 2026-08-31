# EP01 — Guía para generar el diagrama de casos de uso

## Objetivo para la IA diagramadora

Generar un diagrama UML de casos de uso con apariencia clásica de **Rational Rose**, legible en
blanco y negro y adecuado para insertarse en un documento Word. El diagrama representa la épica
completa, no el flujo paso a paso de cada historia.

## Estilo Rational Rose

- Fondo blanco, líneas negras y tipografía sans serif simple.
- Un rectángulo grande como límite del sistema, titulado `ESEJUR — Acceso y descubrimiento`.
- Actores como figuras de palo, fuera del límite.
- Casos de uso como elipses blancas con borde negro y nombre verbal en español.
- Asociaciones mediante líneas continuas sin flechas.
- Dependencias `<<include>>` y `<<extend>>` con línea discontinua y flecha abierta.
- Sin colores, sombras, degradados, iconos, base de datos ni componentes técnicos.
- Distribución de izquierda a derecha, evitando cruces.
- No convertir criterios de aceptación en casos de uso separados.

## Actores

### Primarios, lado izquierdo

- `Visitante`
- `Alumno`
- `Administrador`

### Secundarios, lado derecho

- `Google`
- `Servicio de correo`

## Casos de uso dentro de ESEJUR

- Iniciar sesión con correo o Google.
- Crear cuenta con formulario o Google.
- Recuperar acceso a la cuenta.
- Consultar y actualizar datos personales.
- Explorar catálogo.
- Buscar y filtrar cursos.
- Consultar ficha de curso.
- Revisar lección de vista previa.
- Aceptar términos y política de privacidad.
- Verificar correo.

## Asociaciones

- Visitante: crear cuenta, recuperar acceso, explorar catálogo, buscar, consultar ficha y revisar
  vista previa.
- Alumno: iniciar sesión y consultar o actualizar datos.
- Administrador: iniciar sesión.
- Google: iniciar sesión o crear cuenta con Google.
- Servicio de correo: verificar correo y recuperar acceso.

## Relaciones UML

- `Crear cuenta con formulario o Google` **incluye** `Aceptar términos y política`.
- `Verificar correo` extiende `Crear cuenta con formulario o Google` solo cuando la cuenta se crea
  mediante formulario; Google ya entrega el correo verificado.
- `Crear cuenta con formulario o Google` extiende `Iniciar sesión con correo o Google` cuando
  Google identifica un correo nuevo desde la pantalla de acceso.
- `Buscar y filtrar cursos` puede modelarse como extensión de `Explorar catálogo`.
- `Revisar lección de vista previa` extiende `Consultar ficha de curso`.

## Exclusiones

No incluir matrícula, pago, aula, exámenes, certificados, reclamaciones ni reportes; pertenecen a
otras épicas. Google y correo son actores externos, no componentes dentro del rectángulo.

## Prompt listo para otra IA

> Genera un diagrama UML de casos de uso estilo Rational Rose para “ESEJUR — Acceso y
> descubrimiento”. Usa fondo blanco, borde negro, actores de palo fuera del sistema, casos en
> elipses y relaciones include/extend UML. Coloca Visitante, Alumno y Administrador a la izquierda;
> Google y Servicio de correo a la derecha. Usa exactamente los actores, casos, asociaciones y
> exclusiones definidos en este documento. La salida debe ser horizontal, legible en Word y no
> contener arquitectura técnica ni flujos de actividades.
