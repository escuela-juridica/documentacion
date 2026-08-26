# HU-035 — Emitir manualmente un certificado

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **emitir excepcionalmente un certificado con motivo**, para
> **resolver un caso justificado sin omitir identidad, unicidad, privacidad ni historial**.

## Especificación completa

- Disponible incluso si el curso desactivó las tres condiciones o existe excepción académica/
  temporal.
- Exige motivo y registra administrador, fecha y acción.
- Nombres, apellido paterno, apellido materno y DNI confirmados siguen obligatorios.
- Solo un certificado por alumno/curso.
- Si no existe `fecha_finalizacion`, se establece con la fecha de la acción; nunca anterior a la
  matrícula ni futura.
- Genera un PDF con nombre completo, tipo y título del curso, rango de fechas, horas académicas,
  lugar y fecha de emisión, entidad refrendante cuando corresponda, logos y firmas configuradas.
- Asigna un código único y un QR que abre la verificación pública. El resultado inicial es VIGENTE.
- El alumno solo puede consultar y descargar su propio certificado desde una sesión autenticada; el
  correo contiene un enlace privado y nunca adjunta el PDF.
- El certificado guarda una copia de los datos impresos y no se recalcula después de emitirse.
- Congela nota/nivel existentes cuando aplican y cierra nuevos intentos calificados.
- Si existen exámenes obligatorios, el nivel se deriva de la nota final y de los umbrales del curso;
  administración no elige libremente Normal o Refrendado. Sin exámenes obligatorios, el nivel es
  Normal y no existe nota final.
- No borra incumplimientos ni altera intentos; deja evidencia de excepción.

## Flujo principal

1. Administración selecciona alumno/curso y revisa situación.
2. Completa motivo y, si falta, fecha de finalización válida.
3. ESEJUR valida datos, ausencia de certificado y fechas.
4. Confirma impacto definitivo.
5. Emite, registra responsable/motivo y notifica al alumno.

## Criterios de aceptación

- **Dado** caso sin certificado y datos completos, **cuando** emite con motivo, **entonces** crea un
  único VIGENTE y conserva evidencia administrativa.
- **Dado** fecha inexistente, **cuando** emite, **entonces** usa la fecha de acción dentro de límites.
- **Dado** datos incompletos o certificado existente, **cuando** intenta emitir, **entonces** se
  impide.
- **Dado** emisión manual, **cuando** termina, **entonces** aplica privacidad/congelamiento idénticos
  a cualquier certificado: solo el titular descarga, el QR verifica, los datos quedan congelados y
  los nuevos intentos calificados quedan cerrados.
- **Dado** una nota existente, **cuando** emite manualmente, **entonces** el nivel se calcula con los
  umbrales configurados y no puede ser seleccionado para favorecer el caso.

## Notificación

- Al emitirse se informa al alumno que el certificado está listo y se incluye un enlace privado de
  descarga; el PDF no se adjunta al mensaje.
- Un fallo de correo no revierte la emisión; el certificado permanece disponible para el titular y
  el aviso puede reenviarse sin crear otro documento. No se rastrea apertura o entrega.

## Dependencia interna

- Requiere que la generación, descarga privada, verificación pública y reporte de certificados
  reconozcan también los certificados emitidos manualmente.

## Orientación de trabajo

- **Frontend:** situación, motivo, fecha, impacto y confirmación.
- **Backend:** límites, unicidad, emisión, historial y congelamiento.
- **Integración:** la confirmación administrativa debe generar un único PDF VIGENTE, cerrar intentos
  calificados, habilitar descarga privada y QR público, notificar y aparecer en el reporte.

## Demostración esperada

Demostrar emisión válida y rechazos por datos/certificado previo.
