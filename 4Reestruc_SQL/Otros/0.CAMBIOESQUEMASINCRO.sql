--begin
--ALTER TABLE ven_formapago DISABLE CHANGE_TRACKING;
--end
--go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_artxlote'
                     and column_name = 'Itemfacremi')
					 begin
					 alter table alm_artxlote add Itemfacremi NUMERIC (10,0) NOT NULL 
					 end
go--
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_tallasart'
                     and column_name = 'codigo'
					 and COLUMN_DEFAULT is null)
					 begin					 
                    ALTER TABLE [dbo].alm_tallasart ADD  DEFAULT ('') FOR codigo 
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_usuarios'
                     and column_name = 'OmitirTurno')
					 begin
alter table glb_usuarios add OmitirTurno BIT NOT NULL default ((0))
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'SYN_DATOSTRANSACCION'
                     and column_name = 'Email_STAT')
					 begin					 
alter table SYN_DATOSTRANSACCION add Email_STAT varchar(3) NOT NULL default ('PEN')
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'SYN_DATOSTRANSACCION'
                     and column_name = 'DSC_ERROR')
					 begin
alter table SYN_DATOSTRANSACCION add DSC_ERROR nvarchar(max) NOT NULL default ('')
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_facturas'
                     and column_name = 'codusu_edit')
					 begin
alter table ven_facturas add codusu_edit  nvarchar(10) NOT NULL default ('')
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_facturas'
                     and column_name = 'fecsys_edit')
					 begin					 
alter table ven_facturas add fecsys_edit  datetime NOT NULL default (getdate())
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_pdetalle'
                     and column_name = 'observaCancel')
					 begin					 
alter table ven_pdetalle  add observaCancel text NOT NULL  default ('') 
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'pro_formulas'
                     and column_name = 'codart')
					 begin				 
alter table pro_formulas  add codart nvarchar(10) not null default ('')
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_transaccion'
                     and column_name = 'prenfaccr')
					 begin				 
alter table glb_transaccion  add prenfaccr bit not null default ((0))
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_inventario'
                     and column_name = 'pvfart')
					 begin				 
alter table alm_inventario  add pvfart  decimal(18,4) not null default ((0))
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_inventario'
                     and column_name = 'pvgart')
					 begin				 
alter table alm_inventario  add pvgart  decimal(18,4) not null default ((0))
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_inventario'
                     and column_name = 'pvhart')
					 begin				 
alter table alm_inventario  add pvhart  decimal(18,4) not null default ((0))
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_kardex'
                     and column_name = 'fecsysconftra'
					 and COLUMN_DEFAULT='(getdate())')
					 begin					 
					 ALTER TABLE [dbo].[alm_kardex] ADD  DEFAULT (getdate()) FOR [fecsysconftra]
					 end
