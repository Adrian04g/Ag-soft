/*IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = '' AND Temp.column_name = '') 
	Alter Table glb_transaccion Add traslado bit Not Null Default 0 
*/
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_TablaCon' AND T.Column_name = 'cxcCodcueD')
begin 
	Alter Table Nom_TablaCon Add cxcCodcueD nvarchar (8) Not Null Default ''
	Print 'Nom_TablaCon - cxcCodcueD'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_TablaCon' AND T.Column_name = 'cxcCodcueC')
begin 
	Alter Table Nom_TablaCon Add cxcCodcueC nvarchar (8) Not Null Default ''
	Print 'Nom_TablaCon - cxcCodcueC'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_TablaCon' AND T.Column_name = 'cxcNit')
begin 
	Alter Table Nom_TablaCon Add cxcNit nvarchar (15) Not Null Default ''
	Print 'Nom_TablaCon - cxcNit'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_TablaCon' AND T.Column_name = 'cxcCodCen')
begin 
	Alter Table Nom_TablaCon Add cxcCodCen nvarchar (3) Not Null Default ''
	Print 'Nom_TablaCon - cxcCodCen'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'tipdom')
begin 
	Alter Table Nom_Empleado Add tipdom nvarchar (2) Not Null Default ''
	Print 'Nom_Empleado - tipdom'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'foto')
begin 
	Alter Table Nom_Empleado Add foto Text Not Null Default ''
	Print 'Nom_Empleado - foto'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'nombret' and t.DATA_TYPE!='nvarchar')
begin	
	Alter Table Nom_Empleado Alter Column nombret [nvarchar](120) NOT NULL
	Print 'Nom_Empleado - nombret'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'ibc')
begin
	Alter Table Nom_Empleado Add ibc [decimal](14,2) NOT NULL DEFAULT 0
	Print 'Nom_Empleado - ibc'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'laborasab')
begin
	Alter Table Nom_Empleado Add laborasab [bit] NOT NULL DEFAULT 0
	Print 'Nom_Empleado - laborasab'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'acuepsemp')
begin
	Alter Table Nom_Empleado Add acuepsemp [bit] NOT NULL DEFAULT 0
	Print 'Nom_Empleado - acuepsemp'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'tipvin')
begin
	Alter Table Nom_Empleado Add tipvin [nvarchar](4) NOT NULL DEFAULT ''
	Print 'Nom_Empleado - tipvin'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'imagen')	
begin
	Alter Table Nom_Empleado Drop Column imagen
	Print 'Nom_Empleado - imagen'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Controlcierre' AND T.Column_name = 'año' and t.DATA_TYPE!='int')	-- Agregado por Éduar Álvarez - Febrero 27 de 2015.
begin
	Alter Table Nom_Controlcierre Alter Column año Int
	Print 'Nom_Controlcierre - año'
end
Go

IF NOT EXISTS 	(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'tipvin')	-- Agregado por Éduar Álvarez - Marzo 9 de 2015.
begin
	Alter Table Nom_Empleado Add tipvin nvarchar(4) Not Null DEFAULT ''
	Print 'Nom_Empleado - tipvin'
end
GO 

IF NOT EXISTS 	(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'laborasab')
begin	
	Alter Table Nom_Empleado Add laborasab Bit Not Null DEFAULT 0
	Print 'Nom_Empleado - laborasab'
end
GO

IF NOT EXISTS	(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'laborasab')
begin
	Alter Table Nom_Empleado Add laborasab Bit Not Null DEFAULT 0
	Print 'Nom_Empleado - laborasab'
end
GO

IF NOT EXISTS	(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'acuepsemp')
begin 
	Alter Table Nom_Empleado Add acuepsemp Bit Not Null DEFAULT 0
	Print 'Nom_Empleado - acuepsemp'
end
GO

IF NOT EXISTS	(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.Column_name = 'codcto')	-- Agregado por Éduar Álvarez - Marzo 27 de 2015.
begin
	Alter Table Nom_Empleado Add codcto nvarchar(3) Not Null DEFAULT ''
	Print 'Nom_Empleado - codcto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'tipdocpres')	-- Agregado por Éduar Álvarez - Marzo 2 de 2015.
begin	
	Alter Table Nom_Otrdat Add tipdocpres nVarChar(2) Not Null DEFAULT ''
	Print 'Nom_Otrdat - tipdocpres'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'tipdocrc')
begin	
	Alter Table Nom_Otrdat Add tipdocrc nVarChar(2) Not Null DEFAULT ''
	Print 'Ven_Prefacdetalle - minsalario'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'tipdocxc')
begin	
	Alter Table Nom_Otrdat Add tipdocxc nVarChar(2) Not Null DEFAULT ''
	Print 'Nom_Otrdat - tipdocxc'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'tipdocxp')
begin	
	Alter Table Nom_Otrdat Add tipdocxp nVarChar(2) Not Null DEFAULT ''
	Print 'Nom_Otrdat - tipdocxp'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'codprimvac') -- Adicionado por Éduar Álvarez - Marzo 9 de 2015.
begin	
	Alter Table Nom_Otrdat Add codprimvac nVarChar(8) Not Null DEFAULT ''
	Print 'Nom_Otrdat - codprimvac'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'ctaconduc')
begin
	Alter Table Nom_Otrdat Add ctaconduc nVarChar(8) Not Null DEFAULT ''
	Print 'Nom_Otrdat - ctaconduc'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'conliqprim')
begin	
	Alter Table Nom_Otrdat Add conliqprim BIT Not Null DEFAULT 0
	Print 'Nom_Otrdat - conliqprim'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'ctapagvac')
begin
	Alter Table Nom_Otrdat Add ctapagvac nvarchar(16) Not Null DEFAULT ''
	Print 'Nom_Otrdat - ctapagvac'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'salminin')
begin	
	Alter Table Nom_Otrdat Add salminin Numeric (5,2) Not Null DEFAULT 0
	Print 'Nom_Otrdat - salminin'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'liqcesmin')
begin	
	Alter Table Nom_Otrdat Add liqcesmin Bit Not Null DEFAULT 0
	Print 'Nom_Otrdat - liqcesmin'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'perliqprim')
begin	
	Alter Table Nom_Otrdat Add perliqprim Bit Not Null DEFAULT 0
	Print 'Nom_Otrdat - perliqprim'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'primavaca')
begin	
	Alter Table Nom_Otrdat Add primavaca Bit Not Null Default 0
	Print 'Nom_Otrdat - primavaca'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'liqvacadia')
begin	
	Alter Table Nom_Otrdat Add liqvacadia Bit Not Null Default 0
	Print 'Nom_Otrdat - liqvacadia'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'vacdomingo')
begin
	Alter Table Nom_Otrdat Add vacdomingo Bit Not Null Default 0
	Print 'Nom_Otrdat - vacdomingo'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'ctacrliqprm')
begin	
	Alter Table Nom_Otrdat Add ctacrliqprm nvarchar(16) Not Null Default ''
	Print 'Nom_Otrdat - ctacrliqprm'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'pagparfis')
begin	
	Alter Table Nom_Otrdat Add pagparfis Bit Not Null Default 0
	Print 'Nom_Otrdat - pagparfis'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'cajaxcen')
begin	
	Alter Table Nom_Otrdat Add cajaxcen Bit Not Null Default 0
	Print 'Nom_Otrdat - cajaxcen'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'auxcuoman' and DATA_TYPE!='decimal')
