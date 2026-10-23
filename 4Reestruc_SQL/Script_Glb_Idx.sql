
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Nom_Prima' AND nomidx='SECANO')							-- Creados en Mayo 4 de 2015 por Éduar Álvarez.
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('NOM_PRIMA','SECANO','ALLTRIM(CODI_SEC)+ALLTRIM(PERIODO)+ALLTRIM(STR(ANO))',0,'CODI_SEC,PERIODO,ANO')
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Nom_Prima' AND nomidx='PERANO')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('NOM_PRIMA','PERANO','ALLTRIM(CODI_SEC)+ALLTRIM(PERIODO1)+ALLTRIM(PERIODO2)+ALLTRIM(STR(ANO))',0,'CODI_SEC,PERIODO1,PERIODO2,ANO')
Go

--Ing. Lis Feb 10 2016
IF EXISTS (Select nomidx From Glb_Idx Where tabla = 'VEN_COTIZACION' AND nomidx='CENFAC')
	DELETE FROM glb_idx where tabla = 'VEN_COTIZACION' AND nomidx='CENFAC'
Go

IF EXISTS (Select nomidx From Glb_Idx Where tabla = 'VEN_COTIZACION' AND nomidx='FACTURA' AND detidx LIKE '%CODCEN%') 
begin  
	DELETE FROM glb_idx where tabla = 'VEN_COTIZACION' AND nomidx='FACTURA'
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('VEN_COTIZACION','FACTURA','ALLTRIM(CODCTO)+ALLTRIM(TIPFAC)+ALLTRIM(NUMFAC)','CODCTO,TIPFAC,NUMFAC,','')
end 
Go

IF EXISTS (Select nomidx From Glb_Idx Where tabla = 'VEN_COTIZACION' AND nomidx='CODCEN' )
begin 
	DELETE FROM glb_idx where tabla = 'VEN_COTIZACION' AND nomidx='CODCEN'
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('VEN_COTIZACION','CODCTO','CODCTO','CODCTO,','')
end 
Go

IF EXISTS (Select nomidx From Glb_Idx Where tabla = 'VEN_COTIDETALLE' AND nomidx='FACTURA' AND detidx LIKE '%CODCEN%')  
begin 
	DELETE FROM glb_idx where tabla = 'VEN_COTIDETALLE' AND nomidx='FACTURA'
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('VEN_COTIDETALLE','FACTURA','ALLTRIM(CODCTO)+ALLTRIM(TIPFAC)+ALLTRIM(NUMFAC)','CODCTO,TIPFAC,NUMFAC,','')
end 
Go

IF EXISTS (Select nomidx From Glb_Idx Where tabla = 'VEN_COTIDETALLE' AND nomidx='ITEM' AND detidx LIKE '%CODCEN%')  
begin 
	DELETE FROM glb_idx where tabla = 'VEN_COTIDETALLE' AND nomidx='ITEM'
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('VEN_COTIDETALLE','ITEM','ALLTRIM(CODCTO)+ALLTRIM(TIPFAC)+ALLTRIM(NUMFAC)+ALLTRIM(CODART)','CODCTO,TIPFAC,NUMFAC,CODART,','')
end 
Go

IF EXISTS (Select nomidx From Glb_Idx Where tabla = 'VEN_COTIDETALLE' AND nomidx='CODCEN' )
begin 
	DELETE FROM glb_idx where tabla = 'VEN_COTIDETALLE' AND nomidx='CODCEN'
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('VEN_COTIDETALLE','CODCTO','CODCTO','CODCTO,','')
end 
Go

--Ing. Lis nuevas tablas 4 marzo 2016
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'ALM_TARGET' AND nomidx='CODTAR')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('ALM_TARGET','CODTAR','CODTAR','CODTAR,','')
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'ALM_TARGET' AND nomidx='NOMTAR')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('ALM_TARGET','NOMTAR','NOMTAR','NOMTAR,','')
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'ALM_TEMPORADA' AND nomidx='CODTEMP')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('ALM_TEMPORADA','CODTEMP','CODTEMP','CODTEMP,','')
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'ALM_TEMPORADA' AND nomidx='NOMTEMP')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,campos,compuesto)
				 VALUES ('ALM_TEMPORADA','NOMTEMP','NOMTEMP','NOMTEMP,','')
Go

IF NOT EXISTS (Select * From Glb_Idx Where tabla = 'NOM_PRIMA' AND nomidx='SECANO')											
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)																
				 VALUES ('NOM_PRIMA','SECANO','ALLTRIM(CODI_SEC)+ALLTRIM(PERIODO)+ALLTRIM(STR(ANO))',0,'CODI_SEC,PERIODO,ANO,')
Go

IF NOT EXISTS (Select * From Glb_Idx Where tabla = 'NOM_PRIMA' AND nomidx='PERANO')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('NOM_PRIMA','PERANO','ALLTRIM(CODI_SEC)+ALLTRIM(PERIODO1)+ALLTRIM(PERIODO2)+ALLTRIM(STR(ANO))',0,'CODI_SEC,PERIODO1,PERIODO2,ANO,')
	Print 'Ven_Prefacdetalle - minsalario'
