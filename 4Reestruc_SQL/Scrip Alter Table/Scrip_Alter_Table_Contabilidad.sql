IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Con_Comprobante' AND T.Column_Name = 'itemdoc')
begin 
	Alter Table Con_Comprobante	Add itemdoc numeric(6, 0) NOT NULL DEFAULT 0
	Print 'Con_Comprobante - itemdoc'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Con_Comprobante' AND T.Column_Name = 'idemp')	-- Agregado por Éduar Álvarez - Abril 7 de 2015.
begin 	
	Alter Table Con_Comprobante	Add idemp nvarchar(3) NOT NULL DEFAULT ''
	Print 'Con_Comprobante  - idemp'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_CenCostos' AND T.column_name = 'ctoproduc')	-- Éduar Álvarez - Mayo 20 de 2015.
begin 
	Alter Table Con_CenCostos Add ctoproduc Bit Not Null Default 0	
	Print 'Con_Comprobante - ctoproduc '
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'diferido')
begin 
	Alter Table Con_Puc Add diferido Bit Not Null Default 0
	Print 'Con_Puc - diferido'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'ctagasdife')
begin 
	Alter Table Con_Puc Add ctagasdife nVarChar(8) Not Null Default ''
	Print 'Con_Puc - ctagasdife'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'codgruniif')
begin 
	Alter Table Con_Puc Add codgruniif nVarChar(2) Not Null Default ''
	Print 'Con_Puc - codgruniif'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'codcueniif')
begin 
	Alter Table Con_Puc Add codcueniif nVarChar(8) Not Null Default ''
	Print 'Con_Puc - codcueniif'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'nomcueniif')
begin 
	Alter Table Con_Puc Add nomcueniif nVarChar(40) Not Null Default ''
	Print 'Con_Puc - nomcueniif'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'manactivo')
begin 
	Alter Table Con_Puc Add manactivo Bit Not Null Default 0
	Print 'Con_Puc - manactivo'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'ctaori')
begin 
	Alter Table Con_Puc Add ctaori Bit Not Null Default 0
	Print 'Con_Puc - ctaori'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Parametros' AND T.column_name = 'ctareftesimpli')	-- Éduar Álvarez - Junio 3 de 2015.
begin 
	Alter Table Con_Parametros Add ctareftesimpli nVarChar(8) Not Null Default ''
	Print 'Con_Parametros - ctareftesimpli'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Parametros' AND T.column_name = 'ctaanticipo')
begin 	
	Alter Table Con_Parametros Add ctaanticipo nVarChar(8) Not Null Default ''
	Print 'Con_Parametros - ctaanticipo'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Parametros' AND T.column_name = 'ctaivasimpli')
begin 	
	Alter Table Con_Parametros Add ctaivasimpli nVarChar(8) Not Null Default ''
	Print 'Con_Parametros - ctaivasimpli'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Parametros' AND T.column_name = 'prefniif')
begin 
	Alter Table Con_Parametros Add prefniif nVarChar(2) Not Null Default ''
	Print 'Con_Parametros - prefniif'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Comprobante' AND T.column_name = 'timedife')
begin 
	Alter Table Con_Comprobante Add timedife Numeric(3) Not Null Default 0
	Print 'Con_Comprobante - timedife'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Comprobante' AND T.column_name = 'prefijo')
begin 
	Alter Table Con_Comprobante Add prefijo nVarChar(2) Not Null Default ''
	Print 'Con_Comprobante - prefijo'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'Con_Puc' AND T.column_name = 'codcueniif')	-- Éduar Álvarez - Junio 12 de 2015.
begin 	
	Alter Table Con_Puc Add codcueniif nVarChar(8) Not Null Default ''
	Print 'Con_Puc - codcueniif'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'CodCueNIIF')
begin 
	Alter Table con_pucniif Add CodCueNIIF nVarChar(8) Not Null Default ''
	Print 'con_pucniif - CodCueNIIF'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'NomCueNIIF')
begin 
	Alter Table con_pucniif Add NomCueNIIF nVarChar(100) Not Null Default ''
	Print 'con_pucniif - NomCueNIIF '
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'auxcue')
begin 	
	Alter Table con_pucniif Add auxcue Bit Not Null Default 0
	Print 'con_pucniif - auxcue'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'numche')
