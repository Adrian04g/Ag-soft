IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_alm_inventario_caninv')
BEGIN
	ALTER TABLE alm_inventario DROP CONSTRAINT DF_alm_inventario_caninv
END 
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'caninv' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN caninv decimal(18,4) 
	Print 'alm_inventario - caninv - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_com_facdetalle_qtyart')
BEGIN
	ALTER TABLE com_facdetalle DROP CONSTRAINT DF_com_facdetalle_qtyart
END 
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle' AND T.column_name = 'qtyart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table com_facdetalle ALTER COLUMN qtyart decimal(18,4) 
	Print 'com_facdetalle - qtyart - aumento de dicimales'  -- Ing. Lissette 10 feb 2017
end 
Go

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_com_facdetalle_devart')
BEGIN
	ALTER TABLE com_facdetalle DROP CONSTRAINT DF_com_facdetalle_devart
END 
GO


IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle' AND T.column_name = 'devart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table com_facdetalle ALTER COLUMN devart decimal(18,4) 
	Print 'com_facdetalle - devart - aumento de dicimales'  -- Ing. Lissette 10 feb 2017
end 
Go

--para borrar un contrain con nombre por defecto 
DECLARE @strTable VARCHAR(50)
DECLARE @strDefaultName VARCHAR(150)
DECLARE @strCampo VARCHAR(150)
DECLARE @strcadena VARCHAR(150)
 
SET @strTable = 'glb_parametros'
SET @strCampo = 'conserec'
SELECT @strDefaultName=CONST.name
FROM	sys.default_constraints const
       INNER JOIN sys.columns columns ON (const.object_id=columns.default_object_id)
WHERE	const.parent_object_id=object_id(@strTable,'U') AND columns.name=@strCampo

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)=@strDefaultName)  --Ing. Lissette 10 feb 2017
BEGIN
	exec( 'ALTER TABLE Glb_Parametros DROP CONSTRAINT ' + @strDefaultName ) 
	--exec @strCadena 
END 
GO

IF EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'conserec' and t.DATA_TYPE!='nVarchar' )
begin 
	Alter Table Glb_Parametros alter column  conserec nvarchar(3) 
	print 'Glb_Parametros - conserec ' --Ing. Lissette 10 feb 2017
	print 'ok'
--	update Glb_Parametros set conserec = '' 
end 
Go


--para borrar un contrain con nombre por defecto   --Ing. Lissette 15 feb 2017
DECLARE @strTable VARCHAR(50)  
DECLARE @strDefaultName VARCHAR(150)
DECLARE @strCampo VARCHAR(150)
DECLARE @strcadena VARCHAR(150)
 
SET @strTable = 'glb_parametros'
SET @strCampo = 'consevta'
SELECT @strDefaultName=CONST.name
FROM	sys.default_constraints const
       INNER JOIN sys.columns columns ON (const.object_id=columns.default_object_id)
WHERE	const.parent_object_id=object_id(@strTable,'U') AND columns.name=@strCampo

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)=@strDefaultName)  --Ing. Lissette 10 feb 2017
BEGIN
	exec( 'ALTER TABLE Glb_Parametros DROP CONSTRAINT ' + @strDefaultName ) 
	--exec @strCadena 
END 
GO


IF EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Glb_Parametros' AND T.Column_Name = 'consevta' and t.DATA_TYPE!='nVarchar')
begin 	
	Alter Table Glb_Parametros alter column consevta nvarchar(3) 
	print 'Glb_Parametros - consevta ' --Ing. Lissette 10 feb 2017
--	update Glb_Parametros set consevta = ''
end 
Go

IF EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)='DF_ven_facturas_crefac')
BEGIN
	alter table ven_facturas drop constraint DF_ven_facturas_crefac
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'crefac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN crefac decimal(18,4) 
	Print 'ven_facturas - crefac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go


IF EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)='DF_VEN_FACTURAS_DEVCREFAC')
BEGIN
	alter table ven_facturas drop constraint DF_VEN_FACTURAS_DEVCREFAC
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'devcrefac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN devcrefac decimal(18,4) 
	Print 'ven_facturas - devcrefac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

--para borrar un contrain con nombre por defecto   --Ing. Lissette 15 feb 2017
DECLARE @strTable VARCHAR(50)  
DECLARE @strDefaultName VARCHAR(150)
DECLARE @strCampo VARCHAR(150)
DECLARE @strcadena VARCHAR(150)
 
