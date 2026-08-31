-- ESEJUR - EP01 Datos iniciales y de prueba
-- Requiere 01-tablas-y-llaves-ep01.sql.
-- Los usuario, documentos y cursos incluidos son ficticios.

BEGIN;
SET search_path TO esejur, public;

-- -----------------------------------------------------------------------------
-- Datos maestros del negocio
-- -----------------------------------------------------------------------------

INSERT INTO tipos_curso (codigo, nombre, orden)
VALUES
    ('DIPLOMADO', 'Diplomado', 10),
    ('PROGRAMA_ACTUALIZACION', 'Programa de actualización', 20),
    ('CURSO_ESPECIALIZADO', 'Curso especializado', 30),
    ('SEMINARIO', 'Seminario', 40),
    ('TALLER_CASOS_PRACTICOS', 'Taller de casos prácticos', 50),
    ('CONGRESO_CONFERENCIA', 'Congreso / Conferencia', 60),
    ('IN_HOUSE', 'In-house', 70)
ON CONFLICT (codigo) DO UPDATE
SET nombre = EXCLUDED.nombre,
    orden = EXCLUDED.orden,
    activo = true,
    modificado_en = CURRENT_TIMESTAMP;

INSERT INTO categorias_tematicas (codigo, nombre, orden)
VALUES
    ('DERECHO_REGISTRAL', 'Derecho Registral', 10),
    ('DERECHO_NOTARIAL', 'Derecho Notarial', 20),
    ('DERECHO_INMOBILIARIO', 'Derecho Inmobiliario', 30),
    ('DERECHO_URBANISTICO', 'Derecho Urbanístico', 40),
    ('DERECHO_ADMINISTRATIVO', 'Derecho Administrativo', 50),
    ('GESTION_PUBLICA', 'Gestión Pública', 60),
    ('HABILIDADES_PROFESIONALES', 'Habilidades profesionales', 70)
ON CONFLICT (codigo) DO UPDATE
SET nombre = EXCLUDED.nombre,
    orden = EXCLUDED.orden,
    activo = true,
    modificado_en = CURRENT_TIMESTAMP;

INSERT INTO entidades_certificadoras (nombre, activo)
VALUES
    ('Colegio de Abogados de Lima', true),
    ('Colegio de Abogados de Lima Sur', true),
    ('Ilustre Colegio de Abogados de Cañete', true)
ON CONFLICT (nombre) DO UPDATE
SET activo = EXCLUDED.activo,
    modificado_en = CURRENT_TIMESTAMP;

-- Roles iniciales disponibles en el sistema.
INSERT INTO rol (codigo, nombre, descripcion)
VALUES
    ('ROLE_ALUMNO', 'Alumno', 'Puede matricularse y desarrollar cursos.'),
    ('ROLE_ADMINISTRADOR', 'Administrador', 'Gestiona la operacion de la plataforma.')
ON CONFLICT (codigo) DO UPDATE
SET nombre = EXCLUDED.nombre,
    descripcion = EXCLUDED.descripcion,
    activo = true,
    modificado_en = CURRENT_TIMESTAMP;

-- -----------------------------------------------------------------------------
-- Datos minimos para probar cuenta, acceso y perfil
-- -----------------------------------------------------------------------------

INSERT INTO documentos_legales
    (tipo, version, titulo, contenido, estado, vigente_desde)
VALUES
    ('POLITICA_PRIVACIDAD', 'DEMO-1.0', 'Política de privacidad — demostración',
     '[DEMO] Sustituir por el contenido legal aprobado por la Escuela.',
     'VIGENTE', CURRENT_TIMESTAMP),
    ('TERMINOS_SERVICIO', 'DEMO-1.0', 'Términos del servicio — demostración',
     '[DEMO] Sustituir por el contenido legal aprobado por la Escuela.',
     'VIGENTE', CURRENT_TIMESTAMP)
ON CONFLICT (tipo, version) DO UPDATE
SET titulo = EXCLUDED.titulo,
    contenido = EXCLUDED.contenido,
    estado = EXCLUDED.estado,
    vigente_desde = EXCLUDED.vigente_desde,
    retirado_en = NULL,
    modificado_en = CURRENT_TIMESTAMP;

