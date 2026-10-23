IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'porseguro75') 
begin 
	Alter Table cop_parametros Add porseguro75  decimal(10,5)  NOT NULL DEFAULT 0
	Print 'cop_parametros - porseguro75'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table cop_conceptos ADD fecsys datetime not null DEFAULT getdate()
	Print 'cop_conceptos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table cop_conceptos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'cop_conceptos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos' AND T.column_name = 'codusumod') 
begin 
	Alter Table cop_conceptos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'cop_conceptos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos' AND T.column_name = 'codusu') 
begin 
	Alter Table cop_conceptos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'cop_conceptos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos' AND T.column_name = 'docdelete') 
begin 
	Alter Table cop_conceptos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'cop_conceptos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table cop_conceptos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'cop_conceptos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table cop_parametros ADD fecsys datetime not null DEFAULT getdate()
	Print 'cop_parametros - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros' AND T.column_name = 'servidor' ) 
begin 
	Alter Table cop_parametros ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'cop_parametros - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros' AND T.column_name = 'codusumod') 
begin 
	Alter Table cop_parametros ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'cop_parametros - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros' AND T.column_name = 'codusu') 
begin 
	Alter Table cop_parametros ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'cop_parametros - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros' AND T.column_name = 'docdelete') 
begin 
	Alter Table cop_parametros  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'cop_parametros  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table cop_parametros Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'cop_parametros - modificadoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'ctaxcgaranreal') 
begin 
	Alter Table cop_parametros Add ctaxcgaranreal  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - ctaxcgaranreal'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'ctaxcgaranper') 
begin 
	Alter Table cop_parametros Add ctaxcgaranper  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - ctaxcgaranper'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'ctaxcsingarantia') 
begin 
	Alter Table cop_parametros Add ctaxcsingarantia  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - ctaxcsingarantia'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'ctaseguro') 
begin 
	Alter Table cop_parametros Add ctaseguro  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - ctaseguro'  ---ing. Lissette 26/07/2017 registro cta seguro 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'ctadesembolso') 
begin 
	Alter Table cop_parametros Add ctadesembolso  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - ctadesembolso'  ---ing. Lissette 26/07/2017 registro cta seguro 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'poraporte') 
begin 
	Alter Table cop_parametros Add poraporte  decimal(10,5)  NOT NULL DEFAULT 0
	Print 'cop_parametros - poraporte'  ---ing. Lissette 26/07/2017 % de aporte 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'salariomin') 
begin 
	Alter Table cop_parametros Add salariomin  decimal(20,4)  NOT NULL DEFAULT 0
	Print 'cop_parametros - salariomin'  ---ing. Lissette 26/07/2017 salario minimo vigente smlv 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos'  AND T.column_name = 'PlazoMax') 
begin 
	Alter Table cop_conceptos Add PlazoMax  numeric(10)  NOT NULL DEFAULT 0
	Print 'cop_conceptos - PlazoMax'  ---ing. Lissette 26/07/2017 plaxo maximo para creditos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntIng') 
begin 
	Alter Table cop_parametros Add CtaIntIng  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntIng'  ---ing. Lissette 30/08/2017 cta liq intereses
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntx2') 
begin 
	Alter Table cop_parametros Add CtaIntx2  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntx2'  ---ing. Lissette 30/08/2017 cta liq intereses
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntx3') 
begin 
	Alter Table cop_parametros Add CtaIntx3  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntx3'  ---ing. Lissette 30/08/2017 cta liq intereses
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_Organo'  AND T.column_name = 'NroActa') 
begin 
	Alter Table Cop_Organo Add NroActa  bit  NOT NULL DEFAULT 0
	Print 'Cop_Organo - NroActa'  ---ing. Lissette 13/09/2017 si pide nro de acta en la aprobacion 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'poraporteJuri') 
begin 
	Alter Table cop_parametros Add poraporteJuri  decimal(10,5)  NOT NULL DEFAULT 0
	Print 'cop_parametros - poraporteJuri'  ---ing. Lissette 29/09/2017 aportes persona juridica 
