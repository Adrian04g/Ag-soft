--Verificar si existe llave primaria en ven_prefactura -  Arnold Sandoval A. 18/09/2020
IF not exists (Select * From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and left(constraint_name, 2) = 'PK')
   BEGIN
     alter table ven_prefactura add constraint PK_ven_prefactura primary key clustered (idemp, codcto, tipdoc, numpre)
	 print 'ven_prefactura - llave primaria creada'
   END
ELSE
   --validada su existencia verificar que este con los campos que debe tener
   BEGIN
 --Verifica que la idemp este dentro de la llave primaria de ven_prefactura
 IF not exists (Select * From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and T.COLUMN_NAME = 'idemp')
    BEGIN
	   Declare @NombrePK varchar(50) = (Select TOP(1) CONSTRAINT_NAME From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and LEFT(T.CONSTRAINT_NAME, 2) = 'PK')
	   Declare @sql varchar(max)= 'alter table ven_prefactura drop '+ @NombrePK	
       EXEC(@sql)
	   declare @_sql varchar(max) =  ('alter table ven_prefactura add constraint ' + @NombrePK + ' primary key clustered (idemp, codcto, tipdoc, numpre)')
	   EXEC(@_sql)
	   print 'ven_prefactura modificación de la llave primaria'
	END
 ELSE
   BEGIN
       IF not exists (Select * From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and T.COLUMN_NAME = 'tipdoc')
	   begin
	       Declare @NombrePK2 varchar(50) = (Select TOP(1) CONSTRAINT_NAME From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and LEFT(T.CONSTRAINT_NAME, 2) = 'PK')
	   Declare @sql2 varchar(max)= 'alter table ven_prefactura drop '+ @NombrePK2	
       EXEC(@sql2)
	   declare @_sql1 varchar(max) =  ('alter table ven_prefactura add constraint ' + @NombrePK2 + ' primary key clustered (idemp, codcto, tipdoc, numpre)')
	   EXEC(@_sql1)
	   print 'ven_prefactura modificación de la llave primaria'

	   end
    END
 END

 GO


update glb_almacen set item = 1 where codalm = '001'
update glb_almacen set item = 2 where codalm = '002'
update glb_almacen set item = 3 where codalm = '003'
update glb_almacen set servidor = 'SERVIDOR'
update alm_articulos set isenviado = '1'
update alm_grupos set servidor = 'SERVER'
update alm_articulos set servidor = 'SERVER'
update alm_inventario set sinexis = '0'
update glb_caja set servidor = 'SERVER'
update alm_kardex set undart2 = '' 
update alm_kardex set constante = 0



--LA SIGUIENTE LINEA SE hace para agregar el campo NroCopias, ya que el tipo de dato no corresponde, como el dato no tiene
--nada en la bd de deliloco lo que se hara es eliminar el campo y volverlo a crear.
ALTER TABLE [dbo].[alm_grupos] DROP CONSTRAINT [DF_alm_grupos_NroCopias_DF]
GO
ALTER TABLE [dbo].[alm_grupos] DROP CONSTRAINT [DF__alm_grupo__NroCo__0E3DE09F]
Go
ALTER TABLE [dbo].[alm_grupos] DROP COLUMN NroCopias
GO
ALTER TABLE [dbo].[alm_grupos] add [NroCopias] [decimal](10, 0) NULL
GO
ALTER TABLE [dbo].[alm_grupos] ADD  CONSTRAINT [DF_alm_grupos_NroCopias_DF]  DEFAULT ((0)) FOR [NroCopias]
GO
update alm_grupos set [NroCopias] = 0
GO
alter table ven_mesas add [apps] [bit] NOT NULL DEFAULT(0)
GO
alter table glb_barrio add [servidor] [nvarchar](60) NULL
GO
ALTER TABLE [dbo].[glb_barrio] ADD  CONSTRAINT [DF_glb_barrio_servidor]  DEFAULT ('SERVER') FOR [servidor]
GO
SET ANSI_NULLS ON
GO
alter table glb_parametros add urlnotificador VARCHAR(50) NULL
GO
update Glb_Parametros set urlnotificador = '127.0.0.1:50000'
GO
SET QUOTED_IDENTIFIER ON
GO
GO
update ven_parametros set nitvtactdo = '999999999' where codcto = '001'
GO

