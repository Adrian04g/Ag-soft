--IF OBJECT_ID('SYN_TIPOPUBLICACION') IS NULL
--BEGIN
--	RAISERROR('Creando tabla SYN_TIPOPUBLICACION.',10,1) WITH NOWAIT
--	CREATE TABLE dbo.SYN_TIPOPUBLICACION(
--		TipoPublicacion VARCHAR(20) NOT NULL DEFAULT '',
--		DescripcionTipo VARCHAR(120) NOT NULL DEFAULT '',
--		FechModificacion SMALLDATETIME NOT NULL DEFAULT GETDATE(),
--		UsuarioModificacion VARCHAR(20) NOT NULL DEFAULT '',
--		EquipoModificacion VARCHAR(20) NOT NULL DEFAULT ''
--	)
--	ALTER TABLE dbo.SYN_TIPOPUBLICACION ADD CONSTRAINT PK_SYN_TIPOPUBLICACION 
--		PRIMARY KEY (TipoPublicacion)
--END	
--GO
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
	--ALTER TABLE dbo.SYN_PUBLICACIONES ADD CONSTRAINT FK_SYN_PUBLICACIONES_TIPOPUBLICACION
	--	FOREIGN KEY(TipoPublicacion) REFERENCES dbo.SYN_PUBLICACION(TipoPublicacion)
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
		EquipoModificacion VARCHAR(20) NOT NULL DEFAULT HOST_NAME())
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT PK_SYN_TABLASPUBLICACION
		PRIMARY KEY(CodPublicacion,CodTabla)
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT FK_SYN_TABLASPUBLICACION_PUBLICACIONES
		FOREIGN KEY(CodPublicacion) REFERENCES dbo.SYN_PUBLICACIONES(CodPublicacion)
END
GO
IF OBJECT_ID('SYN_PUBLICACIONCENTRO') IS NULL
BEGIN
	RAISERROR('Creando tabla SYN_PUBLICACIONCENTRO.',10,1) WITH NOWAIT
	CREATE TABLE dbo.SYN_PUBLICACIONCENTRO(
		CodCen VARCHAR(20) NOT NULL DEFAULT '',
		CodPublicacion VARCHAR(20) NOT NULL DEFAULT '',
		ReplicacionActiva BIT NOT NULL DEFAULT 1 ,
		FechModificacion SMALLDATETIME NOT NULL DEFAULT GETDATE(),
		UsuarioModificacion VARCHAR(20) NOT NULL DEFAULT '',
		EquipoModificacion VARCHAR(20) NOT NULL DEFAULT HOST_NAME())
	ALTER TABLE dbo.SYN_PUBLICACIONCENTRO ADD CONSTRAINT PK_SYN_PUBLICACIONCENTRO
		PRIMARY KEY(CodCen,CodPublicacion)
END
GO
/*	Adicionar scripts para inicializacion de datos siempre al final del archivo.
	Adicionar scripts para creacion de estructuras antes de esta linea*/ 
RAISERROR('Inicializacion de Datos.',10,1) WITH NOWAIT
--IF NOT EXISTS(SELECT TOP 1 * FROM dbo.SYN_TIPOPUBLICACION)
--BEGIN
--	INSERT INTO dbo.SYN_TIPOPUBLICACION(TipoPublicacion ,DescripcionTipo, FechModificacion, UsuarioModificacion, EquipoModificacion)
--		SELECT 'InvEsp','Especiales Inventario',GETDATE(),'AUTO',HOST_NAME()
--		UNION ALL SELECT 'Maestros','Archivos Maestros',GETDATE(),'AUTO',HOST_NAME()
--		UNION ALL SELECT 'MovReady','Movimientos Ready?',GETDATE(),'AUTO',HOST_NAME()
--END
--GO
IF NOT EXISTS(SELECT TOP 1 * FROM dbo.SYN_PUBLICACIONES)
BEGIN
	INSERT INTO dbo.SYN_PUBLICACIONES(CodPublicacion,Activa,UsuarioModificacion)
		SELECT 'InvEsp',1,'AUTO'
		UNION ALL SELECT 'Maestros',1,'AUTO'
		UNION ALL SELECT 'MovReady',1,'AUTO'
