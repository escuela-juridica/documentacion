-- ESEJUR - Datos integrados de prueba hasta EP02
-- Requiere 01-tablas-y-llaves-ep02.sql ejecutado sobre una base limpia.
-- Todos los correos, telefonos, pagos y contenidos son datos de demostracion.

BEGIN;

INSERT INTO rol (codigo, nombre, descripcion) VALUES
('ROLE_ALUMNO', 'Alumno', 'Accede a los cursos en los que se encuentra matriculado.'),
('ROLE_ADMINISTRADOR', 'Administrador', 'Gestiona la operacion de la plataforma.');

INSERT INTO tipo_curso (codigo, nombre, orden) VALUES
('DIPLOMADO', 'Diplomado', 10),
('ESPECIALIZACION', 'Especializacion', 20),
('CURSO', 'Curso', 30),
('SEMINARIO', 'Seminario', 40),
('TALLER', 'Taller', 50);

INSERT INTO categoria_tematica (codigo, nombre, orden) VALUES
('DERECHO_REGISTRAL', 'Derecho Registral', 10),
('CONTRATACIONES_ESTADO', 'Contrataciones del Estado', 20),
('DERECHO_PENAL', 'Derecho Penal', 30),
('DERECHO_LABORAL', 'Derecho Laboral', 40),
('DERECHO_ADMINISTRATIVO', 'Derecho Administrativo', 50),
('GESTION_PUBLICA', 'Gestion Publica', 60),
('DERECHO_NOTARIAL', 'Derecho Notarial', 70),
('DERECHO_INMOBILIARIO', 'Derecho Inmobiliario', 80);

INSERT INTO entidad_certificadora (nombre, logo_url) VALUES
('Colegio de Abogados de Lima', 'img/entidades/cal.png'),
('Colegio de Abogados de Lima Sur', 'img/entidades/calsur.png'),
('Ilustre Colegio de Abogados de Canete', 'img/entidades/icac.png');

INSERT INTO estado_curso (codigo, nombre, descripcion, orden) VALUES
('BORRADOR', 'Borrador', 'Curso en preparacion y no visible para el publico.', 10),
('PUBLICADO', 'Publicado', 'Curso visible que admite matriculas segun sus condiciones.', 20),
('EN_CURSO', 'En curso', 'Curso iniciado que mantiene el acceso definido.', 30),
('CERRADO', 'Cerrado', 'Curso terminado mediante el flujo ordinario.', 40),
('CANCELADO', 'Cancelado', 'Curso detenido excepcionalmente por la escuela.', 50);

INSERT INTO tipo_material (codigo, nombre, descripcion) VALUES
('VIDEO', 'Video', 'Contenido audiovisual subido o enlazado.'),
('DOCUMENTO', 'Documento', 'Archivo de lectura o consulta.'),
('PRESENTACION', 'Presentacion', 'Diapositivas de apoyo.'),
('ENLACE', 'Enlace', 'Recurso alojado en un sitio externo.');

INSERT INTO regla_archivo (tipo_material_id, extension, tamano_maximo_bytes)
SELECT tm.tipo_material_id, v.extension, v.tamano
FROM (VALUES
    ('VIDEO', 'mp4', 1073741824::bigint),
    ('DOCUMENTO', 'pdf', 52428800::bigint),
    ('DOCUMENTO', 'docx', 52428800::bigint),
    ('PRESENTACION', 'pptx', 52428800::bigint)
) v(tipo, extension, tamano)
JOIN tipo_material tm ON tm.codigo = v.tipo;

INSERT INTO persona
    (nombres, apellido_paterno, apellido_materno, telefono, foto_url, cargo_profesional, biografia_profesional)
