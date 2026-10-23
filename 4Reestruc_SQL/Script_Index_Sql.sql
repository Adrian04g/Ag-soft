IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='alm_kardex' and ind.name='alm_kardex_documento'
				) 
begin 
	CREATE NONCLUSTERED INDEX [Alm_Kardex_documento]
	ON [dbo].[alm_kardex] ([idemp],[codcto],[numcon],[codcon])
	INCLUDE ([itemfac])
end
Go
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='Ven_prefacdetalle' and ind.name='ven_prefacdetalle_documento'
				) 
begin 
	CREATE NONCLUSTERED INDEX [ven_prefacdetalle_documento]
	ON [dbo].Ven_prefacdetalle ([idemp],[codcto],[numpre])
end
Go
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='Ven_Facturas' and ind.name='Ven_Facturas_docprefact'
				) 
begin 
	CREATE NONCLUSTERED INDEX [Ven_Facturas_docprefact]
	ON [dbo].Ven_Facturas ([idemp],[codcto],[numcon])
end
go

-- [18-08-2016] Darío Guzmán
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='con_comprobante' and ind.name='con_comprobante_documento'
				) 
begin 
	CREATE NONCLUSTERED INDEX [con_comprobante_documento]
	ON [dbo].[con_comprobante] ([idemp],[codcto],[codtran],[consec])
end
go


-- [24-09-2016] Darío Guzmán
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='alm_kardex' and ind.name='alm_kardex_modifcadoc'
				) 
