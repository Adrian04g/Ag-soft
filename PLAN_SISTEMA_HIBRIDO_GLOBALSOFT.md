# Plan de evolución a sistema híbrido web + aplicación local

## 1. Objetivo

Reemplazar progresivamente la aplicación Visual FoxPro y sus dependencias antiguas por una plataforma híbrida que permita:

- Administrar el sistema desde una aplicación web.
- Operar ventas y procesos críticos desde una aplicación local.
- Continuar trabajando temporalmente sin conexión a Internet.
- Sincronizar las sedes o puntos de venta con el servidor central.
- Mantener trazabilidad, auditoría y recuperación ante fallos.
- Migrar los datos existentes sin perder información histórica.
- Retirar gradualmente Visual FoxPro, los binarios heredados y SQL Server Native Client 11.0.

La transición debe ejecutarse por fases. No se recomienda reemplazar el sistema completo en una sola entrega.

## 2. Alcance inicial

El sistema actual contiene módulos de:

- Ventas y punto de venta.
- Compras.
- Inventario y almacén.
- Contabilidad y NIIF.
- Nómina.
- Producción.
- Restaurante.
- Tesorería.
- Facturación electrónica.
- Usuarios y configuración.
- Sincronización y replicación entre puntos.
- Reportes e impresión.

La configuración actual referencia:

```text
Servidor configurado: DESKTOP-GV9Q4BR\RUTA130
Base configurada: RUTA130
Proveedor: SQL Server Native Client 11.0
Ruta de aplicación: C:\DevAG\Jeferson\GLOBALSOFTSQL
```

Estos valores deben tratarse como datos históricos de referencia. No deben copiarse automáticamente al nuevo sistema.

## 3. Arquitectura objetivo

```text
                         +-------------------------+
                         | Aplicación web central  |
                         | Administración/reportes|
                         +------------+------------+
                                      |
                                      v
                         +-------------------------+
                         | API central             |
                         | Reglas de negocio      |
                         | Autenticación/auditoría|
                         +------------+------------+
                                      |
                                      v
                         +-------------------------+
                         | Base central            |
                         | PostgreSQL recomendado  |
                         +------------+------------+
                                      ^
                                      |
                         Sincronización segura
                                      |
        +-----------------------------+-----------------------------+
        |                             |                             |
+-------+-------+             +-------+-------+             +-------+-------+
| Aplicación    |             | Aplicación    |             | Aplicación    |
| local Punto 1 |             | local Punto 2 |             | local Punto N |
| POS/offline   |             | POS/offline   |             | POS/offline   |
+-------+-------+             +-------+-------+             +-------+-------+
        |                             |                             |
  BD local + agente             BD local + agente             BD local + agente
```

## 4. Principios de diseño

1. La aplicación local nunca debe escribir directamente en la base central.
2. La aplicación web nunca debe consultar directamente las bases locales.
3. Todas las operaciones deben pasar por una API o por un agente de sincronización controlado.
4. Cada operación debe tener un identificador único e idempotente.
5. La sincronización debe ser tolerante a desconexiones, reintentos y duplicados.
6. Los saldos contables no deben resolverse solamente con sincronización eventual.
7. Las operaciones financieras deben tener auditoría completa.
8. El sistema antiguo debe permanecer disponible durante la validación.
9. Las migraciones deben ser repetibles y verificables.
10. Ningún secreto debe guardarse en archivos de texto dentro de la aplicación.

## 5. Fases del proyecto

## Fase 0: Preparación, alcance y control del proyecto

### Objetivo

Definir responsables, alcance, presupuesto, sedes, módulos prioritarios y criterios para considerar terminada cada fase.

### Actividades

- Nombrar responsable funcional y responsable técnico.
- Identificar usuarios clave de ventas, inventario, compras y contabilidad.
- Enumerar sedes y puntos de venta.
- Registrar impresoras, lectores, balanzas, cajones y demás dispositivos.
- Definir horarios permitidos para pruebas y migraciones.
- Definir ambientes:
  - Desarrollo.
  - Pruebas.
  - Preproducción.
  - Producción.
- Crear un repositorio con control de versiones.
- Definir política de respaldos y recuperación.
- Clasificar scripts actuales en:
  - Vigentes.
  - Históricos.
  - Destructivos.
  - Específicos por cliente.
  - No ejecutar.