end
Go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_tipo_mov'  AND T.column_name = 'codcon') 
begin 
	Alter Table cop_tipo_mov Add codcon  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'cop_tipo_mov - codcon'  ---ing. Lissette 29/09/2017 codigo concepto
end
Go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_tipo_mov'  AND T.column_name = 'codcue') 
begin 
	Alter Table cop_tipo_mov Add codcue  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_tipo_mov - codcue'  ---ing. Lissette 29/09/2017 cuenta contable 
end
Go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'ctaintmora') 
begin 
	Alter Table cop_parametros Add ctaintmora  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - ctaintmora '  ---ing. Lissette 01/10/2017 cuenta contable 
end
Go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_movclitemp'  AND T.column_name = 'CodMov') 
begin 
	Alter Table cop_movclitemp Add CodMov  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'cop_movclitemp - CodMov'  --Ing. Lissette 30/09/2017 registo del tipo de documento
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_movclitemp'  AND T.column_name = 'CodCon') 
begin 
	Alter Table cop_movclitemp Add CodCon  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'cop_movclitemp - CodCon'  --Ing. Lissette 30/09/2017 registo codigo del concepto de cooperativas. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_movclitemp'  AND T.column_name = 'VlrMora') 
begin 
	Alter Table cop_movclitemp Add VlrMora  decimal(18,4)  NOT NULL DEFAULT 0
	Print 'cop_movclitemp - VlrMora'  --Ing. Lissette 30/09/2017 registo delos interese de mora
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_tipo_mov'  AND T.column_name = 'Preingre') 
begin 
	Alter Table cop_tipo_mov Add Preingre  bit  NOT NULL DEFAULT 0
	Print 'cop_movclitemp - Preingre'  --Ing. Lissette 06/10/2017 para identificar q tipo es el de pre ingresos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_movclitemp'  AND T.column_name = 'observa') 
begin 
	Alter Table cop_movclitemp Add observa  nvarchar(200)  NOT NULL DEFAULT ''
	Print 'cop_movclitemp - observa'  --Ing. Lissette 07/10/2017 detelle del pre ingresos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntx4') 
begin 
	Alter Table cop_parametros Add CtaIntx4  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntx4'  ---ing. Lissette 08/10/2017 cta liq intereses
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntx5') 
begin 
	Alter Table cop_parametros Add CtaIntx5  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntx5'  ---ing. Lissette 08/10/2017 cta liq intereses
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos'  AND T.column_name = 'Ahorro') 
begin 
	Alter Table cop_conceptos Add Ahorro  bit  NOT NULL DEFAULT 0
	Print 'cop_conceptos - Ahorro'  ---ing. Lissette 13/10/2017 si el concepto se coporta como un ahorro para llenar una tabla de saldos. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_tipo_mov'  AND T.column_name = 'ReServicio') 
begin 
	Alter Table cop_tipo_mov Add ReServicio  bit  NOT NULL DEFAULT 0
	Print 'cop_tipo_mov - ReServicio'  ---ing. Lissette 14/10/2017 para que en servicios solo muestre las opciones que estan marcadas 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_tarifas'  AND T.column_name = 'VlrComision') 
begin 
	Alter Table cop_tarifas Add VlrComision  decimal(18,4)  NOT NULL DEFAULT 0
	Print 'cop_tarifas - VlrComision'  ---ing. Lissette 23/10/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_Conceptos'  AND T.column_name = 'CtaComision') 
begin 
	Alter Table cop_Conceptos Add CtaComision  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_Conceptos - CtaComision'  ---ing. Lissette 23/10/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_Conceptos'  AND T.column_name = 'codtran') 
begin 
	Alter Table cop_Conceptos Add codtran  nvarchar(2)  NOT NULL DEFAULT ''
	Print 'cop_Conceptos - codtran'  ---ing. Lissette 24/10/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_Conceptos'  AND T.column_name = 'codnovedad') 
begin 
	Alter Table cop_Conceptos Add codnovedad  nvarchar(4)  NOT NULL DEFAULT ''
	Print 'cop_Conceptos - codnovedad'  ---ing. Lissette 30/10/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_Conceptos'  AND T.column_name = 'reestruc') 