SET @strTable = 'ven_pedidos'
SET @strCampo = 'impofac'
SELECT @strDefaultName=CONST.name
FROM	sys.default_constraints const
       INNER JOIN sys.columns columns ON (const.object_id=columns.default_object_id)
WHERE	const.parent_object_id=object_id(@strTable,'U') AND columns.name=@strCampo

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)=@strDefaultName)  --Ing. Lissette 18 feb 2017
BEGIN
	exec( 'ALTER TABLE ven_pedidos DROP CONSTRAINT ' + @strDefaultName ) 
END 
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'Impofac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN Impofac decimal(18,4) 
	Print 'ven_pedidos - Impofac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

--para borrar un contrain con nombre por defecto   --Ing. Lissette 15 feb 2017
DECLARE @strTable VARCHAR(50)  
DECLARE @strDefaultName VARCHAR(150)
DECLARE @strCampo VARCHAR(150)
DECLARE @strcadena VARCHAR(150)
 
SET @strTable = 'ven_pedidos'
SET @strCampo = 'valadmon'
SELECT @strDefaultName=CONST.name
FROM	sys.default_constraints const
       INNER JOIN sys.columns columns ON (const.object_id=columns.default_object_id)
WHERE	const.parent_object_id=object_id(@strTable,'U') AND columns.name=@strCampo

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)=@strDefaultName)  --Ing. Lissette 18 feb 2017
BEGIN
	exec( 'ALTER TABLE ven_pedidos DROP CONSTRAINT ' + @strDefaultName ) 
END 
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'valadmon' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN valadmon decimal(18,4) 
	Print 'ven_pedidos - valadmon - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

--para borrar un contrain con nombre por defecto   --Ing. Lissette 15 feb 2017
DECLARE @strTable VARCHAR(50)  
DECLARE @strDefaultName VARCHAR(150)
DECLARE @strCampo VARCHAR(150)
DECLARE @strcadena VARCHAR(150)
 
SET @strTable = 'ven_pedidos'
SET @strCampo = 'valimprev'
SELECT @strDefaultName=CONST.name
FROM	sys.default_constraints const
       INNER JOIN sys.columns columns ON (const.object_id=columns.default_object_id)
WHERE	const.parent_object_id=object_id(@strTable,'U') AND columns.name=@strCampo

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)=@strDefaultName)  --Ing. Lissette 18 feb 2017
BEGIN
	exec( 'ALTER TABLE ven_pedidos DROP CONSTRAINT ' + @strDefaultName ) 
END 
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'valimprev' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN valimprev decimal(18,4) 
	Print 'ven_pedidos - valimprev - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

--para borrar un contrain con nombre por defecto   --Ing. Lissette 15 feb 2017
DECLARE @strTable VARCHAR(50)  
DECLARE @strDefaultName VARCHAR(150)
DECLARE @strCampo VARCHAR(150)
DECLARE @strcadena VARCHAR(150)
 
SET @strTable = 'ven_pedidos'
SET @strCampo = 'valutil'
SELECT @strDefaultName=CONST.name
FROM	sys.default_constraints const
       INNER JOIN sys.columns columns ON (const.object_id=columns.default_object_id)
WHERE	const.parent_object_id=object_id(@strTable,'U') AND columns.name=@strCampo

IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)=@strDefaultName)  --Ing. Lissette 18 feb 2017
BEGIN
	exec( 'ALTER TABLE ven_pedidos DROP CONSTRAINT ' + @strDefaultName ) 
END 
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'valutil' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN valutil decimal(18,4) 
	Print 'ven_pedidos - valutil - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go
IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_ven_facdetalle_descrip')
BEGIN
	ALTER TABLE ven_facdetalle DROP CONSTRAINT DF_ven_facdetalle_descrip  -- Ing. Jesus 18 feb 2017
END 
GO
IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_alm_kardex_itemprefac')
BEGIN
	ALTER TABLE alm_kardex DROP CONSTRAINT DF_alm_kardex_itemprefac  -- Ing. Jesus 18 feb 2017
END 
GO
IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF_alm_kardex_itemfac')
BEGIN
	ALTER TABLE alm_kardex DROP CONSTRAINT DF_alm_kardex_itemfac  -- Ing. Jesus 18 feb 2017
END 
GO
IF  EXISTS (SELECT DISTINCT name FROM sys.indexes WHERE name ='Alm_Kardex_documento')
BEGIN
	DROP index Alm_Kardex_documento on alm_kardex -- Ing. Jesus 18 feb 2017
END 
GO