go--
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_unica'
                     and column_name = 'resempn'and IS_NULLABLE='YES' )
					 begin
					 update glb_unica set resempn=''  where resempn is null
 ALTER TABLE [dbo].glb_unica alter column resempn nvarchar(200) not null
 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_unica'
                     and column_name = 'resempn'
					 and COLUMN_DEFAULT='('''')')
					 begin
ALTER TABLE [dbo].[glb_unica] ADD  DEFAULT ('') FOR [resempN] 
end
end
go--
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'syn_datostransaccion'
                     and column_name = 'xm_dat_tran'
					 and DATA_TYPE ='xml')
					 begin
ALTER TABLE [dbo].[syn_datostransaccion] alter column xm_dat_tran nvarchar(max)
end
go--
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_grupos'
                     and column_name = 'NroCopias'
					 and DATA_TYPE <>'numeric')
					 begin
ALTER TABLE  [dbo].[alm_grupos]	 drop CONSTRAINT DF_alm_grupos_NroCopias
ALTER TABLE [dbo].[alm_grupos] alter column NroCopias numeric(10,0)
ALTER TABLE [dbo].[alm_grupos] ADD  CONSTRAINT [DF_alm_grupos_NroCopias]  DEFAULT ((0)) FOR [NroCopias]
end
go--
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_facdetalle '
                     and column_name = 'Valaju'
					 and DATA_TYPE <>'decimal')
					 begin
 ALTER TABLE  [dbo].[ven_facdetalle]	 drop CONSTRAINT DF_ven_facdetalle_valaju
 ALTER TABLE [dbo].[ven_facdetalle] alter column Valaju decimal(18,0) not null
 ALTER TABLE [dbo].[ven_facdetalle] ADD CONSTRAINT DF_ven_facdetalle_valaju DEFAULT ((0)) FOR Valaju 
end
go--
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_prefacdetalle '
                     and column_name = 'Valaju'
					 and DATA_TYPE <>'decimal')
					 begin
ALTER TABLE  [dbo].[ven_prefacdetalle]	 drop CONSTRAINT DF_ven_prefacdetalle_valaju
 ALTER TABLE [dbo].[ven_prefacdetalle] alter column Valaju decimal(18,0) not null
  ALTER TABLE [dbo].[ven_prefacdetalle] ADD CONSTRAINT DF_ven_prefacdetalle_valaju DEFAULT ((0)) FOR Valaju 
end
go--
if not exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_usuarios'
                     and column_name = 'pespecial3')
					 begin
					 alter table glb_usuarios add pespecial3 bit NOT NULL default (0)
					 end
go--
if not exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_usuarios'
                     and column_name = 'pespecial4')
					 begin
					 alter table glb_usuarios add pespecial4 bit NOT NULL default (0)
					 end
go--
if not exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_usuarios'
                     and column_name = 'pespecial5')
					 begin
					 alter table glb_usuarios add pespecial5 bit NOT NULL default (0)
					 end
go--

if not exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detarifas'
                     and column_name = 'idemp')
					 begin
					 alter table alm_detarifas add idemp nvarchar(3) NOT NULL default ('')
					 end
go--
if exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'GLB_TERCEROS '
                     and column_name = 'fecact'
					 and COLUMN_DEFAULT<>'(getdate())')
					 begin
					   ALTER TABLE [dbo].GLB_TERCEROS ADD CONSTRAINT DF_GLB_TERCEROS_fecact DEFAULT (getdate()) FOR fecact 
					 end
if exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'GLB_TERCEROS '
                     and column_name = 'fecingemp'
					 and COLUMN_DEFAULT<>'(getdate())')
					 begin
					   ALTER TABLE [dbo].GLB_TERCEROS ADD CONSTRAINT DF_GLB_TERCEROS_fecingemp DEFAULT (getdate()) FOR fecingemp 
					 end
if exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'GLB_TERCEROS '
                     and column_name = 'regimen'
					 and COLUMN_DEFAULT<>'('''')')
					 begin
					   ALTER TABLE [dbo].GLB_TERCEROS ADD CONSTRAINT DF_GLB_TERCEROS_regimen DEFAULT ('') FOR regimen 
					 end