begin 
	Alter Table cop_Conceptos Add reestruc  bit NOT NULL DEFAULT 0
	Print 'cop_Conceptos - reestruc'  ---ing. Lissette 07/11/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_revaloriza'  AND T.column_name = 'Estado') 
begin 
	Alter Table cop_revaloriza Add Estado  nvarchar(1) NOT NULL DEFAULT ''
	Print 'cop_revaloriza - Estado'  ---ing. Lissette 09/11/2017  &&cambia cuando se retiran.
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_movclitemp'  AND T.column_name = 'descauInt') 
begin 
	Alter Table cop_movclitemp Add descauInt  decimal(18,4) NOT NULL DEFAULT 0
	Print 'cop_movclitemp - descauInt'  ---ing. Lissette 15/11/2017  regisro de descausacion inte. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntIngx3') 
begin 
	Alter Table cop_parametros Add CtaIntIngx3  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntIngx3'  ---ing. Lissette 15/11/2017 cta ingresos
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntIngx4') 
begin 
	Alter Table cop_parametros Add CtaIntIngx4  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntIngx4'  ---ing. Lissette 15/11/2017 cta ingresos
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'CtaIntIngx5') 
begin 
	Alter Table cop_parametros Add CtaIntIngx5  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'cop_parametros - CtaIntIngx5'  ---ing. Lissette 15/11/2017 cta ingresos
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_tarifas'  AND T.column_name = 'PagAnticipado') 
begin 
	Alter Table Cop_tarifas Add PagAnticipado  nvarchar(8)  NOT NULL DEFAULT ''
	Print 'Cop_tarifas - PagAnticipado'  ---ing. Lissette 21/11/2017 cta ingresos
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_tarifas'  AND T.column_name = 'dctonom') 
begin 
	Alter Table Cop_tarifas Add dctonom  bit  NOT NULL DEFAULT 0
	Print 'Cop_tarifas - dctonom'  ---ing. Lissette 19/12/2017 .t. se descuenta por nomina 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_Revaloriza'  AND T.column_name = 'fecha') 
begin 
	Alter Table Cop_Revaloriza Add fecha  date 
	Print 'Cop_Revaloriza - fecha'  ---ing. Lissette 27/12/2017 .t. se descuenta por nomina 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_ControlAnual'  AND T.column_name = 'Estado') 
begin 
	Alter Table Cop_ControlAnual Add Estado  bit not null default 0 
	Print 'Cop_ControlAnual - Estado'  ---ing. Lissette 28/12/2017 .t. ya fue generado 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_Revaloriza'  AND T.column_name = 'CodCue') 
begin 
	Alter Table Cop_Revaloriza Add CodCue  nvarchar(8) not null default '' 
	Print 'Cop_Revaloriza - CodCue'  ---ing. Lissette 28/12/2017 cuenta revalorizacion 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_formatos'  AND T.column_name = 'reporte') 
begin 
	Alter Table Cop_formatos Add reporte  nvarchar(200) not null default '' 
	Print 'Cop_formatos - reporte'  ---ing. Lissette 28/12/2017 cuenta revalorizacion 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'pa') 
begin 
	Alter Table cop_parametros Add pa  decimal(18,4) NOT NULL DEFAULT 0
	Print 'cop_parametros - pa'  ---ing. Lissette 15/11/2017  regisro de descausacion inte. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'pb') 
begin 
	Alter Table cop_parametros Add pb  decimal(18,4) NOT NULL DEFAULT 0
	Print 'cop_parametros - pb'  ---ing. Lissette 15/11/2017  regisro de descausacion inte. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'pc') 
begin 
	Alter Table cop_parametros Add pc  decimal(18,4) NOT NULL DEFAULT 0
	Print 'cop_parametros - pc'  ---ing. Lissette 15/11/2017  regisro de descausacion inte. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'pd') 
begin 
	Alter Table cop_parametros Add pd  decimal(18,4) NOT NULL DEFAULT 0
	Print 'cop_parametros - pd'  ---ing. Lissette 15/11/2017  regisro de descausacion inte. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros'  AND T.column_name = 'pe') 