begin 
	Alter Table con_pucniif Add numche decimal(10,0) NOT NULL Default 0
	Print 'con_pucniif - numche'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'retcue')
begin 	
	Alter Table con_pucniif Add retcue bit NOT NULL Default 0
	Print 'con_pucniif - retcue'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'ajucue')
begin 
	Alter Table con_pucniif Add ajucue bit NOT NULL Default 0
	Print 'con_pucniif  - ajucue'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'depcue')
begin 
	Alter Table con_pucniif Add depcue bit NOT NULL Default 0
	Print 'con_pucniif - depcue'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'porret')
begin 	
	Alter Table con_pucniif Add porret decimal(5,2) NOT NULL Default 0
	Print 'con_pucniif - porret'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'natcue')
begin 
	Alter Table con_pucniif Add natcue nvarchar(1) NOT NULL Default ''
	Print 'con_pucniif - natcue'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'monto')
begin 	
	Alter Table con_pucniif Add monto decimal(14,2)	NOT NULL Default 0
	Print 'con_pucniif - monto'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'ctajustd')
begin 	
	Alter Table con_pucniif Add ctajustd nvarchar(8) NOT NULL Default ''
	Print 'con_pucniif - ctajustd'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'ctajustc')
begin 	
	Alter Table con_pucniif Add ctajustc nvarchar(8) NOT NULL Default ''
	Print 'con_pucniif  - ctajustc'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'añodep')
begin 
	Alter Table con_pucniif Add añodep decimal(2,0)	NOT NULL Default 0
	Print 'con_pucniif - añodep'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'sancue')
begin 	
	Alter Table con_pucniif Add sancue decimal(15,2) NOT NULL Default 0
	Print 'con_pucniif - sancue'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'nivcue')
begin 
	Alter Table con_pucniif Add nivcue decimal(1,0) NOT NULL Default 0
	Print 'con_pucniif - nivcue '
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'centro')
begin 
	Alter Table con_pucniif Add centro bit NOT NULL Default 0
	Print 'con_pucniif - centro'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'tercero')
begin 
	Alter Table con_pucniif Add tercero bit NOT NULL Default 0
	Print 'con_pucniif - tercero'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'inf')
begin 
	Alter Table con_pucniif Add inf bit NOT NULL Default 0
	Print 'con_pucniif - inf'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'formato')
begin 
	Alter Table con_pucniif Add formato nvarchar(60) NOT NULL Default ''
	Print 'con_pucniif - formato'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'codadd')
begin 	
	Alter Table con_pucniif Add codadd nvarchar(2) NOT NULL Default ''
	Print 'con_pucniif - codadd'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'poriva')
begin 	
	Alter Table con_pucniif Add poriva decimal(6, 2) NOT NULL Default 0
	Print 'con_pucniif - poriva'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'ivacue')
begin 	
	Alter Table con_pucniif Add ivacue bit NOT NULL Default 0
	Print 'con_pucniif - ivacue'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'macentro')
begin 	
	Alter Table con_pucniif Add macentro bit NOT NULL Default 0
	Print 'con_pucniif - macentro '
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'manit')
begin 	
	Alter Table con_pucniif Add manit bit NOT NULL Default 0
	Print 'Con_Comprobante - manit'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'manitbco')
begin 	
	Alter Table con_pucniif Add manitbco bit NOT NULL Default 0
	Print 'con_pucniif - manitbco'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'nitbco')
begin 
	Alter Table con_pucniif Add nitbco nvarchar(15) NOT NULL Default ''
	Print 'con_pucniif -nitbco '
end
Go

IF NOT EXISTS (Select  Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'ctaegrcaj')
begin 
	Alter Table con_pucniif Add ctaegrcaj bit NOT NULL Default 0
	Print 'con_pucniif - ctaegrcaj'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'tiprete')
begin 
	Alter Table con_pucniif Add tiprete decimal(1, 0) NOT NULL Default 0
	Print 'con_pucniif - tiprete '
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'diferido')
begin 
	Alter Table con_pucniif Add diferido bit NOT NULL Default 0
	Print 'con_pucniif - diferido'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'ctagasdife')
