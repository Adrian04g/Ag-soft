---------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_BORRARPRIMARYKEYS','P') IS NOT NULL	DROP PROCEDURE db_SP_BORRARPRIMARYKEYS
GO
CREATE PROCEDURE [dbo].[db_SP_BORRARPRIMARYKEYS]
 AS
	SET NOCOUNT ON;
	if object_id('esq_tablasprd')is not  null
				begin
					TRUNCATE TABLE esq_tablasprd
				end
	declare @TABLE_NAME nvarchar(256)
	declare @OBJECT_NAME nvarchar(256)
	declare @TYPE nvarchar(3)
	DECLARE @SQL varchar(1000)
	DECLARE curTablas CURSOR
		FOR select OBJECT_NAME(parent_object_id) TABLA, name, type from sys.objects where type in ('PK','F') order by type
	OPEN curTablas 
	FETCH NEXT FROM curTablas InTO @TABLE_NAME,@OBJECT_NAME,@TYPE
	WHILE @@FETCH_STATUS=0
	BEGIN
		exec db_SP_SYN_DESHABILITARSEGUIMIENTO @table_name
		SET @SQL = 'ALTER TABLE ' + @TABLE_NAME + ' DROP CONSTRAINT ' + @OBJECT_NAME
		EXEC(@SQL)
		print @SQL
		FETCH NEXT FROM curTablas INTO @TABLE_NAME, @OBJECT_NAME,@TYPE
	END
	CLOSE curTablas
	DEALLOCATE curTablas
go--	
-----------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_DESHABILITARSEGUIMIENTO','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_DESHABILITARSEGUIMIENTO
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[db_SP_SYN_DESHABILITARSEGUIMIENTO]
 @cd_tbl_name varchar(30)
AS
BEGIN
	SET NOCOUNT ON;
	declare @palabra nvarchar(1000)
	begin
	set @palabra ='ALTER TABLE '+@cd_tbl_name+' DISABLE CHANGE_TRACKING'
	BEGIN TRY
	exec (@palabra)
	END TRY
	BEGIN CATCH
	PRINT 'NO HAY SEGUIMIENTO A CAMBIOS ACTIVO EN TABLA '+@cd_tbl_name
	END CATCH
	end
END
go--
-----------------------------------------------
IF OBJECT_ID('dbo.db_SP_CREARPRIMARYKEYS','P') IS NOT NULL	DROP PROCEDURE db_SP_CREARPRIMARYKEYS
GO
CREATE PROCEDURE [dbo].[db_SP_CREARPRIMARYKEYS]
 AS
	SET NOCOUNT ON;
	declare @TABLE_NAME nvarchar(256)
	DECLARE curTablas CURSOR
		FOR select DISTINCT NOMTABLA from esq_tablasprd where PRIMARYKEY=1 
	OPEN curTablas 
	FETCH NEXT FROM curTablas InTO @TABLE_NAME
	WHILE @@FETCH_STATUS=0
	BEGIN
		Exec db_sp_PRIMARYKEY @TABLE_name
		FETCH NEXT FROM curTablas INTO @TABLE_NAME
	END
	CLOSE curTablas
	DEALLOCATE curTablas
go--
--------------------------------------------------------------
IF OBJECT_ID('dbo.db_sp_PRIMARYKEY','P') IS NOT NULL	DROP PROCEDURE db_sp_PRIMARYKEY
GO
CREATE PROCEDURE [dbo].[db_sp_PRIMARYKEY]
 @cd_tbl_name varchar(30)