### Entregables

- Acta de alcance.
- Inventario de sedes y dispositivos.
- Matriz de responsables.
- Calendario de entregas.
- Política inicial de respaldo.
- Criterios de aceptación.

### Criterio de salida

El equipo conoce qué se va a reemplazar, en qué orden y quién aprueba cada módulo.

## Fase 1: Descubrimiento del sistema actual

### Objetivo

Documentar el comportamiento real de GlobalSoft antes de diseñar el reemplazo.

### Actividades

- Inventariar tablas, vistas, funciones, procedimientos y triggers.
- Identificar relaciones y claves primarias.
- Documentar reglas de cálculo de precios, impuestos, descuentos y costos.
- Documentar estados de documentos.
- Documentar el flujo completo de venta:
  - Apertura de caja.
  - Creación de factura.
  - Pago.
  - Impresión.
  - Devolución.
  - Anulación.
  - Cierre.
- Documentar el flujo de inventario:
  - Entrada.
  - Salida.
  - Traslado.
  - Ajuste.
  - Conteo.
  - Kardex.
- Documentar compras y recepción de mercancía.
- Documentar facturación electrónica.
- Documentar cierres contables.
- Documentar sincronización actual y sus conflictos.
- Registrar reportes y formatos de impresión.
- Identificar integraciones externas.
- Identificar campos sensibles y datos personales.

### Entregables

- Diccionario de datos.
- Catálogo de reglas de negocio.
- Diagramas de procesos.
- Inventario de reportes.
- Matriz de dependencias.
- Mapa de módulos y prioridades.
- Lista de comportamientos que deben conservarse y comportamientos que se corregirán.

### Criterio de salida

Cada módulo prioritario tiene un flujo documentado y ejemplos de entrada y salida.

## Fase 2: Diseño funcional y modelo de dominio

### Objetivo

Separar las reglas de negocio del modelo físico heredado.

### Actividades

- Definir entidades principales:
  - Empresa.
  - Sede.
  - Punto de venta.
  - Usuario.
  - Tercero.
  - Producto.
  - Lista de precios.
  - Impuesto.
  - Inventario.
  - Compra.
  - Venta.
  - Pago.
  - Documento electrónico.
  - Movimiento contable.
  - Auditoría.
- Definir estados y transiciones de cada documento.
- Definir qué operaciones pueden hacerse offline.
- Definir operaciones que requieren conexión.
- Definir reglas de autorización.
- Definir política de numeración de documentos.
- Definir reglas de resolución de conflictos.
- Definir campos obligatorios y validaciones.
- Diseñar catálogo de errores funcionales y técnicos.

### Entregables

- Modelo de dominio.
- Matriz de permisos.
- Catálogo de estados.
- Matriz offline/online.
- Reglas de numeración.
- Especificación funcional aprobada.

### Criterio de salida

Las reglas principales están aprobadas por los responsables funcionales y no dependen de nombres heredados de tablas.

## Fase 3: Selección de tecnologías y arquitectura técnica

### Objetivo

Elegir una plataforma moderna, soportable y apropiada para operación local y central.

### Propuesta base

- Frontend web: React + TypeScript.
- Aplicación local: Tauri o .NET moderno.
- Backend: ASP.NET Core con C#.
- API: REST con OpenAPI.
- Base central: PostgreSQL.
- Base local: SQLite para operaciones de punto de venta, salvo que los volúmenes requieran otra alternativa.
- Sincronización: servicio local con cola de operaciones.
- Autenticación: OpenID Connect/OAuth 2.0.
- Contenedores: Docker.
- Observabilidad: logs estructurados, métricas y trazas.
- Reportes: generación controlada en servidor y formatos compatibles con impresión local.

### Decisiones que deben aprobarse

- Tauri frente a aplicación .NET local.
- PostgreSQL desde el inicio frente a una etapa temporal con SQL Server.
- SQLite local frente a PostgreSQL local.
- Infraestructura propia frente a nube.
- Proveedor de identidad.
- Estrategia de facturación electrónica.
- Estrategia de actualización de la aplicación local.

### Entregables

- Documento de arquitectura.
- Diagrama de componentes.
- Decisiones técnicas registradas.
- Matriz de riesgos técnicos.
- Estándares de código y revisión.

### Criterio de salida

