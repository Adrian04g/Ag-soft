--********************************************************
--***** PROYECTO MOTOR DE SINCRONIZACION GLOBALSOFT ******
--AUTOR..: Guzmán D. Darío
--FECHA..: 2017-01-29
--********************************************************
IF (SELECT GSSYNC FROM Glb_Parametros) = 1
BEGIN
	select 'El parametro GsSync debe ser igual a 0' as MessageResult
	return
END
/*
	Prerequisitos.
*/
IF OBJECT_ID('SYN_PUBLICACIONES') IS NULL
BEGIN
	RAISERROR('Creando tabla SYN_PUBLICACIONES.',10,1) WITH NOWAIT
	CREATE TABLE dbo.SYN_PUBLICACIONES (
		CodPublicacion VARCHAR(20) NOT NULL DEFAULT '',
		Activa BIT NOT NULL DEFAULT 1 ,
		FechModificacion SMALLDATETIME NOT NULL DEFAULT GETDATE(),
		UsuarioModificacion VARCHAR(20) NOT NULL DEFAULT '',
		EquipoModificacion VARCHAR(20) NOT NULL DEFAULT HOST_NAME())
	ALTER TABLE dbo.SYN_PUBLICACIONES ADD CONSTRAINT PK_SYN_PUBLICACIONES
		PRIMARY KEY(CodPublicacion)
END
GO
IF NOT EXISTS(SELECT TOP 1 * FROM dbo.SYN_PUBLICACIONES)
BEGIN
	INSERT INTO dbo.SYN_PUBLICACIONES(CodPublicacion,Activa,UsuarioModificacion)
		SELECT 'InvEsp',1,'AUTO'
		UNION ALL SELECT 'Maestros',1,'AUTO'
		UNION ALL SELECT 'MovReady',1,'AUTO'
END
GO
IF OBJECT_ID('SYN_TABLASPUBLICACION') IS NULL
BEGIN
	RAISERROR('Creando tabla SYN_TABLASPUBLICACION.',10,1) WITH NOWAIT
	CREATE TABLE dbo.SYN_TABLASPUBLICACION (
		CodPublicacion VARCHAR(20) NOT NULL DEFAULT '',
		CodTabla VARCHAR(20) NOT NULL DEFAULT '',
		Filtro VARCHAR(250) NOT NULL DEFAULT '',
		ReplicacionActiva BIT NOT NULL DEFAULT 1 ,
		FechModificacion SMALLDATETIME NOT NULL DEFAULT GETDATE(),
		UsuarioModificacion VARCHAR(20) NOT NULL DEFAULT '',
		AliasNombre VARCHAR(60) NOT NULL DEFAULT '',
		EquipoModificacion VARCHAR(20) NOT NULL DEFAULT HOST_NAME(),
		OmitirCentro BIT NOT NULL DEFAULT 0)
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT PK_SYN_TABLASPUBLICACION
		PRIMARY KEY(CodPublicacion,CodTabla)
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT FK_SYN_TABLASPUBLICACION_PUBLICACIONES
		FOREIGN KEY(CodPublicacion) REFERENCES dbo.SYN_PUBLICACIONES(CodPublicacion)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_SYN_PUBLICACIONES')
BEGIN
	ALTER TABLE dbo.SYN_PUBLICACIONES ADD CONSTRAINT PK_SYN_PUBLICACIONES PRIMARY KEY(CodPublicacion)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_SYN_TABLASPUBLICACION')
BEGIN
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT PK_SYN_TABLASPUBLICACION PRIMARY KEY(CodPublicacion,CodTabla)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='FK_SYN_TABLASPUBLICACION_PUBLICACIONES')
BEGIN
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT FK_SYN_TABLASPUBLICACION_PUBLICACIONES FOREIGN KEY(CodPublicacion) REFERENCES dbo.SYN_PUBLICACIONES(CodPublicacion)
END
GO

IF NOT EXISTS(SELECT TOP 1 * FROM dbo.SYN_TABLASPUBLICACION)
BEGIN
	INSERT INTO dbo.SYN_TABLASPUBLICACION(CodPublicacion,CodTabla,Filtro,ReplicacionActiva,UsuarioModificacion,AliasNombre,OmitirCentro,FechModificacion,EquipoModificacion)
		SELECT 'InvEsp','alm_inventario','',1,'AUTO','Inventario',0,'',HOST_NAME()
		UNION ALL SELECT 'InvEsp','alm_kardextemp','',1,'AUTO','Kardex Temporal',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_articulos','',1,'AUTO','Articulos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_detinvfisicos','',1,'AUTO','Detalle Inv' ,0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_codbarras','',1,'AUTO','Codigo de Barras',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_genero','',1,'AUTO','Genero',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_grupos','',1,'AUTO','Grupos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_lineas','',1,'AUTO','Lineas',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_marcas','',1,'AUTO','Marcas',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_tallasart','',1,'AUTO','Tallas Articulos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_tipoin','',1,'AUTO','Tipo Ingreso',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_tipoplato','',1,'AUTO','Tipo Plato',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_tips','',1,'AUTO','Tips',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_unidades','',1,'AUTO','Unidades',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_variantes','',1,'AUTO','Variantes',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','com_cancela','',1,'AUTO','Compras Cancela',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','com_conceptos','',1,'AUTO','Conceptos Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','com_estados','',1,'AUTO','Estados Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','com_parametros','',1,'AUTO','Parametros Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','com_tipestados','',1,'AUTO','Tip Estados Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','com_tipos','',1,'AUTO','Tipos Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','con_cencostos','',1,'AUTO','Centros de Costos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','con_mescierre','',1,'AUTO','Mes Cierre',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','con_parametros','',1,'AUTO','Parametros Contables',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','con_puc','',1,'AUTO','Plan Unico Cuentas',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_accesos','',1,'AUTO','Accesos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_almacen','',1,'AUTO','Almacen',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_bancos','',1,'AUTO','Bancos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_barrio','',1,'AUTO','Barrios',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_cargos','',1,'AUTO','Cargos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_cenconsumo','',1,'AUTO','Centros Consumo',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_ciudad','',1,'AUTO','Ciudad',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_conceptoscli','',1,'AUTO','Conceptos Clientes',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_contac','',1,'AUTO','Contac',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_descuentos','',1,'AUTO','Descuentos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_dpto','',1,'AUTO','Departamento',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_empresa','',1,'AUTO','Empresa',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_estados','',1,'AUTO','Estados',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_global','',1,'AUTO','Global',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_hobby','',1,'AUTO','Hobby',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_idx','',1,'AUTO','Idx',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_labores','',1,'AUTO','Labores',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_mensaje','',1,'AUTO','Mensaje',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_menu','',1,'AUTO','Menu',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_modulos','',1,'AUTO','Modulos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_niveles','',1,'AUTO','Niveles',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_perfilcto','',1,'AUTO','Perfil Centro de Costo',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_perfiles','',1,'AUTO','Perfiles',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_profesion','',1,'AUTO','Profesion',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_terceros','',1,'AUTO','Terceros',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_tipid','',1,'AUTO','Tip Id',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_transaccion','',1,'AUTO','Transaccion',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_usuarios','',1,'AUTO','Usuarios',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_zonas','',1,'AUTO','Zonas',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','pro_formulas','',1,'AUTO','Formulas',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','pro_parametros','',1,'AUTO','Parametros',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','ven_conceptos','',1,'AUTO','Conceptos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','ven_formapago','',1,'AUTO','Forma Pago',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','ven_parametros','',1,'AUTO','Paramentos Ventas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_alimfisico','',1,'AUTO','Alim Fisico',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_conteoinv','',1,'AUTO','Conteo Inventario',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_invfisicos','',1,'AUTO','Inventario Fisico',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_kardex','',1,'AUTO','Kardex',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_promo','',1,'AUTO','Promocion',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_promodet','',1,'AUTO','Detalle Promocion',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_detrequi','',1,'AUTO','Detrequi',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_facdescuentos','',1,'AUTO','Descuentos Facturas Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_facdetalle','',1,'AUTO','Detalle Facturas Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_facdetremi','',1,'AUTO','Facdetremi',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_facturas','',1,'AUTO','Facturas Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_gasdetalle','',1,'AUTO','Gasdetalle',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_gastos','',1,'AUTO','Gastos',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_movpro','',1,'AUTO','Movimiento Proveedores',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_notas','',1,'AUTO','Notas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_notastemp','',1,'AUTO','Notas Temporales',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_orddetalle','',1,'AUTO','Detalles Orden Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_ordenes','',1,'AUTO','Ordenes Compras',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_pordes','',1,'AUTO','Porcentaje Descuento',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','com_requi','',1,'AUTO','Requicitos',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','con_comprobante','',1,'AUTO','Comprobantes',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','con_foldetalle','',1,'AUTO','Folios Detalles',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','con_folios','',1,'AUTO','Folios',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','con_resolclientes','',1,'AUTO','Resolucion',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','glb_caja','',1,'AUTO','Caja',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','glb_mensual','',1,'AUTO','Mensual',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','glb_unica','',1,'AUTO','Unica',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','pro_costos','',1,'AUTO','Costos',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','pro_movcontrato','',1,'AUTO','Mov Contrato',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','pro_orddetalle','',1,'AUTO','Detalle Orden Proveedores',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','pro_ordenes','',1,'AUTO','Ordenes Proveedores',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','tes_conciliacion','',1,'AUTO','Conciliacion',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','tes_detconciliacion','',1,'AUTO','Detalles Conciliacion',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','tes_egresos','',1,'AUTO','Egresos',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_cotidetalle','',1,'AUTO','Detalle Cotizaxion',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_cotizacion','',1,'AUTO','Cotizacion',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_detconcep','',1,'AUTO','Concpeto Detalle',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_facdepre','',1,'AUTO','Factura Depre',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_facdescuentos','',1,'AUTO','Decuentos Facturas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_facdetalle','',1,'AUTO','Detalle Facturas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_facdetremi','',1,'AUTO','Fac detremi',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_facturas','',1,'AUTO','Facturas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_facuopagos','',1,'AUTO','Pagos Cuotas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_facuota','',1,'AUTO','Facutura Cuotas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_mesas','',1,'AUTO','Mesas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_movcli','',1,'AUTO','Movimiento Cliente',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_notas','',1,'AUTO','Notas',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_pagdescuentos','',1,'AUTO','Pago Descuentos',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_pagdetalle','',1,'AUTO','Pago Detalle',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_pagos','',1,'AUTO','Pagos',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_pdetalle','',1,'AUTO','P Detalle',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_pedicoti','',1,'AUTO','Pedidos Cotizacion' ,0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_pedidos','',1,'AUTO','Pedidos',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_prefacdetalle','',1,'AUTO','Detalles Prefactura',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_prefactura','',1,'AUTO','Pre Factura',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_segcartera','',1,'AUTO','Seg Cartera',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','ven_variantes','',1,'AUTO','Variantes',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_color','',1,'AUTO','Color',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_propiedad','',1,'AUTO','Propiedad',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_target','',1,'AUTO','Target',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','alm_temporada','',1,'AUTO','Temporada',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_artxlote','',1,'AUTO','Articulo x lote',0,'',HOST_NAME()
		UNION ALL SELECT 'MovReady','alm_vence','',1,'AUTO','Alm Vence',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_clasiven','',1,'AUTO','Glb Clasiven',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_departamentos','',1,'AUTO','Departamentos',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_error','',1,'AUTO','Error',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','glb_pais','',1,'AUTO','Pais',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','Glb_Parametros','',1,'AUTO','Glb_Parametros',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','ven_clasiven','',1,'AUTO','Ven Clasiven',0,'',HOST_NAME()
		UNION ALL SELECT 'Maestros','ven_parametros2','',1,'AUTO','Ven Parametros2',0,'',HOST_NAME()