begin 
	Alter Table con_pucniif Add ctagasdife nvarchar(8) NOT NULL Default ''
	Print 'con_pucniif ctagasdife '
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'manactivo')
begin 
	Alter Table con_pucniif Add manactivo bit NOT NULL Default 0
	Print 'Con_Comprobante - manactivo'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_pucniif' AND T.column_name = 'ctaori')
begin 
	Alter Table con_pucniif Add ctaori bit NOT NULL Default 0
	Print 'con_pucniif - ctaori'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'con_CtaCtoNIIF' AND T.column_name = 'idemp')					-- Éduar Álvarez - Junio 23 de 2015.
begin 	
	Alter Table con_CtaCtoNIIF Add idemp nVarChar(3) Not Null Default ''
	Print 'Idx con_CtaCtoNIIF - idemp '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Parametros' AND T.column_name = 'codctoNIIF')
begin 
	Alter Table Con_Parametros Add codctoNIIF nVarChar(10) Not Null Default ''
	Print 'Con_Parametros - codctoNIIF ' 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Parametros' AND T.column_name = 'AñoMayorizaNIIF')
begin 	
	Alter Table Con_Parametros Add AñoMayorizaNIIF Numeric(4) Not Null Default 0
	Print 'Con_Parametros - AñoMayorizaNIIF'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_CtaCenCostos' AND T.column_name = 'Año')
begin 
	Alter Table Con_CtaCenCostos Add Año Numeric(4) Not Null Default 0
	Print 'Con_CtaCenCostos - Año'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'con_CtaCtoNIIF' AND T.column_name = 'Año')
begin 	
	Alter Table con_CtaCtoNIIF Add Año Numeric(4) Not Null Default 0
	Print 'con_CtaCtoNIIF - Año'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_CtaCenCostos' AND T.column_name = 'codalm')
begin 	
	Alter Table Con_CtaCenCostos Add codalm nVarChar(3) Not Null Default ''
	Print 'Con_CtaCenCostos - codalm'	
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'con_CtaCtoNIIF' AND T.column_name = 'codalm')
begin 
	Alter Table con_CtaCtoNIIF Add codalm nVarChar(3) Not Null Default ''
	Print 'con_CtaCtoNIIF -  codalm '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'con_comproniif' AND T.column_name = 'codalm')				-- Éduar Álvarez - Junio 26 de 2015.
begin 	
	Alter Table con_comproniif Add codalm nVarChar(3) Not Null Default ''
	Print 'Con_Comprobante '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_MesCierre' AND T.column_name = 'Cierre_NIIF')			-- Éduar Álvarez - Julio 03 de 2015.
begin
	Alter Table Con_MesCierre Add Cierre_NIIF Bit Not Null Default 0
	Print 'Con_MesCierre- Cierre_NIIF  '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D01Cue' and DATA_TYPE!='decimal')					-- Éduar Álvarez - Julio 10 de 2015.
begin	
	Alter Table Con_CtaCencostos Alter Column D01Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos  D01Cue '
end
go  

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C01Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column C01Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C01Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D02Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column D02Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D02Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C02Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column C02Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C02Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D03Cue' and DATA_TYPE!='decimal' )
begin	
	Alter Table Con_CtaCencostos Alter Column D03Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D03Cue'
end
go 
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C03Cue' and DATA_TYPE!='decimal' )
begin
	Alter Table Con_CtaCencostos Alter Column C03Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C03Cue '
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D04Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column D04Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D04Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C04Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column C04Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C04Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D05Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column D05Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D05Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C05Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column C05Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C05Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D06Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column D06Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D06Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C06Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column C06Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C06Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D07Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column D07Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D07Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C07Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column C07Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C07Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D08Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column D08Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D08Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C08Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column C08Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C08Cue'
end
go
 
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D09Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column D09Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D09Cue'
end
go 	

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C09Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column C09Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C09Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D10Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column D10Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D10Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C10Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column C10Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C10Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D11Cue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column D11Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D11Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C11Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column C11Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C11Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'D12Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column D12Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos D12Cue'
end 
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'C12Cue' and DATA_TYPE!='decimal')
begin
	Alter Table Con_CtaCencostos Alter Column C12Cue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos C12Cue'
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_CtaCencostos' AND T.Column_name = 'sancue' and DATA_TYPE!='decimal')
begin	
	Alter Table Con_CtaCencostos Alter Column sancue Decimal(18,2) NOT NULL
	Print 'Con_CtaCencostos sancue'
