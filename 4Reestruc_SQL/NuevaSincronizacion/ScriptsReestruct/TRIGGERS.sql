IF EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='SYN_TABLASPUBLICACION') 
BEGIN
drop table SYN_TABLASPUBLICACION
end
go--
	RAISERROR('Creando tabla SYN_TABLASPUBLICACION.',10,1) WITH NOWAIT
	CREATE TABLE dbo.SYN_TABLASPUBLICACION (
		CodPublicacion VARCHAR(20) NOT NULL DEFAULT '',
		CodTabla VARCHAR(20) NOT NULL DEFAULT '',
		Filtro VARCHAR(250) NOT NULL DEFAULT '',
		ReplicacionActiva BIT NOT NULL DEFAULT 1 ,
		FechModificacion SMALLDATETIME NOT NULL DEFAULT GETDATE(),
		UsuarioModificacion VARCHAR(20) NOT NULL DEFAULT '',
		AliasNombre VARCHAR(60) NOT NULL DEFAULT '',
		EquipoModificacion VARCHAR(20) NOT NULL DEFAULT HOST_NAME())
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT PK_SYN_TABLASPUBLICACION
		PRIMARY KEY(CodPublicacion,CodTabla)
	ALTER TABLE dbo.SYN_TABLASPUBLICACION ADD CONSTRAINT FK_SYN_TABLASPUBLICACION_PUBLICACIONES
		FOREIGN KEY(CodPublicacion) REFERENCES dbo.SYN_PUBLICACIONES(CodPublicacion)