AS
BEGIN
	SET NOCOUNT ON;
	 if object_id('tempdb..#temp_pk')is not  null
				begin
					DROP TABLE #temp_pk
				end
	select * into #temp_pk from esq_tablasprd where NOMTABLA=@cd_tbl_name and PRIMARYKEY=1 order by POSICION asc
	declare @palabra nvarchar(1000)
	declare @sql nvarchar(1000)
	declare @campo nvarchar(1000)
	declare @longitud nvarchar(1000)
	declare @posdecimal nvarchar(1000)
	declare @tipodato nvarchar(1000)
	declare @ultimo nvarchar(300)
	begin
	set @palabra ='ALTER TABLE [dbo].['+@cd_tbl_name+'] ADD  CONSTRAINT [PK_'+@cd_tbl_name+'] PRIMARY KEY CLUSTERED ('
	set @ultimo=(select NOMCAMPO  from #temp_pk where POSICION=(select max(POSICION) from #temp_pk));
	DECLARE curCampos CURSOR
		FOR select NOMCAMPO,LONGITUD,TIPODATO,POSDECIMAL from #temp_pk order by POSICION asc 
	OPEN curCampos 
	FETCH NEXT FROM curCampos InTO @campo,@longitud,@tipodato,@posdecimal
	WHILE @@FETCH_STATUS=0
	BEGIN

	BEGIN try
	IF(@longitud=0 OR @tipodato='int' )
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@cd_tbl_name+' ALTER COLUMN '+@campo+' '+@tipodato+' not null;' 
			EXEC SP_EXECUTESQL @sql
		END
		ELSE IF(@tipodato='decimal')
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@cd_tbl_name+' ALTER COLUMN '+@campo+' '+@tipodato+'('+@longitud+','+@posdecimal+') not null;' 
			EXEC SP_EXECUTESQL @sql
		END
		ELSE IF(@longitud=-1)
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@cd_tbl_name+' ALTER COLUMN '+@campo+' '+@tipodato+'(MAX) not null;' 
			EXEC SP_EXECUTESQL @sql
		END
		ELSE
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@cd_tbl_name+' ALTER COLUMN '+@campo+' '+@tipodato+'('+@longitud+') not null;' 
			EXEC SP_EXECUTESQL @sql
		END
		END TRY
		BEGIN CATCH
		Print 'No Hubo Cambio Necesario para la creacion de la pk'
		END CATCH

	if @campo=@ultimo
	begin 
	set @palabra=@palabra+' '+@campo+' ASC '
	END
	else
	set @palabra=@palabra+' '+@campo+' ASC ,'
	FETCH NEXT FROM curCampos INTO @campo,@longitud,@tipodato,@posdecimal
	end
	END 
	CLOSE curCampos
	DEALLOCATE curCampos
	set @palabra=@palabra+ ' ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)'
	begin try
	exec (@palabra)
	exec db_SP_SYN_HABILITARSEGUIMIENTO @cd_tbl_name
	end try
	begin catch
	--PRINT 'No se inserto en la tabla '+@cd_tbl_name
	select ERROR_MESSAGE() AS ErrorMessage;  
	end catch
end
go--
------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_HABILITARSEGUIMIENTO','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_HABILITARSEGUIMIENTO
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[db_SP_SYN_HABILITARSEGUIMIENTO]
 @cd_tbl_name varchar(30)
AS
BEGIN
	SET NOCOUNT ON;
	declare @palabra nvarchar(1000)
	begin
	set @palabra ='ALTER TABLE '+@cd_tbl_name+' ENABLE CHANGE_TRACKING'
	BEGIN TRY
	exec (@palabra)
	END TRY
	BEGIN CATCH
	PRINT 'YA HAY SEGUIMIENTO A CAMBIOS ACTIVO EN TABLA '+@cd_tbl_name
	END CATCH
	end
END

go--
--------------------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_DATOSTRANSACCION_BORRARTRIGGER','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_DATOSTRANSACCION_BORRARTRIGGER
GO
create PROCEDURE [dbo].[db_SP_SYN_DATOSTRANSACCION_BORRARTRIGGER]
 AS
	SET NOCOUNT ON;
	DECLARE curTablas CURSOR
		FOR SELECT cd_TBL_NAME FROM dbo.SYN_REG_VERSIONESTABLASERVIDOR
	DECLARE @cd_TBL_NAME VARCHAR(30)
	OPEN curTablas 
	FETCH NEXT FROM curTablas InTO @cd_TBL_NAME
	WHILE @@FETCH_STATUS=0
	BEGIN
		
		EXEC db_SP_SYN_TRIGGERS_Borrar @cd_TBL_NAME
		FETCH NEXT FROM curTablas InTO @cd_TBL_NAME
	END
	CLOSE curTablas
	DEALLOCATE curTablas
go--
----------------------------------------------------------------------	
IF OBJECT_ID('dbo.db_SP_SYN_TRIGGERS_Borrar','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_TRIGGERS_Borrar
GO
	SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[db_SP_SYN_TRIGGERS_Borrar]
 @cd_tbl_name varchar(30)
AS
BEGIN
	SET NOCOUNT ON;
	declare @palabra nvarchar(1000)
	IF OBJECT_ID ('changeCD_BD_ORIG_'+@cd_tbl_name, 'TR') IS NOT NULL  
	begin
	set @palabra ='DROP TRIGGER changeCD_BD_ORIG_'+@cd_tbl_name
     exec (@palabra)
	end
END
go--	
----------------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_DATOSTRANSACCION_CREARTRIGGER_PUNTO','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_DATOSTRANSACCION_CREARTRIGGER_PUNTO
GO

Create procedure [dbo].[db_SP_SYN_DATOSTRANSACCION_CREARTRIGGER_PUNTO]
as
begin
DECLARE @query VARCHAR(MAX)
DECLARE @nombreTabla VARCHAR(MAX)
DECLARE CURDATA2 CURSOR FOR 
SELECT CodTabla FROM dbo.SYN_TABLASPUBLICACION
OPEN CURDATA2
FETCH CURDATA2 INTO @nombreTabla
WHILE (@@FETCH_STATUS = 0)
BEGIN
	IF (dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN(@nombreTabla,'TABLA','NUEVO') = '')
	BEGIN
		SELECT 'Error al cargar informacion de llave primaria de la tabla' AS ErrorMessage, @nombreTabla AS TABLE_NAME
		FETCH CURDATA2 INTO @nombreTabla
		CONTINUE
	END
	SET @nombreTabla = UPPER(@nombreTabla)
	PRINT 'Creando el trigger de la tabla: ' + @nombreTabla
	PRINT ''
	SET @query = 
	'IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id)  = ''changeCD_BD_ORIG_' + @nombreTabla  + ''')
	BEGIN
		EXEC(''
		CREATE TRIGGER changeCD_BD_ORIG_' + @nombreTabla  + '
		on [' + @nombreTabla  + ']
		AFTER UPDATE
		AS
			IF APP_NAME() NOT IN (''''GSUpdater'''', ''''GSSync'''')
			BEGIN
				UPDATE [TABLA]
				SET SERVIDOR = @@SERVERNAME
				FROM [DBO].[' + @nombreTabla  + '] AS [TABLA]
				INNER JOIN [INSERTED] AS [NUEVO]
				ON (' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN(@nombreTabla,'TABLA','NUEVO') + ')
			END
		'')
	END'
	EXEC (@query)
	PRINT @query
	FETCH CURDATA2 INTO @nombreTabla
END
CLOSE CURDATA2
DEALLOCATE CURDATA2
END
go--
-------------------------------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_DATOSTRANSACCION_CREARTRIGGER_SERVER','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_DATOSTRANSACCION_CREARTRIGGER_SERVER
GO
Create procedure [dbo].[db_SP_SYN_DATOSTRANSACCION_CREARTRIGGER_SERVER]
as
begin
DECLARE @query VARCHAR(MAX)
DECLARE @nombreTabla VARCHAR(MAX)
DECLARE CURDATA2 CURSOR FOR 
SELECT CodTabla FROM dbo.SYN_TABLASPUBLICACION
OPEN CURDATA2
FETCH CURDATA2 INTO @nombreTabla
WHILE (@@FETCH_STATUS = 0)
BEGIN
	IF (dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN(@nombreTabla,'TABLA','NUEVO') = '')
	BEGIN
		SELECT 'Error al cargar informacion de llave primaria de la tabla' AS ErrorMessage, @nombreTabla AS TABLE_NAME
		FETCH CURDATA2 INTO @nombreTabla
		CONTINUE
	END
	SET @nombreTabla = UPPER(@nombreTabla)
	PRINT 'Creando el trigger de la tabla: ' + @nombreTabla
	PRINT ''
	SET @query = 
	'IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_NAME(object_id)  = ''changeCD_BD_ORIG_' + @nombreTabla  + ''')
	BEGIN
		EXEC(''
		CREATE TRIGGER changeCD_BD_ORIG_' + @nombreTabla  + '
		on [' + @nombreTabla  + ']
		AFTER UPDATE
		AS
			IF APP_NAME() NOT IN (''''GSUpdater'''', ''''GSSync'''')
			BEGIN
				UPDATE [TABLA]
				SET SERVIDOR = ''''SERVER''''
				FROM [DBO].[' + @nombreTabla  + '] AS [TABLA]
				INNER JOIN [INSERTED] AS [NUEVO]
				ON (' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveJOIN(@nombreTabla,'TABLA','NUEVO') + ')
			END
		'')
	END'
	EXEC (@query)
	PRINT @query
	FETCH CURDATA2 INTO @nombreTabla
END
CLOSE CURDATA2
DEALLOCATE CURDATA2
END
go--
-------------------------------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_CAMBIARDEFAULTDESERVIDOR_PUNTO','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_CAMBIARDEFAULTDESERVIDOR_PUNTO
GO
create PROCEDURE [dbo].[db_SP_SYN_CAMBIARDEFAULTDESERVIDOR_PUNTO]
 AS
	SET NOCOUNT ON;
	DECLARE curTablas CURSOR
		FOR SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME='SERVIDOR' AND COLUMN_DEFAULT<>'(@@SERVERNAME)'
	DECLARE @cd_TBL_NAME VARCHAR(30)
	OPEN curTablas 
	FETCH NEXT FROM curTablas InTO @cd_TBL_NAME
	WHILE @@FETCH_STATUS=0
	BEGIN
		
		EXEC db_SP_SYN_CAMBIAR_SERVERNAME @cd_TBL_NAME,'PUNTO'
		FETCH NEXT FROM curTablas InTO @cd_TBL_NAME
	END
	CLOSE curTablas
	DEALLOCATE curTablas
go--
----------------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_CAMBIARDEFAULTDESERVIDOR_SERVER','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_CAMBIARDEFAULTDESERVIDOR_SERVER
GO
create PROCEDURE [dbo].[db_SP_SYN_CAMBIARDEFAULTDESERVIDOR_SERVER]
 AS
	SET NOCOUNT ON;
	DECLARE curTablas CURSOR
		FOR SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME='SERVIDOR' 
	DECLARE @cd_TBL_NAME VARCHAR(30)
	OPEN curTablas 
	FETCH NEXT FROM curTablas InTO @cd_TBL_NAME
	WHILE @@FETCH_STATUS=0
	BEGIN
		
		EXEC db_SP_SYN_CAMBIAR_SERVERNAME @cd_TBL_NAME,'SERVER'
		FETCH NEXT FROM curTablas InTO @cd_TBL_NAME
	END
	CLOSE curTablas
	DEALLOCATE curTablas
go--
----------------------------------------------------------------------
IF OBJECT_ID('dbo.db_SP_SYN_CAMBIAR_SERVERNAME','P') IS NOT NULL	DROP PROCEDURE db_SP_SYN_CAMBIAR_SERVERNAME
GO	
	SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[db_SP_SYN_CAMBIAR_SERVERNAME]
 @cd_tbl_name varchar(30),
 @tipo varchar(20)
AS
BEGIN
	SET NOCOUNT ON;
	declare @palabra nvarchar(1000)
	declare @default nvarchar(1000)
	declare @fallo nvarchar(2000)
	begin
	set @default= 'DF_'+@cd_tbl_name+'_servidor'
	set @palabra ='ALTER TABLE '+@cd_tbl_name+' DROP CONSTRAINT '+@default
	BEGIN TRY  
     exec (@palabra)
	END TRY  
	BEGIN CATCH  
      set @palabra ='ALTER TABLE '+@cd_tbl_name+' DROP CONSTRAINT '+@default+'_DF'
	  begin try
	  exec (@palabra)
	  end try
	  begin catch
	  set @fallo=(select name from sys.objects where type ='D' and OBJECT_NAME(parent_object_id)=@cd_tbl_name and name like '%servi%')
	  set @palabra='ALTER TABLE '+@cd_tbl_name+' DROP CONSTRAINT '+@fallo
	  exec (@palabra)
	  end catch
	END CATCH  
	if @tipo='SERVER'
	begin
	set @palabra= 'ALTER TABLE '+@cd_tbl_name+' ADD CONSTRAINT '+@default+' DEFAULT (''SERVER'') for SERVIDOR'
	exec (@palabra)
	end
	else
	if @tipo='PUNTO'
	begin
	set @palabra= 'ALTER TABLE '+@cd_tbl_name+' ADD CONSTRAINT '+@default+' DEFAULT (@@SERVERNAME) for SERVIDOR'
	exec (@palabra)
	end
	end
END
go--