begin	
	Alter Table Nom_Otrdat Alter Column auxcuoman decimal(14,2)
	Print 'Nom_Otrdat - auxcuoman'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.Column_name = 'generaconta')
begin
	Alter Table Nom_Otrdat Add generaconta Bit Not Null Default 1
	Print 'Nom_Otrdat - generaconta'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitarlcr')	-- Agregados por Éduar Álvarez - Marzo 4 de 2015.
begin	
	Alter Table Nom_Seccion	Add nitarlcr [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitarlcr'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitarldb')
begin	
	Alter Table Nom_Seccion	Add nitarldb [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitarldb'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitcescr')
begin	
	Alter Table Nom_Seccion	Add nitcescr [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitcescr'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitcesdb')
begin	
	Alter Table Nom_Seccion	Add nitcesdb [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitcesdb'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitepscr')
begin	
	Alter Table Nom_Seccion	Add nitepscr [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitepscr'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitepsdb')
begin	
	Alter Table Nom_Seccion	Add nitepsdb [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitepsdb'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitpencr')
begin
	Alter Table Nom_Seccion	Add nitpencr [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitpencr'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitpendb')
begin
	Alter Table Nom_Seccion	Add nitpendb [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitpendb'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitprimcr')
begin
	Alter Table Nom_Seccion	Add nitprimcr [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitprimcr'
end
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitprimdb')
begin
	Alter Table Nom_Seccion	Add nitprimdb [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitprimdb'
end
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitvaccr')
begin 
	Alter Table Nom_Seccion	Add nitvaccr [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitvaccr'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Seccion' AND T.Column_name = 'nitvacdb')
begin
	Alter Table Nom_Seccion	Add nitvacdb [nvarchar](1) NOT NULL DEFAULT '0'
	Print 'Nom_Seccion - nitvacdb'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'orden')	-- Agregados por Éduar Álvarez - Marzo 6 de 2015.
begin	
	Alter Table Nom_Transaccion	Add orden [numeric](3) NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - orden'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'ctaxc')
begin	
	Alter Table Nom_Transaccion	Add ctaxc [char](8) NOT NULL DEFAULT ''
	Print 'Nom_Transaccion - ctaxc'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'noaplitfija')
begin	
	Alter Table Nom_Transaccion	Add noaplitfija [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - noaplitfija'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'prioridad')
begin	
	Alter Table Nom_Transaccion	Add prioridad [Numeric](2) NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - prioridad'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'propordia')
begin	
	Alter Table Nom_Transaccion	Add propordia [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - propordia'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'recargos')
begin
	Alter Table Nom_Transaccion	Add recargos [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - recargos'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'tranagru')
begin
	Alter Table Nom_Transaccion	Add tranagru [nvarchar](4) NOT NULL DEFAULT ''
	Print 'Nom_Transaccion - tranagru'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'prodiainca')
begin
	Alter Table Nom_Transaccion	Add prodiainca [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - prodiainca'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'clasif')
begin
	Alter Table Nom_Transaccion	Add clasif [nvarchar](2) NOT NULL DEFAULT ''
	Print 'Nom_Transaccion - clasif'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'gencxc')
begin
	Alter Table Nom_Transaccion	Add gencxc [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - gencxc'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'gencxp')
begin	
	Alter Table Nom_Transaccion	Add gencxp [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - gencxp'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'genrc')
begin	
	Alter Table Nom_Transaccion	Add genrc [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - genrc'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'retencion')
begin	
	Alter Table Nom_Transaccion	Add retencion [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - retencion'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'tfijaformu')
begin	
	Alter Table Nom_Transaccion	Add tfijaformu [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - tfijaformu'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'detalle')
begin	
	Alter Table Nom_Transaccion	Add detalle [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - detalle'
end
Go

IF EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'tran_nomb' and DATA_TYPE!='nvarchar')
begin	
	Alter Table Nom_Transaccion	Alter Column tran_nomb nvarchar(50)
	Print 'Nom_Transaccion - tran_nomb'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Novedad' AND T.Column_Name = 'fecini')  -- Agregados por Éduar Álvarez - Marzo 12 de 2015.
begin	
	Alter Table Nom_Novedad	Add fecini [date] NULL
	Print 'Nom_Novedad - fecini'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Novedad' AND T.Column_Name = 'fecfin')
begin	
	Alter Table Nom_Novedad	Add fecfin [date] NULL
	Print 'Nom_Novedad - fecfin'
end
Go

IF EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Novedad' AND T.Column_name = 'ano' and DATA_TYPE!='numeric')
begin	
	Alter Table Nom_Novedad	Alter Column ano numeric(4)
	Print 'Nom_Novedad - ano'
end
Go
 
IF EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_DetNovedad' AND T.Column_name = 'ano' and DATA_TYPE!='numeric')
begin	
	Alter Table Nom_DetNovedad	Alter Column ano numeric(4)
	Print 'Nom_DetNovedad - ano'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'nom_historia' AND T.Column_Name = 'fecini')  -- Agregados por Éduar Álvarez - Marzo 20 de 2015.
begin	
	Alter Table nom_historia Add fecini [date] NULL
	Print 'nom_historia - fecini'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'nom_historia' AND T.Column_Name = 'fecfin')
begin	
	Alter Table nom_historia Add fecfin [date] NULL
	Print 'nom_historia - fecfin'
end
Go

IF EXISTS(Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.Column_name = 'ano')
begin	
	Alter Table nom_historia Alter Column ano numeric(4)
	Print 'nom_historia - ano'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'nom_historia' AND T.Column_Name = 'consec')
begin	
	Alter Table nom_historia Add consec nvarchar(16) DEFAULT ''
	Print 'nom_historia - consec'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Acumulado' AND T.Column_Name = 'ano')
begin	
	Alter Table Nom_Acumulado Add ano numeric(4) DEFAULT 0
	Print 'Nom_Acumulado - ano'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Acumulado' AND T.Column_Name = 'mes')
begin	
	Alter Table Nom_Acumulado Add mes nvarchar(2) DEFAULT ''
	Print 'Nom_Acumulado - mes'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Acumulado' AND T.Column_Name = 'periodo')
begin	
	Alter Table Nom_Acumulado Add periodo nvarchar(1) DEFAULT ''
	Print 'Nom_Acumulado - periodo'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Acumulado' AND T.Column_Name = 'codi_sec')
begin	
	Alter Table Nom_Acumulado Add codi_sec nvarchar(3) DEFAULT ''
	Print 'Nom_Acumulado - codi_sec'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo01')
begin	
	Alter Table Nom_Devengos Add sueldo01 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo01'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo02')
begin	
	Alter Table Nom_Devengos Add sueldo02 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo02'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo03')
begin
	Alter Table Nom_Devengos Add sueldo03 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo03'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo04')
begin	
	Alter Table Nom_Devengos Add sueldo04 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo04'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo05')
begin 	
	Alter Table Nom_Devengos Add sueldo05 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo05'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo06')
begin	
	Alter Table Nom_Devengos Add sueldo06 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo06'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo07')
begin	
	Alter Table Nom_Devengos Add sueldo07 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo07'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo08')
begin	
	Alter Table Nom_Devengos Add sueldo08 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo08'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo09')
begin	
	Alter Table Nom_Devengos Add sueldo09 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo09'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo10')
begin	
	Alter Table Nom_Devengos Add sueldo10 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo10'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo11')
begin	
	Alter Table Nom_Devengos Add sueldo11 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo11'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Devengos' AND T.Column_Name = 'sueldo12')
