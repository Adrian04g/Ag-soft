IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Pro_Formulas' AND T.column_name = 'Valexis') 
begin 
	Alter Table Pro_Formulas Add Valexis bit not null default 0
	Print 'Pro_Formulas - Valexis'
end   -- ing. Lissete Castro 17/07/2016 Para Saber que articulos es el que va a mostrar y validar existencias de un intangible. 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'observa') 
begin 
	Alter Table pro_ordenesdet Add observa nvarchar(250) not null default ''
	Print 'pro_ordenesdet - observa'
end   -- ing. Lissete Castro 29/01/2018 registro de observaciones
Go

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'pro_ordenesdet'  AND T.column_name = 'qtyart' and t.data_type!='decimal' ) 
begin 
	ALTER TABLE pro_ordenesdet ALTER COLUMN qtyart decimal(18,4)
	Print 'pro_ordenesdet - qtyart'
end   -- ing. Lissete Castro 30/01/2018 registro de observaciones
Go

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'pro_ordenesdet'  AND T.column_name = 'ucoart' and t.data_type!='decimal' ) 
begin 
	ALTER TABLE pro_ordenesdet ALTER COLUMN ucoart decimal(18,4)
	Print 'pro_ordenesdet - ucoart'
end   -- ing. Lissete Castro 30/01/2018 registro de observaciones
Go
----------------------------------Actualizado en el esquema hasta aqui------------------27/07/2018

IF not EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'pro_costos'  AND T.column_name = 'iva'  ) 
begin 
	ALTER TABLE pro_costos add iva decimal(18,4) not null CONSTRAINT DF_pro_costos_iva default 0
	Print 'pro_costos - iva' 
end   -- ing. Lissete Castro 30/01/2019 registro de observaciones
Go

IF not EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'pro_costos'  AND T.column_name = 'valiva'  ) 
begin 
	ALTER TABLE pro_costos add valiva decimal(18,4) not null CONSTRAINT DF_pro_costos_valiva default 0
	Print 'pro_costos - valiva' 
end   -- ing. Lissete Castro 30/01/2019 registro de observaciones
Go
--------------------Actualizado 01022019  Lissette Castro 01022019

--BEGIN TRANSACTION
GO
ALTER TABLE dbo.pro_costos
	DROP CONSTRAINT DF_pro_costos_fecsys
GO
ALTER TABLE dbo.pro_costos ADD CONSTRAINT
	DF_pro_costos_fecsys DEFAULT getdate() FOR fecsys
GO
ALTER TABLE dbo.pro_costos SET (LOCK_ESCALATION = TABLE)
GO
--COMMIT
--lect Has_Perms_By_Name(N'dbo.pro_costos', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.pro_costos', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.pro_costos', 'Object', 'CONTROL') as Contr_Per 
go  

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'codprod') 
begin 
	Alter Table pro_ordenesdet Add codprod nvarchar(10) not null default ''
	Print 'pro_ordenesdet - codprod'
end   -- ing. Lissete Castro 29/02/2018 codigo del producto
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'caninv') 
begin 
	ALTER TABLE pro_ordenesdet alter column caninv numeric(20,3) not null 
	Print 'pro_ordenesdet - caninv se aumento los decimales a 3'
end   -- ing. Luis Dominguez 2019-05-06
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'itemfac') 
begin 
	Alter Table pro_ordenesdet Add itemfac numeric(10,0) not null CONSTRAINT DF_pro_ordenesdet_itemfac default 0
	Print ' se creo el campo --> pro_ordenesdet.itemfac'
end   -- ing. Luis Dominguez 2019-05-06
Go
----------------------Actualizado en init 25/04/2019 Andres Jimenez

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_costos' AND T.column_name = 'codusu') 
begin 
	ALTER TABLE pro_costos alter column codusu nvarchar(10) not null 
	Print 'pro_costos - codusu se aumento los decimales a 10'
end   -- ing. Lissett 22-05-2019
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'itemkar') 
begin 
	Alter Table pro_ordenesdet Add itemkar numeric(10) not null CONSTRAINT DF_pro_ordenesdet_itemkar default 0
	Print ' se creo el campo --> pro_ordenesdet.itemkar'
