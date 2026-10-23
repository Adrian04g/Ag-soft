--Estas modificaciones se hacen para la integracion con Rappi -- Arnold Sandoval Arellano 22/10/2020

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_variantes' AND T.COLUMN_NAME = 'maxQty')
   alter table alm_variantes add maxQty int NOT NULL DEFAULT (1)
   print 'alm_variantes - maxQty'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_variantes' AND T.COLUMN_NAME = 'minQty')
  alter table alm_variantes add minQty int NOT NULL DEFAULT (1)
   print 'alm_variantes - minQty'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_variantes' AND T.COLUMN_NAME = 'sortingposition')
  alter table alm_variantes add sortingposition int NOT NULL DEFAULT (0)
   print 'alm_variantes - sortingposition'
GO

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_variantes' AND T.COLUMN_NAME = 'stockrappi')
  alter table alm_variantes add stockrappi nvarchar(20) NOT NULL DEFAULT ('AVAILABLE')
  GO
  alter table alm_variantes add constraint CH_alm_variantes_StockRappi CHECK (stockrappi IN ('AVAILABLE','UNAVAILABLE'))
   print 'alm_variantes - stockrappi'
GO
IF not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_variantes' AND T.COLUMN_NAME = 'sinprecio')
  BEGIN
     alter table alm_variantes add sinprecio bit DEFAULT(1) NOT NULL
  END
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'stockrappi')
  alter table alm_articulos add stockrappi nvarchar(20) NOT NULL DEFAULT ('AVAILABLE')
  GO
  alter table alm_articulos add constraint CH_alm_articulos_Stock CHECK (stockrappi IN ('AVAILABLE','UNAVAILABLE'))
   print 'alm_articulos - stockrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'sortingposition')
  alter table alm_articulos add sortingposition int NOT NULL DEFAULT (0)
   print 'alm_articulos - sortingposition'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'maxLimit')
  alter table alm_articulos add maxLimit int NOT NULL DEFAULT (1)
   print 'alm_articulos - maxLimit'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'archivofoto')
  alter table alm_articulos add archivofoto nvarchar(50) NOT NULL DEFAULT ('')
   print 'alm_articulos - archivofoto'
GO

if not exists (select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'codartrppi')
   BEGIN
     alter table alm_articulos add codartrppi nvarchar(10) NOT NULL DEFAULT ('')
	 print 'alm_articulos - codartrppi'
   END
GO
if not exists (select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'codartasociad')
   BEGIN
     alter table alm_articulos add codartasociad nvarchar(10) NOT NULL DEFAULT ('')
	 print 'alm_articulos - codartasociad '
   END
GO
if not exists (select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'descrppi')
   BEGIN
     alter table alm_articulos add descrppi nvarchar(40) NOT NULL DEFAULT ('')
	 print 'alm_articulos - descrppi '
   END
GO
if not exists (select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'descrlargappi')
   BEGIN
     alter table alm_articulos add descrlargappi nvarchar(150) NOT NULL DEFAULT ('')
	 print 'alm_articulos - descrlargappi '
   END
GO

if not exists(select* from sys.indexes where name = 'IX_alm_articulos_codartrppi' AND object_id = OBJECT_ID('alm_articulos'))
  BEGIN
   CREATE NONCLUSTERED INDEX [IX_alm_articulos_codartrppi] ON [dbo].[alm_articulos] ([codartrppi])
   print 'alm_articulos - IX_alm_articulos_codartrppi '
  END
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_lineas' AND T.COLUMN_NAME = 'maxQty')
   alter table alm_lineas add maxQty int NOT NULL DEFAULT (0)
   print 'alm_lineas - maxQty'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_lineas' AND T.COLUMN_NAME = 'sortingposition')
   alter table alm_lineas add sortingposition int NOT NULL DEFAULT (0)
   print 'alm_lineas - sortingposition'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_lineas' AND T.COLUMN_NAME = 'minQty')
  alter table alm_lineas add minQty int NOT NULL DEFAULT (0)
   print 'alm_lineas - minQty'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'urlftpfotos')
  alter table glb_parametros add urlftpfotos nvarchar(max) NOT NULL DEFAULT ('')
   print 'glb_parametros - urlftpfotos'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'userftpfotos')
  alter table glb_parametros add userftpfotos nvarchar(50) NOT NULL DEFAULT ('')
   print 'glb_parametros - userftpfotos'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'passftpfotos')
  alter table glb_parametros add passftpfotos nvarchar(50) NOT NULL DEFAULT ('')
   print 'glb_parametros - passftpfotos'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'rutawebfotos')
  alter table glb_parametros add rutawebfotos nvarchar(200) NOT NULL DEFAULT ('')
   print 'glb_parametros - rutawebfotos'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'carpetafotos')
  alter table glb_parametros add carpetafotos nvarchar(max) NOT NULL DEFAULT ('')
   print 'glb_parametros - carpetafotos'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'foto')
  alter table alm_articulos add foto varbinary(max) NULL 
   print 'alm_articulos - foto'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'showrappi')
  alter table alm_articulos add showrappi bit NOT NULL DEFAULT(1)
   print 'alm_articulos - showrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'clientIdrappi')
  alter table glb_parametros add clientIdrappi varchar(max) NOT NULL DEFAULT('')
   print 'glb_parametros - clientIdrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'clientSecretrappi')
  alter table glb_parametros add clientSecretrappi varchar(max) NOT NULL DEFAULT('')
   print 'glb_parametros - clientSecretrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'audiencialogin')
  alter table glb_parametros add audiencialogin varchar(max) NOT NULL DEFAULT('')
   print 'glb_parametros - audiencialogin'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'apiloginrappi')
  alter table glb_parametros add apiloginrappi varchar(max) NOT NULL DEFAULT('')
   print 'glb_parametros - apiloginrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'tokenrappi')
  alter table glb_parametros add tokenrappi varchar(max) NOT NULL DEFAULT('')
   print 'glb_parametros - tokenrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'exptokenrappi')
  alter table glb_parametros add exptokenrappi smalldatetime NOT NULL DEFAULT('19000101')
   print 'glb_parametros - exptokenrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'valideztoken')
  alter table glb_parametros add valideztoken int NOT NULL DEFAULT(0)
   print 'glb_parametros - valideztoken'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'endpointrappi')
  alter table glb_parametros add endpointrappi varchar(max) NOT NULL DEFAULT('')
   print 'glb_parametros - endpointrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'urlpublicapi')
  alter table glb_parametros add urlpublicapi varchar(max) NOT NULL DEFAULT('')
   print 'glb_parametros - urlpublicapi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'ctorppi')
  alter table glb_parametros add ctorppi varchar(03) NOT NULL DEFAULT('')
   print 'glb_parametros - ctorppi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_almacen' AND T.COLUMN_NAME = 'idrappi')
  alter table glb_almacen add idrappi varchar(100) NOT NULL DEFAULT('')
   print 'glb_almacen - idrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_variantes' AND T.COLUMN_NAME = 'idrappi')
  alter table alm_variantes add idrappi varchar(100) NOT NULL DEFAULT('')
   print 'alm_variantes - idrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_almacen' AND T.COLUMN_NAME = 'fechapubrappi')
  alter table glb_almacen add fechapubrappi smalldatetime NOT NULL DEFAULT('19000101')
   print 'glb_almacen - fechapubrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_almacen' AND T.COLUMN_NAME = 'fechasincrappi')
  alter table glb_almacen add fechasincrappi smalldatetime NOT NULL DEFAULT('19000101')
   print 'glb_almacen - fechasincrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'idrappi')
  alter table alm_articulos add idrappi nvarchar(20) NOT NULL DEFAULT('')
   print 'alm_articulos - idrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'medpagrappi')
  alter table glb_parametros add medpagrappi nvarchar(4) NOT NULL DEFAULT('')
   print 'glb_parametros - medpagrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_parametros' AND T.COLUMN_NAME = 'nitconsrappi')
  alter table ven_parametros add nitconsrappi nvarchar(20) NOT NULL DEFAULT('4444444444444')
   print 'ven_parametros - nitconsrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'tmpactrappi')
  alter table glb_parametros add tmpactrappi int NOT NULL DEFAULT(3)
   print 'glb_parametros - tmpactrappi'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'tmprechordrappi')
  alter table glb_parametros add tmprechordrappi int NOT NULL DEFAULT(2)
   print 'glb_parametros - tmprechordrappi'
