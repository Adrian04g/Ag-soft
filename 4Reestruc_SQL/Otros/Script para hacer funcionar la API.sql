--Verificar si existe llave primaria en ven_prefactura -  Arnold Sandoval A. 18/09/2020
IF not exists (Select * From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and left(constraint_name, 2) = 'PK')
   BEGIN
     alter table ven_prefactura add constraint PK_ven_prefactura primary key clustered (idemp, codcto, tipdoc, numpre)
	 print 'ven_prefactura - llave primaria creada'
   END
ELSE
   --validada su existencia verificar que este con los campos que debe tener
   BEGIN
 --Verifica que la idemp este dentro de la llave primaria de ven_prefactura
 IF not exists (Select * From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and T.COLUMN_NAME = 'idemp')
    BEGIN
	   Declare @NombrePK varchar(50) = (Select TOP(1) CONSTRAINT_NAME From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and LEFT(T.CONSTRAINT_NAME, 2) = 'PK')
	   Declare @sql varchar(max)= 'alter table ven_prefactura drop '+ @NombrePK	
       EXEC(@sql)
	   declare @_sql varchar(max) =  ('alter table ven_prefactura add constraint ' + @NombrePK + ' primary key clustered (idemp, codcto, tipdoc, numpre)')
	   EXEC(@_sql)
	   print 'ven_prefactura modificación de la llave primaria'
	END
 ELSE
   BEGIN
       IF not exists (Select * From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and T.COLUMN_NAME = 'tipdoc')
	   begin
	       Declare @NombrePK2 varchar(50) = (Select TOP(1) CONSTRAINT_NAME From Information_Schema.KEY_COLUMN_USAGE T where T.TABLE_NAME = 'ven_prefactura' and LEFT(T.CONSTRAINT_NAME, 2) = 'PK')
	   Declare @sql2 varchar(max)= 'alter table ven_prefactura drop '+ @NombrePK2	
       EXEC(@sql2)
	   declare @_sql1 varchar(max) =  ('alter table ven_prefactura add constraint ' + @NombrePK2 + ' primary key clustered (idemp, codcto, tipdoc, numpre)')
	   EXEC(@_sql1)
	   print 'ven_prefactura modificación de la llave primaria'

	   end
    END
 END

 GO