END
GO

UPDATE syn_tablaspublicacion set OmitirCentro = 1 where codpublicacion in ('InvEsp','Maestros')
GO

IF OBJECT_ID('db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN','FN') IS NOT NULL
	DROP FUNCTION dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN
GO
CREATE FUNCTION dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN(
	@cd_TBL_NAME VARCHAR(20),
	@ds_ALI_NAME1 VARCHAR(20),
	@ds_ALI_NAME2 VARCHAR(20))
RETURNS VARCHAR(4000)
AS
BEGIN
	DECLARE @cd_KEY VARCHAR(1000)
	SELECT @cd_KEY = COALESCE(@cd_KEY+' AND [Table1].['+UPPER(COLUMN_NAME)+'] = [Table2].['+UPPER(COLUMN_NAME)+']','[Table1].['+UPPER(COLUMN_NAME)+'] = [Table2].['+UPPER(COLUMN_NAME) + ']')
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		WHERE CONSTRAINT_NAME LIKE 'PK_' + @cd_TBL_NAME	
		AND TABLE_CATALOG = DB_NAME()
		ORDER BY ORDINAL_POSITION
	SET @cd_KEY = REPLACE(@cd_KEY,'[Table1]','['+@ds_ALI_NAME1+']')
	SET @cd_KEY = REPLACE(@cd_KEY,'[Table2]','['+@ds_ALI_NAME2+']')
	RETURN (IsNull(@cd_KEY,''))
END
GO
/*
	Cambio de estructura.
*/
-- ALMACEN.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_alimfisico')
BEGIN
	ALTER TABLE alm_alimfisico ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE alm_alimfisico ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE alm_alimfisico ALTER COLUMN anoinv NVARCHAR(5) NOT NULL
	ALTER TABLE alm_alimfisico ALTER COLUMN mesinv NVARCHAR(5) NOT NULL
	ALTER TABLE alm_alimfisico ALTER COLUMN codart NVARCHAR(20) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_articulos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_codbarras')
BEGIN
		ALTER TABLE alm_codbarras ADD CONSTRAINT PK_alm_codbarras PRIMARY KEY(codbarra,codart,modificadoc)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_conteoinv')
BEGIN
	alter table alm_conteoinv alter column idemp nvarchar(6) not null
	alter table alm_conteoinv alter column codcto nvarchar(6) not null
	alter table alm_conteoinv alter column numcont nvarchar(16) not null
	alter table alm_conteoinv alter column codart nvarchar(20) not null
	alter table alm_conteoinv alter column fecsys datetime not null
	alter table alm_conteoinv alter column itemart numeric(10) not null
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_color')
BEGIN
	alter table alm_color add constraint PK_alm_color primary key (codcol)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_genero')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_grupos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_inventario')
BEGIN
	ALTER TABLE ALM_INVENTARIO ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_INVENTARIO ALTER COLUMN CODCTO NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_INVENTARIO ALTER COLUMN CODART NVARCHAR(20) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_invfisicos')
BEGIN
	
	ALTER TABLE ALM_INVFISICOS ALTER COLUMN idemp NVARCHAR(6) not null
	ALTER TABLE ALM_INVFISICOS ALTER COLUMN codcto NVARCHAR(6) not null
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_kardex')
BEGIN
	ALTER TABLE ALM_KARDEX ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_KARDEX ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_KARDEX ALTER COLUMN codcon NVARCHAR(4) NOT NULL
	ALTER TABLE ALM_KARDEX ALTER COLUMN numcon NVARCHAR(16) NOT NULL
	ALTER TABLE ALM_KARDEX ALTER COLUMN codart NVARCHAR(20) NOT NULL
	ALTER TABLE ALM_KARDEX ALTER COLUMN itemfac NUMERIC(12) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_kardextemp')
BEGIN
	ALTER TABLE alm_kardextemp ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE alm_kardextemp ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE alm_kardextemp ALTER COLUMN codcon NVARCHAR(4) NOT NULL
	ALTER TABLE alm_kardextemp ALTER COLUMN numcon NVARCHAR(16) NOT NULL
	ALTER TABLE alm_kardextemp ALTER COLUMN codart NVARCHAR(20) NOT NULL
	ALTER TABLE alm_kardextemp ALTER COLUMN itemfac NUMERIC(12) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_lineas')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_marcas')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_promo')
BEGIN
	ALTER TABLE ALM_PROMO ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_PROMO ALTER COLUMN CODCTO NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_PROMO ALTER COLUMN numero NVARCHAR(20) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_promodet')
BEGIN
	ALTER TABLE alm_promodet ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE alm_promodet ALTER COLUMN CODCTO NVARCHAR(6) NOT NULL
	ALTER TABLE alm_promodet ALTER COLUMN numero NVARCHAR(20) NOT NULL
	ALTER TABLE alm_promodet ALTER COLUMN CODART NVARCHAR(20) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tallasart')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tipoin')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tipoplato')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tips')
BEGIN
	ALTER TABLE ALM_TIPS ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_TIPS ALTER COLUMN codtips NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'alm_tips' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE alm_tips ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_alm_tips_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_unidades')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_variantes')
BEGIN
	ALTER TABLE ALM_VARIANTES ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE ALM_VARIANTES ALTER COLUMN codart NVARCHAR(20) NOT NULL
	ALTER TABLE ALM_VARIANTES ALTER COLUMN citem NUMERIC(12) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'alm_variantes' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE alm_variantes ADD item NUMERIC(12) NOT NULL CONSTRAINT DF_alm_variantes_item DEFAULT(0)
	END
END
-- COMPRAS.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_cancela')
BEGIN
	ALTER TABLE COM_CANCELA ALTER COLUMN CODCON NVARCHAR(6) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_conceptos')
BEGIN
	ALTER TABLE com_conceptos ALTER COLUMN IDEMP NVARCHAR(6) NOT NULL
	ALTER TABLE com_conceptos ALTER COLUMN CODCON NVARCHAR(4) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_conceptos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_conceptos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_conceptos_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_detrequi')
BEGIN
	ALTER TABLE com_detrequi ALTER COLUMN codcen nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN numreq nvarchar(8) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN codart nvarchar(10) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN numord nvarchar(8) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN undart nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN totart decimal(12,2) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN qtyart decimal(8,0) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN cosart decimal(12,2) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN descrip nvarchar(MAX) NOT NULL	
	ALTER TABLE com_detrequi ALTER COLUMN qtyped decimal(14,2) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN codest nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN fecini datetime NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN fecfin datetime NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colorped nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colforb nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN marca nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN tipo nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN modelo nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN material nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN tipsup nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colorpue nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colorper nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colorpan1 nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colorpan2 nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colorsill nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN matepan nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN matesill nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN vidrio decimal(1,0) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN tipoped nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN tipforpan nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colfor1 nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colfor2 nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN tippuer nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colfal nvarchar(5) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN colsup nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN ejecu decimal(1,0) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN tipfal nvarchar(3) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN tipgru decimal(1,0) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN valor decimal(12,0) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN servidor nvarchar(60) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN fecsys datetime NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN codusumod nvarchar(15) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN codusu nvarchar(15) NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN docdelete bit NOT NULL
	ALTER TABLE com_detrequi ALTER COLUMN modificadoc numeric(10,0) NOT NULL
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_detrequi')
BEGIN 
	ALTER TABLE com_detrequi ADD CONSTRAINT PK_com_detrequi PRIMARY KEY(codcen,numreq,codart,numord)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_estados')
BEGIN
	ALTER TABLE com_estados ALTER COLUMN numreq NVARCHAR(20) NOT NULL
	ALTER TABLE com_estados ALTER COLUMN codcen NVARCHAR(6) NOT NULL
	ALTER TABLE com_estados ALTER COLUMN codart NVARCHAR(20) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_estados' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_estados ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_estados_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdescuentos')
BEGIN
	ALTER TABLE com_facdescuentos ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE com_facdescuentos ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE com_facdescuentos ALTER COLUMN tippag NVARCHAR(4) NOT NULL
	ALTER TABLE com_facdescuentos ALTER COLUMN numdoc NVARCHAR(16) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_facdescuentos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_facdescuentos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_facdescuentos_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdetalle')
BEGIN
	ALTER TABLE com_facdetalle ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE com_facdetalle ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE com_facdetalle ALTER COLUMN numfac NVARCHAR(16) NOT NULL
	ALTER TABLE com_facdetalle ALTER COLUMN tipfac NVARCHAR(4) NOT NULL
	ALTER TABLE com_facdetalle ALTER COLUMN codart NVARCHAR(20) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_facdetalle' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_facdetalle ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_facdetalle_item DEFAULT(0)
	END
END
GO
 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdetremi')
BEGIN
	ALTER TABLE com_facdetremi ALTER COLUMN qtyart decimal(14,4) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_facdetremi' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_facdetremi ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_facdetremi_item DEFAULT(0)
	END
	ALTER TABLE com_facdetremi ADD CONSTRAINT PK_com_facdetremi PRIMARY KEY(idemp,codcto,tipfac,numfac,item)
END
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facturas')
BEGIN
	ALTER TABLE com_facturas ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE com_facturas ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE com_facturas ALTER COLUMN numfac NVARCHAR(16) NOT NULL
	ALTER TABLE com_facturas ALTER COLUMN tipfac NVARCHAR(4) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_gasdetalle')