GO
IF EXISTS (select* from sys.sysindexes where name = 'alm_articulos.alm_articulos_showrappi')
BEGIN
   DROP INDEX alm_articulos.alm_articulos_showrappi
END
GO
CREATE NONCLUSTERED INDEX [alm_articulos_showrappi]
ON [dbo].[alm_articulos] ([showrappi])

GO
IF EXISTS (select* from sys.sysindexes where name = 'alm_articulos.alm_articulos_idrappi')
BEGIN
  DROP INDEX alm_articulos.alm_articulos_idrappi
END
GO
CREATE NONCLUSTERED INDEX [alm_articulos_idrappi]
ON [dbo].[alm_articulos] ([idrappi])

GO
--este campos se creó para las pruebas con rappi, evaluar la posibilidad de conservarlo

alter table alm_articulos add urlfoto nvarchar(200) NOT NULL DEFAULT('')
GO

--tablas ven_rppi_subitems
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_rppi_encabezado')
   BEGIN
CREATE TABLE [dbo].[ven_rppi_encabezado](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[fecorden] [date] NOT NULL,
	[order_id] [nvarchar](20) NOT NULL,
	[created_at] [date] NOT NULL,	
	[cooking_time] [numeric](18,4) NOT NULL DEFAULT (''),
	[min_cooking_time] [numeric](18,4) NOT NULL DEFAULT (''),
	[max_cooking_time] [numeric](18,4) NOT NULL DEFAULT (''),	
	[delivery_method] [nvarchar](20) NOT NULL DEFAULT (''),
	[payment_method] [nvarchar](5) NOT NULL DEFAULT (''),
	[address][nvarchar](100) NOT NULL DEFAULT (''),
	[billing_type] [nvarchar](20) NOT NULL DEFAULT (''),
	[document_number] [nvarchar](30) NOT NULL DEFAULT (''),
	[document_type] [nvarchar](5) NOT NULL DEFAULT (''),
	[email] nvarchar(100) NOT NULL DEFAULT (''),
	[name] nvarchar(100) NOT NULL DEFAULT (''),
	[phone] nvarchar(40) NOT  NULL DEFAULT (''),
	[total_products_with_discount] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_products_without_discount] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_other_discounts] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_order] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_to_pay] [numeric](18,4) NOT NULL DEFAULT (''),
	[shipping] [numeric](18,4) NOT NULL DEFAULT (''),
	[service_fee] [numeric](18,4) NOT NULL DEFAULT (''),
	[tip] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_rappi_pay] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_rappi_credits] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_percentage_discount] [numeric](18,4) NOT NULL DEFAULT (''),
	[total_value_discount] [numeric](18,4) NOT NULL DEFAULT (''),
	[first_name] [nvarchar](60) NOT NULL DEFAULT (''),
	[last_name] [nvarchar](60) NOT NULL DEFAULT (''),
	[phone_number] [nvarchar](60) NOT NULL DEFAULT (''),
	[user_type] [nvarchar](20) NOT NULL,
	[internal_id] [nvarchar](30) NOT NULL DEFAULT (''),
	[external_id] [nvarchar](30) NOT NULL DEFAULT (''),
	[secondary_street_quadran] [nvarchar](40) NOT NULL DEFAULT (''),
    [complete_direction] [nvarchar](100) NOT NULL DEFAULT (''),
    [city] [nvarchar](60) NOT NULL DEFAULT (''),
    [meter] [nvarchar](60) NOT NULL DEFAULT (''),
    [secondary_street_number] [nvarchar](60) NOT NULL DEFAULT (''),
    [neighborhood] [nvarchar](60) NOT NULL DEFAULT (''),
    [main_street_type] [nvarchar](40) NOT NULL DEFAULT (''),
    [postal_code] [nvarchar](40) NOT NULL DEFAULT (''),
    [main_street_quadrant] [nvarchar](40) NOT NULL DEFAULT (''),
    [main_street_number] [nvarchar](40) NOT NULL DEFAULT (''),
	[venprefactura] [nvarchar](8) NULL DEFAULT (''),
	[state] [nvarchar](60) NULL DEFAULT (''),
	[ubic] [nvarchar](30) NULL DEFAULT (''),
	[fecsys][datetime] NOT NULL DEFAULT(getdate()) 