begin	
	Alter Table Nom_Devengos Add sueldo12 decimal(14,2) NOT NULL DEFAULT 0
	Print 'Nom_Devengos - sueldo12'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Cartera' AND T.Column_Name = 'codcenfac')
begin	
	Alter Table Nom_Cartera Add codcenfac nvarchar(3) NOT NULL DEFAULT ''
	Print 'Nom_Cartera - codcenfac'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Cartera' AND T.Column_Name = 'numdocfac')
begin	
	Alter Table Nom_Cartera Add numdocfac nvarchar(8) NOT NULL DEFAULT ''
	Print 'Nom_Cartera - numdocfac'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Cartera' AND T.Column_Name = 'tipdocfac')
begin	
	Alter Table Nom_Cartera Add tipdocfac nvarchar(2) NOT NULL DEFAULT ''
	Print 'Nom_Cartera - tipdocfac'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Empleado' AND T.Column_Name = 'codcto')		-- Agregado por Éduar Álvarez - Abril 13 de 2015.
begin
	Alter Table Nom_Empleado Add codcto Bit
	UPDATE Nom_Empleado Set codcto=codi_ctocosto
	Print 'Nom_Empleado - codcto'
end
GO

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Aportes' AND T.Column_Name = 'newfld')			-- Agregado por Éduar Álvarez - Abril 20 de 2015.
begin	
	Alter Table Nom_Aportes Drop Column newfld
	Print 'Nom_Aportes - newfld'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Detliq' AND T.Column_Name = 'aporte')		-- Agregado por Éduar Álvarez - Abril 25 de 2015.
begin
	Alter Table Nom_Detliq Add aporte Bit NOT NULL
	Print 'Nom_Detliq - aporte'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Liquidacion' AND T.Column_Name = 'codigo' and DATA_TYPE!='decimal')
begin	
	Alter Table Nom_Liquidacion Alter Column codigo Decimal(10,0)
	Print 'Nom_Liquidacion - codigo'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Liquidacion' AND T.Column_Name = 'dias' and DATA_TYPE!='decimal')
begin	
	Alter Table Nom_Liquidacion Alter Column dias Decimal(3,0)
	Print 'Nom_Liquidacion - dias'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Liquidacion' AND T.Column_Name = 'subtrans')
begin
	Alter Table Nom_Liquidacion Add subtrans Decimal(12,2) NOT NULL DEFAULT 0
	Print 'Nom_Liquidacion - subtrans'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Liquidacion' AND T.Column_Name = 'tipoliquid')
begin	
	Alter Table Nom_Liquidacion Add tipoliquid Numeric(1) NOT NULL DEFAULT 0
	Print 'Nom_Liquidacion - tipoliquid'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_DetLiq' AND T.Column_Name = 'codigo' and data_type!='decimal')
begin	
	Alter Table Nom_DetLiq Alter Column codigo Decimal(10,0)
	Print 'Nom_DetLiq - codigo'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Vacaciones' AND T.Column_Name = 'diasliq')	-- Agregado por Éduar Álvarez - Abril 27 de 2015.
begin
	Alter Table Nom_Vacaciones Add diasliq Numeric(3)
	Print 'Nom_Vacaciones - diasliq'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Vacaciones' AND T.Column_Name = 'primvac')
begin	
	Alter Table Nom_Vacaciones Add primvac Bit Not Null Default 0
	Print 'Nom_Vacaciones - primvac'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Otrdat' AND T.Column_Name = 'cxcprest')		-- Agregado por Éduar Álvarez - Abril 30 de 2015.
begin	
	Alter Table Nom_Otrdat Add cxcprest Bit Not Null Default 0
	Print 'Nom_Otrdat - cxcprest'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Otrdat' AND T.Column_Name = 'ctaxcbD')
begin	
	Alter Table Nom_Otrdat Add ctaxcbD nVarChar(8) Not Null Default ''
	Print 'Nom_Otrdat - ctaxcbD'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Otrdat' AND T.Column_Name = 'ctaxcbC')
begin	
	Alter Table Nom_Otrdat Add ctaxcbC nVarChar(8) Not Null Default ''
	Print 'Nom_Otrdat - ctaxcbC'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Prima' AND T.Column_Name = 'periodo1')		-- Agregado por Éduar Álvarez - Mayo 4 de 2015.
begin
	Alter Table Nom_Prima Add periodo1 nVarChar(1) Not Null Default ''
	Print 'Nom_Prima - periodo1'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Prima' AND T.Column_Name = 'periodo2')
begin
	Alter Table Nom_Prima Add periodo2 nVarChar(1) Not Null Default ''
	Print 'Nom_Prima - periodo2'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Labores' AND T.Column_Name = 'contenido')	-- Agregado por Éduar Álvarez - Mayo 11 de 2015.
begin
	Alter Table Nom_Labores Add contenido Text Not Null Default ''
	Print 'Nom_Labores - contenido'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Otrdat' AND T.column_name = 'VacLiqCon')
begin
	Alter Table Nom_Otrdat Add VacLiqCon Bit Not Null Default 0
	Print 'Nom_Otrdat - VacLiqCon'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'nom_historia' AND T.column_name = 'FecSys')			-- Éduar Álvarez - Junio 1 de 2015.
begin
	Alter Table nom_historia Add FecSys DateTime Not Null Default Current_TimeStamp
	Print 'nom_historia - FecSys'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'minsalario') 
begin 
	Alter Table nom_otrdat Add minsalario bit not null default 0
	Print 'nom_otrdat - minsalario'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'novinfocontb') 
begin 
	Alter Table nom_otrdat Add novinfocontb bit not null default 0
	Print 'nom_otrdat - novinfocontb'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'repcoli') 
begin 
	Alter Table nom_otrdat Add repcoli nvarchar(20) not null default ''
	Print 'nom_otrdat - repcoli'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'itempromedio') 
begin 
	Alter Table nom_otrdat Add itempromedio nvarchar(2) not null default ''
	Print 'nom_otrdat - itempromedio'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'promespecial') 
begin 
	Alter Table nom_otrdat Add promespecial bit not null default 0
	Print 'nom_otrdat - promespecial'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'acpromspecial') 
begin 
	Alter Table nom_transaccion Add acpromspecial bit not null default 0
	Print 'nom_transaccion - acpromspecial'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'dctoprima') 
begin 
	Alter Table nom_transaccion Add dctoprima bit not null default 0
	Print 'nom_transaccion - dctoprima'