La arquitectura puede soportar varios puntos, desconexiones, reintentos y crecimiento sin depender de Visual FoxPro o del Native Client 11.0.

## Fase 4: Plataforma base y seguridad

### Objetivo

Construir los componentes comunes antes de desarrollar módulos funcionales.

### Actividades

- Crear repositorios separados o módulos claramente delimitados.
- Configurar compilación y pruebas automáticas.
- Crear ambientes reproducibles.
- Crear API base.
- Crear migraciones de base de datos.
- Implementar usuarios y roles.
- Implementar sesiones y renovación de tokens.
- Implementar auditoría.
- Implementar configuración por empresa y sede.
- Implementar manejo de errores.
- Implementar correlación de solicitudes.
- Implementar cifrado en tránsito.
- Crear gestión segura de secretos.
- Configurar copias de seguridad automáticas.
- Crear restauraciones de prueba.

### Entregables

- API ejecutable.
- Base central inicial.
- Autenticación funcional.
- Auditoría inicial.
- Pipeline de construcción y pruebas.
- Manual de recuperación.

### Criterio de salida

Un usuario puede autenticarse, consultar su sede y ejecutar una operación de prueba con auditoría.

## Fase 5: Modelo de sincronización

### Objetivo

Definir y construir la comunicación entre cada aplicación local y el servidor central.

### Diseño recomendado

Cada operación local debe almacenarse en una cola persistente:

```text
OperationId
DeviceId
SiteId
CreatedAt
Entity
EntityId
OperationType
Payload
Sequence
Status
RetryCount
LastError
```

Estados sugeridos:

```text
Pending
Sending
Applied
Rejected
Conflict
Cancelled
```

### Actividades

- Crear identidad única para cada sede, dispositivo y aplicación local.
- Crear cola local persistente.
- Implementar envío por lotes.
- Implementar reintentos con espera progresiva.
- Implementar confirmación de recepción.
- Implementar idempotencia en servidor.
- Implementar compresión y cifrado.
- Implementar descarga de cambios.
- Implementar control de versiones.
- Implementar resolución de conflictos.
- Implementar panel de operaciones fallidas.
- Implementar sincronización manual para soporte.
- Implementar pausa y reanudación.
- Registrar métricas de retraso y errores.

### Reglas recomendadas

- Los catálogos centrales se descargan a los puntos.
- Las ventas se originan en el punto de venta.
- Los identificadores se generan sin depender del servidor en tiempo real.
- Los números fiscales deben seguir las reglas autorizadas.
- Los documentos confirmados no se sobrescriben silenciosamente.
- Los conflictos deben quedar visibles para un usuario autorizado.
- Una operación repetida no debe duplicar una venta.

### Entregables

- Servicio de sincronización local.
- Cola local.
- API de sincronización.
- Registro de conflictos.
- Panel de estado.
- Pruebas de desconexión y recuperación.

### Criterio de salida

Un punto puede desconectarse, registrar operaciones, reconectarse y sincronizar sin duplicar ni perder datos.

## Fase 6: Aplicación local del punto de venta

### Objetivo

Permitir operación local estable, rápida y tolerante a desconexiones.

### Funciones iniciales

- Inicio de sesión local controlado.
- Selección de sede y caja.
- Apertura de caja.
- Consulta de productos.
- Consulta de precios e impuestos.
- Creación de venta.
- Descuentos autorizados.
- Diferentes medios de pago.
- Impresión de comprobantes.
- Reimpresión controlada.
- Devoluciones y anulaciones.
- Cierre de caja.
- Consulta de operaciones pendientes de sincronizar.
- Estado de conexión.
- Reintento de sincronización.

### Integración con dispositivos

- Impresora térmica.
- Impresora de oficina.
- Lector de código de barras.
- Cajón monedero.
- Balanza, si aplica.
- Pantalla de cliente, si aplica.
- Firma o dispositivo fiscal, si aplica.

### Recomendaciones

- Aislar los controladores de dispositivos en una capa local.
- No acoplar la lógica de negocio al modelo de una impresora.
- Probar cada fabricante soportado.
- Mantener una cola local de impresión.
- Registrar el resultado de cada impresión.

### Entregables

- Aplicación local instalable.
- Instalador y desinstalador.
- Actualización automática o administrada.
- Módulo de dispositivos.
- Manual de operación.