go--
IF NOT EXISTS(SELECT TOP 1 * FROM dbo.SYN_TABLASPUBLICACION)
BEGIN
	INSERT INTO dbo.SYN_TABLASPUBLICACION(CodPublicacion,CodTabla,Filtro,ReplicacionActiva,UsuarioModificacion,AliasNombre)
		SELECT 'InvEsp','alm_inventario','',1,'AUTO','Inventario'
		UNION ALL SELECT 'InvEsp','alm_kardextemp','',1,'AUTO','Kardex Temporal'
		UNION ALL SELECT 'Maestros','alm_articulos','',1,'AUTO','Articulos'
		--UNION ALL SELECT 'Maestros','alm_detinvfisicos','',1,'AUTO','Detalle Inv' 
		--UNION ALL SELECT 'Maestros','alm_fisico','',1,'AUTO','Inv Fisico' 
		UNION ALL SELECT 'Maestros','alm_codbarras','',1,'AUTO','Codigo de Barras'
		UNION ALL SELECT 'Maestros','alm_genero','',1,'AUTO','Genero'
		UNION ALL SELECT 'Maestros','alm_grupos','',1,'AUTO','Grupos'
		UNION ALL SELECT 'Maestros','alm_lineas','',1,'AUTO','Lineas'
		UNION ALL SELECT 'Maestros','alm_marcas','',1,'AUTO','Marcas'
		UNION ALL SELECT 'Maestros','alm_tallasart','',1,'AUTO','Tallas Articulos'
		UNION ALL SELECT 'Maestros','alm_tipoin','',1,'AUTO','Tipo Ingreso'
		UNION ALL SELECT 'Maestros','alm_tipoplato','',1,'AUTO','Tipo Plato'
		UNION ALL SELECT 'Maestros','alm_tips','',1,'AUTO','Tips'
		UNION ALL SELECT 'Maestros','alm_unidades','',1,'AUTO','Unidades'
		UNION ALL SELECT 'Maestros','alm_variantes','',1,'AUTO','Variantes'
		UNION ALL SELECT 'Maestros','com_cancela','',1,'AUTO','Compras Cancela'
		UNION ALL SELECT 'Maestros','com_conceptos','',1,'AUTO','Conceptos Compras'
		UNION ALL SELECT 'Maestros','com_estados','',1,'AUTO','Estados Compras'
		UNION ALL SELECT 'Maestros','com_parametros','',1,'AUTO','Parametros Compras'
		UNION ALL SELECT 'Maestros','com_tipestados','',1,'AUTO','Tip Estados Compras'
		UNION ALL SELECT 'Maestros','com_tipos','',1,'AUTO','Tipos Compras'
		UNION ALL SELECT 'Maestros','con_cencostos','',1,'AUTO','Centros de Costos'
		UNION ALL SELECT 'Maestros','con_mescierre','',1,'AUTO','Mes Cierre'
		UNION ALL SELECT 'Maestros','con_parametros','',1,'AUTO','Parametros Contables'
		UNION ALL SELECT 'Maestros','con_puc','',1,'AUTO','Plan Unico Cuentas'
		UNION ALL SELECT 'Maestros','glb_accesos','',1,'AUTO','Accesos'
		UNION ALL SELECT 'Maestros','glb_almacen','',1,'AUTO','Almacen'
		UNION ALL SELECT 'Maestros','glb_bancos','',1,'AUTO','Bancos'
		UNION ALL SELECT 'Maestros','glb_barrio','',1,'AUTO','Barrios'
		UNION ALL SELECT 'Maestros','glb_cargos','',1,'AUTO','Cargos'
		UNION ALL SELECT 'Maestros','glb_cenconsumo','',1,'AUTO','Centros Consumo'
		UNION ALL SELECT 'Maestros','glb_ciudad','',1,'AUTO','Ciudad'
		UNION ALL SELECT 'Maestros','glb_conceptoscli','',1,'AUTO','Conceptos Clientes'
		UNION ALL SELECT 'Maestros','glb_contac','',1,'AUTO','Contac'
		UNION ALL SELECT 'Maestros','glb_descuentos','',1,'AUTO','Descuentos'
		UNION ALL SELECT 'Maestros','glb_dpto','',1,'AUTO','Departamento'
		UNION ALL SELECT 'Maestros','glb_empresa','',1,'AUTO','Empresa'
		UNION ALL SELECT 'Maestros','glb_estados','',1,'AUTO','Estados'
		UNION ALL SELECT 'Maestros','glb_global','',1,'AUTO','Global'
		UNION ALL SELECT 'Maestros','glb_hobby','',1,'AUTO','Hobby'
		UNION ALL SELECT 'Maestros','glb_idx','',1,'AUTO','Idx'
		UNION ALL SELECT 'Maestros','glb_labores','',1,'AUTO','Labores'
		UNION ALL SELECT 'Maestros','glb_mensaje','',1,'AUTO','Mensaje'
		UNION ALL SELECT 'Maestros','glb_menu','',1,'AUTO','Menu'
		UNION ALL SELECT 'Maestros','glb_modulos','',1,'AUTO','Modulos'
		UNION ALL SELECT 'Maestros','glb_niveles','',1,'AUTO','Niveles'
		UNION ALL SELECT 'Maestros','glb_perfilcto','',1,'AUTO','Perfil Centro de Costo'
		UNION ALL SELECT 'Maestros','glb_perfiles','',1,'AUTO','Perfiles'
		UNION ALL SELECT 'Maestros','glb_profesion','',1,'AUTO','Profesion'
		UNION ALL SELECT 'Maestros','glb_terceros','',1,'AUTO','Terceros'
		UNION ALL SELECT 'Maestros','glb_tipid','',1,'AUTO','Tip Id'
		UNION ALL SELECT 'Maestros','glb_transaccion','',1,'AUTO','Transaccion'
		UNION ALL SELECT 'Maestros','glb_usuarios','',1,'AUTO','Usuarios'
		UNION ALL SELECT 'Maestros','glb_zonas','',1,'AUTO','Zonas'
		UNION ALL SELECT 'Maestros','pro_formulas','',1,'AUTO','Formulas'
		UNION ALL SELECT 'Maestros','pro_parametros','',1,'AUTO','Parametros'
		UNION ALL SELECT 'Maestros','ven_conceptos','',1,'AUTO','Conceptos'
		UNION ALL SELECT 'Maestros','ven_formapago','',1,'AUTO','Forma Pago'
		UNION ALL SELECT 'Maestros','ven_parametros','',1,'AUTO','Paramentos Ventas'
		UNION ALL SELECT 'MovReady','alm_alimfisico','',1,'AUTO','Alim Fisico'
		UNION ALL SELECT 'MovReady','alm_conteoinv','',1,'AUTO','Conteo Inventario'
		UNION ALL SELECT 'MovReady','alm_invfisicos','',1,'AUTO','Inventario Fisico'
		UNION ALL SELECT 'MovReady','alm_kardex','',1,'AUTO','Kardex'
		UNION ALL SELECT 'MovReady','alm_promo','',1,'AUTO','Promocion'
		UNION ALL SELECT 'MovReady','alm_promodet','',1,'AUTO','Detalle Promocion'
		UNION ALL SELECT 'MovReady','com_detrequi','',1,'AUTO','Detrequi'
		UNION ALL SELECT 'MovReady','com_facdescuentos','',1,'AUTO','Descuentos Facturas Compras'
		UNION ALL SELECT 'MovReady','com_facdetalle','',1,'AUTO','Detalle Facturas Compras'
		UNION ALL SELECT 'MovReady','com_facdetremi','',1,'AUTO','Facdetremi'
		UNION ALL SELECT 'MovReady','com_facturas','',1,'AUTO','Facturas Compras'
		UNION ALL SELECT 'MovReady','com_gasdetalle','',1,'AUTO','Gasdetalle'
		UNION ALL SELECT 'MovReady','com_gastos','',1,'AUTO','Gastos'
		UNION ALL SELECT 'MovReady','com_movpro','',1,'AUTO','Movimiento Proveedores'
		UNION ALL SELECT 'MovReady','com_notas','',1,'AUTO','Notas'
		UNION ALL SELECT 'MovReady','com_notastemp','',1,'AUTO','Notas Temporales'
		UNION ALL SELECT 'MovReady','com_orddetalle','',1,'AUTO','Detalles Orden Compras'
		UNION ALL SELECT 'MovReady','com_ordenes','',1,'AUTO','Ordenes Compras'
		UNION ALL SELECT 'MovReady','com_pordes','',1,'AUTO','Porcentaje Descuento'
		UNION ALL SELECT 'MovReady','com_requi','',1,'AUTO','Requicitos'
		UNION ALL SELECT 'MovReady','con_comprobante','',1,'AUTO','Comprobantes'
		UNION ALL SELECT 'MovReady','con_foldetalle','',1,'AUTO','Folios Detalles'
		UNION ALL SELECT 'MovReady','con_folios','',1,'AUTO','Folios'
		UNION ALL SELECT 'MovReady','con_resolclientes','',1,'AUTO','Resolucion'
		UNION ALL SELECT 'MovReady','glb_caja','',1,'AUTO','Caja'
		UNION ALL SELECT 'MovReady','glb_mensual','',1,'AUTO','Mensual'
		UNION ALL SELECT 'MovReady','glb_unica','',1,'AUTO','Unica'
		UNION ALL SELECT 'MovReady','pro_costos','',1,'AUTO','Costos'
		UNION ALL SELECT 'MovReady','pro_movcontrato','',1,'AUTO','Mov Contrato'
		UNION ALL SELECT 'MovReady','pro_orddetalle','',1,'AUTO','Detalle Orden Proveedores'
		UNION ALL SELECT 'MovReady','pro_ordenes','',1,'AUTO','Ordenes Proveedores'
		UNION ALL SELECT 'MovReady','tes_conciliacion','',1,'AUTO','Conciliacion'
		UNION ALL SELECT 'MovReady','tes_detconciliacion','',1,'AUTO','Detalles Conciliacion'
		UNION ALL SELECT 'MovReady','tes_egresos','',1,'AUTO','Egresos'
		UNION ALL SELECT 'MovReady','ven_cotidetalle','',1,'AUTO','Detalle Cotizaxion'
		UNION ALL SELECT 'MovReady','ven_cotizacion','',1,'AUTO','Cotizacion'
		UNION ALL SELECT 'MovReady','ven_detconcep','',1,'AUTO','Concpeto Detalle'
		UNION ALL SELECT 'MovReady','ven_facdepre','',1,'AUTO','Factura Depre'
		UNION ALL SELECT 'MovReady','ven_facdescuentos','',1,'AUTO','Decuentos Facturas'
		UNION ALL SELECT 'MovReady','ven_facdetalle','',1,'AUTO','Detalle Facturas'
		UNION ALL SELECT 'MovReady','ven_facdetremi','',1,'AUTO','Fac detremi'
		UNION ALL SELECT 'MovReady','ven_facturas','',1,'AUTO','Facturas'
		UNION ALL SELECT 'MovReady','ven_facuopagos','',1,'AUTO','Pagos Cuotas'
		UNION ALL SELECT 'MovReady','ven_facuota','',1,'AUTO','Facutura Cuotas'
		UNION ALL SELECT 'MovReady','ven_mesas','',1,'AUTO','Mesas'
		UNION ALL SELECT 'MovReady','ven_movcli','',1,'AUTO','Movimiento Cliente'
		UNION ALL SELECT 'MovReady','ven_notas','',1,'AUTO','Notas'
		UNION ALL SELECT 'MovReady','ven_pagdescuentos','',1,'AUTO','Pago Descuentos'
		UNION ALL SELECT 'MovReady','ven_pagdetalle','',1,'AUTO','Pago Detalle'
		UNION ALL SELECT 'MovReady','ven_pagos','',1,'AUTO','Pagos'
		UNION ALL SELECT 'MovReady','ven_pdetalle','',1,'AUTO','P Detalle'
		UNION ALL SELECT 'MovReady','ven_pedicoti','',1,'AUTO','Pedidos Cotizacion'
		UNION ALL SELECT 'MovReady','ven_pedidos','',1,'AUTO','Pedidos'
		UNION ALL SELECT 'MovReady','ven_prefacdetalle','',1,'AUTO','Detalles Prefactura'
		UNION ALL SELECT 'MovReady','ven_prefactura','',1,'AUTO','Pre Factura'
		UNION ALL SELECT 'MovReady','ven_segcartera','',1,'AUTO','Seg Cartera'
		UNION ALL SELECT 'MovReady','ven_variantes','',1,'AUTO','Variantes'
		UNION ALL SELECT 'Maestros','alm_color','',1,'AUTO','Color'
		--UNION ALL SELECT 'Maestros','alm_propiedad','',1,'AUTO','Propiedad'
		--UNION ALL SELECT 'Maestros','alm_target','',1,'AUTO','Target'
		--UNION ALL SELECT 'Maestros','alm_temporada','',1,'AUTO','Temporada'
END
GO--

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
		AFTER UPDATE,INSERT
		AS
			IF APP_NAME() NOT IN (''''GSUpdater'''', ''''GSSync'''')
			BEGIN
				UPDATE [TABLA]
				SET SERVIDOR = @@SERVERNAME
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


if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'syn_tablaspublicacion'
                     and column_name = 'OmitirCentro')
					 begin
					 alter table syn_tablaspublicacion add OmitirCentro bit not null CONSTRAINT DF__SYN_TABLA__Omiti__5CB308B1 DEFAULT(0)
					 
					 end
go--
update SYN_TABLASPUBLICACION set OmitirCentro=1 where CodPublicacion<>'MovReady'
go--

ALTER TABLE com_detrequi  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON)
ALTER TABLE com_gasdetalle  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE com_gastos  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE com_notas  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE com_orddetalle  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE com_pordes  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE com_requi  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE con_comprobante  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE con_resolclientes  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE pro_costos  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE pro_movcontrato  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE tes_conciliacion  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE tes_detconciliacion  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE ven_cotizacion  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE ven_detconcep  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE ven_pedicoti  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE ven_facdetremi  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE ven_facdescuentos  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE com_facdetremi  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 
ALTER TABLE com_facturas  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) 