VALUES
('Enrique', 'Prada', NULL, '999 100 101', NULL, NULL, NULL),
('Gabriel Antonio', 'Mayanga', 'Cabrera', '999 100 102', NULL, NULL, NULL),
('Joel Anthony', 'Saldana', 'Chavez', '999 100 103', NULL, NULL, NULL),
('Juan Jose', 'Morales', 'Velasquez', '999 100 104', NULL, NULL, NULL),
('Miguel Bryan', 'Saldivar', 'Davalos', NULL, 'img/instructores/miguel.jpg',
 'Docente especialista en Derecho Publico', 'Docente con experiencia en derecho administrativo, registral y gestion estatal.'),
('Ariana Fiorella', 'Lazaro', 'Maza', NULL, 'img/instructores/ariana.jpg',
 'Docente especialista en Litigacion', 'Docente con experiencia en litigacion oral, derecho penal y redaccion juridica.'),
('Lilia Mercedes', 'Guerra', 'Macedo', NULL, NULL, 'Directora academica', NULL),
('Yourka Lisbeth', 'Lucich', 'Berrio', NULL, NULL, 'Directora institucional', NULL);

-- Las cuatro cuentas usan Marco1415@ en el ambiente de demostracion.
INSERT INTO usuario
    (persona_id, correo, origen_registro, contrasena_hash, correo_verificado_en)
SELECT p.persona_id, v.correo, v.origen, v.hash, CURRENT_TIMESTAMP
FROM (VALUES
    ('Enrique', 'Prada', 'enrique.prada@demo.esejur.pe', 'ADMINISTRADOR', '{bcrypt}$2a$10$3q2hYuey7bsCOddOq/6JXeyITlKtm51hBOPZ8XodNvK.AbLF7ntZC'),
    ('Gabriel Antonio', 'Mayanga', 'gabriel.mayanga@demo.esejur.pe', 'FORMULARIO', '{bcrypt}$2a$10$41ZIgbSSlPVd3pBrI3BGuu9O6s0NXg.XnZZ2svvawPxfzrHU5Aj3G'),
    ('Joel Anthony', 'Saldana', 'joel.saldana@demo.esejur.pe', 'FORMULARIO', '{bcrypt}$2a$10$RHTaYvzW9s7uFSCHQTkLFO0YUf.qVdldhm8UJAo1Zb9Ol6UjFxWnq'),
    ('Juan Jose', 'Morales', 'juan.morales@demo.esejur.pe', 'FORMULARIO', '{bcrypt}$2a$10$1AG2h0Y3AYpVmFFp/HPxl.EOOU0fI5pFi2OXoafZjRq3oDnCmUpmq')
) v(nombres, apellido, correo, origen, hash)
JOIN persona p ON p.nombres = v.nombres AND p.apellido_paterno = v.apellido;

INSERT INTO usuario_rol (usuario_id, rol_id, es_principal)
SELECT u.usuario_id, r.rol_id, true
FROM usuario u
JOIN rol r ON r.codigo = CASE WHEN u.correo = 'enrique.prada@demo.esejur.pe'
                              THEN 'ROLE_ADMINISTRADOR' ELSE 'ROLE_ALUMNO' END;

INSERT INTO configuracion_institucional (codigo, valor, descripcion, modificado_por_usuario_id)
SELECT 'LUGAR_EMISION_CERTIFICADO', 'Lima, Peru',
       'Lugar predeterminado para la emision de certificados.', u.usuario_id
FROM usuario u WHERE u.correo = 'enrique.prada@demo.esejur.pe';

INSERT INTO firmante (persona_id, cargo_firma, imagen_firma_url)
SELECT p.persona_id, v.cargo, v.imagen
FROM (VALUES
    ('Lilia Mercedes', 'Guerra', 'Directora academica', 'img/firmas/lilia-guerra.png'),
    ('Yourka Lisbeth', 'Lucich', 'Directora institucional', 'img/firmas/yourka-lucich.png')
) v(nombres, apellido, cargo, imagen)
JOIN persona p ON p.nombres = v.nombres AND p.apellido_paterno = v.apellido;

