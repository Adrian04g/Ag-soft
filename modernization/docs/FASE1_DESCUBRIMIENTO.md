# Fase 1 — Descubrimiento técnico (repositorio legado)

## Inventario resumido

- Total archivos: 193
- SQL: 159
- PRG (Visual FoxPro): 3
- Headers VFP: 2
- Scripts BAT: 4
- Documentos históricos (`.docx`, `.pptx`, `.pdf`): 3

## Mapa de módulos heredados

Detectados en `Inicio/cfgglobal.h`:

- GLOBAL
- CONTABILIDAD
- ALMACEN
- VENTAS
- COMPRAS
- PRODUCCION
- NOMINA

## Hallazgos de datos/objetos SQL (estimación estática)

- `CREATE TABLE`: ~713 coincidencias
- `CREATE/ALTER PROCEDURE`: ~813 coincidencias
- `CREATE VIEW`: ~60 coincidencias
- `CREATE/ALTER FUNCTION`: ~63 coincidencias
- `CREATE/ALTER TRIGGER`: ~18 coincidencias

> Conteo orientativo por análisis de texto; requiere depuración posterior por duplicados y variantes de sintaxis.

## Dependencias antiguas detectadas

- Visual FoxPro (`.prg`, `.h`, `.app`)
- SQL Server scripts y objetos T-SQL
- Referencias históricas a SQL Server Native Client 11.0 en documentación histórica

## Procesos potencialmente destructivos detectados

En carpetas de scripts se observan operaciones de:

- `DELETE`
- `DROP`
- `ALTER TABLE`
- scripts de borrado masivo / renumeración / restauración histórica

No fueron ejecutados.

## Archivos no versionables (control)

Ya protegidos por `.gitignore`:

- secretos/config local (`*.ini`, `*.env`, `*token*`, `*secret*`)
- backups y bases (`*.bak`, `*.mdf`, `*.ndf`, `*.ldf`, `*.dbf`, etc.)
- binarios (`*.dll`, `*.exe`, `*.fxp`, `*.zip`, `*.rar`)

## Riesgos principales

1. Reglas críticas embebidas en procedimientos/triggers no documentados.
2. Scripts históricos destructivos mezclados con scripts vigentes.
3. Dependencia operativa tácita de ejecución local VFP + SQL Server.
4. Ambigüedad de versionado por cliente/vertical (carpetas “Otros”, “NoCorrer”, etc.).

## Preguntas pendientes

1. ¿Cuáles scripts están oficialmente vigentes por cliente/módulo?
2. ¿Qué flujos de facturación electrónica son obligatorios por país/regulación?
3. ¿Qué proceso exacto define numeración fiscal por sede/caja?
4. ¿Qué SLA de sincronización offline/online se acepta por operación?

## Notas de anonimización

Las referencias históricas de infraestructura se tratan solo como contexto legado y no como configuración ejecutable.
