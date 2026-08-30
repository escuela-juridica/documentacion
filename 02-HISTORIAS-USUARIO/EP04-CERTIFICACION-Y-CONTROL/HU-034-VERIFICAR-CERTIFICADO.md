# HU-034 — Verificar públicamente un certificado

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Verificador externo |
| Incremento | Mes 5 |
| Personas recomendadas | 1 |
| Responsable | Por asignar |

## Historia

> Como **verificador externo**, quiero **escanear el QR o escribir el código**, para **comprobar la
> vigencia del certificado sin acceder a datos privados**.

## Especificación completa

- Página pública sin login, accesible por QR o ingreso manual del código único.
- VIGENTE muestra: código, nombre completo, curso, horas, nivel, entidad cuando aplica, fecha de
  emisión y “Certificado vigente”.
- Nunca muestra DNI, correo, teléfono, nota, firmas, PDF ni otros datos personales.
- Una corrección no crea el estado CORREGIDO: el certificado permanece VIGENTE, mantiene el código
  y la consulta muestra únicamente los datos de su versión vigente.
- ANULADO muestra nombre, curso, código, emisión, fecha de anulación y “Certificado anulado — no
  válido”; motivo completo permanece privado.
- Código inexistente responde “Certificado no encontrado” sin revelar personas.

## Criterios de aceptación

- **Dado** código VIGENTE, **cuando** verifica, **entonces** muestra únicamente la lista pública.
- **Dado** certificado corregido, **cuando** usa el mismo código, **entonces** ve datos actuales.
- **Dado** ANULADO, **cuando** verifica, **entonces** informa no válido y fecha, sin motivo completo.
- **Dado** código inexistente, **cuando** busca, **entonces** no revela información.

## Dependencia interna

- Depende de HU-032/HU-035 para datos reales; puede adelantarse con certificados controlados.

## Orientación de trabajo

- **Frontend:** lectura por QR/código y tres estados de resultado: vigente —incluida su versión
  corregida—, anulado e inexistente.
- **Backend:** búsqueda mínima, versión vigente y exclusión estricta de datos privados.
- **Integración:** el mismo código debe reflejar correcciones y anulaciones sin entregar el PDF.

## Demostración esperada

Verificar por QR y código un certificado vigente, corregido, anulado e inexistente, comprobando la
privacidad. Una persona desarrolla y otra revisa la exposición de datos.
