# Mapa técnico maestro — EP01 Acceso y descubrimiento

## Propósito

Este documento convierte las historias HU-001 a HU-007 en una guía de implementación para el
backend Spring Boot y el frontend Angular. Incluye código de referencia, consultas JPA/JPQL y
fragmentos Angular explicados. Define responsabilidades, archivos, contratos, dependencias,
estados y pruebas para que una persona con poca experiencia pueda programar por etapas o solicitar
ayuda a una IA sin alterar el negocio.

La historia de usuario sigue siendo la fuente del comportamiento esperado. Este mapa explica cómo
llevar ese comportamiento al proyecto actual.

## Estado actual del proyecto

### Backend

- Spring Boot 4.1.1 y Java 21.
- Dependencias disponibles: Web, JPA, Validation, Mail, Security, OAuth2 Resource Server,
  PostgreSQL, Lombok, Swagger y herramientas de prueba de seguridad.
- Hibernate valida el esquema `esejur`; no crea ni modifica tablas.
- Perfiles configurados: `dev`, `prod` y `test`. Los componentes de prueba manual también admiten
  `local` cuando se provea una configuración local de base de datos.
- Ya existe la base técnica común: configuración de CORS, seguridad, contraseña y reloj; sesión JWT
  por cookie; contrato global de errores; normalizadores; política de contraseña; cálculo comercial
  de cursos y servicio SMTP para correos HTML.
- También existe un controlador de salud y un endpoint de prueba de correo limitado a `local` y
  `dev`. Todavía no existen las entidades, repositorios ni servicios propios de cada HU.
- Los códigos de verificación y los enlaces de recuperación se entregan por correo mediante
  `MailService`; ninguna HU vuelve a configurar SMTP ni crea otro cliente de correo.

### Frontend

- Angular 21 con rutas y layouts de EP01.
- Las pantallas existen visualmente, pero casi todas carecen de formularios y servicios reales.
- El catálogo contiene tarjetas estáticas y la ficha es una pantalla pendiente.
- No existe configuración HTTP, interceptor, contrato de errores ni integración con el backend.
- La sesión actual vive solo en memoria y el guard todavía no protege las rutas `/app`.

### Base de datos

- El esquema se crea con los SQL ubicados en el backend bajo
  `sql/EP01-ACCESO-Y-DESCUBRIMIENTO`.
- Existen 17 tablas y datos de prueba con 15 cursos.
- No se deben cambiar tablas desde una HU sin comprobar primero que la historia realmente exige un
  dato nuevo.

### Regla universal de configuración

- `application.yml` concentra toda configuración funcional compartida de la aplicación.
- `application-dev.yml` y `application-prod.yml` solo contienen conexión de base de datos y logging.
  Si se agrega `application-local.yml`, debe respetar el mismo límite.
- `application-test.yml` solo contiene ajustes técnicos de pruebas. La prueba básica de contexto
  no inicia JPA; las pruebas de repositorio se ejecutan contra PostgreSQL y nunca contra una base
  de datos que simule parcialmente su comportamiento.
- Una propiedad de JWT, CORS, correo, Google, catálogo, verificación u otra HU se agrega a
  `application.yml` recién cuando exista una clase que la utilice.
- No se anticipan bloques de propiedades sin consumidor ni se repiten valores entre perfiles.

## Recorrido obligatorio de una operación

Toda funcionalidad seguirá este recorrido:

1. La pantalla Angular recoge o presenta datos.
2. Un servicio Angular realiza la petición HTTP.
3. Un controlador Spring recibe y valida la forma de la petición.
4. Un servicio Spring aplica permisos, reglas y transacciones.
5. Un repositorio consulta o modifica PostgreSQL.
6. El servicio transforma el resultado en un DTO de respuesta.
7. Angular interpreta éxito o error y actualiza la pantalla.

El componente Angular no conoce tablas. El controlador Spring no ejecuta consultas ni contiene
reglas de negocio. Las entidades JPA no se envían directamente al navegador.

## Organización esperada del backend

Dentro de `pe.edu.utp.escuela.app` se utilizan paquetes técnicos en inglés:

