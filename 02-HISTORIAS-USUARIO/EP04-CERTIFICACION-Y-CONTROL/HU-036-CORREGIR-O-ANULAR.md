# HU-036 — Corregir o anular un certificado

## Información general

| Campo | Valor |
|---|---|
| Actor principal | Administrador |
| Incremento | Mes 5 |
| Personas recomendadas | 2 |
| Responsable / participante | Por asignar / Por asignar |

## Historia

> Como **administrador**, quiero **corregir datos documentales o anular un certificado**, para
> **mantener su validez real con historial completo y consecuencias no ambiguas**.

## Flujo de corrección

- Solo administrador, con motivo.
- Puede corregir nombres, título, horas, entidad o firmantes.
- Regenera PDF manteniendo el mismo código y VIGENTE.
- La versión anterior deja de descargarse, pero queda en historial con datos, motivo, fecha y
  responsable.
- Alumno y verificación ven la versión nueva.
- No cambia libremente nota o nivel congelados; el alumno no corrige por sí mismo.

## Flujo de anulación

- Solo administrador, con motivo y confirmación explícita.
- Cambia de VIGENTE a ANULADO de forma irreversible.
- Retira PDF, conserva certificado/historial/finalización.
- QR/código siguen activos para informar “Certificado anulado — no válido”.
- Página pública muestra fecha de anulación, no motivo completo.
- Motivo, fecha y responsable quedan privados para administración.
- ANULADO nunca vuelve a VIGENTE.

## Criterios de aceptación

- **Dado** VIGENTE, **cuando** corrige datos permitidos con motivo, **entonces** mantiene código,
  reemplaza descarga y conserva versión previa.
- **Dado** intento de cambiar libremente nota/nivel, **cuando** corrige, **entonces** se impide.
- **Dado** VIGENTE, **cuando** anula con motivo, **entonces** retira PDF, conserva historial y el QR
  informa no válido.
- **Dado** ANULADO, **cuando** intenta reactivar, **entonces** se rechaza.

## Dependencia interna

- Depende de un certificado de HU-032 o HU-035.

## Orientación de trabajo

- **Frontend:** acciones separadas, motivo, comparación e impacto irreversible.
- **Backend:** versiones, código estable, estado irreversible, privacidad e historial.
- **Integración:** corregir reemplaza la descarga conservando código y QR; anular retira la descarga
  y cambia la verificación pública. Ambas acciones actualizan el reporte y conservan el historial.

## Demostración esperada

Demostrar corrección y luego anulación, incluida verificación pública.