WITH datos(slug,titulo,descripcion,imagen,tipo,categoria,entidad,modalidad,venta,estado,destacado,precio,promocion,inicio,fin,cierre,cupo,horas) AS (VALUES
('derecho-registral-notarial','Diplomado en Derecho Registral y Notarial','Formacion aplicada en procedimientos registrales y notariales.','https://images.unsplash.com/photo-1589578527966-fdac0f44566c?q=80&w=1200','DIPLOMADO','DERECHO_REGISTRAL','Colegio de Abogados de Lima','VIRTUAL','PAGADO','PUBLICADO',true,650.00,450.00,NULL::date,NULL::date,NULL::date,NULL::integer,120.00),
('contrataciones-estado','Especializacion en Contrataciones del Estado','Procedimientos y responsabilidades en contratacion publica.','https://images.unsplash.com/photo-1593115057322-e94b77572f20?q=80&w=1200','ESPECIALIZACION','CONTRATACIONES_ESTADO','Colegio de Abogados de Lima','HIBRIDO','PAGADO','PUBLICADO',true,380.00,NULL::numeric,DATE '2026-10-15',DATE '2027-01-20',DATE '2026-10-14',40,96.00),
('litigacion-penal','Curso de Litigacion Oral en el Proceso Penal','Argumentacion, interrogatorio y actuacion oral.','https://images.unsplash.com/photo-1521587760476-6c12a4b040da?q=80&w=1200','CURSO','DERECHO_PENAL',NULL,'EN_VIVO','PAGADO','PUBLICADO',false,290.00,NULL::numeric,DATE '2026-10-20',DATE '2026-12-20',DATE '2026-10-19',35,48.00),
('derecho-laboral','Diplomado en Derecho Laboral y Procesal Laboral','Relacion laboral y actuaciones del proceso laboral.','https://images.unsplash.com/photo-1450101499163-c8848c66ca85?q=80&w=1200','DIPLOMADO','DERECHO_LABORAL','Colegio de Abogados de Lima Sur','VIRTUAL','PAGADO','EN_CURSO',true,700.00,520.00,NULL::date,NULL::date,NULL::date,NULL::integer,132.00),
('procedimiento-administrativo','Seminario de Procedimiento Administrativo General','Actualizacion practica en procedimiento administrativo.','https://images.unsplash.com/photo-1556761175-b413da4baf72?q=80&w=1200','SEMINARIO','DERECHO_ADMINISTRATIVO',NULL,'EN_VIVO','GRATUITO','PUBLICADO',false,0.00,NULL::numeric,DATE '2026-11-05',DATE '2026-11-06',DATE '2026-11-04',100,16.00),
('gestion-publica','Diplomado en Gestion Publica y Modernizacion del Estado','Gestion publica orientada a resultados y modernizacion.','https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?q=80&w=1200','DIPLOMADO','GESTION_PUBLICA','Ilustre Colegio de Abogados de Canete','HIBRIDO','PAGADO','PUBLICADO',true,620.00,490.00,DATE '2026-11-10',DATE '2027-02-20',DATE '2026-11-09',50,120.00),
('funcion-notarial','Curso de Derecho Notarial y Funcion Notarial','Funcion notarial, instrumentos publicos y responsabilidad.','https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=1200','CURSO','DERECHO_NOTARIAL',NULL,'VIRTUAL','PAGADO','PUBLICADO',false,320.00,NULL::numeric,NULL::date,NULL::date,NULL::date,NULL::integer,32.00),
('saneamiento-inmuebles','Especializacion en Saneamiento Fisico Legal de Inmuebles','Saneamiento y regularizacion de la propiedad inmueble.','https://images.unsplash.com/photo-1560518883-ce09059eeffa?q=80&w=1200','ESPECIALIZACION','DERECHO_INMOBILIARIO','Colegio de Abogados de Lima','VIRTUAL','PAGADO','PUBLICADO',true,360.00,290.00,NULL::date,NULL::date,NULL::date,NULL::integer,72.00),
('redaccion-juridica','Taller de Redaccion Juridica Profesional','Tecnicas para redactar documentos juridicos claros.','https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=1200','TALLER','DERECHO_ADMINISTRATIVO',NULL,'VIRTUAL','GRATUITO','PUBLICADO',false,0.00,NULL::numeric,NULL::date,NULL::date,NULL::date,NULL::integer,20.00)
)
INSERT INTO curso
    (url_amigable,titulo,descripcion,imagen_portada_url,tipo_curso_id,categoria_tematica_id,
     entidad_certificadora_id,modalidad,tipo_venta,estado_curso_id,destacado,precio_regular,
     precio_promocional,promocion_inicio_en,promocion_fin_en,fecha_inicio,fecha_fin,
     fecha_cierre_matricula,cupo_maximo,horas_academicas,vigencia_acceso_dias,beneficios,
     creado_por_usuario_id,publicado_en,reglas_bloqueadas_en)