| Paquete | Responsabilidad |
|---|---|
| `config` | CORS, zona horaria, contraseñas y configuración de seguridad |
| `security` | JWT, cookie y acceso a la identidad autenticada |
| `entity` | Mapeo JPA de las tablas existentes |
| `repository` | Consultas y operaciones de persistencia |
| `dto` | Peticiones y respuestas públicas de la API |
| `service` | Reglas, transacciones y coordinación de repositorios |
| `controller` | Endpoints REST |
| `exception` | Errores funcionales y manejador global |
| `mail` | Contrato, renderizado de plantillas y envío SMTP de correos HTML |
| `util` | Normalizaciones pequeñas y reutilizables |

Cada archivo debe tener una sola responsabilidad. Los paquetes y componentes técnicos compartidos
se nombran en inglés, como las clases ya implementadas. Los nombres del dominio conservan una sola
nomenclatura coherente con el modelo acordado; no se mezclan dos nombres para el mismo concepto. Los
mensajes mostrados al usuario usan español correcto.

### Uso obligatorio de Lombok

- En servicios, controladores y componentes se usa `@RequiredArgsConstructor` para inyectar las
  dependencias declaradas como `final`; no se escriben constructores repetitivos ni se usa
  inyección sobre atributos.
- En entidades JPA se usan `@Getter`, `@Setter` y `@NoArgsConstructor`. `@Builder` y
  `@AllArgsConstructor` solo se agregan si realmente ayudan a crear objetos en pruebas.
- No se usa `@Data` en entidades JPA porque genera automáticamente `equals`, `hashCode` y
  `toString`; esos métodos pueden recorrer relaciones perezosas o formar ciclos.
- Los DTO pueden ser `record` cuando son inmutables. Si una herramienta requiere una clase, se
  usan anotaciones Lombok explícitas en lugar de escribir accesores manuales.
- Lombok está declarado como dependencia y como procesador de anotaciones en `pom.xml`. El IDE
  también debe tener habilitado el procesamiento de anotaciones.

## Organización esperada del frontend

Se conserva la estructura actual y se agregan responsabilidades claras:

| Ubicación | Responsabilidad |
|---|---|
| `core/api` | URL base, cliente común y tipos compartidos de error |
| `core/session` | Estado de la sesión, restauración y cierre |
| `core/interceptors` | Credenciales de cookie y tratamiento de respuestas no autorizadas |
| `features/auth` | Acceso, registro, verificación y recuperación |
| `features/cuenta` | Panel y perfil autenticado |
| `features/cursos` | Catálogo, filtros, ficha y vista previa |

Cada HU tendrá su propio servicio Angular para reducir conflictos entre equipos. Un componente no
debe construir manualmente URLs repetidas ni interpretar estructuras distintas para el mismo error.

## Contrato HTTP común

### Convenciones

- La API usa el prefijo `/api`.
- Los recursos públicos usan `/api/publico`.
- Los nombres JSON se acuerdan una sola vez y se conservan en todas las respuestas.
- Las fechas y horas viajan en formato ISO y el frontend las muestra en `America/Lima`.
- Los importes viajan como números; Angular decide su formato visual.
- Los datos opcionales ausentes viajan como `null`, no como textos vacíos inventados.
- Las listas vacías viajan como listas, no como `null`.
- Los endpoints paginados devuelven elementos, página actual, tamaño, total de elementos y total de
  páginas.

### Errores

El manejador global debe responder siempre con la misma estructura conceptual:

- código estable para que Angular decida el estado;
- mensaje seguro para el usuario;
- detalle por campo cuando la validación falla;
- fecha y ruta de la petición;
- nunca contraseña, hash, token, código, consulta SQL ni traza interna.

Los códigos mínimos a acordar son: datos inválidos, credenciales inválidas, correo pendiente,
cuenta inactiva, no autorizado, prohibido, recurso no encontrado, conflicto por duplicidad, código
inválido, token inválido y error interno.

## Seguridad compartida

- La contraseña solo se almacena con BCrypt.
- El bean se crea con `PasswordEncoderFactories.createDelegatingPasswordEncoder()`. De esta forma
  reconoce los hashes `{bcrypt}` incluidos en los datos SQL y genera nuevas credenciales con un
  identificador de algoritmo; no se elimina manualmente ese prefijo.
- El backend identifica al usuario autenticado; nunca confía en un `usuarioId` enviado por el
  navegador para consultar perfil privado.