end
Go
-- Registros de Nom_tipocotiz Ing. Lissette Feb. 28 de 2016
IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='51') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('51','Trabajador Tiempo Parcial Decreto 2616 de 2013 afiliado al Regimen Subsidiado de Salud')
	Print 'Nom_tipocotiz - Insert codigo 51'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='01') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('01','Dependiente')
	Print 'Nom_tipocotiz - Insert codigo 01'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='02') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('02','Servicio Domestico')
	Print 'Nom_tipocotiz - Insert codigo 02'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='03') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('03','Independiente')
	Print 'Nom_tipocotiz - Insert codigo 03'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='04') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('04','Madre comunitaria')
	Print 'Nom_tipocotiz - Insert codigo 04'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='12') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('12','Aprendices del SENA en etapa lectiva')
	Print 'Nom_tipocotiz - Insert codigo 12'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='15') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('15','Desempleado con subsidio de Caja de Compensación Familiar')
	Print 'Nom_tipocotiz - Insert codigo 15'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='16') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('16','Independiente agremiado ó asociado')
	Print 'Nom_tipocotiz - Insert codigo 16'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='18') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('18','Funcionarios públicos sin tope máximo en el IBC')
	Print 'Nom_tipocotiz - Insert codigo 18'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='19') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('19','Aprendices del SENA en etapa productiva')
	Print 'Nom_tipocotiz - Insert codigo 19'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='20') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('20','Estudiantes (Régimen especial-Ley 789/2002)')
	Print 'Nom_tipocotiz - Insert codigo 20'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='21') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('21','Estudiantes de postgrado en salud (Decreto 190 de 1996) ')
	Print 'Nom_tipocotiz - Insert codigo 21'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='22') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('22','Profesor de establecimiento particular')
	Print 'Nom_tipocotiz - Insert codigo 22'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='30') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('30','Dependiente Entidades o Universidades Públicas con régimen especial en Salud.')
	Print 'Nom_tipocotiz - Insert codigo 30'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='31') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('31','Cooperados o Precooperativas de trabajo asociado.')
	Print 'Nom_tipocotiz - Insert codigo 31'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='32') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('32','Cotizante miembro de la carrera diplomática o consular de un país extranjero o funcionario de organismo multilateral no sometido a la legislación colombiana.')
	Print 'Nom_tipocotiz - Insert codigo 32'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='33') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('33','Beneficiario del Fondo de Solidaridad Pensional')
	Print 'Nom_tipocotiz - Insert codigo 33'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='34') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('34','Concejal amparado por póliza de salud')
	Print 'Nom_tipocotiz - Insert codigo 34'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='40') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('40','Beneficiario UPC Adicional Lo suministra el aportante')
	Print 'Nom_tipocotiz - Insert codigo 40'
end
Go

IF NOT EXISTS (Select * From Nom_tipocotiz  AS T Where T.codigo='46') 
begin 
	insert into Nom_tipocotiz(codigo,nombre) values('46','Practicante')
	Print 'Nom_tipocotiz - Insert codigo 46'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_controlcierre' AND T.column_name = 'qui03') 
begin 
	Alter Table nom_controlcierre Add qui03 bit not null default 0
	Print 'nom_controlcierre - qui03'  -- ing Lissette 28/06/2016 para la nomina semanal 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_controlcierre' AND T.column_name = 'qui04') 
begin 
	Alter Table nom_controlcierre Add qui04 bit not null default 0
	Print 'nom_controlcierre - qui04'  -- ing Lissette 28/06/2016 para la nomina semanal 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_OtrDat' AND T.column_name = 'tipdocNC') 
begin 
	Alter Table Nom_OtrDat Add tipdocNC nvarchar(2) not null default ''
	Print 'Nom_OtrDat - tipdocNC'  -- ing Lissette 13/08/2016 para guardar la transacicon de NC para hacer los descargues de cartera en la nomina
end
Go

IF  NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Novedad' AND T.column_name = 'IdEmp') 
begin 
	Alter Table Nom_Novedad Add IdEmp nvarchar(3) not null default ''
	Print 'Nom_Novedad - IdEmp'  -- ing Lissette 16/08/2016 no lo tenia y toda tabla de movimiento debe tenerla
end
go
 
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Novedad' AND T.column_name = 'IdEmp' and t.DATA_TYPE!='nVarchar' ) 
begin 
     Alter Table Nom_Novedad Alter Column IdEmp nvarchar(3) 
	 update nom_novedad set idemp ='001' 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_cartera' AND T.column_name = 'EstPres') 
begin 
     Alter Table Nom_cartera add EstPres nvarchar(1) not null default ''
	 Print 'Nom_cartera - EstPres'  -- ing Lissette 25/08/2016 estado de prestamos por nueva utilidad de anulacion de prestamos.
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Liquidacion' AND T.column_name = 'diasdcto') 
begin 
     Alter Table Nom_Liquidacion add diasdcto numeric(4) not null default 0
	 Print 'Nom_Liquidacion - diasdcto'  -- ing Lissette 12/09/2016 dias que se descontaron en la liq. de contrato 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Liquidacion' AND T.column_name = 'diasdcto') 
begin 
     Alter Table Nom_Liquidacion add diasdcto numeric(4) not null default 0
	 Print 'Nom_Liquidacion - diasdcto'  -- ing Lissette 12/09/2016 dias que se descontaron en la liq. de contrato 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Liquidacion' AND T.column_name = 'promvble') 
begin 
     Alter Table Nom_Liquidacion add promvble numeric(14) not null default 0
	 Print 'Nom_Liquidacion - promvble'  -- ing Lissette 12/09/2016 promedio variable 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Liquidacion' AND T.column_name = 'sueldobasico') 
begin 
     Alter Table Nom_Liquidacion add sueldobasico numeric(14) not null default 0
	 Print 'Nom_Liquidacion - sueldobasico'  -- ing Lissette 12/09/2016 sueldobasico
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecexpcc')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecexpcc
	Print 'nom_empleado - Borrando DF_nom_empleado_fecexpcc'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'Fecexpcc' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column Fecexpcc date 
	 Print 'Nom_Liquidacion - sueldobasico'  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_nac')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_nac
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_nac'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_nac' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_nac date 
	 Print 'nom_empleado - fecha_nac '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_ing')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_ing
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_ing'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_ing' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_ing date 
	 Print 'nom_empleado - fecha_ing  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_vac')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_vac
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_vac'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_vac' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_vac date 
	 Print 'nom_empleado - fecha_vac  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_sueldo')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_sueldo
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_sueldo'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_sueldo' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_sueldo date 
	 Print 'nom_empleado - fecha_sueldo  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_ces')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_ces
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_ces'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_ces' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_ces date 
	 Print 'nom_empleado - fecha_ces  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_int')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_int
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_int'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_int' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_int date 
	 Print 'nom_empleado - fecha_int  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_prima')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_prima
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_prima'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_prima' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_prima date 
	 Print 'nom_empleado - fecha_prima  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_retiro')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_retiro
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_retiro'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_retiro' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_retiro date 
	 Print 'nom_empleado - fecha_retiro  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecha_grado')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecha_grado
	Print 'nom_empleado - Borrando DF_nom_empleado_fecha_grado'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecha_grado' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecha_grado date 
	 Print 'nom_empleado - fecha_grado  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fechijo1')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fechijo1
	Print 'nom_empleado - Borrando DF_nom_empleado_fechijo1'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fechijo1' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fechijo1 date 
	 Print 'nom_empleado - fechijo1  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fechijo2')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fechijo2
	Print 'nom_empleado - Borrando DF_nom_empleado_fechijo2'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fechijo2' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fechijo2 date 
	 Print 'nom_empleado - fechijo2  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fechijo3')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fechijo3
	Print 'nom_empleado - Borrando DF_nom_empleado_fechijo3'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fechijo3' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fechijo3 date 
	 Print 'nom_empleado - fechijo3  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fechijo4')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fechijo4
	Print 'nom_empleado - Borrando DF_nom_empleado_fechijo4'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fechijo4' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fechijo4 date 
	 Print 'nom_empleado - fechijo4  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fechijo5')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fechijo5
	Print 'nom_empleado - Borrando DF_nom_empleado_fechijo5'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fechijo5' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fechijo5 date 
	 Print 'nom_empleado - fechijo5  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_nom_empleado_fecconyuge')
