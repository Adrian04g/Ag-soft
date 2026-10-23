
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_cancela' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_cancela ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_cancela - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_cancela' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_cancela ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_cancela - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_cancela' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_cancela ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_cancela - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_cancela' AND T.column_name = 'codusu') 
begin 
	Alter Table com_cancela ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_cancela - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_cancela' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_cancela  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_cancela  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_cancela'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_cancela Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_cancela - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_color' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_color ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_color - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_color' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_color ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_color - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_color' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_color ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_color - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_color' AND T.column_name = 'codusu') 
begin 
	Alter Table com_color ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_color - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_color' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_color  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_color  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_color'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_color Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_color - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_conceptos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_conceptos ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_conceptos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_conceptos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_conceptos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_conceptos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_conceptos' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_conceptos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_conceptos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_conceptos' AND T.column_name = 'codusu') 
begin 
	Alter Table com_conceptos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_conceptos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_conceptos' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_conceptos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_conceptos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_conceptos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_conceptos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_conceptos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_consulta' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_consulta ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_consulta - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_consulta' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_consulta ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_consulta - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_consulta' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_consulta ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_consulta - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_consulta' AND T.column_name = 'codusu') 
begin 
	Alter Table com_consulta ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_consulta - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_consulta' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_consulta  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_consulta  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_consulta'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_consulta Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_consulta - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_declaracion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_declaracion ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_declaracion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_declaracion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_declaracion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_declaracion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_declaracion' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_declaracion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_declaracion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_declaracion' AND T.column_name = 'codusu') 
begin 
	Alter Table com_declaracion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_declaracion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_declaracion' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_declaracion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_declaracion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_declaracion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_declaracion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_declaracion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_despiece' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_despiece ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_despiece - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_despiece' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_despiece ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_despiece - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_despiece' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_despiece ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_despiece - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_despiece' AND T.column_name = 'codusu') 
begin 
	Alter Table com_despiece ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_despiece - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_despiece' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_despiece  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_despiece  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_despiece'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_despiece Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_despiece - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_detrequi' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_detrequi ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_detrequi - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_detrequi' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_detrequi ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_detrequi - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_detrequi' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_detrequi ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_detrequi - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_detrequi' AND T.column_name = 'codusu') 
begin 
	Alter Table com_detrequi ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_detrequi - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_detrequi' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_detrequi  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_detrequi  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_detrequi'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_detrequi Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_detrequi - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_estados' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_estados ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_estados - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_estados' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_estados ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_estados - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_estados' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_estados ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_estados - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_estados' AND T.column_name = 'codusu') 
begin 
	Alter Table com_estados ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_estados - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_estados' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_estados  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_estados  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_estados'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_estados Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_estados - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdescuentos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_facdescuentos ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_facdescuentos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdescuentos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_facdescuentos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_facdescuentos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdescuentos' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_facdescuentos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_facdescuentos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdescuentos' AND T.column_name = 'codusu') 
begin 
	Alter Table com_facdescuentos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_facdescuentos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdescuentos' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_facdescuentos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_facdescuentos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdescuentos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_facdescuentos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_facdescuentos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_facdetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_facdetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_facdetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_facdetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_facdetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_facdetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table com_facdetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_facdetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_facdetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_facdetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_facdetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_facdetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetremi' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_facdetremi ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_facdetremi - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetremi' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_facdetremi ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_facdetremi - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetremi' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_facdetremi ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_facdetremi - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetremi' AND T.column_name = 'codusu') 
begin 
	Alter Table com_facdetremi ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_facdetremi - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetremi' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_facdetremi  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_facdetremi  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdetremi'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_facdetremi Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_facdetremi - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_facturas ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_facturas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_facturas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_facturas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_facturas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_facturas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'codusu') 