### Criterio de salida

El punto puede operar una jornada completa sin conexión y recuperar la sincronización posteriormente.

## Fase 7: Aplicación web administrativa

### Objetivo

Centralizar administración, consulta, configuración y supervisión.

### Módulos sugeridos

1. Inicio y tablero operativo.
2. Usuarios, roles y permisos.
3. Empresas, sedes y cajas.
4. Terceros.
5. Productos, categorías y unidades.
6. Impuestos.
7. Listas de precios.
8. Inventario.
9. Compras.
10. Ventas.
11. Facturación electrónica.
12. Tesorería.
13. Contabilidad.
14. Nómina.
15. Reportes.
16. Auditoría.
17. Sincronización.
18. Configuración del sistema.

### Entregables

- Aplicación web responsive.
- Administración central.
- Reportes básicos.
- Monitoreo de sedes.
- Gestión de usuarios y permisos.

### Criterio de salida

Un administrador puede gestionar catálogos, consultar operaciones y resolver incidencias de sincronización sin acceder directamente a la base.

## Fase 8: Migración de datos

### Objetivo

Trasladar la información actual al modelo nuevo con trazabilidad y conciliación.

### Actividades

- Respaldar todas las fuentes.
- Identificar la base de producción real.
- Crear copias de trabajo.
- Extraer datos sin modificar el origen.
- Normalizar caracteres y codificación.
- Detectar duplicados.
- Detectar claves inválidas.
- Identificar registros huérfanos.
- Convertir fechas y números.
- Mapear estados antiguos a estados nuevos.
- Mapear impuestos y cuentas.
- Mapear usuarios y permisos.
- Migrar catálogos.
- Migrar saldos iniciales.
- Migrar documentos históricos.
- Migrar adjuntos y formatos necesarios.
- Crear reportes de diferencias.

### Estrategia

La migración debe tener scripts versionados y repetibles:

```text
01_extract
02_clean
03_transform
04_load
05_reconcile
06_validate
```

### Entregables

- Mapeo de campos.
- Scripts de extracción y transformación.
- Informe de calidad.
- Informe de conciliación.
- Registro de excepciones.
- Procedimiento de reversión.

### Criterio de salida

Los totales de ventas, inventario, cartera y contabilidad coinciden con el sistema aprobado para la fecha de corte.

## Fase 9: Facturación, contabilidad e integraciones

### Objetivo

Reemplazar los procesos críticos que no pueden quedar incompletos.

### Actividades

- Confirmar requisitos fiscales del país.
- Seleccionar proveedor o integración de facturación electrónica.
- Implementar generación de documentos.
- Implementar firma o validación requerida.
- Implementar envío y respuesta.
- Implementar notas crédito y débito.
- Implementar contingencias.
- Implementar consulta de estados.
- Implementar numeración y resolución.
- Validar impuestos.
- Validar asientos contables.
- Validar cierres.
- Validar reportes fiscales.

### Entregables

- Integración fiscal certificada o validada.
- Pruebas de aceptación fiscal.
- Manual de contingencia.
- Conciliación contable.

### Criterio de salida

Las operaciones fiscales y contables cumplen los requisitos legales y fueron aprobadas por el responsable correspondiente.

## Fase 10: Pruebas

### Niveles de prueba

- Unitarias.
- Integración.
- API.
- Base de datos.
- Sincronización.
- Desconexión y reconexión.
- Compatibilidad de dispositivos.
- Seguridad.
- Rendimiento.
- Recuperación de respaldos.
- Aceptación funcional.
- Prueba paralela contra GlobalSoft.

### Escenarios críticos

- Dos ventas simultáneas en diferentes puntos.
- Pérdida de conexión durante una venta.
- Reintento después de timeout.
- Duplicación de una solicitud.
- Reinicio del equipo local.
- Corrupción o falta de espacio en la base local.
- Cambio de precios mientras un punto está desconectado.
- Devolución creada offline.
- Cierre de caja sin conexión.
- Conflicto de inventario.
- Facturación durante contingencia.
- Restauración completa de una sede.

### Criterios mínimos

- No perder operaciones confirmadas localmente.
- No duplicar documentos.
- Detectar y mostrar conflictos.
- Registrar todos los cambios.
- Recuperar la aplicación local después de reiniciar.
- Restaurar una base y validar su integridad.