-- Personas realistas de prueba: dos con cuenta y dos docentes publicos sin cuenta.
INSERT INTO persona (
    nombres, apellido_paterno, apellido_materno, telefono,
    documento_identidad, foto_url, cargo_profesional, biografia_profesional
)
SELECT
    v.nombres, v.apellido_paterno, v.apellido_materno, v.telefono,
    v.documento_identidad, v.foto_url, v.cargo_profesional, v.biografia_profesional
FROM (
    VALUES
        ('Lucía Beatriz', 'Caminos', 'Quiroz', '986 431 275', '74581236', NULL, NULL, NULL),
        ('Diego Alejandro', 'Salazar', 'Rojas', '954 728 316', NULL, NULL, NULL, NULL),
        ('Mariela', 'Cárdenas', 'Ruiz', NULL, NULL, NULL, 'Registradora pública',
         'Especialista en calificación registral y derecho inmobiliario.'),
        ('Alfonso', 'Miranda', 'Cueto', NULL, NULL, NULL, 'Notario de Lima',
         'Especialista en instrumentos protocolares y asuntos no contenciosos.')
) AS v (
    nombres, apellido_paterno, apellido_materno, telefono,
    documento_identidad, foto_url, cargo_profesional, biografia_profesional
)
WHERE NOT EXISTS (
    SELECT 1
    FROM persona p
    WHERE p.nombres = v.nombres
      AND p.apellido_paterno = v.apellido_paterno
      AND p.apellido_materno IS NOT DISTINCT FROM v.apellido_materno
);

-- Cuenta habilitada con acceso por correo y Google.
INSERT INTO usuario (
    persona_id, correo, origen_registro, estado, contrasena_hash,
    google_subject, correo_verificado_en
)
SELECT
    p.persona_id,
    'lucia.fernandez@demo.esejur.pe',
    'GOOGLE',
    'HABILITADO',
    'pbkdf2_sha256$100000$Z9mZFLWTUMBRPjyNgnsp/A==$ceygfZzIHcCkMLivvHKxFCzEgZB8uhMr+D18gFrNI8I=',
    '108234567890123456789',
    CURRENT_TIMESTAMP
FROM persona p
WHERE p.documento_identidad = '74581236'
ON CONFLICT (correo) DO UPDATE
SET persona_id = EXCLUDED.persona_id,
    origen_registro = EXCLUDED.origen_registro,
    estado = EXCLUDED.estado,
    contrasena_hash = EXCLUDED.contrasena_hash,
    google_subject = EXCLUDED.google_subject,
    correo_verificado_en = EXCLUDED.correo_verificado_en,
    deshabilitado_en = NULL,
    modificado_en = CURRENT_TIMESTAMP;

-- Cuenta creada por formulario y pendiente de verificar el correo.
INSERT INTO usuario (
    persona_id, correo, origen_registro, estado, contrasena_hash
)
SELECT
    p.persona_id,
    'diego.salazar@demo.esejur.pe',
    'FORMULARIO',
    'PENDIENTE_VERIFICACION',
    'pbkdf2_sha256$100000$VnmXjSipjDpBHp95HObXDQ==$l3LTU4qugz1HnmV/A8cHsss13UmgSmYebAhjNRIlaRw='
FROM persona p
WHERE p.nombres = 'Diego Alejandro'
  AND p.apellido_paterno = 'Salazar'
  AND p.apellido_materno = 'Rojas'
ON CONFLICT (correo) DO UPDATE
SET persona_id = EXCLUDED.persona_id,
    origen_registro = EXCLUDED.origen_registro,
    estado = EXCLUDED.estado,
    contrasena_hash = EXCLUDED.contrasena_hash,
    google_subject = NULL,
    correo_verificado_en = NULL,
    deshabilitado_en = NULL,
    modificado_en = CURRENT_TIMESTAMP;