begin 
	Alter Table com_facturas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_facturas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_facturas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_facturas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_facturas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_facturas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasdetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_gasdetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_gasdetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasdetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_gasdetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_gasdetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasdetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_gasdetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_gasdetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasdetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table com_gasdetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_gasdetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasdetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_gasdetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_gasdetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_gasdetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_gasdetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasimportacion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_gasimportacion ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_gasimportacion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasimportacion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_gasimportacion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_gasimportacion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasimportacion' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_gasimportacion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_gasimportacion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasimportacion' AND T.column_name = 'codusu') 
begin 
	Alter Table com_gasimportacion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_gasimportacion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasimportacion' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_gasimportacion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_gasimportacion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gasimportacion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_gasimportacion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_gasimportacion - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gastos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_gastos ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_gastos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gastos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_gastos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_gastos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gastos' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_gastos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_gastos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gastos' AND T.column_name = 'codusu') 
begin 
	Alter Table com_gastos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_gastos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gastos' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_gastos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_gastos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_gastos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_gastos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_gastos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_material' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_material ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_material - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_material' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_material ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_material - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_material' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_material ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_material - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_material' AND T.column_name = 'codusu') 
begin 
	Alter Table com_material ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_material - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_material' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_material  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_material  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_material'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_material Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_material - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_medio' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_medio ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_medio - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_medio' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_medio ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_medio - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_medio' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_medio ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_medio - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_medio' AND T.column_name = 'codusu') 
begin 
	Alter Table com_medio ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_medio - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_medio' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_medio  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_medio  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_medio'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_medio Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_medio - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_modelo' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_modelo ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_modelo - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_modelo' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_modelo ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_modelo - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_modelo' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_modelo ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_modelo - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_modelo' AND T.column_name = 'codusu') 
begin 
	Alter Table com_modelo ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_modelo - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_modelo' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_modelo  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_modelo  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_modelo'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_modelo Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_modelo - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_movpro ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_movpro - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_movpro ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_movpro - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_movpro ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_movpro - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro' AND T.column_name = 'codusu') 
begin 
	Alter Table com_movpro ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_movpro - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_movpro  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_movpro  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_movpro Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_movpro - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_notas ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_notas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_notas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_notas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notas' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_notas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_notas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notas' AND T.column_name = 'codusu') 
begin 
	Alter Table com_notas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_notas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notas' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_notas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_notas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_notas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_notas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notastemp' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_notastemp ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_notastemp - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notastemp' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_notastemp ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_notastemp - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notastemp' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_notastemp ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_notastemp - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notastemp' AND T.column_name = 'codusu') 
begin 
	Alter Table com_notastemp ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_notastemp - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notastemp' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_notastemp  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_notastemp  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notastemp'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_notastemp Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_notastemp - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_orddetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_orddetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_orddetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_orddetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_orddetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_orddetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_orddetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_orddetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_orddetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_orddetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table com_orddetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_orddetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_orddetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_orddetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_orddetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_orddetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_orddetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_orddetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_ordenes ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_ordenes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_ordenes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_ordenes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_ordenes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_ordenes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes' AND T.column_name = 'codusu') 
begin 
	Alter Table com_ordenes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_ordenes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_ordenes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_ordenes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_ordenes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_ordenes - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_parametros ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_parametros - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_parametros ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_parametros - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_parametros ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_parametros - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros' AND T.column_name = 'codusu') 
begin 
	Alter Table com_parametros ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_parametros - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_parametros  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_parametros  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_parametros Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_parametros - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_pordes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_pordes ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_pordes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_pordes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_pordes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_pordes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_pordes' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_pordes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_pordes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_pordes' AND T.column_name = 'codusu') 
begin 
	Alter Table com_pordes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_pordes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_pordes' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_pordes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_pordes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_pordes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_pordes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_pordes - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_requi' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_requi ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_requi - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_requi' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_requi ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_requi - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_requi' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_requi ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_requi - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_requi' AND T.column_name = 'codusu') 
begin 
	Alter Table com_requi ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_requi - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_requi' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_requi  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_requi  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_requi'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_requi Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_requi - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipestados' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_tipestados ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_tipestados - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipestados' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_tipestados ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_tipestados - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipestados' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_tipestados ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_tipestados - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipestados' AND T.column_name = 'codusu') 
