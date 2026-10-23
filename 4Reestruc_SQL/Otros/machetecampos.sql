IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facpuntos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facpuntos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facpuntos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facpuntos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facpuntos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facpuntos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facpuntos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facpuntos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facpuntos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facpuntos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facpuntos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facpuntos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facpuntos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facpuntos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facpuntos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facpuntos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facpuntos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facpuntos - modificadoc'  
end
Go
