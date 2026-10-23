# Fase 2 — Modelo de dominio inicial

## Entidades núcleo

- Empresa
- Sede
- PuntoDeVenta
- Dispositivo
- Usuario
- Rol
- Permiso
- Tercero
- Producto
- Categoria
- Unidad
- Impuesto
- ListaPrecio
- Inventario
- Compra
- Venta
- DetalleVenta
- Pago
- Caja
- MovimientoInventario
- DocumentoElectronico
- Auditoria
- OperacionSincronizacion
- ConflictoSincronizacion

## Estados de sincronización

- Pending
- Sending
- Applied
- Rejected
- Conflict
- Cancelled

## Relacional inicial (resumen)

- Empresa 1..N Sede
- Sede 1..N Dispositivo
- Rol 1..N Usuario
- Venta 1..N DetalleVenta
- Venta 1..N Pago
- OperacionSincronizacion: clave única `OperationId` (idempotencia)

## Matriz offline/online (resumen)

- Offline permitido: catálogo local, venta, pago, cola de sincronización.
- Online requerido: sincronización, reconciliación de conflictos, administración global.

## Matriz de permisos (resumen)

- `admin.global`: configuración de empresas/sedes/usuarios/roles.
- `pos.cajero`: ventas, pagos, cierre caja local.
- `sync.operator`: reintentos/manual sync y revisión conflictos.
- `audit.viewer`: consulta de auditoría y trazabilidad.
