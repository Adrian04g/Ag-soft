--TABLAS FACTURACION ELECTRONICA  
IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FECliente')
begin 
CREATE TABLE [dbo].[Ven_FECliente](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[apellido]				[nvarchar](50)	NOT NULL DEFAULT '',
	[ciudad]				[nvarchar](50)	NOT NULL DEFAULT '',
	[departamento]			[nvarchar](50)	NOT NULL DEFAULT '',
	[direccion]				[nvarchar](100) NOT NULL DEFAULT '',
	[email]					[nvarchar](200) NOT NULL DEFAULT '',
	[nombrerazonsocial]		[nvarchar](100) NOT NULL DEFAULT '',
	[notificar]				[nvarchar](2)	NOT NULL DEFAULT '',
	[numerodocumento]		[nvarchar](13)	NOT NULL DEFAULT '', 
	[pais]					[nvarchar](2)	NOT NULL DEFAULT '',
	[referencia2]			[nvarchar](50)	NOT NULL DEFAULT '',
	[regimen]				[nvarchar](1)	NOT NULL DEFAULT '',
	[segundonombre]			[nvarchar](50)	NOT NULL DEFAULT '',
	[subdivision]			[nvarchar](50)	NOT NULL DEFAULT '',
	[telefono]				[nvarchar](50)	NOT NULL DEFAULT '',
	[tipoidentificacion]	[nvarchar](2)	NOT NULL DEFAULT '',
	[tipopersona]			[nvarchar](1)	NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FEFactura')
begin 
CREATE TABLE [dbo].[Ven_FEFactura](
	[IdEmp]								[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]							[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]								[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]							[nvarchar](10)	NOT NULL DEFAULT '',
	[consecutivodocumento]				[nvarchar](20)	NOT NULL DEFAULT '',
	[consecutivodocumentomodificado]	[nvarchar](20)	NOT NULL DEFAULT '',
	[EstadoPago]						[nvarchar](1)	NOT NULL DEFAULT '',
	[FechaEmision]						[nvarchar](19)	NOT NULL DEFAULT '',
	[FechaEmisiondocumentomodificado]	[nvarchar](19)	NOT NULL DEFAULT '',
	[Fechavencimiento]					[nvarchar](19)	NOT NULL DEFAULT '',
	[icoterms]							[nvarchar](3)	NOT NULL DEFAULT '',
	[importetotal]						[nvarchar](21)	NOT NULL DEFAULT '',
	[informacionadicional]				[nvarchar](max)	NOT NULL DEFAULT '',
	[mediopago]						[nvarchar](2)	NOT NULL DEFAULT '',
	[moneda]							[nvarchar](3)	NOT NULL DEFAULT '',
	[motivonota]						[nvarchar](1)	NOT NULL DEFAULT '',
	[propina]							[nvarchar](21)	NOT NULL DEFAULT '',
	[rangodenumeracion]					[nvarchar](21)	NOT NULL DEFAULT '',
	[tipodocumento]						[nvarchar](2)	NOT NULL DEFAULT '',
	[totaldescuentos]					[nvarchar](21)	NOT NULL DEFAULT '',
	[totalsinimpuestos]					[nvarchar](21)	NOT NULL DEFAULT '',
	[uuiddocumentomodificado]			[nvarchar](40)	NOT NULL DEFAULT '',
	[estado]							[nvarchar](1)	NOT NULL DEFAULT '',
	[fecsys]							[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FEFacturaImpuestos')
begin 
CREATE TABLE [dbo].[Ven_FEFacturaImpuestos](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[baseimponibletotalimp]	[nvarchar](21)	NOT NULL DEFAULT '',
	[codigototalimp]		[nvarchar](2)	NOT NULL DEFAULT '',
	[controlinterno]		[nvarchar](3)	NOT NULL DEFAULT '',
	[Porcentajetotalimp]	[nvarchar](5)	NOT NULL DEFAULT '',
	[valortotalimp]			[nvarchar](21)	NOT NULL DEFAULT '',
	[fecsys]				[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FEFacturaDetalle')
begin 
CREATE TABLE [dbo].[Ven_FEFacturaDetalle](
	[IdEmp]						[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]					[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]						[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]					[nvarchar](10)	NOT NULL DEFAULT '',
	[cantidadunidades]			[nvarchar](14)	NOT NULL DEFAULT '',
	[codigoproducto]			[nvarchar](20)	NOT NULL DEFAULT '',
	[descripcion]				[nvarchar](100)	NOT NULL DEFAULT '',
	[descuento]					[nvarchar](21)	NOT NULL DEFAULT '',
	[detalleadicionalnombre]	[nvarchar](200)	NOT NULL DEFAULT '',
	[detalleadicionalvalor]		[nvarchar](200)	NOT NULL DEFAULT '',
	[baseimponibletotalimp]		[nvarchar](21)	NOT NULL DEFAULT '',
	[codigototalimp]			[nvarchar](2)	NOT NULL DEFAULT '',
	[controlinterno]			[nvarchar](3)	NOT NULL DEFAULT '',
	[porcentajetotalimp]		[nvarchar](5)	NOT NULL DEFAULT '',
	[valortotalimp]				[nvarchar](21)	NOT NULL DEFAULT '',
	[preciototal]				[nvarchar](21)	NOT NULL DEFAULT '',
	[preciototalsinimpuestos]	[nvarchar](21)	NOT NULL DEFAULT '',
	[precioventaunitario]		[nvarchar](21)	NOT NULL DEFAULT '',
	[seriales]					[nvarchar](max)	NOT NULL DEFAULT '',
	[unidadmedida]				[nvarchar](50)	NOT NULL DEFAULT '',
	[fecsys]					[datetime]		NOT NULL DEFAULT getdate()

)
end 
GO

IF NOT EXISTS (Select * From dbo.sysobjects Where name='Glb_Parametros')
begin
	CREATE TABLE Glb_Parametros (	 coincidayu		Bit	NOT NULL DEFAULT 0
									,salirvta		Bit	NOT NULL DEFAULT 0
									,impcontable	Bit	NOT NULL DEFAULT 0
									,gppais			nVarChar(3) NOT NULL DEFAULT ''
									,gpdpto			nVarChar(3) NOT NULL DEFAULT ''
									,gpciudad		nVarChar(3) NOT NULL DEFAULT '')
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_parametros' AND Temp.column_name = 'tokenE') 
begin	
	Alter Table glb_parametros Add tokenE nvarchar(200) Not Null Default ''
	Print 'glb_parametros - tokenE  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_parametros' AND Temp.column_name = 'tokenA') 
begin	
	Alter Table glb_parametros Add tokenA nvarchar(200) Not Null Default ''
	Print 'glb_parametros - tokenA  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_parametros' AND Temp.column_name = 'urlfac') 
begin	
	Alter Table glb_parametros Add urlfac nvarchar(200) Not Null Default ''
	Print 'glb_parametros - urlfac  ' 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_parametros' AND Temp.column_name = 'rutafacelec') 
begin	
	Alter Table glb_parametros Add rutafacelec nvarchar(200) Not Null Default ''
	Print 'glb_parametros - rutafacelec  ' 
end 
Go


IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'estado')  
begin 
	Alter Table Ven_FEFactura	add estado NVARCHAR(1) not null default ''
	Print 'Ven_FEFactura - estado'  --Ing. Lis 05/07/2048
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'estelec')  
begin 
	Alter Table Ven_FEFactura	add estelec INT not null default 0
	Print 'Ven_FEFactura - estelec'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'docelec')  
begin 
	Alter Table Ven_FEFactura	add docelec NVARCHAR(20) not null default ''
	Print 'Ven_FEFactura - docelec'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'cufe')  
begin 
	Alter Table Ven_FEFactura	add cufe NVARCHAR(100) not null default ''
	Print 'Ven_FEFactura - cufe'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'fecelc')  
begin 
	Alter Table Ven_FEFactura	add fecelc NVARCHAR(20) not null default ''
	Print 'Ven_FEFactura - fecelc'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'mensaje')  
begin 
	Alter Table Ven_FEFactura	add mensaje NVARCHAR(200) not null default ''
	Print 'Ven_FEFactura - mensaje'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'resultado')  
begin 
	Alter Table Ven_FEFactura	add resultado NVARCHAR(200) not null default ''
	Print 'Ven_FEFactura - resultado'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'xml')  
begin 
	Alter Table Ven_FEFactura	add xml NVARCHAR(MAX) not null default ''
	Print 'Ven_FEFactura - xml'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'prefijo')  
begin 
	Alter Table Ven_FEFactura	add prefijo NVARCHAR(10) not null default ''
	Print 'Ven_FEFactura - prefijo'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'Rangoini')  
begin 
	Alter Table Ven_FEFactura	add Rangoini NVARCHAR(10) not null default ''
	Print 'Ven_FEFactura - Rangoini'  
end 
Go

