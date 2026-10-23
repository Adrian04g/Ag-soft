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
					
if  exists ( select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_detinvfisicos'
                     and column_name = 'idinvfisicos'
					 and DATA_TYPE='numeric')
					 begin
					 Alter table alm_detinvfisicos drop CONSTRAINT DF_alm_detinvfisicos_idinvfisicos_DF
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