go


IF EXISTS (Select * From Glb_Idx Where tabla = 'ALM_VARIANTES' AND nomidx='CITEM' AND detidx='ALLTRIM(CODART)+ALLTRIM(CODGRU)+ALLTRIM(CITEM)')
begin 	
	delete from Glb_Idx Where tabla = 'ALM_VARIANTES' AND nomidx='CITEM' AND detidx='ALLTRIM(CODART)+ALLTRIM(CODGRU)+ALLTRIM(CITEM)'

	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('ALM_VARIANTES','ITEM','ALLTRIM(CODART)+ALLTRIM(CODGRU)+ALLTRIM(STR(CITEM))',0,'CODART,CITEM,CODGRU,')
	Print 'ALM_VARIANTES - CITEM'
end 
go


IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='CODCUE')											-- Éduar Álvarez. - Junio 13 de 2015.
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_ComproNIIF','CODCUE','CODCUE',0,'CODCUE,')
Print 'Idx Con_ComproNIIF - CODCUE'
Go


IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='COMPROB')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_ComproNIIF','COMPROB','ALLTRIM(CODTRAN)+ALLTRIM(CONSEC)+ALLTRIM(CODCTO)',0,'CODCTO,CODTRAN,CONSEC,')
Print 'Idx Con_ComproNIIF  - COMPROB'
Go


IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='NITTER')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_ComproNIIF','NITTER','ALLTRIM(NITTER)',0,'NITTER,')
Print 'Idx Con_ComproNIIF  - NITTER'
Go

Print 'IDx Con_ComproNIIF - TRANFEC'
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='TRANFEC')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_ComproNIIF','TRANFEC','ALLTRIM(CODTRAN)+ALLTRIM(DTOC(FECDOC))',0,'CODTRAN,FECDOC,')
Go

Print 'Idx Con_ComprCon_ComproNIIFobante Costo'
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='COSTO')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) 
				 VALUES ('Con_ComproNIIF','COSTO','ALLTRIM(CODTRAN)+RIGHT(ALLTRIM(CONSEC),8)+ALLTRIM(CODCTO)',0,'CODCTO,CODTRAN,CONSEC,')
Go

Print 'Idx Con_ComproNIIF NITTER_A '
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='NITTER_A')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_ComproNIIF','NITTER_A','NITTER',0,'NITTER,')
Go

Print 'Idx Con_ComproNIIF - CONTAB'
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='CONTAB')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) 
				 VALUES ('Con_ComproNIIF','CONTAB','ALLTRIM(CODTRAN)+ALLTRIM(CODCTO)+ALLTRIM(RIGHT(CONSEC,8))+ALLTRIM(CODCUE)',0,'CODCTO,CODTRAN,CONSEC,CODCUE,')
Go

Print 'IDx Con_ComproNIIF - FECDOC'
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_ComproNIIF' AND nomidx='FECDOC')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_ComproNIIF','FECDOC','FECDOC',0,'FECDOC,')
Go

Print ' idx Con_ComproNIIF - timedife'
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_ComproNIIF' AND T.column_name = 'timedife')				-- Éduar Álvarez - Junio 16 de 2015.
	Alter Table Con_ComproNIIF Add timedife Numeric(3) Not Null Default 0
Go

Print ' IDx Con_ComproNIIF  - revelaciones '
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_ComproNIIF' AND T.column_name = 'revelaciones')
	Alter Table Con_ComproNIIF Add revelaciones nVarChar(Max) Not Null Default ''
Go

Print 'Idx Con_Comprobante  - revelaciones'
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_name = 'Con_Comprobante' AND T.column_name = 'revelaciones')
	Alter Table Con_Comprobante Add revelaciones nVarChar(Max) Not Null Default ''
Go

Print 'Idx Con_PucNIIF - NOMCUENIIF'
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_PucNIIF' AND nomidx='NOMCUENIIF')													-- Éduar Álvarez - Junio 17 de 2015.
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_PucNIIF','NOMCUENIIF','NOMCUENIIF',0,'NOMCUENIIF,')
Go

Print 'Idx Con_PucNIIF  - CODCUENIIF '
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_PucNIIF' AND nomidx='CODCUENIIF')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Con_PucNIIF','CODCUENIIF','CODCUENIIF',0,'CODCUENIIF,')
Go

IF NOT EXISTS (Select * From Glb_Idx Where tabla = 'Con_CtaCenCostos' AND nomidx='CENCUE')														-- Éduar Álvarez - Junio 25 de 2015.
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('CON_CTACENCOSTOS','CENCUE','ALLTRIM(STR(año))+ALLTRIM(codcto)+ALLTRIM(codcue)',0,'AÑO,CODCTO,CODCUE,')
Print ' IDx Con_CtaCenCostos CENCUE '
Go