begin 
	Alter Table com_tipestados ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_tipestados - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipestados' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_tipestados  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_tipestados  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipestados'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_tipestados Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_tipestados - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_tipos ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_tipos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_tipos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_tipos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipos' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_tipos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_tipos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipos' AND T.column_name = 'codusu') 
begin 
	Alter Table com_tipos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_tipos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipos' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_tipos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_tipos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_tipos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_tipos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipotela' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table com_tipotela ADD fecsys datetime not null DEFAULT getdate()
	Print 'com_tipotela - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipotela' AND T.column_name = 'servidor' ) 
begin 
	Alter Table com_tipotela ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'com_tipotela - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipotela' AND T.column_name = 'codusumod') 
begin 
	Alter Table com_tipotela ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'com_tipotela - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipotela' AND T.column_name = 'codusu') 
begin 
	Alter Table com_tipotela ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'com_tipotela - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipotela' AND T.column_name = 'docdelete') 
begin 
	Alter Table com_tipotela  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'com_tipotela  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_tipotela'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table com_tipotela Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_tipotela - modificadoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'notxallcc') 
begin 
	Alter Table com_parametros Add notxallcc  bit NOT NULL DEFAULT 0
	Print 'com_parametros - notxallcc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'pagprovros') 
begin 
	Alter Table com_parametros Add pagprovros  bit  NOT NULL DEFAULT 0
	Print 'com_parametros - pagprovros'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'valpromcto') 
begin 
	Alter Table com_parametros Add valpromcto  bit  NOT NULL DEFAULT 0
	Print 'com_parametros - valpromcto'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'ordernumfa') 
begin 
	Alter Table com_parametros Add ordernumfa  bit  NOT NULL DEFAULT 0
	Print 'com_parametros - ordernumfa'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'noafecost') 
begin 
	Alter Table com_parametros Add noafecost bit  NOT NULL DEFAULT 0
	Print 'com_parametros - noafecost'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'aprueoc') 
begin 
	Alter Table com_parametros Add aprueoc  bit  NOT NULL DEFAULT 0
	Print 'com_parametros - aprueoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'actpredigOtr') 
begin 
	Alter Table com_parametros Add actpredigOtr  bit  NOT NULL DEFAULT 0
	Print 'com_parametros - actpredigOtr'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'aproxivlr') 
begin 
	Alter Table com_parametros Add aproxivlr  bit NOT NULL DEFAULT 0
	Print 'com_parametros - aproxivlr'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'vlraproxi') 
begin 
	Alter Table com_parametros Add vlraproxi  numeric(10)  NOT NULL DEFAULT 0
	Print 'com_parametros - vlraproxi'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'formulautil') 
begin 
	Alter Table com_parametros Add formulautil  nvarchar(200)  NOT NULL DEFAULT ''
	Print 'com_parametros - formulautil'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro'  AND T.column_name = 'docfacmov') 
begin 
	Alter Table com_movpro Add docfacmov  nvarchar(15)  NOT NULL DEFAULT ''
	Print 'com_movpro - docfacmov'  
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro'  AND T.column_name = 'item') 
begin 
	Alter Table com_movpro Add item  numeric(15)  NOT NULL DEFAULT 0
	Print 'com_movpro - item'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordDetalle'  AND T.column_name = 'item') 
begin 
	Alter Table com_ordDetalle Add item  numeric(15)  NOT NULL DEFAULT 0
	Print 'com_ordDetalle - item'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_notas'  AND T.column_name = 'item') 
begin 
	Alter Table com_notas Add item  numeric(15)  NOT NULL DEFAULT 0
	Print 'com_notas - item'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes'  AND T.column_name = 'codusuapro') 