SELECT d.slug,d.titulo,d.descripcion,d.imagen,tc.tipo_curso_id,ct.categoria_tematica_id,
       ec.entidad_certificadora_id,d.modalidad,d.venta,es.estado_curso_id,d.destacado,d.precio,
       d.promocion,CASE WHEN d.promocion IS NULL THEN NULL ELSE CURRENT_TIMESTAMP - interval '5 days' END,
       CASE WHEN d.promocion IS NULL THEN NULL ELSE CURRENT_TIMESTAMP + interval '60 days' END,
       d.inicio,d.fin,d.cierre,d.cupo,d.horas,
       CASE WHEN d.modalidad='VIRTUAL' THEN NULL ELSE 180 END,
       ARRAY['Acceso a materiales','Acompanamiento academico','Certificado segun cumplimiento'],
       u.usuario_id,CURRENT_TIMESTAMP,
       CASE WHEN d.estado='EN_CURSO' THEN CURRENT_TIMESTAMP ELSE NULL END
FROM datos d
JOIN tipo_curso tc ON tc.codigo=d.tipo
JOIN categoria_tematica ct ON ct.codigo=d.categoria
LEFT JOIN entidad_certificadora ec ON ec.nombre=d.entidad
JOIN estado_curso es ON es.codigo=d.estado
JOIN usuario u ON u.correo='enrique.prada@demo.esejur.pe';

INSERT INTO curso_docente (curso_id, persona_id, orden)
SELECT c.curso_id, p.persona_id, v.orden
FROM curso c
JOIN (VALUES
 ('derecho-registral-notarial','Miguel Bryan','Saldivar',1),
 ('derecho-registral-notarial','Ariana Fiorella','Lazaro',2),
 ('contrataciones-estado','Miguel Bryan','Saldivar',1),
 ('litigacion-penal','Ariana Fiorella','Lazaro',1),
 ('derecho-laboral','Miguel Bryan','Saldivar',1),
 ('procedimiento-administrativo','Miguel Bryan','Saldivar',1),
 ('gestion-publica','Miguel Bryan','Saldivar',1),
 ('gestion-publica','Ariana Fiorella','Lazaro',2),
 ('funcion-notarial','Ariana Fiorella','Lazaro',1),
 ('saneamiento-inmuebles','Miguel Bryan','Saldivar',1),
 ('redaccion-juridica','Ariana Fiorella','Lazaro',1)
) v(slug,nombres,apellido,orden) ON c.url_amigable=v.slug
JOIN persona p ON p.nombres=v.nombres AND p.apellido_paterno=v.apellido;

INSERT INTO curso_firmante (curso_id, firmante_id, orden)
SELECT c.curso_id, f.firmante_id, row_number() OVER (PARTITION BY c.curso_id ORDER BY f.firmante_id)
FROM curso c CROSS JOIN firmante f;

INSERT INTO regla_curso
    (curso_id,requiere_examenes,requiere_progreso,requiere_asistencia,nota_minima,
     nota_refrendado,progreso_minimo,umbral_video,asistencia_minima,secuencia_obligatoria,
     dias_espera_certificado,bloqueado_en)
SELECT c.curso_id,true,true,c.modalidad IN ('EN_VIVO','HIBRIDO'),12,14,80,50,80,true,
       CASE WHEN c.modalidad='VIRTUAL' THEN 0 ELSE 3 END,c.reglas_bloqueadas_en
FROM curso c;

INSERT INTO historial_estado_curso (curso_id,estado_nuevo_id,realizado_por_usuario_id)
SELECT c.curso_id,c.estado_curso_id,c.creado_por_usuario_id FROM curso c;

INSERT INTO modulo (curso_id,titulo,descripcion,orden)
SELECT c.curso_id,'Modulo '||g.n,'Contenido academico del modulo '||g.n,g.n
FROM curso c CROSS JOIN generate_series(1,2) g(n);

INSERT INTO leccion
    (modulo_id,titulo,descripcion,orden,tipo,estado,es_obligatoria,es_vista_previa,
     fecha_hora_inicio,fecha_hora_fin,enlace_reunion)
SELECT m.modulo_id,'Leccion '||g.n,'Contenido de aprendizaje de la leccion '||g.n,g.n,
       CASE WHEN c.modalidad IN ('EN_VIVO','HIBRIDO') AND g.n=2 THEN 'EN_VIVO' ELSE 'GRABADA' END,
       'PROGRAMADA',true,(m.orden=1 AND g.n=1),
       CASE WHEN c.modalidad IN ('EN_VIVO','HIBRIDO') AND g.n=2 THEN CURRENT_TIMESTAMP+interval '15 days' END,
       CASE WHEN c.modalidad IN ('EN_VIVO','HIBRIDO') AND g.n=2 THEN CURRENT_TIMESTAMP+interval '17 days' END,
       CASE WHEN c.modalidad IN ('EN_VIVO','HIBRIDO') AND g.n=2 THEN 'https://meet.example.com/esejur-demo' END
FROM modulo m JOIN curso c ON c.curso_id=m.curso_id CROSS JOIN generate_series(1,2) g(n);

INSERT INTO recurso
    (tipo_material_id,tipo,origen,referencia,nombre_archivo,tipo_mime,duracion_segundos,
     duracion_detectada,youtube_no_listado_confirmado,creado_por_usuario_id)
SELECT tm.tipo_material_id,'VIDEO','YOUTUBE','https://www.youtube.com/watch?v=demo-'||l.leccion_id,
       NULL,'video/youtube',NULL,false,true,u.usuario_id
FROM leccion l
JOIN tipo_material tm ON tm.codigo='VIDEO'
JOIN usuario u ON u.correo='enrique.prada@demo.esejur.pe'
WHERE l.tipo='GRABADA';

INSERT INTO material_leccion (leccion_id,recurso_id,titulo,orden)
SELECT l.leccion_id,r.recurso_id,'Video de la leccion',1
FROM leccion l JOIN recurso r ON r.referencia='https://www.youtube.com/watch?v=demo-'||l.leccion_id;

INSERT INTO examen
    (curso_id,modulo_id,titulo,descripcion,finalidad,orden,maximo_intentos,
     tiempo_limite_minutos,barajar_preguntas,barajar_opciones,mostrar_respuestas,
     bloquea_siguiente_modulo,dias_revision)
SELECT c.curso_id,m.modulo_id,'Evaluacion del modulo 1','Responde las preguntas del modulo.',
       'MODULO',1,3,30,true,true,true,true,3
FROM curso c JOIN modulo m ON m.curso_id=c.curso_id AND m.orden=1;

INSERT INTO pregunta (examen_id,tipo,enunciado,puntaje,orden)
SELECT e.examen_id,'OPCION_UNICA','Selecciona la alternativa correcta.',10,1 FROM examen e
UNION ALL
SELECT e.examen_id,'ABIERTA','Explica brevemente el criterio juridico aplicable.',10,2 FROM examen e;

INSERT INTO opcion_pregunta (pregunta_id,texto,es_correcta,orden)
SELECT p.pregunta_id,'Alternativa correcta',true,1 FROM pregunta p WHERE p.tipo='OPCION_UNICA'
UNION ALL
SELECT p.pregunta_id,'Alternativa incorrecta',false,2 FROM pregunta p WHERE p.tipo='OPCION_UNICA';