BEGIN
	ALTER TABLE com_gasdetalle ALTER COLUMN codcen nvarchar(4) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN tipdoc nvarchar(2) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN numdoc nvarchar(8) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN codcto nvarchar(3) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN codconcep nvarchar(2) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN descrip nvarchar(100) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN codcue nvarchar(8) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN valcon decimal(14,2) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN ivacon decimal(14,2) NOT NULL
	ALTER TABLE com_gasdetalle ALTER COLUMN servidor nvarchar(60) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_gastos')
BEGIN
	ALTER TABLE com_gastos ALTER COLUMN codcen nvarchar(3) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN tipdoc nvarchar(2) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN numdoc nvarchar(8) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN nitpro nvarchar(15) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN fecdoc datetime NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN fecven datetime NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN codcue nvarchar(8) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN vtafac decimal(14,2) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN ivafac decimal(14,2) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN totimp decimal(14,2) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN netfac decimal(14,2) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN estgas nvarchar(1) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN detalle nvarchar(250) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN docfac nvarchar(10) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN codemp nvarchar(10) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN fecsys datetime NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN fecsysest datetime NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN fecsyscau datetime NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN codusu nvarchar(10) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN codusuest nvarchar(10) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN codusucau nvarchar(10) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN tipfac nvarchar(2) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN numfac nvarchar(8) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN servidor nvarchar(60) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN codusumod nvarchar(15) NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN docdelete bit NOT NULL
	ALTER TABLE com_gastos ALTER COLUMN modificadoc numeric(10,0) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_movpro')
BEGIN
	ALTER TABLE com_movpro ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE com_movpro ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE com_movpro ALTER COLUMN doccom NVARCHAR(16) NOT NULL
	ALTER TABLE com_movpro ALTER COLUMN tipdoc NVARCHAR(4) NOT NULL	
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_movpro' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_movpro ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_movpro_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_notas')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_notastemp')
BEGIN
	ALTER TABLE com_notastemp ALTER COLUMN codcen NVARCHAR(6) NOT NULL
	ALTER TABLE com_notastemp ALTER COLUMN numnot NVARCHAR(16) NOT NULL
	ALTER TABLE com_notastemp ALTER COLUMN tipnot NVARCHAR(4) NOT NULL	
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_notastemp' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_notastemp ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_notastemp_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_orddetalle')
BEGIN
	PRINT ''
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_orddetalle')
BEGIN
	ALTER TABLE com_orddetalle ADD CONSTRAINT PK_com_orddetalle PRIMARY KEY(idemp,codcto,tipfac,numfac,item)
END
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_ordenes')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_pordes')
BEGIN
	ALTER TABLE com_pordes ALTER COLUMN vrdesc decimal(18,4) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_pordes' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_pordes ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_pordes_item DEFAULT(0)
	END
	ALTER TABLE com_pordes ADD CONSTRAINT PK_com_pordes PRIMARY KEY(idemp,codcto,tipfac,numfac,item)
END
GO 

	


IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_requi')
BEGIN
	ALTER TABLE com_requi ALTER COLUMN codcen nvarchar(3) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN numreq nvarchar(8) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN fecfac datetime NOT NULL
	ALTER TABLE com_requi ALTER COLUMN nitsol nvarchar(15) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN estfac nvarchar(1) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN observa nvarchar(MAX) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN fecsys datetime NOT NULL
	ALTER TABLE com_requi ALTER COLUMN codusu nvarchar(8) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN nitcli nvarchar(15) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN orden nvarchar(10) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN cotiza nvarchar(10) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN medio nvarchar(3) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN plano nvarchar(10) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN total decimal(12,0) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN servidor nvarchar(60) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN codusumod nvarchar(15) NOT NULL
	ALTER TABLE com_requi ALTER COLUMN docdelete bit NOT NULL
	ALTER TABLE com_requi ALTER COLUMN modificadoc numeric(10,0) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_tipestados')
BEGIN
	ALTER TABLE com_tipestados ALTER COLUMN codigo NVARCHAR(6) NOT NULL	
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_tipestados' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_tipestados ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_tipestados_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_tipos')
BEGIN
	ALTER TABLE com_tipos ALTER COLUMN codigo NVARCHAR(6) NOT NULL	
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'com_tipos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE com_tipos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_com_tipos_item DEFAULT(0)
	END
END
-- CONTABILIDAD.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_cencostos')
BEGIN
	ALTER TABLE con_cencostos ALTER COLUMN idemp NVARCHAR(6) NOT NULL	
	ALTER TABLE con_cencostos ALTER COLUMN codalm NVARCHAR(6) NOT NULL	
	ALTER TABLE con_cencostos ALTER COLUMN codcen NVARCHAR(6) NOT NULL	
	ALTER TABLE con_cencostos ALTER COLUMN codcto NVARCHAR(6) NOT NULL	
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'con_cencostos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE con_cencostos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_con_cencostos_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_comprobante')
BEGIN
	ALTER TABLE con_comprobante ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE con_comprobante ALTER COLUMN codalm NVARCHAR(6) NOT NULL
	ALTER TABLE con_comprobante ALTER COLUMN codcen NVARCHAR(6) NOT NULL
	ALTER TABLE con_comprobante ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE con_comprobante ALTER COLUMN codtran NVARCHAR(4) NOT NULL
	ALTER TABLE con_comprobante ALTER COLUMN consec NVARCHAR(32) NOT NULL
	ALTER TABLE con_comprobante ALTER COLUMN itemdoc NUMERIC(10) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'con_comprobante' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE con_comprobante ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_con_comprobante_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_foldetalle')
BEGIN
	ALTER TABLE con_foldetalle ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'con_foldetalle' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE con_foldetalle ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_con_foldetalle_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_folios')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_mescierre')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_parametros')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_puc')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_resolclientes')
BEGIN
	ALTER TABLE con_resolclientes ALTER COLUMN consec decimal (5,0) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN nitcli nvarchar (15) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN nroresol nvarchar (15) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN rangoini nvarchar (15) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN rangofin nvarchar (15) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN fecha datetime  NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN tipfac nvarchar (2) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN codcen nvarchar (3) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN numfac nvarchar (8) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN servidor nvarchar (60) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN fecsys datetime NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN codusumod nvarchar (15) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN codusu nvarchar (15) NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN docdelete bit NOT NULL
	ALTER TABLE con_resolclientes ALTER COLUMN modificadoc numeric (10,0) NOT NULL
END
-- GLOBAL.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_accesos')
BEGIN
	ALTER TABLE glb_accesos ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE glb_accesos ALTER COLUMN codper NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_accesos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE glb_accesos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_glb_accesos_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_almacen')
BEGIN
	ALTER TABLE glb_almacen ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE glb_almacen ALTER COLUMN codalm NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_almacen' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE glb_almacen ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_glb_almacen_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_bancos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_barrio')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_caja')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_cargos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_cenconsumo')
BEGIN
	ALTER TABLE glb_cenconsumo ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE glb_cenconsumo ALTER COLUMN codalm NVARCHAR(6) NOT NULL
	ALTER TABLE glb_cenconsumo ALTER COLUMN codcen NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_cenconsumo' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE glb_cenconsumo ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_glb_cenconsumo_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_ciudad')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_conceptoscli')
BEGIN
	ALTER TABLE glb_conceptoscli ALTER COLUMN codigo NVARCHAR(4) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_conceptoscli' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE glb_conceptoscli ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_glb_conceptoscli_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_contac')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_descuentos')
BEGIN
	ALTER TABLE glb_descuentos ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE glb_descuentos ALTER COLUMN coddes NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_descuentos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE glb_descuentos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_glb_descuentos_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_dpto')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_empresa')
BEGIN
	ALTER TABLE glb_empresa ALTER COLUMN id NVARCHAR(6) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_estados')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_global')
BEGIN
	ALTER TABLE glb_global ALTER COLUMN nombre NVARCHAR(60) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_global' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE glb_global ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_glb_global_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_hobby')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_idx')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_labores')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_mensaje')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_mensual')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_menu')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_modulos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_niveles')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_Glb_parametros')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_perfilcto')
BEGIN
	ALTER TABLE glb_perfilcto ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_perfilcto' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE glb_perfilcto ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_glb_perfilcto_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_perfiles')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_profesion')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_terceros')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_tipid')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_transaccion')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_unica')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_usuarios')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_zonas')
BEGIN
	PRINT ''
END
-- PRODUCCION.
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_costos')
BEGIN
	
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'pro_costos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE pro_costos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_pro_costos_item DEFAULT(0)
	END
	ALTER TABLE pro_costos ADD CONSTRAINT PK_pro_costos PRIMARY KEY(idemp,codcto,numord,item)
END
GO 


IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_formulas')
BEGIN
	ALTER TABLE pro_formulas ALTER COLUMN codfor NVARCHAR(20) NOT NULL
	ALTER TABLE pro_formulas ALTER COLUMN codins NVARCHAR(20) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'pro_formulas' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE pro_formulas ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_pro_formulas_item DEFAULT(0)
	END
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'pro_formulas' AND COLUMN_NAME = 'item2')
	BEGIN
		ALTER TABLE pro_formulas ADD item2 NUMERIC(10) NOT NULL CONSTRAINT DF_pro_formulas_item2 DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_movcontrato')
BEGIN
	ALTER TABLE pro_movcontrato ADD CONSTRAINT PK_pro_movcontrato PRIMARY KEY(idemp,codcto,numfac,numprod,codprod)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_orddetalle')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_ordenes')