BEGIN
	ALTER TABLE nom_empleado DROP CONSTRAINT DF_nom_empleado_fecconyuge
	Print 'nom_empleado - Borrando DF_nom_empleado_fecconyuge'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado' AND T.column_name = 'fecconyuge' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_empleado Alter Column fecconyuge date 
	 Print 'nom_empleado - fecconyuge  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'fecnov' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_vacaciones Alter Column fecnov date 
	 Print 'nom_vacaciones - fecnov  '  -- ing Lissette 12/10/2016 cambiando el tipo del campo 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'ultper' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_vacaciones Alter Column ultper date 
	 Print 'nom_vacaciones - ultper  '  -- ing Lissette 12/10/2016 cambiando el tipo del campo 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'perini' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_vacaciones Alter Column perini date 
	 Print 'nom_vacaciones - perini  '  -- ing Lissette 12/10/2016 cambiando el tipo del campo 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'regreso' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_vacaciones Alter Column regreso date 
	 Print 'nom_vacaciones - regreso  '  -- ing Lissette 12/10/2016 cambiando el tipo del campo 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detacartera' AND T.column_name = 'feccuo' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_detacartera Alter Column feccuo date 
	 Print 'nom_detacartera - feccuo  '  -- ing Lissette 14/09/2016 cambiando el tipo del campo 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Empleado' AND T.column_name = 'actvacaciones') 
begin 
     Alter Table Nom_Empleado add actvacaciones bit not null default 0
	 Print 'Nom_Empleado - actvacaciones'  -- ing Lissette 30/06/2017 para que el empleado salga en nomina aunque este de vacaciones 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_PagoPrestamos' AND T.column_name = 'Codi_Tran') 
begin 
     Alter Table Nom_PagoPrestamos add Codi_Tran nVarchar(4) not null default ''
	 Print 'Nom_PagoPrestamos - Codi_Tran'  -- ing Lissette 30/06/2017 para que el empleado salga en nomina aunque este de vacaciones 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_OtrDat' AND T.column_name = 'calcdiafecha') 
