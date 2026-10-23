IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Pagos' AND T.Column_Name = 'codcto')  -- Agregados por Éduar Álvarez - Marzo 27 de 2015.
begin 
	Alter Table Ven_Pagos	Add codcto nvarchar(3) NOT NULL DEFAULT ''
	Print 'Ven_Pagos - codcto'  
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_PagDetalle' AND T.Column_Name = 'codcto')
begin 
	Alter Table Ven_PagDetalle Add codcto nvarchar(3) NOT NULL DEFAULT ''
	Print 'Ven_PagDetalle - codcto'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Ven_Pedidos' AND T.column_name = 'ImpoFac')
begin 
	Alter Table Ven_Pedidos Add Impofac Numeric(14,2) Not Null Default 0
	Print 'Ven_Pedidos - Impofac'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Facturas' AND T.Column_Name = 'codcto')
begin
	Alter Table Ven_Facturas	Add codcto nvarchar(3) NOT NULL DEFAULT ''
	Print 'Ven_Facturas - codcto'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Movcli' AND T.Column_Name = 'codcto')
begin
	Alter Table Ven_Movcli		Add codcto nvarchar(3) NOT NULL DEFAULT ''
	Print 'Ven_Movcli - codcto'
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Facuopagos' AND T.Column_Name = 'codcto')
begin
	Alter Table Ven_Facuopagos	Add codcto nvarchar(3) NOT NULL DEFAULT ''
	Print 'Ven_Facuopagos - codcto'
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_pDetalle' AND T.Column_Name = 'itemfac')
begin
	Alter Table Ven_pDetalle Add itemfac int NOT NULL DEFAULT 0
	Print 'Ven_pDetalle - itemfac'
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_pDetalle' AND T.Column_Name = 'porimpo')
begin
	Alter Table Ven_pDetalle Add porimpo decimal(6,2) NOT NULL DEFAULT 0
	Print 'Ven_pDetalle - porimpo'
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_pDetalle' AND T.Column_Name = 'valimpo')
begin
	Alter Table Ven_pDetalle Add valimpo decimal(14,2) NOT NULL DEFAULT 0
	Print 'Ven_pDetalle - valimpo'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_pDetalle' AND T.Column_Name = 'rutafoto')
begin
	Alter Table Ven_pDetalle Add rutafoto nvarchar(200) NOT NULL DEFAULT ''
	Print 'Ven_pDetalle - rutafoto'
end
Go

IF NOT EXISTS (Select * From Glb_Idx Where tabla = 'Ven_TipoVeh' AND nomidx='CODTIP')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Ven_TipoVeh','CODTIP','CODTIP',0,'CODTIP,')

IF NOT EXISTS (Select * From Glb_Idx Where tabla = 'Ven_TipoVeh' AND nomidx='NOMTIP')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Ven_TipoVeh','NOMTIP','NOMTIP',0,'NOMTIP,')

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FacDetRemi' AND T.Column_Name = 'Modifica')
begin
	Alter Table Ven_FacDetRemi Add Modifica nVarChar(1) NOT NULL DEFAULT ''
	Print 'Ven_FacDetRemi - Modifica'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Facturas' AND T.Column_Name = 'cendespacho')		-- Éduar Álvarez - Julio 30 de 2015.
begin
	Alter Table Ven_Facturas Add cendespacho nVarChar(3) NOT NULL DEFAULT ''
	Print 'Ven_Facturas - cendespacho'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Parametros' AND T.Column_Name = 'vtasxfecha')
begin
	Alter Table Ven_Parametros Add vtasxfecha Bit NOT NULL DEFAULT 0
	Print 'Ven_Parametros - vtasxfecha'
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Parametros2' AND T.Column_Name = 'facenvio')
begin
	Alter Table Ven_Parametros2 Add facenvio Varchar(22) NOT NULL DEFAULT ''
	Print 'Ven_Parametros2 - facenvio'
end 
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Parametros2' AND T.Column_Name = 'AlerTimbre')
begin
	Alter Table Ven_Parametros2 Add AlerTimbre numeric(10,0) NULL DEFAULT 0
	Print 'Ven_Parametros2 - AlerTimbre'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'codctogru') 
begin
	Alter Table ven_prefacdetalle Add codctogru nvarchar(3) not null default ''
	Print 'ven_prefacdetalle - codctogru'
end 	
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'codctogru') 
begin
	Alter Table ven_facdetalle Add codctogru nvarchar(3) not null default ''
	Print 'ven_facdetalle - codctogru'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre' AND T.column_name = 'codctogru') 
begin
	Alter Table ven_facdepre Add codctogru nvarchar(3) not null default ''
	Print 'ven_facdepre - codctogru'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros2' AND T.column_name = 'CosInvDet') 
begin
	Alter Table ven_Parametros2 Add CosInvDet bit not null default 0
	Print 'ven_Parametros2 - CosInvDet'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros2' AND T.column_name = 'Infpropina') 
begin
	Alter Table ven_Parametros2 Add Infpropina bit not null default 0
	Print 'ven_Parametros2 - Infpropina'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros2' AND T.column_name = 'contrifa') 
begin
	Alter Table ven_Parametros2 Add contrifa numeric(10) not null default 0
	Print 'ven_Parametros2 - contrifa'  -- ing. Lis. 15 Dic 2015
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros2' AND T.column_name = 'limiterifa') 
begin
	Alter Table ven_Parametros2 Add limiterifa numeric(10) not null default 0
	Print 'ven_Parametros2 - limiterifa'  -- ing. Lis. 15 Dic 2015
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Facturas' AND T.column_name = 'NroRadica') 
begin
	Alter Table ven_Facturas Add NroRadica nvarchar(10) not null default ''
	Print 'ven_Facturas - NroRadica'  -- ing. Lis. 15 Dic 2015
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros' AND T.column_name = 'infvtaxgru') 
begin
	Alter Table ven_Parametros Add infvtaxgru bit not null default 0
	Print 'ven_Parametros - infvtaxgru '
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros2' AND T.column_name = 'obsercomanfac') 
begin
	Alter Table ven_Parametros2 Add obsercomanfac bit not null default 0
	Print 'ven_Parametros2 - obsercomanfac '
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'DETRIFA') 
begin
	Alter Table ven_parametros2 Add DETRIFA nvarchar(MAX) not null default ''
	Print 'ven_parametros2 - DETRIFA'  -- ing. Jeffry 26 - 01 - 2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_CotiDetalle' AND T.column_name = 'Titulo') 
begin
	Alter Table ven_cotidetalle Add titulos nvarchar(200) not null default ''
	Print 'ven_cotidetalle - Titulo'  -- ing. Lis 01 Feb 2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_CotiDetalle' AND T.column_name = 'Porimpo') 
begin 
	Alter Table ven_cotidetalle Add Porimpo decimal(6,2) not null default 0
	Print 'ven_cotidetalle - porimpo'  -- ing. Lis 01 Feb 2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_CotiDetalle' AND T.column_name = 'Valimpo') 
begin
	Alter Table ven_cotidetalle Add valimpo decimal(18,4) not null default 0
	Print 'ven_cotidetalle - Valimpo'  -- ing. Lis 01 Feb 2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_CotiDetalle' AND T.column_name = 'Rutafoto') 
begin
	Alter Table ven_cotidetalle Add Rutafoto nvarchar(200) not null default ''
	Print 'ven_cotidetalle - RutaFoto'  -- ing. Lis 01 Feb 2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_CotiDetalle' AND T.column_name = 'ItemFac')
begin  
	Alter Table ven_cotidetalle Add Itemfac int not null default 0
	Print 'ven_cotidetalle - ItemFac'  -- ing. Lis 01 Feb 2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Cotizacion' AND T.column_name = 'ImpoFac') 
begin
	Alter Table Ven_Cotizacion Add ImpoFac decimal(18,4) not null default 0
	Print 'ven_cotizacion - ImpoFac'  -- ing. Lis 10 Feb 2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'titulo') 
begin 
	Alter Table ven_cotidetalle  Add titulo nvarchar(200) not null default ''
	Print 'ven_cotidetalle - titulo'  -- ing. Lis 10 Feb 2016
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_mesas' AND T.column_name = 'MeseroID' and t.DATA_TYPE!='nvarchar') 
begin 
	Alter Table Ven_mesas alter column  MeseroID nvarchar(15) 
	Print 'Ven_mesas - MeseroID'
end
go  

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_mesas' AND T.column_name = 'MeseroID') 
begin 
	Alter Table Ven_mesas add  MeseroID nvarchar(15)
	Print 'Ven_mesas - MeseroID'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'item') 
begin 
	Alter Table ven_mesas Add item numeric(10)  default 0
	Print 'ven_mesas - item'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Prefacdetalle' AND T.column_name = 'pordcto') 
begin 
	Alter Table Ven_Prefacdetalle Add pordcto decimal(14,2) not null default 0
	Print 'Ven_Prefacdetalle - pordcto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Prefacdetalle' AND T.column_name = 'qtydcto') 
begin 
	Alter Table Ven_Prefacdetalle Add qtydcto decimal(14,2) not null default 0
	Print 'Ven_Prefacdetalle - qtydcto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Prefacdetalle' AND T.column_name = 'coddcto') 
begin 
	Alter Table Ven_Prefacdetalle Add coddcto nvarchar(3)  not null default ''
	Print 'Ven_Prefacdetalle - coddcto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_facdePre'  AND T.column_name = 'itemfac') 
begin 
	Alter Table Ven_facdePre Add itemfac decimal(10,0)  not null default 0
	Print 'Ven_facdePre - itemfac' -- item de factura  en el touch ing. Lissette  25/05/2016
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_facdePre'  AND T.column_name = 'itempre') 
begin 
	Alter Table Ven_facdePre Add itempre decimal(10,0)  NOT NULL DEFAULT 0
	Print 'Ven_facdePre - itempre'-- item de prefactura  en el touch ing. Lissette  25/05/2016
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Formapago'  AND T.column_name = 'CrTouch') 
begin 
	Alter Table Ven_Formapago Add CrTouch Bit NOT NULL DEFAULT 0
	Print 'Ven_Formapago - CrTouch'  -- creditos en el touch ing. Lissette  25/05/2016
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'passdctos') 
begin 
	Alter Table Ven_Parametros2 Add passdctos Bit NOT NULL DEFAULT 0
	Print 'Ven_Parametros2 - passdctos'  -- ing. Lissette  02/06/2016  para pedir password para dar descuentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas'  AND T.column_name = 'nrocoti') 
begin 
	Alter Table Ven_Facturas Add nrocoti nVarchar(200) NOT NULL DEFAULT 0
	Print 'Ven_Facturas - nrocoti'  -- ing. Lissette  07/06/2016  para guardar el numero de la cotizacion
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas'  AND T.column_name = 'nrocomp') 
begin 
	Alter Table Ven_Facturas Add nrocomp nVarchar(200) NOT NULL DEFAULT 0
	Print 'Ven_Facturas - nrocomp'  -- ing. Lissette  07/06/2016  para guardar el numero de la orden de compra 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_retdetliquida' AND T.column_name = 'consec' and t.CHARACTER_MAXIMUM_LENGTH!=16) 
begin 
	Alter Table Ven_retdetliquida alter column  consec nvarchar(16) 
	Print 'Ven_retdetliquida - consec'  -- se cambia lo longitud estaba de 15 y es de 16.  21 Julio 2016. Ing Lis  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Pagdetalle'  AND T.column_name = 'Detalleconsigna') 
begin 
	Alter Table Ven_Pagdetalle Add Detalleconsigna  nVarchar(250) NOT NULL DEFAULT 0
	Print 'Ven_Pagdetalle - Detalleconsigna'  -- ing. Lissette  26/07/2016  para guardar detalle de consignacion 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Prefacdetalle'  AND T.column_name = 'DevFac') 
begin 
	Alter Table Ven_Prefacdetalle Add DevFac  decimal(10,2) NOT NULL DEFAULT 0
	Print 'Ven_Prefacdetalle - DevFac'  -- ing. Lissette  26/07/2016  para guardar detalle de consignacion 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'Codusu') 
begin 
	Alter Table Ven_notas Add Codusu  nVarchar(8) NOT NULL DEFAULT ''
	Print 'Ven_notas - Codusu'  -- ing. Lissette  01/08/2016  para guardar usuario que realiza la nota 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'transporte') 
begin 
	Alter Table Ven_notas Add transporte  decimal(14,2) NOT NULL DEFAULT 0
	Print 'Ven_notas - transporte'  -- ing. Daniel  21/03/2023  campo transporte para las devoluciones de facturas 
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'fecsys') 
begin 
	Alter Table Ven_notas Add fecsys  datetime NOT NULL DEFAULT getdate()
	Print 'Ven_notas - fecsys'  -- ing. Lissette  01/08/2016  para guardar usuario que realiza la nota 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'devart' and numeric_scale=0) 
begin 
	Alter Table ven_prefacdetalle alter column  devart decimal(10,2)
	Print 'Alter column ven_prefacdetalle - devart'
end


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre'  AND T.column_name = 'item') 
begin 
	Alter Table ven_facdepre Add item  NUMERIC(10) NOT NULL DEFAULT 0
	Print 'ven_facdepre - item'  -- ing. Lissette  01/08/2016  para guardar usuario que realiza la nota 
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle'  AND T.column_name = 'item') 
begin 
	Alter Table ven_pagdetalle Add item  NUMERIC(10) NOT NULL DEFAULT 0
	Print 'ven_pagdetalle - item'  -- ing. Jesus Pinto  26/08/2016  para evitar duplicados de la llave primaria
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'item') 
begin 
	Alter Table ven_facuota Add item  NUMERIC(10) NOT NULL DEFAULT 0
	Print 'ven_facuota - item'  -- ing. Jesus Pinto  26/08/2016  para evitar duplicados de la llave primaria
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_prefacdetalle'  AND T.column_name = 'fecsys') 
begin 
	Alter Table Ven_prefacdetalle Add fecsys  datetime NOT NULL DEFAULT getdate()
	Print 'Ven_prefacdetalle - fecsys'  -- ing. Lissette  26/08/2016  para registrar la fecha del sistema y determinar la hora en que inicia el servicio y el ultimo consumo
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_movcli'  AND T.column_name = 'item') 
begin 
	Alter Table Ven_movcli Add item  numeric(10)  NOT NULL DEFAULT 0
	Print 'Ven_movcli - item'  -- ing. Jesus  26/08/2016  agregado para evitar duplicados de llaves primaria
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos'  AND T.column_name = 'valadmon') 
begin 
	Alter Table ven_pedidos Add valadmon  numeric(14,2)  NOT NULL DEFAULT 0
	Print 'ven_pedidos - valadmon'  -- ing. Jesus  16/09/2016 campo necesario para pantalla AUI  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos'  AND T.column_name = 'valimprev') 
begin 
	Alter Table ven_pedidos Add valimprev  numeric(14,2)  NOT NULL DEFAULT 0
	Print 'ven_pedidos - valimprev'  -- ing. Jesus  16/09/2016 campo necesario para pantalla AUI  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos'  AND T.column_name = 'valutil') 
begin 
	Alter Table ven_pedidos Add valutil  numeric(14,2)  NOT NULL DEFAULT 0
	Print 'ven_pedidos - valutil'  -- ing. Jesus  16/09/2016 campo necesario para pantalla AUI  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle'  AND T.column_name = 'estped') 
begin 
	Alter Table ven_prefacdetalle Add estped  nvarchar(4)  NOT NULL DEFAULT 'P'
	Print 'ven_prefacdetalle - estped'  -- ing. Jesus  16/09/2016 campo necesario para KTS 
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle'  AND T.column_name = 'horped') 
begin 
	Alter Table ven_prefacdetalle Add horped  datetime default getdate() 
	Print 'ven_prefacdetalle - horped'  -- ing. Jesus  16/09/2016 campo necesario para KTS 
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle'  AND T.column_name = 'horcoc') 
begin 
	Alter Table ven_prefacdetalle Add horcoc  datetime  
	Print 'ven_prefacdetalle - horcoc'  -- ing. Jesus  16/09/2016 campo necesario para KTS 
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle'  AND T.column_name = 'horfin') 
begin 
	Alter Table ven_prefacdetalle Add horfin  datetime  
	Print 'ven_prefacdetalle - horfin'  -- ing. Jesus  16/09/2016 campo necesario para KTS 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facturas Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_facturas - modificadoc'  -- ing. Lissette  14/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facdetalle Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_facdetalle - modificadoc'  -- ing. Lissette  14/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facdepre Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_facdepre - modificadoc'  -- ing. Jesus  10/12/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facturas Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facturas - docdelete'  -- ing. Lissette  14/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facdetalle Add docdelete bit NOT NULL DEFAULT 0
	Print 'ven_facdetalle - docdelete'  -- ing. Lissette  14/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pagos Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_pagos - modificadoc'  -- ing. Lissette  18/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pagos Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pagos - docdelete'  -- ing. Lissette  18/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pagdetalle Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_pagdetalle - modificadoc'  -- ing. Lissette  18/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pagdetalle Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pagdetalle - docdelete'  -- ing. Lissette  18/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_movcli Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_movcli - modificadoc'  -- ing. Lissette  18/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_movcli Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_movcli - docdelete'  -- ing. Lissette  18/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facuota Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_facuota - modificadoc'  -- ing. Lissette  18/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facuota Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facuota - docdelete'  -- ing. Lissette  18/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_prefactura Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_prefactura - modificadoc'  -- ing. Lissette  18/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_prefactura Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_prefactura - docdelete'  -- ing. Lissette  18/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_prefacdetalle Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'ven_prefacdetalle - modificadoc'  -- ing. Lissette  18/10/2016  cuando se registre un documento este se ira incrementado por  centro tipo y numero 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle'  AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_prefacdetalle Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_prefacdetalle - docdelete'  -- ing. Lissette  18/10/2016  cuando se elimine un registro este se marcara en 1 modificacion de documentos 
