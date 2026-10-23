DECLARE @QUERY varchar(20) = 'QUERY';
declare @cadena varchar(Max)=''
DECLARE QuitarSeguimiento_Cursor CURSOR FOR
select Codtabla from SYN_TABLASPUBLICACION;
OPEN QuitarSeguimiento_Cursor ;
DECLARE @tabla nvarchar(50);
FETCH NEXT from QuitarSeguimiento_Cursor
INTO @tabla
WHILE @@FETCH_STATUS = 0
   BEGIN
     

	 set  @cadena='ALTER TABLE ' +@tabla+ ' DISABLE CHANGE_TRACKING'+char(10)+' GO '
	 print @cadena
	 --EXEC (@cadena)
	 
	  FETCH NEXT FROM QuitarSeguimiento_Cursor INTO @tabla;
	  --print @tabla
	--   ALTER TABLE @tabla DISABLE CHANGE_TRACKING;
   END;
CLOSE QuitarSeguimiento_Cursor;
DEALLOCATE QuitarSeguimiento_Cursor;
GO