begin 
	Alter Table cop_parametros Add pe  decimal(18,4) NOT NULL DEFAULT 0
	Print 'cop_parametros - pe'  ---ing. Lissette 15/11/2017  regisro de descausacion inte. 
end
Go

----------------------------------Actualizado en el esquema hasta aqui------------------26/07/2018

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_conceptos'  AND T.column_name = 'NoGenContabInt') 
begin 
	Alter Table cop_conceptos  Add NoGenContabInt  bit NOT NULL DEFAULT 0
	Print 'cop_conceptos  - NoGenContabInt'  ---ing. Lissette 31/07/2018  regisro de descausacion inte. 
end
Go


IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'cop_movclitemp'  AND T.column_name = 'observa' and t.CHARACTER_MAXIMUM_LENGTH!=-1) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='cop_movclitemp' AND tc.name='observa')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='cop_movclitemp' AND tc.name='observa'
		
		SET @sql='ALTER TABLE dbo.cop_movclitemp DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.cop_movclitemp ALTER COLUMN observa NVARCHAR(max)
		SET @sql='ALTER TABLE dbo.cop_movclitemp ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [observa ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE cop_movclitemp ALTER COLUMN observa NVARCHAR(max)
		Print 'cop_movclitemp - observa'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 


---------------Actualizado 01022019  Lissette Castro

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_clasicartera' AND T.column_name = 'Variable') 
begin 
	Alter Table cop_clasicartera ADD Variable NVARCHAR(30)  not null DEFAULT ''
	Print 'cop_clasicartera - Variable '  -- Ing. Lissette 23 Abr 2018
end 
Go


IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_clasicartera' AND T.column_name = 'Detalle') 
begin 
	Alter Table cop_clasicartera ADD Detalle NVARCHAR(200)  not null DEFAULT ''
	Print 'cop_clasicartera - Detalle '  -- Ing. Lissette 23 Abr 2018
end 
Go


----------------Actualizado en init 25/04/2019 Andres Jimenez

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_clasicartera' AND T.column_name = 'nrocaracter') 
begin 
	Alter Table cop_clasicartera ADD nrocaracter numeric(2)  not null DEFAULT 0
	Print 'cop_clasicartera - nrocaracter '  -- Ing. Lissette 05 mayo 2019
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_Tarifas' AND T.column_name = 'fecfac') 
begin 
	Alter Table Cop_Tarifas ADD fecfac date not null DEFAULT getdate()
	Print 'Cop_Tarifas - fecfac '  -- Ing. Lissette 02/08/2019  &&registara la fecha de los documentos
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_Tarifas' AND T.column_name = 'venfac') 
begin 
	Alter Table Cop_Tarifas ADD venfac date not null DEFAULT getdate()
	Print 'Cop_Tarifas - venfac '  -- Ing. Lissette 02/08/2019  &&registara la fecha de vencimiento de los documentos
end 
Go


IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_Detformatos' AND T.column_name = 'firma') 
begin 
	Alter Table cop_Detformatos ADD firma nvarchar(max) not null DEFAULT ''
	Print 'cop_Detformatos - firma '  -- Ing. Lissette 25/10/2019  
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_Detformatos' AND T.column_name = 'firmaimg') 
begin 
	Alter Table cop_Detformatos ADD firmaimg nvarchar(200) not null DEFAULT ''
	Print 'cop_Detformatos - firmaimg '  -- Ing. Lissette 30/10/2019  
end 
Go


IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cop_parametros' AND T.column_name = 'firmadefault') 
begin 
	Alter Table cop_parametros ADD firmadefault nvarchar(200) not null DEFAULT ''
	Print 'cop_Detfcop_parametrosormatos - firmadefault '  
end 
Go
--- 09-10-2023 Agregado por Lissette Castro para arreglar terceros descuadrados
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Cop_conceptos' AND T.column_name = 'PlanExequial')
begin
alter table Cop_conceptos  add PlanExequial bit not null DEFAULT 0
Print 'Cop_conceptos  - PlanExequial'
end
Go