end
Go

IF	EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='PK_ven_pagos_1')
BEGIN
	ALTER TABLE ven_pagos DROP CONSTRAINT PK_ven_pagos_1
	Print 'ven_pagos - Borrando PK_ven_pagos_1'  -- ing Lissette 14/09/2016 borrando restriccion 
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'dctoEsp') 
begin 
	Alter Table ven_facturas Add dctoEsp  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facturas - dctoEsp'  -- ing. Lissette  28/10/2016  descuento a pie de factura oksport 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2'  AND T.column_name = 'centro') 
begin 
	Alter Table ven_parametros2 Add centro  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'ven_parametros2 - centro'  -- ing. Jesus Pinto  31/10/2016  Unificar consecutivos y resoluciones AMGO
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_parametros2'  AND T.column_name = 'transfe') 
begin 
	Alter Table ven_parametros2 Add transfe nVarchar(2) NOT NULL DEFAULT ''
	Print 'Ven_parametros2 - transfe'  -- ing. Daniel  24/03/2023  campo para facturación electrónica transacción
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_parametros2'  AND T.column_name = 'uvtfe') 
begin 
	Alter Table ven_parametros2 Add uvtfe NUMERIC(14,2) NOT NULL DEFAULT 0
	Print 'Ven_parametros2 - uvtfe'  -- ing. Daniel  24/03/2023  campo para facturación electrónica valor
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'retgta') 
begin 
	Alter Table ven_facturas Add retgta  decimal(9)  NOT NULL DEFAULT 0
	Print 'ven_facturas - retgta'  -- ing. Jesus Pinto  17/11/2016  Retenciones por garantia AMGO
end
Go



IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros'  AND T.column_name = 'baseretgta') 
begin 
	Alter Table ven_parametros Add baseretgta  decimal(20)  NOT NULL DEFAULT 0
	Print 'ven_parametros - baseretgta'  -- ing. Jesus Pinto  17/11/2016  Retenciones por garantia AMGO
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros'  AND T.column_name = 'pretgta') 
begin 
	Alter Table ven_parametros Add pretgta  decimal(20)  NOT NULL DEFAULT 0
	Print 'ven_parametros - pretgta'  -- ing. Jesus Pinto  17/11/2016  Retenciones por garantia AMGO
end
Go

IF EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)='DF_ven_facdetalle_item')
BEGIN
	alter table ven_facdetalle drop constraint DF_ven_facdetalle_item
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'item' and t.DATA_TYPE !='numeric') 
begin
	Alter Table ven_facdetalle ALTER COLUMN item NUMERIC(14) not null 
	Print 'ven_facdetalle - item'
end 
Go

IF EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)='DF_ven_facturas_observa')
BEGIN
	alter table ven_facturas drop constraint DF_ven_facturas_observa
END
GO

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'observa' and t.DATA_TYPE!='nvarchar') 
begin
	Alter Table ven_facturas ALTER COLUMN observa VARCHAR(500) 
	Print 'ven_facturas - observa'
end 
Go


IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'vtafac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN vtafac decimal(18,4) 
	Print 'ven_facturas - vtafac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'ivafac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN ivafac decimal(18,4) 
	Print 'ven_facturas - ivafac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'otrfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN otrfac decimal(18,4) 
	Print 'ven_facturas - otrfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'ajpfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN ajpfac decimal(18,4) 
	Print 'ven_facturas - ajpfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'devfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN devfac decimal(18,4) 
	Print 'ven_facturas - devfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'abofac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN abofac decimal(18,4) 
	Print 'ven_facturas - abofac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'dctfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN dctfac decimal(18,4) 
	Print 'ven_facturas - dctfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'retfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN retfac decimal(18,4) 
	Print 'ven_facturas - retfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'ricfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN ricfac decimal(18,4) 
	Print 'ven_facturas - ricfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'rivfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN rivfac decimal(18,4) 
	Print 'ven_facturas - rivfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'netfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN netfac decimal(18,4) 
	Print 'ven_facturas - netfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'cosfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN cosfac decimal(18,4) 
	Print 'ven_facturas - cosfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'entrega' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN entrega decimal(18,4) 
	Print 'ven_facturas - entrega - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'cambio' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN cambio decimal(18,4) 
	Print 'ven_facturas - cambio - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'valadmon' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN valadmon decimal(18,4) 
	Print 'ven_facturas - valadmon - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'valimprev' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN valimprev decimal(18,4) 
	Print 'ven_facturas - valimprev - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'valutil' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN valutil decimal(18,4) 
	Print 'ven_facturas - valutil - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'valflete' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN valflete decimal(18,4) 
	Print 'ven_facturas - valflete - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'devretfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN devretfac decimal(18,4) 
	Print 'ven_facturas - devretfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'devricfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN devricfac decimal(18,4) 
	Print 'ven_facturas - devricfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'devrivfac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN devrivfac decimal(18,4) 
	Print 'ven_facturas - devrivfac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'impofac' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN impofac decimal(18,4) 
	Print 'ven_facturas - impofac - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go



IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'retgta' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facturas ALTER COLUMN retgta decimal(18,4) 
	Print 'ven_facturas - retgta - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'Qtyart' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN Qtyart decimal(18,4) 
	Print 'ven_facdetalle - Qtyart - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

--
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'devart' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN devart decimal(18,4) 
	Print 'ven_facdetalle - devart - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'cosins' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN cosins decimal(18,4) 
	Print 'ven_facdetalle - cosins - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valdes' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN valdes decimal(18,4) 
	Print 'ven_facdetalle - valdes - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valdev' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN valdev decimal(18,4) 
	Print 'ven_facdetalle - valdev - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valtot' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN valtot decimal(18,4) 
	Print 'ven_facdetalle - valtot - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valiva' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN valiva decimal(18,4) 
	Print 'ven_facdetalle - valiva - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valimpo' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN valimpo decimal(18,4) 
	Print 'ven_facdetalle - valimpo - aumento de dicimales'  -- Ing. Lissette 07 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valimpo' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facdetalle ALTER COLUMN valimpo decimal(18,4) 
	Print 'ven_facdetalle - valimpo - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota' AND T.column_name = 'valcuo' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_facuota ALTER COLUMN valcuo decimal(18,4) 
	Print 'ven_facuota - valcuo - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'debven' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_movcli ALTER COLUMN debven decimal(18,4) 
	Print 'ven_movcli - debven - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'creven' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_movcli ALTER COLUMN creven decimal(18,4) 
	Print 'ven_movcli - creven - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'pagval' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_pagos ALTER COLUMN pagval decimal(18,4) 
	Print 'ven_pagos - pagval - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'netpag' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_pagos ALTER COLUMN netpag decimal(18,4) 
	Print 'ven_pagos - netpag - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'cambio' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_pagos ALTER COLUMN cambio decimal(18,4) 
	Print 'ven_pagos - cambio - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'recibo' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_pagos ALTER COLUMN recibo decimal(18,4) 
	Print 'ven_pagos - recibo - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'valpag' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_pagdetalle ALTER COLUMN valpag decimal(18,4) 
	Print 'ven_pagdetalle - valpag - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'vrrtecom' and T.NUMERIC_PRECISION!=18 ) 
begin
	Alter Table ven_pagdetalle ALTER COLUMN vrrtecom decimal(18,4) 
	Print 'ven_pagdetalle - vrrtecom - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'vrrtefte' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pagdetalle ALTER COLUMN vrrtefte decimal(18,4) 
	Print 'ven_pagdetalle - vrrtefte - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'vrrteica' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pagdetalle ALTER COLUMN vrrteica decimal(18,4) 
	Print 'ven_pagdetalle - vrrteica - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'vrrteiva' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pagdetalle ALTER COLUMN vrrteiva decimal(18,4) 
	Print 'ven_pagdetalle - vrrteiva - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos'  AND T.column_name = 'item') 
begin 
	Alter Table ven_facuopagos Add item  numeric(12)  NOT NULL DEFAULT 0
	Print 'ven_facuopagos - item'  -- ing. Lissette 15/02/2017 
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'valnot' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_notas ALTER COLUMN valnot decimal(18,4) 
	Print 'ven_notas - valnot - aumento de dicimales'  -- Ing. Lissette 17 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'valiva' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_notas ALTER COLUMN valiva decimal(18,4) 
	Print 'ven_notas - valiva - aumento de dicimales'  -- Ing. Lissette 17 feb 2017
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'abonofac'  ) 
begin 
	Alter Table ven_notas add  abonofac decimal(18,4) not null default 0  
	Print 'ven_notas - abonofac '  -- Ing. Lissette 17 feb 2017
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'abonofac'  ) 
begin 
	Alter Table ven_movcli add  abonofac decimal(18,4) not null default 0  
	Print 'ven_movcli - abonofac '  -- Ing. Lissette 17 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_detconcep' AND T.column_name = 'valcon' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table Ven_detconcep ALTER COLUMN valcon decimal(18,4) 
	Print 'Ven_detconcep - valcon - aumento de dicimales'  -- Ing. Lissette 17 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_pagdescuentos' AND T.column_name = 'valdes' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table Ven_pagdescuentos ALTER COLUMN valdes decimal(18,4) 
	Print 'Ven_pagdescuentos - valdes - aumento de dicimales'  -- Ing. Lissette 17 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'Vtafac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN Vtafac decimal(18,4) 
	Print 'ven_pedidos - Vtafac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'Vtafac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN Vtafac decimal(18,4) 
	Print 'ven_cotizacion - Vtafac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'Ivafac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN Ivafac decimal(18,4) 
	Print 'ven_pedidos - Ivafac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'Ivafac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN Ivafac decimal(18,4) 
	Print 'ven_cotizacion - Ivafac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'Otrfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN Otrfac decimal(18,4) 
	Print 'ven_pedidos - Otrfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'Otrfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN Otrfac decimal(18,4) 
	Print 'ven_cotizacion - Otrfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'Antfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN Antfac decimal(18,4) 
	Print 'ven_pedidos - Antfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'Antfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN Antfac decimal(18,4) 
	Print 'ven_cotizacion - Antfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'devfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN devfac decimal(18,4) 
	Print 'ven_pedidos - devfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'devfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN devfac decimal(18,4) 
	Print 'ven_cotizacion - devfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'abofac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN abofac decimal(18,4) 
	Print 'ven_pedidos - abofac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'abofac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN abofac decimal(18,4) 
	Print 'ven_cotizacion - abofac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'dctfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN dctfac decimal(18,4) 
	Print 'ven_pedidos - dctfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'dctfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN dctfac decimal(18,4) 
	Print 'ven_cotizacion - dctfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'retfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN retfac decimal(18,4) 
	Print 'ven_pedidos - retfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'retfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN retfac decimal(18,4) 
	Print 'ven_cotizacion - retfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'ricfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN ricfac decimal(18,4) 
	Print 'ven_pedidos - ricfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'ricfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN ricfac decimal(18,4) 
	Print 'ven_cotizacion - ricfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'rivfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN rivfac decimal(18,4) 
	Print 'ven_pedidos - rivfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'rivfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN rivfac decimal(18,4) 
	Print 'ven_cotizacion - rivfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'netfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN netfac decimal(18,4) 
	Print 'ven_pedidos - netfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'netfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN netfac decimal(18,4) 
	Print 'ven_cotizacion - netfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go


IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'cosfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN cosfac decimal(18,4) 
	Print 'ven_pedidos - cosfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'cosfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN cosfac decimal(18,4) 
	Print 'ven_cotizacion - cosfac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'Impofac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotizacion ALTER COLUMN Impofac decimal(18,4) 
	Print 'ven_cotizacion - Impofac - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'anticipo' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pedidos ALTER COLUMN anticipo decimal(18,4) 
	Print 'ven_pedidos - anticipo - aumento de dicimales'  -- Ing. Lissette 18 feb 2017
end 
Go


IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'QtyArt' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN QtyArt decimal(18,4) 
	Print 'ven_pdetalle - QtyArt - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'QtyArt' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN QtyArt decimal(18,4) 
	Print 'ven_cotidetalle - QtyArt - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'DevArt' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN DevArt decimal(18,4) 
	Print 'ven_pdetalle - DevArt - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'DevArt' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN DevArt decimal(18,4) 
	Print 'ven_cotidetalle - DevArt - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Cosins' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN Cosins decimal(18,4) 
	Print 'ven_pdetalle - Cosins - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Cosins' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN Cosins decimal(18,4) 
	Print 'ven_cotidetalle - Cosins - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'ValArt' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN ValArt decimal(18,4) 
	Print 'ven_pdetalle - ValArt - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'ValArt' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN ValArt decimal(18,4) 
	Print 'ven_cotidetalle - ValArt - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Valdes' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN Valdes decimal(18,4) 
	Print 'ven_pdetalle - Valdes - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Valdes' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN Valdes decimal(18,4) 
	Print 'ven_cotidetalle - Valdes - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Valdev' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN Valdev decimal(18,4) 
	Print 'ven_pdetalle - Valdev - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Valdev' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN Valdev decimal(18,4) 
	Print 'ven_cotidetalle - Valdev - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Valtot' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN Valtot decimal(18,4) 
	Print 'ven_pdetalle - Valtot - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Valtot' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN Valtot decimal(18,4) 
	Print 'ven_cotidetalle - Valtot - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Valiva' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN Valiva decimal(18,4) 
	Print 'ven_pdetalle - Valiva - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Valiva' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN Valiva decimal(18,4) 
	Print 'ven_cotidetalle - Valiva - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'QtyFac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN QtyFac decimal(18,4) 
	Print 'ven_pdetalle - QtyFac - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'QtyFac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN QtyFac decimal(18,4) 
	Print 'ven_cotidetalle - QtyFac - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'valimpo' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_pdetalle ALTER COLUMN valimpo decimal(18,4) 
	Print 'ven_pdetalle - valimpo - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'valimpo' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table ven_cotidetalle ALTER COLUMN valimpo decimal(18,4) 
	Print 'ven_cotidetalle - valimpo - aumento de dicimales'  -- Ing. Lissette 20 feb 2017
end 
Go
--IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'descrip' ) 
--begin 
--	Alter Table ven_facdetalle ALTER COLUMN descrip  VARCHAR(1000) 
--	Print 'ven_facdetalle - descrip' 
--end 
--Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_domiciliotemp' AND T.column_name = 'Itemdoc'  ) 
begin 
	Alter Table ven_domiciliotemp add  Itemdoc numeric(10) not null default 0  
	Print 'ven_domiciliotemp - Itemdoc '  -- Ing. Lissette 08 Mar 2017
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_domiciliotemp' AND T.column_name = 'Docprefac'  ) 
begin 
	Alter Table ven_domiciliotemp add  Docprefac nvarchar(15) not null default ''  
	Print 'ven_domiciliotemp - Docprefac '  -- Ing. Lissette 09 Mar 2017
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'transformula'  ) 
begin 
	Alter Table ven_parametros2 add  transformula nvarchar(2) not null default ''  
	Print 'ven_parametros2 - transformula '  -- Ing. Lissette 27 Abril 2017  guarda la transaccion para descargue de formulas en las facturas administrativas
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_editfactura' AND T.column_name = 'modificadoc'  ) 
begin 
	Alter Table ven_editfactura add  modificadoc numeric(14) not null default 1 
	Print 'ven_editfactura - modificadoc '  -- Ing. Jesus 26 mayo 2017  controlar numero de veces que la factura fue editada
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_bonos' AND T.column_name = 'codcto'  ) 
begin 
	Alter Table ven_bonos add  codcto nvarchar(3) not null default '' 
	Print 'ven_bonos - codcto '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_bonos' AND T.column_name = 'tipfac'  ) 
