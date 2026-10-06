# HU-037 - Excepciones de matricula y pago

`atencion_matricula_pago` conserva solicitud, motivo, actor, fecha y resultado. Atiende resultados
tardios o inconsistentes sin modificar el resultado bancario ni crear un segundo pago.

Solo una decision interna puede activar o ajustar acceso y siempre valida historial de pago y
matricula. La interfaz muestra evidencia y confirmacion administrativa.
