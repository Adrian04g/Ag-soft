if  not exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_artxlote'
                     and column_name = 'Itemfacremi')
					 begin
					 alter table alm_artxlote add Itemfacremi NUMERIC (10,0) NOT NULL 
					 end
go--
--if  not exists (select * from INFORMATION_SCHEMA.columns where
--                     table_name = 'con_comprobante'
--                     and column_name = 'Id_row')
--					 begin
--alter table con_comprobante add Id_row NUMERIC (10,0) identity (1,1) NOT NULL 
--					 end
--go--
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
--if  not exists (select * from INFORMATION_SCHEMA.columns where
--                     table_name = 'pro_formulas'
--                     and column_name = 'item2')
--					 begin
--alter table pro_formulas add item2 NUMERIC (10,0) NOT NULL default((0))
--					 end
--go--

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
-- if not exists (select * from SYN_TABLASPUBLICACION where CodPublicacion='Maestros' and CodTabla='glb_almacen')
--					 begin
--insert into SYN_TABLASPUBLICACION values('Maestros','glb_almacen',default,1,GETDATE(),'AUTO','ERRORES','SERVIDOR',1)
--					 end
--go--
if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_facdetalle '
                     and column_name = 'Valaju'
					 and DATA_TYPE <>'decimal')
					 begin
 ALTER TABLE  [dbo].[ven_facdetalle]	 drop CONSTRAINT DF__ven_facde__valaj
 ALTER TABLE [dbo].[ven_facdetalle] alter column Valaju decimal(18,0) not null
 ALTER TABLE [dbo].[ven_facdetalle] ADD CONSTRAINT DF__ven_facde__valaj DEFAULT ((0)) FOR Valaju 
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
--select TOP 1 name from sys.objects where parent_object_id = 274100017 and type='D' and name like '%Df_alm_grupos_NroCopias'


--SELECT OBJECT_ID('PARRILLA.dbo.ALM_GRUPOS') AS 'Object ID'; 


--ALTER TABLE  [dbo].pro_formulas	 drop CONSTRAINT DF__pro_formu__item2__15830867
--alter table pro_formulas drop column item2
--alter table con_comprobante drop column id_row
select * from SYN_TABLASPUBLICACION