-------Script para crear mesero de la app.
exec sp_executesql N'SET NOCOUNT ON;
INSERT INTO [glb_terceros] ([nitter], [Codeudor], [Terinactivo], [act_eco], [apellido1], [apellido2], [arp], [barrio], [cedulafiad], [cedulafiad2], [cedulafiad3], [celfiad1], [celfiad2], [celfiad3], [celular], [cesantia], [ciiu], [ciuter], [civil], [clasiven], [cmpcree], [cmprfuente], [cmprica], [cmpriva], [codcargo], [codctoter], [codest], [codhobby], [codigo], [codpais], [codpro], [codprof], [codtipo], [codusu], [codusumod], [comporta], [conduc], [contac], [contacto], [cupo], [cupocre], [datacredito], [datacredito1], [datacredito2], [dctoter], [descrip], [diacobro1], [diacobro2], [diascart], [diasvenc], [diremp], [dirfiad1], [dirfiad2], [dirfiad3], [dirter], [dirter2], [divter], [docdelete], [dptoter], [empresa], [eps], [estado], [estrato], [fax], [fcobro], [fec_exp], [fecnac], [fecsys], [finicial], [guia], [hijos], [inicio_labora], [lista], [lugexp], [mail], [modificadoc], [montorf], [nit_empresa], [niv_est], [nombre1], [nombrefiad], [nombrefiad2], [nombrefiad3], [nomcom], [nomter], [nrotarjeta], [observater], [ocultaremi], [otros], [pension], [per_cargo], [poliza], [porcom], [porrecaudo], [porrefte], [porrica], [porriva], [puntos], [rApellido2], [rDirter], [rNitTer], [rNombre1], [rTelter], [rapellido1], [rcree], [rfuente], [rica], [riva], [rotros], [rtipid], [servidor], [sexo], [sueldo], [telemp], [telfiad1], [telfiad2], [telfiad3], [telter], [telter2], [terbloq], [tercli], [tercob], [tercon], [teremp], [terotr], [terpro], [terprof], [terven], [tip_contrato], [tipid], [tipter], [ucmvmcl], [upgomcl], [vendedor], [vrcuota], [vrinicial], [web], [zona], [zonapostal])
VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10, @p11, @p12, @p13, @p14, @p15, @p16, @p17, @p18, @p19, @p20, @p21, @p22, @p23, @p24, @p25, @p26, @p27, @p28, @p29, @p30, @p31, @p32, @p33, @p34, @p35, @p36, @p37, @p38, @p39, @p40, @p41, @p42, @p43, @p44, @p45, @p46, @p47, @p48, @p49, @p50, @p51, @p52, @p53, @p54, @p55, @p56, @p57, @p58, @p59, @p60, @p61, @p62, @p63, @p64, @p65, @p66, @p67, @p68, @p69, @p70, @p71, @p72, @p73, @p74, @p75, @p76, @p77, @p78, @p79, @p80, @p81, @p82, @p83, @p84, @p85, @p86, @p87, @p88, @p89, @p90, @p91, @p92, @p93, @p94, @p95, @p96, @p97, @p98, @p99, @p100, @p101, @p102, @p103, @p104, @p105, @p106, @p107, @p108, @p109, @p110, @p111, @p112, @p113, @p114, @p115, @p116, @p117, @p118, @p119, @p120, @p121, @p122, @p123, @p124, @p125, @p126, @p127, @p128, @p129, @p130, @p131, @p132, @p133, @p134, @p135, @p136, @p137, @p138);
',N'@p0 nvarchar(15),@p1 bit,@p2 bit,@p3 nvarchar(2),@p4 nvarchar(100),@p5 nvarchar(100),@p6 bit,@p7 nvarchar(3),@p8 nvarchar(15),@p9 nvarchar(15),@p10 nvarchar(15),@p11 nvarchar(15),@p12 
nvarchar(15),@p13 nvarchar(20),@p14 nvarchar(100),@p15 bit,@p16 decimal(1,0),@p17 nvarchar(20),@p18 nvarchar(40),@p19 nvarchar(2),@p20 nvarchar(3),@p21 nvarchar(3),@p22 nvarchar(3),@p23 
nvarchar(3),@p24 nvarchar(3),@p25 nvarchar(3),@p26 nvarchar(3),@p27 nvarchar(2),@p28 nvarchar(15),@p29 nvarchar(3),@p30 nvarchar(15),@p31 nvarchar(2),@p32 nvarchar(4),@p33 nvarchar(15),@p34 
nvarchar(15),@p35 nvarchar(4000),@p36 bit,@p37 nvarchar(60),@p38 nvarchar(60),@p39 decimal(1,0),@p40 decimal(1,0),@p41 bit,@p42 bit,@p43 bit,@p44 decimal(1,0),@p45 nvarchar(4000),@p46 
decimal(1,0),@p47 decimal(1,0),@p48 decimal(1,0),@p49 decimal(1,0),@p50 nvarchar(4000),@p51 nvarchar(60),@p52 nvarchar(60),@p53 nvarchar(60),@p54 nvarchar(60),@p55 nvarchar(60),@p56 
nvarchar(1),@p57 bit,@p58 nvarchar(2),@p59 nvarchar(50),@p60 bit,@p61 nvarchar(1),@p62 decimal(1,0),@p63 decimal(1,0),@p64 datetime2(7),@p65 datetime2(7),@p66 datetime2(7),@p67 
datetime2(7),@p68 datetime2(7),@p69 nvarchar(16),@p70 decimal(1,0),@p71 datetime2(7),@p72 decimal(1,0),@p73 nvarchar(40),@p74 nvarchar(60),@p75 decimal(1,0),@p76 decimal(1,0),@p77 
nvarchar(15),@p78 nvarchar(2),@p79 nvarchar(100),@p80 nvarchar(40),@p81 nvarchar(40),@p82 nvarchar(60),@p83 nvarchar(100),@p84 nvarchar(60),@p85 nvarchar(15),@p86 nvarchar(250),@p87 bit,@p88 
nvarchar(100),@p89 bit,@p90 decimal(1,0),@p91 bit,@p92 decimal(1,0),@p93 decimal(1,0),@p94 decimal(1,0),@p95 decimal(1,0),@p96 decimal(1,0),@p97 bit,@p98 nvarchar(100),@p99 
nvarchar(100),@p100 nvarchar(100),@p101 nvarchar(100),@p102 nvarchar(100),@p103 nvarchar(100),@p104 bit,@p105 bit,@p106 bit,@p107 bit,@p108 nvarchar(100),@p109 nvarchar(100),@p110 nvarchar(60),@p111 decimal(1,0),@p112 decimal(1,0),@p113 nvarchar(20),@p114 decimal(1,0),@p115 decimal(1,0),@p116 nvarchar(20),@p117 decimal(1,0),@p118 decimal(1,0),@p119 bit,@p120 bit,@p121 bit,@p122 bit,@p123 bit,@p124 bit,@p125 bit,@p126 bit,@p127 bit,@p128 nvarchar(2),@p129 nvarchar(2),@p130 decimal(1,0),@p131 decimal(1,0),@p132 datetime2(7),@p133 nvarchar(15),@p134 decimal(1,0),@p135 decimal(1,0),@p136 nvarchar(60),@p137 nvarchar(4),@p138 nvarchar(10)',@p0=N'1111111111',@p1=0,@p2=0,@p3=N'',@p4=N'WEB API',@p5=N'',@p6=0,@p7=N'',@p8=N'',@p9=N'',@p10=N'',@p11=N'',@p12=N'',@p13=N'',@p14=N'0',@p15=0,@p16=0,@p17=N'',@p18=N'',@p19=N'',@p20=N'',@p21=N'',@p22=N'',@p23=N'',@p24=N'',@p25=N'',@p26=N'',@p27=N'',@p28=N'',@p29=N'',@p30=N'',@p31=N'',@p32=N'',@p33=N'',@p34=N'',@p35=N'',@p36=0,@p37=N'',@p38=N'',@p39=0,@p40=0,@p41=0,@p42=0,@p43=0,@p44=0,@p45=N'',@p46=0,@p47=0,@p48=0,@p49=0,@p50=N'',@p51=N'',@p52=N'',@p53=N'',@p54=N'',@p55=N'',@p56=N'',@p57=0,@p58=N'',@p59=N'',@p60=0,@p61=N'',@p62=0,@p63=0,@p64='1900-01-01 00:00:00',@p65='1900-01-01 00:00:00',@p66='1899-12-30 00:00:00',@p67='2020-09-10 09:53:48.0235468',@p68='1900-01-01 00:00:00',@p69=N'',@p70=0,@p71='1900-01-01 00:00:00',@p72=0,@p73=N'',@p74=N'',@p75=0,@p76=0,@p77=N'',@p78=N'',@p79=N'MESERO',@p80=N'',@p81=N'',@p82=N'',@p83=N'',@p84=N'MESERO WEB API ',@p85=N'',@p86=N'',@p87=0,@p88=N'',@p89=0,@p90=0,@p91=0,@p92=0,@p93=0,@p94=0,@p95=0,@p96=0,@p97=0,@p98=N'',@p99=N'',@p100=N'',@p101=N'',@p102=N'',@p103=N'',@p104=0,@p105=0,@p106=0,@p107=0,@p108=N'',@p109=N'',@p110=N'',@p111=0,@p112=0,@p113=N'',@p114=0,@p115=0,@p116=N'',@p117=0,@p118=0,@p119=0,@p120=1,@p121=0,@p122=0,@p123=0,@p124=0,@p125=0,@p126=0,@p127=0,@p128=N'',@p129=N'13',@p130=3,@p131=0,@p132='1900-01-01 00:00:00',@p133=N'',@p134=0,@p135=0,@p136=N'',@p137=N'',@p138=N''

GO
update Glb_Parametros set verbd = '1111111111' where IdEmp = '001'
GO