begin 
	Alter Table com_ordenes Add codusuapro  nvarchar(100)  NOT NULL DEFAULT ''
	Print 'com_ordenes - codusuapro'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes'  AND T.column_name = 'fecsysapro') 
begin 
	Alter Table com_ordenes Add fecsysapro  datetime not null DEFAULT getdate()
	Print 'com_ordenes - fecsysapro'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'ActpreciosMayo') 
begin 
	Alter Table com_parametros Add ActpreciosMayo  bit  NOT NULL DEFAULT 0
	Print 'com_parametros - ActpreciosMayo'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros'  AND T.column_name = 'poractprecMayo') 
begin 
	Alter Table com_parametros Add poractprecMayo  decimal(10,4)  NOT NULL DEFAULT 0
	Print 'com_parametros - poractprecMayo'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facdescuentos'  AND T.column_name = 'item') 
begin 
	Alter Table com_facdescuentos Add item  numeric(15)  NOT NULL DEFAULT 0
	Print 'com_facdescuentos - item'  
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'com_facturas' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table com_facturas Add codusuanul nVarChar(100) Not Null Default ''
	Print 'com_facturas - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'com_facturas' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table com_facturas Add fecsysanul DATETIME Not Null Default ''
	Print 'com_facturas - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'com_movpro' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table com_movpro Add codusuanul nVarChar(100) Not Null Default ''
	Print 'com_movpro - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'com_movpro' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table com_movpro Add fecsysanul DATETIME Not Null Default ''
	Print 'com_movpro - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'com_notas' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table com_notas Add codusuanul nVarChar(100) Not Null Default ''
	Print 'com_notas - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'com_notas' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table com_notas Add fecsysanul DATETIME Not Null Default ''
	Print 'com_notass - fecsysanul'
end
GO

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_pordes' AND T.column_name = 'Codcto' ) 
begin 
	Alter Table com_pordes ADD  Codcto nvarchar(3) not null DEFAULT ''
	Print 'com_pordes - Codcto'  -- Ing. Lissette 08 feb 2017
end 
----------------------------------Actualizado en el esquema hasta aqui------------------26/07/2018

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'nitpro' and t.CHARACTER_MAXIMUM_LENGTH !=15) 
begin 
	Alter Table com_facturas alter column  nitpro nvarchar(15) 
	Print 'com_facturas - nitpro'
end
go  

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes' AND T.column_name = 'nitpro' and t.CHARACTER_MAXIMUM_LENGTH !=15) 
begin 
	Alter Table com_ordenes alter column  nitpro nvarchar(15) 
	Print 'com_ordenes - nitpro'
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_movpro' AND T.column_name = 'dctopp') 
begin 
	Alter Table com_movpro add  dctopp decimal(18,4) NOT NULL CONSTRAINT DF_com_movpro_dctpp DEFAULT 0
	Print 'com_movpro - dctopp'
end
go  
--------------Actualizado 01022019  Lissette Castro
--------------Actualizado 25/04/2019  Lissette Castro
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'rutafotodoc') 
begin 
	Alter Table com_facturas add  rutafotodoc nvarchar(200) NOT NULL CONSTRAINT DF_com_facturas_com_facturas DEFAULT ''
	Print 'com_facturas - rutafotodoc'
end
go 

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Com_Ordenes' AND T.column_name = 'EntxComp' ) 
begin 
	Alter Table Com_Ordenes ADD EntxComp NVARCHAR(15) not null DEFAULT ''
	Print 'Com_Ordenes se ha creado el campo -> EntxComp '  -- Ing. Luis DOminguez 2019-07-18
end 
Go 

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Com_parametros' AND T.column_name = 'calcosppubli' ) 
begin 
	Alter Table Com_parametros ADD calcosppubli bit not null DEFAULT 0
	Print 'Com_parametros se ha creado el campo -> calcosppubli '  -- Ing. Lissette 23072019