-- En el alcance actual las cuentas solo tienen rol alumno o administrador.
INSERT INTO usuario_rol (usuario_id, rol_id)
SELECT u.usuario_id, r.rol_id
FROM usuario u
CROSS JOIN rol r
WHERE u.correo IN ('lucia.fernandez@demo.esejur.pe', 'diego.salazar@demo.esejur.pe')
  AND r.codigo = 'ROLE_ALUMNO'
ON CONFLICT (usuario_id, rol_id) DO NOTHING;

INSERT INTO consentimientos_usuario (usuario_id, documento_legal_id)
SELECT u.usuario_id, d.documento_legal_id
FROM usuario u
CROSS JOIN documentos_legales d
WHERE u.correo IN ('lucia.fernandez@demo.esejur.pe', 'diego.salazar@demo.esejur.pe')
  AND d.version = 'DEMO-1.0'
ON CONFLICT (usuario_id, documento_legal_id) DO NOTHING;

-- Hash SHA-256 de un codigo ficticio; no se guarda el codigo en texto plano.
INSERT INTO codigos_verificacion_correo
    (usuario_id, codigo_hash, estado, estado_envio)
SELECT usuario_id,
       '0a14e0db42e1a9cc8680ab5395bcae92416186796fa4eb636c431d4d53d8f53d',
       'VIGENTE',
       'ACEPTADO'
FROM usuario
WHERE correo = 'diego.salazar@demo.esejur.pe'
ON CONFLICT (codigo_hash) DO NOTHING;

INSERT INTO tokens_recuperacion_acceso
    (usuario_id, token_hash, estado, estado_envio, expira_en)
SELECT usuario_id,
       '9d504a09b3caa4d01105c85c91fdb518aac2e0bdf94cf930728d9f049cfb7f34',
       'VIGENTE',
       'ACEPTADO',
       CURRENT_TIMESTAMP + interval '60 minutes'
FROM usuario
WHERE correo = 'lucia.fernandez@demo.esejur.pe'
ON CONFLICT (token_hash) DO NOTHING;

INSERT INTO intentos_acceso
    (usuario_id, correo_referencia, metodo, resultado, motivo_resultado)
SELECT usuario_id, correo, 'GOOGLE', 'EXITOSO', 'CREDENCIALES_VALIDAS'
FROM usuario
WHERE correo = 'lucia.fernandez@demo.esejur.pe';

-- -----------------------------------------------------------------------------
-- Datos minimos para probar catalogo, ficha y vista previa
-- -----------------------------------------------------------------------------



-- Curso virtual pagado, sin fecha de fin y con dos docentes.
INSERT INTO cursos (
    url_amigable, titulo, descripcion, imagen_portada_url,
    tipo_curso_id, categoria_tematica_id, entidad_certificadora_id,
    modalidad, tipo_venta, estado, destacado,
    precio_regular, precio_promocional, horas_academicas, beneficios, publicado_en
)
SELECT
    'diplomado-derecho-registral-notarial',
    'Diplomado en Derecho Registral y Notarial',
    'Principios registrales, calificación de títulos y función notarial.',
    'https://images.unsplash.com/photo-1589578527966-fdac0f44566c?q=80&w=1200&auto=format&fit=crop',
    tc.tipo_curso_id,
    ct.categoria_tematica_id,
    ec.entidad_certificadora_id,
    'VIRTUAL', 'PAGADO', 'PUBLICADO', true,
    650.00, 450.00, 120.00,
    ARRAY['Acceso las 24 horas', 'Material académico', 'Certificación'],
    CURRENT_TIMESTAMP
FROM tipos_curso tc
CROSS JOIN categorias_tematicas ct
CROSS JOIN entidades_certificadoras ec
WHERE tc.codigo = 'DIPLOMADO'
  AND ct.codigo = 'DERECHO_REGISTRAL'
  AND ec.nombre = 'Colegio de Abogados de Lima'
