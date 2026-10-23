IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'Idemp') 
begin 
	Alter Table ser_orden Add Idemp nvarchar(3) not null default ''
	Print 'ser_orden - Idemp'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipdoc') 
begin 
	Alter Table ser_orden Add tipdoc nvarchar(2) not null default ''
	Print 'ser_orden - tipdoc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codcto') 
begin 
	Alter Table ser_orden Add codcto nvarchar(3) not null default ''
	Print 'ser_orden - codcto'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_parametros' AND T.column_name = 'pedirtipo') 
begin 
	Alter Table ser_parametros Add pedirtipo bit not null default 0
	Print 'ser_parametros - pedirtipo'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nrodoc') 
begin 
	Alter Table ser_orden Add nrodoc nvarchar(10) not null default ''
	Print 'ser_orden - nrodoc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'sigla') 
begin 
	Alter Table ser_orden Add sigla nvarchar(20) not null default ''
	Print 'ser_orden - sigla'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codusu') 
begin 
	Alter Table ser_orden Add codusu nvarchar(10) not null default ''
	Print 'ser_orden - codusu'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'entrega') 
begin 
	Alter Table ser_orden Add entrega nvarchar(60) not null default ''
	Print 'ser_orden - entrega'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'recibe') 
begin 
	Alter Table ser_orden Add recibe nvarchar(60) not null default ''
	Print 'ser_orden - recibe'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'carano') 
begin 
	Alter Table ser_orden Add carano integer not null default 0
	Print 'ser_orden - carano'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'odomtrant') 
begin 
	Alter Table ser_orden Add odomtrant nvarchar(10) not null default ''
	Print 'ser_orden - odomtrant'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'dependen') 
begin 
	Alter Table ser_orden Add dependen nvarchar(60) not null default ''
	Print 'ser_orden - dependen'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'Idemp') 
begin 
	Alter Table ser_ordendet Add Idemp nvarchar(3) not null default ''
	Print 'ser_ordendet - Idemp'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'codcto') 
begin 
	Alter Table ser_ordendet Add codcto nvarchar(3) not null default ''
	Print 'ser_ordendet - codcto'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'tipdoc') 
begin 
	Alter Table ser_ordendet Add tipdoc nvarchar(2) not null default ''
	Print 'ser_ordendet - tipdoc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'numord') 
begin 
	Alter Table ser_ordendet Add numord nvarchar(10) not null default ''
	Print 'ser_ordendet - tipdoc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'codart') 
begin 
	Alter Table ser_ordendet Add codart nvarchar(10) not null default ''
	Print 'ser_ordendet - codart'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'item') 
begin 
	Alter Table ser_ordendet Add item numeric(10) not null default 0
	Print 'ser_ordendet - item'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'modelo') 
begin 
	Alter Table ser_ordendet Add modelo nvarchar(50) not null default ''
	Print 'ser_ordendet - modelo'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'serie') 
begin 
	Alter Table ser_ordendet Add serie nvarchar(50) not null default ''
	Print 'ser_ordendet - serie'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'coddiagnos') 
begin 
	Alter Table ser_ordendet Add coddiagnos nvarchar(3) not null default ''
	Print 'ser_ordendet - coddiagnos'
end   --
Go
                            
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'codestado') 
begin 
	Alter Table ser_ordendet Add codestado nvarchar(3) not null default ''
	Print 'ser_ordendet - codestado'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'codfalla') 
begin 
	Alter Table ser_ordendet Add codfalla nvarchar(3) not null default ''
	Print 'ser_ordendet - codfalla'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'observa') 
begin 
	Alter Table ser_ordendet Add observa nvarchar(max) not null default ''
	Print 'ser_ordendet - observa'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'marca') 
begin 
	Alter Table ser_ordendet Add marca nvarchar(20) not null default ''
	Print 'ser_ordendet - marca'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'observatec') 
begin 
	Alter Table ser_ordendet Add observatec nvarchar(max) not null default ''
	Print 'ser_ordendet - observatec'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'cambio') 
begin 
	Alter Table ser_ordendet Add cambio nvarchar(max) not null default ''
	Print 'ser_ordendet - cambio'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'fecautoriz') 
begin 
	Alter Table ser_ordendet Add fecautoriz datetime not null default getdate() 
	Print 'ser_ordendet - fecautoriz'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'tipser') 
begin 
	Alter Table ser_ordendet Add tipser nvarchar(3) not null default ''
	Print 'ser_ordendet - tipser'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'qtyart') 
begin 
	Alter Table ser_ordendet Add qtyart decimal(18,4) not null default 0
	Print 'ser_ordendet - qtyart'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'undart') 
begin 
	Alter Table ser_ordendet Add undart nvarchar(3) not null default ''
	Print 'ser_ordendet - undart'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'caninv') 
begin 
	Alter Table ser_ordendet Add caninv decimal(18,4) not null default 0
	Print 'ser_ordendet - caninv'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'ucoart') 
begin 
	Alter Table ser_ordendet Add ucoart decimal(18,4) not null default 0
	Print 'ser_ordendet - ucoart'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'fecha') 
begin 
	Alter Table ser_ordendet Add fecha datetime not null default getdate()
	Print 'ser_ordendet - fecha'
end   --
Go
                           
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'codusu') 
begin 
	Alter Table ser_ordendet Add codusu nvarchar(10) not null default ''
	Print 'ser_ordendet - codusu'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'fecsys') 
begin 
	Alter Table ser_ordendet Add fecsys datetime not null default getdate()
	Print 'ser_ordendet - fecsys'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'descrip') 
begin 
	Alter Table ser_ordendet Add descrip nvarchar(max) not null default ''
	Print 'ser_ordendet - descrip'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'cosart') 
begin 
	Alter Table ser_ordendet Add cosart decimal(18,4) not null default 0
	Print 'ser_ordendet - cosart'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'estado') 
begin 
	Alter Table ser_ordendet Add estado nvarchar(1) not null default ''
	Print 'ser_ordendet - estado'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'qtypen') 
begin 
	Alter Table ser_ordendet Add qtypen decimal(18,4) not null default 0
	Print 'ser_ordendet - qtypen'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_ordendet' AND T.column_name = 'valart') 
begin 
	Alter Table ser_ordendet Add valart decimal(18,4) not null default 0
	Print 'ser_ordendet - valart'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_parametros' AND T.column_name = 'valpresupuesto') 
begin 
	Alter Table ser_parametros Add valpresupuesto bit not null default 0
	Print 'ser_parametros - valpresupuesto'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'Idemp') 
begin 
	Alter Table ser_orden Add Idemp nvarchar(3) not null default ''
	Print 'ser_orden - Idemp'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codcto') 
begin 
	Alter Table ser_orden Add codcto nvarchar(3) not null default ''
	Print 'ser_orden - codcto'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipdoc') 
begin 
	Alter Table ser_orden Add tipdoc nvarchar(2) not null default ''
	Print 'ser_orden - tipdoc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'numord') 
begin 
	Alter Table ser_orden Add numord nvarchar(2) not null default ''
	Print 'ser_orden - numord'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codter') 
begin 
	Alter Table ser_orden Add codter nvarchar(20) not null default ''
	Print 'ser_orden - codter'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codtec') 
begin 
	Alter Table ser_orden Add codtec nvarchar(20) not null default ''
	Print 'ser_orden - codtec'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'observa') 
begin 
	Alter Table ser_orden Add observa nvarchar(max) not null default ''
	Print 'ser_orden - observa'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'usuario') 
begin 
	Alter Table ser_orden Add usuario nvarchar(10) not null default ''
	Print 'ser_orden - usuario'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codestado') 
begin 
	Alter Table ser_orden Add codestado nvarchar(3) not null default ''
	Print 'ser_orden - codestado'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codpro') 
begin 
	Alter Table ser_orden Add codestado nvarchar(20) not null default ''
	Print 'ser_orden - codpro'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'contacto') 
begin 
	Alter Table ser_orden Add contacto nvarchar(60) not null default ''
	Print 'ser_orden - contacto'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'diradc') 
begin 
	Alter Table ser_orden Add diradc nvarchar(60) not null default ''
	Print 'ser_orden - diradc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'imagen') 
begin 
	Alter Table ser_orden Add imagen nvarchar(80) not null default ''
	Print 'ser_orden - imagen'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nrogaran') 
begin 
	Alter Table ser_orden Add nrogaran nvarchar(20) not null default ''
	Print 'ser_orden - nrogaran'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'teladc') 
begin 
	Alter Table ser_orden Add teladc nvarchar(30) not null default ''
	Print 'ser_orden - teladc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'estord') 
begin 
	Alter Table ser_orden Add estord nvarchar(1) not null default ''
	Print 'ser_orden - estord'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'horacomp') 
begin 
	Alter Table ser_orden Add horacomp nvarchar(5) not null default ''
	Print 'ser_orden - horacomp'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'jornada') 
begin 
	Alter Table ser_orden Add jornada nvarchar(4) not null default ''
	Print 'ser_orden - jornada'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nrocomp') 
begin 
	Alter Table ser_orden Add nrocomp nvarchar(10) not null default ''
	Print 'ser_orden - nrocomp'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nrogaran2') 
begin 
	Alter Table ser_orden Add nrogaran2 nvarchar(20) not null default ''
	Print 'ser_orden - nrogaran2'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'lugcomp') 
begin 
	Alter Table ser_orden Add lugcomp nvarchar(60) not null default ''
	Print 'ser_orden - lugcomp'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'vendedor') 
begin 
	Alter Table ser_orden Add vendedor nvarchar(10) not null default ''
	Print 'ser_orden - vendedor'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipfac') 
begin 
	Alter Table ser_orden Add tipfac nvarchar(2) not null default ''
	Print 'ser_orden - tipfac'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'cenfac') 
begin 
	Alter Table ser_orden Add cenfac nvarchar(3) not null default ''
	Print 'ser_orden - cenfac'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'numfac') 
begin 
	Alter Table ser_orden Add numfac nvarchar(8) not null default ''
	Print 'ser_orden - numfac'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'hora') 
begin 
	Alter Table ser_orden Add hora nvarchar(8) not null default ''
	Print 'ser_orden - hora'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nitcli') 
begin 
	Alter Table ser_orden Add nitcli nvarchar(8) not null default ''
	Print 'ser_orden - nitcli'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nitven') 
begin 
	Alter Table ser_orden Add nitven nvarchar(15) not null default ''
	Print 'ser_orden - nitven'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipvehi') 
begin 
	Alter Table ser_orden Add tipvehi nvarchar(15) not null default ''
	Print 'ser_orden - tipvehi'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codmar') 
begin 
	Alter Table ser_orden Add codmar nvarchar(3) not null default ''
	Print 'ser_orden - codmar'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'placa') 
begin 
	Alter Table ser_orden Add placa nvarchar(8) not null default ''
	Print 'ser_orden - placa'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codcolor') 
begin 
	Alter Table ser_orden Add codcolor nvarchar(3) not null default ''
	Print 'ser_orden - codcolor'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'numunit') 
begin 
	Alter Table ser_orden Add numunit nvarchar(13) not null default ''
	Print 'ser_orden - numunit'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'horom') 
begin 
	Alter Table ser_orden Add horom nvarchar(10) not null default ''
	Print 'ser_orden - horom'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'odomtr') 
begin 
	Alter Table ser_orden Add odomtr nvarchar(10) not null default ''
	Print 'ser_orden - odomtr'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'odomtr') 
begin 
	Alter Table ser_orden Add odomtr nvarchar(10) not null default ''
	Print 'ser_orden - odomtr'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'horafin') 
begin 
	Alter Table ser_orden Add horafin nvarchar(8) not null default ''
	Print 'ser_orden - horafin'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codusu') 
begin 
	Alter Table ser_orden Add codusu nvarchar(10) not null default ''
	Print 'ser_orden - codusu'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'estado') 
begin 
	Alter Table ser_orden Add estado nvarchar(1) not null default ''
	Print 'ser_orden - estado'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipcon') 
begin 
	Alter Table ser_orden Add tipcon nvarchar(3) not null default ''
	Print 'ser_orden - tipcon'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'entrega') 
begin 
	Alter Table ser_orden Add entrega nvarchar(60) not null default ''
	Print 'ser_orden - entrega'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'recibe') 
begin 
	Alter Table ser_orden Add recibe nvarchar(60) not null default ''
	Print 'ser_orden - recibe'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'odomtrant') 
begin 
	Alter Table ser_orden Add odomtrant nvarchar(10) not null default ''
	Print 'ser_orden - odomtrant'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'codfal') 
begin 
	Alter Table ser_orden Add codfal nvarchar(3) not null default ''
	Print 'ser_orden - codfal'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nitcierre') 