begin 
     Alter Table Nom_OtrDat add calcdiafecha bit not null default 0
	 Print 'Nom_OtrDat - calcdiafecha'  -- ing Lissette 21/07/2017 para que el calculo lo haga segun fecha ultima o ingreso 
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_OtrDat' AND T.column_name = 'calcdiaMes') 
begin 
     Alter Table Nom_OtrDat add calcdiaMes bit not null default 0
	 Print 'Nom_OtrDat - calcdiaMes'  -- ing Lissette 21/07/2017 para que el calculo lo haga segun Meses trabajados
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'codccf' and t.CHARACTER_MAXIMUM_LENGTH!=4 ) 
begin 
     Alter Table nom_otrdat Alter Column codccf nvarchar(4) 
	 Print 'nom_otrdat - codccf  '  -- ing Lissette 26/07/2017 cambiando el tipo del campo 
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_actent' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_actent ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_actent - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_actent' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_actent ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_actent - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_actent' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_actent ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_actent - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_actent' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_actent ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_actent - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_actent' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_actent  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_actent  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_actent'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_actent Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_actent - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_acumulado' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_acumulado ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_acumulado - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_acumulado' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_acumulado ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_acumulado - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_acumulado' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_acumulado ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_acumulado - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_acumulado' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_acumulado ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_acumulado - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_acumulado' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_acumulado  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_acumulado  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_acumulado'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_acumulado Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_acumulado - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_aportes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_aportes ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_aportes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_aportes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_aportes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_aportes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_aportes' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_aportes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_aportes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_aportes' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_aportes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_aportes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_aportes' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_aportes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_aportes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_aportes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_aportes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_aportes - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_auxilios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_auxilios ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_auxilios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_auxilios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_auxilios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_auxilios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_auxilios' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_auxilios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_auxilios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_auxilios' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_auxilios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_auxilios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_auxilios' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_auxilios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_auxilios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_auxilios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_auxilios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_auxilios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_bancos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_bancos ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_bancos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_bancos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_bancos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_bancos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_bancos' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_bancos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_bancos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_bancos' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_bancos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_bancos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_bancos' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_bancos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_bancos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_bancos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_bancos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_bancos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cargos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_cargos ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_cargos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cargos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_cargos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_cargos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cargos' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_cargos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_cargos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cargos' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_cargos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_cargos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cargos' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_cargos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_cargos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cargos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_cargos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_cargos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_carreras' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_carreras ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_carreras - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_carreras' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_carreras ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_carreras - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_carreras' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_carreras ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_carreras - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_carreras' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_carreras ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_carreras - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_carreras' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_carreras  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_carreras  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_carreras'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_carreras Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_carreras - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_cartera ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_cartera - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_cartera ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_cartera - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_cartera ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_cartera - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_cartera ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_cartera - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_cartera  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_cartera  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_cartera Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_cartera - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_centros' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_centros ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_centros - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_centros' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_centros ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_centros - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_centros' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_centros ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_centros - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_centros' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_centros ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_centros - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_centros' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_centros  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_centros  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_centros'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_centros Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_centros - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cesantias' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_cesantias ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_cesantias - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cesantias' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_cesantias ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_cesantias - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cesantias' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_cesantias ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_cesantias - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cesantias' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_cesantias ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_cesantias - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cesantias' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_cesantias  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_cesantias  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cesantias'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_cesantias Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_cesantias - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cierre' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_cierre ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_cierre - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cierre' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_cierre ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_cierre - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cierre' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_cierre ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_cierre - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cierre' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_cierre ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_cierre - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cierre' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_cierre  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_cierre  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cierre'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_cierre Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_cierre - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Contrato' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_Contrato ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_Contrato - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Contrato' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_Contrato ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_Contrato - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Contrato' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_Contrato ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_Contrato - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Contrato' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_Contrato ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_Contrato - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Contrato' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_Contrato  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_Contrato  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Contrato'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_Contrato Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_Contrato - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Controlcierre' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_Controlcierre ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_Controlcierre - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Controlcierre' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_Controlcierre ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_Controlcierre - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Controlcierre' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_Controlcierre ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_Controlcierre - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Controlcierre' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_Controlcierre ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_Controlcierre - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Controlcierre' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_Controlcierre  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_Controlcierre  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Controlcierre'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_Controlcierre Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_Controlcierre - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detacartera' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_detacartera ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_detacartera - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detacartera' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_detacartera ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_detacartera - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detacartera' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_detacartera ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_detacartera - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detacartera' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_detacartera ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_detacartera - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detacartera' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_detacartera  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_detacartera  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detacartera'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_detacartera Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_detacartera - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detcentros' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_detcentros ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_detcentros - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detcentros' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_detcentros ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_detcentros - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detcentros' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_detcentros ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_detcentros - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detcentros' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_detcentros ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_detcentros - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detcentros' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_detcentros  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_detcentros  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detcentros'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_detcentros Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_detcentros - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detliq' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_detliq ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_detliq - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detliq' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_detliq ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_detliq - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detliq' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_detliq ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_detliq - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detliq' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_detliq ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_detliq - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detliq' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_detliq  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_detliq  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detliq'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_detliq Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_detliq - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detnovedad' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_detnovedad ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_detnovedad - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detnovedad' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_detnovedad ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_detnovedad - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detnovedad' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_detnovedad ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_detnovedad - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detnovedad' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_detnovedad ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_detnovedad - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detnovedad' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_detnovedad  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_detnovedad  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_detnovedad'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_detnovedad Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_detnovedad - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_devengos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_devengos ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_devengos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_devengos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_devengos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_devengos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_devengos' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_devengos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_devengos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_devengos' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_devengos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_devengos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_devengos' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_devengos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_devengos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_devengos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_devengos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_devengos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_dotacion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_dotacion ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_dotacion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_dotacion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_dotacion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_dotacion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_dotacion' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_dotacion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_dotacion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_dotacion' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_dotacion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_dotacion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_dotacion' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_dotacion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_dotacion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_dotacion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_dotacion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_dotacion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_entidad' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_entidad ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_entidad - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_entidad' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_entidad ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_entidad - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_entidad' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_entidad ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_entidad - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_entidad' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_entidad ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_entidad - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_entidad' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_entidad  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_entidad  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_entidad'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_entidad Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_entidad - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_estados' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_estados ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_estados - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_estados' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_estados ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_estados - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_estados' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_estados ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_estados - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_estados' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_estados ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_estados - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_estados' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_estados  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_estados  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_estados'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_estados Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_estados - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_festivos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_festivos ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_festivos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_festivos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_festivos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_festivos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_festivos' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_festivos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_festivos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_festivos' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_festivos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_festivos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_festivos' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_festivos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_festivos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_festivos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_festivos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_festivos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_fondos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_fondos ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_fondos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_fondos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_fondos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_fondos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_fondos' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_fondos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_fondos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_fondos' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_fondos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_fondos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_fondos' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_fondos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_fondos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_fondos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_fondos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_fondos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_historia ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_historia - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_historia ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_historia - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_historia ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_historia - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_historia ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_historia - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_historia  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_historia  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_historia Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_historia - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_hojpago' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_hojpago ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_hojpago - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_hojpago' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_hojpago ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_hojpago - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_hojpago' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_hojpago ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_hojpago - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_hojpago' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_hojpago ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_hojpago - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_hojpago' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_hojpago  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_hojpago  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_hojpago'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_hojpago Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_hojpago - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_horario' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_horario ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_horario - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_horario' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_horario ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_horario - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_horario' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_horario ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_horario - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_horario' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_horario ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_horario - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_horario' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_horario  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_horario  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_horario'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_horario Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_horario - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_incapacidad ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_incapacidad - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_incapacidad ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_incapacidad - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_incapacidad ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_incapacidad - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_incapacidad ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_incapacidad - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_incapacidad  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_incapacidad  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_incapacidad Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_incapacidad - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_labores' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_labores ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_labores - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_labores' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_labores ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_labores - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_labores' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_labores ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_labores - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_labores' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_labores ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_labores - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_labores' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_labores  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_labores  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_labores'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_labores Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_labores - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_liquidacion ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_liquidacion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_liquidacion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_liquidacion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_liquidacion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_liquidacion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_liquidacion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_liquidacion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_liquidacion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_liquidacion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_liquidacion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_liquidacion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_niveles' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_niveles ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_niveles - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_niveles' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_niveles ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_niveles - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_niveles' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_niveles ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_niveles - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_niveles' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_niveles ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_niveles - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_niveles' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_niveles  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_niveles  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_niveles'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_niveles Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_niveles - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_novedad ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_novedad - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_novedad ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_novedad - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_novedad ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_novedad - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_novedad ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_novedad - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_novedad  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_novedad  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_novedad Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_novedad - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_obra' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_obra ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_obra - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_obra' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_obra ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_obra - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_obra' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_obra ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_obra - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_obra' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_obra ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_obra - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_obra' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_obra  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_obra  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_obra'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_obra Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_obra - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_otrdat ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_otrdat - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_otrdat ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_otrdat - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_otrdat ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_otrdat - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_otrdat ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_otrdat - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_otrdat  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_otrdat  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_otrdat Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_otrdat - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagoprestamos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_pagoprestamos ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_pagoprestamos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagoprestamos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_pagoprestamos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_pagoprestamos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagoprestamos' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_pagoprestamos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_pagoprestamos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagoprestamos' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_pagoprestamos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_pagoprestamos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagoprestamos' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_pagoprestamos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_pagoprestamos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagoprestamos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_pagoprestamos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_pagoprestamos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_pagos ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_pagos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_pagos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_pagos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagos' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_pagos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_pagos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagos' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_pagos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_pagos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagos' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_pagos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_pagos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_pagos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_pagos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_pagos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_prima ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_prima - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_prima ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_prima - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_prima ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_prima - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_prima ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_prima - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_prima  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_prima  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_prima Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_prima - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_profesion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_profesion ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_profesion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_profesion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_profesion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_profesion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_profesion' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_profesion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_profesion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_profesion' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_profesion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_profesion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_profesion' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_profesion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_profesion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_profesion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_profesion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_profesion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_seccion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_seccion ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_seccion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_seccion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_seccion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_seccion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_seccion' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_seccion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_seccion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_seccion' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_seccion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_seccion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_seccion' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_seccion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_seccion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_seccion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_seccion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_seccion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_sucursal' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_sucursal ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_sucursal - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_sucursal' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_sucursal ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_sucursal - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_sucursal' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_sucursal ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_sucursal - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_sucursal' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_sucursal ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_sucursal - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_sucursal' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_sucursal  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_sucursal  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_sucursal'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_sucursal Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_sucursal - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tablacon' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_tablacon ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_tablacon - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tablacon' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_tablacon ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_tablacon - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tablacon' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_tablacon ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_tablacon - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tablacon' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_tablacon ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_tablacon - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tablacon' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_tablacon  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_tablacon  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tablacon'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_tablacon Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_tablacon - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tarifas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_tarifas ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_tarifas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tarifas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_tarifas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_tarifas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tarifas' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_tarifas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_tarifas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tarifas' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_tarifas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_tarifas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tarifas' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_tarifas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_tarifas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tarifas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_tarifas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_tarifas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipocotiz' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_tipocotiz ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_tipocotiz - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipocotiz' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_tipocotiz ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_tipocotiz - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipocotiz' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_tipocotiz ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_tipocotiz - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipocotiz' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_tipocotiz ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_tipocotiz - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipocotiz' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_tipocotiz  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_tipocotiz  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipocotiz'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_tipocotiz Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_tipocotiz - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipodominio' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_tipodominio ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_tipodominio - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipodominio' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_tipodominio ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_tipodominio - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipodominio' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_tipodominio ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_tipodominio - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipodominio' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_tipodominio ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_tipodominio - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipodominio' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_tipodominio  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_tipodominio  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipodominio'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_tipodominio Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_tipodominio - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipovincu' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_tipovincu ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_tipovincu - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipovincu' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_tipovincu ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_tipovincu - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipovincu' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_tipovincu ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_tipovincu - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipovincu' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_tipovincu ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_tipovincu - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipovincu' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_tipovincu  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_tipovincu  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_tipovincu'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_tipovincu Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_tipovincu - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_transaccion ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_transaccion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_transaccion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_transaccion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_transaccion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_transaccion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_transaccion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_transaccion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_transaccion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_transaccion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_transaccion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_transaccion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_vacaciones ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_vacaciones - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_vacaciones ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_vacaciones - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_vacaciones ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_vacaciones - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_vacaciones ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_vacaciones - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_vacaciones  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_vacaciones  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_vacaciones Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_vacaciones - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacadetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table nom_vacadetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'nom_vacadetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacadetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table nom_vacadetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'nom_vacadetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacadetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table nom_vacadetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'nom_vacadetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacadetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table nom_vacadetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'nom_vacadetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacadetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table nom_vacadetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'nom_vacadetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacadetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table nom_vacadetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'nom_vacadetalle - modificadoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones'  AND T.column_name = 'conconsec') 
begin 
	Alter Table nom_vacaciones Add conconsec  nvarchar(16)  NOT NULL DEFAULT ''
	Print 'nom_vacaciones - conconsec'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_vacaciones'  AND T.column_name = 'estvac') 
