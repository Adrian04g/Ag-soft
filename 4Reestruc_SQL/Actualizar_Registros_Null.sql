IF OBJECT_ID('dbo.db_SP_ActualizarRegistrosNull','P') IS NOT NULL	DROP PROCEDURE db_SP_ActualizarRegistrosNull
GO
CREATE PROCEDURE [dbo].[db_SP_ActualizarRegistrosNull]
 AS
	SET NOCOUNT ON;
	DECLARE @tabla		VARCHAR(100)
	DECLARE @campo		VARCHAR(100)
	DECLARE @tipo		VARCHAR(100)
	DECLARE @sql		NVARCHAR(MAX)
	DECLARE curTablas CURSOR
		FOR select col.TABLE_NAME,col.COLUMN_NAME,col.DATA_TYPE from INFORMATION_SCHEMA.COLUMNS col inner join INFORMATION_SCHEMA.TABLES tbl on tbl.TABLE_NAME=col.TABLE_NAME where col.IS_NULLABLE='YES' and  tbl.TABLE_TYPE='BASE TABLE'
	OPEN curTablas 
	FETCH NEXT FROM curTablas InTO @tabla, @campo,@tipo
	WHILE @@FETCH_STATUS=0
	BEGIN
		IF(@tipo='decimal' or @tipo='numeric' or @tipo='int' or @tipo='bit')
		BEGIN
			set @sql='UPDATE '+@tabla+' SET '+@campo+'='+'0' +'  WHERE '+@campo+' IS NULL' 
		END
		ELSE IF(@tipo='datetime' or @tipo='date')
		BEGIN
		set @sql='UPDATE '+@tabla+' SET '+@campo+'='+'GETDATE() ' +'  WHERE '+@campo+' IS NULL' 
		END 
		ELSE
		BEGIN
		set @sql='UPDATE '+@tabla+' SET '+@campo+'='+'''''' +'  WHERE '+@campo+' IS NULL' 
		END
		BEGIN TRY
		EXEC (@sql)
		print @sql
		END TRY
		BEGIN CATCH
		print @sql + ' ERROR : '+ ERROR_MESSAGE();
		END CATCH
		FETCH NEXT FROM curTablas INTO  @tabla, @campo,@tipo
	END
	CLOSE curTablas
	DEALLOCATE curTablas
GO

exec db_sp_actualizarregistrosnull