end 
Go 

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Con_Parametros' AND T.Column_Name = 'cpdecima')		-- Éduar Álvarez. - Julio 14 de 2015.
begin 	
	Alter Table Con_Parametros Add cpdecima Numeric(1) NOT NULL DEFAULT 00
	Print ' Con_Parametros - cpdecima '
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Con_CtaCenCostos' AND T.Column_Name = 'codcen')
begin 	
	Alter Table Con_CtaCenCostos Add codcen nVarChar(3) NOT NULL DEFAULT ''
	Print 'Con_CtaCenCostos - codcen'
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Con_CenCostos' AND T.Column_Name = 'inftras')
begin 	
	Alter Table Con_CenCostos Add inftras bit NOT NULL DEFAULT 0
	Print 'Con_CenCostos - inftras'
end
Go

--CAMBIO DE JHONATAN DE ERROR "La restricción de clave principal 'PK_Con_CtaCenCostos' en la tabla 'Con_CtaCencostos' no se puede eliminar porque el seguimiento de cambios está habilitado en la tabla. El seguimiento de cambios requiere una restricción de clave principal en la tabla. Deshabilite el seguimiento de cambios antes de eliminar la restricción. -- 23/11/2022


IF  EXISTS (Select TABLE_NAME,* From Information_Schema.KEY_COLUMN_USAGE AS T Where T.Table_Name = 'Con_CtaCencostos' AND T.CONSTRAINT_NAME = 'PK_con_ctacencostos')
begin
   ALTER TABLE Con_CtaCencostos
DISABLE CHANGE_TRACKING;    
	ALTER TABLE Con_CtaCencostos DROP CONSTRAINT [PK_con_ctacencostos]; print 'La Primary Key "PK_con_ctacencostos" de la tabla: "Con_CtaCencostos", fue Eliminada'
	Print 'Con_CtaCencostos -PK_con_ctacencostos '
end

go 



IF  not EXISTS (Select TABLE_NAME From Information_Schema.KEY_COLUMN_USAGE AS T Where T.Table_Name = 'Con_CtaCencostos' AND T.CONSTRAINT_NAME = 'PK_con_ctacencostos')
begin
	ALTER TABLE Con_CtaCencostos ADD  CONSTRAINT [PK_Con_CtaCenCostos] PRIMARY KEY CLUSTERED ([idemp] ASC, [año] ASC, [codcto] ASC, [codcue] ASC)
				WITH (PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY]; Print 'y Creada nuevamente.'
	Print 'Con_CtaCencostos -  PK_con_ctacencostos '
end
go 

--CAMBIO DE JHONATAN, SE VUELVE A HABILITAR EL SEGUIMIENTO DE CAMBIOS YA QUE SE DESACTIVO PARA EHECUTAR EL SCRIP DE RETENCION PK_Con_CtaCencostos
begin
ALTER TABLE Con_CtaCencostos
ENABLE CHANGE_TRACKING;  
end
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_PorAjust' AND T.column_name = 'idemp') 
begin 
	Alter Table Con_PorAjust Add idemp nvarchar(3) not null default ''
	Print 'Con_PorAjust - idemp'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_comprobante' AND T.column_name = 'consec2')  --para la renumeracion de paso de info 
begin 
	Alter Table Con_comprobante Add consec2 nvarchar(16) not null default ''
	Print 'Con_comprobante - consec2'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_comprobante'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table Con_comprobante Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'Con_comprobante - modificadoc'  -- ing. Lissette  16/09/2016  cuando se modifique una factura este campo se ira incrementado de 1 en 1, por documento. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_comprobante'  AND T.column_name = 'docdelete') 
begin 
	Alter Table Con_comprobante Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'Con_comprobante - docdelete'  -- ing. Lissette  13/10/2016  cuando se modifique un documento este campo se cambiara a 1 para saber que fue "Borrado"
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comproniif'  AND T.column_name = 'docdelete') 
begin 
	Alter Table con_comproniif Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_comproniif - docdelete'  -- ing. Lissette  15/10/2016  cuando se modifique un documento este campo se cambiara a 1 para saber que fue "Borrado"
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif'  AND T.column_name = 'Codcue') 
begin 
	Alter Table con_pucniif Add Codcue  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'con_pucniif - Codcue'  -- ing. Lissette  19/10/2016 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif'  AND T.column_name = 'NomCue') 