BEGIN
	ALTER TABLE pro_ordenes ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE pro_ordenes ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE pro_ordenes ALTER COLUMN numord NVARCHAR(16) NOT NULL
	ALTER TABLE pro_ordenes ALTER COLUMN codprod NVARCHAR(20) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'pro_ordenes' AND COLUMN_NAME = 'itemfac')
	BEGIN
		ALTER TABLE pro_ordenes ADD itemfac NUMERIC(10) NOT NULL CONSTRAINT DF_pro_ordenes_itemfac DEFAULT(0)
	END
	ALTER TABLE pro_ordenes ADD CONSTRAINT PK_pro_ordenes PRIMARY KEY(idemp,codcto,numord,codprod,itemfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_parametros')
BEGIN
	ALTER TABLE pro_parametros ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'pro_parametros' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE pro_parametros ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_pro_parametros_item DEFAULT(0)
	END
END
-- TESORERIA.
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_tes_conciliacion')
BEGIN
	ALTER TABLE tes_conciliacion ALTER COLUMN saldoant decimal(18,4) NOT NULL
	ALTER TABLE tes_conciliacion ADD CONSTRAINT PK_tes_conciliacion PRIMARY KEY(idemp,codcto,tipdoc,numcon)
END
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_tes_detconciliacion')
BEGIN
	ALTER TABLE tes_detconciliacion ALTER COLUMN valor decimal(18,4) NOT NULL
	BEGIN
		ALTER TABLE tes_detconciliacion ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_tes_detconciliacion_item DEFAULT(0)
	END
	ALTER TABLE tes_detconciliacion ADD CONSTRAINT PK_tes_detconciliacion PRIMARY KEY(idemp,codcto,tipdoc,numcon,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_tes_egresos')
BEGIN
	ALTER TABLE TES_EGRESOS ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE TES_EGRESOS ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE TES_EGRESOS ALTER COLUMN tipfac NVARCHAR(4) NOT NULL
	ALTER TABLE TES_EGRESOS ALTER COLUMN consec NVARCHAR(32) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TES_EGRESOS' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE TES_EGRESOS ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_tes_egresos_item DEFAULT(0)
	END
END
-- VENTAS.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_conceptos')
BEGIN
	ALTER TABLE ven_conceptos ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_conceptos ALTER COLUMN codcon NVARCHAR(6) NOT NULL
	ALTER TABLE ven_conceptos ALTER COLUMN nomcon NVARCHAR(80) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_conceptos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_conceptos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_conceptos_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_cotidetalle')
BEGIN
	ALTER TABLE ven_cotidetalle ADD CONSTRAINT PK_ven_cotidetalle PRIMARY KEY(idemp,codcto,tipfac,numfac,codart,itemfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_cotizacion')
BEGIN
	ALTER TABLE ven_cotizacion ADD CONSTRAINT PK_ven_cotizacion PRIMARY KEY(idemp,codcto,tipfac,numfac)
END
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_detconcep')
BEGIN
	ALTER TABLE ven_detconcep ALTER COLUMN idemp nvarchar(3) NOT NULL
	ALTER TABLE ven_detconcep ALTER COLUMN codcon nvarchar(4) NOT NULL
	ALTER TABLE ven_detconcep ALTER COLUMN valcon decimal(18,4) NOT NULL
	
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_detconcep' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_detconcep ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_detconcep_item DEFAULT(0)
	END
	
END
GO


 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdepre')
BEGIN
	ALTER TABLE ven_facdepre ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_facdepre ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_facdepre ALTER COLUMN tipfac NVARCHAR(4) NOT NULL
	ALTER TABLE ven_facdepre ALTER COLUMN numfac NVARCHAR(16) NOT NULL
	ALTER TABLE ven_facdepre ALTER COLUMN numpre NVARCHAR(16) NOT NULL
	ALTER TABLE ven_facdepre ALTER COLUMN codart NVARCHAR(20) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_facdepre' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_facdepre ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_facdepre_item DEFAULT(0)
	END
END
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdescuentos')
BEGIN	
	ALTER TABLE ven_facdescuentos ADD CONSTRAINT PK_ven_facdescuentos PRIMARY KEY(idemp,coddes,codcto,tippag,numdoc)
END
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdetalle')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdetremi')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facturas')
BEGIN
	ALTER TABLE ven_facturas ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_facturas ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_facturas ALTER COLUMN tipfac NVARCHAR(4) NOT NULL
	ALTER TABLE ven_facturas ALTER COLUMN numfac NVARCHAR(16) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facuopagos')
BEGIN
	ALTER TABLE ven_facuopagos ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_facuopagos ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_facuopagos ALTER COLUMN tipfac NVARCHAR(4) NOT NULL
	ALTER TABLE ven_facuopagos ALTER COLUMN numfac NVARCHAR(16) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_facuopagos' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_facuopagos ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_facuopagos_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facuota')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_formapago')
BEGIN
	ALTER TABLE ven_formapago ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_formapago ALTER COLUMN codfor NVARCHAR(4) NOT NULL
	ALTER TABLE ven_formapago ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_formapago' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_formapago ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_formapago_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_mesas')
BEGIN
	ALTER TABLE ven_mesas ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_mesas ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_mesas' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_mesas ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_mesas_item DEFAULT(0)
	END
	ELSE
	BEGIN
		ALTER TABLE ven_mesas ALTER COLUMN item NUMERIC(10) NOT NULL
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_movcli')
BEGIN
	ALTER TABLE ven_movcli ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_movcli ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_movcli ALTER COLUMN nitcli NVARCHAR(30) NOT NULL
	ALTER TABLE ven_movcli ALTER COLUMN docven NVARCHAR(16) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_movcli' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_movcli ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_movcli_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_notas')
BEGIN
	ALTER TABLE ven_notas ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_notas ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_notas ALTER COLUMN tipnot NVARCHAR(4) NOT NULL
	ALTER TABLE ven_notas ALTER COLUMN numnot NVARCHAR(16) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_notas' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_notas ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_notas_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagdescuentos')
BEGIN
	ALTER TABLE ven_pagdescuentos ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_pagdescuentos ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_pagdescuentos ALTER COLUMN tippag NVARCHAR(4) NOT NULL
	ALTER TABLE ven_pagdescuentos ALTER COLUMN numdoc NVARCHAR(16) NOT NULL
	ALTER TABLE ven_pagdescuentos ALTER COLUMN coddes NVARCHAR(6) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagdetalle')
BEGIN
	ALTER TABLE ven_pagdetalle ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_pagdetalle ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_pagdetalle ALTER COLUMN tippag NVARCHAR(4) NOT NULL
	ALTER TABLE ven_pagdetalle ALTER COLUMN numdoc NVARCHAR(16) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_pagdetalle' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_pagdetalle ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_pagdetalle_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagos')
BEGIN
	ALTER TABLE ven_pagos ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_pagos ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_pagos ALTER COLUMN tippag NVARCHAR(4) NOT NULL
	ALTER TABLE ven_pagos ALTER COLUMN numdoc NVARCHAR(16) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_parametros')
BEGIN
	ALTER TABLE ven_parametros ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_parametros ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_parametros' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_parametros ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_parametros_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_parametros2')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pdetalle')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pedicoti')
BEGIN
	ALTER TABLE ven_pedicoti ALTER COLUMN tipfac nvarchar(2) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN numfac nvarchar(8) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN codcen nvarchar(3) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN numcon nvarchar(8) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN codcon nvarchar(2) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN codart nvarchar(10) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN qtyart decimal(10,2) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN estado nvarchar(1) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN servidor nvarchar(60) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN fecsys datetime NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN codusumod nvarchar(15) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN codusu nvarchar(15) NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN docdelete bit NOT NULL
	ALTER TABLE ven_pedicoti ALTER COLUMN modificadoc numeric(10,0) NOT NULL
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pedidos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_prefacdetalle')
BEGIN
	ALTER TABLE ven_prefacdetalle ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_prefacdetalle ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_prefacdetalle ALTER COLUMN numpre NVARCHAR(16) NOT NULL
	ALTER TABLE ven_prefacdetalle ALTER COLUMN codart NVARCHAR(20) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_prefacdetalle' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_prefacdetalle ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_prefacdetalle_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_prefactura')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_segcartera')
BEGIN
	ALTER TABLE ven_segcartera ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_segcartera' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_segcartera ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_segcartera_item DEFAULT(0)
	END
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_variantes')
BEGIN
	ALTER TABLE ven_variantes ALTER COLUMN idemp NVARCHAR(6) NOT NULL
	ALTER TABLE ven_variantes ALTER COLUMN codcto NVARCHAR(6) NOT NULL
	ALTER TABLE ven_variantes ALTER COLUMN numpre NVARCHAR(16) NOT NULL
	ALTER TABLE ven_variantes ALTER COLUMN numcom NVARCHAR(16) NOT NULL
	ALTER TABLE ven_variantes ALTER COLUMN codart NVARCHAR(20) NOT NULL
	ALTER TABLE ven_variantes ALTER COLUMN codins NVARCHAR(20) NOT NULL
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_variantes' AND COLUMN_NAME = 'item')
	BEGIN
		ALTER TABLE ven_variantes ADD item NUMERIC(10) NOT NULL CONSTRAINT DF_ven_variantes_item DEFAULT(0)
	END
END
GO
/*
	Renumerar columnas item.
*/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_kardex')
BEGIN
	EXEC('ALTER TABLE alm_kardex ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,codcon,numcon,codart,id_row,ROW_NUMBER() OVER (PARTITION BY idemp, codcto, numcon, codcon,codart ORDER BY idemp,	codcto, numcon, codcon,codart) AS Item
		FROM alm_kardex)
		UPDATE tabla SET itemfac = item
		FROM alm_kardex tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE alm_kardex DROP COLUMN id_row')
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdetalle')
BEGIN
	EXEC('ALTER TABLE ven_facdetalle ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp, codcto,tipfac,numfac,codart,id_row, ROW_NUMBER() OVER (PARTITION BY idemp, codcto,tipfac,numfac,codart ORDER BY idemp,	codcto,tipfac,numfac,codart) AS Item1
		FROM ven_facdetalle)
		UPDATE tabla SET item = item1
		FROM ven_facdetalle tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_facdetalle DROP COLUMN id_row')
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_notas')
BEGIN
	EXEC('ALTER TABLE ven_notas ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,tipnot,numnot,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tipnot,numnot ORDER BY idemp,codcto,tipnot,numnot) AS Item1
		FROM ven_notas)
		UPDATE tabla SET item = item1
		FROM ven_notas tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_notas DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_prefacdetalle')
BEGIN
	EXEC('ALTER TABLE ven_prefacdetalle ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp, codcto,numpre,codart,id_row, ROW_NUMBER() OVER (PARTITION BY idemp, codcto,numpre,codart ORDER BY idemp,	codcto,numpre,codart) AS Item1
		FROM ven_prefacdetalle)
		UPDATE tabla SET item = item1
		FROM ven_prefacdetalle tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_prefacdetalle DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_comprobante')
BEGIN
	EXEC('ALTER TABLE con_comprobante ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codalm,codcen,codcto,codtran,consec,itemdoc,id_row, ROW_NUMBER() OVER (PARTITION BY						idemp,codalm,codcen,codcto,codtran,consec,itemdoc ORDER BY idemp,codalm,codcen,codcto,codtran,consec,itemdoc) AS Item1
		FROM con_comprobante)
		UPDATE tabla SET item = item1
		FROM con_comprobante tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE con_comprobante DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagdetalle')