if not exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_formapago'
                     and column_name = 'codcto'
					 and COLUMN_DEFAULT='('''')')
					 begin
					   ALTER TABLE [dbo].ven_formapago ADD CONSTRAINT DF_ven_formapago_codcto DEFAULT ('') FOR codcto 
					 end
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'con_comprobante'
                     and column_name = 'codcen'
					 and IS_NULLABLE='YES' )
					 begin
					 
					 update con_comprobante set codcen=''  where codcen is null
					 alter table con_comprobante ALTER COLUMN codcen nvarchar(3) not null 
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'con_comprobante'
                     and column_name = 'codcen'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 ALTER TABLE [dbo].con_comprobante ADD  DEFAULT ('') FOR codcen
					 end

					 end
go--
				
if not exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detinvfisicos'
                     and column_name = 'idinvfisicos'
					 and DATA_TYPE='numeric')
					 begin
					 Alter table alm_detinvfisicos drop CONSTRAINT DF_alm_detinvfisicos_idinvfisicos_DF
					 alter table alm_detinvfisicos alter column idinvfisicos numeric(10,0) not null
					 ALTER TABLE alm_detinvfisicos ALTER COLUMN idinvfisicos int NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detinvfisicos'
                     and column_name = 'idinvfisicos'
					 and COLUMN_DEFAULT='((0))')
					 begin
					 ALTER TABLE [dbo].alm_detinvfisicos ADD  CONSTRAINT DF_alm_detinvfisicos_idinvfisicos_DF  DEFAULT ((0)) FOR idinvfisicos
					 end
					 end
go--

if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_costos'
                     and column_name = 'idemp'
					 and IS_NULLABLE='YES')
					 begin
					 Alter table alm_costos drop CONSTRAINT DF_alm_costos_idemp_DF
					 ALTER TABLE alm_costos ALTER COLUMN idemp nvarchar(3) NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_costos'
                     and column_name = 'idemp'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 ALTER TABLE [dbo].alm_costos ADD  CONSTRAINT [DF_alm_costos_idemp_DF]  DEFAULT ('') FOR idemp
					 end
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_costos'
                     and column_name = 'codcosd'
					 and IS_NULLABLE='YES')
					 begin
					 Alter table alm_costos drop CONSTRAINT DF_alm_costos_codcosd
					 ALTER TABLE alm_costos ALTER COLUMN codcosd nvarchar(3) NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_costos'
                     and column_name = 'idemp'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 ALTER TABLE [dbo].alm_costos ADD  CONSTRAINT DF_alm_costos_codcosd  DEFAULT ('') FOR codcosd
					 end
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detarifas'
                     and column_name = 'idemp'
					 and IS_NULLABLE='YES')
					 begin
					 Alter table alm_detarifas drop CONSTRAINT DF_alm_detarifas_idemp_DF
					 ALTER TABLE alm_detarifas ALTER COLUMN idemp nvarchar(3) NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detarifas'
                     and column_name = 'idemp'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 ALTER TABLE [dbo].alm_detarifas ADD  CONSTRAINT [DF_alm_detarifas_idemp_DF]  DEFAULT ('') FOR idemp
					 end
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detarifas'
                     and column_name = 'codalm'
					 and IS_NULLABLE='YES')
					 begin
					 --Alter table alm_detarifas drop CONSTRAINT alm_detarifas_codalm
					 ALTER TABLE alm_detarifas ALTER COLUMN codalm nvarchar(3) NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detarifas'
                     and column_name = 'codalm'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 ALTER TABLE [dbo].alm_detarifas ADD  CONSTRAINT DF_alm_detarifas_codalm  DEFAULT ('') FOR codalm
					 end
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detarifas'
                     and column_name = 'codins'
					 and IS_NULLABLE='YES')
					 begin
					 --Alter table alm_detarifas drop CONSTRAINT DF_alm_detarifas_codins
					 ALTER TABLE alm_detarifas ALTER COLUMN codins nvarchar(8) NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detarifas'
                     and column_name = 'codins'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 ALTER TABLE [dbo].alm_detarifas ADD  CONSTRAINT DF_alm_detarifas_codins  DEFAULT ('') FOR codins
					 end
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_notas'
                     and column_name = 'item'
					 and IS_NULLABLE='YES')
					 begin
					 --Alter table alm_detarifas drop CONSTRAINT DF_com_notas_item
					 ALTER TABLE com_notas ALTER COLUMN item numeric(10,0) NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_notas'
                     and column_name = 'item'
					 and COLUMN_DEFAULT='((0))')
					 begin
					 ALTER TABLE [dbo].com_notas ADD  CONSTRAINT DF_com_notas_item  DEFAULT ((0)) FOR item
					 end
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_notas'
                     and column_name = 'idemp'
					 and COLUMN_DEFAULT is null)
					 begin
					 
					 ALTER TABLE [dbo].com_notas ADD  CONSTRAINT DF_com_notas_idemp  DEFAULT ('') FOR idemp
					
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_notas'
                     and column_name = 'codcto'
					 and COLUMN_DEFAULT is null)
					 begin
					 
					 ALTER TABLE [dbo].com_notas ADD  CONSTRAINT DF_com_notas_codcto  DEFAULT ('') FOR codcto
					
					 end
go--


if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_usuarios'
                     and column_name = 'pespecial3'
					 and IS_NULLABLE='YES')
					 begin
					 update glb_usuarios set pespecial3=0  where pespecial3 is null
					 ALTER TABLE glb_usuarios ALTER COLUMN pespecial3 bit NOT NULL
					 
					 end
go--
 
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_movpro'
                     and column_name = 'item'
					 and COLUMN_DEFAULT is null)
					 begin
					 update com_movpro set item=0  where item is null
					 alter table com_movpro  ADD  CONSTRAINT DF_com_movpro_item  DEFAULT ((0)) FOR item
					 end
go--

if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_terceros'
                     and column_name = 'fecact'
					 and COLUMN_DEFAULT is null)
					 begin
					 update glb_terceros set fecact=getdate()  where fecact is null
					 alter table glb_terceros  ADD  CONSTRAINT DF_glb_terceros_fecact DEFAULT (getdate()) FOR fecact
					 end
go--

if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_terceros'
                     and column_name = 'fecingemp'
					 and COLUMN_DEFAULT is null)
					 begin
					 update glb_terceros set fecingemp=getdate()  where fecingemp is null
					 alter table glb_terceros  ADD  CONSTRAINT DF_glb_terceros_fecingemp DEFAULT (getdate()) FOR fecingemp
					 end
go--

if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_terceros'
                     and column_name = 'fecharl'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 alter table glb_terceros drop constraint df_glb_terceros_fecharl
					 alter table glb_terceros  ADD  CONSTRAINT df_glb_terceros_fecharl DEFAULT (getdate()) FOR fecharl
					 end
go--

if exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'syn_publicaciones'
                     and column_name = 'codtabla')
					 begin
					 alter table syn_publicaciones drop constraint DF_SYN_PUBLICACIONES_codtabla
					 alter table syn_publicaciones drop column codtabla
					 end


if exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_movpro'
                     and column_name = 'idemp'
					 and COLUMN_DEFAULT is null)
					 begin
					 alter table com_movpro  ADD  CONSTRAINT df_com_movpro_idemp DEFAULT ('') FOR idemp
					 end
go--
if exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_movpro'
                     and column_name = 'codcto'
					 and COLUMN_DEFAULT is null)
					 begin
					 alter table com_movpro  ADD  CONSTRAINT df_com_movpro_codcto DEFAULT ('') FOR codcto
					 end
go--
if exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_movpro'
                     and column_name = 'doccom'
					 and COLUMN_DEFAULT is null)
					 begin
					 alter table com_movpro  ADD  CONSTRAINT df_com_movpro_doccom DEFAULT ('') FOR doccom
					 end
go--
if exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_movpro'
                     and column_name = 'tipdoc'
					 and COLUMN_DEFAULT is null)
					 begin
					 alter table com_movpro  ADD  CONSTRAINT df_com_movpro_tipdoc DEFAULT ('') FOR tipdoc
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ALM_ALIMFISICO'
                     and column_name = 'ANOINV'
					 and NUMERIC_PRECISION='4')
					 begin					 
					 alter table alm_alimfisico alter column anoinv decimal (4,0) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ALM_ALIMFISICO'
                     and column_name = 'mesinv'
					 and NUMERIC_PRECISION='2')
					 begin					 
					 alter table alm_alimfisico alter column mesinv decimal (2,0) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'Alm_kardex'
                     and column_name = 'codart'
					 and CHARACTER_MAXIMUM_LENGTH='10')
					 begin		
						drop index [<Name of Missing Index, sysname,>] on alm_kardex
						alter table Alm_kardex  alter column codart nvarchar(10) not null
						CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON [dbo].[alm_kardex]
						(
							[idemp] ASC,
							[codcto] ASC,
							[codart] ASC,
							[docdelete] ASC,
							[undart] ASC
						)
						INCLUDE ( 	[codcon],
							[qtyart]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
end 
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'Alm_kardex'
                     and column_name = 'codcon'
					 and CHARACTER_MAXIMUM_LENGTH='2')
					 begin	
					    drop index [<Name of Missing Index, sysname,>] on alm_kardex	
						alter table Alm_kardex  alter column codcon nvarchar(2) not null
						CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON [dbo].[alm_kardex]
						(
							[idemp] ASC,
							[codcto] ASC,
							[codart] ASC,
							[docdelete] ASC,
							[undart] ASC
						)
						INCLUDE ( 	[codcon],
							[qtyart]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'Alm_kardex'
                     and column_name = 'codcto'
					 and CHARACTER_MAXIMUM_LENGTH='3')
					 begin	
					    drop index [<Name of Missing Index, sysname,>] on alm_kardex	
						alter table Alm_kardex  alter column codcto nvarchar(3) not null
						CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON [dbo].[alm_kardex]
						(
							[idemp] ASC,
							[codcto] ASC,
							[codart] ASC,
							[docdelete] ASC,
							[undart] ASC
						)
						INCLUDE ( 	[codcon],
							[qtyart]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'Alm_kardex'
                     and column_name = 'idemp'
					 and CHARACTER_MAXIMUM_LENGTH='3')
					 begin	
					    drop index [<Name of Missing Index, sysname,>] on alm_kardex	
						alter table Alm_kardex  alter column idemp nvarchar(3) not null
						CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON [dbo].[alm_kardex]
						(
							[idemp] ASC,
							[codcto] ASC,
							[codart] ASC,
							[docdelete] ASC,
							[undart] ASC
						)
						INCLUDE ( 	[codcon],
							[qtyart]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_pagos'
                     and column_name = 'nitcli'
					 and CHARACTER_MAXIMUM_LENGTH='12')
					 begin	
					    set ansi_warnings off;
						alter table ven_pagos  alter column nitcli nvarchar(12) not null
						set ansi_warnings on;
						
end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'com_pordes'
                     and column_name = 'pordes'
					 and NUMERIC_PRECISION='10')
					 begin					 
					 alter table com_pordes alter column pordes decimal (10,2) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'con_mescierre'
                     and column_name = 'año'
					 and NUMERIC_PRECISION='4')
					 begin					 
					 alter table con_mescierre alter column año decimal (4,0) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'con_resolclientes'
                     and column_name = 'consec'
					 and NUMERIC_PRECISION='5')
					 begin					 
					 alter table con_resolclientes alter column consec decimal (5,0) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_accesos'
                     and column_name = 'item'
					 and NUMERIC_PRECISION='14')
					 begin					 
					 alter table glb_accesos  alter column item  decimal (14,2) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_mensual'
                     and column_name = 'añotran'
					 and NUMERIC_PRECISION='4')
					 begin					 
					 alter table glb_mensual   alter column añotran  decimal (4,0) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_menu'
                     and column_name = 'codigo'
					 and NUMERIC_PRECISION='3')
					 begin					 
					 alter table glb_menu   alter column codigo  decimal (3,0) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'tes_conciliacion'
                     and column_name = 'totbco'
					 and NUMERIC_PRECISION='14')
					 begin					 
					 alter table tes_conciliacion   alter column totbco  decimal (14,2) not null
					 end
go--
if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_prefacdetalle'
                     and column_name = 'item'
					 and NUMERIC_PRECISION='5')
					 begin					 
					 alter table ven_prefacdetalle   alter column item  decimal (5,0) not null
					 end
go--
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_Terceros'
                     and column_name = 'observater'
					 and IS_NULLABLE='YES')
					 begin
					 update glb_terceros set observater='' where observater is null
					 Alter table glb_Terceros drop CONSTRAINT DF_glb_Terceros_observater
					 ALTER TABLE glb_Terceros ALTER COLUMN observater nvarchar(250) NOT NULL
					 if not exists(select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_Terceros'
                     and column_name = 'observater'
					 and COLUMN_DEFAULT='('''')')
					 begin
					 ALTER TABLE [dbo].glb_Terceros ADD  CONSTRAINT DF_glb_Terceros_observater  DEFAULT ('''') FOR observater
					 end
					 end
go--