end 
Go 

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Com_parametros' AND T.column_name = 'AntCxP' ) 
begin 
	Alter Table Com_parametros ADD AntCxP bit not null DEFAULT 0
	Print 'Com_parametros se ha creado el campo -> AntCxP '  -- Ing. Lissette 09-10-2019
end 
Go 

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Com_parametros' AND T.column_name = 'actcodterart' ) 
begin 
	Alter Table Com_parametros ADD actcodterart bit not null DEFAULT 0
	Print 'Com_parametros se ha creado el campo -> actcodterart '  -- Ing. Lissette 09-10-2019
end 
Go 
--- Yaslen Andrade- Campo agregado para colocar leyenda en el informe de los no obligados a facturar
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Com_parametros' AND T.column_name = 'leyenda') 
begin 
	Alter Table Com_parametros ADD leyenda  nvarchar(MAX) not null default ''
	Print 'Com_parametros se ha creado el campo -> leyenda '  
end 
Go 
---- 21-02-2021  Campo agregado por Ing. Jennifer Rodriguez  para permitir cambiar la base de las retenciones en compras
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Com_parametros' AND T.column_name = 'base') 
begin 
	Alter Table Com_parametros ADD base bit not null DEFAULT 0
	Print 'Com_parametros se ha creado el campo -> base '  
end 
Go 

-------- 11-03-2021 Campo agregado por Lissette para desarrollo de Union temporal en ordenes de compras
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_ordenes' AND T.column_name = 'docrequisicion') 
begin 
	Alter Table com_ordenes Add docrequisicion  nvarchar(10) Default '' 
	Print 'com_ordenes - docrequisicion' --Ing. Lissette 01/03/2021
end
Go
--- 29-04-2021 campo expandido a 15 digitos 
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facturas' AND T.column_name = 'docfac' and t.CHARACTER_MAXIMUM_LENGTH !=15) 
begin 
	Alter Table com_facturas alter column  docfac nvarchar(15) not null
	Print 'com_facturas - Expandir docfac'
end
go  

-------- 19-04-2022 Lissette Castro, Desarrollo para los No Obligados a Facturar
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_facturas' AND T.Column_Name = 'cufe')  
begin 
	Alter Table Com_facturas	add cufe NVARCHAR(100) not null default ''
	Print 'Com_facturas - cufe'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_facturas' AND T.Column_Name = 'docelec')  
begin 
	Alter Table Com_facturas	add docelec NVARCHAR(20) not null default ''
	Print 'Com_facturas - docelec'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_facturas' AND T.Column_Name = 'fecelc')  
begin 
	Alter Table Com_facturas	add fecelc NVARCHAR(20) not null default ''
	Print 'Com_facturas - fecelc'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_facturas' AND T.Column_Name = 'mensaje')  
begin 
	Alter Table Com_facturas	add mensaje NVARCHAR(200) not null default ''
	Print 'Com_facturas - mensaje'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_facturas' AND T.Column_Name = 'resultado')  
begin 
	Alter Table Com_facturas	add resultado NVARCHAR(200) not null default ''
	Print 'Com_facturas - resultado'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_facturas' AND T.Column_Name = 'xml')  
begin 
	Alter Table Com_facturas	add xml NVARCHAR(MAX) not null default ''
	Print 'Com_facturas - xml'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_Notas' AND T.Column_Name = 'nitpro')  
begin 
	Alter Table Com_Notas	add nitpro NVARCHAR(25) not null default ''
	Print 'Com_facturas - nitpro'  
end 
Go
----- 13-07-2022 Agregado por Jennifer R. 
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'trannd')  
begin 
	Alter Table Com_parametros	add trannd NCHAR(2) not null default ''
	Print 'Com_parametros - trannd'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'ctaprom')  
begin 
	Alter Table Com_parametros	add ctaprom NCHAR(10) not null default ''
	Print 'Com_parametros - ctaprom'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_ordenes' AND T.Column_Name = 'valico')  