end   -- Lissette castro 2019-05-28
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'fecsys') 
begin 
	Alter Table pro_ordenesdet Add fecsys datetime  not null CONSTRAINT DF_pro_ordenesdet_fecsys default getdate()
	Print ' se creo el campo --> pro_ordenesdet.fecsys'
end   -- Lissette castro 2019-05-28
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenes' AND T.column_name = 'itemfac') 
begin 
	Alter Table pro_ordenes Add itemfac numeric(10,0) not null CONSTRAINT DF_pro_ordenes_itemfac default 0
	Print ' se creo el campo --> pro_ordenes.itemfac'
end   -- ing. Lissette 2019-056-19
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'contratista') 
begin 
	Alter Table pro_ordenesdet Add contratista nvarchar(15) not null CONSTRAINT DF_pro_ordenesdet_contratista default ''
	Print 'pro_ordenesdet - contratista'
end   -- ing. Lissete Castro 21/09/2019 registro de observaciones
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenes' AND T.column_name = 'tipord') 
begin 
	Alter Table pro_ordenes Add tipord nvarchar(2) not null default ' '
	Print ' se creo el campo --> pro_ordenes.tipord'
end   -- ing. Shirley R 2020-07-27 Desarrollo de Produccion de Diseñarte.
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_orddetalle' AND T.column_name = 'tipord') 
begin 
	Alter Table pro_orddetalle Add tipord nvarchar(2) not null default ' '
	Print ' se creo el campo --> pro_orddetalle.tipord'
end   -- ing. Shirley R 2020-07-27 Desarrollo de Produccion de Diseñarte.
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_ordenesdet' AND T.column_name = 'tipord') 
begin 
	Alter Table pro_ordenesdet Add tipord nvarchar(2) not null default ' '
	Print ' se creo el campo --> pro_ordenesdet.tipord'
end   -- ing. Shirley R 2020-07-27 Desarrollo de Produccion de Diseñarte.
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_costos' AND T.column_name = 'tipord') 
begin 
	Alter Table pro_costos Add tipord nvarchar(2) not null default ' '
	Print ' se creo el campo --> pro_costos.tipord'
end   -- ing. Shirley R 2020-07-27 Desarrollo de Produccion de Diseñarte.
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_descuentos' AND T.column_name = 'tipord') 
begin 
	Alter Table pro_descuentos Add tipord nvarchar(2) not null default ' '
	Print ' se creo el campo --> pro_descuentos.tipord'
end   -- ing. Shirley R 2020-07-27 Desarrollo de Produccion de Diseñarte.
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_movcontrato' AND T.column_name = 'tipord') 
begin 
	Alter Table pro_movcontrato Add tipord nvarchar(2) not null default ' '
	Print ' se creo el campo --> pro_movcontrato.tipord'
end   -- ing. Shirley R 2020-07-27 Desarrollo de Produccion de Diseñarte.
Go

----Campos Antiguos que existen pero que no estan en el restruct y Arnold los necesitaba en la App de Deliloco
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_formulas' AND T.column_name = 'item2') 
begin 
	alter table pro_formulas add item2 numeric(10, 0) NOT NULL DEFAULT(0)	
	Print 'pro_formulas -  item2'
end  
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_formulas' AND T.column_name = 'servidor') 
begin 
	alter table pro_formulas add servidor nvarchar(60) NULL DEFAULT('SERVER')	
	Print 'pro_formulas -  servidor'
end  
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'pro_formulas' AND T.column_name = 'codart') 
begin 
	alter table pro_formulas add codart nvarchar(60) NULL DEFAULT('')		
	Print 'pro_formulas -  codart'
end  
Go
-- 18-02-2021 Parametro agregado para el desarrollo de Santana de descargar todos los ingredientes de las formulas agregadas de una vez
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'pro_parametros' AND Temp.column_name = 'generardetalle') 
begin 
	Alter Table pro_parametros Add generardetalle bit Not Null Default 0
	Print 'pro_parametros generardetalle' --Ing. Lissette 2021-02-16
end
Go
--- 04-08-2021 parametro agregado para desarrollo de diseñarte, contabilizar reprocesos y garantias con otra cuenta
IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'pro_parametros' AND Temp.column_name = 'ctainvpro') 
begin 
	Alter Table pro_parametros Add ctainvpro  nchar(10) NULL DEFAULT('')
	Print 'pro_parametros ctainvpro' 
end
Go