BEGIN
	EXEC('ALTER TABLE ven_pagdetalle ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp, codcto,tippag,numdoc,id_row, ROW_NUMBER() OVER (PARTITION BY idemp, codcto,tippag,numdoc ORDER BY idemp,	codcto,tippag,numdoc) AS Item1
		FROM ven_pagdetalle)
		UPDATE tabla SET item = item1
		FROM ven_pagdetalle tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_pagdetalle DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_movcli')
BEGIN
	EXEC('ALTER TABLE ven_movcli ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,nitcli,docven,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,nitcli,docven ORDER BY			idemp,codcto,nitcli,docven) AS Item1
		FROM ven_movcli)
		UPDATE tabla SET item = item1
		FROM ven_movcli tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_movcli DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdescuentos')
BEGIN
	EXEC('ALTER TABLE com_facdescuentos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,tippag,numdoc,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tippag,numdoc ORDER BY			idemp,codcto,tippag,numdoc) AS Item1
		FROM com_facdescuentos)
		UPDATE tabla SET item = item1
		FROM com_facdescuentos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_facdescuentos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_movpro')
BEGIN
	EXEC('ALTER TABLE com_movpro ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,doccom,tipdoc,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,doccom,tipdoc ORDER BY			idemp,codcto,doccom,tipdoc) AS Item1
		FROM com_movpro)
		UPDATE tabla SET item = item1
		FROM com_movpro tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_movpro DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_notas')
BEGIN
	EXEC('ALTER TABLE com_notas ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,tipnot,numnot,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tipnot,numnot ORDER BY			idemp,codcto,tipnot,numnot) AS Item1
		FROM com_notas)
		UPDATE tabla SET item = item1
		FROM com_notas tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_notas DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_notastemp')
BEGIN
	EXEC('ALTER TABLE com_notastemp ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT codcen,tipnot,numnot,id_row, ROW_NUMBER() OVER (PARTITION BY codcen,tipnot,numnot ORDER BY codcen,tipnot,numnot)	 AS Item1
		FROM com_notastemp)
		UPDATE tabla SET item = item1
		FROM com_notastemp tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_notastemp DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_caja')
BEGIN
	EXEC('ALTER TABLE glb_caja ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
			SELECT idemp,codcto,codter,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,codter ORDER BY							idemp,codcto,codter) AS	 Item1
			FROM glb_caja)
			UPDATE tabla SET item = item1
			FROM glb_caja tabla
			JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_caja DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_orddetalle')
BEGIN
	EXEC('ALTER TABLE pro_orddetalle ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,numord,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,numord ORDER BY idemp,codcto,numord) AS	 Item1
		FROM pro_orddetalle)
		UPDATE tabla SET item = item1
		FROM pro_orddetalle tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE pro_orddetalle DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdepre')
BEGIN
	EXEC('ALTER TABLE ven_facdepre ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,tipfac,numfac,numpre,codart,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tipfac,numfac,numpre,codart		ORDER BY idemp,codcto,tipfac,numfac,numpre,codart) AS Item1
		FROM ven_facdepre)
		UPDATE tabla SET item = item1
		FROM ven_facdepre tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_facdepre DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdetalle')
BEGIN
	EXEC('ALTER TABLE com_facdetalle ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,numfac,tipfac,codart,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,numfac,tipfac,codart ORDER BY			idemp,codcto,numfac,tipfac,codart) AS Item1
		FROM com_facdetalle)
		UPDATE tabla SET item = item1
		FROM com_facdetalle tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_facdetalle DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facuopagos')
BEGIN
	EXEC('ALTER TABLE ven_facuopagos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,tipfac,numfac,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tipfac,numfac ORDER BY			idemp,codcto,tipfac,numfac) AS Item1
		FROM ven_facuopagos)
		UPDATE tabla SET item = item1
		FROM ven_facuopagos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_facuopagos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_TES_EGRESOS')
BEGIN
	EXEC('ALTER TABLE TES_EGRESOS ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,tipfac,consec,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tipfac,consec ORDER BY			idemp,codcto,tipfac,consec) AS Item1
		FROM TES_EGRESOS)
		UPDATE tabla SET item = item1
		FROM TES_EGRESOS tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE TES_EGRESOS DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tips')
BEGIN
	EXEC('ALTER TABLE alm_tips ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp, codtips,id_row, ROW_NUMBER() OVER (PARTITION BY idemp, codtips ORDER BY idemp, codtips) AS Item1
		FROM alm_tips)
		UPDATE tabla SET item = item1
		FROM alm_tips tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE alm_tips DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_variantes')
BEGIN
	EXEC('ALTER TABLE alm_variantes ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT codart,citem,id_row, ROW_NUMBER() OVER (PARTITION BY codart,citem ORDER BY codart,citem) AS Item1
		FROM alm_variantes)
		UPDATE tabla SET item = item1
		FROM alm_variantes tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE alm_variantes DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_conceptos')
BEGIN
	EXEC('ALTER TABLE com_conceptos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcon,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcon ORDER BY idemp,codcon) AS Item1
		FROM com_conceptos)
		UPDATE tabla SET item = item1
		FROM com_conceptos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_conceptos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_estados')
BEGIN
	EXEC('ALTER TABLE com_estados ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT numreq,codcen,codart,id_row, ROW_NUMBER() OVER (PARTITION BY numreq,codcen,codart ORDER BY numreq,codcen,codart)	AS Item1
		FROM com_estados)
		UPDATE tabla SET item = item1
		FROM com_estados tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_estados DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_tipestados')
BEGIN
	EXEC('ALTER TABLE com_tipestados ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT codigo,id_row, ROW_NUMBER() OVER (PARTITION BY codigo ORDER BY codigo) AS Item1
		FROM com_tipestados)
		UPDATE tabla SET item = item1
		FROM com_tipestados tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_tipestados DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_tipos')
BEGIN
	EXEC('ALTER TABLE com_tipos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT codigo,id_row, ROW_NUMBER() OVER (PARTITION BY codigo ORDER BY codigo) AS Item1
		FROM com_tipos)
		UPDATE tabla SET item = item1
		FROM com_tipos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE com_tipos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_cencostos')
BEGIN
	EXEC('ALTER TABLE con_cencostos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codalm,codcen,codcto,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codalm,codcen,codcto ORDER BY idemp,codalm,codcen,codcto) AS	Item1
		FROM con_cencostos)
		UPDATE tabla SET item = item1
		FROM con_cencostos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE con_cencostos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_accesos')
BEGIN
	EXEC('ALTER TABLE glb_accesos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codper,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codper ORDER BY idemp,codper) AS Item1
		FROM glb_accesos)
		UPDATE tabla SET item = item1
		FROM glb_accesos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_accesos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_almacen')
BEGIN
	EXEC('ALTER TABLE glb_almacen ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codalm,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codalm ORDER BY idemp,codalm) AS Item1
		FROM glb_almacen)
		UPDATE tabla SET item = item1
		FROM glb_almacen tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_almacen DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_cenconsumo')
BEGIN
	EXEC('ALTER TABLE glb_cenconsumo ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codalm,codcen,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codalm,codcen ORDER BY idemp,codalm,codcen) AS Item1
		FROM glb_cenconsumo)
		UPDATE tabla SET item = item1
		FROM glb_cenconsumo tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_cenconsumo DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_conceptoscli')
BEGIN
	EXEC('ALTER TABLE glb_conceptoscli ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT codigo,id_row, ROW_NUMBER() OVER (PARTITION BY codigo ORDER BY codigo) AS Item1
		FROM glb_conceptoscli)
		UPDATE tabla SET item = item1
		FROM glb_conceptoscli tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_conceptoscli DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_descuentos')
BEGIN
	EXEC('ALTER TABLE glb_descuentos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,coddes,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,coddes ORDER BY idemp,coddes) AS Item1
		FROM glb_descuentos)
		UPDATE tabla SET item = item1
		FROM glb_descuentos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_descuentos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_perfilcto')
BEGIN
	EXEC('ALTER TABLE glb_perfilcto ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT codcto,id_row, ROW_NUMBER() OVER (PARTITION BY codcto ORDER BY codcto) AS Item1
		FROM glb_perfilcto)
		UPDATE tabla SET item = item1
		FROM glb_perfilcto tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_perfilcto DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_global')
BEGIN
	EXEC('ALTER TABLE glb_global ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT nombre,id_row, ROW_NUMBER() OVER (PARTITION BY nombre ORDER BY nombre) AS Item1
		FROM glb_global)
		UPDATE tabla SET item = item1
		FROM glb_global tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE glb_global DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_formulas')
BEGIN
	EXEC('ALTER TABLE pro_formulas ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT codfor,item,codins,id_row, ROW_NUMBER() OVER (PARTITION BY codfor,item,codins ORDER BY codfor,item,codins) AS Item1
		FROM pro_formulas)
		UPDATE tabla SET item2 = item1
		FROM pro_formulas tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE pro_formulas DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_parametros')
BEGIN
	EXEC('ALTER TABLE pro_parametros ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,id_row, ROW_NUMBER() OVER (PARTITION BY idemp ORDER BY idemp) AS Item1
		FROM pro_parametros)
		UPDATE tabla SET item = item1
		FROM pro_parametros tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE pro_parametros DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_conceptos')
BEGIN
	EXEC('ALTER TABLE ven_conceptos ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcon,nomcon,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcon,nomcon ORDER BY idemp,codcon,nomcon) AS Item1
		FROM ven_conceptos)
		UPDATE tabla SET item = item1
		FROM ven_conceptos tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_conceptos DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_formapago')
BEGIN
	EXEC('ALTER TABLE ven_formapago ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codfor,codcto,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codfor,codcto ORDER BY idemp,codfor,codcto) AS Item1
		FROM ven_formapago)
		UPDATE tabla SET item = item1
		FROM ven_formapago tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_formapago DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_parametros')
BEGIN
	EXEC('ALTER TABLE ven_parametros ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto ORDER BY idemp,codcto) AS Item1
		FROM ven_parametros)
		UPDATE tabla SET item = item1
		FROM ven_parametros tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_parametros DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_foldetalle')
BEGIN
	EXEC('ALTER TABLE con_foldetalle ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,id_row, ROW_NUMBER() OVER (PARTITION BY idemp ORDER BY idemp) AS Item1
		FROM con_foldetalle)
		UPDATE tabla SET item = item1
		FROM con_foldetalle tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE con_foldetalle DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_mesas')
BEGIN
	EXEC('ALTER TABLE ven_mesas ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto ORDER BY idemp,codcto) AS Item1
		FROM ven_mesas)
		UPDATE tabla SET item = item1
		FROM ven_mesas tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_mesas DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_segcartera')