begin 
	Alter Table con_pucniif Add NomCue  nvarchar(40)  NOT NULL DEFAULT ''
	Print 'con_pucniif - NomCue'  -- ing. Lissette  19/10/2016 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_Puc'  AND T.column_name = 'cerrarcta') 
begin 
	Alter Table Con_Puc Add cerrarcta  bit NOT NULL DEFAULT 0
	Print 'Con_Puc - cerrarcta'  -- ing. Lissette  20/10/2016 -- .t. para cerrar cuentas que son de balance 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_Puc'  AND T.column_name = 'ctacierre') 
begin 
	Alter Table Con_Puc Add ctacierre  nVarchar(8) NOT NULL DEFAULT ''
	Print 'Con_Puc - ctacierre'  -- ing. Lissette  20/10/2016 --cta para cerrar cuentas que son de balance 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_Puc'  AND T.column_name = 'nitcierre') 
begin 
	Alter Table Con_Puc Add nitcierre  nVarchar(15) NOT NULL DEFAULT ''
	Print 'Con_Puc - nitcierre'  -- ing. Lissette  20/10/2016 -- nit para cerrar cuentas que son de balance 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_comprobante'  AND T.column_name = 'estniif') 
begin 
	Alter Table Con_comprobante Add estniif  bit NOT NULL DEFAULT 0
	Print 'Con_comprobante - estniif'  -- ing. Lissette  23/10/2016 -- estado para comprobante niif. 0 no se ha pasasdo 1 ya se paso. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_CtaCtoNIIF'  AND T.column_name = 'codcen') 
begin 
	Alter Table con_CtaCtoNIIF Add codcen  nvarchar(3) NOT NULL DEFAULT ''
	Print 'con_CtaCtoNIIF - codcen'  -- ing. Lissette  24/10/2016 -- codigo centro de consumo
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_parametros'  AND T.column_name = 'Ctaretgta') 
begin 
	Alter Table con_parametros Add Ctaretgta  NVARCHAR(8)  NOT NULL DEFAULT ''
	Print 'con_parametros - Ctaretgta'  -- ing. Jesus Pinto  17/11/2016  Retenciones por garantia AMGO
end
Go


IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'debito' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table con_comprobante ALTER COLUMN debito decimal(18,4) 
	Print 'con_comprobante - debito - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'credito' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table con_comprobante ALTER COLUMN credito decimal(18,4) 
	Print 'con_comprobante - credito - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Tes_DetConciliacion' AND T.column_name = 'valor' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table Tes_DetConciliacion ALTER COLUMN valor decimal(18,4) 
	Print 'Tes_DetConciliacion - valor - aumento de dicimales'  -- Ing. Lissette 17 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Tes_conciliacion' AND T.column_name = 'saldoant' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table Tes_conciliacion ALTER COLUMN saldoant decimal(18,4) 
	Print 'Tes_conciliacion - saldoant - aumento de dicimales'  -- Ing. Lissette 17 feb 2017
end 
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cargapuc' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_cargapuc ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_cargapuc - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Con_Parametros' AND T.column_name = 'mesmayoriza') 
begin 
	Alter Table Con_Parametros add  mesmayoriza nvarchar(2) 
	Print 'Con_Parametros - mesmayoriza '  -- Ing. Lissette 03 Mayo 2017  -- para guardar el mes e
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cargapuc' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_cargapuc ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_cargapuc - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cargapuc' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_cargapuc ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_cargapuc - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cargapuc' AND T.column_name = 'codusu') 
begin 
	Alter Table con_cargapuc ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_cargapuc - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cargapuc' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_cargapuc  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_cargapuc  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cargapuc'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_cargapuc Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_cargapuc - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cencostos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_cencostos ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_cencostos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cencostos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_cencostos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_cencostos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cencostos' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_cencostos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_cencostos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cencostos' AND T.column_name = 'codusu') 