begin 
	Alter Table ven_bonos add  tipfac nvarchar(2) not null default '' 
	Print 'ven_bonos - tipfac '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_bonos' AND T.column_name = 'numfac'  ) 
begin 
	Alter Table ven_bonos add  numfac nvarchar(8) not null default '' 
	Print 'ven_bonos - numfac '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_bonos' AND T.column_name = 'valbono'  ) 
begin 
	Alter Table ven_bonos add  valbono numeric(18) not null default 0 
	Print 'ven_bonos - valbono '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_bonos' AND T.column_name = 'valredi'  ) 
begin 
	Alter Table ven_bonos add  valredi numeric(18) not null default 0 
	Print 'ven_bonos - valredi '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_bonos' AND T.column_name = 'CodiBono'  ) 
begin 
	Alter Table ven_bonos add  CodiBono nvarchar(12) not null default '' 
	Print 'ven_bonos - CodiBono '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_bonos' AND T.column_name = 'estado'  ) 
begin 
	Alter Table ven_bonos add  estado varchar(1) not null default '' 
	Print 'ven_bonos - estado '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago' AND T.column_name = 'pedircod'  ) 
begin 
	Alter Table ven_formapago add  pedircod bit not null default 0 
	Print 'ven_formapago - pedircod '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago' AND T.column_name = 'rAutoriza'  ) 
begin 
	Alter Table ven_formapago add  rAutoriza bit not null default 0 
	Print 'ven_formapago - rAutoriza '  -- Ing. Lissette 30 mayo 2017  no estaba se adiciono 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_pagdetalle' AND T.column_name = 'codbono'  ) 
begin 
	Alter Table Ven_pagdetalle add  codbono nvarchar(12) not null default '' 
	Print 'Ven_pagdetalle - codbono '  -- Ing. Lissette 30 mayo 2017  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_pagdetalle' AND T.column_name = 'CodCuepag'  ) 
begin 
	Alter Table Ven_pagdetalle add  CodCuepag nvarchar(8) not null default '' 
	Print 'Ven_pagdetalle - CodCuepag '  -- Ing. Lissette 02/05/2016
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_pagos' AND T.column_name = 'saldocli') 
begin 
	Alter Table Ven_pagos add  saldocli decimal(18,4) not null default 0
	Print 'Ven_pagos - saldocli '  -- Ing. Lissette 15/06/2017 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_prefactura' AND T.column_name = 'QtyPer') 
begin 
	Alter Table Ven_prefactura add  QtyPer numeric(10) not null default 0
	Print 'Ven_prefactura - QtyPer '  -- Ing. Lissette 13/07/2017 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Cotizacion' AND T.column_name = 'tipoPres') 
begin 
	Alter Table Ven_Cotizacion add  tipoPres nvarchar(4) not null default ''
	Print 'Ven_Cotizacion - tipoPres '  -- Ing. Lissette 17/07/2017   Para registrar el tipo de prestamo que se esta solicitando - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Cotizacion' AND T.column_name = 'VlrSeguro') 
begin 
	Alter Table Ven_Cotizacion add  VlrSeguro decimal(18,4) not null default 0
	Print 'Ven_Cotizacion - VlrSeguro '  -- Ing. Lissette 17/07/2017   Para registrar el valor del seguro - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Cotizacion' AND T.column_name = 'NroCuotas') 
begin 
	Alter Table Ven_Cotizacion add  NroCuotas numeric(10) not null default 0
	Print 'Ven_Cotizacion - NroCuotas '  -- Ing. Lissette 17/07/2017   Para registrar el numero total de cuotas - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Cotizacion' AND T.column_name = 'Tasa') 
begin 
	Alter Table Ven_Cotizacion add  Tasa decimal(10,6) not null default 0
	Print 'Ven_Cotizacion - Tasa '  -- Ing. Lissette 17/07/2017   Para registrar la tasa del prestamo - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Cotizacion' AND T.column_name = 'FecIniDcto') 
begin 
	Alter Table Ven_Cotizacion add  FecIniDcto date not null default getdate()
	Print 'Ven_Cotizacion - FecIniDcto '  -- Ing. Lissette 17/07/2017   Para registrar la fecha de inicio de descuento - Coolivos 
end 
Go

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_cotizacion ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_cotizacion - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_cotizacion ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_cotizacion - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_cotizacion ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_cotizacion - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_cotizacion ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_cotizacion - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_cotizacion  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_cotizacion  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_cotizacion Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_cotizacion - modificadoc'  
end
Go

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_coticuota' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_coticuota ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_coticuota - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_coticuota' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_coticuota ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_coticuota - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_coticuota' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_coticuota ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_coticuota - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_coticuota' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_coticuota ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_coticuota - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_coticuota' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_coticuota  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_coticuota  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_coticuota'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_coticuota Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_coticuota - modificadoc'  
end
Go

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_codeudor' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_codeudor ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_codeudor - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_codeudor' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_codeudor ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_codeudor - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_codeudor' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_codeudor ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_codeudor - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_codeudor' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_codeudor ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_codeudor - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_codeudor' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_codeudor  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_codeudor  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_codeudor'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_codeudor Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_codeudor - modificadoc'  
end
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas' AND T.column_name = 'tipoPres') 
begin 
	Alter Table Ven_Facturas add  tipoPres nvarchar(4) not null default ''
	Print 'Ven_Facturas - tipoPres '  -- Ing. Lissette 17/07/2017   Para registrar el tipo de prestamo que se esta solicitando - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas' AND T.column_name = 'VlrSeguro') 
begin 
	Alter Table Ven_Facturas add  VlrSeguro decimal(18,4) not null default 0
	Print 'Ven_Facturas - VlrSeguro '  -- Ing. Lissette 17/07/2017   Para registrar el valor del seguro - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas' AND T.column_name = 'NroCuotas') 
begin 
	Alter Table Ven_Facturas add  NroCuotas numeric(10) not null default 0
	Print 'Ven_Facturas - NroCuotas '  -- Ing. Lissette 17/07/2017   Para registrar el numero total de cuotas - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas' AND T.column_name = 'Tasa') 
begin 
	Alter Table Ven_Facturas add  Tasa decimal(10,6) not null default 0
	Print 'Ven_Facturas - Tasa '  -- Ing. Lissette 17/07/2017   Para registrar la tasa del prestamo - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas' AND T.column_name = 'FecIniDcto') 
begin 
	Alter Table Ven_Facturas add  FecIniDcto date not null default getdate()
	Print 'Ven_Cotizacion - FecIniDcto '  -- Ing. Lissette 17/07/2017   Para registrar la fecha de inicio de descuento - Coolivos 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facuota' AND T.column_name = 'saldo') 
begin 
	Alter Table Ven_Facuota add  saldo decimal(18,4) not null default 0
	Print 'Ven_Facuota - saldo'  -- Ing. Lissette 24/07/2017   Para registrar el saldo del credito 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas' AND T.column_name = 'InteresFac') 
begin 
	Alter Table Ven_Facturas add  InteresFac decimal(18,4) not null default 0
	Print 'Ven_Facturas - InteresFac'  -- Ing. Lissette 24/07/2017   Para registrar el saldo del credito 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_cotizacion' AND T.column_name = 'InteresFac') 
begin 
	Alter Table Ven_cotizacion add  InteresFac decimal(18,4) not null default 0
	Print 'Ven_cotizacion - InteresFac'  -- Ing. Lissette 24/07/2017   Para registrar el total de interes 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_cotizacion' AND T.column_name = 'TipoGaran') 
begin 
	Alter Table Ven_cotizacion add  TipoGaran numeric(1) not null default 0
	Print 'Ven_cotizacion - TipoGaran'  -- Ing. Lissette 26/07/2017   tipo de garancita real 1  personal 2 sin 3
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas' AND T.column_name = 'TipoGaran') 
begin 
	Alter Table Ven_Facturas add  TipoGaran numeric(1) not null default 0
	Print 'Ven_Facturas - TipoGaran'  -- Ing. Lissette 26/07/2017   tipo de garancita real 1  personal 2 sin 3
end 
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_dproducto' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_dproducto ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_dproducto - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_dproducto' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_dproducto ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_dproducto - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_dproducto' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_dproducto ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_dproducto - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_dproducto' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_dproducto ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_dproducto - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_dproducto' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_dproducto  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_dproducto  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_dproducto'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_dproducto Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_dproducto - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_editfactura' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_editfactura ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_editfactura - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_editfactura' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_editfactura ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_editfactura - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_editfactura' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_editfactura ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_editfactura - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_editfactura' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_editfactura ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_editfactura - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_editfactura' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_editfactura  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_editfactura  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_editfactura'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_editfactura Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_editfactura - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facbonos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facbonos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facbonos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facbonos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facbonos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facbonos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facbonos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facbonos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facbonos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facbonos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facbonos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facbonos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facbonos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facbonos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facbonos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facbonos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facbonos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facbonos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facdetremi ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facdetremi - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facdetremi ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facdetremi - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facdetremi ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facdetremi - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facdetremi ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facdetremi - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facdetremi  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facdetremi  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facdetremi Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facdetremi - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facdepre ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facdepre - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facdepre ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facdepre - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facdepre ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facdepre - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facdepre ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facdepre - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facdepre  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facdepre  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdepre'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facdepre Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facdepre - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdescuentos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facdescuentos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facdescuentos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdescuentos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facdescuentos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facdescuentos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdescuentos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facdescuentos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facdescuentos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdescuentos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facdescuentos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facdescuentos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdescuentos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facdescuentos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facdescuentos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdescuentos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facdescuentos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facdescuentos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facdetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facdetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facdetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facdetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facdetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facdetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facdetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facdetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facdetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facdetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facdetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facdetalle - modificadoc'  
end
Go
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
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facturas ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facturas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facturas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facturas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facturas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facturas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facturas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facturas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facturas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facturas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facturas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facturas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facuopagos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facuopagos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facuopagos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facuopagos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facuopagos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facuopagos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facuopagos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facuopagos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facuopagos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facuopagos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuopagos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facuopagos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facuopagos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_facuota ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_facuota - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_facuota ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_facuota - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_facuota ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_facuota - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_facuota ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_facuota - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_facuota  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_facuota  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_facuota Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_facuota - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_formapago ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_formapago - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_formapago ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_formapago - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_formapago ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_formapago - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_formapago ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_formapago - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_formapago  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_formapago  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_formapago Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_formapago - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formuladomi' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_formuladomi ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_formuladomi - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formuladomi' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_formuladomi ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_formuladomi - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formuladomi' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_formuladomi ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_formuladomi - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formuladomi' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_formuladomi ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_formuladomi - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formuladomi' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_formuladomi  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_formuladomi  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formuladomi'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_formuladomi Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_formuladomi - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_gruasesor' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_gruasesor ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_gruasesor - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_gruasesor' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_gruasesor ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_gruasesor - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_gruasesor' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_gruasesor ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_gruasesor - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_gruasesor' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_gruasesor ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_gruasesor - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_gruasesor' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_gruasesor  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_gruasesor  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_gruasesor'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_gruasesor Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_gruasesor - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupocli' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_grupocli ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_grupocli - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupocli' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_grupocli ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_grupocli - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupocli' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_grupocli ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_grupocli - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupocli' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_grupocli ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_grupocli - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupocli' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_grupocli  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_grupocli  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupocli'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_grupocli Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_grupocli - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_grupos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_grupos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_grupos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_grupos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_grupos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_grupos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_grupos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_grupos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_grupos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_grupos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_grupos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_grupos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_grupos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_lineas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_lineas ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_lineas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_lineas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_lineas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_lineas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_lineas' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_lineas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_lineas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_lineas' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_lineas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_lineas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_lineas' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_lineas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_lineas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_lineas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_lineas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_lineas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_liquidxven' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_liquidxven ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_liquidxven - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_liquidxven' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_liquidxven ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_liquidxven - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_liquidxven' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_liquidxven ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_liquidxven - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_liquidxven' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_liquidxven ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_liquidxven - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_liquidxven' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_liquidxven  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_liquidxven  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_liquidxven'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_liquidxven Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_liquidxven - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_marcas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_marcas ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_marcas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_marcas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_marcas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_marcas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_marcas' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_marcas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_marcas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_marcas' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_marcas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_marcas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_marcas' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_marcas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_marcas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_marcas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_marcas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_marcas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_mesas ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_mesas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_mesas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_mesas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_mesas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_mesas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_mesas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_mesas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_mesas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_mesas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_mesas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_mesas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_movcli ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_movcli - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_movcli ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_movcli - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_movcli ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_movcli - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_movcli ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_movcli - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_movcli  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_movcli  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_movcli'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_movcli Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_movcli - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_notas ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_notas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_notas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_notas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_notas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_notas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_notas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_notas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_notas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_notas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_notas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_notas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_olegraph' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_olegraph ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_olegraph - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_olegraph' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_olegraph ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_olegraph - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_olegraph' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_olegraph ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_olegraph - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_olegraph' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_olegraph ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_olegraph - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_olegraph' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_olegraph  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_olegraph  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_olegraph'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_olegraph Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_olegraph - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobro' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_ordcobro ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_ordcobro - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobro' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_ordcobro ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_ordcobro - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobro' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_ordcobro ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_ordcobro - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobro' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_ordcobro ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_ordcobro - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobro' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_ordcobro  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_ordcobro  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobro'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_ordcobro Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_ordcobro - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobrodetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_ordcobrodetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_ordcobrodetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobrodetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_ordcobrodetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_ordcobrodetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobrodetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_ordcobrodetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_ordcobrodetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobrodetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_ordcobrodetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_ordcobrodetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobrodetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_ordcobrodetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_ordcobrodetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ordcobrodetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_ordcobrodetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_ordcobrodetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_organigrupo' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_organigrupo ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_organigrupo - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_organigrupo' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_organigrupo ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_organigrupo - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_organigrupo' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_organigrupo ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_organigrupo - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_organigrupo' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_organigrupo ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_organigrupo - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_organigrupo' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_organigrupo  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_organigrupo  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_organigrupo'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_organigrupo Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_organigrupo - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagbonos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pagbonos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pagbonos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagbonos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pagbonos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pagbonos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagbonos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pagbonos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pagbonos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagbonos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pagbonos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pagbonos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagbonos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pagbonos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pagbonos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagbonos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pagbonos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pagbonos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagconceptos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pagconceptos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pagconceptos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagconceptos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pagconceptos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pagconceptos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagconceptos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pagconceptos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pagconceptos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagconceptos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pagconceptos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pagconceptos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagconceptos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pagconceptos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pagconceptos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagconceptos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pagconceptos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pagconceptos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdescuentos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pagdescuentos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pagdescuentos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdescuentos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pagdescuentos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pagdescuentos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdescuentos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pagdescuentos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pagdescuentos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdescuentos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pagdescuentos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pagdescuentos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdescuentos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pagdescuentos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pagdescuentos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdescuentos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pagdescuentos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pagdescuentos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pagdetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pagdetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pagdetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pagdetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pagdetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pagdetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pagdetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pagdetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pagdetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pagdetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pagdetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pagdetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pagos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pagos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pagos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pagos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pagos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pagos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pagos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pagos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pagos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pagos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pagos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pagos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_parametros ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_parametros - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_parametros ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_parametros - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_parametros ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_parametros - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_parametros ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_parametros - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_parametros  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_parametros  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_parametros Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_parametros - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_parametros2 ADD fecsys datetime NOT NULL CONSTRAINT DF_ven_parametros2_fecsys DEFAULT getdate()
	Print 'ven_parametros2 - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_parametros2 ADD servidor VARCHAR(60) NOT NULL CONSTRAINT DF_ven_parametros2_servidor Default ''
	Print 'ven_parametros2 - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_parametros2 ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_parametros2 - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_parametros2 ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_parametros2 - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_parametros2  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_parametros2  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_parametros2 Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_parametros2 - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parcial' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_parcial ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_parcial - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parcial' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_parcial ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_parcial - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parcial' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_parcial ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_parcial - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parcial' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_parcial ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_parcial - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parcial' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_parcial  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_parcial  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parcial'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_parcial Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_parcial - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pdetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pdetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pdetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pdetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pdetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pdetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pdetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pdetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pdetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pdetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pdetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pdetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedicoti' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pedicoti ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pedicoti - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedicoti' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pedicoti ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pedicoti - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedicoti' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pedicoti ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pedicoti - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedicoti' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pedicoti ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pedicoti - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedicoti' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pedicoti  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pedicoti  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedicoti'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pedicoti Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pedicoti - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pedidos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pedidos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pedidos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pedidos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pedidos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pedidos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pedidos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pedidos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pedidos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pedidos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pedidos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pedidos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_placas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_placas ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_placas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_placas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_placas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_placas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_placas' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_placas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_placas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_placas' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_placas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_placas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_placas' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_placas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_placas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_placas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_placas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_placas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pladetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_pladetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_pladetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pladetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_pladetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_pladetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pladetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_pladetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_pladetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pladetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_pladetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_pladetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pladetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_pladetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_pladetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pladetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_pladetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_pladetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_planes ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_planes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_planes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_planes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planes' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_planes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_planes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planes' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_planes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_planes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planes' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_planes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_planes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_planes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_planes - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planilla' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_planilla ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_planilla - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planilla' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_planilla ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_planilla - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planilla' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_planilla ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_planilla - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planilla' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_planilla ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_planilla - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planilla' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_planilla  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_planilla  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planilla'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_planilla Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_planilla - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planomina' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_planomina ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_planomina - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planomina' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_planomina ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_planomina - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planomina' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_planomina ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_planomina - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planomina' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_planomina ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_planomina - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planomina' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_planomina  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_planomina  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_planomina'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_planomina Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_planomina - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precdetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_precdetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_precdetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precdetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_precdetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_precdetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precdetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_precdetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_precdetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precdetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_precdetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_precdetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precdetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_precdetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_precdetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_precdetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_precdetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_precios ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_precios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_precios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_precios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precios' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_precios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_precios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precios' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_precios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_precios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precios' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_precios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_precios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_precios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_precios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_precios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_prefacdetalle ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_prefacdetalle - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_prefacdetalle ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_prefacdetalle - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_prefacdetalle ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_prefacdetalle - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_prefacdetalle ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_prefacdetalle - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_prefacdetalle  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_prefacdetalle  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_prefacdetalle Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_prefacdetalle - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_prefactura ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_prefactura - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_prefactura ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_prefactura - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_prefactura ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_prefactura - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_prefactura ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_prefactura - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_prefactura  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_prefactura  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_prefactura Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_prefactura - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_premios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_premios ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_premios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_premios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_premios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_premios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_premios' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_premios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_premios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_premios' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_premios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_premios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_premios' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_premios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_premios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_premios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_premios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_premios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_puntosredimidos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_puntosredimidos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_puntosredimidos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_puntosredimidos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_puntosredimidos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_puntosredimidos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_puntosredimidos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_puntosredimidos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_puntosredimidos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_puntosredimidos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_puntosredimidos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_puntosredimidos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_puntosredimidos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_puntosredimidos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_puntosredimidos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_puntosredimidos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_puntosredimidos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_puntosredimidos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retdetliquida' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_retdetliquida ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_retdetliquida - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retdetliquida' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_retdetliquida ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_retdetliquida - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retdetliquida' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_retdetliquida ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_retdetliquida - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retdetliquida' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_retdetliquida ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_retdetliquida - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retdetliquida' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_retdetliquida  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_retdetliquida  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retdetliquida'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_retdetliquida Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_retdetliquida - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retliquida' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_retliquida ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_retliquida - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retliquida' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_retliquida ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_retliquida - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retliquida' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_retliquida ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_retliquida - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retliquida' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_retliquida ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_retliquida - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retliquida' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_retliquida  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_retliquida  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retliquida'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_retliquida Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_retliquida - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_saldosf' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_saldosf ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_saldosf - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_saldosf' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_saldosf ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_saldosf - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_saldosf' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_saldosf ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_saldosf - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_saldosf' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_saldosf ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_saldosf - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_saldosf' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_saldosf  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_saldosf  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_saldosf'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_saldosf Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_saldosf - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_segcartera' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_segcartera ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_segcartera - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_segcartera' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_segcartera ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_segcartera - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_segcartera' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_segcartera ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_segcartera - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_segcartera' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_segcartera ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_segcartera - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_segcartera' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_segcartera  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_segcartera  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_segcartera'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_segcartera Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_segcartera - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_temporal' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_temporal ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_temporal - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_temporal' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_temporal ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_temporal - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_temporal' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_temporal ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_temporal - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_temporal' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_temporal ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_temporal - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_temporal' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_temporal  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_temporal  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_temporal'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_temporal Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_temporal - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_tipoveh' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_tipoveh ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_tipoveh - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_tipoveh' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_tipoveh ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_tipoveh - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_tipoveh' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_tipoveh ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_tipoveh - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_tipoveh' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_tipoveh ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_tipoveh - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_tipoveh' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_tipoveh  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_tipoveh  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_tipoveh'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_tipoveh Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_tipoveh - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_totalpuntos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_totalpuntos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_totalpuntos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_totalpuntos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_totalpuntos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_totalpuntos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_totalpuntos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_totalpuntos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_totalpuntos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_totalpuntos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_totalpuntos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_totalpuntos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_totalpuntos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_totalpuntos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_totalpuntos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_totalpuntos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_totalpuntos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_totalpuntos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_turnos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_turnos ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_turnos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_turnos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_turnos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_turnos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_turnos' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_turnos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_turnos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_turnos' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_turnos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_turnos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_turnos' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_turnos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_turnos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_turnos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_turnos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_turnos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_variantes ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_variantes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_variantes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_variantes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_variantes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_variantes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_variantes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_variantes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_variantes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_variantes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_variantes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_variantes - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_vehiculo' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table ven_vehiculo ADD fecsys datetime not null DEFAULT getdate()
	Print 'ven_vehiculo - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_vehiculo' AND T.column_name = 'servidor' ) 