ON CONFLICT (url_amigable) DO UPDATE
SET titulo = EXCLUDED.titulo,
    descripcion = EXCLUDED.descripcion,
    tipo_curso_id = EXCLUDED.tipo_curso_id,
    categoria_tematica_id = EXCLUDED.categoria_tematica_id,
    entidad_certificadora_id = EXCLUDED.entidad_certificadora_id,
    modalidad = EXCLUDED.modalidad,
    tipo_venta = EXCLUDED.tipo_venta,
    estado = EXCLUDED.estado,
    destacado = EXCLUDED.destacado,
    precio_regular = EXCLUDED.precio_regular,
    precio_promocional = EXCLUDED.precio_promocional,
    fecha_inicio = NULL,
    fecha_fin = NULL,
    fecha_cierre_matricula = NULL,
    horas_academicas = EXCLUDED.horas_academicas,
    beneficios = EXCLUDED.beneficios,
    modificado_en = CURRENT_TIMESTAMP;

-- Curso hibrido gratuito, con fechas y un cupo para comprobar "Sin cupos".
INSERT INTO cursos (
    url_amigable, titulo, descripcion, imagen_portada_url,
    tipo_curso_id, categoria_tematica_id, entidad_certificadora_id,
    modalidad, tipo_venta, estado, precio_regular,
    fecha_inicio, fecha_fin, fecha_cierre_matricula, cupo_maximo,
    horas_academicas, beneficios, publicado_en
)
SELECT
    'taller-casos-practicos-registrales',
    'Taller de Casos Prácticos Registrales',
    'Resolución guiada de casos registrales frecuentes.',
    'https://images.unsplash.com/photo-1450101499163-c8848c66ca85?q=80&w=1200&auto=format&fit=crop',
    tc.tipo_curso_id,
    ct.categoria_tematica_id,
    ec.entidad_certificadora_id,
    'HIBRIDO', 'GRATUITO', 'PUBLICADO', 0.00,
    CURRENT_DATE + 15, CURRENT_DATE + 20, CURRENT_DATE + 14, 1,
    12.00, ARRAY['Casos prácticos', 'Material descargable'], CURRENT_TIMESTAMP
FROM tipos_curso tc
CROSS JOIN categorias_tematicas ct
CROSS JOIN entidades_certificadoras ec
WHERE tc.codigo = 'TALLER_CASOS_PRACTICOS'
  AND ct.codigo = 'DERECHO_REGISTRAL'
  AND ec.nombre = 'Colegio de Abogados de Lima'
ON CONFLICT (url_amigable) DO UPDATE
SET titulo = EXCLUDED.titulo,
    descripcion = EXCLUDED.descripcion,
    tipo_curso_id = EXCLUDED.tipo_curso_id,
    categoria_tematica_id = EXCLUDED.categoria_tematica_id,
    entidad_certificadora_id = EXCLUDED.entidad_certificadora_id,
    modalidad = EXCLUDED.modalidad,
    tipo_venta = EXCLUDED.tipo_venta,
    estado = EXCLUDED.estado,
    precio_regular = EXCLUDED.precio_regular,
    precio_promocional = NULL,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    fecha_cierre_matricula = EXCLUDED.fecha_cierre_matricula,
    cupo_maximo = EXCLUDED.cupo_maximo,
    horas_academicas = EXCLUDED.horas_academicas,
    beneficios = EXCLUDED.beneficios,
    modificado_en = CURRENT_TIMESTAMP;

INSERT INTO curso_docente (curso_id, persona_id, orden)
SELECT c.curso_id, p.persona_id, 1
FROM cursos c
CROSS JOIN persona p
WHERE c.url_amigable = 'diplomado-derecho-registral-notarial'
  AND p.nombres = 'Mariela'
  AND p.apellido_paterno = 'Cárdenas'
  AND p.apellido_materno = 'Ruiz'
ON CONFLICT (curso_id, persona_id) DO UPDATE SET orden = EXCLUDED.orden;

INSERT INTO curso_docente (curso_id, persona_id, orden)
SELECT c.curso_id, p.persona_id, 2
FROM cursos c
CROSS JOIN persona p
WHERE c.url_amigable = 'diplomado-derecho-registral-notarial'
  AND p.nombres = 'Alfonso'
  AND p.apellido_paterno = 'Miranda'
  AND p.apellido_materno = 'Cueto'