begin 
	Alter Table con_cencostos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_cencostos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cencostos' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_cencostos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_cencostos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_cencostos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_cencostos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_cencostos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_comprobante ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_comprobante - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_comprobante ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_comprobante - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_comprobante ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_comprobante - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'codusu') 
begin 
	Alter Table con_comprobante ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_comprobante - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_comprobante  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_comprobante  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_comprobante Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_comprobante - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobtmp' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_comprobtmp ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_comprobtmp - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobtmp' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_comprobtmp ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_comprobtmp - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobtmp' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_comprobtmp ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_comprobtmp - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobtmp' AND T.column_name = 'codusu') 
begin 
	Alter Table con_comprobtmp ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_comprobtmp - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobtmp' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_comprobtmp  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_comprobtmp  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobtmp'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_comprobtmp Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_comprobtmp - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comproniif' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_comproniif ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_comproniif - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comproniif' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_comproniif ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_comproniif - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comproniif' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_comproniif ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_comproniif - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comproniif' AND T.column_name = 'codusu') 
begin 
	Alter Table con_comproniif ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_comproniif - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comproniif' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_comproniif  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_comproniif  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comproniif'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_comproniif Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_comproniif - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Conmedios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_Conmedios ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_Conmedios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Conmedios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_Conmedios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_Conmedios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Conmedios' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_Conmedios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_Conmedios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Conmedios' AND T.column_name = 'codusu') 
begin 
	Alter Table con_Conmedios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_Conmedios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Conmedios' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_Conmedios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_Conmedios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Conmedios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_Conmedios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_Conmedios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_ctacencostos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_ctacencostos ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_ctacencostos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_ctacencostos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_ctacencostos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_ctacencostos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_ctacencostos' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_ctacencostos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_ctacencostos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_ctacencostos' AND T.column_name = 'codusu') 
begin 
	Alter Table con_ctacencostos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_ctacencostos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_ctacencostos' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_ctacencostos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_ctacencostos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_ctacencostos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_ctacencostos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_ctacencostos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_CtaCtoNIIF' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_CtaCtoNIIF ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_CtaCtoNIIF - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_CtaCtoNIIF' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_CtaCtoNIIF ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_CtaCtoNIIF - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_CtaCtoNIIF' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_CtaCtoNIIF ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_CtaCtoNIIF - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_CtaCtoNIIF' AND T.column_name = 'codusu') 
begin 
	Alter Table con_CtaCtoNIIF ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_CtaCtoNIIF - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_CtaCtoNIIF' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_CtaCtoNIIF  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_CtaCtoNIIF  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_CtaCtoNIIF'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_CtaCtoNIIF Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_CtaCtoNIIF - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Division' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_Division ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_Division - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Division' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_Division ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_Division - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Division' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_Division ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_Division - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Division' AND T.column_name = 'codusu') 
begin 
	Alter Table con_Division ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_Division - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Division' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_Division  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_Division  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_Division'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_Division Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_Division - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_foldetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_foldetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_foldetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_foldetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_foldetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_foldetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_foldetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_foldetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_foldetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_foldetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table con_foldetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_foldetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_foldetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_foldetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_foldetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_foldetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_foldetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_foldetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_gruponiif' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_gruponiif ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_gruponiif - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_gruponiif' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_gruponiif ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_gruponiif - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_gruponiif' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_gruponiif ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_gruponiif - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_gruponiif' AND T.column_name = 'codusu') 
begin 
	Alter Table con_gruponiif ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_gruponiif - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_gruponiif' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_gruponiif  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_gruponiif  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_gruponiif'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_gruponiif Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_gruponiif - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_folios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_folios ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_folios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_folios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_folios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_folios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_folios' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_folios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_folios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_folios' AND T.column_name = 'codusu') 
begin 
	Alter Table con_folios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_folios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_folios' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_folios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_folios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_folios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_folios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_folios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_medios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_medios ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_medios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_medios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_medios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_medios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_medios' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_medios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_medios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_medios' AND T.column_name = 'codusu') 