begin 
	Alter Table ven_vehiculo ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'ven_vehiculo - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_vehiculo' AND T.column_name = 'codusumod') 
begin 
	Alter Table ven_vehiculo ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'ven_vehiculo - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_vehiculo' AND T.column_name = 'codusu') 
begin 
	Alter Table ven_vehiculo ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'ven_vehiculo - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_vehiculo' AND T.column_name = 'docdelete') 
begin 
	Alter Table ven_vehiculo  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'ven_vehiculo  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_vehiculo'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table ven_vehiculo Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_vehiculo - modificadoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes'  AND T.column_name = 'itemprefac') 
begin 
	Alter Table ven_variantes Add itemprefac  numeric(10)  NOT NULL DEFAULT 0
	Print 'ven_variantes - itemprefac'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Notas'  AND T.column_name = 'item') 
begin 
	Alter Table Ven_Notas Add item  numeric(10)  NOT NULL DEFAULT 0
	Print 'Ven_Notas - item'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'abocapital') 
begin 
	Alter Table ven_facuota Add abocapital  decimal(18,4)  NOT NULL DEFAULT 0
	Print 'ven_facuota - abocapital'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'aboInteres') 
begin 
	Alter Table ven_facuota Add aboInteres  decimal(18,4)  NOT NULL DEFAULT 0
	Print 'ven_facuota - aboInteres'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'nroacta') 
begin 
	Alter Table ven_facturas Add nroacta  nvarchar(20)  NOT NULL DEFAULT ''
	Print 'ven_facturas - nroacta'  --- ing lis 26/08/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'organo') 
begin 
	Alter Table ven_facturas Add organo  nvarchar(50)  NOT NULL DEFAULT ''
	Print 'ven_facturas - organo'  --- ing lis 26/08/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'fecapro') 
begin 
	Alter Table ven_facturas Add fecapro  date  NOT NULL default ''
	Print 'ven_facturas - fecapro'  --- ing lis 26/08/2017
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'Interes') 
begin 
	Alter Table ven_facuota Add Interes  decimal(18,4)  NOT NULL DEFAULT 0
	Print 'ven_facuota - Interes'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'aporte') 
begin 
	Alter Table ven_facuota Add aporte  decimal(18,4)  NOT NULL DEFAULT 0
	Print 'ven_facuota - aporte'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2'  AND T.column_name = 'numapro') 
begin 
	Alter Table ven_parametros2 Add numapro  bit  NOT NULL DEFAULT 0
	Print 'ven_parametros2 - numapro'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_detconcep'  AND T.column_name = 'codbarra') 
begin 
	Alter Table Ven_detconcep Add codbarra  nvarchar(100)  NOT NULL DEFAULT ''
	Print 'Ven_detconcep - codbarra'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_detconcep'  AND T.column_name = 'NroFac') 
begin 
	Alter Table Ven_detconcep Add NroFac  nvarchar(20)  NOT NULL DEFAULT ''
	Print 'Ven_detconcep - NroFac'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_detconcep'  AND T.column_name = 'NroPoliza') 
begin 
	Alter Table Ven_detconcep Add NroPoliza  nvarchar(20)  NOT NULL DEFAULT ''
	Print 'Ven_detconcep - NroPoliza'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'ListPPublico') 
begin 
	Alter Table Ven_Parametros2 Add ListPPublico  bit  NOT NULL DEFAULT 0
	Print 'Ven_Parametros2 - ListPPublico'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facdetalle'  AND T.column_name = 'ListPrecio') 
begin 
	Alter Table Ven_Facdetalle Add ListPrecio  numeric(1)  NOT NULL DEFAULT 0
	Print 'Ven_Facdetalle - ListPrecio'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Pagos'  AND T.column_name = 'codcaja') 
begin 
	Alter Table Ven_Pagos Add codcaja  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'Ven_Pagos - codcaja'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Pagos'  AND T.column_name = 'codservicio') 
begin 
	Alter Table Ven_Pagos Add codservicio  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'Ven_Pagos - codservicio'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Pagos'  AND T.column_name = 'codsector') 
begin 
	Alter Table Ven_Pagos Add codsector  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'Ven_Pagos - codsector'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Pagos'  AND T.column_name = 'CodMov') 
begin 
	Alter Table Ven_Pagos Add CodMov  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'Ven_Pagos - CodMov'  --Ing. Lissette 30/09/2017 registo del tipo de documento
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_MovCli'  AND T.column_name = 'VlrMora') 
begin 
	Alter Table Ven_MovCli Add VlrMora  decimal(18,4)  NOT NULL DEFAULT 0
	Print 'Ven_MovCli - VlrMora'  --Ing. Lissette 30/09/2017 registo delos interese de mora
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'infofacanultouc') 
begin 
	Alter Table Ven_Parametros2 Add infofacanultouc  bit  NOT NULL DEFAULT 0
	Print 'Ven_Parametros2 - infofacanultouc'  --Ing. Lissette 03/10/2017 1 muestra listado de facturas anulada 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'ImpMesasOcupada') 
begin 
	Alter Table Ven_Parametros2 Add ImpMesasOcupada  bit  NOT NULL DEFAULT 0
	Print 'Ven_Parametros2 - ImpMesasOcupada'  --Ing. Lissette 04/10/2017 1 imprime un listado de mesas ocuapadas y no las muestra en excel al cerrar el turno 
end
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_detconcep'  AND T.column_name = 'codser') 
begin 
	Alter Table Ven_detconcep Add codser  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'Ven_detconcep - codser'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'Nitcli') 
begin 
	Alter Table Ven_notas Add Nitcli  nvarchar(15)  NOT NULL DEFAULT ''
	Print 'Ven_notas - Nitcli'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'horacierre') 
begin 
	Alter Table Ven_Parametros2 Add horacierre  bit  NOT NULL DEFAULT 0
	Print 'Ven_Parametros2 - horacierre'  --Ing. Jesus 13/10/2017 Valida si debe imprimier la hora en las tirillas de cierra modulo administrativo.
end
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'PorConsumo') 
begin 
	Alter Table Ven_Parametros2 Add PorConsumo  decimal(5,2)  NOT NULL DEFAULT 0
	Print 'Ven_Parametros2 - PorConsumo'  --Ing. Lis 18/10/2017 guardar el % de impuesto al consumo 
end
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pagos'  AND T.column_name = 'turno') 
begin 
	Alter Table ven_pagos Add turno  numeric(14)  NOT NULL DEFAULT 0
	Print 'ven_pagos - turno'  --Ing. Lis 21/10/2017 
end
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_retliquida'  AND T.column_name = 'codcto') 
begin 
	Alter Table ven_retliquida Add codcto  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'ven_retliquida - codcto'  --Ing. Lis 24/10/2017 
end
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_detconcep'  AND T.column_name = 'fecsys') 
begin 
	Alter Table ven_detconcep Add fecsys  datetime  NOT NULL DEFAULT getdate()
	Print 'ven_detconcep - fecsys'  --Ing. Lis 27/10/2017 
end
go 

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'Placa' and t.CHARACTER_MAXIMUM_LENGTH=6 ) 
begin 
	Alter Table ven_facturas alter column  placa nvarchar(10) 
	Print 'ven_facturas - placa'  --Ing. Lis 31/10/2017 
end
go 

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_formapago'  AND T.column_name = 'otrformpag') 
begin 
	Alter Table ven_formapago add otrformpag bit not null default 0
	Print 'ven_formapago - otrformpag'  --Ing. Lis 02/11/2017 
end
go 

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facuota'  AND T.column_name = 'devcapital') 
begin 
	Alter Table ven_facuota add devcapital decimal(18,4) not null default 0
	Print 'ven_facuota - devcapital'  --Ing. Lis 08/11/2017 
end
go 

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas'  AND T.column_name = 'dctonomina') 
begin 
	Alter Table ven_facturas add dctonomina bit not null default 0
	Print 'ven_facturas - dctonomina'  --Ing. Lis 1/11/2017 
end
go 

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_MovCli'  AND T.column_name = 'Descausa') 
begin 
	Alter Table Ven_MovCli add Descausa bit not null default 0
	Print 'Ven_MovCli - Descausa'  --Ing. Lis 15/11/2017 
end
go 

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_prefacdetalle'  AND T.column_name = 'impreComanda') 
begin 
	Alter Table Ven_prefacdetalle add impreComanda nvarchar(100) not null default ''
	Print 'Ven_prefacdetalle - impreComanda'  --Ing. Lis 29/11/2017 Registro de la impresora que escogen al momento de comandar. 
end
go 

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'ven_cotidetalle'  AND T.column_name = 'descrip' and t.character_maximum_length!=-1) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_cotidetalle' AND tc.name='descrip')
	BEGIN
		SELECT @Constraint=sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_cotidetalle' AND tc.name='descrip'
		
		SET @sql='ALTER TABLE dbo.ven_cotidetalle DROP CONSTRAINT '+@Constraint	
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.ven_cotidetalle ALTER COLUMN descrip NVARCHAR(MAX)
		SET @sql='ALTER TABLE dbo.ven_cotidetalle ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [descrip ]'
		EXEC SP_EXECUTESQL @sql
		PRINT 'ven_cotidetalle - descrip'  --Ing. Crhistian 07/12/2017 cambiar longitud quitando y colocando el constraint. 
	END
	ELSE
	BEGIN
		ALTER TABLE dbo.ven_cotidetalle ALTER COLUMN descrip NVARCHAR(MAX)
		PRINT 'ven_cotidetalle - descrip'  --Ing. Crhistian 07/12/2017 cambiar longitud quitando y colocando el constraint. 
	END
	
	

END

GO

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'InfVtaxTranxGru') 
begin 
	Alter Table Ven_Parametros2 add InfVtaxTranxGru bit not null default 0
	Print 'Ven_Parametros2 - InfVtaxTranxGru'  --Ing. Lis 14/12/2017 Agregar este informe en el cierre 
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas'  AND T.column_name = 'FecReestruc') 
begin 
	Alter Table Ven_Facturas add FecReestruc date 
	Print 'Ven_Facturas - FecReestruc'  --Ing. Lis 264/12/2017 registro de la fecha de reestruccturacion 
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Facturas'  AND T.column_name = 'FecReestruc') 
begin 
	Alter Table Ven_Facturas add FecReestruc date  
	Print 'Ven_Facturas - FecReestruc'  --Ing. Lis 26/12/2017 registro de la fecha de reestruccturacion 
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'CodConCoop') 
begin 
	Alter Table Ven_notas add CodConCoop nvarchar(3) not null default ''
	Print 'Ven_notas - CodConCoop'  --Ing. Lis 27/12/2017 registro del concepto 
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'LisPrecios') 
begin 
	Alter Table Ven_Parametros2 add LisPrecios bit not null default 0
	Print 'Ven_Parametros2 - LisPrecios'  --Ing. Lis 05/01/2018 
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Parametros2'  AND T.column_name = 'cajon') 
begin 
	Alter Table Ven_Parametros2 add cajon bit not null default 0
	Print 'Ven_Parametros2 - cajon'  --Ing. Lis 05/01/2018 
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Notas'  AND T.column_name = 'DctoApoResca') 
begin 
	Alter Table Ven_Notas add DctoApoResca bit not null default 0
	Print 'Ven_Notas - DctoApoResca'  --Ing. Lis 05/01/2018 
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Notas'  AND T.column_name = 'NitCliApoResca') 
begin 
	Alter Table Ven_Notas add NitCliApoResca nvarchar(15) not null default ''
	Print 'Ven_Notas - NitCliApoResca'  --Ing. Lis 17/01/2018  para guardar el nit si descuentan el aporte de otro tercero.
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion'  AND T.column_name = 'plazo') 
begin 
	Alter Table ven_cotizacion add plazo numeric(14) not null default 0
	Print 'ven_cotizacion - plazo'  --Ing. Lis 17/01/2018  para guardar el nit si descuentan el aporte de otro tercero.