ON CONFLICT (curso_id, persona_id) DO UPDATE SET orden = EXCLUDED.orden;

INSERT INTO modulos (curso_id, titulo, descripcion, orden)
SELECT curso_id, 'Fundamentos del sistema registral',
       'Bases para comprender la calificación registral.', 1
FROM cursos
WHERE url_amigable = 'diplomado-derecho-registral-notarial'
ON CONFLICT (curso_id, orden) DO UPDATE
SET titulo = EXCLUDED.titulo,
    descripcion = EXCLUDED.descripcion,
    activo = true,
    modificado_en = CURRENT_TIMESTAMP;

INSERT INTO lecciones
    (modulo_id, titulo, descripcion, orden, tipo, estado, es_vista_previa)
SELECT m.modulo_id, 'Principios registrales',
       'Lección pública de introducción al curso.', 1,
       'GRABADA', 'DISPONIBLE', true
FROM modulos m
JOIN cursos c ON c.curso_id = m.curso_id
WHERE c.url_amigable = 'diplomado-derecho-registral-notarial'
  AND m.orden = 1
ON CONFLICT (modulo_id, orden) DO UPDATE
SET titulo = EXCLUDED.titulo,
    descripcion = EXCLUDED.descripcion,
    tipo = EXCLUDED.tipo,
    estado = EXCLUDED.estado,
    es_vista_previa = EXCLUDED.es_vista_previa,
    activo = true,
    modificado_en = CURRENT_TIMESTAMP;

INSERT INTO recursos
    (tipo, origen, referencia, nombre_archivo, tipo_mime, tamano_bytes,
     duracion_segundos, duracion_detectada)
VALUES
    ('VIDEO', 'ARCHIVO_LOCAL',
     'cursos/diplomado-derecho-registral-notarial/modulo-01/introduccion.mp4',
     'introduccion-derecho-registral.mp4', 'video/mp4', 52428800, 720, true)
ON CONFLICT (referencia) DO UPDATE
SET nombre_archivo = EXCLUDED.nombre_archivo,
    tipo_mime = EXCLUDED.tipo_mime,
    tamano_bytes = EXCLUDED.tamano_bytes,
    duracion_segundos = EXCLUDED.duracion_segundos,
    duracion_detectada = EXCLUDED.duracion_detectada,
    activo = true,
    modificado_en = CURRENT_TIMESTAMP;

INSERT INTO materiales_leccion
    (leccion_id, recurso_id, titulo, orden, permite_descarga)
SELECT l.leccion_id, r.recurso_id, 'Video de introducción', 1, false
FROM lecciones l
JOIN modulos m ON m.modulo_id = l.modulo_id
JOIN cursos c ON c.curso_id = m.curso_id
CROSS JOIN recursos r
WHERE c.url_amigable = 'diplomado-derecho-registral-notarial'
  AND m.orden = 1
  AND l.orden = 1
  AND r.referencia = 'cursos/diplomado-derecho-registral-notarial/modulo-01/introduccion.mp4'
ON CONFLICT (leccion_id, orden) DO UPDATE
SET recurso_id = EXCLUDED.recurso_id,
    titulo = EXCLUDED.titulo,
    permite_descarga = EXCLUDED.permite_descarga,
    activo = true,
    modificado_en = CURRENT_TIMESTAMP;

INSERT INTO matriculas
    (usuario_id, curso_id, estado, forma_ingreso, fecha_activacion)
SELECT u.usuario_id, c.curso_id, 'ACTIVA', 'GRATUITA', CURRENT_TIMESTAMP
FROM usuario u
CROSS JOIN cursos c
WHERE u.correo = 'lucia.fernandez@demo.esejur.pe'
  AND c.url_amigable = 'taller-casos-practicos-registrales'
ON CONFLICT (usuario_id, curso_id) DO UPDATE
SET estado = EXCLUDED.estado,
    forma_ingreso = EXCLUDED.forma_ingreso,
    fecha_activacion = EXCLUDED.fecha_activacion,
    motivo_cancelacion = NULL,
    modificado_en = CURRENT_TIMESTAMP;

COMMIT;