Print 'Idx Con_CtaCtoNIIF CENCUE '
IF NOT EXISTS (Select * From Glb_Idx Where tabla = 'Con_CtaCtoNIIF' AND nomidx='CENCUE')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('CON_CTACTONIIF','CENCUE','ALLTRIM(STR(año))+ALLTRIM(codcto)+ALLTRIM(codcue)',0,'AÑO,CODCTO,CODCUE,')
Go

Print 'Idx Con_CtaCenCostos - AÑOCUE '
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Con_CtaCenCostos' AND nomidx='AÑOCUE')											-- Éduar Álvarez. - Julio 11 de 2015.
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('CON_CTACENCOSTOS','AÑOCUE','ALLTRIM(STR(AÑO))+ALLTRIM(CODCUE)',0,'AÑO,CODCUE,')
Go

IF EXISTS (Select * From Glb_Idx Where tabla = 'CON_PUCNIIF' AND nomidx='NOMCUENIIF' AND detidx='NOMCUENIIF')
	delete from Glb_Idx Where tabla = 'CON_PUCNIIF' AND nomidx='NOMCUENIIF' AND detidx='NOMCUENIIF'

	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('CON_PUCNIIF','NOMCUE','NOMCUE',0,'NOMCUE,')
	Print 'CON_PUCNIIF - NOMCUE'
go

IF EXISTS (Select * From Glb_Idx Where tabla = 'CON_PUCNIIF' AND nomidx='CODCUENIIF' AND detidx='CODCUENIIF')
	delete from Glb_Idx Where tabla = 'CON_PUCNIIF' AND nomidx='CODCUENIIF' AND detidx='CODCUENIIF'

	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos)
				 VALUES ('CON_PUCNIIF','CODCUE','CODCUE',0,'CODCUEN,')
	Print 'CON_PUCNIIF - CODCUE'
go
IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'GLB_TERCEROS' AND nomidx='NOMCOM')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('GLB_TERCEROS','NOMCOM','NOMCOM',0,'NOMCOM,')
Print 'Idx GLB_TERCEROS  - NOMCOM'
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'CON_POLITICAS' AND nomidx='ITEM')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('CON_POLITICAS','ITEM','ITEM',0,'ITEM,')
Print 'Idx CON_POLITICAS  - ITEM'
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'CON_POLITICAS' AND nomidx='TITULO')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('CON_POLITICAS','TITULO','TITULO',0,'TITULO,')
Print 'Idx CON_POLITICAS  - TITULO'
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'nom_historia' AND nomidx='codi_emple')
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('nom_historia','codi_emple','codi_emple',0,'codi_emple,')
Print 'Idx nom_historia  - codi_emple'
Go


IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Glb_Equivalentes_FE' AND nomidx='codigo')
begin 
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Glb_Equivalentes_FE','codigo','codigo',0,'codigo,')
	Print 'Idx Glb_Equivalentes_FE  - codigo'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Glb_Equivalentes_FE' AND nomidx='nombre')
begin 
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Glb_Equivalentes_FE','nombre','nombre',0,'nombre,')
	Print 'Idx Glb_Equivalentes_FE  - nombre'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'SER_TIPVEHICULO' AND nomidx='codigo')
begin 
    
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('SER_TIPVEHICULO','codigo','codigo',0,'codigo,')
	Print 'SER_TIPVEHICULO  - codigo'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'SER_TIPVEHICULO' AND nomidx='nombre')
begin 
    
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('SER_TIPVEHICULO','nombre','nombre',0,'nombre,')
	Print 'SER_TIPVEHICULO  - nombre'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'SER_ESTACION' AND nomidx='codigo')
begin 
    
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('SER_ESTACION','codigo','codigo',0,'codigo,')
	Print 'SER_ESTACION  - codigo'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'SER_ESTACION' AND nomidx='nombre')
begin 
    
	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('SER_ESTACION','nombre','nombre',0,'nombre,')
	Print 'SER_ESTACION  - nombre'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'SER_SIGLA' AND nomidx='codigo')
begin 
   	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('SER_SIGLA','codigo','codigo',0,'codigo,')
	Print 'SER_SIGLA  - codigo'
end 
Go


IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'ser_dependencia' AND nomidx='codigo')
begin 
   	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('ser_dependencia','codigo','codigo',0,'codigo,')
	Print 'ser_dependencia  - codigo'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'ser_dependencia' AND nomidx='nombre')
begin 
   	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('ser_dependencia','nombre','nombre',0,'nombre,')
	Print 'ser_dependencia  - nombre'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Ser_Presupuesto' AND nomidx='codpresu')
begin 
   	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Ser_Presupuesto','codpresu','codpresu',0,'codpresu,')
	Print 'Ser_Presupuesto  - codpresu'
end 
Go

IF NOT EXISTS (Select nomidx From Glb_Idx Where tabla = 'Ser_Presupuesto' AND nomidx='nombre')
begin 
   	INSERT INTO Glb_Idx (tabla,nomidx,detidx,compuesto,campos) VALUES ('Ser_Presupuesto','nombre','nombre',0,'nombre,')
	Print 'Ser_Presupuesto  - nombre'
end 
Go