BEGIN
	EXEC('ALTER TABLE ven_segcartera ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,id_row, ROW_NUMBER() OVER (PARTITION BY idemp ORDER BY idemp) AS Item1
		FROM ven_segcartera)
		UPDATE tabla SET item = item1
		FROM ven_segcartera tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_segcartera DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_variantes')
BEGIN
	EXEC('ALTER TABLE ven_variantes ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,numpre,numcom,codcto,codart, codins,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,numpre,numcom,codcto,codart, codins ORDER BY idemp,numpre,numcom,codcto,codart, codins) AS	 Item1
		FROM ven_variantes)
		UPDATE tabla SET item = item1
		FROM ven_variantes tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_variantes DROP COLUMN id_row')
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facuota')
BEGIN
	EXEC('ALTER TABLE ven_facuota ADD id_row NUMERIC(10) IDENTITY(1,1)')
	EXEC(';WITH tblData as (
		SELECT idemp,codcto,tipfac,numfac,id_row, ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tipfac,numfac ORDER BY idemp,codcto,tipfac,numfac) AS	 Item1
		FROM ven_facuota)
		UPDATE tabla SET item = item1
		FROM ven_facuota tabla
		JOIN tblData dat ON (tabla.id_row=dat.id_row)')
	EXEC('ALTER TABLE ven_facuota DROP COLUMN id_row')
END
GO
/*
	Creacion de llaves primarias.
*/
-- ALMACEN.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_alimfisico')
BEGIN
	ALTER TABLE alm_alimfisico ADD CONSTRAINT PK_alm_alimfisico PRIMARY KEY (idemp, codcto, anoinv, mesinv, codart,modificadoc)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_articulos')
BEGIN
	ALTER TABLE alm_articulos ADD CONSTRAINT Pk_alm_articulos PRIMARY KEY (codart)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_codbarras')
BEGIN
	ALTER TABLE alm_codbarras ADD CONSTRAINT PK_alm_codbarras PRIMARY KEY (codbarra,codart)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_conteoinv')
BEGIN
	ALTER TABLE alm_conteoinv ADD CONSTRAINT PK_alm_conteoinv PRIMARY KEY (idemp,codcto,numcont,codart,fecsys,itemart,modificadoc)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_genero')
BEGIN
	ALTER TABLE alm_genero ADD CONSTRAINT PK_alm_genero PRIMARY KEY (codgen)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_grupos')
BEGIN
	ALTER TABLE alm_grupos ADD CONSTRAINT PK_alm_grupos PRIMARY KEY (codgru)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_inventario')
BEGIN
	ALTER TABLE ALM_INVENTARIO ADD CONSTRAINT PK_ALM_INVENTARIO PRIMARY KEY (IDEMP, CODCTO,CODART)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_invfisicos')
BEGIN
	ALTER TABLE ALM_invfisicos ADD CONSTRAINT PK_ALM_invfisicos PRIMARY KEY (idinvfisicos,idemp,codcto)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_kardex')