end
go  

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas'  AND T.column_name = 'Vlrmora') 
begin 
	Alter Table ven_notas add vlrmora decimal(18,4) not null default 0
	Print 'ven_notas - vlrmora'  --Ing. Lis 19/01/2018  para guardar el valor de int mora 
end
go  

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'Ven_parametros2'  AND T.column_name = 'passdctos' and t.data_type!='nvarchar' ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='Ven_parametros2' AND tc.name='passdctos')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='Ven_parametros2' AND tc.name='passdctos'
		
		SET @sql='ALTER TABLE dbo.Ven_parametros2 DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.Ven_parametros2 ALTER COLUMN passdctos NVARCHAR(max)
		SET @sql='ALTER TABLE dbo.Ven_parametros2 ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [passdctos ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE Ven_parametros2 ALTER COLUMN passdctos NVARCHAR(max)
		Print 'Ven_parametros2 - passdctos'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle'  AND T.column_name = 'observaCancel') 
begin 
	Alter Table ven_pdetalle Add observaCancel  text default ''
	Print 'ven_pdetalle - observaCancel'  
end
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle'  AND T.column_name = 'observaCancel') 
begin 
	Alter Table ven_cotidetalle Add observaCancel  text default ''
	Print 'ven_cotidetalle - observaCancel'  
end
GO
IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'ven_facturas'  AND T.column_name = 'observa' and t.data_type!='nvarchar' ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facturas' AND tc.name='observa')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facturas' AND tc.name='observa'
		
		SET @sql='ALTER TABLE dbo.ven_facturas DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.ven_facturas ALTER COLUMN observa NVARCHAR(max)
		SET @sql='ALTER TABLE dbo.ven_facturas ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [observa ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE ven_facturas ALTER COLUMN observa NVARCHAR(max)
		Print 'ven_facturas - observa'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 
IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'ven_facturas'  AND T.column_name = 'observa' and t.data_type!='nvarchar' ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facturas' AND tc.name='observa')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facturas' AND tc.name='observa'
		
		SET @sql='ALTER TABLE dbo.ven_facturas DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.ven_facturas ALTER COLUMN observa NVARCHAR(max)
		SET @sql='ALTER TABLE dbo.ven_facturas ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [observa ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE ven_facturas ALTER COLUMN observa NVARCHAR(max)
		Print 'ven_facturas - observa'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 
IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'ven_facdetalle'  AND T.column_name = 'descrip' and t.data_type!='nvarchar' ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facdetalle' AND tc.name='descrip')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facdetalle' AND tc.name='descrip'
		
		SET @sql='ALTER TABLE dbo.ven_facdetalle DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.ven_facdetalle ALTER COLUMN descrip NVARCHAR(max)
		SET @sql='ALTER TABLE dbo.ven_facdetalle ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [descrip ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE ven_facdetalle ALTER COLUMN descrip NVARCHAR(max)
		Print 'ven_facdetalle - descrip'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 
	
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2'  AND T.column_name = 'codtranCambMesa') 
begin 
	Alter Table ven_parametros2 Add codtranCambMesa  nvarchar(2) not null default ''
	Print 'ven_parametros2 - codtranCambMesa'  
end
GO
	

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'ven_notas'  AND T.column_name = 'modificadoc'  ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF not EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_notas' AND tc.name='modificadoc')
	BEGIN
		alter table ven_notas ADD DEFAULT 0 FOR modificadoc
		Print 'ven_notas - modificadoc'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END 
END 
GO 
IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'ven_facturas'  AND T.column_name = 'orden' and t.CHARACTER_MAXIMUM_LENGTH!=20) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facturas' AND tc.name='orden')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='ven_facturas' AND tc.name='orden'
		
		SET @sql='ALTER TABLE dbo.ven_facturas DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.ven_facturas ALTER COLUMN orden NVARCHAR(20)
		SET @sql='ALTER TABLE dbo.ven_facturas ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [orden ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE ven_facturas ALTER COLUMN orden NVARCHAR(20)
		Print 'ven_facturas - orden'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2'  AND T.column_name = 'FecsysEG') 
begin 
	Alter Table ven_parametros2 Add FecsysEG  bit not null default 0
	Print 'ven_parametros2 - FecsysEG'  --ing. lissette 14/02/2018  para validar fecsys con lo de los egresos. 
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2'  AND T.column_name = 'segbascula') 
begin 
	Alter Table ven_parametros2 Add segbascula  numeric(3) not null default 0
	Print 'ven_parametros2 - segbascula'  --ing. lissette 16/02/2018  Tiempo de espera de bascula para leer peso. 
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2'  AND T.column_name = 'actcoti') 
begin 
	Alter Table ven_parametros2 Add actcoti  bit not null default 0
	Print 'ven_parametros2 - actcoti'  --ing. lissette 03/04/2018  para activar cotizaciones al anular una factura
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_movcli' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table ven_movcli Add codusuanul nVarChar(100) Not Null Default ''
	Print 'ven_movcli - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_movcli' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table ven_movcli Add fecsysanul DATETIME Not Null Default ''
	Print 'ven_movcli - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_facturas' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table ven_facturas Add codusuanul nVarChar(100) Not Null Default ''
	Print 'ven_facturas - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_facturas' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table ven_facturas Add fecsysanul DATETIME Not Null Default ''
	Print 'ven_facturas - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_notas' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table ven_notas Add codusuanul nVarChar(100) Not Null Default ''
	Print 'ven_notas - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_notas' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table ven_notas Add fecsysanul DATETIME Not Null Default ''
	Print 'ven_notas - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_pedidos' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table ven_pedidos Add codusuanul nVarChar(100) Not Null Default ''
	Print 'ven_pedidos - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_pedidos' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table ven_pedidos Add fecsysanul DATETIME Not Null Default ''
	Print 'ven_pedidos - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_cotizacion' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table ven_cotizacion Add codusuanul nVarChar(100) Not Null Default ''
	Print 'ven_cotizacion - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_cotizacion' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table ven_cotizacion Add fecsysanul DATETIME Not Null Default ''
	Print 'ven_cotizacion - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_prefactura' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table ven_prefactura Add codusuanul nVarChar(100) Not Null Default ''
	Print 'ven_prefactura - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_prefactura' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table ven_prefactura Add fecsysanul DATETIME Not Null Default ''
	Print 'ven_prefactura - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_pagos' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table ven_pagos Add codusuanul nVarChar(100) Not Null Default ''
	Print 'ven_pagos - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_pagos' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table ven_pagos Add fecsysanul DATETIME Not Null Default ''
	Print 'ven_pagos - fecsysanul'
end

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'impcovlr')	
begin 	
	Alter Table ven_parametros2 Add impcovlr bit Not Null Default 0
	Print 'ven_parametros2 - impcovlr'
end
GO

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_cotizacion' AND T.column_name = 'contrato')	
begin 	
	Alter Table ven_cotizacion Add contrato NVARCHAR(100) Not Null Default ''
	Print 'ven_cotizacion - contrato'
end
GO
-- Start Luis Morillo 29052018
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'limiterifa')	
begin 	
	Alter Table ven_parametros2 Add limiterifa NUMERIC(10) Not Null Default 0
	Print 'ven_parametros2 - limiterifa'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'rcantcoti')	
begin 	
	Alter Table ven_parametros2 Add rcantcoti BIT Not Null Default 0
	Print 'ven_parametros2 - rcantcoti'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'faccotisal0')	
begin 	
	Alter Table ven_parametros2 Add faccotisal0 BIT Not Null Default 0
	Print 'ven_parametros2 - faccotisal0'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'ivasDet')	
begin 	
	Alter Table ven_parametros2 Add ivasDet BIT Not Null Default 0
	Print 'ven_parametros2 - ivasDet'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'libcotafac')	
begin 	
	Alter Table ven_parametros2 Add libcotafac BIT Not Null Default 0
	Print 'ven_parametros2 - libcotafac'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'movinvcero')	
begin 	
	Alter Table ven_parametros2 Add movinvcero BIT Not Null Default 0
	Print 'ven_parametros2 - movinvcero'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'noncfc')	
begin 	
	Alter Table ven_parametros2 Add noncfc BIT Not Null Default 0
	Print 'ven_parametros2 - noncfc'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'impprefac')	
begin 	
	Alter Table ven_parametros2 Add impprefac BIT Not Null Default 0
	Print 'ven_parametros2 - impprefac'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'variascoti')	
begin 	
	Alter Table ven_parametros2 Add variascoti BIT Not Null Default 0
	Print 'ven_parametros2 - variascoti'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'roundcant')	
begin 	
	Alter Table ven_parametros2 Add roundcant BIT Not Null Default 0
	Print 'ven_parametros2 - roundcant'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'lisprecios')	
begin 	
	Alter Table ven_parametros2 Add lisprecios BIT Not Null Default 0
	Print 'ven_parametros2 - lisprecios'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'sumsf')	
begin 	
	Alter Table ven_parametros2 Add sumsf BIT Not Null Default 0
	Print 'ven_parametros2 - sumsf'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros2' AND T.column_name = 'cajon')	
begin 	
	Alter Table ven_parametros2 Add cajon BIT Not Null Default 0
	Print 'ven_parametros2 - cajon'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'placa')	
begin 	
	Alter Table ser_orden Add placa nvarchar(100) Not Null Default ''
	Print 'ser_orden - placa'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'nitcli')	
begin 	
	Alter Table ser_orden Add nitcli nvarchar(100) Not Null Default ''
	Print 'ser_orden - nitcli'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'codmar')	
begin 	
	Alter Table ser_orden Add codmar nvarchar(3) Not Null Default ''
	Print 'ser_orden - codmar'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'nitven')	
begin 	
	Alter Table ser_orden Add nitven nvarchar(100) Not Null Default ''
	Print 'ser_orden - nitven'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'tipvehi')	
begin 	
	Alter Table ser_orden Add tipvehi nvarchar(50) Not Null Default ''
	Print 'ser_orden - tipvehi'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'codcolor')	
begin 	
	Alter Table ser_orden Add codcolor nvarchar(3) Not Null Default ''
	Print 'ser_orden - codcolor'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'modelo')	
begin 	
	Alter Table ser_orden Add modelo nvarchar(10) Not Null Default ''
	Print 'ser_orden - modelo'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'numint')	
begin 	
	Alter Table ser_orden Add numint nvarchar(10) Not Null Default ''
	Print 'ser_orden - numint'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'horom')	
begin 	
	Alter Table ser_orden Add horom nvarchar(10) Not Null Default ''
	Print 'ser_orden - horom'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'odomtr')	
begin 	
	Alter Table ser_orden Add odomtr nvarchar(10) Not Null Default ''
	Print 'ser_orden - odomtr'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'fecfin')	
begin 	
	Alter Table ser_orden Add fecfin date 
	Print 'ser_orden - fecfin'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'horafin')	
begin 	
	Alter Table ser_orden Add horafin nvarchar(10) Not Null Default ''
	Print 'ser_orden - horafin'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'hora')	
begin 	
	Alter Table ser_orden Add hora nvarchar(10) Not Null Default ''
	Print 'ser_orden - hora'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'estado')	
begin 	
	Alter Table ser_orden Add estado nvarchar(1) Not Null Default ''
	Print 'ser_orden - estado'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ser_orden' AND T.column_name = 'omitido')	
begin 	
	Alter Table ser_orden Add omitido BIT Not Null Default 0
	Print 'ser_orden - omitido'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_pedidos' AND T.column_name = 'nitcliant')	
begin 	
	Alter Table ven_pedidos Add nitcliant nvarchar(20) Not Null Default ''
	Print 'ven_pedidos - nitcliant'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros' AND T.column_name = 'pvtouch')	
begin 	
	Alter Table ven_parametros Add pvtouch nvarchar(6) Not Null Default ''
	Print 'ven_parametros - pvtouch'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros' AND T.column_name = 'infsalSP')	
begin 	
	Alter Table ven_parametros Add infsalSP BIT Not Null Default 0
	Print 'ven_parametros - infsalSP'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros' AND T.column_name = 'Textodomi')	
begin 	
	Alter Table ven_parametros Add Textodomi nvarchar(max) Not Null Default ''
	Print 'ven_parametros - Textodomi'
end
GO

IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'ven_parametros' AND T.column_name = 'Diasvencidos')	
begin 	
	Alter Table ven_parametros Add Diasvencidos BIT Not Null Default 0
	Print 'ven_parametros - Diasvencidos'
end
GO
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Pagos' AND T.Column_Name = 'detalle')  -- Agregados por
begin 
	Alter Table Ven_Pagos	alter column detalle nvarchar(200) NOT NULL 
	Print 'Ven_Pagos - detalle'  
end 
Go
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_cotizacion' AND T.Column_Name = 'tipo')  -- Agregados por
begin 
	Alter Table ven_cotizacion	alter column tipo nvarchar(10) NOT NULL 
	Print 'ven_cotizacion - tipo'
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_Segcartera' AND T.Column_Name = 'item')  
begin 
	Alter Table Ven_Segcartera	add item numeric(10) not null default 0  
	Print 'Ven_Segcartera - tipo'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facdetalle' AND T.Column_Name = 'valred')  
begin 
	Alter Table ven_facdetalle	add valred decimal(14,4) not null default 0  
	Print 'ven_facdetalle - valred'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_notas' AND T.Column_Name = 'PtosAcumulados')  
begin 
	Alter Table ven_notas	add PtosAcumulados numeric not null default 0  
	Print 'ven_notas - PtosAcumulados'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_formapago' AND T.Column_Name = 'codpagelec')  
begin 
	Alter Table ven_formapago	add codpagelec nvarchar(10) not null default ''
	Print 'ven_formapago - codpagelec'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'estelec')  
begin 
	Alter Table ven_facturas	add estelec numeric(10) not null default 0
	Print 'ven_facturas - estelec'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'docelec')  
begin 
	Alter Table ven_facturas	add docelec NVARCHAR(20) not null default ''
	Print 'ven_facturas - docelec'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'cufe')  
begin 
	Alter Table ven_facturas	add cufe NVARCHAR(100) not null default ''
	Print 'ven_facturas - cufe'  
end 
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'cufe' and t.character_maximum_length<100  )  
begin 
	Alter Table ven_facturas	alter column  cufe NVARCHAR(100) 
	Print 'ven_facturas - cufe modificacion '  
end 
Go



IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'fecelc')  
begin 
	Alter Table ven_facturas	add fecelc NVARCHAR(20) not null default ''
	Print 'ven_facturas - fecelc'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'mensaje')  
begin 
	Alter Table ven_facturas	add mensaje NVARCHAR(200) not null default ''
	Print 'ven_facturas - mensaje'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'resultado')  
begin 
	Alter Table ven_facturas	add resultado NVARCHAR(200) not null default ''
	Print 'ven_facturas - resultado'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'xml')  
begin 
	Alter Table ven_facturas	add xml NVARCHAR(MAX) not null default ''
	Print 'ven_facturas - xml'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'estado')  
begin 
	Alter Table Ven_FEFactura	add estado NVARCHAR(1) not null default ''
	Print 'Ven_FEFactura - estado'  --Ing. Lis 05/07/2048
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'estelec')  
begin 
	Alter Table Ven_FEFactura	add estelec INT not null default 0
	Print 'Ven_FEFactura - estelec'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'docelec')  
begin 
	Alter Table Ven_FEFactura	add docelec NVARCHAR(20) not null default ''
	Print 'Ven_FEFactura - docelec'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'cufe')  
begin 
	Alter Table Ven_FEFactura	add cufe NVARCHAR(100) not null default ''
	Print 'Ven_FEFactura - cufe'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'fecelc')  
begin 
	Alter Table Ven_FEFactura	add fecelc NVARCHAR(20) not null default ''
	Print 'Ven_FEFactura - fecelc'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'mensaje')  
begin 
	Alter Table Ven_FEFactura	add mensaje NVARCHAR(200) not null default ''
	Print 'Ven_FEFactura - mensaje'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'resultado')  
begin 
	Alter Table Ven_FEFactura	add resultado NVARCHAR(200) not null default ''
	Print 'Ven_FEFactura - resultado'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'xml')  
begin 
	Alter Table Ven_FEFactura	add xml NVARCHAR(MAX) not null default ''
	Print 'Ven_FEFactura - xml'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'facelec')  