begin 
	Alter Table Com_ordenes	add valico decimal(14,2) not null default 0
	Print 'Com_parametros - valico'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_facturas' AND T.Column_Name = 'valico')  
begin 
	Alter Table Com_facturas	add valico decimal(14,2) not null default 0
	Print 'Com_facturas - valico'  
end 
Go

-----29-08-2023 Agregado por Lissette Castro Desarrollo de Tinajo facturas de compras con cuotas
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_facuopagos' AND T.column_name = 'fecpag') 
begin 
	alter table com_facuopagos add fecpag date null 
	Print 'com_facuopagos - fecpag'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'com_parametros' AND T.column_name = 'cxpxcuotas') 
begin 
	alter table com_parametros add cxpxcuotas bit not null default 0 
	Print 'com_parametros - cxpxcuotas'
end
Go
---- Agregar por Ing Jennifer Rodriguez caso de Tinajo
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UEsp')  
begin 
	Alter Table Com_parametros	add UEsp decimal(10,4) not null default 0
	Print 'Com_parametros - UEsp'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UEsp1')  
begin 
	Alter Table Com_parametros	add UEsp1 decimal(10,4) not null default 0
	Print 'Com_parametros - UEsp1'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UEsp2')  
begin 
	Alter Table Com_parametros	add UEsp2 decimal(10,4) not null default 0
	Print 'Com_parametros - UEsp2'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UEsp3')  
begin 
	Alter Table Com_parametros	add UEsp3 decimal(10,4) not null default 0
	Print 'Com_parametros - UEsp3'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UEsp4')  
begin 
	Alter Table Com_parametros	add UEsp4 decimal(10,4) not null default 0
	Print 'Com_parametros - UEsp4'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UEsp5')  
begin 
	Alter Table Com_parametros	add UEsp5 decimal(10,4) not null default 0
	Print 'Com_parametros - UEsp5'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UPub')  
begin 
	Alter Table Com_parametros	add UPub decimal(10,4) not null default 0
	Print 'Com_parametros - UPub'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'UMay')  
begin 
	Alter Table Com_parametros	add UMay decimal(10,4) not null default 0
	Print 'Com_parametros - UMay'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_Facturas' AND T.Column_Name = 'placa')  
begin 
	Alter Table Com_Facturas	add placa NVARCHAR(10) not null default ''
	Print 'Com_facturas - placa'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_Facturas' AND T.Column_Name = 'orden')  
begin 
	Alter Table Com_Facturas	add orden NVARCHAR(50) not null default ''
	Print 'Com_facturas - orden'  
end 
Go
---- Agregado el 27-11-2023 impuesto saludable e ico en compras
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'icoincluido')  
begin 
	Alter Table Com_parametros	add icoincluido bit not null default 0
	Print 'Com_parametros - icoincluido'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'ibuaincluido')  
begin 
	Alter Table Com_parametros	add ibuaincluido bit not null default 0
	Print 'Com_parametros - ibuaincluido'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'com_facturas' AND T.Column_Name = 'valIbua')  
begin 
	Alter Table com_facturas	add valIbua decimal(18,4) not null default 0
	Print 'com_facturas - valIbua'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'com_facdetalle' AND T.Column_Name = 'valIbua')  
begin 
	Alter Table com_facdetalle	add valIbua decimal(10,2) not null default 0
	Print 'com_facdetalle - valIbua'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'com_facdetalle' AND T.Column_Name = 'poricui')  
begin 
	Alter Table com_facdetalle	add poricui decimal(6,2) not null default 0
	Print 'com_facdetalle - poricui'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'com_facdetalle' AND T.Column_Name = 'baseimpuesto')  
begin 
	Alter Table com_facdetalle	add baseimpuesto decimal(18,2) not null default 0
	Print 'com_facdetalle - baseimpuesto'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Com_parametros' AND T.Column_Name = 'costopre')  
begin 
	Alter Table Com_parametros	add costopre float not null default 0
	Print 'Com_parametros - costopre'  
end 
Go