begin 
	Alter Table con_medios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_medios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_medios' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_medios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_medios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_medios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_medios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_medios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_mescierre' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_mescierre ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_mescierre - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_mescierre' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_mescierre ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_mescierre - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_mescierre' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_mescierre ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_mescierre - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_mescierre' AND T.column_name = 'codusu') 
begin 
	Alter Table con_mescierre ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_mescierre - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_mescierre' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_mescierre  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_mescierre  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_mescierre'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_mescierre Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_mescierre - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_movactivo' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_movactivo ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_movactivo - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_movactivo' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_movactivo ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_movactivo - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_movactivo' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_movactivo ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_movactivo - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_movactivo' AND T.column_name = 'codusu') 
begin 
	Alter Table con_movactivo ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_movactivo - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_movactivo' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_movactivo  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_movactivo  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_movactivo'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_movactivo Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_movactivo - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_parametros' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_parametros ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_parametros - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_parametros' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_parametros ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_parametros - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_parametros' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_parametros ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_parametros - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_parametros' AND T.column_name = 'codusu') 
begin 
	Alter Table con_parametros ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_parametros - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_parametros' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_parametros  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_parametros  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_parametros'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_parametros Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_parametros - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_politicas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_politicas ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_politicas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_politicas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_politicas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_politicas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_politicas' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_politicas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_politicas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_politicas' AND T.column_name = 'codusu') 
begin 
	Alter Table con_politicas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_politicas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_politicas' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_politicas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_politicas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_politicas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_politicas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_politicas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_porajust' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_porajust ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_porajust - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_porajust' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_porajust ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_porajust - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_porajust' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_porajust ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_porajust - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_porajust' AND T.column_name = 'codusu') 
begin 
	Alter Table con_porajust ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_porajust - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_porajust' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_porajust  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_porajust  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_porajust'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_porajust Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_porajust - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_puc' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_puc ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_puc - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_puc' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_puc ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_puc - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_puc' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_puc ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_puc - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_puc' AND T.column_name = 'codusu') 
begin 
	Alter Table con_puc ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_puc - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_puc' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_puc  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_puc  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_puc'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_puc Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_puc - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_pucniif ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_pucniif - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_pucniif ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_pucniif - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_pucniif ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_pucniif - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif' AND T.column_name = 'codusu') 
begin 
	Alter Table con_pucniif ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_pucniif - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_pucniif  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_pucniif  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_pucniif'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_pucniif Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_pucniif - modificadoc'  
end
Go



IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_resolclientes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table con_resolclientes ADD fecsys datetime not null DEFAULT getdate()
	Print 'con_resolclientes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_resolclientes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table con_resolclientes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'con_resolclientes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_resolclientes' AND T.column_name = 'codusumod') 
begin 
	Alter Table con_resolclientes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'con_resolclientes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_resolclientes' AND T.column_name = 'codusu') 
begin 
	Alter Table con_resolclientes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'con_resolclientes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_resolclientes' AND T.column_name = 'docdelete') 
begin 
	Alter Table con_resolclientes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'con_resolclientes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_resolclientes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table con_resolclientes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'con_resolclientes - modificadoc'  
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_parametros' AND T.column_name = 'ctamerca')	
begin 	
	Alter Table con_parametros Add ctamerca nVarChar(8) Not Null Default ''
	Print 'con_parametros - ctamerca'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'codmov')	
begin 	
	Alter Table tes_egresos Add codmov nVarChar(3) Not Null Default ''
	Print 'tes_egresos - codmov'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'nitben')	
begin 	
	Alter Table tes_egresos Add nitben nVarChar(15) Not Null Default ''
	Print 'tes_egresos - nitben'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'codcon')	
begin 	
	Alter Table tes_egresos Add codcon nVarChar(3) Not Null Default ''
	Print 'tes_egresos - codcon'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'Con_PucNiif' AND T.column_name = 'CtaConcilia')	
begin 	
	Alter Table Con_PucNiif Add CtaConcilia Bit  Not Null Default 0
	Print 'Con_PucNiif - CtaConcilia'
end
Go
IF  NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Tes_DetConciliacion' AND T.column_name = 'itemdoc') 
begin 
	Alter Table Tes_DetConciliacion ADD itemdoc INT NOT NULL DEFAULT 1
	Print 'Tes_DetConciliacion - itemdoc '  -- Ing. jesus 22 de marzo 2018
