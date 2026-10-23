--************** SCRIPT PARA LA CREACION DE CODIGOS DE BARRA ***************--


----- 1 PASO -------

update alm_articulos set codbar = ''

update alm_articulos set responsable = ''

-----------------------------------


---SEGUNDO PASO---------
-- Actualizar campo responsable y tomarlo como sonsecutivo para el codigo de barra
-- EJECUTAR ESTE PRIMERO --

DECLARE responsable_Cursor CURSOR FOR
select codart from alm_articulos;
OPEN responsable_Cursor ;
DECLARE @codart nvarchar(50);
FETCH NEXT from responsable_Cursor
INTO @codart
DECLARE @consec INT
SET @consec = 1
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH NEXT FROM responsable_Cursor INTO @codart;
set @consec = @consec + 1;
UPDATE alm_articulos set responsable = @consec where codart = @codart 
END
CLOSE responsable_Cursor;
DEALLOCATE responsable_Cursor;
update alm_articulos set responsable = '1' where responsable =''
GO


-----TERCER PASO------------
-- BORRADO CAMPO CODBAR----

--****************************------

---------SEGUNDO SCRIPT-----------------
DECLARE responsable_Cursor CURSOR FOR
select codtar, genero,responsable,LEN(codbar) as longitud from alm_articulos;
OPEN responsable_Cursor ;
DECLARE @codtar nvarchar(50),@genero nvarchar(50),@responsable nvarchar(50),@longitud nvarchar(50);
FETCH NEXT from responsable_Cursor
INTO @codtar,@genero,@responsable,@longitud
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH NEXT FROM responsable_Cursor INTO @codtar,@genero,@responsable,@longitud;


UPDATE alm_articulos set codbar = @codtar+@genero+@responsable where responsable=@responsable

end;
CLOSE responsable_Cursor;
DEALLOCATE responsable_Cursor;
update alm_articulos set codbar='01' where codbar=''
GO


--******************************************------------
---CUARTO PASO------
-- TERCER SCRIPT
DECLARE responsable_Cursor CURSOR FOR
select codtar, genero,responsable,LEN(codbar) as longitud from alm_articulos;
OPEN responsable_Cursor ;
DECLARE @codtar nvarchar(50),@genero nvarchar(50),@responsable nvarchar(50),@longitud nvarchar(50);
FETCH NEXT from responsable_Cursor
INTO @codtar,@genero,@responsable,@longitud
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH NEXT FROM responsable_Cursor INTO @codtar,@genero,@responsable,@longitud;
if (@longitud = 2)
begin
UPDATE alm_articulos set codbar = '000000'+@codtar+@genero+@responsable where responsable=@responsable
end;
else
if (@longitud = 3)
begin
UPDATE alm_articulos set codbar = '00000'+@codtar+@genero+@responsable where responsable=@responsable
END;
else
if (@longitud = 4)
begin
UPDATE alm_articulos set codbar = '0000'+@codtar+@genero+@responsable where responsable=@responsable

END;
else
if (@longitud = 5)
begin
UPDATE alm_articulos set codbar = '000'+@codtar+@genero+@responsable where responsable=@responsable
end;
else
if (@longitud = 6)
begin
UPDATE alm_articulos set codbar = '00'+@codtar+@genero+@responsable where responsable=@responsable

END;
else
if (@longitud = 7)
begin
UPDATE alm_articulos set codbar = '0'+@codtar+@genero+@responsable where responsable=@responsable
end;
end;
CLOSE responsable_Cursor;
DEALLOCATE responsable_Cursor;
update alm_articulos set codbar='00000001' where codbar='01'
GO