## Fase 11: Piloto controlado

### Objetivo

Validar el sistema en una sede o grupo reducido antes del despliegue general.

### Actividades

- Seleccionar una sede representativa.
- Capacitar a los usuarios.
- Instalar la aplicación local.
- Configurar dispositivos.
- Cargar catálogos.
- Operar en paralelo con el sistema anterior.
- Comparar ventas, inventario y cierres.
- Medir sincronización.
- Registrar incidencias.
- Corregir antes de ampliar el alcance.

### Criterio de salida

El piloto completa una jornada o periodo contable definido sin incidentes críticos y con conciliación aprobada.

## Fase 12: Despliegue progresivo

### Objetivo

Implementar el sistema en todas las sedes con riesgo controlado.

### Actividades

- Programar ventanas de instalación.
- Respaldar cada sede.
- Instalar la aplicación local.
- Configurar identidad del dispositivo.
- Probar impresión y lectores.
- Descargar catálogos.
- Ejecutar prueba de venta.
- Confirmar sincronización.
- Mantener soporte reforzado.
- Registrar versiones instaladas.

### Estrategia de despliegue

```text
Piloto
  -> 2 sedes
  -> 25% de sedes
  -> 50% de sedes
  -> 100% de sedes
```

Cada etapa debe tener una ventana de observación antes de continuar.

## Fase 13: Operación, soporte y continuidad

### Objetivo

Mantener la plataforma operativa y recuperable.

### Actividades

- Crear mesa de ayuda.
- Definir niveles de soporte.
- Monitorear API, bases y sincronización.
- Revisar operaciones rechazadas.
- Medir tiempos de respuesta.
- Actualizar aplicaciones locales.
- Revisar respaldos.
- Ejecutar restauraciones de prueba.
- Rotar credenciales.
- Aplicar parches de seguridad.
- Revisar permisos.
- Auditar operaciones sensibles.
- Documentar incidentes.

### Indicadores sugeridos

- Disponibilidad de API.
- Puntos sincronizados correctamente.
- Operaciones pendientes.
- Operaciones rechazadas.
- Tiempo promedio de sincronización.
- Tiempo de resolución de conflictos.
- Errores de impresión.
- Ventas duplicadas.
- Diferencias de inventario.
- Tiempo de recuperación.

## Fase 14: Retiro del sistema legado

### Objetivo

Eliminar dependencias antiguas solo después de completar la migración.

### Actividades

- Confirmar que ningún punto usa Visual FoxPro.
- Confirmar que ningún proceso depende de SQL Server Native Client 11.0.
- Archivar la base anterior en modo solo lectura.
- Conservar respaldos conforme a la política legal.
- Retirar tareas programadas antiguas.
- Retirar scripts de replicación obsoletos.
- Retirar credenciales antiguas.
- Desinstalar componentes no utilizados.
- Documentar el cierre.

### Criterio de salida

El sistema nuevo opera de forma independiente y el sistema anterior solo se conserva para consulta histórica o cumplimiento.

## 6. Prioridad recomendada de módulos

### Primera entrega

- Usuarios y permisos.
- Empresas, sedes y cajas.
- Productos.
- Terceros.
- Impuestos.
- Listas de precios.
- Aplicación local básica.
- Sincronización.

### Segunda entrega

- Ventas.
- Pagos.
- Impresión.
- Cierre de caja.
- Inventario.
- Compras.

### Tercera entrega

- Facturación electrónica.
- Devoluciones.
- Traslados.
- Ajustes de inventario.
- Reportes operativos.

### Cuarta entrega

- Contabilidad.
- Tesorería.
- Nómina.
- Producción.
- Restaurante.
- Reportes avanzados.

## 7. Reglas para la sincronización

### Identificadores

Cada instalación debe tener:

- `TenantId` o empresa.
- `SiteId` o sede.
- `DeviceId` o dispositivo.
- `OperationId` único.
- Fecha y hora UTC.
- Secuencia local.

### Idempotencia

El servidor debe guardar cada `OperationId` procesado. Si recibe la misma operación nuevamente, debe devolver el resultado anterior y no crear un duplicado.

### Conflictos

Los conflictos deben clasificarse:

- Catálogo desactualizado.
- Inventario insuficiente.
- Documento duplicado.
- Numeración ocupada.
- Usuario sin permiso.
- Versión incompatible.
- Datos inválidos.