begin 
	Alter Table ven_parametros2	add facelec BIT not null default 0
	Print 'ven_parametros2 - facelec'  
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'retnot') 
begin 
	Alter Table Ven_notas Add retnot  decimal(18,4) NOT NULL DEFAULT 0
	Print 'Ven_notas - retnot'  -- ing. Lissette  13/07/2018  para guardar retenciones
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'ricnot') 
begin 
	Alter Table Ven_notas Add ricnot  decimal(18,4) NOT NULL DEFAULT 0
	Print 'Ven_notas - ricnot'  -- ing. Lissette  13/07/2018  para guardar retenciones
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'rivnot') 
begin 
	Alter Table Ven_notas Add rivnot  decimal(18,4) NOT NULL DEFAULT 0
	Print 'Ven_notas - rivnot'  -- ing. Lissette  13/07/2018  para guardar retenciones
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'retecre') 
begin 
	Alter Table Ven_notas Add retecre  decimal(18,4) NOT NULL DEFAULT 0
	Print 'Ven_notas - retecre'  -- ing. Lissette  13/07/2018  para guardar retenciones
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_notas'  AND T.column_name = 'iconot') 
begin 
	Alter Table Ven_notas Add iconot  decimal(18,4) NOT NULL DEFAULT 0
	Print 'Ven_notas - iconot'  -- ing. Lissette  13/07/2018  para guardar retenciones
end
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'prefijo')  
begin 
	Alter Table Ven_FEFactura	add prefijo NVARCHAR(10) not null default ''
	Print 'Ven_FEFactura - prefijo'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'manpunto')  
begin 
	Alter Table ven_parametros2	add manpunto bit not null default 0
	Print 'ven_parametros2 - manpunto'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'valutil')  
begin 
	Alter Table ven_parametros2	add valutil bit not null default 0
	Print 'ven_parametros2 - valutil'  
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'rangoutil')  
begin 
	Alter Table ven_parametros2	add rangoutil numeric(14) not null default 0
	Print 'ven_parametros2 - rangoutil'  
end 
Go
----------------------------------Actualizado en el esquema hasta aqui------------------27/07/2018

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'saldocjacierre')  
begin 
	Alter Table ven_parametros2	add saldocjacierre bit not null default 0
	Print 'ven_parametros2 - saldocjacierre'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'OrderCliVen')  
begin 
	Alter Table ven_parametros2	add OrderCliVen bit not null default 0
	Print 'ven_parametros2 - OrderCliVen'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_pedidos' AND T.Column_Name = 'plazo')  
begin 
	Alter Table ven_pedidos	add plazo numeric(14) not null default 0
	Print 'ven_pedidos - plazo'  
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_feCliente' AND T.Column_Name = 'pais' and t.CHARACTER_MAXIMUM_LENGTH!=3)  
begin 
	Alter Table ven_feCliente alter column pais nvarchar(3) not null 
	Print 'ven_feCliente - pais'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'filtroubictoma')  
begin 
	Alter Table ven_parametros2	add filtroubictoma bit not null default 0
	Print 'ven_parametros2 - filtroubictoma'  --PriscyReales
end 
Go

IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ven_clasiven' and COLUMN_NAME='servidor' )
BEGIN
	ALTER TABLE  ven_clasiven ADD  servidor VARCHAR(60) NOT NULL CONSTRAINT DF_ven_clasiven_servidor Default ''
	Print 'ven_clasiven - servidor'
END
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_clasiven'  AND T.column_name = 'fecsys') 
BEGIN 
	ALTER TABLE ven_clasiven ADD fecsys  datetime NOT NULL CONSTRAINT DF_ven_clasiven_fecsys DEFAULT getdate()
	Print 'ven_clasiven - fecsys'  --PriscyReales
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('ven_clasiven')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'nombre'
							AND object_id = OBJECT_ID('ven_clasiven'))				
		)
	BEGIN
		ALTER TABLE ven_clasiven ADD CONSTRAINT DF_ven_clasiven_nombre DEFAULT '' FOR nombre
END
GO

--ALTER TABLE ven_clasiven ALTER COLUMN codigo nvarchar(2) NOT NULL
ALTER TABLE ven_clasiven ALTER COLUMN nombre nvarchar(40) NOT NULL
GO


IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('ven_parametros2')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'passdctos'
							AND object_id = OBJECT_ID('ven_parametros2'))				
		)
	BEGIN
		ALTER TABLE ven_parametros2 ADD CONSTRAINT DF_ven_parametros2_passdctos DEFAULT '' FOR passdctos
END
GO

ALTER TABLE ven_parametros2 ALTER COLUMN passdctos NVARCHAR(MAX) NOT NULL
GO

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Ven_FEFactura' AND T.Column_Name = 'Rangoini')  
begin 
	Alter Table Ven_FEFactura	add Rangoini NVARCHAR(10) not null default ''
	Print 'Ven_FEFactura - Rangoini'  
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdescuentos' AND T.column_name = 'idemp' and IS_NULLABLE = 'YES' ) 
begin 
	Alter Table ven_facdescuentos alter column idemp nvarchar(3) not null
	Print 'ven_facdescuentos - idemp'
end
GO

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_notas' AND T.Column_Name = 'codconcepdevol')  
begin 
	Alter Table ven_notas	add codconcepdevol NVARCHAR(3) not null default ''
	Print 'ven_notas - codconcepdevol'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'obligaConDevol')  
begin 
	Alter Table ven_parametros2	add obligaConDevol bit NOT NULL CONSTRAINT DF_Ven_Parametros2_ObligaConDevol DEFAULT 0
	Print 'ven_parametros2 - obligaConDevol'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'EditCosArt')  
begin 
	Alter Table ven_parametros2	add EditCosArt bit NOT NULL CONSTRAINT DF_Ven_Parametros2_EditCosArt DEFAULT 0
	Print 'ven_parametros2 - EditCosArt'    --Ing. Lissette  24-10-2018
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'EditCosMovInv')  
begin 
	Alter Table ven_parametros2	add EditCosMovInv bit NOT NULL CONSTRAINT DF_Ven_Parametros2_EditCosMovInv DEFAULT 0
	Print 'ven_parametros2 - EditCosMovInv'    --Ing. Lissette  24-10-2018
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_pedidos' AND T.Column_Name = 'codcon' and t.character_maximum_length!=4)  
begin 
	Alter Table ven_pedidos	alter column codcon nvarchar(4)
	Print 'ven_pedidos - codcon'    --Ing. Lissette  02-11-2018
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros' AND T.Column_Name = 'proprefac' )  
begin 
	Alter Table ven_parametros	add proprefac bit NOT NULL CONSTRAINT DF_Ven_Parametros2_proprefac DEFAULT 0
	Print 'ven_parametros - proprefac'    --Ing. Lissette  06-11-2018
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_notas' AND T.Column_Name = 'motivodev')  
begin 
	Alter Table ven_notas	add motivodev NVARCHAR(4) not null CONSTRAINT DF_ven_notas_motivodev DEFAULT ''
	Print 'ven_notas - motivodev'  
end 
Go


IF EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'saldocli' and t.NUMERIC_PRECISION!=18)  
begin 
	Alter Table ven_facturas alter column saldocli decimal(18,4)
	Print 'ven_facturas - saldocli'    --Ing. Lissette  19-11-2018 -- se amplico campo 
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_pagos' AND T.Column_Name = 'descrip')  
begin 
	Alter Table ven_pagos	add descrip NVARCHAR(max) not null CONSTRAINT DF_ven_pagos_descrip DEFAULT ''
	Print 'ven_pagos - descrip'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_notas' AND T.Column_Name = 'descrip')  
begin 
	Alter Table ven_notas	add descrip NVARCHAR(max) not null CONSTRAINT DF_ven_notas_descrip DEFAULT ''
	Print 'ven_notas - descrip'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'fecsys_edit')  
begin 
	Alter Table ven_facturas add fecsys_edit datetime 
	Print 'ven_facturas - fecsys_edit'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facturas' AND T.Column_Name = 'codusu_edit')  
begin 
	Alter Table ven_facturas add codusu_edit nvarchar(10) not null CONSTRAINT DF_ven_facturas_codusu_edit DEFAULT ''
	Print 'ven_facturas - codusu_edit'  
end 
Go


IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'valaju' and DATA_TYPE <> 'decimal') 
begin 	
	Alter table ven_prefacdetalle drop DF_ven_prefacdetalle_valaju
	Alter Table ven_prefacdetalle alter column valaju decimal not null
	ALTER TABLE ven_prefacdetalle ADD CONSTRAINT DF_ven_prefacdetalle_valaju DEFAULT 0 FOR valaju
	Print 'ven_prefacdetalle - valaju' -- ing PriscyReales 27/12/2018
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'valaju') 
begin 
	Alter Table ven_prefacdetalle Add valaju decimal not null CONSTRAINT DF_ven_prefacdetalle_valaju default 0
	Print 'ven_prefacdetalle - valaju'
end 
Go


IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'cosaju' and DATA_TYPE <> 'decimal') 
begin 
	Alter table ven_pedidos drop DF_ven_pedidos_cosaju	
	Alter Table ven_pedidos alter column cosaju decimal not null
	ALTER TABLE ven_pedidos ADD CONSTRAINT DF_ven_pedidos_cosaju DEFAULT 0 FOR cosaju
	Print 'ven_pedidos - cosaju' -- ing PriscyReales 27/12/2018
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'cosaju') 
begin 
	Alter Table ven_pedidos Add cosaju decimal not null CONSTRAINT DF_ven_pedidos_cosaju default 0
	Print 'ven_pedidos - cosaju'
end 
Go


IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'valaju' and DATA_TYPE <> 'decimal') 
begin 
	Alter table ven_pdetalle drop DF_ven_pdetalle_valaju
	Alter Table ven_pdetalle alter column valaju decimal not null
	ALTER TABLE ven_pdetalle ADD CONSTRAINT DF_ven_pdetalle_valaju DEFAULT 0 FOR valaju
	Print ' ven_pdetalle - valaju' -- ing PriscyReales 27/12/2018
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'valaju') 
begin 
	Alter Table ven_pdetalle Add valaju decimal not null CONSTRAINT DF_ven_pdetalle_valaju default 0
	Print 'ven_pdetalle - valaju'
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valaju' and DATA_TYPE <> 'decimal') 
begin 
	Alter table ven_facdetalle drop DF_ven_facdetalle_valaju
	Alter Table ven_facdetalle alter column valaju decimal not null
	ALTER TABLE ven_facdetalle ADD CONSTRAINT DF_ven_facdetalle_valaju DEFAULT 0 FOR valaju
	Print 'ven_facdetalle - valaju' -- ing PriscyReales 27/12/2018
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'valaju') 
begin 
	Alter Table ven_facdetalle Add valaju decimal not null CONSTRAINT DF_ven_facdetalle_valaju default 0
	Print 'ven_facdetalle - valaju'
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'cosaju' and DATA_TYPE <> 'decimal') 
begin 
	Alter table ven_cotizacion drop DF_ven_cotizacion_cosaju
	Alter Table ven_cotizacion alter column cosaju decimal not null
	ALTER TABLE ven_cotizacion ADD CONSTRAINT DF_ven_cotizacion_cosaju DEFAULT 0 FOR cosaju
	Print 'ven_cotizacion - cosaju' -- ing PriscyReales 27/12/2018
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'cosaju') 
begin 
	Alter Table ven_cotizacion Add cosaju decimal not null CONSTRAINT DF_ven_cotizacion_cosaju default 0
	Print 'ven_cotizacion - cosaju'
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'valaju' and DATA_TYPE <> 'decimal') 
begin 
	Alter table ven_cotidetalle drop DF_ven_cotidetalle_valaju
	Alter Table ven_cotidetalle alter column valaju decimal not null
	ALTER TABLE ven_cotidetalle ADD CONSTRAINT DF_ven_cotidetalle_valaju DEFAULT 0 FOR valaju
	Print 'ven_cotidetalle - valaju' -- ing PriscyReales 27/12/2018
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'valaju') 
begin 
	Alter Table ven_cotidetalle Add valaju decimal not null CONSTRAINT DF_ven_cotidetalle_valaju default 0
	Print 'ven_cotidetalle - valaju'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'servidor') 
begin 
	Alter Table ven_cotidetalle Add servidor varchar(60) not null default 'SERVER'
	Print 'ven_cotidetalle - servidor'
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'cosaju' and DATA_TYPE <> 'decimal') 
begin 
	Alter table ven_facturas drop DF_ven_facturas_cosaju
	Alter Table ven_facturas alter column cosaju decimal not null 
	ALTER TABLE ven_facturas ADD CONSTRAINT DF_ven_facturas_cosaju DEFAULT 0 FOR cosaju
	Print 'ven_facturas - cosaju' -- ing PriscyReales 27/12/2018
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'cosaju') 
begin 
	Alter Table ven_facturas Add cosaju decimal not null CONSTRAINT DF_ven_facturas_cosaju default 0
	Print 'ven_facturas - cosaju'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'qtyund') 
begin 
	Alter Table ven_cotidetalle Add qtyund decimal(18,4) not null CONSTRAINT DF_ven_cotidetalle_qtyund default 0
	Print 'ven_cotidetalle - qtyund'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'undart2') 
begin 
	Alter Table ven_cotidetalle Add undart2 nvarchar(3) not null CONSTRAINT DF_ven_cotidetalle_undart2 default ''
	Print 'ven_cotidetalle - undart2'
end																												------voy por aqui
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Precio') 
begin 
	Alter Table ven_cotidetalle Add Precio decimal(18,4) not null CONSTRAINT DF_ven_cotidetalle_Precio default 0
	Print 'ven_cotidetalle - Precio'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Constante') 
begin 
	Alter Table ven_cotidetalle Add Constante decimal(18,4) not null CONSTRAINT DF_ven_cotidetalle_Constante default 0
	Print 'ven_cotidetalle - Constante'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'undutilidad') 
begin 
	Alter Table ven_cotidetalle Add undutilidad decimal(18,4) not null CONSTRAINT DF_ven_cotidetalle_undutilidad default 0
	Print 'ven_cotidetalle - undutilidad'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotizacion' AND T.column_name = 'Listapre') 
begin 
	Alter Table ven_cotizacion Add Listapre numeric(2) not null CONSTRAINT DF_ven_cotizacion_Listapre default 0
	Print 'ven_cotizacion - Listapre'
end 
Go

----
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'qtyund') 
begin 
	Alter Table ven_facdetalle Add qtyund decimal(18,4) not null CONSTRAINT DF_ven_facdetalle_qtyund default 0
	Print 'ven_facdetalle - qtyund'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'undart2') 
begin 
	Alter Table ven_facdetalle Add undart2 nvarchar(3) not null CONSTRAINT DF_ven_facdetalle_undart2 default ''
	Print 'ven_facdetalle - undart2'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'Precio') 
begin 
	Alter Table ven_facdetalle Add Precio decimal(18,4) not null CONSTRAINT DF_ven_facdetalle_Precio default 0
	Print 'ven_facdetalle - Precio'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'Constante') 
begin 
	Alter Table ven_facdetalle Add Constante decimal(18,4) not null CONSTRAINT DF_ven_facdetalle_Constante default 0
	Print 'ven_facdetalle - Constante'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'undutilidad') 
begin 
	Alter Table ven_facdetalle Add undutilidad decimal(18,4) not null CONSTRAINT DF_ven_facdetalle_undutilidad default 0
	Print 'ven_facdetalle - undutilidad'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'unddependiente') 
begin 
	Alter Table ven_parametros2 Add unddependiente bit not null CONSTRAINT DF_ven_parametros2_unddependiente default 0
	Print 'ven_parametros2 - unddependiente'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'Listapre') 
begin 
	Alter Table ven_pedidos Add Listapre numeric(2) not null CONSTRAINT DF_ven_pedidos_Listapre default 0
	Print 'ven_pedidos - Listapre'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'qtyund') 
begin 
	Alter Table ven_pdetalle Add qtyund decimal(18,4) not null CONSTRAINT DF_ven_pdetalle_qtyund default 0
	Print 'ven_pdetalle - qtyund'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'undart2') 
begin 
	Alter Table ven_pdetalle Add undart2 nvarchar(3) not null CONSTRAINT DF_ven_pdetalle_undart2 default ''
	Print 'ven_pdetalle - undart2'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Precio') 
begin 
	Alter Table ven_pdetalle Add Precio decimal(18,4) not null CONSTRAINT DF_ven_pdetalle_Precio default 0
	Print 'ven_pdetalle - Precio'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Constante') 
begin 
	Alter Table ven_pdetalle Add Constante decimal(18,4) not null CONSTRAINT DF_ven_pdetalle_Constante default 0
	Print 'ven_pdetalle - Constante'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'undutilidad') 
begin 
	Alter Table ven_pdetalle Add undutilidad decimal(18,4) not null CONSTRAINT DF_ven_pdetalle_undutilidad default 0
	Print 'ven_pdetalle - undutilidad'
end 
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'bloqLista') 
begin 
	Alter Table ven_parametros2 Add bloqLista bit not null CONSTRAINT DF_ven_parametros2_bloqLista default 0
	Print 'ven_parametros2 - bloqLista'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'Listapre') 