CONSTRAINT [PK_ven_rppi_encabezado] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[fecorden] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


END
--tabla ven_rppi_subitems
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_rppi_items')
   BEGIN
/****** Object:  Table [dbo].[ven_rppi_subitems]    Script Date: 22/12/2020 12:39:47 p. m. ******/


CREATE TABLE [dbo].[ven_rppi_items](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[fecorden] [date] NOT NULL,
	[order_id] [nvarchar](20) NOT NULL,
	[item] [numeric](10,0) NOT NULL,
	[created_at] [date] NOT NULL,	
    [sku] [nvarchar](10) NOT NULL DEFAULT (''),	
	[id] [nvarchar](20) NOT NULL DEFAULT (''),	
	[name] [nvarchar](100) NOT NULL DEFAULT (''),	
	[type] [nvarchar](60) NOT NULL DEFAULT (''),	
	[comments] [nvarchar](300) NOT NULL DEFAULT (''),
	[unit_price_with_discount] [numeric](18,4) NOT NULL DEFAULT (0),
	[unit_price_without_discount] [numeric](18,4) NOT NULL DEFAULT (0),
	[percentage_discount] [numeric](18,4) NOT NULL DEFAULT (0),
	[quantity] [numeric](18,4) NOT NULL DEFAULT (0),
CONSTRAINT [PK_ven_rppi_items] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[fecorden] ASC,
	[order_id] ASC,
	[item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


END
--tabla subitems
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_rppi_subitems')
  BEGIN
/****** Object:  Table [dbo].[ven_rppi_subitems]    Script Date: 22/12/2020 12:39:47 p. m. ******/


CREATE TABLE [dbo].[ven_rppi_subitems](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[fecorden] [date] NOT NULL,
	[order_id] [nvarchar](20) NOT NULL,	
	[item] [numeric](10,0) NOT NULL,
	[subitem] [numeric](10,0) NOT NULL,
	[created_at] [date] NOT NULL,
    [sku] [nvarchar](10) NOT NULL DEFAULT (''),	
	[id] [nvarchar](20) NOT NULL DEFAULT (''),			
	[type] [nvarchar](60) NOT NULL DEFAULT (''),		
	[unit_price_with_discount] [numeric](18,4) NOT NULL DEFAULT (0),
	[unit_price_without_discount] [numeric](18,4) NOT NULL DEFAULT (0),
	[percentage_discount] [numeric](18,4) NOT NULL DEFAULT (0),
	[quantity] [numeric](18,4) NOT NULL DEFAULT (0)
CONSTRAINT [PK_ven_rppi_subitems] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[fecorden] ASC,	
	[order_id] ASC,
	[item] ASC,
	[subitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

if not exists(select* from INFORMATION_SCHEMA.TABLES T where T.TABLE_NAME = 'ven_rppi_webhook')
BEGIN
CREATE TABLE [dbo].[ven_rppi_webhook](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[storageId] nvarchar(20) NOT NULL,
	[evento] [nvarchar](50) NOT NULL,
	[endpoint] [nvarchar](200) NOT NULL,	
	[secret] [nvarchar](200) NOT NULL,
	[fechaconfig] [datetime] NOT NULL
CONSTRAINT [PK_ven_rppi_webhook] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[storageId] ASC,
	[evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
if not exists(select* from INFORMATION_SCHEMA.TABLES T where T.TABLE_NAME = 'ven_rppi_categoriavariantes')
BEGIN
CREATE TABLE [dbo].[ven_rppi_categoriavariantes](
	[codcat] [int] IDENTITY(1, 1),
	[nomcat] [nvarchar](200) NULL
 CONSTRAINT [PK_ven_rppi_categoriavariantes] PRIMARY KEY CLUSTERED 
(
	[codcat] ASC	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO