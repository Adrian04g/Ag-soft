--Print 'por aqui'
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'traslado') 
	Alter Table glb_transaccion Add traslado bit Not Null Default 0 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios' AND T.column_name = 'CodContras') 
	Alter Table glb_usuarios Add CodContras char (2) Not Null Default ''
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'PrdctoIva') 
	Alter Table glb_Almacen Add PrdctoIva bit Not Null Default 0 
Go 
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Traslados' AND Temp.column_name = 'codcto') 
	Alter Table glb_traslados Add codcto nvarchar(3) Not Null Default ''
Go 
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Traslados' AND Temp.column_name = 'IdEmp') 
	Alter Table glb_traslados Add IdEmp nvarchar(3) Not Null Default ''
Go 
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Empresa' AND Temp.column_name = 'rutaped') 
	Alter Table Glb_Empresa Add rutaped bit Not Null Default 0
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Empresa' AND Temp.column_name = 'stickayuda') 
	Alter Table Glb_Empresa Add stickayuda VARCHAR(200) Not Null Default 'fr_ayuart'
Go 
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_transaccion' AND Temp.column_name = 'impstk') 
	Alter Table glb_transaccion Add impstk bit Not Null Default 0
Go 
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_barrio' AND Temp.column_name = 'IdEmp') 
	Alter Table glb_barrio Add IdEmp nvarchar(3) Not Null Default ''
Go 
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'HrValcie') 
	Alter Table glb_Almacen Add HrValcie nvarchar(5) Not Null Default ''
Go 
--
IF NOT EXISTS					-- Agregado por Éduar Álvarez - Abril 1 de 2015.
	(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Empresa' AND T.Column_Name = 'nitdian')
	Alter Table Glb_Empresa Add nitdian nvarchar(15) NOT NULL DEFAULT ''
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Con_Comprobante' AND T.Column_Name = 'idemp')	-- Agregado por Éduar Álvarez - Abril 7 de 2015.
	Alter Table Con_Comprobante	Add idemp nvarchar(3) NOT NULL DEFAULT ''
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'ciuter')
	Alter Table Glb_Terceros Alter column ciuter nvarchar(20)
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'apellido1')
	Alter Table Glb_Terceros Alter column apellido1 nvarchar(100)
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'apellido2')
	Alter Table Glb_Terceros Alter column apellido2 nvarchar(100)
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'nombre1')
	Alter Table Glb_Terceros Alter column nombre1 nvarchar(100)
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'otros')
	Alter Table Glb_Terceros Alter column otros nvarchar(100)
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Usuarios' AND T.Column_Name = 'camfecegr')	-- Agregados por Éduar Álvarez - Abril 9 de 2015.
	Alter Table Glb_Usuarios Add camfecegr Bit
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Usuarios' AND T.Column_Name = 'DesActPuc')
	Alter Table Glb_Usuarios Add DesActPuc Bit
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Usuarios' AND T.Column_Name = 'DesActConse')
	Alter Table Glb_Usuarios Add DesActConse Bit
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Usuarios' AND T.Column_Name = 'nofactcred')
	Alter Table Glb_Usuarios Add nofactcred Bit
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Usuarios' AND T.Column_Name = 'actcupo')
	Alter Table Glb_Usuarios Add actcupo Bit
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Usuarios' AND T.Column_Name = 'Destranegr')
	Alter Table Glb_Usuarios Add Destranegr Bit
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Usuarios' AND T.Column_Name = 'CodContras')
	Alter Table Glb_Usuarios Add CodContras char(2) NOT NULL DEFAULT ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Almacen' AND T.Column_Name = 'resoln')
	Alter Table Glb_Almacen Add resoln	nvarchar (200) NOT NULL DEFAULT ''
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Empresa' AND T.Column_Name = 'RegImpo')
	Alter Table Glb_Empresa Add RegImpo	Bit Not Null Default 0
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Unica' AND T.Column_Name = 'resempN')
	Alter Table Glb_Unica Add resempN nvarchar (200) NOT NULL DEFAULT ''
GO


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'cesantia')	-- Agregado por Éduar Álvarez - Abril 16 de 2015.
	Alter Table Glb_Terceros Add cesantia Bit NOT NULL
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'agruart')	-- Agregado por Éduar Álvarez - Mayo 14 de 2015.
	Alter Table Glb_Almacen Add agruart		Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'addingyegr')
	Alter Table Glb_Almacen Add addingyegr	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'digiturno')
	Alter Table Glb_Almacen Add digiturno	Bit Not Null Default 0
Go 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'obserdevol')
	Alter Table Glb_Almacen Add obserdevol	Bit Not Null Default 0
Go 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'bloqmesero')
	Alter Table Glb_Almacen Add bloqmesero	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'obseranul')
	Alter Table Glb_Almacen Add obseranul	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'dispropina')
	Alter Table Glb_Almacen Add dispropina	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'filubicmesa')
	Alter Table Glb_Almacen Add filubicmesa	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'ordgrunom')
	Alter Table Glb_Almacen Add ordgrunom	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'impfacconf')
	Alter Table Glb_Almacen Add impfacconf	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'DigNroPerso')
	Alter Table Glb_Almacen Add DigNroPerso	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'DomInf')
	Alter Table Glb_Almacen Add DomInf		Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'DomiExpres')
	Alter Table Glb_Almacen Add DomiExpres	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'tipoplato')
	Alter Table Glb_Almacen Add tipoplato	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'forpagcoman')
	Alter Table Glb_Almacen Add forpagcoman	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'impcomdomi')
	Alter Table Glb_Almacen Add impcomdomi	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'domiciliario')
	Alter Table Glb_Almacen Add domiciliario Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'camesacto')
	Alter Table Glb_Almacen Add camesacto	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'turnovrios')
	Alter Table Glb_Almacen Add turnovrios	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'DctoxProd')
	Alter Table Glb_Almacen Add DctoxProd	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'DesActProd')
	Alter Table Glb_Almacen Add DesActProd	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'horacierre')
	Alter Table Glb_Almacen Add horacierre	Numeric(3) Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'PPublico')
	Alter Table Glb_Almacen Add PPublico	nVarchar(8) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'exento')
	Alter Table Glb_Almacen Add exento		Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'preciovta')
	Alter Table Glb_Almacen Add preciovta	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'valife')
	Alter Table Glb_Almacen Add valife		Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'valcajero')
	Alter Table Glb_Almacen Add valcajero	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'factdcto')
	Alter Table Glb_Almacen Add factdcto	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'fijarcc')
	Alter Table Glb_Almacen Add fijarcc		Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'ctatrasalm')
	Alter Table Glb_Almacen Add ctatrasalm	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'invenxcto')
	Alter Table Glb_Almacen Add invenxcto	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'impgenxcto')
	Alter Table Glb_Almacen Add impgenxcto	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'confirtras')
	Alter Table Glb_Almacen Add confirtras	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'controlinv')
	Alter Table Glb_Almacen Add controlinv	Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'ccfijo')
	Alter Table Glb_Almacen Add ccfijo		nVarChar(3) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'ctatras')
	Alter Table Glb_Almacen Add ctatras		nVarChar(8) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'nrocolsti')
	Alter Table Glb_Almacen Add nrocolsti	Numeric(2) Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'copiasfact')
	Alter Table Glb_Almacen Add copiasfact	nVarChar(2) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'copiasfact2')
	Alter Table Glb_Almacen Add copiasfact2	nVarChar(2) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'PorStock')
	Alter Table Glb_Almacen Add PorStock	Numeric(5) Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'Diasped')
	Alter Table Glb_Almacen Add Diasped		Numeric(2) Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'DctoMaxAlm')
	Alter Table Glb_Almacen Add DctoMaxAlm	Numeric(6) Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'impsticker')
	Alter Table Glb_Almacen Add impsticker	nVarChar(60) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'rutaredeban')
	Alter Table Glb_Almacen Add rutaredeban	nVarChar(40) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'nomequipo')
	Alter Table Glb_Almacen Add nomequipo	nVarChar(60) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'impDomici')
	Alter Table Glb_Almacen Add impDomici	nVarChar(80) Not Null Default ''
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Zonas' AND T.column_name = 'nombre')				-- Éduar Álvarez - Mayo 19 de 2015.
	Alter Table Glb_Zonas Alter Column nombre nVarChar(100) Not Null
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Empresa' AND T.column_name = 'ctoproduc')
	Alter Table Glb_Empresa Add ctoproduc nVarchar(2) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Empresa' AND T.column_name = 'plan')
	Alter Table Glb_Empresa Add [plan] nVarchar(2) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Empresa' AND T.column_name = 'superin')
	Alter Table Glb_Empresa Add superin nVarchar(2) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Empresa' AND T.column_name = 'normasin')		-- Éduar Álvarez - Mayo 26 de 2015.
	Alter Table Glb_Empresa Add normasin Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Terceros' AND T.column_name = 'terinactivo')
	Alter Table Glb_Terceros Add Terinactivo Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Terceros' AND T.column_name = 'codctoter')
	Alter Table Glb_Terceros Add codctoter nVarChar(3) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Terceros' AND T.column_name = 'terbloq')
	Alter Table Glb_Terceros Add terbloq Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Terceros' AND T.column_name = 'poliza')
	Alter Table Glb_Terceros Add poliza Bit Not Null Default 0
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Empresa' AND T.column_name = 'NomApe')
	Alter Table Glb_Empresa Add NomApe Bit Not Null Default 0
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Barrio' AND T.column_name = 'NomBarr')
	Alter Table Glb_Barrio Alter Column NomBarr nVarChar(120) Not Null
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Tiptercero' AND T.column_name = 'NomTipo')
	Alter Table Glb_Tiptercero Alter Column NomTipo nVarChar(120) Not Null
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Empresa' AND T.column_name = 'consedoble')		-- Éduar Álvarez - Junio 2 de 2015.
	Alter Table Glb_Empresa Add consedoble Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Unica' AND T.column_name = 'contran2')
	Alter Table Glb_Unica Add contran2 Numeric(8) Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Unica' AND T.column_name = 'resemp2')
	Alter Table Glb_Unica Add resemp2 nVarChar(200) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Transaccion' AND T.column_name = 'ccinv')
	Alter Table Glb_Transaccion Add ccinv Bit Not Null Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Transaccion' AND T.column_name = 'ncopias')
	Alter Table Glb_Transaccion Add ncopias Numeric(2) Default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Transaccion' AND T.column_name = 'tranedit')
	Alter Table Glb_Transaccion Add tranedit nVarChar(2) Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Transaccion' AND T.column_name = 'transacniif')
	Alter Table Glb_Transaccion Add transacniif Bit Not Null Default 0
Go

IF EXISTS (Select * From Glb_Idx Where tabla = 'GLB_MENSUAL' AND nomidx='CENTRO')											-- Modificado Junio 3 de 2015 - Éduar Álvarez.
begin
	DECLARE @cDetIdx1 nVarChar(60)='ALLTRIM(CODCTO)+ALLTRIM(CODTRAN)+ALLTRIM(STR(AÑOTRAN))', @cDetIdx2 nVarChar(60)=''
	SET @cDetIdx2 = (Select detidx From Glb_Idx Where tabla = 'GLB_MENSUAL' AND nomidx='CENTRO')
	IF @cDetIdx1 <> @cDetIdx2
		UPDATE Glb_Idx SET detidx=@cDetIdx1 WHERE tabla='GLB_MENSUAL' AND nomidx=('CENTRO')	-- Cambio CODALM por CODCTO.
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Empresa' AND T.column_name = 'activofijo')
	Alter Table Glb_Empresa Add activofijo Bit Not Null Default 0
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Parametros' AND T.column_name = 'gppais')	-- Éduar Álvarez - Junio 5 de 2015.
	Alter Table Glb_Parametros Add gppais nVarChar(3) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Parametros' AND T.column_name = 'gpdpto')
	Alter Table Glb_Parametros Add gpdpto nVarChar(3) Not Null Default ''
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Parametros' AND T.column_name = 'gpciudad')
	Alter Table Glb_Parametros Add gpciudad nVarChar(3) Not Null Default ''
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Transaccion' AND T.column_name = 'TipoNorma')	-- Éduar Álvarez - Junio 15 de 2015.
	Alter Table Glb_Transaccion Add TipoNorma nVarChar(1) Not Null Default 'P'
Go



IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'uniconse')		-- Éduar Álvarez. - Julio 24 de 2015.
	Alter Table Glb_Parametros Add uniconse Bit NOT NULL DEFAULT 0
Go



IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Empresa' AND T.Column_Name = 'gastosChuz')
	Alter Table Glb_Empresa Add gastosChuz Bit NOT NULL DEFAULT 0
Go
IF not  exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'Glb_Parametros' AND Temp.column_name = 'FecAnulDoc') 
	Alter Table Glb_Parametros Add FecAnulDoc bit Not Null Default 0 
go 
IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Parametros' AND Temp.column_name = 'IdEmp') 
	Alter Table Glb_Parametros Add IdEmp varchar(3) Not Null Default ''
go 

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Parametros' AND Temp.column_name = 'AyudaNew') 
	Alter Table Glb_Parametros Add AyudaNew bit  Not Null Default 0
go 

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Almacen' AND Temp.column_name = 'HrValCierre') 
	Alter Table Glb_Almacen Add HrValCierre varchar(5) Not Null Default '00:00'
go 

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Almacen' AND Temp.column_name = 'PassDcto') 
	Alter Table Glb_Almacen Add PassDcto bit Not Null Default 0
go 

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Usuarios' AND Temp.column_name = 'PassDcto') 
	Alter Table Glb_Usuarios Add PassDcto bit Not Null Default 0
go 

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Usuarios' AND Temp.column_name = 'PassDcto') 
	Alter Table Glb_Usuarios Add PassDcto bit Not Null Default 0
go   -- Ing. Lissette oct23 de 2015 

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Usuarios' AND Temp.column_name = 'nomequipo') 
	Alter Table Glb_Usuarios Add nomequipo nvarchar(60) Not Null Default ''
go   -- Ing. Lissette Nov19 de 2015 


IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Almacen' AND Temp.column_name = 'anainv') 
	Alter Table Glb_Almacen Add anainv numeric(5) Not Null Default 0
go   -- Ing. Lissette Nov 23 de 2015 

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Almacen' AND Temp.column_name = 'crittrasla') 
	Alter Table Glb_Almacen Add crittrasla numeric(5) Not Null Default 0
go   -- Ing. Lissette Nov 23 de 2015 



IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Usuarios' AND Temp.column_name = 'tipoImpuesto') 
	Alter Table Glb_Usuarios Add tipoImpuesto nvarchar(1) Not Null Default ''
go   -- Ing. Lissette Nov 28 de 2015   para quile y el almacen que maneja ipo e iva 


IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Almacen' AND Temp.column_name = 'Valhoracierre') 
	Alter Table Glb_Almacen Add Valhoracierre nvarchar(5) Not Null Default ''
go   -- Ing. Lissette Nov 28 de 2015   para quile y el almacen que maneja ipo e iva 


IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Almacen' AND Temp.column_name = 'VerImpSer') 
	Alter Table Glb_Almacen Add VerImpSer bit Not Null Default 0
go   -- Ing. Lissette Ene. 30 de 2016  =1 muestra check en impresion, reimpresion y confirmacion de factura para imprimirmir la factura con un solo item que diga 'Servicio comedor'

IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Almacen' AND Temp.column_name = 'DetServicio') 
	Alter Table Glb_Almacen Add DetServicio nvarchar(50) Not Null Default ''
go   -- Ing. Lissette Ene. 30 de 2016  Se guarda el detalle para mostrar en la factura si se activa el parametro VerImpSer
 
IF not  exists (Select * From Information_Schema.Columns  AS Temp Where Temp.table_name = 'Glb_Parametros' AND Temp.column_name = 'Codbarauto') 
	Alter Table Glb_Parametros Add Codbarauto bit Not Null Default 0
go   -- Ing. Lissette Marzo. 21 de 2016  Si van a utilizar codbar automatico. 
 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros' AND T.column_name = 'formulacodbar') 
begin 
	Alter Table Glb_Parametros Add formulacodbar nvarchar(150)   not null default ''
	Print 'Glb_Parametros - formulacodbar'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros' AND T.column_name = 'formulacodbar2') 
begin 
	Alter Table Glb_Parametros Add formulacodbar2 nvarchar(150)   not null default ''
	Print 'Glb_Parametros - formulacodbar2'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Empresa' AND T.column_name = 'f2276') 
begin 
	Alter Table Glb_Empresa Add f2276 bit not null default 0
	Print 'Glb_Empresa - f2276'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Empresa' AND T.column_name = 'TituloDomi') 
begin 
	Alter Table Glb_Empresa Add TituloDomi nvarchar(20) not null default ''
	Print 'Glb_Empresa - TituloDomi'
end   -- ing. Lissete Castro 25/04/2016 para clinica San Vicente
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_almacen' AND T.column_name = 'dctoxprod') 
begin 
	Alter Table Glb_almacen Add dctoxprod bit not null default 0
	Print 'Glb_almacen - dctoxprod'
end   -- ing. Lissete Castro 25/04/2016 para descuentos por productos 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Descuentos' AND T.column_name = 'Touch') 
begin 
	Alter Table Glb_Descuentos Add Touch bit not null default 0
	Print 'Glb_Descuentos - Touch'
end   -- ing. Lissete Castro 26/04/2016 para dctos por productos 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Empresa' AND T.column_name = 'f2276') 
begin 
	Alter Table Glb_Empresa Add f2276 bit not null default 0
	Print 'Glb_Empresa - f2276'
end   -- ing. Lissete Castro 18/05/2016 medio mangnetico 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Almacen' AND T.column_name = 'blofecape') 
begin 
	Alter Table Glb_Almacen Add blofecape bit not null default 0
	Print 'Glb_Almacen - blofecape'
end   -- ing. Lissete Castro 21/05/2016 bloque fecha de apertura para que tome la del pc 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Almacen' AND T.column_name = 'ImpxUsuRemo') 
begin 
	Alter Table Glb_Almacen Add ImpxUsuRemo bit not null default 0
	Print 'Glb_Almacen - ImpxUsuRemo'
end   -- ing. Lissete Castro 08/07/2016 Impresoras x usuario remoto 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Transaccion' AND T.column_name = 'Mostrartouch') 
begin 
	Alter Table Glb_Transaccion Add Mostrartouch bit not null default 0
	Print 'Glb_Transaccion - Mostrartouch'
end   -- ing. Lissete Castro 11/07/2016 Para que no muestre estas transacciones de ventas en el touch.  
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_almacen' AND T.column_name = 'Valexisinsumo') 
begin 
	Alter Table Glb_almacen Add Valexisinsumo bit not null default 0
	Print 'Glb_almacen - Valexisinsumo'
end   -- ing. Lissete Castro 17/07/2016 Para validar existencias de un intangible por el un insumo del plato. 
Go

IF NOT EXISTS (Select * From glb_menu Where nomfor='FR_TARJETAXCLI') 
begin 
	declare @pCodigo numeric(3)=0
	declare @pPadre  numeric(2)=0

	select @pCodigo=max(codigo)+1 from glb_menu where modulo='03'
	set @pcodigo = iif(@pcodigo is null, 1,@pcodigo)
	select @pcodigo
	select @pPadre=Padre from glb_menu where modulo='03' and desopc='UTILIDADES'

	Insert into glb_menu(nomfor,modulo,codigo,desopc,padre,arcdll,tipopc,ver)
	values('FR_TARJETAXCLI','03',@pCodigo,'Editar Tarjetas En Terceros',@pPadre,'',4,0) 
	
	Print 'Inset glb_menu - FR_TARJETAXCLI'
end   -- ing. Lissette Castro 03/08/2016 Registro para el permiso de modificar tarjetas de clientes.
Go

IF NOT EXISTS (Select * From glb_menu Where nomfor='FR_ANULA_PRESTAMO') 
begin 
	declare @pCodigo numeric(3)=0
	declare @pPadre  numeric(2)=0
	declare @pModulo nVarchar(2)=''
	
	select @pModulo=codmod from glb_modulos where nommod='NOMINA'
	if @pModulo!=''
	begin 

		select @pCodigo=max(codigo)+1 from glb_menu where modulo=@pModulo
		set @pCodigo = iif(@pCodigo>60,@pCodigo,61) 

		IF EXISTS(select Padre from glb_menu where modulo=@pModulo and desopc='UTILIDADES')
			select @pPadre=Padre from glb_menu where modulo=@pModulo and desopc='UTILIDADES'
		ELSE 
			INSERT INTO glb_menu(nomfor, modulo, codigo, desopc, padre, arcdll, tipopc,ver)
			VALUES ('',@pModulo,60,'UTILIDADES',60,'',4,0)


		Insert into glb_menu(nomfor,modulo,codigo,desopc,padre,arcdll,tipopc,ver)
		values('FR_ANULA_PRESTAMO',@pModulo,@pCodigo,'Anular Prestamos Nomina',60,'',4,0) 
	
		Print 'Insert glb_menu - FR_ANULA_PRESTAMO'
	end 
end   -- ing. Lissette Castro 03/08/2016 Registro para el permiso de anulacion de prestamos
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_caja' AND Temp.column_name = 'item') 
begin 
	Alter Table glb_caja Add item numeric(10) Not Null Default 0 -- Ing. Jesus Pinto 26/08/2016 se agrega item para evitar repeticiones de la llave primaria
	Print 'Glb_almacen - Valexisinsumo'
end 
Go 

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_transaccion' AND Temp.column_name = 'codtranrel') 
begin 
	Alter Table glb_transaccion Add codtranrel  nvarchar(2) Not Null Default '' -- Ing. Lissette 29/08/2016 se agrega item para evitar repeticiones de la llave primaria
	Print 'glb_transaccion - codtranrel'
end 
Go 


IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'ValUsuFacUsuAper') 
begin 
	Alter Table glb_almacen Add ValUsuFacUsuAper  bit Not Null Default 0
	Print 'glb_almacen - ValUsuFacUsuAper'  -- Ing. Lissette 22/09/2016 si es 1 validara que el usuario que va  registrar la factura sea el mismo que abrio el turno 
end 
Go 

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'VerExisInsumo') 
begin 
	Alter Table glb_almacen Add VerExisInsumo  bit Not Null Default 0
	Print 'glb_almacen - VerExisInsumo'  -- Ing. Lissette 23/09/2016 si es 1 mostrar la existencia de los insumos que esten parametrizados 
end 
Go 

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_parametros' AND Temp.column_name = 'GsSync') 
begin 
	Alter Table glb_parametros Add GsSync  bit Not Null Default 0
	Print 'glb_parametros - GsSync'  -- Ing. Lissette 29/09/2016 si es 1 utilizan la nueva sincro esto espara separar el codigo del borrado el registro o de modificarlos
end 
Go 

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'actbtoncajon') 
begin 
	Alter Table glb_Almacen Add actbtoncajon  bit Not Null Default 0
	Print 'glb_Almacen - actbtoncajon'  -- Ing. Lissette 19/10/2016 si es 1 muestra boton para abrir cajon en el touch 
end 
Go 

IF EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)='DF_glb_terceros_descrip') and 
	exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_terceros' AND Temp.column_name = 'descrip' and temp.CHARACTER_MAXIMUM_LENGTH=-1) 
BEGIN
	alter table glb_terceros drop constraint DF_glb_terceros_descrip
END
GO

IF  exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_terceros' AND Temp.column_name = 'descrip' and temp.CHARACTER_MAXIMUM_LENGTH=-1) 
begin
	Alter Table glb_terceros alter column descrip  NVARCHAR(200)
	Print 'glb_terceros - descrip'  -- Ing. Jesus 
	end 
Go 

IF not EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)='DF_glb_terceros_descrip')
BEGIN
	ALTER TABLE [dbo].[glb_terceros] ADD  CONSTRAINT [DF_glb_terceros_descrip]  DEFAULT ('') FOR [descrip]
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_Accesos' AND T.column_name = 'item' )
begin
	Alter Table glb_Accesos ADD item DECIMAL(14,2) not null default 0 
	Print 'glb_Accesos - item'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'nomcom')
begin 
	Alter Table Glb_Terceros add nomcom nvarchar(100) default '' --Ing Jesus Pinto
	print 'Glb_terceros - nomcom'
end

Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'ctodomicilio' )
begin
	Alter Table glb_parametros ADD ctodomicilio nVarchar(3) not null default ''
	Print 'glb_parametros - ctodomicilio'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'codtrandomi' )
begin
	Alter Table glb_parametros ADD codtrandomi nVarchar(2) not null default ''
	Print 'glb_parametros - codtrandomi'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'mindomicilio' )
begin
	Alter Table glb_parametros ADD mindomicilio numeric(10) not null default 0
	Print 'glb_parametros - mindomicilio'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'ubicdomicilio  ' )
begin
	Alter Table glb_parametros ADD ubicdomicilio   nvarchar(10) not null default ''
	Print 'glb_parametros - ubicdomicilio  '
end 
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'Gsempplus' )
begin
	Alter Table glb_parametros ADD Gsempplus  nvarchar(50) not null default ''
	Print 'glb_parametros - Gsempplus  '
end
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'GsValid' )
begin
	Alter Table glb_parametros ADD GsValid  nvarchar(50) not null default ''
	Print 'glb_parametros - GsValid  '
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'conserec' )
begin
	Alter Table glb_parametros ADD conserec  nvarchar(3) not null default ''
	Print 'glb_parametros - conserec'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'licenciafirma' )
begin
	Alter Table glb_parametros ADD licenciafirma nvarchar(MAX) not null default ''
	Print 'glb_parametros - licenciafirma'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'licencia' )
begin
	Alter Table glb_parametros ADD licencia  bit default 0
	Print 'glb_parametros - licencia'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'verbd' )
begin
	alter table glb_parametros add verbd nvarchar(20) default 0
	Print 'glb_parametros - verbd'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_menu' AND T.column_name = 'verWeb' )
begin
	alter table glb_menu add verWeb bit NOT NULL default 0
	Print 'glb_menu - verWeb'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'horafacreimp' )
begin
	alter table glb_almacen add horafacreimp bit NOT NULL default 0
	Print 'glb_almacen - horafacreimp'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_TouchImpresoras' AND T.column_name = 'CodCto' )
begin
	alter table Glb_TouchImpresoras add CodCto nvarchar(3) NOT NULL default ''
	Print 'Glb_TouchImpresoras - CodCto'	--ing. Lis 10/05/2017 para registras en la nueva tabla el centro de costo para aquellos usuarios que van a tomar la impresora por													--escritorio remoto 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_TouchImpresoras' AND T.column_name = 'Usuario' )
begin
	alter table Glb_TouchImpresoras add Usuario nvarchar(30) NOT NULL default ''
	Print 'Glb_TouchImpresoras - Usuario'	--ing. Lis 10/05/2017 para registras en la nueva tabla el usuario de costo para aquellos usuarios que van a tomar la impresora por													--escritorio remoto 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Empresa' AND T.column_name = 'almvarioscen' )
begin
	alter table Glb_Empresa add almvarioscen bit  NOT NULL default 0
	Print 'Glb_Empresa - almvarioscen'	--ing. Lis 01/06/2017 varios centro en un mismo centro de consumo 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Empresa' AND T.column_name = 'cenotring' )
begin
	alter table Glb_Empresa add cenotring bit  NOT NULL default 0
	Print 'Glb_Empresa - cenotring'	--ing. Lis 01/06/2017 manejan centro de ctos en el detalle de los recibos de caja de otros ingresos touch. 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_almacen' AND T.column_name = 'facvtacero' )
begin
	alter table Glb_almacen add facvtacero bit  NOT NULL default 0
	Print 'Glb_almacen - facvtacero'	--ing. Lis 02/06/2017 poder facturar facturas en 0 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_almacen' AND T.column_name = 'CambioUsuario' )
begin
	alter table Glb_almacen add CambioUsuario bit  NOT NULL default 0
	Print 'Glb_almacen - CambioUsuario'	--ing. Lis 06/06/2017 Cambi el usuario en la confiramcion y colo el usuario que confirmo la factura 
end 
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros' AND T.column_name = 'gpterce' )
begin
	alter table Glb_Parametros add gpterce bit  NOT NULL default 0
	Print 'Glb_Parametros - gpterce'	--ing. Lis 20/06/2017 para no obligar a pedir datos del tercero 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_almacen' AND T.column_name = 'AlrFacCont' )
begin
	alter table Glb_almacen add AlrFacCont numeric(10)  NOT NULL default 0
	Print 'Glb_almacen - AlrFacCont'	--ing. Lis 21/06/2017 Alerta de factura guarda el conteo de facturas 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_almacen' AND T.column_name = 'AlrFacTexto' )
begin
	alter table Glb_almacen add AlrFacTexto nvarchar(200)  NOT NULL default ''
	Print 'Glb_almacen - AlrFacTexto'	--ing. Lis 21/06/2017 Alerta de factura guarda el texto que se va a mostrar 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_almacen' AND T.column_name = 'AlrFacCCuanto' )
begin
	alter table Glb_almacen add AlrFacCCuanto numeric(10)  NOT NULL default 0
	Print 'Glb_almacen - AlrFacCCuanto'	--ing. Lis 21/06/2017 Alerta de factura guarda cada cuanto va a mostrar el texto. 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Terceros' AND T.column_name = 'Codeudor' )
begin
	alter table Glb_Terceros add Codeudor bit  NOT NULL default 0
	Print 'Glb_Terceros - Codeudor'	--ing. Lis 14/07/2017 Para saber quienes son codeudores 
end 
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfilcto' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_perfilcto ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_perfilcto - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfilcto' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_perfilcto ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_perfilcto - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfilcto' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_perfilcto ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_perfilcto - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfilcto' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_perfilcto ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_perfilcto - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfilcto' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_perfilcto  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_perfilcto  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfilcto'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_perfilcto Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_perfilcto - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfiles' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_perfiles ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_perfiles - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfiles' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_perfiles ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_perfiles - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfiles' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_perfiles ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_perfiles - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfiles' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_perfiles ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_perfiles - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfiles' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_perfiles  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_perfiles  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_perfiles'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_perfiles Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_perfiles - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_profesion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_profesion ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_profesion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_profesion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_profesion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_profesion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_profesion' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_profesion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_profesion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_profesion' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_profesion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_profesion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_profesion' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_profesion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_profesion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_profesion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_profesion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_profesion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_religion ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_religion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_religion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_religion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_religion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_religion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_religion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_religion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_religion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_religion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_religion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_religion - modificadoc'  
end
Go

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_religion ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_religion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_religion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_religion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_religion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_religion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_religion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_religion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_religion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_religion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_religion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_religion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_religion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sesion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_sesion ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_sesion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sesion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_sesion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_sesion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sesion' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_sesion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_sesion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sesion' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_sesion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_sesion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sesion' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_sesion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_sesion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sesion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_sesion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_sesion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sucursal' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_sucursal ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_sucursal - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sucursal' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_sucursal ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_sucursal - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sucursal' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_sucursal ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_sucursal - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sucursal' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_sucursal ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_sucursal - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sucursal' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_sucursal  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_sucursal  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sucursal'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_sucursal Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_sucursal - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjetacli' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_tarjetacli ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_tarjetacli - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjetacli' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_tarjetacli ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_tarjetacli - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjetacli' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_tarjetacli ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_tarjetacli - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjetacli' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_tarjetacli ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_tarjetacli - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjetacli' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_tarjetacli  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_tarjetacli  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjetacli'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_tarjetacli Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_tarjetacli - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjexcli' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_tarjexcli ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_tarjexcli - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjexcli' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_tarjexcli ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_tarjexcli - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjexcli' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_tarjexcli ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_tarjexcli - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjexcli' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_tarjexcli ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_tarjexcli - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjexcli' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_tarjexcli  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_tarjexcli  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tarjexcli'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_tarjexcli Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_tarjexcli - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tempresas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_tempresas ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_tempresas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tempresas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_tempresas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_tempresas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tempresas' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_tempresas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_tempresas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tempresas' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_tempresas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_tempresas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tempresas' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_tempresas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_tempresas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tempresas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_tempresas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_tempresas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_terceros ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_terceros - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_terceros ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_terceros - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_terceros ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_terceros - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_terceros ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_terceros - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_terceros  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_terceros  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_terceros Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_terceros - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tipid' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_tipid ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_tipid - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tipid' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_tipid ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_tipid - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tipid' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_tipid ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_tipid - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tipid' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_tipid ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_tipid - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tipid' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_tipid  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_tipid  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tipid'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_tipid Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_tipid - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tiptercero' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_tiptercero ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_tiptercero - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tiptercero' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_tiptercero ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_tiptercero - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tiptercero' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_tiptercero ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_tiptercero - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tiptercero' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_tiptercero ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_tiptercero - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tiptercero' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_tiptercero  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_tiptercero  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_tiptercero'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_tiptercero Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_tiptercero - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_touchimpresoras' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_touchimpresoras ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_touchimpresoras - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_touchimpresoras' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_touchimpresoras ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_touchimpresoras - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_touchimpresoras' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_touchimpresoras ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_touchimpresoras - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_touchimpresoras' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_touchimpresoras ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_touchimpresoras - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_touchimpresoras' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_touchimpresoras  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_touchimpresoras  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_touchimpresoras'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_touchimpresoras Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_touchimpresoras - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_transaccion ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_transaccion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_transaccion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_transaccion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_transaccion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_transaccion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_transaccion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_transaccion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_transaccion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_transaccion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_transaccion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_transaccion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_traslados' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_traslados ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_traslados - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_traslados' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_traslados ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_traslados - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_traslados' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_traslados ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_traslados - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_traslados' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_traslados ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_traslados - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_traslados' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_traslados  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_traslados  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_traslados'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_traslados Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_traslados - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_unica ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_unica - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_unica ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_unica - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_unica ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_unica - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_unica ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_unica - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_unica  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_unica  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_unica Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_unica - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_usuarios ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_usuarios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_usuarios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_usuarios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_usuarios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_usuarios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_usuarios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_usuarios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_usuarios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_usuarios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_usuarios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_usuarios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuxtran' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_usuxtran ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_usuxtran - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuxtran' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_usuxtran ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_usuxtran - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuxtran' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_usuxtran ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_usuxtran - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuxtran' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_usuxtran ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_usuxtran - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuxtran' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_usuxtran  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_usuxtran  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuxtran'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_usuxtran Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_usuxtran - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_vivienda' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_vivienda ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_vivienda - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_vivienda' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_vivienda ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_vivienda - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_vivienda' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_vivienda ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_vivienda - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_vivienda' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_vivienda ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_vivienda - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_vivienda' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_vivienda  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_vivienda  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_vivienda'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_vivienda Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_vivienda - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_zonas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_zonas ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_zonas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_zonas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table glb_zonas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'glb_zonas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_zonas' AND T.column_name = 'codusumod') 
begin 
	Alter Table glb_zonas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'glb_zonas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_zonas' AND T.column_name = 'codusu') 
begin 
	Alter Table glb_zonas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'glb_zonas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_zonas' AND T.column_name = 'docdelete') 
begin 
	Alter Table glb_zonas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'glb_zonas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_zonas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table glb_zonas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'glb_zonas - modificadoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros'  AND T.column_name = 'domixcto') 
begin 
	Alter Table Glb_Parametros Add domixcto  bit NOT NULL DEFAULT 0
	Print 'Glb_Parametros - domixcto'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros'  AND T.column_name = 'utilhuella') 
begin 
	Alter Table Glb_Parametros Add utilhuella  bit NOT NULL DEFAULT 0
	Print 'Glb_Parametros - utilhuella'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'codusu')
	Alter Table Glb_Terceros add codusu nvarchar(30) not null default ''
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'glb_parametros' AND T.Column_Name = 'carpeta')
	Alter Table glb_parametros add carpeta NVARCHAR(max) not null default ''
Go
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'empresa')
	Alter Table glb_terceros alter column empresa nvarchar(250) 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Barrio' AND T.Column_Name = 'sector')
	Alter Table Glb_Barrio add sector bit not null default 0
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'gsRenta' )
begin
	Alter Table glb_parametros ADD gsRenta  nvarchar(50) not null default ''
	Print 'glb_parametros - gsRenta  '
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'Cambiotran' )
begin
	Alter Table glb_almacen ADD Cambiotran  bit not null default 0
	Print 'glb_almacen - Cambiotran  '
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios' AND T.column_name = 'editfactura' )
begin
	Alter Table glb_usuarios ADD editfactura  bit not null default 0
	Print 'glb_usuarios - editfactura  '
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'PedImpComandar' )
begin
	Alter Table glb_almacen ADD PedImpComandar  bit not null default 0
	Print 'glb_almacen - PedImpComandar  '  -- ing lis 29112017  para que al camandar el almacen pida impresoras. 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'verayuda' )
begin
	Alter Table glb_empresa ADD verayuda  bit not null default 0
	Print 'glb_empresa - verayuda  '  -- ing lis 05/01/2018 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros' AND T.column_name = 'RutaRestruct' )
begin
	Alter Table Glb_Parametros ADD RutaRestruct  nvarchar(200) not null default ''
	Print 'Glb_Parametros - RutaRestruct  '  -- ing lis 11/01/2018  ruta para guardar los datos reestruc. 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros' AND T.column_name = 'EditVlrReten' )
begin
	Alter Table Glb_Parametros ADD EditVlrReten  bit not null default 0
	Print 'Glb_Parametros - EditVlrReten  '  -- ing lis 11/01/2018  ruta para guardar los datos reestruc. 
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'nomtran' )
begin
	Alter Table glb_transaccion ALTER COLUMN nomtran  NVARCHAR(200)
	Print 'glb_transaccion - nomtran  ' 
end 
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'textopro' )
begin
	Alter Table glb_almacen ADD textopro  varchar(100) not null default 'Serv. Voluntario'
	Print 'glb_almacen - textopro  '  
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rtipid' )
begin
	Alter Table glb_terceros ADD rtipid  varchar(100) not null default ''
	Print 'glb_terceros - rtipid  ' 
END
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rNitTer' )
begin
	Alter Table glb_terceros ADD rNitTer  varchar(100) not null default ''
	Print 'glb_terceros - rNitTer  ' 
END
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rapellido1' )
begin
	Alter Table glb_terceros ADD rapellido1  varchar(100) not null default ''
	Print 'glb_terceros - rapellido1  ' 
END
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rApellido2' )
begin
	Alter Table glb_terceros ADD rApellido2  varchar(100) not null default ''
	Print 'glb_terceros - rApellido2  ' 
END
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rNombre1' )
begin
	Alter Table glb_terceros ADD rNombre1  varchar(100) not null default ''
	Print 'glb_terceros - rNombre1  ' 
END
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rotros' )
begin
	Alter Table glb_terceros ADD rotros  varchar(100) not null default ''
	Print 'glb_terceros - rotros  ' 
END
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rDirter' )
begin
	Alter Table glb_terceros ADD rDirter  varchar(100) not null default ''
	Print 'glb_terceros - rDirter  ' 
END
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rTelter' )
begin
	Alter Table glb_terceros ADD rTelter  varchar(100) not null default ''
	Print 'glb_terceros - rTelter  ' 
END
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'porrecaudo' )
begin
	Alter Table glb_terceros ADD porrecaudo  decimal(14,2) not null default 0
	Print 'glb_terceros - porrecaudo  ' 
END
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_descuentos' AND T.column_name = 'tipo' )
begin
	Alter Table glb_descuentos ADD tipo  numeric(14) not null Default 0
	Print 'glb_descuentos - tipo  ' 
END
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_descuentos' AND T.column_name = 'costoart' )
begin
	Alter Table glb_descuentos ADD costoart  bit not null default 0
	Print 'glb_descuentos - costoart  ' 
END
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'puntostouch') 
	Alter Table glb_Almacen Add puntostouch bit Not Null Default 0 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'PreImpFacTouch') 
begin	
	Alter Table glb_Almacen Add PreImpFacTouch bit Not Null Default 0  --Ing Lissette Castro 02/06/2018
	Print 'glb_Almacen - PreImpFacTouch  ' 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'PassPropina') 
begin	
	Alter Table glb_Almacen Add PassPropina bit Not Null Default 0  --Ing Lissette Castro 09/06/2018
	Print 'glb_Almacen - PassPropina  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_terceros' AND Temp.column_name = 'puntos') 
begin	
	Alter Table glb_terceros Add puntos bit Not Null Default 0  --Ing Lissette Castro 09/06/2018
	Print 'glb_terceros - puntos  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_transaccion' AND Temp.column_name = 'facelec') 
begin	
	Alter Table glb_transaccion Add facelec bit Not Null Default 0  --Ing Lissette Castro 09/06/2018
	Print 'glb_transaccion - facelec  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_transaccion' AND Temp.column_name = 'codfacelec') 
begin	
	Alter Table glb_transaccion Add codfacelec nvarchar(10) Not Null Default ''  
	Print 'glb_transaccion - codfacelec  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_descuentos' AND Temp.column_name = 'codimpelec') 
begin	
	Alter Table glb_descuentos Add codimpelec nvarchar(10) Not Null Default '' 
	Print 'glb_descuentos - codimpelec  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_pais' AND Temp.column_name = 'codpaiselec') 
begin	
	Alter Table glb_pais Add codpaiselec nvarchar(10) Not Null Default ''  
	Print 'glb_pais - codpaiselec  ' 
end 
Go
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_terceros' AND Temp.column_name = 'tipoper') 
begin	
	Alter Table glb_terceros Add tipoper bit Not Null Default 0 
	Print 'glb_terceros - tipoper  ' 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_unica' AND Temp.column_name = 'timbre') 
begin	
	Alter Table glb_unica Add timbre numeric(14) Not Null Default 0 
	Print 'glb_unica - timbre  ' 
end 
Go
IF  exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'diralm') 
begin	
	Alter Table glb_almacen alter column diralm nvarchar(100) 
	Print 'glb_almacen - diralm  ' 
end 
Go
IF  exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'resoln') 
begin	
	Alter Table glb_almacen alter column resoln nvarchar(300) 
	Print 'glb_almacen - resoln  ' 
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
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_parametros' AND Temp.column_name = 'urlfac2') 
begin	
	Alter Table glb_parametros Add urlfac2 nvarchar(200) Not Null Default ''
	Print 'glb_parametros - urlfac2  ' 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_unica' AND Temp.column_name = 'RangoIniResol') 
begin	
	Alter Table glb_unica Add RangoIniResol nvarchar(20) Not Null Default ''
	Print 'glb_unica - RangoIniResol  ' 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_global' AND Temp.column_name = 'valormemo') 
begin	
	Alter Table glb_global Add valormemo nvarchar(max) Not Null Default ''
	Print 'glb_global - valormemo  ' 
end 
Go

----------------------------------Actualizado en el esquema hasta aqui------------------27/07/2018

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_usuarios' AND Temp.column_name = 'NoApliPropina') 
begin	
	Alter Table glb_usuarios Add NoApliPropina bit Not Null Default 0
	Print 'glb_usuarios - NoApliPropina  ' 
end 
Go


IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_empresa' AND Temp.column_name = 'oculsfvta') 
begin	
	Alter Table glb_empresa Add oculsfvta bit Not Null Default 0
	Print 'glb_empresa - oculsfvta  ' 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'VariosUsuPass') 
begin	
	Alter Table glb_almacen Add VariosUsuPass bit Not Null Default 0
	Print 'glb_almacen - VariosUsuPass  ' 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_unica' AND Temp.column_name = 'alertatimbre') 
begin	
	Alter Table glb_unica Add alertatimbre numeric(10) Not Null Default 0
	Print 'glb_unica - alertatimbre  ' 
end 
Go


IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_transaccion' AND Temp.column_name = 'PedirNumOrd') 
begin	
	Alter Table glb_transaccion Add PedirNumOrd bit Not Null Default 0
	Print 'glb_transaccion - PedirNumOrd  ' 
end 
Go

IF  exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_empresa' AND Temp.column_name = 'telemp' and temp.character_maximum_length!=150) 
begin	
	Alter Table glb_empresa alter column telemp nvarchar(150) Not Null 
	Print 'glb_empresa - telemp  ' 
end 
Go

IF  exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'telalm' and temp.character_maximum_length!=150) 
begin	
	Alter Table glb_almacen alter column telalm nvarchar(150) Not Null 
	Print 'glb_almacen - telalm  ' 
end 
Go


IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_clasiven' and COLUMN_NAME='servidor' )
BEGIN
	ALTER TABLE  glb_clasiven ADD  servidor VARCHAR(60) NOT NULL  CONSTRAINT DF_glb_clasiven_servidor Default ''
	Print 'glb_clasiven - servidor' --PriscyReales
END
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_clasiven'  AND T.column_name = 'fecsys') 
BEGIN 
	ALTER TABLE glb_clasiven ADD fecsys  datetime NOT NULL CONSTRAINT DF_glb_clasiven_fecsys DEFAULT getdate()
	Print 'glb_clasiven - fecsys' --PriscyReales
END
GO

IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_error' and COLUMN_NAME='servidor' )
BEGIN
	ALTER TABLE  glb_error ADD  servidor VARCHAR(60) NOT NULL CONSTRAINT DF_glb_error_servidor Default ''
	Print 'glb_error - servidor' --PriscyReales
END
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_error'  AND T.column_name = 'fecsys') 
BEGIN 
	ALTER TABLE glb_error ADD fecsys  datetime NOT NULL CONSTRAINT DF_glb_error_fecsys DEFAULT getdate()
	Print 'glb_error - fecsys' --PriscyReales
END
GO

IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_pais' and COLUMN_NAME='servidor' )
BEGIN
	ALTER TABLE  glb_pais ADD  servidor VARCHAR(60) NOT NULL CONSTRAINT DF_glb_pais_servidor Default ''
	Print 'glb_pais - servidor' --PriscyReales
END
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_pais'  AND T.column_name = 'fecsys') 
BEGIN 
	ALTER TABLE glb_pais ADD fecsys  datetime NOT NULL CONSTRAINT DF_glb_pais_fecsys DEFAULT getdate()
	Print 'glb_pais - fecsys' --PriscyReales
END
GO

IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Glb_Parametros' and COLUMN_NAME='servidor' )
BEGIN
	ALTER TABLE  Glb_Parametros ADD  servidor VARCHAR(60) NOT NULL  CONSTRAINT DF_Glb_Parametros_servidor Default ''
	Print 'Glb_Parametros - servidor' --PriscyReales
END
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros'  AND T.column_name = 'fecsys') 
BEGIN 
	ALTER TABLE Glb_Parametros ADD fecsys  datetime NOT NULL CONSTRAINT DF_Glb_Parametros_fecsys DEFAULT getdate()
	Print 'Glb_Parametros - fecsys' --PriscyReales
END
GO

IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_departamentos' and COLUMN_NAME='servidor' )
BEGIN
	ALTER TABLE  glb_departamentos ADD  servidor VARCHAR(60) NOT NULL CONSTRAINT DF_glb_departamentos_servidor Default ''
	Print 'glb_departamentos - servidor' --PriscyReales
END
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_departamentos'  AND T.column_name = 'fecsys') 
BEGIN 
	ALTER TABLE glb_departamentos ADD fecsys  datetime NOT NULL CONSTRAINT DF_glb_departamentos_fecsys DEFAULT getdate()
	Print 'glb_departamentos - fecsys' --PriscyReales
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('glb_clasiven')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'nombre'
							AND object_id = OBJECT_ID('glb_clasiven'))				
		)
	BEGIN
		ALTER TABLE glb_clasiven ADD CONSTRAINT DF_glb_clasiven_nombre DEFAULT 0 FOR nombre
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('glb_clasiven')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'comision'
							AND object_id = OBJECT_ID('glb_clasiven'))				
		)
	BEGIN
		ALTER TABLE glb_clasiven ADD CONSTRAINT DF_glb_clasiven_comision DEFAULT 0 FOR comision
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('glb_clasiven')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'porcomi'
							AND object_id = OBJECT_ID('glb_clasiven'))				
		)
	BEGIN
		ALTER TABLE glb_clasiven ADD CONSTRAINT DF_glb_clasiven_porcomi DEFAULT 0 FOR porcomi
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('glb_error')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'nombre'
							AND object_id = OBJECT_ID('glb_error'))				
		)
	BEGIN
		ALTER TABLE glb_error ADD CONSTRAINT DF_glb_error_nombre DEFAULT '' FOR nombre
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('glb_error')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'detalle'
							AND object_id = OBJECT_ID('glb_error'))				
		)
	BEGIN
		ALTER TABLE glb_error ADD CONSTRAINT DF_glb_error_detalle DEFAULT '' FOR detalle
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('glb_error')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'Sug'
							AND object_id = OBJECT_ID('glb_error'))				
		)
	BEGIN
		ALTER TABLE glb_error ADD CONSTRAINT DF_glb_error_Sug DEFAULT '' FOR Sug
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('glb_pais')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'nompais'
							AND object_id = OBJECT_ID('glb_pais'))				
		)
	BEGIN
		ALTER TABLE glb_pais ADD CONSTRAINT DF_glb_pais_nompais DEFAULT '' FOR nompais
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('Glb_Parametros')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'licencia'
							AND object_id = OBJECT_ID('Glb_Parametros'))				
		)
	BEGIN
		ALTER TABLE Glb_Parametros ADD CONSTRAINT DF_Glb_Parametros_licencia DEFAULT 0 FOR licencia
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('Glb_Parametros')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'verbd'
							AND object_id = OBJECT_ID('Glb_Parametros'))				
		)
	BEGIN
		ALTER TABLE Glb_Parametros ADD CONSTRAINT DF_Glb_Parametros_verbd DEFAULT '' FOR verbd
END
GO

ALTER TABLE glb_clasiven ALTER COLUMN nombre NVARCHAR(40) NOT NULL 
ALTER TABLE glb_clasiven ALTER COLUMN comision DECIMAL(1,0) NOT NULL
ALTER TABLE glb_clasiven ALTER COLUMN porcomi DECIMAL(6,2) NOT NULL
GO

ALTER TABLE glb_error ALTER COLUMN nombre NVARCHAR(220) NOT NULL 
ALTER TABLE glb_error ALTER COLUMN detalle NVARCHAR(230) NOT NULL
ALTER TABLE glb_error ALTER COLUMN Sug NVARCHAR(230) NOT NULL
GO

ALTER TABLE glb_pais ALTER COLUMN nompais NVARCHAR(30) NOT NULL 
GO


UPDATE Glb_Parametros SET licencia = ''  WHERE licencia IS NULL 
UPDATE Glb_Parametros SET verbd = ''  WHERE verbd IS NULL 
GO
ALTER TABLE Glb_Parametros ALTER COLUMN licencia bit NOT NULL 
ALTER TABLE Glb_Parametros ALTER COLUMN verbd nvarchar(20) NOT NULL
GO

IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'glb_transaccion' and COLUMN_NAME='cxcmovinv' )
BEGIN
	ALTER TABLE  glb_transaccion ADD  cxcmovinv bit NOT NULL CONSTRAINT DF_glb_transaccion_cxcmovinv Default ''
	Print 'glb_transaccion - cxcmovinv'
END
GO


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros'  AND T.column_name = 'rutafacelec') 
BEGIN 
	ALTER TABLE Glb_Parametros ADD rutafacelec  nvarchar(200) NOT NULL CONSTRAINT DF_Glb_Parametros_rutafacelec DEFAULT ''
	Print 'Glb_Parametros - rutafacelec' --ing lis 05/10/2018
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros'  AND T.column_name = 'Obligarmail') 
BEGIN 
	ALTER TABLE Glb_Parametros ADD Obligarmail  bit NOT NULL CONSTRAINT DF_Glb_Parametros_Obligarmail DEFAULT 0
	Print 'Glb_Parametros - Obligarmail' --ing lis 19/10/2018
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_usuarios'  AND T.column_name = 'OmitirTurno') 
BEGIN 
	ALTER TABLE glb_usuarios ADD OmitirTurno  bit NOT NULL CONSTRAINT DF_glb_usuarios_OmitirTurno DEFAULT 0
	Print 'glb_usuarios - OmitirTurno' --ing lis 23/10/2018 -- falta por incluir en el esquema
END
GO  

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas'  AND T.column_name = 'motivodev') 
BEGIN 
	ALTER TABLE ven_notas ADD motivodev  nvarchar(4) NOT NULL CONSTRAINT DF_ven_notas_motivodev DEFAULT ''
	Print 'ven_notas - motivodev' --ing lis 07/11/2018 -- 
END
GO  

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_sucursal'  AND T.column_name = 'rutasinc') 
BEGIN 
	ALTER TABLE glb_sucursal add rutasinc nvarchar(200) not null CONSTRAINT DF_glb_sucursal_rutasinc DEFAULT ''
	Print 'glb_sucursal - rutasinc' --ing PriscyReales 14/11/2018 -- 
END
GO  

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros'  AND T.column_name = 'observater') 
BEGIN 
	ALTER TABLE glb_terceros add observater nvarchar(250) not null CONSTRAINT DF_glb_terceros_observater DEFAULT ''
	Print 'glb_terceros - observater' --ing Lissette 26/11/2018 -- 
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion'  AND T.column_name = 'prenfaccr') 
BEGIN 
	ALTER TABLE glb_transaccion add prenfaccr bit not null CONSTRAINT DF_glb_transaccion_prenfaccr DEFAULT 0
	Print 'glb_transaccion - prenfaccr' --ing Lissette 03/01/2019 --  Genera prestamo en facturas credito.  
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros'  AND T.column_name = 'GsPlus') 
BEGIN 
	ALTER TABLE glb_parametros add GsPlus bit not null CONSTRAINT DF_glb_parametros_glbplus DEFAULT 0
	Print 'glb_parametros - GsPlus' --ing Lissette 10/01/2019 --  campos de gscontrac
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros'  AND T.column_name = 'GsFecActualizacion') 
BEGIN 
	ALTER TABLE glb_parametros add GsFecActualizacion date not null CONSTRAINT DF_glb_parametros_GsFecActualizacion DEFAULT getdate()
	Print 'glb_parametros - GsFecActualizacion' --ing Lissette 10/01/2019 --  campos de gscontrac
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros'  AND T.column_name = 'GsFecActual') 
BEGIN 
	ALTER TABLE glb_parametros add GsFecActual date not null CONSTRAINT DF_glb_parametros_GsFecActual DEFAULT getdate()
	Print 'glb_parametros - GsFecActual' --ing Lissette 10/01/2019 --  campos de gscontrac
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros'  AND T.column_name = 'GsFecinicontra') 
BEGIN 
	ALTER TABLE glb_parametros add GsFecinicontra date not null CONSTRAINT DF_glb_parametros_GsFecinicontra DEFAULT getdate()
	Print 'glb_parametros - GsFecinicontra' --ing Lissette 10/01/2019 --  campos de gscontrac
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_Usuarios'  AND T.column_name = 'pespecial3') 
BEGIN 
	ALTER TABLE glb_Usuarios add pespecial3 bit not null CONSTRAINT DF_glb_Usuarios_pespecial3 DEFAULT 0
	Print 'glb_Usuarios - pespecial3' --ing Lissette 22/01/2019 --  campos de gscontrac
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_Usuarios'  AND T.column_name = 'pespecial4') 
BEGIN 
	ALTER TABLE glb_Usuarios add pespecial4 bit not null CONSTRAINT DF_glb_Usuarios_pespecial4 DEFAULT 0
	Print 'glb_Usuarios - pespecial4' --ing Lissette 22/01/2019 --  campos de gscontrac
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_Usuarios'  AND T.column_name = 'pespecial5') 
BEGIN 
	ALTER TABLE glb_Usuarios add pespecial5 bit not null CONSTRAINT DF_glb_Usuarios_pespecial5 DEFAULT 0
	Print 'glb_Usuarios - pespecial5' --ing Lissette 22/01/2019 --  campos de gscontrac
END
GO
---------------------Actualizado 01022019  Ing.Lissette Castro
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_descuentos' AND T.column_name = 'noven') 
begin 
	Alter Table Glb_descuentos Add noven bit not null CONSTRAINT DF_Glb_descuentos_noven default 0
	Print 'Glb_descuentos - noven'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_caja' AND T.column_name = 'cajafis') 
begin 
	Alter Table Glb_caja Add cajafis  decimal(18,4) not null CONSTRAINT DF_cajafis_cajafis default 0
	Print 'Glb_caja - cajafis'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_caja' AND T.column_name = 'cajasis') 
begin 
	Alter Table Glb_caja Add cajasis  decimal(18,4) not null CONSTRAINT DF_cajafis_cajasis default 0
	Print 'Glb_caja - cajasis'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_usuarios' AND T.column_name = 'clausunet') 
begin 
	Alter Table Glb_usuarios Add clausunet  nvarchar(100) not null CONSTRAINT DF_Glb_usuarios_clausunet default ''
	Print 'Glb_usuarios - clausunet'
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'nrocontrato') 
	Alter Table glb_Almacen Add nrocontrato nvarchar(40) Not Null Default '' 
	Print 'Se agregó la columna nrocontrato en glb_almacen.' --Ing. Luis Dominguez 2019-03-18
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Almacen' AND Temp.column_name = 'leyenda') 
	Alter Table glb_Almacen Add leyenda nvarchar(200) Not Null Default '' 
	Print 'Se agregó la columna leyenda en glb_almacen.' --Ing. Luis Dominguez 2019-03-18
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'nogeniva') 
begin 
	Alter Table glb_transaccion Add nogeniva bit not null CONSTRAINT DF_glb_transaccion_nogeniva default 0
	Print 'glb_transaccion - nogeniva'
end 
Go
--Ing. Luis Dominguez 2019-03-26
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'reptaller') 
begin 
	Alter Table glb_empresa Add reptaller nvarchar(50) not null CONSTRAINT DF_glb_empresa_reptaller default ''
	Print 'glb_empresa - reptaller'
end 
Go
--Ing. Luis Dominguez 2019-03-28
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'deciqtyalm')
	Alter Table Glb_Almacen Add deciqtyalm	numeric(5,0) Not Null CONSTRAINT DF_Glb_Almacen_deciqtyalm default 0
	Print 'Se agregó la columna deciqtyalm en glb_almacen.'
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'decivlralm')
	Alter Table Glb_Almacen Add decivlralm	numeric(5,0) Not Null CONSTRAINT DF_Glb_Almacen_decivlralm default 0
	Print 'Se agregó la columna decivlralm en glb_almacen.' --Ing. Luis Dominguez 2019-03-28
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros'  AND T.column_name = 'smtp') 
begin 
	Alter Table glb_parametros Add smtp  NVARCHAR(100)  NOT NULL DEFAULT ''
	Print 'glb_parametros - smtp' -- Ing Lis 01/04/2019
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros'  AND T.column_name = 'correo') 
begin 
	Alter Table glb_parametros Add correo  NVARCHAR(100)  NOT NULL DEFAULT ''
	Print 'glb_parametros - correo' -- Ing Lis 01/04/2019
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros'  AND T.column_name = 'passwordmail') 
begin 
	Alter Table glb_parametros Add passwordmail  varbinary(max) --<<PENDIENTE>>
	Print 'glb_parametros - passwordmail ' -- Ing Lis 01/04/2019
end
go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Empresa' AND Temp.column_name = 'infxlibra') 
Begin
	Alter Table Glb_Empresa Add infxlibra bit Not Null CONSTRAINT DF_Glb_empresa_infxlibra Default 0
	Print 'Se agregó la columna - infxlibra  en glb_empresa '-- Ing Lis 05/04/2019
end 
Go

----------------Actualizado en init 25/04/2019 Andres Jimenez

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_parametros' AND Temp.column_name = 'rutapdf') 
Begin
	Alter Table glb_parametros Add rutapdf nvarchar(200) Not Null CONSTRAINT DF_glb_parametros_rutapdf Default ''
	Print 'Se agregó la columna - rutapdf  en glb_parametros '-- Ing Lis 31/05/2019
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_transaccion' AND Temp.column_name = 'facelecPre') 
Begin
	Alter Table glb_transaccion Add facelecPre bit Not Null CONSTRAINT DF_glb_transaccion_facelecPre Default ''
	Print 'Se agregó la columna - facelecPre  en glb_parametros '-- Ing Lis 31/05/2019
end 
Go


IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'glb_terceros'  AND T.column_name = 'descrip' and t.character_maximum_length!=-1) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='glb_terceros' AND tc.name='descrip')
	BEGIN
		SELECT @Constraint=sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='glb_terceros' AND tc.name='descrip'
		
		SET @sql='ALTER TABLE dbo.glb_terceros DROP CONSTRAINT '+@Constraint	
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.glb_terceros ALTER COLUMN descrip NVARCHAR(MAX)
		SET @sql='ALTER TABLE dbo.glb_terceros ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [descrip ]'
		EXEC SP_EXECUTESQL @sql
		PRINT 'glb_terceros - descrip'  
	END
	ELSE
	BEGIN
		ALTER TABLE dbo.glb_terceros ALTER COLUMN descrip NVARCHAR(MAX)
		PRINT 'glb_terceros - descrip'  
	END
END
GO


IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_usuarios' AND Temp.column_name = 'pordcto') 
Begin
	Alter Table glb_usuarios Add pordcto decimal(10,4) Not Null CONSTRAINT DF_glb_usuarios_pordcto Default 0
	Print 'glb_usuarios - pordcto'-- Ing Lis 05/07/2019  procentaje de descuento por usurio
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_usuarios' AND Temp.column_name = 'vergrpoculto') 
Begin
	Alter Table glb_usuarios Add vergrpoculto bit Not Null CONSTRAINT DF_glb_usuarios_vergrpoculto Default 0
	Print 'glb_usuarios - vergrpoculto'-- Ing Lis 08/07/2019  para visualizar los grupos que ocultaron. 
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'conserec' and T.data_type !='nvarchar' )
begin
    DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql		NVARCHAR(MAX)
	DECLARE @Tabla		nvarchar(90)
	DECLARE @Campo		nvarchar(90)
	Set @Tabla =	'glb_parametros'
	Set @Campo =	'conserec'
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo)
	BEGIN
		SELECT @Constraint=sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo
		
		SET @sql='ALTER TABLE dbo.'+@Tabla+' DROP CONSTRAINT '+@Constraint	
		EXEC SP_EXECUTESQL @sql
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(3) '
		EXEC SP_EXECUTESQL @sql
		SET @sql='ALTER TABLE dbo.'+@Tabla+' ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR ['+@Campo+' ]'
		EXEC SP_EXECUTESQL @sql
		PRINT @Tabla+' - '+@Campo  
	end 
	else
	begin  
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(3) '
		EXEC SP_EXECUTESQL @sql
	end 
end 
Go    --Ing Luis Dominguez 20190715

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'consevta' and T.data_type !='nvarchar' )
begin
    DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql		NVARCHAR(MAX)
	DECLARE @Tabla		nvarchar(90)
	DECLARE @Campo		nvarchar(90)
	Set @Tabla =	'glb_parametros'
	Set @Campo =	'consevta'
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo)
	BEGIN
		SELECT @Constraint=sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo
		
		SET @sql='ALTER TABLE dbo.'+@Tabla+' DROP CONSTRAINT '+@Constraint	
		EXEC SP_EXECUTESQL @sql
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(3) '
		EXEC SP_EXECUTESQL @sql
		SET @sql='ALTER TABLE dbo.'+@Tabla+' ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR ['+@Campo+' ]'
		EXEC SP_EXECUTESQL @sql
		PRINT @Tabla+' - '+@Campo  
	end 
	else
	begin  
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(3) '
		EXEC SP_EXECUTESQL @sql
	end 
end 
Go   --Ing Luis Dominguez 20190715

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_transaccion' AND Temp.column_name = 'sindctovta') 
Begin
	Alter Table glb_transaccion Add sindctovta bit Not Null CONSTRAINT DF_glb_transaccion_sindctovta Default 0
	Print 'glb_transaccion - sindctovta'-- Ing Lis 20/07/2019 .t. no tiene dcto de terceros 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'ctatrasdes') 
Begin
	Alter Table glb_almacen Add ctatrasdes bit Not Null CONSTRAINT DF_glb_almacen_ctatrasdes Default 0
	Print 'glb_almacen - ctatrasdes'-- Ing Lis 15/08/2019 .t. no tiene dcto de terceros 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'impespecialFac') 
Begin
	Alter Table glb_almacen Add impespecialFac bit Not Null CONSTRAINT DF_glb_almacen_impespecialFac Default 0
	Print 'glb_almacen - impespecialFac'-- Ing Lis 23/08/2019 .t. impresion especial en factura 
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_almacen' AND Temp.column_name = 'exentoico') 
Begin
	Alter Table glb_almacen Add exentoico bit Not Null CONSTRAINT DF_glb_almacen_exentoico Default 0
	Print 'glb_almacen - exentoico'-- Ing Lis 27/08/2019 .t. exento en ico  
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_terceros' AND Temp.column_name = 'terregimpo') 
Begin
	Alter Table glb_terceros Add terregimpo bit Not Null CONSTRAINT DF_glb_terceros_terregimpo Default 0
	Print 'glb_terceros - terregimpo'-- Ing Lis 17/09/2019 TERcero REGimen IMPO impuesto al consumo. 
end 
Go
--HABILITO LOS CAMBIOS PARA LA TABLA JHONATAN 25/11/2022
ALTER TABLE Glb_Equivalentes_FE 
   ENABLE CHANGE_TRACKING; 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_terceros' AND Temp.column_name = 'responsabilidad') 
Begin
	Alter Table glb_terceros Add responsabilidad nvarchar(10) Not Null CONSTRAINT DF_glb_terceros_responsabilidad Default ''
	Print 'glb_terceros - responsabilidad'-- Ing Lis 17/09/2019 responsabilidad fiscal. 
end 
Go
----SERGUNDO CAMBIO DE JHONATAN 25/11/2022

ALTER TABLE Glb_Equivalentes_FE 
   DISABLE CHANGE_TRACKING; 

   alter table Glb_Equivalentes_FE drop constraint PK_Glb_Equivalentes_FE; 
  
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Equivalentes_FE' AND T.column_name = 'codigo' and T.CHARACTER_MAXIMUM_LENGTH!='10' )
 
begin
    DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql		NVARCHAR(MAX)
	DECLARE @Tabla		nvarchar(90)
	DECLARE @Campo		nvarchar(90)
	Set @Tabla =	'Glb_Equivalentes_FE'
	Set @Campo =	'Codigo'
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo)
	BEGIN
		SELECT @Constraint=sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo
		
		SET @sql='ALTER TABLE dbo.'+@Tabla+' DROP CONSTRAINT '+@Constraint	
		EXEC SP_EXECUTESQL @sql
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(20) '
		EXEC SP_EXECUTESQL @sql
		SET @sql='ALTER TABLE dbo.'+@Tabla+' ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR ['+@Campo+' ]'
		EXEC SP_EXECUTESQL @sql
		PRINT @Tabla+' - '+@Campo  
	end 
	else
	begin  
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(20) '
		EXEC SP_EXECUTESQL @sql
	end 
end 
--ALTER TABLE [dbo].[Glb_Equivalentes_FE] ADD  CONSTRAINT [PK_Glb_Equivalentes_FE] PRIMARY KEY CLUSTERED 
--(
--	[Codigo] ASC,
--	[origen] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--ALTER TABLE Glb_Equivalentes_FE 
--   ENABLE CHANGE_TRACKING; 

Go   --Ing Lissette 26/09/2019

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Equivalentes_FE' AND T.column_name = 'nombre' and T.CHARACTER_MAXIMUM_LENGTH!='200' )
begin
    DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql		NVARCHAR(MAX)
	DECLARE @Tabla		nvarchar(90)
	DECLARE @Campo		nvarchar(90)
	Set @Tabla =	'Glb_Equivalentes_FE'
	Set @Campo =	'nombre'
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo)
	BEGIN
		SELECT @Constraint=sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo
		
		SET @sql='ALTER TABLE dbo.'+@Tabla+' DROP CONSTRAINT '+@Constraint	
		EXEC SP_EXECUTESQL @sql
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(200) '
		EXEC SP_EXECUTESQL @sql
		SET @sql='ALTER TABLE dbo.'+@Tabla+' ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR ['+@Campo+' ]'
		EXEC SP_EXECUTESQL @sql
		PRINT @Tabla+' - '+@Campo  
	end 
	else
	begin  
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(200) '
		EXEC SP_EXECUTESQL @sql
	end 
end 
Go   --Ing Lissette 26/09/2019

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Equivalentes_FE' AND T.column_name = 'origen' and T.CHARACTER_MAXIMUM_LENGTH!='10' )
begin
    DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql		NVARCHAR(MAX)
	DECLARE @Tabla		nvarchar(90)
	DECLARE @Campo		nvarchar(90)
	Set @Tabla =	'Glb_Equivalentes_FE'
	Set @Campo =	'origen'
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo)
	BEGIN
		SELECT @Constraint=sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@Tabla AND tc.name=@Campo
		
		SET @sql='ALTER TABLE dbo.'+@Tabla+' DROP CONSTRAINT '+@Constraint	
		EXEC SP_EXECUTESQL @sql
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(10) '
		EXEC SP_EXECUTESQL @sql
		SET @sql='ALTER TABLE dbo.'+@Tabla+' ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR ['+@Campo+' ]'
		EXEC SP_EXECUTESQL @sql
		PRINT @Tabla+' - '+@Campo  
	end 
	else
	begin  
		Set @sql = 'ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@Campo+' NVARCHAR(10) '
		EXEC SP_EXECUTESQL @sql
	end 
end 
Go   --Ing Lissette 26/09/2019

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_terceros' AND Temp.column_name = 'regimen_fe') 
Begin
	Alter Table glb_terceros Add regimen_fe nvarchar(20) Not Null CONSTRAINT DF_glb_terceros_regimen_fe Default ''
	Print 'glb_terceros - regimen_fe'-- Ing Lis 26/09/2019 regimen FE. 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'zonapostal') 
begin 
	Alter Table glb_terceros Add zonapostal nvarchar(10) not null CONSTRAINT DF_glb_terceros_zonapostal DEFAULT ''
	Print 'glb_terceros - zonapostal'
end
Go



IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'ctamov') 
begin 
	Alter Table glb_parametros Add ctamov bit not null CONSTRAINT DF_glb_parametros_ctamov DEFAULT 0
	Print 'glb_parametros - ctamov'
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'PorVtaCree')
	Alter Table Glb_Terceros Add PorVtaCree numeric(8,0)  not null  DEFAULT 0
	Print 'Glb_Terceros - PorVtaCree'
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'declaracion' and t.CHARACTER_MAXIMUM_LENGTH!=250 )
	Alter Table Glb_Terceros add declaracion nvarchar(250) 
Go

delete from glb_idx where tabla='GLB_TERCEROS' and nomidx='CODBAR'

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'periodo')
	Alter Table Glb_Terceros Add periodo decimal(1,0)  not null CONSTRAINT DF_Glb_Terceros_periodo DEFAULT 0
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'upgvmcl')
	Alter Table Glb_Terceros Add upgvmcl decimal(18,4)  not null CONSTRAINT DF_Glb_Terceros_upgvmcl DEFAULT 0
Go
----Shirley Rojas 01-07-2020
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Parametros' AND T.column_name = 'valtasa')
	Alter Table Glb_Parametros Add valtasa Bit Not Null Default 0
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empmensajeria' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table glb_empmensajeria ADD fecsys datetime not null DEFAULT getdate()
	Print 'glb_empmensajeria - fecsys s'  -- Ing. Shirley R 16 Jul 2020 Para Ecommerce Fenicio
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Terceros' AND T.Column_Name = 'codtoken')
begin 
	Alter Table Glb_Terceros add codtoken nvarchar(60) not null default('')  --23-07-2020 Ing. shirley R.Creado para proyecto de Fideli - Arnold Sandoval
	print 'Glb_terceros - codtoken'
end

Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'codtoken')
	Alter Table Glb_Almacen Add codtoken	nvarchar(60) not null default('')  --23-07-2020 Ing. shirley R.Creado para proyecto de Fideli - Arnold Sandoval
	print 'Glb_almacen - codtoken'
	
Go

---- Actualizado Yaslen Andrade f. 05-08-2020 campo enviado por Jennifer R. para uso de varias impresoras en comandas de Chicken
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'separarArt') 
begin 
	alter table glb_almacen add  separarArt BIT DEFAULT 0
	Print 'glb_almacen -  separarArt'
end
Go

 -- 19-08-2020 Yaslen Andrade Se cambio el tipo de dato para usarlo en la impresion de Balance General de las FAC, autorizado por Jennifer Rodriguez
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_empresa' AND T.Column_Name = 'resempN')
	begin
	    Alter Table Glb_empresa Add resempN bit Not Null Default 0 
	    print 'Glb_empresa - resempN' 
	end   
else 
	 begin
	   if exists (SELECT * FROM sys.sysobjects WHERE name like '%DF_glb_empresa_resempn%')
	     begin 
	       ALTER TABLE Glb_empresa DROP CONSTRAINT DF_glb_empresa_resempN
	       Alter Table Glb_empresa  Alter Column resempN bit not null   
    	   Alter Table Glb_empresa add Default 0 for resempN 
	     end
	 end 
GO

---- Campos Antiguos que existen pero que no estan en el restruct y Arnold los necesitaba en la App de Deliloco
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_Almacen' AND T.column_name = 'item')
	alter table glb_almacen add	item numeric(10, 0) NOT NULL DEFAULT(0)
	print 'Glb_almacen - item'
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_almacen' AND T.column_name = 'servidor')
  BEGIN	
	alter table Glb_almacen add	servidor nvarchar(60) NOT NULL DEFAULT('')
	print 'Glb_almacen - servidor'
  END
ELSE
   BEGIN
   Declare @default varchar(max) = (SELECT default_constraints.name FROM sys.all_columns INNER JOIN sys.tables ON all_columns.object_id = tables.object_id INNER JOIN  sys.schemas
        ON tables.schema_id = schemas.schema_id INNER JOIN sys.default_constraints ON all_columns.default_object_id = default_constraints.object_id
		WHERE schemas.name = 'dbo' AND tables.name = 'Glb_almacen' AND all_columns.name = 'servidor')

		declare @sql varchar(max) = 'alter table Glb_almacen drop ' + @default
		EXEC (@sql)
   ALter table Glb_almacen add constraint df_Glb_almacen_servidor default ('') for servidor
   declare @sql2 varchar(max) = 'update Glb_almacen set servidor = '''''
   EXEC(@sql2)
   alter table Glb_almacen alter column servidor nvarchar(60) NOT NULL 
   print 'Glb_almacen - servidor'
   END
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'glb_usuarios' AND T.column_name = 'tiprut')
	alter table glb_usuarios add tiprut nvarchar(4) NOT NULL DEFAULT('')
	print 'glb_usuarios - tiprut'
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_caja' AND T.Column_Name = 'servidor')
	Alter Table Glb_caja add servidor nvarchar(60) NULL 
	print 'Glb_caja - servidor'
Go
IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('Glb_caja')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'servidor'
							AND object_id = OBJECT_ID('Glb_caja'))				
		)
	BEGIN
		ALTER TABLE Glb_caja ADD CONSTRAINT DF_Glb_caja_servidor DEFAULT ('SERVER') FOR servidor
END
GO

---- 10-09-2020 Yaslen Andrade Solicitados por Jennifer R. para la implementación de membresias de Hotel Pradomar

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'glb_terceros' AND T.column_name = 'fimembresia')
	alter table glb_terceros add fimembresia date 
	print 'glb_terceros - fimembresia'
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'glb_terceros' AND T.column_name = 'ffmembresia')
	alter table glb_terceros add ffmembresia date 
	print 'glb_terceros - ffmembresia'
Go
--- 11-09-2020 Yaslen Andrade  campo agregado para traer tarifas de domicilio en la aplicación 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Barrio' AND T.Column_Name = 'servidor')
	Alter Table Glb_Barrio add servidor nvarchar(60) NULL 
	print 'Glb_Barrio - servidor'
Go
IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('Glb_Barrio')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'servidor'
							AND object_id = OBJECT_ID('Glb_Barrio'))				
		)
	BEGIN
		ALTER TABLE Glb_Barrio ADD CONSTRAINT DF_Glb_Barrio_servidor DEFAULT ('SERVER') FOR servidor
END
GO
----17-09-2020 Yaslen Andrade agregado para las notificaciones de los pedidos que llegan
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'glb_parametros' AND T.column_name = 'urlnotificador')
	alter table glb_parametros add urlnotificador VARCHAR(50) NULL
	print 'glb_parametros - urlnotificador'
Go

if not exists (select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_barrio' AND T.COLUMN_NAME = 'timeentrega')
    alter table glb_barrio add timeentrega nvarchar(4) NOT NULL DEFAULT ('0') --Tiempo de entrega en minutos que tardará el domiciliario en entregar el pedido en ese barrio,  Arnold Sandoval  A. 18/09/2020
	print 'glb_barrio - timeentrega'
GO

------Agregado por Arnold Sandoval 19-09-2020 La cual es necesaria para realizar operacion de consulta y guardado sobre esta tabla por parte del .Net.
 IF not exists (Select * From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'Glb_TouchImpresoras' and left(constraint_name, 2) = 'PK')
   BEGIN
     alter table Glb_TouchImpresoras add constraint PK_Glb_TouchImpresoras primary key clustered (idemp, CodAlm, ItemImp)
	 print 'Glb_TouchImpresoras - llave primaria creada'
   END

----- Agregado por Arnold Sandoval 12-01-2021- permite establecer si el inventario del almacen se va a consolidar en el ecommerce
if not exists(Select* from INFORMATION_SCHEMA.COLUMNS T where t.TABLE_NAME = 'glb_almacen' and t.COLUMN_NAME = 'invecommerce') 
  Begin  
   alter table glb_almacen add invecommerce bit not null default (0)
    print 'Glb_Almacen - invecommerce'
  End
GO
----- Agregado por Arnold Sandoval 12-01-2021- para delimitar la cantidad minima que se va a devolver en el ecommerce
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'Glb_Parametros' and T.COLUMN_NAME = 'canminecomerce')
   alter table glb_parametros add canminecomerce numeric(6,2) not null default(0)
   print 'glb_parametros  - canminecomerce'

GO

alter table Glb_Equivalentes_FE alter column Codigo nvarchar(20) NOT NULL
GO
alter table Glb_Equivalentes_FE alter column origen nvarchar(10) NOT NULL
GO
--SOLUCION JHONATAN 24/11/2022 "Table 'Glb_Equivalentes_FE' already has a primary key defined on it."

if not exists (select * from dbo.sysobjects where id = object_id('[dbo].[PK_Glb_Equivalentes_FE]'))
begin 
alter table Glb_Equivalentes_FE add constraint PK_Glb_Equivalentes_FE primary key (codigo, origen)
  	-- ALTER TABLE Glb_Equivalentes_FE
   --ENABLE CHANGE_TRACKING;
end
GO

--- 25-01-2021 Creado por Ing. Jennifer Rodriguez para establecer pantalla de ayuda de seleccion multiple de los articulos en producción

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_Empresa' AND Temp.column_name = 'ayudapro') 
	Alter Table Glb_Empresa Add ayudapro VARCHAR(50) Not Null Default ''
	print 'Glb_Empresa  - ayudapro'
Go 
--- 18-02-2021 Agregado para desarrollo de santana en las ordenes de producción
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'glb_empresa' AND Temp.column_name = 'ayudapro') 
begin 
	Alter Table glb_empresa Add ayudapro nvarchar(20) Not Null Default ''
	Print 'glb_empresa ayudapro' --Ing. Lissette 2021-02-16
end
Go

--- 24-03-2021 Agregado por Arnold Sandoval- Permitirá que la api de globalsoft interactúe con varias bases de datos de cada razón social, aparte de la principal. Este es el caso cuando una empresa tiene mas de una razon social. (Herradura)
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'mas_razonsoc')
begin 
	Alter Table Glb_Parametros add mas_razonsoc bit NOT NULL DEFAULT 0
	Print 'Glb_Parametros - mas_razonsoc'
end 
Go

---- 06-04-2021 Agregado por Arnold Sandoval- Especifica el código del consecutivo de pre facturas con el cual trabajará la Api 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'codprefactapi')
  begin 
     alter table glb_parametros add codprefactapi nvarchar(2) NULL DEFAULT('')
	 	Print 'Glb_Parametros - codprefactapi'
  end
Go

--- 22-04-2021 Campos agregados para desarrollo de nomina en gegasa de creacion de archivo plano para bancos
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Glb_bancos' AND T.column_name = 'Nomina')
  begin 
	Alter Table Glb_bancos Add Nomina Bit Not Null Default 0
	Print 'Gbl_banco  -  Nomina'
  end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_bancos' AND T.Column_Name = 'Codigo')
  begin 
     alter table Glb_bancos add Codigo nchar(10) NOT NULL DEFAULT('')
	 	Print 'Glb_bancos - Codigo'
  end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_bancos' AND T.Column_Name = 'Inicial')
  begin 
     alter table Glb_bancos add Inicial nchar(10) NOT NULL DEFAULT('')
	 	Print 'Glb_bancos - Inicial'
  end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_bancos' AND T.Column_Name = 'Valfijo')
  begin 
     alter table Glb_bancos add Valfijo nchar(10) NOT NULL DEFAULT('')
	 	Print 'Glb_bancos - Valfijo'
  end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_bancos' AND T.Column_Name = 'Cuentanom')
  begin 
     alter table Glb_bancos add Cuentanom nvarchar(20) NOT NULL DEFAULT('')
	 	Print 'Glb_bancos - Cuentanom'
  end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_bancos' AND T.Column_Name = 'Valfijo2')
  begin 
     alter table Glb_bancos add Valfijo2 nchar(10) NOT NULL DEFAULT('')
	 	Print 'Glb_bancos - Valfijo2'
  end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_bancos' AND T.Column_Name = 'Codigo_emp')
  begin 
     alter table Glb_bancos add Codigo_emp nchar(10) NOT NULL DEFAULT('')
	 	Print 'Glb_bancos - Codigo_emp'
  end
Go
---- Campo agregado por Ing. Jennifer R. para la exogena Formato 2276
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_empresa' AND T.Column_Name = 'EntidadInf')
  begin 
     alter table Glb_empresa add EntidadInf nvarchar(2) NOT NULL DEFAULT('')
	 	Print 'Glb_empresa - EntidadInf'
  end
Go
------ Campos agregados por Arnold Sandoval para el enlace con app de Ilahui en Wordpress
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'urlapiwordpress') 
begin 
	Alter Table Glb_Parametros	Add urlapiwordpress nvarchar(200) NOT NULL DEFAULT ''
	Print 'Glb_Parametros - urlapiwordpress'  
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'intervalo') 
begin 
	Alter Table Glb_Parametros	Add intervalo int NOT NULL DEFAULT (0)
	Print 'Glb_Parametros - intervalo'  
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'clavewordpress') 
begin 
	Alter Table Glb_Parametros	Add clavewordpress nvarchar(100) NOT NULL DEFAULT ('')
	Print 'Glb_Parametros - clavewordpress'  
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'secretwordpress') 
begin 
	Alter Table Glb_Parametros	Add secretwordpress nvarchar(100) NOT NULL DEFAULT ('')
	Print 'Glb_Parametros - secretwordpress'  
end 
Go

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_almacen' AND T.COLUMN_NAME = 'urlserviceprinter')
BEGIN
  Alter table glb_almacen add urlserviceprinter nvarchar(100) NOT NULL DEFAULT('')
END
GO

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'Glb_parametros' And T.COLUMN_NAME = 'actpreciowordpress')
   BEGIN  
     alter table Glb_parametros add actpreciowordpress bit NOT NULL DEFAULT(0)
	 print 'Glb_parametros - actpreciowordpress'
   END

---- Campo Agregado por Ing. Jennifer para guardar monto egreso en salida de efectivo 21-06-2021
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_caja' AND T.COLUMN_NAME = 'egresos')
BEGIN
  Alter table glb_caja add egresos decimal(18,4) NOT NULL DEFAULT (0)
  Print 'Glb_caja - egresos' 
END
GO

---- 19-07-2021 Campos Agregados por Arnold Sandoval para desarrollo de Inactivar artículos en Pleitz
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'rutagspleizt')
   BEGIN
     alter table glb_parametros add rutagspleizt nvarchar(100) NOT NULL DEFAULT('')
	 print 'glb_parametros - rutagspleizt'
   END

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'clientidpleizt')
   BEGIN
     alter table glb_parametros add clientidpleizt nvarchar(60) NOT NULL DEFAULT('')
	  print 'glb_parametros - clientidpleizt'
   END
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'clientsecretpleizt')
   BEGIN
     alter table glb_parametros add clientsecretpleizt nvarchar(60) NOT NULL DEFAULT('')
	  print 'glb_parametros - clientsecretpleizt'
   END
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'exptokenpleitzt')
   BEGIN
     alter table glb_parametros add exptokenpleitzt datetime NOT NULL DEFAULT('19000101')
	 print 'glb_parametros - exptokenpleitzt'
   END
 if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'urlpleizt')
   BEGIN
     alter table glb_parametros add urlpleizt nvarchar(60) NOT NULL DEFAULT('')
	 print 'glb_parametros - urlpleizt'
   END
 if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'glb_parametros' AND T.COLUMN_NAME = 'tokenpleizt')
   BEGIN
     alter table glb_parametros add tokenpleizt nvarchar(100) NOT NULL DEFAULT('')
	 print 'glb_parametros - tokenpleizt'
   END

---- 22-07-2021 Campos agregados para desarrollo de Nomina Electronica. Arnold Sandoval
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'urlnom') 
begin 
	Alter Table Glb_Parametros	Add urlnom nvarchar(200) NOT NULL DEFAULT ''
	Print 'Glb_Parametros - urlnom'  
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros' AND T.column_name = 'rutanomelec' 
		and t.CHARACTER_MAXIMUM_LENGTH!=200) 
begin 
	Alter Table Glb_Parametros alter column rutanomelec nvarchar(200) 
	Print 'Glb_Parametros - rutanomelec'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'rutanomelec') 
begin 
	Alter Table Glb_Parametros	Add rutanomelec nvarchar(200) NOT NULL DEFAULT ''
	Print 'Glb_Parametros - rutanomelec'  
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'rangoneini') 
begin 
	Alter Table Glb_Parametros	Add rangoneini int NOT NULL DEFAULT (1)
	Print 'Glb_Parametros - rangoneini'  
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'prefnomen') 
begin 
	Alter Table Glb_Parametros	Add prefnomen nvarchar(4) NOT NULL DEFAULT ('')
	Print 'Glb_Parametros - prefnomen'  
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'consene') 
begin 
	Alter Table Glb_Parametros	Add consene int NOT NULL DEFAULT (0)
	Print 'Glb_Parametros - consene'  
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'netokenEnterprise') 
begin 
	Alter Table Glb_Parametros Add netokenEnterprise nvarchar(100) NOT NULL DEFAULT ('')
	Print 'Glb_Parametros - netokenEnterprise'  
end 
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'netokenPassword') 
begin 
	Alter Table Glb_Parametros Add netokenPassword nvarchar(100) NOT NULL DEFAULT ('')
	Print 'Glb_Parametros - netokenPassword'  
end 
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_Parametros' AND T.column_name = 'idSoftware' 
		and t.CHARACTER_MAXIMUM_LENGTH!=40) 
begin 
	Alter Table Glb_Parametros alter column idSoftware nvarchar(40) 
	Print 'Glb_Parametros - idSoftware'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'idSoftware') 
begin 
	Alter Table Glb_Parametros Add idSoftware nvarchar(40) NOT NULL DEFAULT ('')
	Print 'Glb_Parametros - idSoftware'  
end 

Go

-- 03-11-2021 Campos agregados por Arnold Sandoval para personalizacion de tamaño de tiquete en comanda web
IF not exists(SELECT* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_empresa' AND T.COLUMN_NAME = 'tirempweb')
 BEGIN
  alter table glb_empresa add tirempweb nvarchar(30) NOT NULL DEFAULT('rptfactura')
  print 'glb_empresa - tirempweb'
 END
GO
IF not exists(SELECT* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_empresa' AND T.COLUMN_NAME = 'factwidth')
 BEGIN
  alter table glb_empresa add factwidth nvarchar(2) NOT NULL DEFAULT('80')
  print 'glb_empresa - factwidth'
 END
GO
IF not exists(SELECT* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_empresa' AND T.COLUMN_NAME = 'comanwidth')
 BEGIN
  alter table glb_empresa add comanwidth nvarchar(2) NOT NULL DEFAULT('80')
  print 'glb_empresa - comanwidth'
 END
GO
IF not exists(SELECT* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_unica' AND T.COLUMN_NAME = 'tirempweb')
 BEGIN
  alter table glb_unica add tirempweb nvarchar(30) NOT NULL DEFAULT('')
  print 'glb_unica - tirempweb'
 END
GO

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'Glb_Parametros' AND T.COLUMN_NAME = 'rutabddbf')
   BEGIN
     alter table Glb_Parametros add rutabddbf nvarchar(200) NOT NULL DEFAULT('')
   END

------- 06-12-2021 Ing Jennifer Rodriguez
 if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'Glb_almacen' AND T.COLUMN_NAME = 'promolin')
   BEGIN
     alter table Glb_almacen add promolin bit NOT NULL DEFAULT(0)
	 print 'Glb_almacen - promolin'
   END

----- 12-01-2022 Lissette Castro desarrollo de unificar descargue de inventario a un solo centro en el touch City Holding
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'invotrcto') 
begin
	Alter Table glb_almacen Add invotrcto bit not null default 0 --inventario otro centro 
	Print 'glb_almacen - invotrcto'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'codctoinv') 
begin
	Alter Table glb_almacen Add codctoinv nvarchar(3) not null default '' --Centro de descargue de inventario 
	Print 'glb_almacen - codctoinv'
end 
Go
---------25-03-2022 Creado por Jennifer Rodriguez, establecer tirilla de comanda en domicilios
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Glb_empresa' AND T.column_name = 'tirdomi') 
begin
	Alter Table Glb_empresa Add tirdomi nchar(20) not null default ''
	Print 'Glb_empresa - tirdomi'
end 
Go
-------- 01-07-2022 Creado Por Jennifer Rodriguez  
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'Glb_terceros' And T.COLUMN_NAME = 'medico')
   BEGIN  
     alter table Glb_terceros add medico bit NOT NULL DEFAULT(0)
	 print 'Glb_terceros - medico'
   END

------ 09-08-2022 creado por Jennifer Rodriguez para pedir impresora en informe de consumo
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_almacen' And T.COLUMN_NAME = 'impresora')
   BEGIN  
     alter table glb_almacen add impresora bit NOT NULL DEFAULT(0)
	 print 'glb_almacen - impresora'
   END 
   ------ 26-07-2023 creado por Daniel Donado para pedir Stiker
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T WHERE T.TABLE_NAME = 'glb_almacen' And T.COLUMN_NAME = 'sticker')
   BEGIN  
     alter table glb_almacen add sticker bit NOT NULL DEFAULT(0)
	 print 'glb_almacen - sticker'
   END 
------20-09-2022 Campo agregado Luis Fernando Ferreira para integración con recepcion
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'urlrecepcion') begin 
	Alter Table Glb_Parametros	Add urlrecepcion nvarchar(200) NOT NULL DEFAULT ''
	Print 'Glb_Parametros - urlrecepcion'  
end 
Go
------28-10-2022 Lissette Castro para habilitar otro rango de fecha en la empresa
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'fecmovini2') 
begin	
	Alter Table glb_empresa Add fecmovini2 date Null 
	Print 'glb_empresa - fecmovini2'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'fecmovfin2') 
begin	
	Alter Table glb_empresa Add fecmovfin2 date Null 
	Print 'glb_empresa - fecmovfin2'
end
Go
------ Agregados porque se usan en visual, Migración Cootransa 28-12-2022
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'rango') 
begin
	Alter Table glb_terceros Add rango numeric (1,0) Not Null Default 0 
	Print 'glb_terceros - rango'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'saldo') 
begin
	Alter Table glb_terceros Add saldo bit Not Null Default 0
	Print 'glb_terceros - saldo'
end
Go
----- 29-08-2023 Agregado por Lissette Castro Desarrollo de Tinajo artículos por transacciones
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_transaccion' AND T.column_name = 'GruReplica') 
begin 
	alter table glb_transaccion add GruReplica char(1) not null DEFAULT ' '
	Print 'glb_transaccion - GruReplica'
end
Go
-- 29-12-2023 Agregado por Lissete Castro, pago de intereses por Mora en RC
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_descuentos' AND T.column_name = 'InteresRC') 
begin	
	Alter Table glb_descuentos Add InteresRC bit Not Null Default 0
	Print 'glb_descuentos - InteresRC'
end
Go
--------- 30-05-2024 Agregado por JR para habilitar horario transaccion FE
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'horarioi') 
begin	
	Alter Table glb_almacen Add horarioi nchar(10) not null default ''
	Print 'glb_almacen - horarioi'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'horariof') 
begin	
	Alter Table glb_almacen Add horariof nchar(10) not null default ''
	Print 'glb_almacen - horariof'
end
Go
----- 28-06-2024 Agregado por Yaslen Andrade para Facturacion electrónica son Software Propio
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'TipoSoftware') 
begin	
	Alter Table glb_parametros Add TipoSoftware nchar(5) not null default ''
	Print 'glb_parametros - TipoSoftware'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'ClaveTecSoft') 
begin	
	Alter Table glb_unica Add ClaveTecSoft nvarchar(100) not null default ''
	Print 'glb_unica - ClaveTecSoft'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_parametros' AND T.column_name = 'AmbienteFe') 
begin	
	Alter Table glb_parametros Add AmbienteFe nchar(1) not null default ''
	Print 'glb_parametros - AmbienteFe'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'CodEmpDian') 
begin	
	Alter Table glb_empresa Add CodEmpDian nvarchar(100) not null default ''
	Print 'glb_empresa - CodEmpDian'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'tokenfirmaapidian_emp') 
begin	
	Alter Table glb_empresa Add tokenfirmaapidian_emp nvarchar(100) not null default ''
	Print 'glb_empresa - tokenfirmaapidian_emp'
end
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'SendMail') 
begin	
	Alter Table glb_empresa Add SendMail nvarchar(50) not null default ''
	Print 'glb_empresa - SendMail'
end
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_empresa' AND T.column_name = 'PasswordMail') 
begin	
	Alter Table glb_empresa Add PasswordMail nvarchar(50) not null default ''
	Print 'glb_empresa - PasswordMail'
end
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'rangoFinResol') 
begin	
	Alter Table glb_unica Add rangoFinResol nvarchar(20) not null default ''
	Print 'glb_unica - rangoFinResol'
end
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'FecIniResol') 
begin	
	Alter Table glb_unica Add FecIniResol date Null 
	Print 'glb_unica - FecIniResol'
end
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_unica' AND T.column_name = 'FecFinResol') 
begin	
	Alter Table glb_unica Add FecFinResol date Null 
	Print 'glb_unica - FecFinResol'
end