Cada conflicto debe conservar:

- Operación original.
- Mensaje.
- Fecha.
- Sede.
- Usuario.
- Acción tomada.
- Resultado final.

## 8. Seguridad

- Usar HTTPS en todas las comunicaciones.
- No guardar contraseñas en archivos `.txt`.
- Usar hashes de contraseña con algoritmos actuales.
- Aplicar autenticación multifactor para administradores.
- Separar permisos por empresa, sede y módulo.
- Cifrar la base local si almacena datos sensibles.
- Limitar los datos guardados offline.
- Revocar dispositivos perdidos.
- Rotar credenciales.
- Validar y registrar todas las descargas de configuración.
- No exponer la base de datos directamente a Internet.
- Aplicar copias de seguridad cifradas.
- Definir retención de logs y datos personales.

## 9. Respaldo y recuperación

### Servidor central

- Respaldo completo periódico.
- Respaldo incremental o de transacciones, según la base elegida.
- Copia fuera del servidor principal.
- Copia cifrada.
- Prueba de restauración programada.

### Punto de venta

- Respaldo automático de la base local.
- Retención de la cola de operaciones.
- Recuperación desde otro equipo.
- Exportación segura de operaciones pendientes.

### Objetivos

Definir y aprobar:

- `RPO`: cuánto dato se puede perder como máximo.
- `RTO`: cuánto tiempo puede tardar la recuperación.

## 10. Riesgos principales

| Riesgo | Impacto | Mitigación |
|---|---|---|
| Reglas no documentadas | Alto | Descubrimiento y pruebas paralelas |
| Datos inconsistentes | Alto | Limpieza, conciliación y excepciones |
| Conflictos de inventario | Alto | Reglas explícitas y resolución supervisada |
| Fallos de sincronización | Alto | Cola persistente, reintentos e idempotencia |
| Dispositivos incompatibles | Medio | Pruebas por fabricante y capa de integración |
| Facturación incorrecta | Crítico | Validación fiscal y pruebas de contingencia |
| Pérdida de datos local | Crítico | Respaldos y cola durable |
| Usuarios sin capacitación | Medio | Piloto, manuales y soporte |
| Dependencia temporal del legado | Medio | Fechas y criterios de retiro |
| Exposición de información sensible | Crítico | Cifrado, mínimos privilegios y gestión de secretos |

## 11. Criterios generales de aceptación

El sistema se considerará listo para producción cuando:

- La aplicación web y la local tengan control de versiones.
- Las operaciones críticas funcionen sin conexión.
- La sincronización sea reintentable e idempotente.
- No existan duplicados en pruebas de reconexión.
- Los cierres de caja concilien.
- El inventario concilie.
- La facturación cumpla los requisitos aplicables.
- La auditoría permita reconstruir operaciones.
- Existan respaldos y restauraciones probadas.
- Los usuarios estén capacitados.
- Exista procedimiento de soporte.
- Se pueda actualizar o retirar un dispositivo.
- La dependencia de Visual FoxPro sea únicamente histórica durante la transición.

## 12. Primeros pasos concretos

1. Copiar y proteger la base actual y los respaldos.
2. Identificar cuál base de datos es realmente productiva.
3. Registrar todas las sedes y dispositivos.
4. Levantar los procesos de venta, inventario y facturación.
5. Crear un ambiente de desarrollo separado.
6. Definir el modelo inicial de usuarios, sedes y productos.
7. Construir la API de autenticación y catálogos.
8. Construir la cola local y el protocolo de sincronización.
9. Crear una aplicación local mínima que permita consultar productos y registrar una venta de prueba.
10. Construir la pantalla web para revisar esa venta.
11. Simular desconexión, reconexión y reintento.
12. Iniciar el piloto con una sede controlada.

## 13. Resultado esperado

Al finalizar la transición, GlobalSoft deberá funcionar como una plataforma distribuida:

- La administración se realizará desde la web.
- Cada punto podrá vender y operar localmente.
- Las sedes se sincronizarán con el servidor central.
- Las fallas de Internet no detendrán completamente la operación.
- Las reglas de negocio estarán en servicios modernos y probados.
- Los datos estarán auditados y respaldados.
- Visual FoxPro y SQL Server Native Client 11.0 ya no serán dependencias operativas.