begin 
	Alter Table ven_cotidetalle Add Listapre numeric(2) not null CONSTRAINT DF_ven_cotidetalle_Listapre default 0
	Print 'ven_cotidetalle - Listapre'
end 
Go
-------------------------actualizado  01022019.  Lissette Castro-------
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'vlropayuart') 
begin 
	Alter Table ven_parametros2 Add vlropayuart numeric(1) not null CONSTRAINT DF_ven_parametros2_vlropayuart default 0
	Print 'ven_parametros2 - vlropayuart'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pdetalle' AND T.column_name = 'Listapre') 
begin 
	Alter Table ven_pdetalle Add Listapre numeric(2) not null CONSTRAINT DF_ven_pdetalle_Listapre default 0
	Print 'ven_pdetalle - Listapre'
end 
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_pedidos' AND Temp.column_name = 'sigla') 
begin 
	Alter Table ven_pedidos Add sigla nvarchar(20) Not Null Default '' 
	Print 'Se agregó la columna sigla en ven_pedidos.' --Ing. Luis Dominguez 2019-03-18
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_pedidos' AND Temp.column_name = 'pasajero') 
begin 
	Alter Table ven_pedidos Add pasajero nvarchar(150) Not Null Default '' 
	Print 'Se agregó la columna pasajero en ven_pedidos.' --Ing. Luis Dominguez 2019-03-20
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_comisiones' AND T.column_name = 'nitven' and t.character_maximum_length!=15) 
begin 
	Alter table Ven_comisiones alter column  nitven nvarchar(15) 
	Print 'Ven_comisiones - nitven'
end
go 

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'Ven_comisiones' AND Temp.column_name = 'tipo') 
begin 
	Alter Table Ven_comisiones Add tipo nvarchar(3) Not Null Default '' 
	Print 'Ven_comisiones tipo' --Ing. Lissette 2019-03-27
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'Ven_parametros2' AND Temp.column_name = 'dctobcodev') 
begin 
	Alter Table Ven_parametros2 Add dctobcodev bit Not Null Default 0
	Print 'Ven_parametros2 dctobcodev' --Ing. Lissette 2019-03-28
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'Ven_comisiones' AND Temp.column_name = 'fecha') 
begin 
	Alter Table Ven_comisiones Add fecha date Not Null Default '19000101' 
	Print 'Ven_comisiones fecha' --Ing. Lissette 2019-03-29
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'tipo' and  t.CHARACTER_MAXIMUM_LENGTH  != 30 ) 
begin
	Alter Table ven_facturas ALTER COLUMN tipo nvarchar(30) not null
	Print 'ven_facturas.tipo - aumento de caracter a 4 '  -- Ing. Luis Dominguez 2019-04-22
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_tipoveh' AND T.column_name = 'nomtip' and  t.CHARACTER_MAXIMUM_LENGTH  != 200 ) 
begin
	Alter Table ven_tipoveh ALTER COLUMN nomtip nvarchar(200) not null
	Print 'ven_facturas.ven_tipoveh - se aumento la longitud a 200 '  -- Ing. Luis Dominguez 2019-04-22
end 
Go
-------------Actualizado en init 25/04/2019 Andres Jimenez

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_fecliente' AND Temp.column_name = 'item') 
begin 
	Alter Table ven_fecliente Add item numeric(10) Not Null Default 0 
	Print 'ven_fecliente item' --Ing. Lissette 2019-05-31
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'Ven_FEFacturaDetalle' AND Temp.column_name = 'item') 
begin 
	Alter Table Ven_FEFacturaDetalle Add item numeric(10) Not Null Default 0 
	Print 'Ven_FEFacturaDetalle item' --Ing. Lissette 2019-05-31
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'Ven_FEFactura' AND Temp.column_name = 'item') 
begin 
	Alter Table Ven_FEFactura Add item numeric(10) Not Null Default 0 
	Print 'Ven_FEFactura item' --Ing. Lissette 2019-05-31
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'Ven_FEFacturaImpuestos' AND Temp.column_name = 'item') 
begin 
	Alter Table Ven_FEFacturaImpuestos Add item numeric(10) Not Null Default 0 
	Print 'Ven_FEFacturaImpuestos item' --Ing. Lissette 2019-05-31
end
Go

/**/
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'observa' and t.CHARACTER_MAXIMUM_LENGTH  < 240) 
begin 
	Alter Table ven_prefacdetalle alter column  observa nvarchar(240)
	Print 'Alter column ven_prefacdetalle -observa se amplió a 240 su longitud' --Ing. Luis Dominguez 2019-06-19
end
go 

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_domiciliotemp' AND T.column_name = 'observa' and t.CHARACTER_MAXIMUM_LENGTH  < 240) 
begin 
	Alter Table ven_domiciliotemp alter column  observa nvarchar(240)
	Print 'Alter column ven_domiciliotemp -observa se amplió a 240 su longitud' --Ing. Luis Dominguez 2019-06-19
end
go 

--- quede por aqui. ampliar el codigo. 
IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'Glb_Equivalentes_FE'  AND T.column_name = 'codigo' and t.CHARACTER_MAXIMUM_LENGTH!=10 ) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='Glb_Equivalentes_FE' AND tc.name='descrip')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='Glb_Equivalentes_FE' AND tc.name='descrip'
		
		SET @sql='ALTER TABLE dbo.ven_facdetalle DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.ven_facdetalle ALTER COLUMN descrip NVARCHAR(max)
		SET @sql='ALTER TABLE dbo.ven_facdetalle ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [descrip ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE ven_facdetalle ALTER COLUMN descrip NVARCHAR(max)
		Print 'ven_facdetalle - descrip'  --Ing. Lis 22/01/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_factura' AND T.column_name = 'qr') 
begin 
	Alter Table fe_factura Add qr nvarchar(max) not null CONSTRAINT DF_fe_factura_qr DEFAULT ''
	Print 'fe_factura - qr'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_factura' AND T.column_name = 'tipocufe') 
begin 
	Alter Table fe_factura Add tipocufe nvarchar(50) not null CONSTRAINT DF_fe_factura_tipocufe DEFAULT ''
	Print 'fe_factura - tipocufe'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_direccion' AND T.column_name = 'departamento') 
begin 
	Alter Table fe_direccion Add departamento nvarchar(50) not null CONSTRAINT DF_fe_direccion_departamento DEFAULT ''
	Print 'fe_direccion - departamento'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_cliente' AND T.column_name = 'email') 
begin 
	Alter Table fe_cliente Add email nvarchar(200) not null CONSTRAINT DF_fe_cliente_email DEFAULT ''
	Print 'fe_cliente - email'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_direccion' AND T.column_name = 'zonapostal') 
begin 
	Alter Table fe_direccion Add zonapostal nvarchar(10) not null CONSTRAINT DF_fe_direccion_zonapostal DEFAULT ''
	Print 'fe_direccion - zonapostal'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_cargosdescuentos' AND T.column_name = 'secuenciadet') 
begin 
	Alter Table fe_cargosdescuentos Add secuenciadet nvarchar(4) not null CONSTRAINT DF_fe_cargosdescuentos_secuenciadet DEFAULT ''
	Print 'fe_cargosdescuentos - secuenciadet'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_impustostotales' AND T.column_name = 'secuenciadet') 
begin 
	Alter Table fe_impustostotales Add secuenciadet nvarchar(4) not null CONSTRAINT DF_fe_fe_impustostotales_secuenciadet DEFAULT ''
	Print 'fe_impustostotales - secuenciadet'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'FE_FacturaImpuestos' AND T.column_name = 'secuenciadet') 
begin 
	Alter Table FE_FacturaImpuestos Add secuenciadet nvarchar(4) not null CONSTRAINT DF_FE_FacturaImpuestos_secuenciadet DEFAULT ''
	Print 'FE_FacturaImpuestos - secuenciadet'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_documentoreferenciado' AND T.column_name = 'cufedocreferenciado' 
		and t.CHARACTER_MAXIMUM_LENGTH!=200) 
begin 
	Alter Table fe_documentoreferenciado alter column cufedocreferenciado nvarchar(200) 
	Print 'fe_documentoreferenciado - cufedocreferenciado'
end
Go


IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'comibco') 
begin 
	Alter Table ven_notas add comibco decimal(18,4) not null CONSTRAINT DF_ven_notas_comibco DEFAULT 0
	Print 'ven_notas - comibco'
end
Go


IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'horaini') 
begin 
	Alter Table ven_cotizacion Add horaini nvarchar(5) Not Null Default ''
	Print 'ven_cotizacion horaini' --Ing. Lissette 2020-02-26
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'horafin') 
begin 
	Alter Table ven_cotizacion Add horafin nvarchar(5) Not Null Default ''
	Print 'ven_cotizacion horafin' --Ing. Lissette 2020-02-26
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'nropersona') 
begin 
	Alter Table ven_cotizacion Add nropersona nvarchar(5) Not Null Default ''
	Print 'ven_cotizacion nropersona' --Ing. Lissette 2020-02-26
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'meseros') 
begin 
	Alter Table ven_cotizacion Add meseros nvarchar(3) Not Null Default ''
	Print 'ven_cotizacion meseros' --Ing. Lissette 2020-02-26
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'meserosadd') 
begin 
	Alter Table ven_cotizacion Add meserosadd nvarchar(3) Not Null Default ''
	Print 'ven_cotizacion meserosadd' --Ing. Lissette 2020-02-26
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'ubicacion') 
begin 
	Alter Table ven_cotizacion Add ubicacion nvarchar(3) Not Null Default '' 
	Print 'ven_cotizacion ubicacion' --Ing. Lissette 2020-02-26
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'observaorganizacion') 
begin 
	Alter Table ven_cotizacion Add observaorganizacion nvarchar(max) Not Null Default '' 
	Print 'ven_cotizacion observaorganizacion' --Ing. Lissette 2020-03-10
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'observameseros') 
begin 
	Alter Table ven_cotizacion Add observameseros nvarchar(max) Not Null Default '' 
	Print 'ven_cotizacion observameseros' --Ing. Lissette 2020-03-10
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_cotizacion' AND Temp.column_name = 'observasonido') 
begin 
	Alter Table ven_cotizacion Add observasonido nvarchar(max) Not Null Default '' 
	Print 'ven_cotizacion observasonido' --Ing. Lissette 2020-03-10
end
Go


IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_parametros2' AND Temp.column_name = 'terminoscoti') 
begin 
	Alter Table ven_parametros2 Add terminoscoti nvarchar(max) Not Null Default '' 
	Print 'ven_parametros2 terminoscoti' --Ing. Lissette 2020-03-15
end
Go

IF not exists (Select * From Information_Schema.Columns AS Temp Where Temp.table_name = 'ven_parametros2' AND Temp.column_name = 'terminoscontra') 
begin 
	Alter Table ven_parametros2 Add terminoscontra nvarchar(max) Not Null Default '' 
	Print 'ven_parametros2 terminoscontra' --Ing. Lissette 2020-03-15
end
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi' AND T.column_name = 'Codori' ) 
begin 
	Alter Table ven_facdetremi ADD Codori NVARCHAR(3) not null DEFAULT ''
	Print 'ven_facdetremi - Codori '  -- Ing. Shirley Rojas 03 jun 2020
end 
Go
---Shirley Rojas 01-07-2020
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_Cotizacion' AND T.column_name = 'trm') 
begin
	Alter Table Ven_Cotizacion Add trm numeric(14,0) not null default 0
	Print 'ven_cotizacion - trm'  
end 
Go
---Shirley Rojas 01-07-2020
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_cotidetalle' AND T.column_name = 'valdolar') 
begin
	Alter Table ven_cotidetalle Add valdolar numeric(18,4) not null default 0
	Print 'ven_cotidetalle - valdolar'  
end 
Go
--
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'TipEntrega' ) 
begin 
	Alter Table ven_pedidos ADD TipEntrega NVARCHAR(10) not null DEFAULT ''
	Print 'ven_pedidos - TipEntrega '  -- Ing. Shirley R 16 Jul 2020 - Solicitud Arnold para Fenicio
end
Go
--
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'Destinatario' ) 
begin 
	Alter Table ven_pedidos ADD Destinatario NVARCHAR(255) not null DEFAULT ''
	Print 'ven_pedidos - Destinatario '  -- Ing. Shirley R 16 Jul 2020 - Solicitud Arnold para Fenicio
end 
Go
--
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_facdetremi' AND T.Column_Name = 'qtydev')
begin
	Alter Table ven_facdetremi	Add qtydev decimal (12, 0) NOT NULL DEFAULT 0
	Print 'ven_facdetremi - qtydev'  -- Ing. Shirley R 28 Jul 2020 - Solicitud Jennifer para Devol fact con remision Hidromana
end
Go
--
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'Tipdoc' ) 
begin 
	Alter Table ven_prefactura ADD tipdoc NVARCHAR(2) not null DEFAULT ''
	Print 'ven_prefactura - tipdoc '  -- Ing. Shirley Rojas 28 jul 2020 - solicitud de Ing. Jennifer por medio de arnold para el Ecommerce - Touch
end 
Go 
-- Yaslen Andrade 06-08-2020 campo para agregar nit de domiciliario en la prefactura- Solicitud Jennifer R.
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'Nitdomi' ) 
begin 
	Alter Table ven_prefactura ADD Nitdomi NVARCHAR(10) not null DEFAULT ''
	Print 'ven_prefactura - Nitdomi' 
end 
Go 

----Campos Antiguos que existen pero que no estan en el restruct y Arnold los necesitaba en la App de Deliloco
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros' AND T.column_name = 'item' ) 
begin 
	alter table ven_parametros add item numeric(10, 0) NOT NULL DEFAULT(1)
	Print 'ven_parametros - item' 
end 
Go 

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'horacepta') 
begin 
	alter table ven_prefacdetalle add horacepta datetime NULL DEFAULT('19000101')
	Print 'ven_prefacdetalle - horacepta' 
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'urgente') 
begin 
	alter table ven_prefacdetalle add urgente bit NOT NULL DEFAULT(0)
	Print 'ven_prefacdetalle - urgente' 
end 
Go  

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'Tipdoc' ) 
begin 
	alter table ven_prefacdetalle add tipdoc nvarchar(2) NOT NULL DEFAULT ('')
	Print 'ven_prefacdetalle - tipdoc '
end 
Go 

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'estcoc' ) 
begin 
	alter table ven_prefactura add estcoc nvarchar(1) NOT NULL DEFAULT ('') 
	Print 'ven_prefactura - estcoc '
end 
Go  

--Agregado Por Arnold Sandoval  para  la relación entre [glb_empmensajeria] y ven_pedidos
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_pedidos' AND T.column_name = 'CodEmp' ) 
begin 
       alter table ven_pedidos add CodEmp nvarchar(20)  NULL 
	   Print 'ven_pedidos - CodEmp'
end 
Go
-- 11-09-2020 Yaslen Andrade campo para definir mesas que pertenecen a la app- Para app de restaurantes
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'apps' ) 
begin 
       alter table ven_mesas add apps bit NOT NULL DEFAULT(0)
	   Print 'ven_mesas - apps'
end 
Go

 if not exists (select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_prefactura' AND T.COLUMN_NAME = 'numcon')
  Begin
     alter table ven_prefactura add numcon nvarchar(8) NOT NULL DEFAULT('')  --Consecutivo/id con el que se generará el pedido por la aplicacion móvil, Arnold Sandoval A. 18/09/2020
	 Print 'ven_prefactura - numcon'
  end
GO

-- ME ASEGURO QUE EL CAMPO idemp este agregado a la tabla ven_prefactura-  Arnold Sandoval A. 18/09/2020
 IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'idemp' ) 
     begin 
         Alter Table ven_prefactura ADD idemp NVARCHAR(3) not null DEFAULT ('')
         Print 'ven_prefactura - idemp '  
     end  
	 GO


 -- 22-09-2020 Campo agregado por Arnold Sandoval para determinar el estado cuando se recibe el pedido desde el notificador de los pedidos de la app
 if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_prefactura' AND T.COLUMN_NAME = 'estped')
   begin 
	alter table ven_prefactura add estped nvarchar(1) NULL DEFAULT('')
	Print 'ven_prefactura - estped'
   end
GO

-- 02-10-2020 Campo agregado por Arnold Sandoval para la impresión de las comandas desde el Notifier.app
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where t.TABLE_NAME = 'ven_variantes' AND t.COLUMN_NAME = 'tipdoc')
   begin
    alter table ven_variantes add [tipdoc] [nvarchar](2) NOT NULL DEFAULT('')
   end

 -- 18-12-2020 Campo agregado para enviar lotes en 714 ya que el que se usaba solo permitia 50 caracteres
 if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'FE_FacturaDetalle' and T.COLUMN_NAME = 'descripcionTecnica')
  begin
   alter table FE_FacturaDetalle add descripcionTecnica nvarchar(300) NOT NULL DEFAULT ('')
   Print 'FE_FacturaDetalle - descripcionTecnica'
  end