END
GO
IF NOT EXISTS(SELECT TOP 1 * FROM dbo.SYN_TABLASPUBLICACION)
BEGIN
	INSERT INTO dbo.SYN_TABLASPUBLICACION(CodPublicacion,CodTabla,Filtro,ReplicacionActiva,UsuarioModificacion)
		SELECT 'InvEsp','alm_inventario','',1,'AUTO'
		UNION ALL SELECT 'InvEsp','alm_kardextemp','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_articulos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_codbarras','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_genero','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_grupos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_lineas','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_marcas','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_tallasart','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_tipoin','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_tipoplato','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_tips','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_unidades','',1,'AUTO'
		UNION ALL SELECT 'Maestros','alm_variantes','',1,'AUTO'
		UNION ALL SELECT 'Maestros','com_cancela','',1,'AUTO'
		UNION ALL SELECT 'Maestros','com_conceptos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','com_estados','',1,'AUTO'
		UNION ALL SELECT 'Maestros','com_parametros','',1,'AUTO'
		UNION ALL SELECT 'Maestros','com_tipestados','',1,'AUTO'
		UNION ALL SELECT 'Maestros','com_tipos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','con_cencostos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','con_mescierre','',1,'AUTO'
		UNION ALL SELECT 'Maestros','con_parametros','',1,'AUTO'
		UNION ALL SELECT 'Maestros','con_puc','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_accesos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_almacen','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_bancos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_barrio','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_cargos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_cenconsumo','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_ciudad','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_conceptoscli','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_contac','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_descuentos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_dpto','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_empresa','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_estados','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_global','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_hobby','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_idx','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_labores','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_mensaje','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_menu','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_modulos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_niveles','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_perfilcto','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_perfiles','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_profesion','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_terceros','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_tipid','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_transaccion','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_usuarios','',1,'AUTO'
		UNION ALL SELECT 'Maestros','glb_zonas','',1,'AUTO'
		UNION ALL SELECT 'Maestros','pro_formulas','',1,'AUTO'
		UNION ALL SELECT 'Maestros','pro_parametros','',1,'AUTO'
		UNION ALL SELECT 'Maestros','ven_conceptos','',1,'AUTO'
		UNION ALL SELECT 'Maestros','ven_formapago','',1,'AUTO'
		UNION ALL SELECT 'Maestros','ven_parametros','',1,'AUTO'
		UNION ALL SELECT 'MovReady','alm_alimfisico','',1,'AUTO'
		UNION ALL SELECT 'MovReady','alm_conteoinv','',1,'AUTO'
		UNION ALL SELECT 'MovReady','alm_invfisicos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','alm_kardex','',1,'AUTO'
		UNION ALL SELECT 'MovReady','alm_promo','',1,'AUTO'
		UNION ALL SELECT 'MovReady','alm_promodet','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_detrequi','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_facdescuentos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_facdetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_facdetremi','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_facturas','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_gasdetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_gastos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_movpro','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_notas','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_notastemp','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_orddetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_ordenes','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_pordes','',1,'AUTO'
		UNION ALL SELECT 'MovReady','com_requi','',1,'AUTO'
		UNION ALL SELECT 'MovReady','con_comprobante','',1,'AUTO'
		UNION ALL SELECT 'MovReady','con_foldetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','con_folios','',1,'AUTO'
		UNION ALL SELECT 'MovReady','con_resolclientes','',1,'AUTO'
		UNION ALL SELECT 'MovReady','glb_caja','',1,'AUTO'
		UNION ALL SELECT 'MovReady','glb_mensual','',1,'AUTO'
		UNION ALL SELECT 'MovReady','glb_unica','',1,'AUTO'
		UNION ALL SELECT 'MovReady','pro_costos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','pro_movcontrato','',1,'AUTO'
		UNION ALL SELECT 'MovReady','pro_orddetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','pro_ordenes','',1,'AUTO'
		UNION ALL SELECT 'MovReady','tes_conciliacion','',1,'AUTO'
		UNION ALL SELECT 'MovReady','tes_detconciliacion','',1,'AUTO'
		UNION ALL SELECT 'MovReady','tes_egresos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_cotidetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_cotizacion','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_detconcep','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_facdepre','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_facdescuentos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_facdetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_facdetremi','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_facturas','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_facuopagos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_facuota','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_mesas','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_movcli','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_notas','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_pagdescuentos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_pagdetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_pagos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_pdetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_pedicoti','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_pedidos','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_prefacdetalle','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_prefactura','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_segcartera','',1,'AUTO'
		UNION ALL SELECT 'MovReady','ven_variantes','',1,'AUTO'
END
GO