begin
CREATE NONCLUSTERED INDEX [alm_kardex_modifcadoc] ON [dbo].[alm_kardex]
(
 [idemp] ASC,
 [codcto] ASC,
 [codart] ASC,
 [modificadoc] ASC
)
INCLUDE (  [codcon],
 [qtyart]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
end
GO


--[01-11-2018] Ing. Priscy Reales
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='alm_articulos' and ind.name='alm_articulos_maestro'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [alm_articulos_maestro] ON [dbo].[alm_articulos]
(
	[codgru] ASC
)
INCLUDE ( 	[codart],
	[nomart],
	[codbar],
	[refart],
	[codmar]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
end
GO

IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='alm_articulos' and ind.name='alm_articulos_maestro_talla'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [alm_articulos_maestro_talla] ON [dbo].[alm_articulos]
(
	[codgru] ASC
)
INCLUDE ( 	[codart],
	[nomart],
	[codbar],
	[refart],
	[codmar],
	[codtalla]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO

IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='glb_terceros' and ind.name='glb_terceros_terpro'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [glb_terceros_terpro] ON [dbo].[glb_terceros]
(
	[terpro] ASC
)
INCLUDE ( 	[nitter],
	[nomter]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO


--Ing. Luis Dominguez 2019-04-16 
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='ven_facdetalle' and ind.name='ven_facdetalle_ventasgra'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [ven_facdetalle_ventasgra] ON [dbo].[ven_facdetalle] 
(
	[idemp]		ASC,
	[codcto]	ASC,
	[porimpo]	ASC
)
INCLUDE ( 
			[tipfac],
			[numfac],
			[valdes],
			[valtot]
		) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO

--Ing. Luis Dominguez 2019-04-16 
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='ven_facdetalle' and ind.name='ven_facdetalle_totvenexe'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [ven_facdetalle_totvenexe] ON [dbo].[ven_facdetalle] 
(
	[idemp]		ASC,
	[codcto]	ASC,
	[ivaart]	ASC
)
INCLUDE (
			[tipfac],
			[numfac],
			[codart],
			[valdes],
			[valtot]
		) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO

--Ing. Luis Dominguez 2019-04-16 
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='ven_facdetalle' and ind.name='ven_facdetalle_ventasgra'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [ven_facdetalle_ventasgra] ON [dbo].[ven_facdetalle] 
(
	[idemp]		ASC,
	[codcto]	ASC,
	[porimpo]	ASC
)
INCLUDE ( 
			[tipfac],
			[numfac],
			[valdes],
			[valtot]
		) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO

--Ing. Luis Dominguez 2019-04-16 
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='ven_facdetalle' and ind.name='ven_facdetalle_codcto'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [ven_facdetalle_codcto] ON [dbo].[ven_facdetalle] 
(
	[idemp]		ASC,
	[ivaart]	ASC
)
INCLUDE (
            [codcto],
			[tipfac],
			[numfac],
			[codart],
			[valdes],
			[valtot]
		) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO


--Ing. Luis Dominguez 2019-04-16 
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='ven_facdetalle' and ind.name='ven_facdetalle_des'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [ven_facdetalle_des] ON [dbo].[ven_facdetalle] 
(
	[idemp]		ASC,
	[codcto]	ASC,
	[tipfac]	ASC,
	[numfac]	ASC,
	[ivaart]	ASC
)
INCLUDE (
            [codart],
			[valdes],
			[valtot]
		) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO
--Yaslen Andrade 08-09-2020
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='alm_inventario' and ind.name='alm_inventario_codcto_caninv_pvcart'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [alm_inventario_codcto_caninv_pvcart] ON [dbo].[alm_inventario] 
 ([codcto] ASC,
 [caninv]  ASC,
 [pvcart]  ASC
 )

 INCLUDE (
   [idemp],[codart],[valprom],[ucoart],[pvdart],[pveart],[pvmart],[pvaart],[pvbart],[minart],[maxart],[utcart],[utdart],[uteart],[frainv],     [qtyfra],[ucompra],[unumfac],[maxdcto],[diascmp],[diaseguri],[fecordcmp],[tiemped],[invdia],[invmes],[frecuped],[otrgas],[artlogistic],     [artpromo],[sinexis],[NoApliDcto],[IvaArtCto],[fecsys],[servidor],[codusumod],[codusu],[docdelete],[modificadoc],[UltQtyCmp],[ucasilla],    [uestante],[upasillo],[uzona],[pvfart],[pvgart],[pvhart],[invpto],[artlogisti]
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO
--Arnold Sandoval  A. 18/09/2020
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='ven_prefacdetalle' and ind.name='ven_prefacdetalle_idemp_codcto'
				) 
BEGIN
   CREATE NONCLUSTERED INDEX [ven_prefacdetalle_idemp_codcto]
   ON [dbo].[ven_prefacdetalle] ([idemp],[codcto])
   INCLUDE ([numcom])
END
GO

IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='ven_prefactura' and ind.name='ven_prefactura_codcto_numcon'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [ven_prefactura_codcto_numcon]
ON [dbo].[ven_prefactura] ([codcto],[numcon])
END
GO

--este indice se agrega para agilizar metodo para obtener prefacturas generadas en el día "no anuladas" en el servicio web para 
--mostrarse en el notificador de pedidos por la app móvil. Arnold Sandoval 02-10-2020

SET ANSI_PADDING ON
GO
if exists(select* from sys.indexes where name = 'ven_prefactura_codcto_fecpre_ubic_estpre')
  begin
   DROP INDEX ven_prefactura_codcto_fecpre_ubic_estpre ON ven_prefactura
  end

GO

CREATE NONCLUSTERED INDEX [ven_prefactura_codcto_fecpre_ubic_estpre] ON [dbo].[ven_prefactura]
(
	[codcto] ASC,
	[fecpre] ASC,
	[ubic] ASC,
	[estpre] ASC
)
INCLUDE([nitcli]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Indice agregado por Arnold Sandoval para que saliera reporte del kardex en el comanda    Script Date: 26/02/2021 9:54:39 a. m. ******/
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='alm_kardex' and ind.name='alm_kardex_idemp_codcto_estkar_docdelete'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [alm_kardex_idemp_codcto_estkar_docdelete] ON [dbo].[alm_kardex]
(
	[idemp] ASC,
	[codcto] ASC,
	[estkar] ASC,
	[docdelete] ASC
)
INCLUDE ( 	[numcon],
	[fecmov],
	[codcon],
	[traalm],
	[centra],
	[contra],
	[fecsys],
	[codusu]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO

/****** Indice agregado por Arnold Sandoval para que saliera reporte del kardex en el comanda    Script Date: 26/02/2021 9:56:15 a. m. ******/
IF NOT EXISTS (SELECT	object_name(cols.object_id) tabla ,ind.name indice 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
						cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
						object_name(cols.object_id) ='alm_kardex' and ind.name='alm_kardex_idemp_codcto_estkar_docdelete'
				) 
BEGIN
CREATE NONCLUSTERED INDEX [IX_alm_kardex_idemp_codcto_codcon_estkar_docdelete] ON [dbo].[alm_kardex]
(
	[idemp] ASC,
	[codcto] ASC,
	[codcon] ASC,
	[estkar] ASC,
	[docdelete] ASC
)
INCLUDE ( 	[numcon],
	[fecmov],
	[traalm],
	[centra],
	[contra],
	[fecsys],
	[codusu]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO