IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_conteoinv' AND T.column_name = 'itemart') 
begin 
	Alter Table alm_conteoinv Add itemart int
	Print 'alm_conteoinv - itemart'
end
Go
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos' AND T.column_name = 'codcuec' and t.CHARACTER_MAXIMUM_LENGTH!=8) 
begin 
	Alter Table alm_costos alter column codcuec nvarchar(8)
	Print 'alm_costos - codcuec'
end
Go
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos' AND T.column_name = 'codcued' and t.CHARACTER_MAXIMUM_LENGTH!=8) 
begin 
	Alter Table alm_costos alter column codcued nvarchar(8)
	Print 'alm_costos - codcued'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'glb_almacen' AND T.column_name = 'cladespro') 
begin 
	alter table glb_almacen add cladespro BIT DEFAULT 0
	Print 'glb_almacen - cladespro'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardextemp' AND T.column_name = 'idemp') 
begin
	Alter Table alm_kardextemp Add idemp nchar(3) Default '' 
	Print 'alm_kardextemp - idemp'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardextemp' AND T.column_name = 'codcto') 
begin	
	Alter Table alm_kardextemp Add codcto nvarchar(3) Not Null Default '' 
	Print 'alm_kardextemp - codcto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardextemp' AND T.column_name = 'usuconftra') 
begin	
	Alter Table alm_kardextemp Add usuconftra nvarchar(8) Not Null Default '' 
	Print 'alm_kardextemp - usuconftra'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardextemp' AND T.column_name = 'itemfac') 
begin
	Alter Table alm_kardextemp Add itemfac numeric(10) Not Null Default 0
	Print 'alm_kardextemp - itemfac'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardextemp' AND T.COLUMN_name = 'fecsysconftra')
begin
	Alter Table alm_kardextemp Add fecsysconftra date Not Null  Default getdate()
	Print 'alm_kardextemp - fecsysconftra '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name =  'alm_detinvfisicos' AND T.COLUMN_name = 'qtydif')
begin	
	Alter Table alm_detinvfisicos Add qtydif decimal(14,2) Not Null Default '' 
	Print 'alm_detinvfisicos - qtydif '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name =  'alm_detinvfisicos' AND T.COLUMN_name = 'qtydif' and t.DATA_TYPE!='decimal')
begin	
	alter table alm_detinvfisicos alter column qtydif decimal(14,2) Not Null  
	Print 'alm_detinvfisicos - qtydif '
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name =  'alm_variantes' AND T.COLUMN_name = 'valpromvar')
begin
	Alter Table alm_variantes Add valpromvar decimal(14,2) Not Null Default 0 
	Print 'alm_variantes - valpromvar'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'ctagasto')	-- Agregado por Éduar Álvarez - Mayo 14 de 2015.
begin
	Alter Table Alm_Articulos Add ctagasto nVarChar(8) Not Null Default ''
	Print 'Alm_Articulos - ctagasto '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'ctadepre')
begin
	Alter Table Alm_Articulos Add ctadepre nVarChar(8) Not Null Default ''
	Print 'Alm_Articulos - ctadepre'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'depreciable')
begin
	Alter Table Alm_Articulos Add depreciable Bit Not Null Default 0
	Print 'alm_kardextemp - depreciable'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'lugar')
begin
	Alter Table Alm_Articulos Add lugar nVarChar(100) Not Null Default ''
	Print 'Alm_Articulos - lugar'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'responsable')
begin 
	Alter Table Alm_Articulos Add responsable nVarChar(200) Not Null Default ''
	Print 'Alm_Articulos - responsable'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'vidautil')
begin
	Alter Table Alm_Articulos Add vidautil Numeric(2) Not Null Default 0
	Print 'Alm_Articulos - vidautil'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'vlrresidual')
begin
	Alter Table Alm_Articulos Add vlrresidual Numeric(14) Not Null Default 0
	Print 'Alm_Articulos - vlrresidual'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'comiliquida')
begin
	Alter Table Alm_Articulos Add comiliquida Numeric(14) Not Null Default 0
	Print 'Alm_Articulos - comiliquida'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'facconver')
begin
	Alter Table Alm_Articulos Add facconver Numeric(12) Not Null Default 0
	Print 'Alm_Articulos - facconver'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'pedircod')
begin 
	Alter Table Alm_Articulos Add pedircod Bit Not Null Default 0
	Print 'Alm_Articulos - pedircod'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'vidautilniif')
begin
	Alter Table Alm_Articulos Add vidautilniif Numeric(5) Not Null Default 0
	Print 'Alm_Articulos- vidautilniif'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'concepent')
begin 
	Alter Table Alm_Articulos Add concepent nVarChar(200) Not Null Default ''
	Print 'Alm_Articulos - concepent '
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Kardex' AND T.Column_Name = 'DocRel')				-- Éduar Álvarez - Julio 29 de 2015.
begin
	Alter Table Alm_Kardex Add DocRel nVarChar(13) NOT NULL DEFAULT ''
	Print 'Alm_Kardex - DocRel'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_InvFisicos' AND T.Column_Name = 'estado')			-- Éduar Álvarez - Agosto 12 de 2015.
begin
	Alter Table Alm_InvFisicos Add estado Char(1) NOT NULL DEFAULT ''
	Print 'Alm_Kardex - estado'
end
Go

IF NOT EXISTS(Select * From Information_Schema.Columns AS T Where T.Table_Name = 'Alm_Articulos' AND T.Column_Name = 'costofijo')
begin
	Alter Table Alm_Articulos Add costofijo Bit NOT NULL DEFAULT 0
	Print 'Alm_Articulos - costofijo'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'Observa' and (T.data_type!='nVarchar' or t.CHARACTER_MAXIMUM_LENGTH!=250)) 
begin
	Alter Table alm_kardex alter column observa nvarchar(250) not null 
	Print 'alm_kardex - Observa - Cambio de columna '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'codctogru') 
begin 	
	Alter Table Alm_Grupos Add codctogru nvarchar(3) not null default ''
	Print 'alm_grupos - codctogru'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name =  'Alm_Inventario' AND T.COLUMN_name = 'NoApliDcto')	-- Éduar Álvarez - Octubre 6 de 2015.
begin
	Alter Table Alm_Inventario Add NoApliDcto Bit Not Null Default 0 
	Print 'Alm_Inventario - NoApliDcto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name =  'Alm_grupos' AND T.COLUMN_name = 'CtaCmpVtAnul')	-- Lissette Castro - Octubre 7 de 2015.
begin
	Alter Table Alm_grupos Add CtaCmpVtAnul nvarchar(8) Not Null Default '' 
	Print 'Alm_grupos - CtaCmpVtAnul'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'codctogru') 
begin
	Alter Table alm_kardex Add codctogru nvarchar(3) not null default ''
	Print 'alm_kardex - codctogru'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'codctogru') 
begin 
	Alter Table Alm_Grupos Add codctogru nvarchar(3) not null default ''
	Print 'alm_grupos - codctogru'
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'codtalla' and (T.data_type!='nVarchar' or t.CHARACTER_MAXIMUM_LENGTH!=4)) 
begin
	Alter Table alm_articulos alter column  codtalla nvarchar(4)
	Print 'alm_articulos - codtalla'  --alter column 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'IvaArtCto') 
begin
	Alter Table alm_Inventario Add IvaArtCto decimal(6, 2) not null default 0
	Print 'alm_Inventario - IvaArtCto'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'RifaArt') 
begin
	Alter Table alm_articulos Add RifaArt bit not null default 0
	Print 'alm_articulos - RifaArt'
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'NroCopias') 
begin 
	Alter Table alm_grupos Add NroCopias decimal(10) not null CONSTRAINT DF_alm_grupos_NroCopias default 0
	Print 'alm_grupos - NroCopias'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'paga') 
begin 
	Alter Table alm_promo Add paga int not null default 0
	Print 'alm_promo - paga'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'lleva') 
begin 
	Alter Table alm_promo Add lleva int not null default 0
	Print 'alm_promo - lleva'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DctoHasta') 
begin 
	Alter Table alm_promo Add DctoHasta bit  not null default 0
	Print 'alm_promo - DctoHasta'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Articulos' AND T.column_name = 'codtar') 
begin 
	Alter Table alm_Articulos Add codtar nvarchar(2)  not null default ''
	Print 'alm_Articulos - codtar'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Articulos' AND T.column_name = 'codtemp') 
begin 
	Alter Table alm_Articulos Add codtemp nvarchar(4)   not null default ''
	Print 'alm_Articulos - codtemp'
end 
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Promo' AND T.column_name = 'Nombre') 
begin 
	Alter Table Alm_Promo Add Nombre nvarchar(50)   not null default ''
	Print 'Alm_Promo - Nombre'
end 
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'ubic' and  t.CHARACTER_MAXIMUM_LENGTH!=100) 
begin
	Alter Table alm_articulos alter column ubic nvarchar(100) not null 
	Print 'alm_articulos - ubic - Cambio de columna '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Grupos' AND T.column_name = 'VerinfSP') 
begin 
	Alter Table Alm_Grupos Add VerinfSP bit  not null default 0
	Print 'Alm_Grupos - VerinfSP'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Promo' AND T.column_name = 'Cupon') 
begin 
	Alter Table Alm_Promo Add Cupon bit  not null default 0
	Print 'Alm_Promo - Cupon' --junio 13 de 2016 si aplica para cupones que le dan a los clientes 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'item') 
begin 
	Alter Table alm_promodet Add item decimal(10)  not null default 0
	Print 'alm_promodet - item' -- junio 13 de 2016 para enumerar los registros 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'ArtPaga') 
begin 
	Alter Table alm_promodet Add ArtPaga bit  not null default 0
	Print 'alm_promodet - ArtPaga' -- junio 13 de 2016 para clasificar los articulos con este campo se compra y los del descuento son los artlleva
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'Artlleva') 
begin 
	Alter Table alm_promodet Add Artlleva bit  not null default 0
	Print 'alm_promodet - Artlleva' -- junio 13 de 2016 para clasificar los articulos los que tienen ese campo son los que llevan la promo.
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DLun') 
begin 
	Alter Table alm_promo Add DLun bit  not null default 0
	Print 'alm_promo - DLun' -- julio 28 de 2016 Para guardar los dias de la promo desde el lunes hasta el dom. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DMar') 
begin 
	Alter Table alm_promo Add DMar bit  not null default 0
	Print 'alm_promo - DMar' -- julio 28 de 2016 Para guardar los dias de la promo desde el lunes hasta el dom. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DMie') 
begin 
	Alter Table alm_promo Add DMie bit  not null default 0
	Print 'alm_promo - DMie' -- julio 28 de 2016 Para guardar los dias de la promo desde el lunes hasta el dom. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DJue') 
begin 
	Alter Table alm_promo Add DJue bit  not null default 0
	Print 'alm_promo - DJue' -- julio 28 de 2016 Para guardar los dias de la promo desde el lunes hasta el dom. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DVie') 
begin 
	Alter Table alm_promo Add DVie bit  not null default 0
	Print 'alm_promo - DVie' -- julio 28 de 2016 Para guardar los dias de la promo desde el lunes hasta el dom. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DSab') 
begin 
	Alter Table alm_promo Add DSab bit  not null default 0
	Print 'alm_promo - DSab' -- julio 28 de 2016 Para guardar los dias de la promo desde el lunes hasta el dom. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'DDom') 
begin 
	Alter Table alm_promo Add DDom bit  not null default 0
	Print 'alm_promo - DDom' -- julio 28 de 2016 Para guardar los dias de la promo desde el lunes hasta el dom. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'CodTarjeta') 
begin 
	Alter Table alm_promo Add CodTarjeta nVarchar(4)  not null default ''
	Print 'alm_promo - CodTarjeta' -- julio 28 de 2016 Para guardar El codigo de tarjeta. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'TopeVtamin') 
begin 
	Alter Table alm_promo Add TopeVtamin decimal(14,0)  not null default 0
	Print 'alm_promo - TopeVtamin' -- julio 28 de 2016 Para guardar tope de venta min para una promo. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'TopeVtamax') 
begin 
	Alter Table alm_promo Add TopeVtamax decimal(14,0)  not null default 0
	Print 'alm_promo - TopeVtamax' -- julio 28 de 2016 Para guardar tope de venta min para una promo. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'VlrDcto') 
begin 
	Alter Table alm_promo Add VlrDcto decimal(14,0)  not null default 0
	Print 'alm_promo - VlrDcto' -- julio 29 de 2016 Para guardar Valor de Descuento. Ing. Lissette 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'Unavezxcli') 
begin 
	Alter Table alm_promo Add Unavezxcli bit  not null default 0
	Print 'alm_promo - Unavezxcli' -- agosto 09 de 2016 Si la promo aplica una vez por cliente
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promoter' AND T.column_name = 'unavez') 
begin 
	Alter Table alm_promoter Add unavez bit  not null default 0
	Print 'alm_promoter - unavez' -- agosto 09 de 2016 Si la promo aplica una vez por cliente con este campo en 1 ya sabemos que se aplico 
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_puntos' AND T.column_name = 'porcentaje') 
begin 
	Alter Table alm_puntos Add porcentaje numeric(15)   not null default 0
	Print 'alm_puntos - porcentaje'  --ing. Lissette 20/08/2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_globalpuntos' AND T.column_name = 'porcentaje') 
begin 
	Alter Table alm_globalpuntos Add porcentaje numeric(15)   not null default 0
	Print 'alm_globalpuntos - porcentaje'  --ing. Lissette 20/08/2016
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Kardex'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table Alm_Kardex Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'Alm_Kardex - modificadoc'  -- ing. Lissette  16/09/2016  cuando se modifique un documento este campo se ira incrementado de 1 en 1, por documento. 
end
Go


IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name =  'alm_variantes' AND T.COLUMN_name = 'citem' AND t.DATA_TYPE = 'NVARCHAR')
begin	
	alter table alm_variantes alter column citem NUMERIC(4) not null 
	Print 'alm_variantes - citem '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Kardex'  AND T.column_name = 'docdelete') 
begin 
	Alter Table Alm_Kardex Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'Alm_Kardex - docdelete'  -- ing. Lissette  13/10/2016  cuando se modifique un documento este campo cambiara a 1 para saber que fue elimando
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_KardexTemp'  AND T.column_name = 'docdelete') 
begin 
	Alter Table Alm_KardexTemp Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'Alm_KardexTemp - docdelete'  -- ing. Lissette  18/10/2016  cuando se modifique un documento este campo cambiara a 1 para saber que fue elimando
end
Go


IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'QtyArt' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_kardex ALTER COLUMN QtyArt decimal(18,4) 
	Print 'alm_kardex - QtyArt - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'cosart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_kardex ALTER COLUMN cosart decimal(18,4) 
	Print 'alm_kardex - cosart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'valart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_kardex ALTER COLUMN valart decimal(18,4) 
	Print 'alm_kardex - valart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'totart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_kardex ALTER COLUMN totart decimal(18,4) 
	Print 'alm_kardex - totart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'netart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_kardex ALTER COLUMN netart decimal(18,4) 
	Print 'alm_kardex - netart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'qtypro' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_kardex ALTER COLUMN qtypro decimal(18,4) 
	Print 'alm_kardex - qtypro - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'qtyfac' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_kardex ALTER COLUMN qtyfac decimal(18,4) 
	Print 'alm_kardex - qtyfac - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'valprom' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN valprom decimal(18,4) 
	Print 'alm_inventario - valprom - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'ucoart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN ucoart decimal(18,4) 
	Print 'alm_inventario - ucoart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'pvdart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN pvdart decimal(18,4) 
	Print 'alm_inventario - pvdart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'pveart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN pveart decimal(18,4) 
	Print 'alm_inventario - pveart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'pvmart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN pvmart decimal(18,4) 
	Print 'alm_inventario - pvmart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'pvcart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN pvcart decimal(18,4) 
	Print 'alm_inventario - pvcart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'pvaart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN pvaart decimal(18,4) 
	Print 'alm_inventario - pvaart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'pvbart' and T.NUMERIC_PRECISION!=18 ) 
begin 
	Alter Table alm_inventario ALTER COLUMN pvbart decimal(18,4) 
	Print 'alm_inventario - pvbart - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_variantes'  AND T.column_name = 'item') 
begin 
	Alter Table alm_variantes Add item  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_variantes - item'  -- ing. Lissette  08/03/2017  
end
Go

---Cambio JHONATAN 24/11/2022 "The object 'PK_alm_kardex' is dependent on column 'itemfac'."---

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex'  AND T.column_name = 'itemfac' and t.NUMERIC_PRECISION!=10) 
begin  
   ALTER TABLE alm_kardex 
   DISABLE CHANGE_TRACKING; 

   alter table alm_kardex drop constraint PK_alm_kardex; 

   
   DROP INDEX [Alm_Kardex_documento] ON [dbo].[alm_kardex]

   Alter Table alm_kardex alter column itemfac  numeric(10) NOT NULL
   Print 'alm_kardex - itemfac'  -- ing. Jesus (aumentar item para cantidad de articulos en comanda)  10/03/2017  

 --SE AGREGA LOS OTROS ALTER PARA CREAR LAS LLAVES COMO NO NULL --JHONATAN 
   Alter Table alm_kardex alter column idemp  nvarchar(3) NOT NULL
   Alter Table alm_kardex alter column codcto  nvarchar(3) NOT NULL
   Alter Table alm_kardex alter column numcon  nvarchar(8) NOT NULL
   Alter Table alm_kardex alter column codcon  nvarchar(2) NOT NULL
   Alter Table alm_kardex alter column codart  nvarchar(10) NOT NULL

ALTER TABLE [dbo].[alm_kardex] ADD  CONSTRAINT [PK_alm_kardex] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[numcon] ASC,
	[codcon] ASC,
	[codart] ASC,
	[itemfac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [Alm_Kardex_documento] ON [dbo].[alm_kardex]
(
	[idemp] ASC,
	[codcto] ASC,
	[numcon] ASC,
	[codcon] ASC
)
INCLUDE([itemfac]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 ALTER TABLE alm_kardex
   ENABLE CHANGE_TRACKING;
end
Go


IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex'  AND T.column_name = 'itemprefac') 
begin 
	Alter Table alm_kardex alter column itemprefac  numeric(14,0) 
	Print 'alm_kardex - itemprefac'  -- ing. Jesus (aumentar item para cantidad de articulos en comanda)  10/03/2017  
end
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex'  AND T.column_name = 'ordcomp') 
begin 
	Alter Table alm_kardex add  ordcomp  nvarchar(15)  NOT NULL default ''
	Print 'alm_kardex - ordcomp'  -- ing.Lis para guardar los datos de la orden de compra  06/06/2017
end
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'qtysis' and T.NUMERIC_PRECISION!=8 ) 
begin 
	Alter Table alm_detinvfisicos ALTER COLUMN qtysis decimal(14,4) 
	Print 'alm_detinvifisicos - qtysis - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'qtyfis' and T.NUMERIC_PRECISION!=14 ) 
begin 
	Alter Table alm_detinvfisicos ALTER COLUMN qtyfis decimal(14,4) 
	Print 'alm_detinvfisicos - qtyfis - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'qtydif' and T.NUMERIC_PRECISION!=14 ) 
begin 
	Alter Table alm_detinvfisicos ALTER COLUMN qtydif decimal(14,4) 
	Print 'alm_detinvifisicos - qtydif - aumento de dicimales'  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_alimfisico' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_alimfisico ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_alimfisico - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_alimfisico' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_alimfisico ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_alimfisico - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_alimfisico' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_alimfisico ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_alimfisico - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'codusumod' )
begin 
	Alter Table alm_articulos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_articulos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'fecsys'  ) 
begin 
	Alter Table alm_articulos ADD fecsys  DATETIME not null DEFAULT GETDATE()
	Print 'alm_articulos - fecsys '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_accesorio'  AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_accesorio Add docdelete  bit NOT NULL DEFAULT 0
	Print 'alm_accesorio - docdelete'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_alimfisico'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table Alm_alimfisico Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'Alm_alimfisico - modificadoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_alimfisico'  AND T.column_name = 'docdelete') 
begin 
	Alter Table Alm_alimfisico Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'Alm_alimfisico - docdelete'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos'  AND T.column_name = 'docdelete') 
begin 
	Alter Table Alm_articulos Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'Alm_articulos - docdelete'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_codbarras'  AND T.column_name = 'docdelete') 
begin 
	Alter Table Alm_codbarras Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'Alm_codbarras - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_accesorio' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_accesorio  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_accesorio  - docdelete'  
end
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_accesorio' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_accesorio ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_accesorio - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_accesorio' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_accesorio ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_accesorio - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_accesorio' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_accesorio ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_accesorio - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_accesorio' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_accesorio ADD codusu NVARCHAR(15) not null DEFAULT ''
	Print 'alm_accesorio - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_accesorio' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_accesorio  Add docdelete  bit NOT NULL DEFAULT 0
	Print 'alm_accesorio  - docdelete'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_codbarras' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_codbarras ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_codbarras - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_codbarras' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_codbarras ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_codbarras - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_codbarras' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_codbarras ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_codbarras - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_codbarras' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_codbarras ADD codusu NVARCHAR(15) not null DEFAULT ''
	Print 'alm_codbarras - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_codbarras' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_codbarras  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_codbarras  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_codbarras'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_codbarras Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_codbarras - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_color' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_color ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_color - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_color' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_color ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_color - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_color' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_color ADD codusumod NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_color - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_color' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_color ADD codusu NVARCHAR(15) not null DEFAULT ''
	Print 'alm_color - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_color' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_color  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_color  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_color'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_color Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_color - modificadoc'  
end
Go

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_costos ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_costos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_costos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_costos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_costos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_costos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_costos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_costos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_costos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_costos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_costos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_costos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_costos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detarifas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_detarifas ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_detarifas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detarifas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_detarifas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_detarifas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detarifas' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_detarifas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_detarifas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detarifas' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_detarifas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_detarifas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detarifas' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_detarifas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_detarifas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detarifas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_detarifas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_detarifas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_detinvfisicos ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_detinvfisicos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_detinvfisicos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_detinvfisicos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_detinvfisicos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_detinvfisicos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_detinvfisicos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_detinvfisicos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_detinvfisicos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_detinvfisicos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_detinvfisicos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_detinvfisicos - modificadoc'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos'  AND T.column_name = 'codcto') 
begin 
	Alter Table alm_detinvfisicos Add codcto  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'alm_detinvfisicos - codcto'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos'  AND T.column_name = 'idemp') 
begin 
	Alter Table alm_detinvfisicos Add idemp  nvarchar(3)  NOT NULL DEFAULT ''
	Print 'alm_detinvfisicos - idemp'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_invfisicos ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_invfisicos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_invfisicos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_invfisicos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_invfisicos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_invfisicos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_invfisicos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_invfisicos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_invfisicos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_invfisicos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_invfisicos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_invfisicos - modificadoc'  
end
Go

IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_genero' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_genero ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_genero - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_genero' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_genero ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_genero - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_genero' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_genero ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_genero - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_genero' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_genero ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_genero - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_genero' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_genero  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_genero  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_genero'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_genero Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_genero - modificadoc'  
end
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_grupos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_grupos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_grupos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_grupos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_grupos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_grupos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_grupos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_grupos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_inventario ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_inventario - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_inventario ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_inventario - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_inventario ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_inventario - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_inventario ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_inventario - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_inventario  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_inventario  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_inventario Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_inventario - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invtallas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_invtallas ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_invtallas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invtallas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_invtallas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_invtallas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invtallas' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_invtallas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_invtallas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invtallas' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_invtallas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_invtallas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invtallas' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_invtallas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_invtallas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invtallas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_invtallas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_invtallas - modificadoc'  
end
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_kardex ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_kardex - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_kardex ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_kardex - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_kardex ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_kardex - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_kardex  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_kardex  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_kardex Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_kardex - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_karreftemp ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_karreftemp - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_karreftemp ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_karreftemp - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_karreftemp ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_karreftemp - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_karreftemp ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_karreftemp - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_karreftemp  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_karreftemp  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_karreftemp Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_karreftemp - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karref' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_karref ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_karref - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karref' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_karref ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_karref - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karref' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_karref ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_karref - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karref' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_karref ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_karref - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karref' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_karref  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_karref  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karref'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_karref Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_karref - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_karreftemp ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_karreftemp - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_karreftemp ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_karreftemp - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_karreftemp ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_karreftemp - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_karreftemp ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_karreftemp - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_karreftemp  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_karreftemp  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_karreftemp'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_karreftemp Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_karreftemp - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kartallas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_kartallas ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_kartallas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kartallas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_kartallas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_kartallas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kartallas' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_kartallas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_kartallas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kartallas' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_kartallas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_kartallas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kartallas' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_kartallas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_kartallas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kartallas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_kartallas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_kartallas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_marcas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_marcas ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_marcas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_marcas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_marcas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_marcas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_marcas' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_marcas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_marcas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_marcas' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_marcas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_marcas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_marcas' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_marcas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_marcas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_marcas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_marcas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_marcas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_lineas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_lineas ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_lineas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_lineas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_lineas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_lineas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_lineas' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_lineas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_lineas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_lineas' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_lineas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_lineas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_lineas' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_lineas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_lineas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_lineas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_lineas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_lineas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_material' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_material ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_material - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_material' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_material ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_material - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_material' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_material ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_material - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_material' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_material ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_material - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_material' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_material  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_material  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_material'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_material Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_material - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_planes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_planes ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_planes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_planes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_planes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_planes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_planes' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_planes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_planes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_planes' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_planes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_planes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_planes' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_planes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_planes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_planes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_planes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_planes - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precios' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_precios ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_precios - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precios' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_precios ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_precios - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precios' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_precios ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_precios - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precios' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_precios ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_precios - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precios' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_precios  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_precios  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precios'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_precios Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_precios - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precund' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_precund ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_precund - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precund' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_precund ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_precund - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precund' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_precund ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_precund - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precund' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_precund ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_precund - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precund' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_precund  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_precund  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_precund'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_precund Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_precund - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_promo ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_promo - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_promo ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_promo - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_promo ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_promo - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_promo ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_promo - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_promo  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_promo  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_promo Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_promo - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promoTer' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_promoTer ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_promoTer - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promoTer' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_promoTer ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_promoTer - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promoTer' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_promoTer ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_promoTer - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promoTer' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_promoTer ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_promoTer - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promoTer' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_promoTer  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_promoTer  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promoTer'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_promoTer Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_promoTer - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_promodet ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_promodet - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_promodet ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_promodet - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_promodet ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_promodet - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_promodet ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_promodet - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_promodet  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_promodet  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promodet'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_promodet Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_promodet - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_propiedad' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_propiedad ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_propiedad - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_propiedad' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_propiedad ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_propiedad - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_propiedad' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_propiedad ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_propiedad - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_propiedad' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_propiedad ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_propiedad - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_propiedad' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_propiedad  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_propiedad  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_propiedad'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_propiedad Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_propiedad - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_puntos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_puntos ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_puntos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_puntos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_puntos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_puntos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_puntos' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_puntos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_puntos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_puntos' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_puntos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_puntos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_puntos' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_puntos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_puntos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_puntos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_puntos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_puntos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_redepuntos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_redepuntos ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_redepuntos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_redepuntos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_redepuntos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_redepuntos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_redepuntos' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_redepuntos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_redepuntos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_redepuntos' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_redepuntos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_redepuntos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_redepuntos' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_redepuntos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_redepuntos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_redepuntos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_redepuntos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_redepuntos - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_referencia' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_referencia ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_referencia - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_referencia' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_referencia ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_referencia - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_referencia' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_referencia ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_referencia - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_referencia' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_referencia ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_referencia - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_referencia' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_referencia  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_referencia  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_referencia'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_referencia Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_referencia - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_serialvence' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_serialvence ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_serialvence - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_serialvence' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_serialvence ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_serialvence - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_serialvence' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_serialvence ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_serialvence - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_serialvence' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_serialvence ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_serialvence - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_serialvence' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_serialvence  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_serialvence  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_serialvence'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_serialvence Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_serialvence - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_tallas ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_tallas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_tallas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_tallas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallas' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_tallas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_tallas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallas' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_tallas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_tallas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallas' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_tallas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_tallas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_tallas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_tallas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallasart' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_tallasart ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_tallasart - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallasart' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_tallasart ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_tallasart - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallasart' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_tallasart ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_tallasart - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallasart' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_tallasart ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_tallasart - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallasart' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_tallasart  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_tallasart  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tallasart'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_tallasart Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_tallasart - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_target' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_target ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_target - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_target' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_target ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_target - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_target' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_target ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_target - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_target' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_target ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_target - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_target' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_target  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_target  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_target'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_target Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_target - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tarifas' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_tarifas ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_tarifas - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tarifas' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_tarifas ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_tarifas - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tarifas' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_tarifas ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_tarifas - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tarifas' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_tarifas ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_tarifas - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tarifas' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_tarifas  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_tarifas  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tarifas'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_tarifas Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_tarifas - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_temporada' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_temporada ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_temporada - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_temporada' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_temporada ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_temporada - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_temporada' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_temporada ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_temporada - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_temporada' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_temporada ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_temporada - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_temporada' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_temporada  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_temporada  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_temporada'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_temporada Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_temporada - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoin' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_tipoin ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_tipoin - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoin' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_tipoin ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_tipoin - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoin' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_tipoin ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_tipoin - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoin' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_tipoin ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_tipoin - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoin' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_tipoin  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_tipoin  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoin'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_tipoin Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_tipoin - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoplato' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_tipoplato ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_tipoplato - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoplato' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_tipoplato ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_tipoplato - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoplato' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_tipoplato ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_tipoplato - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoplato' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_tipoplato ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_tipoplato - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoplato' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_tipoplato  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_tipoplato  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tipoplato'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_tipoplato Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_tipoplato - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tips' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_tips ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_tips - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tips' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_tips ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_tips - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tips' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_tips ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_tips - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tips' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_tips ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_tips - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tips' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_tips  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_tips  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_tips'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_tips Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_tips - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_unidades' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_unidades ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_unidades - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_unidades' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_unidades ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_unidades - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_unidades' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_unidades ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_unidades - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_unidades' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_unidades ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_unidades - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_unidades' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_unidades  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_unidades  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_unidades'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_unidades Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_unidades - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_variantes' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_variantes ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_variantes - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_variantes' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_variantes ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_variantes - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_variantes' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_variantes ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_variantes - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_variantes' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_variantes ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_variantes - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_variantes' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_variantes  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_variantes  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_variantes'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_variantes Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_variantes - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vence' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_vence ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_vence - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vence' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_vence ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_vence - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vence' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_vence ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_vence - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vence' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_vence ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_vence - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vence' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_vence  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_vence  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vence'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_vence Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_vence - modificadoc'  
end
Go
IF  not eXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vlrequipos' AND T.column_name = 'fecsys' ) 
begin 
	Alter Table alm_vlrequipos ADD fecsys datetime not null DEFAULT getdate()
	Print 'alm_vlrequipos - fecsys s'  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vlrequipos' AND T.column_name = 'servidor' ) 
begin 
	Alter Table alm_vlrequipos ADD servidor NVARCHAR(60) not null DEFAULT ''
	Print 'alm_vlrequipos - servidor '  -- Ing. Lissette 08 feb 2017
end 
Go
IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vlrequipos' AND T.column_name = 'codusumod') 
begin 
	Alter Table alm_vlrequipos ADD codusumod NVARCHAR(15) not null DEFAULT ''
	Print 'alm_vlrequipos - codusumod '  -- Ing. Lissette 08 feb 2017
end 
Go

IF  not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vlrequipos' AND T.column_name = 'codusu') 
begin 
	Alter Table alm_vlrequipos ADD codusu NVARCHAR(15)  not null DEFAULT ''
	Print 'alm_vlrequipos - codusu '  -- Ing. Lissette 08 feb 2017
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vlrequipos' AND T.column_name = 'docdelete') 
begin 
	Alter Table alm_vlrequipos  Add docdelete  bit  NOT NULL DEFAULT 0
	Print 'alm_vlrequipos  - docdelete'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vlrequipos'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_vlrequipos Add modificadoc  numeric(10)  NOT NULL DEFAULT 0
	Print 'alm_vlrequipos - modificadoc'  
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_promo'  AND T.column_name = 'codfor') 
begin 
	Alter Table alm_promo Add codfor  nvarchar(2)  NOT NULL DEFAULT ''
	Print 'alm_promo - codfor'  
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_conteoinv' AND T.column_name = 'codmar') 
begin 
	Alter Table alm_conteoinv Add codmar nvarchar(3) default ''
	Print 'alm_conteoinv - codmar'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_conteoinv' AND T.column_name = 'fecven') 
begin 
	Alter Table alm_conteoinv Add fecven DATE
	Print 'alm_conteoinv - fecven'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_conteoinv' AND T.column_name = 'item') 
begin 
	Alter Table alm_conteoinv Add item int default 0
	Print 'alm_conteoinv - item'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_conteoinv' AND T.column_name = 'lote') 
begin 
	Alter Table alm_conteoinv Add lote nvarchar(18) default ''
	Print 'alm_conteoinv - lote'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_conteoinv' AND T.column_name = 'undart') 
begin 
	Alter Table alm_conteoinv Add undart nvarchar(5) default ''
	Print 'alm_conteoinv - undart'
end
Go
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'domisticker') 
begin 
	Alter Table alm_grupos Add domisticker bit  NOT NULL DEFAULT 0
	Print 'alm_grupos - domisticker'
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'impcomandar') 
begin 
	Alter Table alm_grupos Add impcomandar bit  NOT NULL DEFAULT 0
	Print 'alm_grupos - impcomandar'  -- Ing. Lissette si el grupo debe pedir imperosa al comandar
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'vidautil') 
begin 
	Alter Table alm_articulos alter column  vidautil numeric(5)  
	Print 'alm_articulos - vidautil'  -- Ing. Lissette 06/12/2017 para aumentar elcampo de vida util 
end
Go 

IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'alm_inventario'  AND T.column_name = 'caninv' and t.data_type!='decimal' ) 
BEGIN
	DECLARE @Constraint nvarchar(100)
	DECLARE @Sql nvarchar(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='alm_inventario' AND tc.name='caninv')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='alm_inventario' AND tc.name='caninv'
		
		SET @sql='ALTER TABLE dbo.alm_inventario DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.alm_inventario ALTER COLUMN caninv decimal(18,4)
		SET @sql='ALTER TABLE dbo.alm_inventario ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [caninv ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE alm_inventario ALTER COLUMN caninv decimal(18,4)
		Print 'alm_inventario - caninv'  --Ing. Lis 01/02/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'Impoconsumocero') 
begin 
	Alter Table alm_articulos Add Impoconsumocero numeric(1)  NOT NULL DEFAULT 0
	Print 'alm_articulos - Impoconsumocero'  -- Ing. Lissette 09/02/2018  para sabase si es exento excluido del impoconsumo. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'UltQtyCmp') 
begin 
	Alter Table alm_inventario Add UltQtyCmp decimal(18,4)  NOT NULL DEFAULT 0
	Print 'alm_inventario - UltQtyCmp'  -- Ing. Lissette 09/03/2018  registro de ultima cantidad comprada. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Articulos' AND T.column_name = 'UltQtyCmp') 
begin 
	Alter Table Alm_Articulos Add UltQtyCmp decimal(18,4)  NOT NULL DEFAULT 0
	Print 'Alm_Articulos - UltQtyCmp'  -- Ing. Lissette 09/03/2018  registro de ultima cantidad comprada. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_kardex' AND T.column_name = 'descrip') 
begin 
	Alter Table Alm_kardex Add descrip varchar(max)  NOT NULL DEFAULT ''
	Print 'Alm_kardex - descrip'  -- Ing. Lissette 12/03/2018  registro de lotes y vencimiento
end
Go

--CAMBIO DE JHONATAN "La columna ya tiene un DEFAULT vinculado a ella".
--ALTER TABLE dbo.alm_vence ADD  CONSTRAINT DF_Alm_Vence_qtyfac  DEFAULT (0) FOR [qtyfra]
--ALTER TABLE dbo.alm_vence ADD  CONSTRAINT DF_Alm_Vence_qtyven  DEFAULT (0) FOR [qtyven]
go 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_vence' AND T.column_name = 'item') 
begin 
	Alter Table Alm_vence Add item numeric(15)  NOT NULL DEFAULT 0
	Print 'Alm_vence - item'  -- Ing. Lissette 12/03/2018  registro de lotes y vencimiento
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_artxlote' AND T.COLUMN_name = 'fecsys')
begin
	Alter Table alm_artxlote Add fecsys datetime Not Null  Default getdate()
	Print 'alm_artxlote - fecsys '  --Ing. Lissette 16/03/2018  registro de lotes y vencimiento
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_vence' AND T.COLUMN_name = 'fecsys')
begin
	Alter Table alm_vence Add fecsys datetime Not Null  Default getdate()
	Print 'alm_vence - fecsys '--Ing. Lissette 16/03/2018  registro de lotes y vencimiento
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_invfisicos' AND T.COLUMN_name = 'numinv')
begin
	Alter Table Alm_invfisicos Add numinv nvarchar(8)  Not Null  Default ''
	Print 'Alm_invfisicos - numinv '--Ing. Lissette 16/03/2018  consecutivo de inventario. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.COLUMN_name = 'frcsis')
begin
	Alter Table alm_detinvfisicos Add frcsis decimal(18,4)  Not Null  Default 0
	Print 'alm_detinvfisicos - frcsis '--Ing. Lissette 19/03/2018  fracciones del sistema
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.COLUMN_name = 'frcfis')
begin
	Alter Table alm_detinvfisicos Add frcfis decimal(18,4)  Not Null  Default 0
	Print 'alm_detinvfisicos - frcfis '--Ing. Lissette 19/03/2018  fracciones del fisicas
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.COLUMN_name = 'frcdif')
begin
	Alter Table alm_detinvfisicos Add frcdif decimal(18,4)  Not Null  Default 0
	Print 'alm_detinvfisicos - frcdif '--Ing. Lissette 19/03/2018  fracciones difetencias 
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'alm_kardex' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table alm_kardex Add codusuanul nVarChar(100) Not Null Default ''
	Print 'alm_kardex - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'alm_kardex' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table alm_kardex Add fecsysanul DATETIME Not Null Default ''
	Print 'alm_kardex - fecsysanul'
end
GO
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'alm_kardextemp' AND T.column_name = 'codusuanul')	
begin 	
	Alter Table alm_kardextemp Add codusuanul nVarChar(100) Not Null Default ''
	Print 'alm_kardextemp - codusuanul'
end
Go
IF NOT EXISTS (Select Table_name From Information_Schema.Columns AS T Where T.Table_name = 'alm_kardextemp' AND T.column_name = 'fecsysanul')	
begin 	
	Alter Table alm_kardextemp Add fecsysanul DATETIME Not Null Default ''
	Print 'alm_kardextemp - fecsysanul'
end
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_detinvfisicos' AND T.COLUMN_name = 'preart')
begin
	Alter Table alm_detinvfisicos Add preart numeric(15)  Not Null  Default 0
	Print 'alm_detinvfisicos - preart '--Ing. Lissette 19/03/2018  fracciones difetencias 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_detinvfisicos' AND T.COLUMN_name = 'numinv')
begin
	Alter Table Alm_detinvfisicos Add numinv nvarchar(8)  Not Null  Default ''
	Print 'Alm_detinvfisicos - numinv '--Ing. Lissette 11/04/2018  consecutivo de inventario. 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.COLUMN_name = 'redepuntos')
begin
	Alter Table alm_grupos Add redepuntos bit  Not Null  Default 0
	Print 'alm_grupos - redepuntos '
end
Go
----------------------------------Actualizado en el esquema hasta aqui------------------26/07/2018

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'uzona')
begin
	Alter Table alm_articulos Add uzona nvarchar(3)  Not Null  Default ''
	Print 'alm_articulos - uzona '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'upasillo')
begin
	Alter Table alm_articulos Add upasillo nvarchar(3)  Not Null  Default ''
	Print 'alm_articulos - upasillo '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'uestante')
begin
	Alter Table alm_articulos Add uestante nvarchar(3)  Not Null  Default ''
	Print 'alm_articulos - uestante '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'ucasilla')
begin
	Alter Table alm_articulos Add ucasilla nvarchar(3)  Not Null  Default ''
	Print 'alm_articulos - ucasilla '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'uzona')
begin
	Alter Table alm_invfisicos Add uzona nvarchar(3)  Not Null  Default ''
	Print 'alm_invfisicos - uzona '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'upasillo')
begin
	Alter Table alm_invfisicos Add upasillo nvarchar(3)  Not Null  Default ''
	Print 'alm_invfisicos - upasillo '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'uestante')
begin
	Alter Table alm_invfisicos Add uestante nvarchar(3)  Not Null  Default ''
	Print 'alm_invfisicos - uestante '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'ucasilla')
begin
	Alter Table alm_invfisicos Add ucasilla nvarchar(3)  Not Null  Default ''
	Print 'alm_invfisicos - ucasilla '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'uzona' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_invfisicos alter column uzona nvarchar(3)  Not Null  
	Print 'alm_invfisicos - uzona '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'upasillo' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_invfisicos alter column upasillo nvarchar(3)  Not Null  
	Print 'alm_invfisicos - upasillo '
end
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'uestante' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_invfisicos alter column uestante nvarchar(3)  Not Null  
	Print 'alm_invfisicos - uestante '
end
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisicos' AND T.COLUMN_name = 'ucasilla' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_invfisicos alter column ucasilla nvarchar(3)  Not Null  
	Print 'alm_invfisicos - ucasilla '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'uzona' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_articulos alter column uzona nvarchar(3)  Not Null  
	Print 'alm_articulos - uzona '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'upasillo' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_articulos alter column upasillo nvarchar(3)  Not Null  
	Print 'alm_articulos - upasillo '
end
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'uestante' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_articulos alter column uestante nvarchar(3)  Not Null  
	Print 'alm_articulos - uestante '
end
Go
IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'ucasilla' and t.CHARACTER_MAXIMUM_LENGTH!=3)
begin
	Alter Table alm_articulos alter column ucasilla nvarchar(3)  Not Null  
	Print 'alm_articulos - ucasilla '
end
Go
--PriscyReales
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_conteoinv'  AND T.column_name = 'modificadoc') 
begin 
	Alter Table alm_conteoinv Add modificadoc  numeric(5)  NOT NULL DEFAULT 0
	Print 'Alm_Kardex - modificadoc'  
end
Go

--SEGUNDO CAMBIO DE JHONATAN 24/11/2022 "El objeto 'PK_alm_propiedad' depende de la columna 'codprop'."
 ALTER TABLE alm_propiedad  DISABLE CHANGE_TRACKING; 
 alter table alm_propiedad drop constraint PK_alm_propiedad; 
ALTER TABLE alm_propiedad alter column codprop NVARCHAR(2) NOT NULL

ALTER TABLE [dbo].[alm_propiedad] ADD  CONSTRAINT [PK_alm_propiedad] PRIMARY KEY CLUSTERED 
(
	[codprop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE alm_propiedad
   ENABLE CHANGE_TRACKING;
GO
----aqui termina el segundo cambio

IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'alm_artxlote' and COLUMN_NAME='servidor' )
BEGIN
	ALTER TABLE  alm_artxlote ADD  servidor VARCHAR(60) NOT NULL CONSTRAINT DF_alm_artxlote_servidor Default ''
	Print 'alm_artxlote - servidor'
END
GO

--TERCER CAMBIO DE JHONATAN 24/11/2022 "The object 'PK_alm_vence' is dependent on column 'codcen'."
 ALTER TABLE alm_vence DISABLE CHANGE_TRACKING; 
alter table alm_vence drop constraint PK_alm_vence; 

ALTER TABLE alm_vence ALTER COLUMN codcen NVARCHAR(3) NOT NULL 
ALTER TABLE alm_vence ALTER COLUMN codart NVARCHAR(10) NOT NULL 
ALTER TABLE alm_vence ALTER COLUMN qtyven decimal(12,2) NOT NULL 
ALTER TABLE alm_vence ALTER COLUMN qtyfra decimal(12,2) NOT NULL
ALTER TABLE alm_vence ALTER COLUMN fecven datetime NOT NULL
ALTER TABLE alm_vence ALTER COLUMN lote NVARCHAR(20) NOT NULL

ALTER TABLE [dbo].[alm_vence] ADD  CONSTRAINT [PK_alm_vence] PRIMARY KEY CLUSTERED 
(
	[codcen] ASC,
	[codart] ASC,
	[codcto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

ALTER TABLE alm_vence
   ENABLE CHANGE_TRACKING;
GO 


IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('alm_vence')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'codcen'
							AND object_id = OBJECT_ID('alm_vence'))				
		)
	BEGIN
		ALTER TABLE alm_vence ADD CONSTRAINT DF_alm_vence_codcen DEFAULT '' FOR codcen
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('alm_vence')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'codart'
							AND object_id = OBJECT_ID('alm_vence'))				
		)
	BEGIN
		ALTER TABLE alm_vence ADD CONSTRAINT DF_alm_vence_codart DEFAULT '' FOR codart
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('alm_vence')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'qtyven'
							AND object_id = OBJECT_ID('alm_vence'))				
		)
	BEGIN
		ALTER TABLE alm_vence ADD CONSTRAINT DF_alm_vence_qtyven DEFAULT 0 FOR qtyven
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('alm_vence')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'qtyfra'
							AND object_id = OBJECT_ID('alm_vence'))				
		)
	BEGIN
		ALTER TABLE alm_vence ADD CONSTRAINT DF_alm_vence_qtyfra DEFAULT 0 FOR qtyfra
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('alm_vence')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'fecven'
							AND object_id = OBJECT_ID('alm_vence'))				
		)
	BEGIN
		ALTER TABLE alm_vence ADD CONSTRAINT DF_alm_vence_fecven DEFAULT GetDate() FOR fecven
END
GO

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('alm_vence')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'lote'
							AND object_id = OBJECT_ID('alm_vence'))				
		)
	BEGIN
		ALTER TABLE alm_vence ADD CONSTRAINT DF_alm_vence_lote DEFAULT '' FOR lote
END
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'alm_color' and COLUMN_NAME='color' and is_nullable ='YES')
BEGIN
	UPDATE alm_color SET color = '' WHERE color IS NULL
	ALTER TABLE alm_color ALTER COLUMN color NVARCHAR(3) NOT NULL
END
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'alm_color' and COLUMN_NAME='nomcol' and is_nullable ='YES')
BEGIN
	ALTER TABLE alm_color ALTER COLUMN nomcol NVARCHAR(30) NOT NULL
END
GO

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardextemp' AND T.COLUMN_name = 'observa' and t.CHARACTER_MAXIMUM_LENGTH!=250)
begin
	Alter Table alm_kardextemp alter column observa nvarchar(250)  Not Null  
	Print 'alm_kardextemp - observa '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_marcas' AND T.COLUMN_name = 'codmar' and t.CHARACTER_MAXIMUM_LENGTH!=4)
begin
	Alter Table alm_marcas alter column codmar nvarchar(4)  not null
	Print 'alm_marcas - codmar '
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.COLUMN_name = 'uzona')
begin
	Alter Table alm_inventario Add uzona nvarchar(3)  Not Null  Default ''
	Print 'alm_inventario - uzona '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.COLUMN_name = 'upasillo')
begin
	Alter Table alm_inventario Add upasillo nvarchar(3)  Not Null  Default ''
	Print 'alm_inventario - upasillo '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.COLUMN_name = 'uestante')
begin
	Alter Table alm_inventario Add uestante nvarchar(3)  Not Null  Default ''
	Print 'alm_inventario - uestante '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.COLUMN_name = 'ucasilla')
begin
	Alter Table alm_inventario Add ucasilla nvarchar(3)  Not Null  Default ''
	Print 'alm_inventario - ucasilla '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.COLUMN_name = 'codmar' and t.CHARACTER_MAXIMUM_LENGTH!=4)
begin
	Alter Table alm_articulos alter column codmar nvarchar(4)  not null
	Print 'alm_articulos - codmar '
end
Go

IF EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_invfisico' AND T.COLUMN_name = 'codmar' and t.CHARACTER_MAXIMUM_LENGTH!=4)
begin
	Alter Table alm_invfisicos alter column codmar nvarchar(4)  not null
	Print 'alm_invfisicos - codmar '
end
Go

IF NOT EXISTS (
		SELECT name,definition FROM SYS.DEFAULT_CONSTRAINTS 
		WHERE PARENT_OBJECT_ID = OBJECT_ID('alm_marcas')
		AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns
							WHERE NAME = 'codmar'
							AND object_id = OBJECT_ID('alm_marcas'))				
		)
	BEGIN
		ALTER TABLE alm_marcas ADD CONSTRAINT DF_alm_marcas_codmar DEFAULT '' FOR codmar
END
GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Vence' AND T.COLUMN_name = 'idemp')
begin
	Alter Table Alm_Vence Add idemp nvarchar(3)  Not Null  Default ''
	Print 'Alm_Vence - idemp '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_Vence' AND T.COLUMN_name = 'codcto')
begin
	Alter Table Alm_Vence Add codcto nvarchar(3)  Not Null  Default ''
	Print 'Alm_Vence - codcto '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.COLUMN_name = 'invima')
begin
	Alter Table Alm_articulos Add invima nvarchar(25)  Not Null  Default ''
	Print 'Alm_articulos - invima '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.COLUMN_name = 'copago')
begin
	Alter Table Alm_articulos Add copago nvarchar(50)  Not Null  Default ''
	Print 'Alm_articulos - copago '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.COLUMN_name = 'codesp')
begin
	Alter Table Alm_articulos Add codesp nvarchar(50)  Not Null  Default ''
	Print 'Alm_articulos - codesp '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_artxlote' AND T.COLUMN_name = 'itemdoc')
begin
	Alter Table Alm_artxlote Add itemdoc numeric(10)  Not Null  Default 0
	Print 'Alm_artxlote - itemdoc '
end
Go


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_artxlote' AND T.COLUMN_name = 'itemfacremi')
begin
	Alter Table Alm_artxlote Add itemfacremi numeric(10)  Not Null  Default 0
	Print 'Alm_artxlote - itemfacremi '
end
Go


IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'alm_articulos'  AND T.column_name = 'detart' and t.CHARACTER_MAXIMUM_LENGTH!=-1) 
BEGIN
	DECLARE @Constraint NVARCHAR(100)
	DECLARE @Sql NVARCHAR(MAX)
	IF EXISTS(SELECT sco.name 
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='alm_articulos' AND tc.name='detart')
	BEGIN
		SELECT @Constraint=sco.name 
		FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name='alm_articulos' AND tc.name='detart'
		
		SET @sql='ALTER TABLE dbo.alm_articulos DROP CONSTRAINT '+@Constraint	
		PRINT @sql
		EXEC SP_EXECUTESQL @sql
		ALTER TABLE dbo.alm_articulos ALTER COLUMN detart NVARCHAR(max)
		SET @sql='ALTER TABLE dbo.alm_articulos ADD  CONSTRAINT ['+@Constraint+']  DEFAULT ('''') FOR [detart ]'
		EXEC SP_EXECUTESQL @sql
	END 
	ELSE 
	BEGIN 
		ALTER TABLE alm_articulos ALTER COLUMN detart NVARCHAR(max)
		Print 'alm_articulos - detart'  --Ing. Lis 10/11/2018  se cambia el tipo por que esta incorrecto 
	END
END 
GO 


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'usuconftra') 
begin	
	Alter Table alm_kardex Add usuconftra nvarchar(8) Not Null Default '' 
	Print 'alm_kardex - usuconftra' --Ing. Priscy 27/12/2018 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.COLUMN_name = 'fecsysconftra')
begin
	Alter Table alm_kardex Add fecsysconftra date Not Null  Default getdate()
	Print 'alm_kardex - fecsysconftra ' --Ing. Priscy 27/12/2018 
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.COLUMN_name = 'pvfart')
begin
	Alter Table alm_inventario Add pvfart decimal(18,4)  Not Null CONSTRAINT DF_alm_inventario_pvfart default 0
	Print 'alm_inventario - pvfart '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.COLUMN_name = 'pvgart')
begin
	Alter Table alm_inventario Add pvgart decimal(18,4)  Not Null CONSTRAINT DF_alm_inventario_pvgart default 0
	Print 'alm_inventario - pvgart '
end
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.COLUMN_name = 'pvhart')
begin
	Alter Table alm_inventario Add pvhart decimal(18,4)  Not Null CONSTRAINT DF_alm_inventario_pvhart default 0
	Print 'alm_inventario - pvhart '
end
Go
-----------Actualizado 01022019-----------Lissette 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'Constante') 
begin 
	Alter Table alm_kardex Add Constante decimal(18,4) not null CONSTRAINT DF_alm_kardex_Constante default 0
	Print 'alm_kardex - Constante'
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'undart2') 
begin 
	Alter Table alm_kardex Add undart2 nvarchar(3) not null CONSTRAINT DF_alm_kardex_undart2 default ''
	Print 'alm_kardex - undart2'
end 
update alm_kardex set undart2 = '' where undart2 is null
Go

---Ing Luis Dominguez 2019-04-12
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'diaseguri') 
begin 
	Alter Table alm_Inventario Add diaseguri numeric(4,0) not null CONSTRAINT DF_alm_Inventario_diaseguri default 0
	Print 'Se agregó el campo diaseguri en alm_Inventario'---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'diascmp') 
begin 
	Alter Table alm_Inventario Add diascmp numeric(4,0) not null CONSTRAINT DF_alm_Inventario_diascmp default 0
	Print 'Se agregó el campo diascmp en alm_Inventario'---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'invdia') 
begin 
	Alter Table alm_Inventario Add invdia Bit not null CONSTRAINT DF_alm_Inventario_invdia default 0
	Print 'Se agregó el campo invdia en alm_Inventario '---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'invmes') 
begin 
	Alter Table alm_Inventario Add invmes Bit not null CONSTRAINT DF_alm_Inventario_invmes default 0
	Print 'Se agregó el campo invmes en alm_Inventario '---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'invpto') 
begin 
	Alter Table alm_Inventario Add invpto Bit not null CONSTRAINT DF_alm_Inventario_invpto default 0
	Print 'Se agregó el campo invpto en alm_Inventario '---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'frecuped') 
begin 
	Alter Table alm_Inventario Add frecuped numeric(2,0) not null CONSTRAINT DF_alm_Inventario_frecuped default 0
	Print 'Se agregó el campo frecuped en alm_Inventario'---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'artlogisti') 
begin 
	Alter Table alm_Inventario Add artlogisti Bit not null CONSTRAINT DF_alm_Inventario_artlogisti default 0
	Print 'Se agregó el campo artlogisti en alm_Inventario '---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'artpromo') 
begin 
	Alter Table alm_Inventario Add artpromo Bit not null CONSTRAINT DF_alm_Inventario_artpromo default 0
	Print 'Se agregó el campo artpromo en alm_Inventario '---Ing Luis Dominguez 2019-04-12
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_Inventario' AND T.column_name = 'noaplidcto') 
begin 
	Alter Table alm_Inventario Add noaplidcto Bit not null CONSTRAINT DF_alm_Inventario_noaplidcto default 0
	Print 'Se agregó el campo noaplidcto en alm_Inventario '---Ing Luis Dominguez 2019-04-12
end 
Go
---- actualizado esquema  Lissette 25/04-2019----

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'rutafotodoc') 
begin 
	Alter Table alm_kardex add  rutafotodoc nvarchar(200) NOT NULL CONSTRAINT DF_alm_kardex_com_facturas DEFAULT ''
	Print 'alm_kardex - rutafotodoc'
end
go  


IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'ctacmpvtadev') 
begin 
	Alter Table alm_grupos Add ctacmpvtadev nvarchar(8) not null CONSTRAINT DF_alm_grupos_ctacmpvtadev DEFAULT ''
	Print 'Se agregó el campo ctacmpvtadev en alm_grupos'---Ing Luis Dominguez 2019-06-07
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'ctacmpvtanul') 
begin 
	Alter Table alm_grupos Add ctacmpvtanul nvarchar(8) not null CONSTRAINT DF_alm_grupos_ctacmpvtanul DEFAULT ''
	Print 'Se agregó el campo ctacmpvtadev en alm_grupos'---Ing Luis Dominguez 2019-06-07
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'ctacmpanul') 
begin 
	Alter Table alm_grupos Add ctacmpanul nvarchar(8) not null CONSTRAINT DF_alm_grupos_ctacmpanul DEFAULT ''
	Print 'Se agregó el campo ctacmpanul en alm_grupos'---Ing Luis Dominguez 2019-06-11
end 
Go

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'ocultarfrm') 
begin 
	Alter Table alm_grupos Add ocultarfrm bit not null CONSTRAINT DF_alm_grupos_ocultarfrm DEFAULT 0
	Print 'Se agregó el campo ocultarfrm en alm_grupos'---Ing Lissette 08-07-2019.  Para marcar que grupos no va a mostrar en las formulaciones. 
end 
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'alm_grupos' AND T.Column_Name = 'nitguia')
	Alter Table alm_grupos add nitguia  nvarchar(20) not null default ''
Go
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'alm_grupos' AND T.Column_Name = 'guiaexclu')
	Alter Table alm_grupos add guiaexclu  bit not null default 0
Go

---- actualizado esquema  Shirley Rojas 18-06-2020 campo enviado por edwin marquez para funcionamiento fenicio y okey----
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.COLUMN_name = 'isenviado')
begin
 Alter Table Alm_articulos Add isenviado bit Not Null  Default 0
 Print 'Alm_articulos - isenviado '
end
Go

---- actualizado esquema  Shirley Rojas 18-06-2020 campo enviado por edwin marquez para funcionamiento fenicio y okey----
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.COLUMN_name = 'servidor')
begin
 Alter Table Alm_articulos Add servidor nvarchar(60)  Default ''
 Print 'Alm_articulos - servidor '
end
Go

---- actualizado esquema  Shirley Rojas 18-06-2020 campo enviado por edwin marquez para funcionamiento fenicio y okey----
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.COLUMN_name = 'timecoc')
begin
 Alter Table Alm_articulos Add timecoc nvarchar(4)  Default ''
 Print 'Alm_articulos - timecoc '
end
Go

IF not exists (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'fecenvio') 
begin 
	Alter Table alm_articulos Add fecenvio date Not Null Default '19000101' 
	Print 'alm_articulos'  --Creado por Ing.Shirley Rojas 21-07-2020 por solicitud de Ing. Arnold Sandoval para el Ecommerce con TAE
end
Go


----Campos Antiguos que existen pero que no estan en el restruct y Arnold los necesitaba en la App de Deliloco
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'alm_grupos' AND T.column_name ='servidor')
  BEGIN	
	alter table alm_grupos add	servidor nvarchar(60) NOT NULL DEFAULT('')
	print 'alm_grupos - servidor'
  END
ELSE
   BEGIN
   Declare @default varchar(max) = (SELECT default_constraints.name FROM sys.all_columns INNER JOIN sys.tables ON all_columns.object_id = tables.object_id INNER JOIN  sys.schemas
        ON tables.schema_id = schemas.schema_id INNER JOIN sys.default_constraints ON all_columns.default_object_id = default_constraints.object_id
		WHERE schemas.name = 'dbo' AND tables.name = 'alm_grupos' AND all_columns.name = 'servidor')

		declare @sql varchar(max) = 'alter table alm_grupos drop ' + @default
		EXEC (@sql)
   ALter table alm_grupos add constraint df_alm_grupos_servidor default ('') for servidor
   declare @sql1 varchar(max) = 'update alm_grupos set servidor = '''''
		EXEC(@sql1)
   alter table alm_grupos alter column servidor nvarchar(60) NOT NULL 
   print 'alm_grupos - servidor'
   END
Go
--TERCER CAMBIO DE JHONATAN Los nombres de columna en cada tabla deben ser únicos. El nombre de la columna 'sinexis' en la tabla 'alm_inventario' se especifica más de una vez.
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_inventario' AND T.column_name = 'sinexis') 
begin 
	alter table alm_inventario add sinexis bit NULL
	Print 'alm_inventario -  sinexis'
end
Go
update alm_inventario set sinexis = '0'
Go

if EXISTS(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_grupos' AND T.COLUMN_NAME = 'NroCopias')
   BEGIN
      IF NOT EXISTS(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_grupos' AND T.COLUMN_NAME = 'NroCopias' AND T.DATA_TYPE = 'decimal')
	  BEGIN
	    Declare @default varchar(max) = (SELECT default_constraints.name FROM sys.all_columns INNER JOIN sys.tables ON all_columns.object_id = tables.object_id INNER JOIN  sys.schemas
        ON tables.schema_id = schemas.schema_id INNER JOIN sys.default_constraints ON all_columns.default_object_id = default_constraints.object_id
		WHERE schemas.name = 'dbo' AND tables.name = 'alm_grupos' AND all_columns.name = 'NroCopias')

		declare @sql varchar(max) = 'alter table alm_grupos drop ' + @default
		EXEC (@sql)
		
		alter table alm_grupos alter column NroCopias decimal(10,0) NULL
		
		alter table alm_grupos add constraint [DF_alm_grupo_NroCopias] DEFAULT ((0)) FOR NroCopias
	END
 END

 ---------- 11/02/2021 Yaslen Andrade agregado para insertar valor depreciado al guardar activo fijo

 IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.COLUMN_name = 'vlrdepini')
begin
 Alter Table Alm_articulos Add vlrdepini numeric(14,0) Not Null Default 0
 Print 'Alm_articulos - vlrdepini'
end
Go
--- 29-04-2021 campo expandido a 15 digitos 
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_articulos' AND T.column_name = 'unumfac' and t.CHARACTER_MAXIMUM_LENGTH !=15) 
begin 
	Alter Table Alm_articulos alter column  unumfac nvarchar(15) not null
	Print 'Alm_articulos - Expandir unumfac'
end
go  

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'Alm_inventario' AND T.column_name = 'unumfac' and t.CHARACTER_MAXIMUM_LENGTH !=15) 
begin 
	Alter Table Alm_inventario alter column  unumfac nvarchar(15) not null
	Print 'Alm_inventario - Expandir unumfac'
end
go  

--- 23-06-2021 campo agregado por Lissette para desarrollo de surtipizza 
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'pesoqty') 
begin
	Alter Table alm_articulos Add pesoqty decimal(14,4) not null default 0
	Print 'alm_articulos - pesoqty'
end 
Go

----- Campo agregado para agregar adicionales con precios a los platos touch web
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_variantes' AND T.COLUMN_NAME = 'sinprecio')
  BEGIN
     alter table alm_variantes add sinprecio bit DEFAULT(1) NOT NULL
  END

---- 19-07-2021 Campos Agregados por Arnold Sandoval para desarrollo de Inactivar artículos en Pleitz
 if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_articulos' AND T.COLUMN_NAME = 'pliztstate')
   BEGIN
     alter table alm_articulos add pliztstate bit NOT NULL DEFAULT(1)
	 print 'alm_articulos - pliztstate'
   END

----- 06-12-2021 Jennifer Rodriguez para aplicar dia de promocion por lineas
 if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'alm_lineas' AND T.COLUMN_NAME = 'aclin')
   BEGIN
     alter table alm_lineas add aclin bit NOT NULL DEFAULT(0)
	 print 'alm_lineas - aclin'
   END

----- 12-01-2022 Lissette Castro desarrollo de unificar descargue de inventario a un solo centro
   IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_kardex' AND T.column_name = 'ctoorigen') 
begin
	Alter Table alm_kardex Add ctoorigen nvarchar(3) not null default '' --Centro origen del documento
	Print 'alm_kardex - ctoorigen'
end 
Go
----- 02-03-2022 Campo expandido a 4 en alm_lineas está en 4. Enuar Martinez.
IF EXISTS (SELECT * FROM Information_Schema.Columns AS T WHERE T.table_name = 'alm_detinvfisicos'  AND T.column_name = 'codlin' and t.CHARACTER_MAXIMUM_LENGTH!=4) 
BEGIN
   IF  EXISTS (select name from sys.objects  WHERE name = 'DF_alm_detinvfisicos_codlin'   
            AND type = 'D') 
	begin
       alter table alm_detinvfisicos DROP DF_alm_detinvfisicos_codlin;
       alter table alm_detinvfisicos alter column codlin varchar(4)
       ALTER TABLE dbo.alm_detinvfisicos
       ADD CONSTRAINT DF_alm_detinvfisicos_codlin
       DEFAULT '' FOR codlin;
	end
    else
	 begin
	   alter table alm_detinvfisicos alter column codlin varchar(4) not null
	 end
end
Go
------ 23-06-2022 Agregado por Lissette Castro para seleccionar articulos que no manejan inventario en touch.
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_articulos' AND T.column_name = 'sincntrlinv') 
begin	
	Alter Table alm_articulos Add sincntrlinv bit Not Null Default 0 
	Print 'alm_articulos - sincntrlinv'
end
Go
------ 13-07-2022 Agregado por Jennifer Rodriguez para seleccionar grupos excluidos de la pantalla cn_vtaxvendedor
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'gruexclu') 
begin	
	Alter Table alm_grupos Add gruexclu bit Not Null Default 0 
	Print 'alm_grupos - gruexclu'
end
Go

----- 29-08-2023 Agregado por Lissette Castro Desarrollo de Tinajo artículos por transacciones
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'alm_grupos' AND T.column_name = 'GruReplica') 
begin 
	alter table alm_grupos add GruReplica char(1) not null DEFAULT ''
	Print 'alm_grupos - GruReplica'
end
Go
----Agregado el 27-11-2023 Impuesto saludable
IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'alm_articulos' AND T.Column_Name = 'TarifaIbua')  
begin 
	Alter Table alm_articulos	add TarifaIbua decimal(10,2) not null default 0
	Print 'alm_articulos - TarifaIbua'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'alm_articulos' AND T.Column_Name = 'TotalIbua')  
begin 
	Alter Table alm_articulos	add TotalIbua decimal(10,2) not null default 0
	Print 'alm_articulos - TotalIbua'  
end 
Go


IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'alm_articulos' AND T.Column_Name = 'porIcui')  
begin 
	Alter Table alm_articulos	add porIcui decimal(6,2) not null default 0
	Print 'alm_articulos - porIcui'  
end 
Go

IF not EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'alm_articulos' AND T.Column_Name = 'volumen')  
begin 
	Alter Table alm_articulos	add volumen decimal(10,2) not null default 0
	Print 'alm_articulos - volumen'  
end 
Go
----- 15-07-2024  agregado por Lissette Castro para guardar toma fisica por grupos
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name =  'alm_invfisicos' AND T.COLUMN_name = 'grupos')
begin	
	Alter Table alm_invfisicos Add grupos nvarchar(200) Not Null Default '' 
	Print 'alm_invfisicos - grupos '
end
Go