begin 
	Alter Table nom_vacaciones Add estvac  nvarchar(1)  NOT NULL DEFAULT ''
	Print 'nom_vacaciones - estvac'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'Concepcxc') 
begin 
	Alter Table nom_otrdat Add Concepcxc  bit  NOT NULL DEFAULT 0
	Print 'nom_otrdat - Concepcxc' -- Ing Lis 30/10/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'codIntereses') 
begin 
	Alter Table nom_otrdat Add codIntereses  nvarchar(4)  NOT NULL DEFAULT ''
	Print 'nom_otrdat - codIntereses' -- Ing Lis 30/10/2017  intereses de prestamos
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad' AND T.column_name = 'Fecini' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_incapacidad Alter Column Fecini date 
	 Print 'nom_incapacidad - Fecini'  -- ing Lissette 16/11/2017 cambiando el tipo del campo 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_incapacidad' AND T.column_name = 'Fecfin' and t.DATA_TYPE!='date' ) 
begin 
     Alter Table nom_incapacidad Alter Column Fecfin date 
	 Print 'nom_incapacidad - Fecfin'  -- ing Lissette 16/11/2017 cambiando el tipo del campo 
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'bancos') 
begin 
	Alter Table nom_otrdat Add bancos  bit  NOT NULL DEFAULT 0
	Print 'nom_otrdat - bancos' -- Ing Lis 30/10/2017
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'smtp') 
begin 
	Alter Table nom_otrdat Add smtp  NVARCHAR(100)  NOT NULL DEFAULT ''
	Print 'nom_otrdat - smtp' -- Ing Lis 30/10/2017
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'correo') 
begin 
	Alter Table nom_otrdat Add correo  NVARCHAR(100)  NOT NULL DEFAULT ''
	Print 'nom_otrdat - correo' -- Ing Lis 30/10/2017
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'password') 
begin 
	Alter Table nom_otrdat Add password  varbinary(max) 
	Print 'nom_otrdat - password' -- Ing Lis 30/10/2017
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'password1') 
begin 
	Alter Table nom_otrdat Add password1  varbinary(max) 
	Print 'nom_otrdat - password1' -- Ing Lis 30/10/2017
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_empleado'  AND T.column_name = 'dctoapocoo') 
begin 
	Alter Table Nom_empleado Add dctoapocoo  bit  NOT NULL DEFAULT 0
	Print 'Nom_empleado - dctoapocoo' -- Ing Lis 22/11/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'Rounplanilla') 
begin 
	Alter Table nom_otrdat Add Rounplanilla  bit NOT NULL DEFAULT 0
	Print 'nom_otrdat - Rounplanilla' -- Ing Lis 14/12/2017  redondear valores en la pantalla de aportes informe de planilla 
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'liqContMin') 
begin 
	Alter Table nom_otrdat Add liqContMin  bit NOT NULL DEFAULT 0
	Print 'nom_otrdat - liqContMin' -- Ing Lis 10/05/2018  para que la liquidacion tome como base el minimo 
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'NOM_LIQUIDACION' AND T.Column_name = 'DIAS' and t.DATA_TYPE='decimal' and t.NUMERIC_PRECISION!=10)
begin	
	Alter Table NOM_LIQUIDACION Alter Column DIAS decimal(10) NOT NULL
	Print 'NOM_LIQUIDACION - nombret'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_acumulado' AND T.Column_name = 'fecha' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_acumulado Alter Column fecha date  
	Print 'nom_acumulado - nombret'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera' AND T.Column_name = 'fecha_ptmo' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_cartera Alter Column fecha_ptmo date  
	Print 'nom_cartera - fecha_ptmo'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cartera' AND T.Column_name = 'fecha_ini' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_cartera Alter Column fecha_ini date  
	Print 'nom_cartera - fecha_ini'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_cesantias' AND T.Column_name = 'fecha' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_cesantias Alter Column fecha date  
	Print 'nom_cesantias - fecha'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_contrato' AND T.Column_name = 'fecha' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_contrato Alter Column fecha date  
	Print 'nom_contrato - fecha'
end
GO 

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'nom_festivos'  AND T.column_name = 'fecha' and t.DATA_TYPE!='date' ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='nom_festivos' AND tc.name='fecha')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='nom_festivos' AND tc.name='fecha'
		
		SET @sql='ALTER TABLE dbo.nom_festivos DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.nom_festivos ALTER COLUMN fecha date
		SET @sql='ALTER TABLE dbo.nom_festivos ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [fecha ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE nom_festivos ALTER COLUMN fecha date
		Print 'nom_festivos - fecha'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.Column_name = 'fecnov' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_historia Alter Column fecnov date  
	Print 'nom_historia - fecnov'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.Column_name = 'fecini' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_historia Alter Column fecini date  
	Print 'nom_historia - fecini'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_historia' AND T.Column_name = 'fecfin' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_historia Alter Column fecfin date  
	Print 'nom_historia - fecfin'
end
GO 

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'nom_horario'  AND T.column_name = 'fecha' and t.DATA_TYPE!='date' ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='nom_horario' AND tc.name='fecha')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='nom_horario' AND tc.name='fecha'
		
		SET @sql='ALTER TABLE dbo.nom_horario DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.nom_horario ALTER COLUMN fecha date
		SET @sql='ALTER TABLE dbo.nom_horario ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [fecha ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE nom_horario ALTER COLUMN fecha date
		Print 'nom_horario - fecha'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.Column_name = 'fecha' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_liquidacion Alter Column fecha date  
	Print 'nom_liquidacion - fecha'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.Column_name = 'fecha_ces' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_liquidacion Alter Column fecha_ces date  
	Print 'nom_liquidacion - fecha_ces'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.Column_name = 'fecha_ing' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_liquidacion Alter Column fecha_ing date  
	Print 'nom_liquidacion - fecha_ing'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.Column_name = 'fecha_prima' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_liquidacion Alter Column fecha_prima date  
	Print 'nom_liquidacion - fecha_prima'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.Column_name = 'fecha_retiro' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_liquidacion Alter Column fecha_retiro date  
	Print 'nom_liquidacion - fecha_retiro'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_liquidacion' AND T.Column_name = 'fecha_vac' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_liquidacion Alter Column fecha_vac date  
	Print 'nom_liquidacion - fecha_vac'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.Column_name = 'fecnov' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_novedad Alter Column fecnov date  
	Print 'nom_novedad - fecnov'
end
GO 
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.Column_name = 'fecini' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_novedad Alter Column fecini date  
	Print 'nom_novedad - fecini'
end
GO 
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_novedad' AND T.Column_name = 'fecfin' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_novedad Alter Column fecfin date  
	Print 'nom_novedad - fecfin'
end
GO 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima' AND T.Column_name = 'fecha' and t.DATA_TYPE!='date') 
begin	
	Alter Table nom_prima Alter Column fecha date  
	Print 'nom_prima - fecha'
end
GO 
----------------------------------Actualizado en el esquema hasta aqui------------------27/07/2018


IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_prima' AND T.Column_name = 'periodo2' and t.character_maximum_length!=2) 
begin	
	Alter Table nom_prima Alter Column periodo2 nvarchar(2)  
	Print 'nom_prima - periodo2'
