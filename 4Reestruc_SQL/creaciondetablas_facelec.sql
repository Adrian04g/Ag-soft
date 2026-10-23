/****** Object:  Table [dbo].[fe_cargosdescuentos]    Script Date: 07/01/2020 11:46:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(Select * From dbo.sysobjects Where name='fe_cargosdescuentos')
drop table fe_cargosdescuentos
IF EXISTS(Select * From dbo.sysobjects Where name='FE_Cliente')
drop table FE_Cliente
IF EXISTS(Select * From dbo.sysobjects Where name='fe_destinatario')
drop table fe_destinatario
IF EXISTS(Select * From dbo.sysobjects Where name='fe_direccion')
drop table fe_direccion
IF EXISTS(Select * From dbo.sysobjects Where name='fe_documentoreferenciado')
drop table fe_documentoreferenciado
IF EXISTS(Select * From dbo.sysobjects Where name='fe_factura')
drop table fe_factura
IF EXISTS(Select * From dbo.sysobjects Where name='FE_FacturaDetalle')
drop table FE_FacturaDetalle
IF EXISTS(Select * From dbo.sysobjects Where name='fe_facturaimpuestos')
drop table fe_facturaimpuestos
IF EXISTS(Select * From dbo.sysobjects Where name='fe_impustostotales')
drop table fe_impustostotales
IF EXISTS(Select * From dbo.sysobjects Where name='fe_informacionlegalcliente')
drop table fe_informacionlegalcliente
IF EXISTS (Select * From dbo.sysobjects Where name='fe_mediopago')
drop table fe_mediopago
IF EXISTS(Select * From dbo.sysobjects Where name='fe_obligaciones')
drop table fe_obligaciones
IF EXISTS(Select * From dbo.sysobjects Where name='fe_tributos')
drop table fe_tributos


CREATE TABLE [dbo].[fe_cargosdescuentos](
	[IdEmp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipo] [nvarchar](2) NOT NULL,
	[numero] [nvarchar](10) NOT NULL,
	[item] [numeric](10, 0) NOT NULL,
	[codigo] [nvarchar](2) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[indicador] [nvarchar](1) NOT NULL,
	[monto] [nvarchar](21) NOT NULL,
	[montobase] [nvarchar](21) NOT NULL,
	[porcentaje] [nvarchar](8) NOT NULL,
	[secuencia] [nvarchar](3) NOT NULL,
	[secuenciadet] [nvarchar](4) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [IdEmp]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [codcto]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [tipo]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [numero]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ((0)) FOR [item]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [codigo]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [descripcion]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [indicador]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [monto]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [montobase]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [porcentaje]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  DEFAULT ('') FOR [secuencia]
GO

ALTER TABLE [dbo].[fe_cargosdescuentos] ADD  CONSTRAINT [DF_fe_cargosdescuentos_secuenciadet]  DEFAULT ('') FOR [secuenciadet]
GO


CREATE TABLE [dbo].[FE_Cliente](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[apellido] [nvarchar](50) NOT NULL DEFAULT (''),
	[nombrecomercial] [nvarchar](250) NOT NULL DEFAULT (''),
	[nombrerazonsocial] [nvarchar](250) NOT NULL DEFAULT (''),
	[notificar] [nvarchar](2) NOT NULL DEFAULT (''),
	[numerodocumento] [nvarchar](12) NOT NULL DEFAULT (''),
	[numeroidentificacionDV] [nvarchar](2) NOT NULL DEFAULT (''),
	[segundonombre] [nvarchar](50) NOT NULL DEFAULT (''),
	[telefono] [nvarchar](20) NOT NULL DEFAULT (''),
	[telefax] [nvarchar](20) NOT NULL DEFAULT (''),
	[tipoidentificacion] [nvarchar](2) NOT NULL DEFAULT (''),
	[tipopersona] [nvarchar](1) NOT NULL DEFAULT (''),
	[email] [nvarchar](200) NOT NULL DEFAULT ('')
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[fe_destinatario](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[canaldeentrega] [nvarchar](1) NOT NULL DEFAULT (''),
	[email] [nvarchar](250) NOT NULL DEFAULT (''),
	[nitproveedorreceptor] [nvarchar](6) NOT NULL DEFAULT (''),
	[telefono] [nvarchar](20) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[fe_direccion](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[ciudad] [nvarchar](50) NOT NULL DEFAULT (''),
	[codigodepartamento] [nvarchar](5) NOT NULL DEFAULT (''),
	[departamento] [nvarchar](50) NOT NULL DEFAULT (''),
	[direccion] [nvarchar](100) NOT NULL DEFAULT (''),
	[lenguaje] [nvarchar](2) NOT NULL DEFAULT (''),
	[municipio] [nvarchar](50) NOT NULL DEFAULT (''),
	[pais] [nvarchar](2) NOT NULL DEFAULT (''),
	[zonapostal] [nvarchar](10) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[fe_documentoreferenciado](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[codigoestatusdocumento] [nvarchar](1) NOT NULL DEFAULT (''),
	[codigointerno] [nvarchar](1) NOT NULL DEFAULT (''),
	[cufedocreferenciado] [nvarchar](200) NOT NULL DEFAULT (''),
	[descripcion] [nvarchar](250) NOT NULL DEFAULT (''),
	[fecha] [nvarchar](10) NOT NULL DEFAULT (''),
	[numerodocumento] [nvarchar](20) NOT NULL DEFAULT (''),
	[tipocufe] [nvarchar](11) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[fe_factura](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[contidaddecimales] [nvarchar](1) NOT NULL DEFAULT (''),
	[consecutivodocumento] [nvarchar](20) NOT NULL DEFAULT (''),
	[FechaEmision] [nvarchar](19) NOT NULL DEFAULT (''),
	[Fechafinperiodofacturacion] [nvarchar](19) NOT NULL DEFAULT (''),
	[Fechainicioperiodofacturacion] [nvarchar](19) NOT NULL DEFAULT (''),
	[Fechavencimiento] [nvarchar](19) NOT NULL DEFAULT (''),
	[informacionadicional] [nvarchar](max) NOT NULL DEFAULT (''),
	[moneda] [nvarchar](3) NOT NULL DEFAULT (''),
	[propina] [nvarchar](21) NOT NULL DEFAULT (''),
	[rangodenumeracion] [nvarchar](21) NOT NULL DEFAULT (''),
	[redondeoaplicado] [nvarchar](21) NOT NULL DEFAULT (''),
	[tipodocumento] [nvarchar](2) NOT NULL DEFAULT (''),
	[tipooperacion] [nvarchar](4) NOT NULL DEFAULT (''),
	[totalbaseimponible] [nvarchar](21) NOT NULL DEFAULT (''),
	[totalbrutoconimpuesto] [nvarchar](21) NOT NULL DEFAULT (''),
	[totalcargosaplicados] [nvarchar](21) NOT NULL DEFAULT (''),
	[totaldescuentos] [nvarchar](21) NOT NULL DEFAULT (''),
	[totalmonto] [nvarchar](21) NOT NULL DEFAULT (''),
	[totalproductos] [nvarchar](5) NOT NULL DEFAULT (''),
	[totalsinimpuestos] [nvarchar](21) NOT NULL DEFAULT (''),
	[estado] [nvarchar](1) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate()),
	[estelec] [int] NOT NULL DEFAULT ((0)),
	[docelec] [nvarchar](20) NOT NULL DEFAULT (''),
	[cufe] [nvarchar](100) NOT NULL DEFAULT (''),
	[fecelc] [nvarchar](20) NOT NULL DEFAULT (''),
	[mensaje] [nvarchar](max) NOT NULL DEFAULT (''),
	[resultado] [nvarchar](max) NOT NULL DEFAULT (''),
	[xml] [nvarchar](max) NOT NULL DEFAULT (''),
	[prefijo] [nvarchar](10) NOT NULL DEFAULT (''),
	[Rangoini] [nvarchar](10) NOT NULL DEFAULT (''),
	[qr] [nvarchar](max) NOT NULL DEFAULT (''),
	[tipocufe] [nvarchar](50) NOT NULL DEFAULT ('')
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO



CREATE TABLE [dbo].[fe_impustostotales](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[codigototalimp] [nvarchar](5) NOT NULL DEFAULT (''),
	[montototal] [nvarchar](21) NOT NULL DEFAULT (''),
	[fechavencimiento] [nvarchar](19) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate()),
	[secuenciadet] [nvarchar](4) NOT NULL CONSTRAINT [DF_fe_fe_impustostotales_secuenciadet]  DEFAULT ('')
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[FE_FacturaDetalle](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[cantidadreal] [nvarchar](6) NOT NULL DEFAULT (''),
	[cantidadrealunidadmedida] [nvarchar](6) NOT NULL DEFAULT (''),
	[cantidadunidades] [nvarchar](6) NOT NULL DEFAULT (''),
	[codigoproducto] [nvarchar](50) NOT NULL DEFAULT (''),
	[descripcion] [nvarchar](250) NOT NULL DEFAULT (''),
	[estandarcodigo] [nvarchar](3) NOT NULL DEFAULT (''),
	[estandarcodigoproducto] [nvarchar](3) NOT NULL DEFAULT (''),
	[nota] [nvarchar](100) NOT NULL DEFAULT (''),
	[preciototal] [nvarchar](21) NOT NULL DEFAULT (''),
	[preciototalsinimpuestos] [nvarchar](21) NOT NULL DEFAULT (''),
	[precioventaunitario] [nvarchar](21) NOT NULL DEFAULT (''),
	[secuencia] [nvarchar](4) NOT NULL DEFAULT (''),
	[unidadmedida] [nvarchar](3) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[fe_informacionlegalcliente](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[nombreregistrotrut] [nvarchar](250) NOT NULL DEFAULT (''),
	[numeroidentificacion] [nvarchar](15) NOT NULL DEFAULT (''),
	[numeroidentificaciondv] [nvarchar](2) NOT NULL DEFAULT (''),
	[tipoidentificacion] [nvarchar](2) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[fe_mediopago](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[fechavencimiento] [nvarchar](19) NOT NULL DEFAULT (''),
	[mediodepago] [nvarchar](2) NOT NULL DEFAULT (''),
	[metododepago] [nvarchar](2) NOT NULL DEFAULT (''),
	[numerodereferencia] [nvarchar](200) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[fe_obligaciones](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[obligaciones] [nvarchar](7) NOT NULL DEFAULT (''),
	[regimen] [nvarchar](2) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO



CREATE TABLE [dbo].[fe_tributos](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[codigoimpuesto] [nvarchar](2) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO



CREATE TABLE [dbo].[fe_facturaimpuestos](
	[IdEmp] [nvarchar](3) NOT NULL DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL DEFAULT (''),
	[tipo] [nvarchar](2) NOT NULL DEFAULT (''),
	[numero] [nvarchar](10) NOT NULL DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[baseimponibletotalimp] [nvarchar](21) NOT NULL DEFAULT (''),
	[codigototalimp] [nvarchar](5) NOT NULL DEFAULT (''),
	[controlinterno] [nvarchar](1) NOT NULL DEFAULT (''),
	[porcentajetotalimp] [nvarchar](5) NOT NULL DEFAULT (''),
	[unidadmedida] [nvarchar](5) NOT NULL DEFAULT (''),
	[unidadmedidatributo] [nvarchar](5) NOT NULL DEFAULT (''),
	[valortotalimp] [nvarchar](21) NOT NULL DEFAULT (''),
	[valortritutounidad] [nvarchar](21) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate()),
	[secuenciadet] [nvarchar](4) NOT NULL CONSTRAINT [DF_FE_FacturaImpuestos_secuenciadet]  DEFAULT ('')
) ON [PRIMARY]

GO