- La sesión utilizará JWT y la cookie configurada como `ESEJUR_SESION`.
- La cookie debe ser `HttpOnly`; JavaScript no debe leer el JWT.
- Angular enviará credenciales en las solicitudes que requieran sesión.
- No se guardará el JWT en `localStorage` ni `sessionStorage`.
- Los endpoints de catálogo, ficha, acceso, registro, verificación y recuperación son públicos.
- El perfil requiere rol de alumno o administrador autorizado.
- El rol principal proviene de `usuario_rol.es_principal`.
- La tabla usa códigos `ROLE_ALUMNO` y `ROLE_ADMINISTRADOR`; el claim JWT y la respuesta de sesión
  usan `ALUMNO` y `ADMINISTRADOR` para que el convertidor de Spring agregue el prefijo una sola vez.
- El docente no recibe cuenta ni rol en EP01.
- CORS solo admite el origen configurado para el frontend.

Antes de implementar una HU protegida debe existir una configuración de seguridad que permita
explícitamente los endpoints públicos y rechace el resto sin sesión.

## Persistencia y consultas

- Las entidades deben mapear nombres reales de tabla y columna en el esquema `esejur`.
- Las relaciones se cargan solo cuando la operación las necesita.
- Los listados no deben generar una consulta adicional por cada fila.
- Las operaciones con varios cambios relacionados usan una sola transacción.
- La normalización del correo se realiza antes de consultar o guardar.
- La unicidad se comprueba en servicio para dar un mensaje comprensible y se respalda con la
  restricción única de PostgreSQL.
- Los estados comerciales de un curso se calculan en un único servicio reutilizado por HU-006 y
  HU-007.
- Solo las matrículas `ACTIVA` ocupan cupo.

### Criterio para elegir una consulta

1. Se utiliza un método derivado de Spring Data cuando la búsqueda es simple y su nombre sigue
   siendo legible, por ejemplo, buscar una cuenta por correo ignorando mayúsculas.
2. Se utiliza JPQL cuando la consulta relaciona entidades y debe seguir siendo independiente de
   PostgreSQL.
3. Se utiliza una proyección DTO cuando el endpoint necesita pocos campos y no conviene cargar una
   entidad completa.
4. Se utiliza consulta nativa solamente para capacidades propias de PostgreSQL o agregaciones que
   resultarían artificialmente complejas en JPQL. Cada uso debe explicar por qué JPA común no basta.
5. Los métodos que solo consultan se ejecutan como transacciones de solo lectura; las operaciones
   que modifican varias tablas se ejecutan en una única transacción.

### Cómo leer el código de referencia

- Cada bloque indica la ruta sugerida del archivo antes de mostrar el fragmento.
- El código representa la estructura mínima de la HU, no autoriza omitir manejo de errores ni
  pruebas.
- Las entidades comunes se crean una sola vez aunque aparezcan mencionadas en varios mapas.
- Los nombres Java y TypeScript permanecen sin tildes ni `ñ`.
- Antes de copiar un fragmento se comprueba que los nombres coincidan con el SQL y con el contrato
  de la HU.
- Después de cada capa se compila y prueba antes de continuar con la siguiente.

## Entidades compartidas y propietario inicial

### Base técnica ya implementada

Los equipos reutilizan estas clases del backend y no deben crear reemplazos dentro de una HU:

| Clase | Uso compartido |
|---|---|
| `CorsConfig` | Comunicación Angular–API con credenciales |
| `SecurityConfig` | Rutas públicas, rutas protegidas y lectura del JWT desde cookie |
| `PasswordConfig` | Codificador delegado compatible con `{bcrypt}` |
| `ClockConfig` | Fecha y hora comprobables en `America/Lima` |
| `JwtService` | Emisión y validación del JWT |
| `SessionCookieService` | Creación y eliminación de `ESEJUR_SESION` |
| `CurrentUserService` | Identidad obtenida desde Spring Security |
| `GlobalExceptionHandler` | Respuesta uniforme ante errores |
| `ApiErrorResponse` y `FieldErrorResponse` | Contrato de error de la API |
| `PageResponse<T>` | Contrato paginado reutilizable |
| `TextNormalizer` | Correo, espacios y opcionales vacíos |
| `PasswordPolicyService` | Longitud, mayúscula, minúscula y número |
| `CourseCommercialStatusService` | Disponibilidad, cupo, precio y acción comercial |
| `MailService` y `SmtpMailService` | Envío SMTP reutilizable de correos HTML |
| `MailTemplateRenderer` | Lectura de plantillas desde `resources/mail` y reemplazo seguro de campos |

Las excepciones comunes están en `exception`. Una HU reutiliza la que corresponda o agrega una
excepción realmente específica; no vuelve a construir un manejador global.

### Uso del correo compartido

El correo ya está implementado como componente común. Cada flujo crea únicamente su plantilla
dentro de `src/main/resources/mail` e inyecta `MailService`; no crea un `JavaMailSender`, no lee
credenciales SMTP y no duplica la configuración.

En los flujos actuales se envía un mensaje a un único usuario mediante el método de conveniencia
`HtmlMailMessage.to(...)`:

```java
mailService.sendHtml(HtmlMailMessage.to(
        destinatario,
        "Asunto del correo",
        "mail/nombre-plantilla.html",
        Map.of("nombre", nombre, "codigo", codigo)));
```

Los campos se escriben como `{{nombre}}` dentro del HTML y se escapan antes de insertarse. El
endpoint `POST /api/testing/mail` permite indicar destinatario, asunto, nombre y mensaje para una
prueba manual, pero solo existe con perfiles `local` o `dev`. Aunque el contrato interno admite una
lista de destinatarios, HU-002, HU-003 y HU-004 deben enviar cada correo al único propietario de la
cuenta; no usan copias ni exponen direcciones de otras personas.

Las plantillas funcionales que cada equipo debe agregar son:

| Historia | Plantilla | Campos mínimos |
|---|---|---|
| HU-002 y HU-003 | `mail/verification-code.html` | nombre, código y orientación de uso |
| HU-004 | `mail/password-recovery.html` | nombre y enlace de recuperación |

`MailTemplateRenderer` rechaza rutas fuera de `mail/`, exige que todos los campos de la plantilla
estén presentes y escapa sus valores antes de insertarlos. `SmtpMailService` valida destinatario y
asunto, envía HTML en UTF-8 y transforma un rechazo del servidor en `MailDeliveryException`. No se
registran contraseñas SMTP, códigos, tokens, enlaces privados ni direcciones completas en mensajes
de log. La guía detallada se encuentra en `01-SERVICIO-COMPARTIDO-CORREO.md`.

Para evitar que dos equipos creen versiones distintas de la misma tabla, el primer cambio común
debe mapear y revisar estas entidades:

- Equipo de cuenta: `Persona`, `Usuario`, `Rol`, `UsuarioRol`, `CodigoVerificacionCorreo` y
  `TokenRecuperacionAcceso`.
- Equipo de catálogo: `TipoCurso`, `CategoriaTematica`, `EntidadCertificadora`, `EstadoCurso`,
  `Curso`, `CursoDocente`, `Modulo`, `Leccion`, `Recurso`, `MaterialLeccion` y `Matricula`.

El equipo de sesión consume las entidades de cuenta; no crea duplicados. Todos acuerdan antes los
tipos de ID, nombres de campos y relaciones.

## Orden de implementación

### Etapa común

1. Configurar cliente HTTP Angular y URL del backend.
2. Definir DTO de error y manejador global en ambos proyectos.
3. Mapear entidades y repositorios compartidos.
4. Reutilizar y validar CORS, seguridad, BCrypt, JWT y cookie ya implementados.
5. Confirmar que salud, Swagger y una prueba de contexto funcionan.

### Trabajo paralelo

| Equipo | Primera HU | Segunda HU | Tercera HU |
|---|---|---|---|
| Enrique y Miguel | HU-006 | HU-007 | Integración catálogo → ficha |
| Joel y Juan | HU-002 | HU-003 | Integración registro → verificación |
| Gabriel y Ariana | HU-001 | HU-005 | HU-004 |

HU-003 y HU-004 reutilizan el servicio de correo ya implementado. El código o token visible solo se
utiliza para construir el mensaje y nunca se devuelve en una respuesta pública, se persiste sin hash
ni se escribe en logs.

## Integraciones que deben acordarse antes de programar

| Integración | Acuerdo obligatorio |
|---|---|
| HU-001 con HU-002 | Datos temporales y comprobables que Google entrega cuando el correo es nuevo |
| HU-002 con HU-003 | Identificación de la cuenta pendiente y destino de la pantalla de verificación |
| HU-001 con HU-005 | Forma de restaurar la sesión y obtener al usuario actual |
| HU-006 con HU-007 | Identificador público `urlAmigable` y modelo común del estado comercial |
| Backend con Angular | URL, método, campos, estados HTTP y códigos de error de cada endpoint |

## Uso de IA para generar código

Al solicitar código a una IA se le debe entregar:

1. La HU completa.
2. Este mapa maestro.
3. El mapa técnico específico de la HU.
4. El SQL vigente de tablas.
5. Los archivos actuales de la pantalla involucrada.
6. La instrucción de implementar una sola capa o paso por vez.

Se le debe prohibir crear tablas nuevas, cambiar rutas acordadas, inventar estados, devolver
entidades JPA o omitir pruebas. Puede completar el código de referencia, pero debe explicar cada
cambio y respetar las versiones de Spring Boot, Java y Angular del proyecto. Cada resultado se
revisa y compila antes de pedir el siguiente paso.

## Definición de terminado común

Una HU no está terminada solo porque la pantalla se vea bien. Debe cumplir todo lo siguiente:

- contrato backend y frontend coincidente;
- reglas y permisos aplicados en el servicio;
- consultas limitadas a los datos necesarios;
- estados de carga, éxito, vacío y error en Angular;
- validación en frontend y backend;
- ninguna información protegida expuesta;
- pruebas unitarias de reglas importantes;
- prueba de controlador y repositorio cuando corresponda;
- prueba Angular del componente o servicio;
- recorrido integrado demostrable;
- Swagger actualizado;
- compilación y pruebas de ambos proyectos sin errores.

## Manual de arranque para una persona con poca experiencia

Esta secuencia se ejecuta una sola vez antes de desarrollar las historias. No se comienza por el
controlador: primero se comprueba la base, después se construyen las capas desde persistencia hasta
la pantalla.

### Paso 1. Preparar PostgreSQL

Desde la carpeta `sql/EP01-ACCESO-Y-DESCUBRIMIENTO` del backend se ejecutan, en este orden:

1. `00-reiniciar-tablas-ep01.sql`, solo cuando se quiera borrar y reconstruir la información de
   desarrollo.
2. `01-tablas-y-llaves-ep01.sql` para crear las 17 tablas y sus restricciones.
3. `02-datos-iniciales-ep01.sql` para cargar usuarios, docentes, catálogos y 15 cursos.

Hibernate tiene `ddl-auto: validate`: si una entidad no coincide con SQL, la aplicación debe fallar
al iniciar. No se cambia a `update` ni `create` para ocultar el error.

### Paso 2. Comprobar el backend antes de programar

En PowerShell, dentro del backend:

```powershell
$env:JAVA_HOME='C:\Program Files\Java\jdk-22'
.\mvnw.cmd clean test
.\mvnw.cmd spring-boot:run
```

Se valida `http://localhost:8080/api/health` y luego
`http://localhost:8080/swagger-ui.html`. Si la conexión falla, se corrige el perfil de base de datos;
no se modifica una HU para compensarlo.

### Paso 3. Crear los paquetes

Dentro de `src/main/java/pe/edu/utp/escuela/app` se reutilizan `config`, `controller`, `dto`,
`exception`, `mail`, `security`, `service` y `util`; para el negocio se agregan `entity` y
`repository`. Las carpetas deben coincidir exactamente con la sentencia `package` del archivo Java.

### Paso 4. Patrón de entidad JPA con Lombok

El siguiente ejemplo se copia como base y se adapta a cada tabla. No se usa `@Data`.

```java
package pe.edu.utp.escuela.app.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "rol", schema = "esejur")
public class Rol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rol_id")
    private Long id;

    @Column(nullable = false, unique = true, length = 50)
    private String codigo;

    @Column(nullable = false, length = 100)
    private String nombre;

    @Column(columnDefinition = "text")
    private String descripcion;

    @Column(nullable = false)
    private boolean activo;
}
```

Las fechas `timestamptz` se representan con `Instant`, las fechas SQL `date` con `LocalDate`, los
importes con `BigDecimal` y los identificadores con `Long`. Una relación se mapea `LAZY` salvo que
la consulta demuestre otra necesidad.

### Paso 5. Patrón de repositorio JPA

```java
package pe.edu.utp.escuela.app.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.utp.escuela.app.entity.Rol;

public interface RolRepositorio extends JpaRepository<Rol, Long> {
    Optional<Rol> findByCodigoAndActivoTrue(String codigo);
}
```

El nombre derivado expresa la consulta. Si requiere varias asociaciones, campos calculados u
orden comercial, el mapa de la HU muestra JPQL mediante `@Query`. No se escribe SQL dentro del
controlador.

### Paso 6. Patrón de DTO y validación

Los datos que entran y salen de la API se definen por separado de la entidad:

```java
package pe.edu.utp.escuela.app.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record AccesoPeticion(
        @NotBlank @Email String correo,
        @NotBlank String contrasena
) {}
```

`@Valid` en el controlador valida forma y obligatoriedad. El servicio valida las reglas que
dependen de base de datos o del estado del proceso.

### Paso 7. Patrón de servicio con Lombok

```java
package pe.edu.utp.escuela.app.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.edu.utp.escuela.app.repository.RolRepositorio;

@Service
@RequiredArgsConstructor
public class RolServicio {
    private final RolRepositorio rolRepositorio;

    @Transactional(readOnly = true)
    public void comprobarRol(String codigo) {
        rolRepositorio.findByCodigoAndActivoTrue(codigo)
                .orElseThrow(() -> new IllegalStateException("El rol no está disponible"));
    }
}
```

`@RequiredArgsConstructor` crea el constructor para los atributos `final`. Esto hace explícitas las
dependencias y permite probar la clase sin inyección oculta.

En `config/PasswordConfig.java` se registra una sola instancia compartida:

```java
package pe.edu.utp.escuela.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class PasswordConfig {
    @Bean
    PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
}
```

### Paso 8. Patrón de controlador

```java
package pe.edu.utp.escuela.app.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.edu.utp.escuela.app.dto.AccesoPeticion;
import pe.edu.utp.escuela.app.service.AccesoServicio;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AccesoControlador {
    private final AccesoServicio accesoServicio;

    @PostMapping("/acceso")
    public ResponseEntity<Void> acceder(@Valid @RequestBody AccesoPeticion peticion) {
        accesoServicio.acceder(peticion);
        return ResponseEntity.noContent().build();
    }
}
```

El ejemplo enseña la forma de la capa; la HU-001 reemplaza `Void` por su respuesta real y agrega la
cookie. El controlador no consulta repositorios ni compara contraseñas.

### Paso 9. Preparar Angular

En `src/app/app.config.ts` se agrega el cliente HTTP una sola vez:

```ts
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { provideRouter, withInMemoryScrolling } from '@angular/router';
import { credencialesInterceptor } from './core/interceptors/credenciales.interceptor';

providers: [
  provideHttpClient(withInterceptors([credencialesInterceptor])),
  provideRouter(routes, withInMemoryScrolling({ scrollPositionRestoration: 'top' })),
]
```

Y se crea `src/app/core/interceptors/credenciales.interceptor.ts`:

```ts
import { HttpInterceptorFn } from '@angular/common/http';

export const credencialesInterceptor: HttpInterceptorFn = (req, next) =>
  next(req.clone({ withCredentials: true }));
```

Durante desarrollo se usa una sola constante de API en `src/app/core/api/api.config.ts`:

```ts
export const API_URL = 'http://localhost:8080/api';
```

Los perfiles de compilación de Angular podrán sustituirla posteriormente; una HU no debe repetir
la URL completa dentro de componentes.

### Paso 10. Orden repetible por cada HU

1. Leer la HU y su mapa completo.
2. Identificar tablas y campos exactos.
3. Crear o reutilizar entidades.
4. Crear el repositorio y probar la consulta contra PostgreSQL.
5. Crear DTO de entrada y salida.
6. Crear servicio y probar sus reglas.
7. Crear controlador y comprobarlo en Swagger.
8. Crear modelos y servicio HTTP Angular.
9. Conectar el formulario o pantalla existente.
10. Probar error, vacío, carga y éxito.
11. Ejecutar `mvnw test` y `npm test`; luego probar el recorrido integrado.

No se pasa al siguiente paso si el anterior no compila. Esta regla permite copiar los bloques de
manera controlada y saber exactamente dónde se produjo un error.