begin 
	Alter Table ser_orden Add nitcierre nvarchar(15) not null default ''
	Print 'ser_orden - nitcierre'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'notacierre') 
begin 
	Alter Table ser_orden Add notacierre nvarchar(max) not null default ''
	Print 'ser_orden - notacierre'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'otrsoporte') 
begin 
	Alter Table ser_orden Add otrsoporte nvarchar(100) not null default ''
	Print 'ser_orden - otrsoporte'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipsoporte') 
begin 
	Alter Table ser_orden Add tipsoporte nvarchar(2) not null default ''
	Print 'ser_orden - tipsoporte'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'numint') 
begin 
	Alter Table ser_orden Add numint nvarchar(15) not null default ''
	Print 'ser_orden - numint'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'dependen') 
begin 
	Alter Table ser_orden Add dependen nvarchar(60) not null default ''
	Print 'ser_orden - dependen'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'sigla') 
begin 
	Alter Table ser_orden Add sigla nvarchar(20) not null default ''
	Print 'ser_orden - sigla'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nrodoc') 
begin 
	Alter Table ser_orden Add nrodoc nvarchar(10) not null default ''
	Print 'ser_orden - nrodoc'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'nroact') 
begin 
	Alter Table ser_orden Add nroact nvarchar(10) not null default ''
	Print 'ser_orden - nroact'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'estfacrep') 
begin 
	Alter Table ser_orden Add estfacrep nvarchar(1) not null default ''
	Print 'ser_orden - estfacrep'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'estfacser') 
begin 
	Alter Table ser_orden Add estfacser nvarchar(1) not null default ''
	Print 'ser_orden - estfacser'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'ruta') 
begin 
	Alter Table ser_orden Add ruta nvarchar(100) not null default ''
	Print 'ser_orden - ruta'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'netser') 
begin 
	Alter Table ser_orden Add netser decimal(18,4) not null default 0
	Print 'ser_orden - netser'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'abono') 
begin 
	Alter Table ser_orden Add abono decimal(18,4) not null default 0
	Print 'ser_orden - abono'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'vrtotal') 
begin 
	Alter Table ser_orden Add vrtotal decimal(18,4) not null default 0
	Print 'ser_orden - vrtotal'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'fecfin') 
begin 
	Alter Table ser_orden Add fecfin datetime not null default getdate()
	Print 'ser_orden - fecfin'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'feccierre') 
begin 
	Alter Table ser_orden Add feccierre datetime not null default getdate()
	Print 'ser_orden - feccierre'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'fechasys') 
begin 
	Alter Table ser_orden Add fechasys datetime not null default getdate()
	Print 'ser_orden - fechasys'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'feccomp') 
begin 
	Alter Table ser_orden Add feccomp datetime not null default getdate()
	Print 'ser_orden - feccomp'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'feccompra') 
begin 
	Alter Table ser_orden Add feccompra datetime not null default getdate()
	Print 'ser_orden - feccompra'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'fecsys') 
begin 
	Alter Table ser_orden Add fecsys datetime not null default getdate()
	Print 'ser_orden - fecsys'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'fecha') 
begin 
	Alter Table ser_orden Add fecha datetime not null default getdate()
	Print 'ser_orden - fecha'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'liquidada') 
begin 
	Alter Table ser_orden Add liquidada integer not null default 0
	Print 'ser_orden - liquidada'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'lugar') 
begin 
	Alter Table ser_orden Add lugar integer not null default 0
	Print 'ser_orden - lugar'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipo') 
begin 
	Alter Table ser_orden Add tipo integer not null default 0
	Print 'ser_orden - tipo'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipservi') 
begin 
	Alter Table ser_orden Add tipservi integer not null default 0
	Print 'ser_orden - tipservi'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'tipser') 
begin 
	Alter Table ser_orden Add tipser integer not null default 0
	Print 'ser_orden - tipser'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'modelo') 
begin 
	Alter Table ser_orden Add modelo integer not null default 0
	Print 'ser_orden - modelo'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'carano') 
begin 
	Alter Table ser_orden Add carano integer not null default 0
	Print 'ser_orden - carano'
end   --
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ser_orden' AND T.column_name = 'omitido') 
begin 
	Alter Table ser_orden Add omitido bit not null default 0
	Print 'ser_orden - omitido'
end   --
Go