BEGIN
	ALTER TABLE alm_kardex ADD CONSTRAINT PK_alm_kardex PRIMARY KEY(idemp,codcto,codcon,numcon,codart,itemfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_kardextemp')
BEGIN
	ALTER TABLE alm_kardextemp ADD CONSTRAINT PK_alm_kardextemp PRIMARY KEY(idemp,codcto,codcon,numcon,codart,itemfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_lineas')
BEGIN
	ALTER TABLE alm_lineas ADD CONSTRAINT PK_alm_lineas PRIMARY KEY (codlin)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_marcas')
BEGIN
	ALTER TABLE alm_marcas ADD CONSTRAINT PK_alm_marcas PRIMARY KEY (codmar)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_promo')
BEGIN
	ALTER TABLE ALM_PROMO ADD CONSTRAINT PK_ALM_PROMO PRIMARY KEY (idemp,CODCTO,numero)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_promodet')
BEGIN
	ALTER TABLE alm_promodet ADD CONSTRAINT PK_alm_promodet PRIMARY KEY (idemp,CODCTO,numero,codart)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tallasart')
BEGIN
	ALTER TABLE alm_tallasart ADD CONSTRAINT PK_alm_tallasart PRIMARY KEY (codigo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tipoin')
BEGIN
	ALTER TABLE alm_tipoin ADD CONSTRAINT PK_alm_tipoin PRIMARY KEY (codtipo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tipoplato')
BEGIN
	ALTER TABLE alm_tipoplato ADD CONSTRAINT PK_alm_tipoplato PRIMARY KEY (idemp, codtipo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_tips')
BEGIN
	ALTER TABLE alm_tips ADD CONSTRAINT PK_alm_tips PRIMARY KEY(idemp, codtips, item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_unidades')
BEGIN
	ALTER TABLE alm_unidades ADD CONSTRAINT PK_alm_unidades PRIMARY KEY (undcon)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_variantes')
BEGIN
	ALTER TABLE alm_variantes ADD CONSTRAINT PK_alm_variantes PRIMARY KEY(idemp,codart,citem,item)
END
-- COMPRAS.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_cancela')
BEGIN
	ALTER TABLE com_cancela ADD CONSTRAINT PK_com_cancela PRIMARY KEY (codcon)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_conceptos')
BEGIN
	ALTER TABLE com_conceptos ADD CONSTRAINT PK_com_conceptos PRIMARY KEY(idemp,codcon,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_estados')
BEGIN
	ALTER TABLE com_estados ADD CONSTRAINT PK_com_estados PRIMARY KEY(numreq,codcen,codart,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdescuentos')
BEGIN
	ALTER TABLE com_facdescuentos ADD CONSTRAINT PK_com_facdescuentos PRIMARY KEY(idemp,codcto,tippag,numdoc,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdetalle')
BEGIN
	ALTER TABLE com_facdetalle ADD CONSTRAINT PK_com_facdetalle PRIMARY KEY(idemp,codcto,numfac,tipfac,codart,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facdetremi')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_facturas')
BEGIN
	ALTER TABLE com_facturas ADD CONSTRAINT PK_com_facturas PRIMARY KEY (idemp,codcto,numfac,tipfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_gasdetalle')
BEGIN
	ALTER TABLE com_gasdetalle ADD CONSTRAINT PK_com_gasdetalle PRIMARY KEY(codcen,tipdoc,numdoc,codcto)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_gastos')
BEGIN
	ALTER TABLE com_gastos ADD CONSTRAINT PK_com_gastos PRIMARY KEY(codcen,tipdoc,numdoc,nitpro)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_movpro')
BEGIN
	ALTER TABLE com_movpro ADD CONSTRAINT PK_com_movpro PRIMARY KEY(idemp,codcto,doccom,tipdoc,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_notas')
BEGIN
	ALTER TABLE com_notas ADD CONSTRAINT PK_com_notas PRIMARY KEY(idemp,codcto,tipnot,numnot,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_notastemp')
BEGIN
	ALTER TABLE com_notastemp ADD CONSTRAINT PK_com_notastemp PRIMARY KEY(codcen,tipnot,numnot,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_orddetalle')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_ordenes')
BEGIN
	ALTER TABLE com_ordenes ADD CONSTRAINT PK_com_ordenes PRIMARY KEY (idemp, codcto, tipfac, numfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_parametros')
BEGIN
	ALTER TABLE com_parametros ADD CONSTRAINT PK_com_parametros PRIMARY KEY (idemp)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_pordes')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_requi')
BEGIN
	ALTER TABLE com_requi ADD CONSTRAINT PK_com_requi PRIMARY KEY(codcen,numreq,nitsol)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_tipestados')
BEGIN
	ALTER TABLE com_tipestados ADD CONSTRAINT PK_com_tipestados PRIMARY KEY(codigo,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_com_tipos')
BEGIN
	ALTER TABLE com_tipos ADD CONSTRAINT PK_com_tipos PRIMARY KEY(codigo,item)
END
-- CONTABILIDAD.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_cencostos')
BEGIN
	ALTER TABLE con_cencostos ADD CONSTRAINT PK_con_cencostos PRIMARY KEY(idemp,codalm,codcen,codcto,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_comprobante')
BEGIN
	ALTER TABLE con_comprobante ADD CONSTRAINT PK_con_comprobante PRIMARY KEY(idemp,codalm,codcen,codcto,codtran,consec,itemdoc,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_foldetalle')
BEGIN
	ALTER TABLE con_foldetalle ADD CONSTRAINT PK_con_foldetalle PRIMARY KEY(idemp,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_folios')
BEGIN
	ALTER TABLE con_folios ADD CONSTRAINT PK_con_folios PRIMARY KEY (idemp, codlib)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_mescierre')
BEGIN
	ALTER TABLE con_mescierre ADD CONSTRAINT PK_con_mescierre PRIMARY KEY (idemp, mes, año)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_parametros')
BEGIN
	ALTER TABLE con_parametros ADD CONSTRAINT PK_con_parametros PRIMARY KEY (idemp)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_puc')
BEGIN
	ALTER TABLE con_puc ADD CONSTRAINT PK_con_puc PRIMARY KEY (codcue)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_con_resolclientes')
BEGIN
	ALTER TABLE con_resolclientes ADD CONSTRAINT PK_con_resolclientes PRIMARY KEY(consec,nitcli,nroresol)
END
-- GLOBAL.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_accesos')
BEGIN
	ALTER TABLE glb_accesos ADD CONSTRAINT PK_glb_accesos PRIMARY KEY(idemp,codper,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_almacen')
BEGIN
	ALTER TABLE glb_almacen ADD CONSTRAINT PK_glb_almacen PRIMARY KEY(idemp,codalm,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_bancos')
BEGIN
	ALTER TABLE glb_bancos ADD CONSTRAINT PK_glb_bancos PRIMARY KEY (codbco)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_barrio')
BEGIN
	ALTER TABLE glb_barrio ADD CONSTRAINT PK_glb_barrio PRIMARY KEY (codbarr)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_caja')
BEGIN
	ALTER TABLE glb_caja ADD CONSTRAINT PK_glb_caja PRIMARY KEY(idemp,codcto,codter,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_cargos')
BEGIN
	ALTER TABLE glb_cargos ADD CONSTRAINT PK_glb_cargos PRIMARY KEY (codi_cargo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_cenconsumo')
BEGIN
	ALTER TABLE glb_cenconsumo ADD CONSTRAINT PK_glb_cenconsumo PRIMARY KEY(idemp,codalm,codcen,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_ciudad')
BEGIN
	ALTER TABLE glb_ciudad ADD CONSTRAINT PK_glb_ciudad PRIMARY KEY (codciu, coddpto)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_conceptoscli')
BEGIN
	ALTER TABLE glb_conceptoscli ADD CONSTRAINT PK_glb_conceptoscli PRIMARY KEY(codigo,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_contac')
BEGIN
	ALTER TABLE glb_contac ADD CONSTRAINT PK_glb_contac PRIMARY KEY (codigo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_descuentos')
BEGIN
	ALTER TABLE glb_descuentos ADD CONSTRAINT PK_glb_descuentos PRIMARY KEY(idemp,coddes,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_dpto')
BEGIN
	ALTER TABLE glb_dpto ADD CONSTRAINT PK_glb_dpto PRIMARY KEY (coddpto)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_empresa')
BEGIN
	ALTER TABLE glb_empresa ADD CONSTRAINT PK_glb_empresa PRIMARY KEY (id)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_estados')
BEGIN
	ALTER TABLE glb_estados ADD CONSTRAINT PK_glb_estados PRIMARY KEY (codest)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_global')
BEGIN
	ALTER TABLE glb_global ADD CONSTRAINT PK_glb_global PRIMARY KEY(nombre,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_hobby')
BEGIN
	ALTER TABLE glb_hobby ADD CONSTRAINT PK_glb_hobby PRIMARY KEY (codigo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_idx')
BEGIN
	ALTER TABLE glb_idx ADD CONSTRAINT PK_glb_idx PRIMARY KEY (id)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_labores')
BEGIN
	ALTER TABLE glb_labores ADD CONSTRAINT PK_glb_labores PRIMARY KEY (codigo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_mensaje')
BEGIN
	ALTER TABLE glb_mensaje ADD CONSTRAINT PK_glb_mensaje PRIMARY KEY (id)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_mensual')
BEGIN
	ALTER TABLE glb_mensual ADD CONSTRAINT PK_glb_mensual PRIMARY KEY (idemp, codcto, codtran, añotran)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_menu')
BEGIN
	ALTER TABLE glb_menu ADD CONSTRAINT PK_glb_menu PRIMARY KEY (codigo, modulo, nomfor)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_modulos')
BEGIN
	ALTER TABLE glb_modulos ADD CONSTRAINT PK_glb_modulos PRIMARY KEY (codmod)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_niveles')
BEGIN
	ALTER TABLE glb_niveles ADD CONSTRAINT PK_glb_niveles PRIMARY KEY (codigo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_Glb_parametros')
BEGIN
	ALTER TABLE Glb_parametros ADD CONSTRAINT PK_Glb_parametros PRIMARY KEY (idemp)
END
GO
ALTER TABLE alm_detinvfisicos alter column codart nvarchar(10) not null
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_detinvfisicos')
BEGIN
	
	ALTER TABLE alm_detinvfisicos ADD CONSTRAINT PK_alm_detinvfisicos PRIMARY KEY (idemp,codcto,idinvfisicos,codart,modificadoc)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_perfilcto')
BEGIN
	ALTER TABLE glb_perfilcto ADD CONSTRAINT PK_glb_perfilcto PRIMARY KEY(codcto,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_perfiles')
BEGIN
	ALTER TABLE glb_perfiles ADD CONSTRAINT PK_glb_perfiles PRIMARY KEY (codper)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_profesion')
BEGIN
	ALTER TABLE glb_profesion ADD CONSTRAINT PK_glb_profesion PRIMARY KEY (codi_prof)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_terceros')
BEGIN
	ALTER TABLE glb_terceros ADD CONSTRAINT PK_glb_terceros PRIMARY KEY (nitter)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_tipid')
BEGIN
	ALTER TABLE glb_tipid ADD CONSTRAINT PK_glb_tipid PRIMARY KEY (codigo)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_transaccion')
BEGIN
	ALTER TABLE glb_transaccion ADD CONSTRAINT PK_glb_transaccion PRIMARY KEY (codtran)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_unica')
BEGIN
	ALTER TABLE glb_unica ADD CONSTRAINT PK_glb_unica PRIMARY KEY (codcto,codtran)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_usuarios')
BEGIN
	ALTER TABLE glb_usuarios ADD CONSTRAINT PK_glb_usuarios PRIMARY KEY (codusu)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_zonas')
BEGIN
	ALTER TABLE glb_zonas ADD CONSTRAINT PK_glb_zonas PRIMARY KEY (codigo)
END
-- PRODUCCION.
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_costos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_formulas')
BEGIN
	ALTER TABLE pro_formulas ADD CONSTRAINT PK_pro_formulas PRIMARY KEY(codfor,item,codins,item2)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_movcontrato')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_orddetalle')
BEGIN
	ALTER TABLE pro_orddetalle ADD CONSTRAINT PK_pro_orddetalle PRIMARY KEY(idemp,codcto,numord,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_ordenes')
BEGIN
	ALTER TABLE pro_ordenes ADD CONSTRAINT PK_pro_ordenes PRIMARY KEY(idemp,codcto,numord,codprod,itemfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_pro_parametros')
BEGIN
	ALTER TABLE pro_parametros ADD CONSTRAINT PK_pro_parametros PRIMARY KEY(idemp,item)
END
-- TESORERIA.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_tes_conciliacion')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_tes_detconciliacion')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_tes_egresos')
BEGIN
	ALTER TABLE TES_EGRESOS ADD CONSTRAINT PK_TES_EGRESOS PRIMARY KEY(idemp,codcto,tipfac,consec,item)
END
-- VENTAS.
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_conceptos')
BEGIN
	ALTER TABLE ven_conceptos ADD CONSTRAINT PK_ven_conceptos PRIMARY KEY(idemp,codcon,nomcon,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_cotidetalle')
BEGIN
	ALTER TABLE ven_cotidetalle ADD CONSTRAINT PK_ven_cotidetalle PRIMARY KEY (idemp,codcto,tipfac,numfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_cotidetalle')
BEGIN
	ALTER TABLE ven_cotidetalle ADD CONSTRAINT PK_ven_cotidetalle PRIMARY KEY (idemp,codcto,tipfac,numfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_detconcep')
BEGIN
	ALTER TABLE ven_detconcep ADD CONSTRAINT PK_ven_detconcep PRIMARY KEY(idemp,codcto,tippag,numdoc,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdepre')
BEGIN
	ALTER TABLE ven_facdepre ADD CONSTRAINT PK_ven_facdepre PRIMARY KEY(idemp,codcto,tipfac,numfac,numpre,codart,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdescuentos')
BEGIN
	PRINT ''
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdetalle')
BEGIN
	ALTER TABLE ven_facdetalle ADD CONSTRAINT PK_ven_facdetalle PRIMARY KEY(idemp, codcto,tipfac,numfac,codart,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facdetremi')
BEGIN
	ALTER TABLE ven_facdetremi ADD CONSTRAINT PK_ven_facdetremi PRIMARY KEY(idemp,codcto,tipfac,numfac,numcon,codcon,codart)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facturas')
BEGIN
	ALTER TABLE ven_facturas ADD CONSTRAINT PK_ven_facturas PRIMARY KEY (idemp, codcto,tipfac,numfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facuopagos')
BEGIN
	ALTER TABLE ven_facuopagos ADD CONSTRAINT PK_ven_facuopagos PRIMARY KEY(idemp,codcto,tipfac,numfac,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_facuota')
BEGIN
	ALTER TABLE ven_facuota ADD CONSTRAINT PK_ven_facuota PRIMARY KEY(idemp,codcto,tipfac,numfac,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_formapago')
BEGIN
	ALTER TABLE ven_formapago ADD CONSTRAINT PK_ven_formapago PRIMARY KEY(idemp,codfor,codcto,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_mesas')
BEGIN
	ALTER TABLE ven_mesas ADD CONSTRAINT PK_ven_mesas PRIMARY KEY(idemp,codcto,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_movcli')
BEGIN
	ALTER TABLE ven_movcli ADD CONSTRAINT PK_ven_movcli PRIMARY KEY(idemp,codcto,nitcli,docven,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_notas')
BEGIN
	ALTER TABLE ven_notas ADD CONSTRAINT PK_ven_notas PRIMARY KEY(idemp,codcto,tipnot,numnot,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagdescuentos')
BEGIN
	ALTER TABLE ven_pagdescuentos ADD CONSTRAINT PK_ven_pagdescuentos PRIMARY KEY (idemp,codcto,tippag,numdoc,coddes)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagdetalle')
BEGIN
	ALTER TABLE ven_pagdetalle ADD CONSTRAINT PK_ven_pagdetalle PRIMARY KEY(idemp, codcto,tippag,numdoc,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagos')
BEGIN
	ALTER TABLE ven_pagos ADD CONSTRAINT PK_ven_pagos PRIMARY KEY (idemp, codcto,tippag,numdoc)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_parametros')
BEGIN
	ALTER TABLE ven_parametros ADD CONSTRAINT PK_ven_parametros PRIMARY KEY(idemp,codcto,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_parametros2')
BEGIN
	ALTER TABLE ven_parametros2 ADD CONSTRAINT PK_ven_parametros2 PRIMARY KEY(idemp, centro)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pdetalle')
BEGIN
	ALTER TABLE ven_pdetalle ADD CONSTRAINT PK_ven_pdetalle PRIMARY KEY (idemp,codcto,tipfac,numfac,itemfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pedicoti')
BEGIN
	ALTER TABLE ven_pedicoti ADD CONSTRAINT PK_ven_pedicoti PRIMARY KEY(tipfac,numfac,codcen,numcon,codcon,codart)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_costos')
BEGIN
	ALTER TABLE alm_costos ADD CONSTRAINT PK_alm_costos PRIMARY KEY (idemp,codcosd)
END
GO 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pedidos')
BEGIN
	ALTER TABLE ven_pedidos ADD CONSTRAINT PK_ven_pedidos PRIMARY KEY (idemp,codcto,tipfac,numfac)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_prefacdetalle')
BEGIN
	ALTER TABLE ven_prefacdetalle ADD CONSTRAINT PK_ven_prefacdetalle PRIMARY KEY(idemp, codcto,numpre,codart,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_prefactura')
BEGIN
	ALTER TABLE ven_prefactura ADD CONSTRAINT PK_ven_prefactura  PRIMARY KEY (idemp, codcto,numpre)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_segcartera')
BEGIN
	ALTER TABLE ven_segcartera ADD CONSTRAINT PK_ven_segcartera PRIMARY KEY(idemp,item)
END
GO 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_variantes')
BEGIN
	ALTER TABLE ven_variantes ADD CONSTRAINT PK_ven_variantes PRIMARY KEY(idemp,numpre,numcom,codcto,codart, codins,item)
END
GO
/*
	Añadir campo servidor.
*/
DECLARE @SQLQUERY NVARCHAR(1000)
DECLARE @TABLE_NAME NVARCHAR(100)
DECLARE CURDATA CURSOR FOR
SELECT CodTabla FROM SYN_TABLASPUBLICACION
OPEN CURDATA
FETCH CURDATA INTO @TABLE_NAME
WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @SQLQUERY = 'IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '''+ @TABLE_NAME +''' and COLUMN_NAME=''servidor'' )
	BEGIN
		ALTER TABLE ' + @TABLE_NAME + ' ADD servidor NVARCHAR(256) NOT NULL CONSTRAINT DF_' + @TABLE_NAME + '_servidor DEFAULT(''SERVER'')
	END'
	PRINT @SQLQUERY
	EXEC(@SQLQUERY)
	FETCH CURDATA INTO @TABLE_NAME
END
CLOSE CURDATA
DEALLOCATE CURDATA
GO
/*
	Reconstruir restricciones (valores por defecto) copiados en DfBackup.
*/
IF EXISTS (SELECT * FROM SYS.TABLES WHERE NAME = 'DfBackup')
BEGIN
	DECLARE @SQLQUERY NVARCHAR(1000)
	DECLARE @TABLE_NAME NVARCHAR(256)
	DECLARE @CONSTRAINT_NAME NVARCHAR(256)
	DECLARE @DEFAULT_VALUE NVARCHAR(256)
	DECLARE @COLUMN_NAME NVARCHAR(256)
	DECLARE CURDATA CURSOR FOR
	SELECT TABLE_NAME, CONSTRAINT_NAME, DEFAULT_VALUE, COLUMN_NAME FROM DfBackup
	OPEN CURDATA
	FETCH CURDATA INTO @TABLE_NAME, @CONSTRAINT_NAME, @DEFAULT_VALUE, @COLUMN_NAME
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @SQLQUERY = 'ALTER TABLE [' + @TABLE_NAME + '] ADD CONSTRAINT ' + @CONSTRAINT_NAME + ' DEFAULT (' + @DEFAULT_VALUE + ') FOR [' + @COLUMN_NAME + ']'
		PRINT @SQLQUERY
		EXEC(@SQLQUERY)
		FETCH CURDATA INTO @TABLE_NAME, @CONSTRAINT_NAME, @DEFAULT_VALUE, @COLUMN_NAME
	END
	CLOSE CURDATA
	DEALLOCATE CURDATA
	EXEC('DROP TABLE DfBackup')
END
GO
/*
	Reconstruir indices copiados en IndexesBackup.
*/
IF EXISTS (SELECT * FROM SYS.TABLES WHERE NAME = 'IndexesBackup')
BEGIN
	DECLARE @SQLQUERY NVARCHAR(3000)
	DECLARE @TABLE_NAME NVARCHAR(256)
	DECLARE @INDEX_NAME NVARCHAR(256)
	DECLARE @INDEX_TYPE NVARCHAR(256)
	DECLARE @ROW_LOCK BIT
	DECLARE @PAGE_LOCK BIT
	DECLARE @INCLUDED BIT
	DECLARE CURDATA CURSOR FOR
	SELECT DISTINCT TABLE_NAME, INDEX_NAME, INDEX_TYPE, ROW_LOCK, PAGE_LOCK FROM IndexesBackup
	OPEN CURDATA
	FETCH CURDATA INTO @TABLE_NAME, @INDEX_NAME, @INDEX_TYPE, @ROW_LOCK, @PAGE_LOCK
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		DECLARE @COLUMNS VARCHAR(1000)
		SELECT @COLUMNS = COALESCE(@COLUMNS+', '+CHAR(13)+	char(9)+	char(9)+	char(9)+	char(9) +'['+column_name + '] ' + SORT, '[' + column_name + '] ' + SORT)
			FROM indexesBackup
			where index_name = @INDEX_NAME AND INCLUDED = 0
		DECLARE @COLUMNS_INCLUDED VARCHAR(1000)
		SELECT @COLUMNS_INCLUDED = COALESCE(@COLUMNS_INCLUDED+', '+CHAR(13)+	char(9)+	char(9)+	char(9)+	char(9) +'['+column_name + '] ', '[' + column_name + ']')
			FROM indexesBackup
			where index_name = @INDEX_NAME AND INCLUDED = 1
		SET @SQLQUERY = '
		IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_name(object_id) =''' + @TABLE_NAME + ''' and name=''' + @INDEX_NAME + ''')
		BEGIN
			CREATE ' + @INDEX_TYPE + ' INDEX [' + @INDEX_NAME + '] ON [' + @TABLE_NAME + ']
			(
				' + @COLUMNS + '
			)
			' + CASE @COLUMNS_INCLUDED WHEN '' THEN '' ELSE '
			INCLUDE (
				' + @COLUMNS_INCLUDED + '
			) WITH (ALLOW_ROW_LOCKS = ' + CASE @ROW_LOCK WHEN '1' THEN 'ON' ELSE 'OFF' END + ',
			ALLOW_PAGE_LOCKS = ' + CASE @PAGE_LOCK WHEN '1' THEN 'ON' ELSE 'OFF' END + ')'+'
			' END +'
		END
		'
		SET @COLUMNS = NULL
		SET @COLUMNS_INCLUDED = NULL
		PRINT @SQLQUERY
		EXEC(@SQLQUERY)
		FETCH CURDATA INTO @TABLE_NAME, @INDEX_NAME, @INDEX_TYPE, @ROW_LOCK, @PAGE_LOCK
	END
	CLOSE CURDATA
	DEALLOCATE CURDATA
	EXEC('DROP TABLE IndexesBackup')
END
GO
/*
	Crear Triggers
*/
DECLARE @query VARCHAR(MAX)
DECLARE @nombreTabla VARCHAR(MAX)
DECLARE CURDATA2 CURSOR FOR 
SELECT CodTabla FROM dbo.SYN_TABLASPUBLICACION
OPEN CURDATA2
FETCH CURDATA2 INTO @nombreTabla
WHILE (@@FETCH_STATUS = 0)
BEGIN
	IF (dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN(@nombreTabla,'TABLA','NUEVO') = '')
	BEGIN
		SELECT 'Error al cargar informacion de llave primaria de la tabla' AS ErrorMessage, @nombreTabla AS TABLE_NAME
		FETCH CURDATA2 INTO @nombreTabla
		CONTINUE
	END
	SET @nombreTabla = UPPER(@nombreTabla)
	PRINT 'Creando el trigger de la tabla: ' + @nombreTabla
	PRINT ''
	SET @query = 
	'IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id)  = ''changeCD_BD_ORIG_' + @nombreTabla  + ''')
	BEGIN
		EXEC(''
		CREATE TRIGGER changeCD_BD_ORIG_' + @nombreTabla  + '
		on [' + @nombreTabla  + ']
		AFTER UPDATE
		AS
			IF APP_NAME() NOT IN (''''GSUpdater'''', ''''GSSync'''')
			BEGIN
				UPDATE [TABLA]
				SET SERVIDOR = ''''SERVER''''
				FROM [DBO].[' + @nombreTabla  + '] AS [TABLA]
				INNER JOIN [INSERTED] AS [NUEVO]
				ON (' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN(@nombreTabla,'TABLA','NUEVO') + ')
			END
		'')
	END'
	EXEC (@query)
	PRINT @query
	FETCH CURDATA2 INTO @nombreTabla
END
CLOSE CURDATA2
DEALLOCATE CURDATA2

/*
	Reconstruir valores por defecto del campo servidor
*/
DECLARE @SQLQUERY NVARCHAR(1000)
DECLARE @TABLE_NAME NVARCHAR(100)
DECLARE CURDATA CURSOR FOR
SELECT CodTabla FROM SYN_TABLASPUBLICACION
OPEN CURDATA
FETCH CURDATA INTO @TABLE_NAME
WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @SQLQUERY = 'IF EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID(''' + @TABLE_NAME + ''')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = ''servidor''
							AND object_id = OBJECT_ID(''' + @TABLE_NAME + '''))
				
		)
	BEGIN 
		ALTER TABLE ' + @TABLE_NAME + ' DROP CONSTRAINT DF_' + @TABLE_NAME + '_servidor
		ALTER TABLE ' + @TABLE_NAME + ' ADD  CONSTRAINT DF_' + @TABLE_NAME + '_servidor  DEFAULT (''SERVER'') FOR servidor
		UPDATE '+@TABLE_NAME+' SET servidor = ''SERVER''
	END '
	PRINT @SQLQUERY+ char(10) +'GO'
	EXEC(@SQLQUERY)
	FETCH CURDATA INTO @TABLE_NAME
END
CLOSE CURDATA
DEALLOCATE CURDATA
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_propiedad')
BEGIN	
	ALTER TABLE alm_propiedad ADD CONSTRAINT PK_alm_propiedad PRIMARY KEY(codprop)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_temporada')
BEGIN
	ALTER TABLE alm_temporada ADD CONSTRAINT PK_alm_temporada PRIMARY KEY(codtemp)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_target')
BEGIN
	ALTER TABLE alm_target ADD CONSTRAINT PK_alm_target PRIMARY KEY(codtar)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_departamentos')
BEGIN
	ALTER TABLE glb_departamentos ADD CONSTRAINT PK_glb_departamentos PRIMARY KEY(coddep)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_vence')
BEGIN
	ALTER TABLE alm_vence ADD CONSTRAINT PK_alm_vence PRIMARY KEY(codcen,codart)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_clasiven')
BEGIN
	ALTER TABLE glb_clasiven ADD CONSTRAINT PK_glb_clasiven PRIMARY KEY(codigo)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_error')
BEGIN
	ALTER TABLE glb_error ADD CONSTRAINT PK_glb_error PRIMARY KEY(id)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_glb_pais')
BEGIN
	ALTER TABLE glb_pais ADD CONSTRAINT PK_glb_pais PRIMARY KEY(codpais)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_clasiven')
BEGIN
	ALTER TABLE ven_clasiven ADD CONSTRAINT PK_ven_clasiven PRIMARY KEY(codigo)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_alm_artxlote')
BEGIN
	ALTER TABLE alm_artxlote ADD CONSTRAINT PK_alm_artxlote PRIMARY KEY(idemp,codcto,tipdoc,numdoc,item)
END
GO