GO

------------Agregado por Arnold Sandoval 12-01-2021- para colocar el estado que manda Fenicio en la transaccion, para que no se envíe varias veces
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_pedidos' and T.COLUMN_NAME = 'estecommerce')
  begin
   alter table ven_pedidos add estecommerce varchar(30) not null default('')
   print 'ven_pedidos  - estecommerce'
  end
GO

------------ 14-04-2021 Agregado por Arnold Sandoval para definir el tipo de entrega del pedido desde la app tiene una longitud de un carácter, y sólo permite uno de tres valores posibles:
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_prefactura' AND T.Column_Name = 'tipoentrega')
  begin 
     alter table ven_prefactura add tipoentrega nvarchar(1) NOT NULL DEFAULT('M')		
  end
Go
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='CH_ven_prefactura_tipoentrega')
  BEGIN
   ALTER TABLE ven_prefactura ADD CONSTRAINT CH_ven_prefactura_tipoentrega CHECK (tipoentrega = 'M' OR tipoentrega = 'D' OR tipoentrega = 'R');
	 Print 'ven_prefactura - CH_ven_prefactura_tipoentrega'
  END

---------- Campo expandido de cantidad en facturacion eleectronica 10-05-2021
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_facturadetalle' AND T.column_name = 'cantidadreal' and t.CHARACTER_MAXIMUM_LENGTH !=30) 
begin 
	Alter Table fe_facturadetalle alter column  cantidadreal nvarchar(30) not null
	Print 'fe_facturadetalle - Expandir cantidadreal'
end
go  

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_facturadetalle' AND T.column_name = 'cantidadunidades' and t.CHARACTER_MAXIMUM_LENGTH !=30) 
begin 
	Alter Table fe_facturadetalle alter column  cantidadunidades nvarchar(30) not null
	Print 'fe_facturadetalle - Expandir cantidadunidades'
end
go  
--- creado para subir pedidos por medio de excel - desarrollo de manbu
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros2' AND T.column_name = 'qtyxsucursal') 
begin
	Alter Table ven_Parametros2 Add qtyxsucursal bit not null default 0
	Print 'ven_Parametros2 - qtyxsucursal'
end 
Go
--- 23-06-2021 Campo agregado por Lissette Castro para desarrollo de surtipizza creacion de rutas
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'numruta') 
begin
	Alter Table ven_facdetalle Add numruta nvarchar(10) not null default ''
	Print 'ven_facdetalle - numruta'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ruta' AND T.column_name = 'codgru') 
begin
	Alter Table ven_ruta Add codgru nvarchar(3) not null default ''
	Print 'ven_ruta - codgru'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ruta' AND T.column_name = 'estruta') 
begin
	Alter Table ven_ruta Add estruta nvarchar(1) not null default ''
	Print 'ven_ruta - estruta'
end 
Go
---- Campo agregado por Arnold Sandoval para agregar los adicionales en los platos touch web
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'ven_prefacdetalle' AND T.COLUMN_NAME = 'itemsubord')
   BEGIN
     alter table ven_prefacdetalle add itemsubord int NOT NULL DEFAULT(0) 
   END
 
 ----- 03-08-2021 Campo agregado para desarrollo de surtipizza creacion de rutas
 IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_ruta' AND T.column_name = 'codigoruta') 
begin
	Alter Table ven_ruta Add codigoruta nvarchar(10) not null default ''
	Print 'ven_ruta - codigoruta'
end 
Go

---- Script para la conversion del campo vuelo a decimal, ya que muchas bd lo tenian mal y afecta el comanda web
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'vuelo' and t.DATA_TYPE!='decimal') 
begin
declare 
@tipo nvarchar(20), 
@prede nvarchar(20),
@sql nvarchar(max)  
set @prede = (select o.name from sys.columns c 
inner join sys.objects o on c.default_object_id = o.object_id
inner join INFORMATION_SCHEMA.COLUMNS ic on c.column_id = ic.ORDINAL_POSITION and c.name = ic.COLUMN_NAME
where c.name = 'vuelo')
BEGIN 
  if EXISTS(select o.name from sys.columns c 
    inner join sys.objects o on c.default_object_id = o.object_id
    inner join INFORMATION_SCHEMA.COLUMNS ic on c.column_id = ic.ORDINAL_POSITION and c.name = ic.COLUMN_NAME
  where c.name = 'vuelo')
  BEGIN
    set @sql = 'DROP DEFAULT ' + @prede
   exec (@sql)
  END
--print @prede

   set @tipo = (select t.DATA_TYPE from INFORMATION_SCHEMA.COLUMNS t where t.TABLE_NAME = 'ven_facturas' and t.COLUMN_NAME = 'vuelo')
  if exists(select * from sys.columns c where c.name = 'vuelo')
    begin
      if EXISTS(select t.DATA_TYPE from INFORMATION_SCHEMA.COLUMNS t where t.TABLE_NAME = 'ven_facturas' and t.COLUMN_NAME = 'vuelo' )

        begin 
          if @tipo <> 'decimal'
            begin
             update ven_facturas set vuelo = CONVERT(nvarchar(10), CONVERT(decimal(10,0),  CASE WHEN Isnumeric(vuelo) = 1
             THEN CONVERT(DECIMAL(18,2),vuelo) 
            ELSE 0 END ))

            alter table ven_facturas alter column vuelo decimal(10,0)
          end

        end
     end
   else
     begin 
        ALTER TABLE dbo.ven_facturas ADD vuelo decimal(10,0) not NULL default 0 ;
     end
     print 'Cambio de columna vuelo de la tabla ven_facturas de nvarchar a decimal'

END
END
------ 15-09-2021 Agregado por Lissette Castro por caso de remisiones de un mismo articulo con distintos precios
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetremi' AND T.column_name = 'itemfac') 
begin
	Alter Table ven_facdetremi Add itemfac numeric(14) not null default 0
	Print 'ven_facdetremi - itemfac'
end 
Go 

--- Colocar llave a la tabla para que no genere conflicto en el administrativo web
if not exists(SELECT * FROM Information_Schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME='PK_ven_detconcep' and left(constraint_name, 2) = 'PK')
 begin
    ALTER TABLE ven_detconcep ADD CONSTRAINT PK_ven_detconcep PRIMARY KEY CLUSTERED (codcto, codcon, numdoc)
 end
GO
----
 IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'refrida') 
begin
	Alter Table ven_parametros2 Add refrida nvarchar(MAX) not null default ''
	Print 'ven_parametros2 - refrida'
end 
Go

-------- 02-12-2021 Lissette Castro. Agregado para desarrollo de Slaka en pantalla por vendedor para que cada servicio tenga su asesor
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'nitasesor') 
begin
	Alter Table ven_facdetalle Add nitasesor nvarchar(15) not null default ''
	Print 'ven_facdetalle - nitasesor'
end 
Go
------ 23-02-2022 Agregado por Jennifer Rodriguez - cantidades devueltas de variantes en prefacturas
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_variantes' AND T.Column_Name = 'qtydev')
begin
	Alter Table ven_variantes	Add qtydev decimal (14, 2) NOT NULL DEFAULT 0
	Print 'ven_variantes - qtydev'  
end
Go
------ 25-02-2022 Agregado por Jennifer Rodriguez - Agregar valor de propina en las notas
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_notas' AND T.Column_Name = 'propina')
begin
	Alter Table ven_notas	Add propina decimal (18, 4) NOT NULL DEFAULT 0
	Print 'ven_notas - propina'  
end
Go
---------14-03-2022 Creado por Jennifer Rodriguez, informe especial de cierre A la Parrilla
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_Parametros' AND T.column_name = 'infcierre') 
begin
	Alter Table ven_Parametros Add infcierre bit not null default 0
	Print 'ven_Parametros - infcierre'
end 
Go
--------02-06-2022 Creado por Enuar Martinez para validar el ingreso a las mesas en el touch web y no carguen pedido al mismo tiempo
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_mesas' AND T.column_name = 'ocupamesa') 
begin
	alter table ven_mesas add ocupamesa nvarchar(15) not null default ('')
	Print 'ven_mesas - ocupamesa'
end 
Go
----- 06-06-2022 Creado por Lissette Castro para los documentos soportes a no abligados a facturar
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'fe_documentoreferenciado' AND T.Column_Name = 'tipodocumento')  
begin 
	Alter Table fe_documentoreferenciado	add tipodocumento NVARCHAR(2) not null default ''
	Print 'fe_documentoreferenciado - tipodocumento'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'fe_documentoreferenciado' AND T.Column_Name = 'codigoEstatusDocumento')  
begin 
	Alter Table fe_documentoreferenciado	add codigoEstatusDocumento NVARCHAR(1) not null default ''
	Print 'fe_documentoreferenciado - codigoEstatusDocumento'  
end 
Go
--- 23-06-2022 Agregado por Lissette Castro para activar que articulos van a salir en produccion
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'FiltroArtProd') 
begin	
	Alter Table ven_parametros2 Add FiltroArtProd bit Not Null Default 0 
	Print 'ven_parametros2 - FiltroArtProd'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'VariantexIngrediente') 
begin	
	Alter Table ven_parametros2 Add VariantexIngrediente bit Not Null Default 0 
	Print 'ven_parametros2 - VariantexIngrediente'
end
Go
---- Agregado por Jennifer R. agregar reporte de existencias en cierre de turno
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros' AND T.column_name = 'infexisgru') 
begin	
	Alter Table ven_parametros Add infexisgru bit Not Null Default 0 
	Print 'ven_parametros - infexisgru'
end
Go
----- Agregado por Lissette castro para mostrar forma de pago en comanda por domicilio.
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_DomicilioTemp' AND T.column_name = 'FormaPago') 
begin	
	Alter Table Ven_DomicilioTemp Add FormaPago nvarchar(200) Not Null Default '' 
	Print 'Ven_DomicilioTemp - FormaPago'
end
Go
---- Agregado por Jennifer R. para colocar base para aplicar descuentos
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ven_parametros2' AND T.Column_Name = 'basedcto')
begin
	Alter Table ven_parametros2	Add basedcto numeric (14, 2) NOT NULL DEFAULT 0
	Print 'ven_parametros2 - basedcto'  
end
Go
------ Agregado por Lissette Castro para envío de causaciones como documento soporte 19-08-2022
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'codartDS') 
begin	
	Alter Table ven_parametros2 Add codartDS nvarchar(10) Not Null Default '' 
	Print 'ven_parametros2 - codartDS'
end
Go
------ Agregado por Yaslen Andrade para establecer directorio de firma digital 14-02-2023
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'rutaFirma') 
begin	
	Alter Table ven_parametros2 Add rutaFirma nvarchar(200) Not Null Default '' 
	Print 'ven_parametros2 - rutaFirma'
end
Go
------ Agregado por Jennifer Rodriguez para guardar ruta imagen de firma digital 14-02-2023
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'Firma') 
begin	
	Alter Table ven_facturas Add Firma nvarchar(MAX) Not Null Default '' 
	Print 'ven_facturas - Firma'
end
Go
------ Agregado por Ing.Daniel Donado para establecer directorio de firma digital 17-04-2023
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'Firma') 
begin	
	Alter Table ven_parametros2 Add Firma nvarchar(MAX) Not Null Default '' 
	Print 'ven_parametros2 - Firma'
end
Go
--- 10-10-2023 Agregado para parametrizar el envío automatico de facturas. Yaslen Andrade
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'enviafe') 
begin	
	Alter Table ven_parametros2 Add enviafe bit Not Null Default 0  
	Print 'ven_parametros2 - enviafe'
end
Go
---- 10-11-2023 Agregado por Jennifer Rodriguez, guardar resoluciones de facturas para que al reimprimir salga con la resolucion vigente al momento de hacer la factura aplica en el touch.
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'Resol') 
begin	
	Alter Table ven_facturas Add Resol nvarchar(MAX) Not Null Default '' 
	Print 'ven_facturas - Resol'
end
Go
--- 13-12-2023 Adicion del impuesto saludable en ventas Lissette Castro
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'impsaludable') 
begin	
	Alter Table ven_parametros2 Add impsaludable bit Not Null Default 0
	Print 'ven_parametros2 - impsaludable'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facturas' AND T.column_name = 'VlrImpSalud') 
begin	
	Alter Table ven_facturas Add VlrImpSalud decimal(18,4) Not Null Default 0
	Print 'ven_facturas - VlrImpSalud'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'poricui') 
begin	
	Alter Table ven_facdetalle Add poricui decimal(8,2) Not Null Default 0
	Print 'ven_facdetalle - poricui'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'totalicui') 
begin	
	Alter Table ven_facdetalle Add totalicui decimal(18,2) Not Null Default 0
	Print 'ven_facdetalle - totalicui'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_facdetalle' AND T.column_name = 'totalibua') 
begin	
	Alter Table ven_facdetalle Add totalibua decimal(18,2) Not Null Default 0
	Print 'ven_facdetalle - totalibua'
end
Go
---  Agregado por Lissette Castro Intereses por mora en pago de RC
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'CalcInteresRC') 
begin	
	Alter Table ven_parametros2 Add CalcInteresRC bit Not Null Default 0
	Print 'ven_parametros2 - CalcInteresRC'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'VlrImpSalud') 
begin	
	Alter Table ven_notas Add VlrImpSalud decimal(18,4) Not Null Default 0
	Print 'ven_notas - VlrImpSalud'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notas' AND T.column_name = 'VlrImpSalud') 
begin	
	Alter Table ven_notas Add VlrImpSalud decimal(18,4) Not Null Default 0
	Print 'ven_notas - VlrImpSalud'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notdetalle' AND T.column_name = 'poricui') 
begin	
	Alter Table ven_notdetalle Add poricui decimal(8,2) Not Null Default 0
	Print 'ven_notdetalle - poricui'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notdetalle' AND T.column_name = 'totalicui') 
begin	
	Alter Table ven_notdetalle Add totalicui decimal(18,2) Not Null Default 0
	Print 'ven_notdetalle - totalicui'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_notdetalle' AND T.column_name = 'totalibua') 
begin	
	Alter Table ven_notdetalle Add totalibua decimal(18,2) Not Null Default 0
	Print 'ven_notdetalle - totalibua'
end
Go
-----28-06-2024 Agregado por Edgar Madrid para facturación por software propio
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'GuardaFacSp') 
begin	
	Alter Table ven_parametros2 Add GuardaFacSp bit Not Null Default 0
	Print 'ven_parametros2 - GuardaFacSp'
end
Go
-----03-07-2024 Agregado por Lissette Castro para facturaciòn por sucrursales
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_parametros2' AND T.column_name = 'sucursales') 
begin	
	Alter Table ven_parametros2 Add sucursales bit Not Null Default 0
	Print 'ven_parametros2 - sucursales'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_sucursales' AND T.column_name = 'direccion') 
begin	
	Alter Table Ven_sucursales Add direccion nvarchar(200) Not Null Default ''
	Print 'Ven_sucursales - direccion'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_sucursales' AND T.column_name = 'telefono') 
begin	
	Alter Table Ven_sucursales Add telefono nvarchar(200) Not Null Default ''
	Print 'Ven_sucursales - telefono'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_sucursales' AND T.column_name = 'contacto') 
begin	
	Alter Table Ven_sucursales Add contacto nvarchar(200) Not Null Default ''
	Print 'Ven_sucursales - contacto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Ven_facturas' AND T.column_name = 'sucursal') 
begin	
	Alter Table Ven_facturas Add sucursal nvarchar(10) Not Null Default ''
	Print 'Ven_facturas - sucursal'
end
Go
----------19-09-2024 Agregado por Lissette Castro para agregar Impuesto saludable en el touch
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefactura' AND T.column_name = 'VlrImpSalud') 
begin	
	Alter Table ven_prefactura Add VlrImpSalud decimal(18,4) Not Null Default 0
	Print 'ven_prefactura - VlrImpSalud'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'poricui') 
begin	
	Alter Table ven_prefacdetalle Add poricui decimal(6,2) Not Null Default 0
	Print 'ven_prefacdetalle - poricui'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'totalicui') 
begin	
	Alter Table ven_prefacdetalle Add totalicui decimal(18,4) Not Null Default 0
	Print 'ven_prefacdetalle - totalicui'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_prefacdetalle' AND T.column_name = 'totalibua') 
begin	
	Alter Table ven_prefacdetalle Add totalibua decimal(18,4) Not Null Default 0
	Print 'ven_prefacdetalle - totalibua'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'fe_factura' AND T.column_name = 'noReferenciado') 
begin 
	Alter Table fe_factura Add noReferenciado varchar(1) not null CONSTRAINT DF_fe_factura_noReferenciado DEFAULT ''
	Print 'fe_factura - noReferenciado'
end
Go