end 

IF  NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Tes_DetConciliacion' AND T.column_name = 'fecsys') 
begin 
	Alter Table Tes_DetConciliacion ADD fecsys DATETIME not null DEFAULT GETDATE()
	Print 'Tes_DetConciliacion - fecsys '  -- Ing. jesus 22 de marzo 2018
end 

IF  NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Tes_Conciliacion' AND T.column_name = 'fecsys') 
begin 
	Alter Table Tes_Conciliacion ADD fecsys DATETIME not null DEFAULT GETDATE()
	Print 'Tes_Conciliacion - fecsys '  -- Ing. jesus 22 de marzo 2018
end 


IF  NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Tes_DetConciliacion' AND T.column_name = 'numche') 
begin 
	Alter Table Tes_DetConciliacion ADD numche nvarchar(10) not null DEFAULT ''
	Print 'Tes_DetConciliacion - numche '  -- Ing. Lissette 05/04/2018
end 
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table tes_egresos Add codusuanul nVarChar(100) Not Null Default ''
	Print 'tes_egresos - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table tes_egresos Add fecsysanul DATETIME Not Null Default ''
	Print 'tes_egresos - fecsysanul'
end
go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_comprobante' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table con_comprobante Add codusuanul nVarChar(100) Not Null Default ''
	Print 'con_comprobante - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_comprobante' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table con_comprobante Add fecsysanul DATETIME Not Null Default ''
	Print 'con_comprobante - fecsysanul'
end
GO

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_comprobante' AND T.column_name = 'docconcilia')	
begin 	
	Alter Table con_comprobante Add docconcilia nvarchar(10) Not Null Default ''
	Print 'con_comprobante - docconcilia'
end
GO

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_conciliacion' AND T.column_name = 'vlrfinallibro')	
begin 	
	Alter Table tes_conciliacion Add vlrfinallibro decimal(18,4) Not Null Default 0
	Print 'tes_conciliacion - vlrfinallibro'
end
GO

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'Con_puc' AND T.column_name = 'corriente')	
begin 	
	Alter Table Con_puc Add corriente bit Not Null Default 0
	Print 'Con_puc - corriente'
end
GO
----------------------------------Actualizado en el esquema hasta aqui------------------26/07/2018

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'Nomben' and t.CHARACTER_MAXIMUM_LENGTH!=200)	
begin 	
	Alter Table tes_egresos alter column Nomben nvarchar(200)
	Print 'tes_egresos - Nomben'
end
GO
----------------Actualizado 01022019  Lissette 

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'estentrega')	
begin 	
	Alter Table tes_egresos Add estentrega nVarChar(1) Not Null Default ''
	Print 'tes_egresos - estentrega'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'rutafoto')	
begin 	
	Alter Table tes_egresos Add rutafoto nVarChar(200) Not Null Default ''
	Print 'tes_egresos - rutafoto'
end
Go
IF  EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'tes_egresos' AND T.column_name = 'observa')	
begin 	
	Alter Table tes_egresos ALTER COLUMN observa NVARCHAR(500) 
	Print 'tes_egresos - observa'
end
go 

--------------- Actualizado en init 25/04/2019 Andres Jimenez

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_comprobante' AND T.column_name = 'docrelproduc')	
begin 	
	Alter Table con_comprobante Add docrelproduc nVarChar(40) Not Null Default ''
	Print 'con_comprobante - docrelproduc'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_parametros' AND T.column_name = 'plazocartniif')	
begin 	
	Alter Table con_parametros Add plazocartniif numeric(10) Not Null Default 0
	Print 'con_parametros - plazocartniif'
end
Go

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'con_parametros' AND T.column_name = 'holguracarniif')	
begin 	
	Alter Table con_parametros Add holguracarniif numeric(10) Not Null Default 0
	Print 'con_parametros - holguracarniif'
end
Go
---Agregado 27-11-2023 Cuenta impuesto saludable
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'con_parametros' AND T.Column_Name = 'ctaIbua')  
begin 
	Alter Table con_parametros	add ctaIbua nvarchar(8) not null default ''
	Print 'con_parametros - ctaIbua'  
end 
Go