if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'alm_kardex'
                     and column_name = 'fecsysconftra'
					 and IS_NULLABLE='YES' )
					 begin
					 
					 --update alm_kardex set fecsysconftra=getdate()  where fecsysconftra is null
					 --alter table alm_kardex ALTER COLUMN fecsysconftra date not null 
					 
					 ALTER TABLE [dbo].[alm_kardex] ADD  DEFAULT (getdate()) FOR [fecsysconftra]

					 end

if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'glb_unica'
                     and column_name = 'resempn'
					 and IS_NULLABLE='YES' )
					 begin
					 --update glb_unica set resempn=''  where resempn is null
					 alter table glb_unica ALTER COLUMN resempn nvarchar(200) not null 
					 
					 end

if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_facturas'
                     and column_name = 'cosaju'
					 and IS_NULLABLE='YES' )
					 begin
					 --select * from ven_facturas where cosaju is null
					 --update ven_facturas set cosaju=''  where cosaju is null
					 alter table ven_facturas ALTER COLUMN cosaju decimal(18,0) not null 
					 end

if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_facdetalle'
                     and column_name = 'valaju'
					 and IS_NULLABLE='YES' )
					 begin
					 --update ven_facdetalle set valaju=''  where valaju is null
					 alter table ven_facdetalle ALTER COLUMN valaju float not null 
					 end

if  exists (select * from INFORMATION_SCHEMA.columns where
                     table_name = 'ven_prefacdetalle'
                     and column_name = 'valaju'
					 and IS_NULLABLE='YES' )
					 begin
					 --update ven_prefacdetalle set valaju=''  where valaju is null
					 alter table ven_prefacdetalle ALTER COLUMN valaju float not null 
					 end