end
GO 


IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('nom_prima')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'fecsys'
							AND object_id = OBJECT_ID('nom_prima'))				
		)
	BEGIN
		ALTER TABLE nom_prima ADD CONSTRAINT DF_nom_prima DEFAULT getdate() FOR fecsys
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_Cartera'  AND T.column_name = 'Origen') 
begin 
	Alter Table nom_Cartera Add Origen  NVARCHAR(3)  NOT NULL DEFAULT ''
	Print 'nom_Cartera - Origen' -- Ing Lis 04/01/2019. para saber si el prestamo se generon por una factura. 
end
Go

--------------01022019 Lissette  Actualizado.


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'codpensiontp') 
begin 
	Alter Table nom_otrdat Add codpensiontp  NVARCHAR(4)  NOT NULL DEFAULT ''
	Print 'nom_otrdat - codpensiontp' -- Ing Lis 26/02/2019. para guardar el cod novedad pension tiemp parcial
end
Go


------------------Actualizado en init 25/04/2019 Andres Jimenez


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado'  AND T.column_name = 'codctofac') 
begin 
	Alter Table nom_empleado Add codctofac  NVARCHAR(3)  NOT NULL DEFAULT ''
	Print 'nom_empleado - codctofac' -- Ing Lis 18/06/2019. centro de factura cuando realizan un prestamo. 
end
Go

/*
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_otrdat'  AND T.column_name = 'password1' and data_type != 'varbinary') 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	declare @Tabla nvarchar(200), @Campo nvarchar(200)
	set  @Tabla = 'nom_otrdat'
	Set @Campo =	'password1'
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
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		SET @sql='ALTER TABLE dbo.'+@Tabla+' ALTER COLUMN '+@campo+' varbinary(max) '
		EXEC SP_EXECUTESQL @sql
		SET @sql='ALTER TABLE dbo.'+@Tabla+' ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR ['+@campo+' ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		Alter Table nom_otrdat alter column  password1  varbinary(max) 
		Print 'nom_otrdat - password1'  --Ing. Luis Dominguez 20190704  
	END
END 
GO 
*/

---- 22-04-2021 Campo agregado por desarrollo realizado a Gegasa para una pantalla de observaciones
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado'  AND T.column_name = 'Observa') 
begin 
	Alter Table nom_empleado Add Observa  nvarchar(MAX) not null default ''
	Print 'nom_empleado - Observa' 
end
Go
----- 21-09-2021 Jennifer Rodriguez, campo para colocar tipo de cuenta al empleado
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_empleado'  AND T.column_name = 'tipocta') 
begin 
	Alter Table nom_empleado Add tipocta  NCHAR(2) not null default ''
	Print 'nom_empleado - tipocta' 
end
Go
----- 21-09-2021 Jennifer Rodriguez, Cambios en la pantalla de observaciones para anularlas
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_observa'  AND T.column_name = 'codusu') 
begin 
	Alter Table nom_observa Add codusu  NCHAR(10) not null default ''
	Print 'nom_observa - codusu' 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_observa'  AND T.column_name = 'estobs') 
begin 
	Alter Table nom_observa Add estobs  NCHAR(1) not null default ''
	Print 'nom_observa - estobs' 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_observa'  AND T.column_name = 'codusuanul') 
begin 
	Alter Table nom_observa Add codusuanul  NCHAR(10) not null default ''
	Print 'nom_observa - codusuanul' 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_observa'  AND T.column_name = 'fecsysanul') 
begin 
	Alter Table nom_observa Add fecsysanul  date 
	Print 'nom_observa - fecsysanul' 
end
Go

if exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'nom_detacartera' and T.COLUMN_NAME = 'ncuota')
BEGIN
   alter table nom_detacartera alter column ncuota decimal(3, 0) NOT NULL
   print 'nom_detacartera - ncuota alter column not null'
END
GO
if not exists(SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE T where T.CONSTRAINT_NAME = 'PK_nom_detacartera')
BEGIN
   alter table nom_detacartera add constraint PK_nom_detacartera primary key clustered (nserie, ncuota)
   print 'nom_detacartera - PK_nom_detacartera'
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'nom_empleado' AND T.Column_Name = 'tipocuenta') 
begin 
	Alter Table nom_empleado Add tipocuenta [nvarchar](1) NOT NULL DEFAULT ('2')  --1 => Corriente y 2 => Ahorros
	Print 'nom_empleado - tipocuenta'  
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'dctocesan')
begin
	Alter Table Nom_Transaccion Add dctocesan [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - dctocesan'
end
GO 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_Transaccion' AND T.Column_name = 'dctointcesan')
begin
	Alter Table Nom_Transaccion Add dctointcesan [bit] NOT NULL DEFAULT 0
	Print 'Nom_Transaccion - dctointcesan'
end
GO 

if not exists(SELECT* from INFORMATION_SCHEMA.COLUMNS T where t.COLUMN_NAME = 'viaticoManuAlojS' and t.TABLE_NAME = 'ne_transporte')
  BEGIN
    ALTER TABLE ne_transporte  ADD viaticoManuAlojS decimal(18,4) NOT NULL DEFAULT (0)
  END
----- Yaslen Andrade 08-11-2021 Expandir cedula del empleado
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_empleado' AND T.column_name = 'cedula' and t.CHARACTER_MAXIMUM_LENGTH!=20) 
begin 
	Alter Table Nom_empleado alter column  cedula nvarchar(20) NOT NULL 
	Print 'Nom_empleado - cedula'  -- se cambia lo longitud estaba de 15 y ahora de 20. 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Nom_empleado' AND T.column_name = 'tipid' and t.CHARACTER_MAXIMUM_LENGTH!=4) 
begin 
	Alter Table Nom_empleado alter column  tipid nvarchar(3) NOT NULL 
	Print 'Nom_empleado - tipid'  -- se cambia lo longitud estaba de 2 y ahora de 4 para agregar el RUMV. 
end
Go


------ 16-04-2024 Agregado para la anulación de contrato 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Nom_Liquidacion' AND T.Column_Name = 'estliq')
begin
	Alter Table Nom_Liquidacion Add estliq nvarchar(1) NOT NULL DEFAULT ''
	Print 'Nom_Liquidacion - estliq'
end
Go

--17-09-2024 se agrega por nomelec caso bristek por varios novedades y en nomotrdat solo se puede colocar una 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'nom_transaccion' AND T.column_name = 'subclasif' ) 
begin 
	Alter Table Nom_transaccion add subclasif nvarchar(2) NOT NULL default '' 
	Print 'Nom_transaccion - subclasif'  -- Campo para la subclasificacion 
end
Go


-------
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ne_objNomina' AND T.column_name = 'trackId' and t.CHARACTER_MAXIMUM_LENGTH!=200) 
begin 
    
declare @namedefault nvarchar(200)

SET @namedefault =(SELECT d.name
FROM sys.default_constraints AS d  
INNER JOIN sys.columns AS c  
ON d.parent_object_id = c.object_id
AND d.parent_column_id = c.column_id  
WHERE c.name = 'trackid' )
EXEC ('alter table ne_objNomina DROP CONSTRAINT ' + @namedefault)
	ALTER TABLE ne_objNomina ALTER COLUMN trackId nvarchar(max) NOT NULL
	alter table ne_objNomina add default '' FOR trackId
	Print 'ne_objNomina - trackid'  -- se cambia lo longitud a varchar max.
end
Go