-- Tres escenarios: compra aprobada, matricula gratuita y pago rechazado pendiente de reintento.
INSERT INTO matricula
    (usuario_id,curso_id,estado,forma_ingreso,fecha_activacion,fecha_vencimiento,creado_por_usuario_id)
SELECT u.usuario_id,c.curso_id,v.estado,v.forma,
       CASE WHEN v.estado='ACTIVA' THEN CURRENT_TIMESTAMP END,
       CASE WHEN v.estado='ACTIVA' AND c.vigencia_acceso_dias IS NOT NULL
            THEN CURRENT_TIMESTAMP+(c.vigencia_acceso_dias||' days')::interval END,
       CASE WHEN v.forma='ADMINISTRADOR' THEN a.usuario_id END
FROM (VALUES
 ('gabriel.mayanga@demo.esejur.pe','derecho-registral-notarial','ACTIVA','PAGO_EN_LINEA'),
 ('joel.saldana@demo.esejur.pe','procedimiento-administrativo','ACTIVA','GRATUITA'),
 ('juan.morales@demo.esejur.pe','contrataciones-estado','PENDIENTE_PAGO','PAGO_EN_LINEA')
) v(correo,slug,estado,forma)
JOIN usuario u ON u.correo=v.correo
JOIN curso c ON c.url_amigable=v.slug
JOIN usuario a ON a.correo='enrique.prada@demo.esejur.pe';

INSERT INTO historial_estado_matricula (matricula_id,estado_nuevo,realizado_por_usuario_id)
SELECT m.matricula_id,m.estado,m.creado_por_usuario_id FROM matricula m;

INSERT INTO pago
    (matricula_id,numero_pedido,operacion_proveedor,origen,medio,estado,
     precio_regular_aplicado,precio_promocional_aplicado,importe,referencia_externa,
     ultimos_digitos,motivo,constancia_numero,resultado_en,requiere_atencion)
SELECT m.matricula_id,v.pedido,v.operacion,'EN_LINEA','TARJETA',v.estado,
       c.precio_regular,c.precio_promocional,
       COALESCE(c.precio_promocional,c.precio_regular),v.referencia,v.digitos,v.motivo,
       v.constancia,CURRENT_TIMESTAMP,v.requiere_atencion
FROM (VALUES
 ('gabriel.mayanga@demo.esejur.pe','derecho-registral-notarial','PED-EP02-0001','CULQI-DEMO-0001','APROBADO','REF-DEMO-0001','1415',NULL::text,'CONST-0001',false),
 ('juan.morales@demo.esejur.pe','contrataciones-estado','PED-EP02-0002','CULQI-DEMO-0002','RECHAZADO','REF-DEMO-0002','2026','Fondos insuficientes',NULL::text,false)
) v(correo,slug,pedido,operacion,estado,referencia,digitos,motivo,constancia,requiere_atencion)
JOIN usuario u ON u.correo=v.correo
JOIN curso c ON c.url_amigable=v.slug
JOIN matricula m ON m.usuario_id=u.usuario_id AND m.curso_id=c.curso_id;

INSERT INTO notificacion
    (usuario_id,matricula_id,pago_id,tipo,destinatario,asunto,estado_envio,
     intentos_envio,ultimo_error,enviado_en)
SELECT u.usuario_id,m.matricula_id,p.pago_id,
       CASE WHEN p.estado='APROBADO' THEN 'PAGO_APROBADO' ELSE 'PAGO_RECHAZADO' END,
       u.correo,
       CASE WHEN p.estado='APROBADO' THEN 'Tu matricula fue activada' ELSE 'No se pudo completar tu pago' END,
       'ENVIADO',1,NULL,CURRENT_TIMESTAMP
FROM pago p JOIN matricula m ON m.matricula_id=p.matricula_id
JOIN usuario u ON u.usuario_id=m.usuario_id;

COMMIT;
