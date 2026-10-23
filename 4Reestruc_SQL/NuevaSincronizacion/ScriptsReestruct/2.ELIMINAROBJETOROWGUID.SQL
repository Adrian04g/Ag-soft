DECLARE @tablas VARCHAR(3000)
DECLARE @idobjeto numeric(20)
DECLARE @ROWOBJECT VARCHAR(800)
DECLARE @QUERY VARCHAR(3000)
DECLARE @CAMPO VARCHAR(3000)
DECLARE @TABLACOMILLA VARCHAR(300)
DECLARE INDEXX CURSOR 
FOR
SELECT NAME,object_id FROM SYS.tables
OPEN INDEXX
FETCH INDEXX INTO @tablas,@idobjeto
WHILE (@@FETCH_STATUS = 0)
 BEGIN 
 FETCH INDEXX INTO @tablas,@idobjeto
  SELECT @ROWOBJECT =( select NAME from sys.objects where parent_object_id = @idobjeto and name like			'MSmerg%')

		IF EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME					(object_id) =@ROWOBJECT)
			BEGIN
				SET @QUERY = 'alter table ' + @tablas + ' drop constraint ' + @ROWOBJECT 
				EXEC (@QUERY)
		END
	IF EXISTS(SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id)='DF__Con_Compr__rowgu__39725767')
	BEGIN
			alter table con_comproNiif drop constraint DF__Con_Compr__rowgu__39725767
	END
		 SET @CAMPO = 'IF EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '''+@tablas+''' and COLUMN_NAME=''rowguid'' )
			BEGIN
			alter table '+ @tablas +' drop column rowguid
			END'

		EXEC(@CAMPO)
	

END
CLOSE INDEXX
DEALLOCATE INDEXX  