IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'porxsal') 
begin
	Alter Table tra_conceptos Add porxsal bit Not Null Default 0
	Print 'tra_conceptos - porxsal'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'porcen') 
begin
	Alter Table tra_conceptos Add porcen numeric (5,0) Not Null Default 0
	Print 'tra_conceptos - porcen'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'nittercr') 
begin
	Alter Table tra_conceptos Add nittercr nvarchar(15) NOT NULL DEFAULT ''
	Print 'tra_conceptos - nittercr'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'gencontab') 
begin
	Alter Table tra_conceptos Add gencontab bit Not Null Default 0
	Print 'tra_conceptos - gencontab'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'aplisaldo') 
begin
	Alter Table tra_conceptos Add aplisaldo bit Not Null Default 0
	Print 'tra_conceptos - aplisaldo'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'confijo') 
begin
	Alter Table tra_conceptos Add confijo bit Not Null Default 0
	Print 'tra_conceptos - confijo'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'conaporte') 
begin
	Alter Table tra_conceptos Add conaporte bit Not Null Default 0
	Print 'tra_conceptos - conaporte'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'ahrvolunta')begin
	Alter Table tra_conceptos Add ahrvolunta bit Not Null Default 0
	Print 'tra_conceptos - ahrvolunta'
end
Go
--------- Campos agregados para trabajar en el módulo de transporte 27-01-2023
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'modpla')begin
	Alter Table glb_terceros Add modpla bit Not Null Default 0
	Print 'glb_terceros - modpla'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_terceros' AND T.column_name = 'terbus')begin
	Alter Table glb_terceros Add terbus bit Not Null Default 0
	Print 'glb_terceros - terbus'
end
Go
-- Se expandió porque no guardaba completo el codigo de los conceptos cuando se abona
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'afetip' 
		and t.CHARACTER_MAXIMUM_LENGTH!=3) 
begin 
	Alter Table ven_movcli alter column afetip nvarchar(3) 
	Print 'ven_movcli - afetip'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos' AND T.column_name = 'numcuo' and
T.NUMERIC_PRECISION!=4 )  
begin 
	Alter Table ven_facuopagos ALTER COLUMN numcuo decimal(4,0) NOT NULL DEFAULT 0
	Print 'ven_facuopagos - numcuo'
end
Go
-- Agregado 22-02-2023 campos que estaban en visual para la pantalla de notas credito que no estaban en Sql
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_detacartera' AND T.column_name = 'abocapi') 
begin
	Alter Table tra_detacartera Add abocapi decimal (18,0) Not Null Default 0
	Print 'tra_detacartera - abocapi'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_detacartera' AND T.column_name = 'abointe') 
begin
	Alter Table tra_detacartera Add abointe decimal (18,0) Not Null Default 0
	Print 'tra_detacartera - abointe'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_detacartera' AND T.column_name = 'aboseg') 
begin
	Alter Table tra_detacartera Add aboseg decimal (18,0) Not Null Default 0
	Print 'tra_detacartera - aboseg'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'con_comprobante' AND T.column_name = 'contrato') 
begin
	Alter Table con_comprobante Add contrato nvarchar(10) NOT NULL DEFAULT ''
	Print 'con_comprobante - contrato'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_conceptos' AND T.column_name = 'tipaporte') 
begin
	Alter Table tra_conceptos Add tipaporte nvarchar(1) NOT NULL DEFAULT ''
	Print 'tra_conceptos - tipaporte'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'tra_cartera' AND T.column_name = 'estedit') 
begin
	Alter Table tra_cartera Add estedit bit NOT NULL DEFAULT 0
	Print 'tra_cartera - estedit'
end
Go