# HU-047 - Matricula pagada mediante Culqi

ESEJUR crea el intento y el registro `pago` con importe fijo; Culqi procesa el dinero. El webhook se
valida y se registra en `evento_pago` antes de decidir efectos internos.

Solo APROBADO activa la matricula y ocupa cupo en una transaccion. PENDIENTE, rechazo o error no
reservan cupo. Un evento repetido usa la clave del proveedor para ser idempotente y no duplica pago,
matricula, acceso, constancia ni cupo. ESEJUR nunca modifica el resultado bancario.
