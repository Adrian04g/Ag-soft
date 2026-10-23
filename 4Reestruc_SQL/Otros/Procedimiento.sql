IF OBJECT_ID('db_SP_Crear_Tablas','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Crear_Tablas
GO
CREATE PROCEDURE [dbo].[db_SP_Crear_Tablas]
AS	
BEGIN
	DECLARE	@Tabla	VARCHAR(100)
	DECLARE	@Sql	VARCHAR(MAX)
	DECLARE	@SqlPK	VARCHAR(MAX)
	DECLARE	@SqlCampo VARCHAR(MAX)
	DECLARE		CurRecorreTablas	CURSOR FOR
		SELECT DISTINCT NomTabla FROM dbo.esq_tablasprd GROUP BY NomTabla ORDER BY NomTabla
		OPEN CurRecorreTablas
	FETCH NEXT FROM CurRecorreTablas INTO @Tabla
	WHILE(@@FETCH_STATUS=0) 
	BEGIN
		DECLARE		@Campo			VARCHAR(100)
		DECLARE		@TipoDato		VARCHAR(100)	
		DECLARE		@longitud		VARCHAR(100)
		DECLARE		@default		VARCHAR(100)
		DECLARE		@identidad		BIT
		DECLARE		@nullvalues		BIT
		DECLARE		@primarykey		BIT
		DECLARE		@check_const	VARCHAR(512)
		DECLARE		@Num			INT	
		DECLARE		@Cont			INT		=	1
		DECLARE		CurCrearCampo	CURSOR FOR
			SELECT NomCampo,TipoDato,Longitud,vlrdefault,identidad,nullvalues,primarykey,check_constraint FROM dbo.esq_tablasprd WHERE NomTabla=@Tabla
				ORDER BY Posicion
		OPEN		CurCrearCampo
		FETCH NEXT FROM  CurCrearCampo INTO @Campo, @TipoDato, @longitud,@default,@identidad,@nullvalues,@primarykey,@check_const
		SET @SqlPK=null
		SET @SqlCampo = ' '
		SET @Sql= 'IF OBJECT_ID(N''dbo.['+@Tabla+']'', N''U'')IS NULL '
		SET @Sql= @Sql+'BEGIN '
		SET @Sql= @Sql+ SPACE(2)+'CREATE TABLE dbo.'+@Tabla+'('
		SELECT	@Num	=	@@CURSOR_ROWS;
		WHILE(@@FETCH_STATUS=0)
		BEGIN
			IF (@Cont>1)
				SET @SqlCampo = @SqlCampo+','
			SET @SqlCampo = @SqlCampo + SPACE(4)+'['+@Campo+'] '
			SET @SqlCampo = @SqlCampo + @TipoDato
			IF(@longitud<=0 OR @TipoDato='int' OR  @TipoDato='image')
			BEGIN
				IF (@TipoDato='int' OR  @TipoDato='image')
				BEGIN
					IF (@identidad=1)
						SET @SqlCampo = @SqlCampo + ' IDENTITY(1,1)'
				END
				ELSE IF (@longitud=-1) and (@TipoDato!='xml')
					SET @SqlCampo= @SqlCampo+ '(MAX)'
			END
			ELSE 
			BEGIN
				SET @SqlCampo= @SqlCampo+ '('+@longitud+')'
			END
			IF (@nullvalues=0)
				SET @SqlCampo = @SqlCampo + SPACE(1) + ' NOT NULL '

			IF (IsNull(@Default,'')<>'')
				SET @SqlCampo = @SqlCampo + SPACE(1) + ' DEFAULT ' + @default
			IF (NOT IsNull(@check_const,'')='')
				SET @SqlCampo = @SqlCampo + ', CONSTRAINT CK_'+@tabla+'_'+@Campo+' CHECK (' + @check_const +')'
			SET @Cont	=	@Cont	+	1
			FETCH NEXT FROM  CurCrearCampo INTO @Campo, @TipoDato, @longitud,@default,@identidad,@nullvalues,@primarykey,@check_const
		END
		SELECT @SqlPK = COALESCE(@SqlPK + ',' + NomCampo,NomCampo) FROM dbo.esq_tablasprd WHERE NomTabla=@Tabla AND PRIMARYKEY=1
		SET @Sql = @Sql + @SqlCampo
		IF (NOT IsNull(@SqlPK,'')='')
			SET @Sql = @Sql + ', CONSTRAINT PK_'+@tabla+' PRIMARY KEY('+@SqlPK+')'
		SET @Sql= @Sql+ SPACE(2)+')'
		SET @Sql= @Sql+ ' END'
		begin try
		EXEC( @sql )
		end try
		begin catch
		Print @sql
		end catch  
		CLOSE		CurCrearCampo
		DEALLOCATE	CurCrearCampo
		FETCH NEXT FROM CurRecorreTablas INTO @Tabla
	END
	CLOSE		CurRecorreTablas
	DEALLOCATE	CurRecorreTablas
END
GO
IF OBJECT_ID('db_SP_Diagnostico_Estructuras_BD','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Diagnostico_Estructuras_BD
GO
CREATE PROCEDURE [dbo].[db_SP_Diagnostico_Estructuras_BD]
AS
	SELECT	 'C' AS tipo 
			,t.TABLE_SCHEMA		AS esquema 
			, t.table_name		AS NomTabla
			, c.COLUMN_NAME		AS NomCampo
			, c.DATA_TYPE		AS TipoDato
			, IIF(c.CHARACTER_MAXIMUM_LENGTH IS NULL,IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_PRECISION ,0),c.CHARACTER_MAXIMUM_LENGTH)  AS						Longitud 
			, isnull(IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_SCALE,0),0) AS DECIMAL 
			, c.COLUMN_DEFAULT AS VlrDefault
			, df.name AS NomDefault
			INTO #tempEstructura
			FROM	INFORMATION_SCHEMA.TABLES t
			INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c ON c.TABLE_NAME = t.TABLE_NAME
			INNER JOIN  sys.columns AS sc ON sc.object_id = object_id(t.TABLE_NAME,'U') AND sc.name = c.COLUMN_NAME
			LEFT JOIN sys.default_constraints AS df ON df.object_id = sc.default_object_id
			WHERE	TABLE_TYPE = 'BASE TABLE'
			IF OBJECT_ID('tempdb..##tempDiagnostico') IS NOT NULL
			BEGIN
				DROP TABLE ##tempDiagnostico
			END
			CREATE TABLE ##tempDiagnostico
			(
				estado VARCHAR(100) NULL,
				tabla VARCHAR(50) NULL,
				campo VARCHAR(50) NULL,
				tipo VARCHAR(50) NULL,
				longitud VARCHAR(50) NULL,
				posdecimal VARCHAR(50) NULL,
				observacion VARCHAR(50) NULL
			) 
			INSERT INTO ##tempDiagnostico(estado,tabla,observacion)
			SELECT	'TNE',NomTabla,'TABLA NO EXISTE'
			FROM	dbo.esq_tablasprd 
			WHERE	NomTabla NOT IN (SELECT NomTabla FROM #tempEstructura)
					GROUP BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,posdecimal,observacion)
				SELECT 'CNE',NomTabla,NomCampo,TipoDato,Longitud,POSDECIMAL,'CAMPO NO EXISTE'
				FROM	dbo.esq_tablasprd 
				WHERE	CONCAT(NomTabla,NomCampo) NOT IN 
						(	SELECT CONCAT(NomTabla,NomCampo) 
							FROM #tempEstructura) and NomTabla IN (SELECT NomTabla FROM #tempEstructura)
						ORDER BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,posdecimal,observacion)
				SELECT	'CDT',NomTabla,NomCampo,TipoDato,Longitud,POSDECIMAL,'EL TIPO DE DATO NO COINCIDE CON LA TABLA REESTRUCT'
				FROM	dbo.esq_tablasprd 
				WHERE	CONCAT(NomTabla,NomCampo,rtrim(TipoDato)) NOT IN 
						(SELECT CONCAT(NomTabla,NomCampo,rtrim(TipoDato)) 
						 FROM #tempEstructura) and 	CONCAT(NomTabla,NomCampo) IN (SELECT CONCAT(NomTabla,NomCampo) FROM #tempEstructura)
				ORDER BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,posdecimal,observacion)
				SELECT 'CDL',NomTabla,NomCampo,TipoDato,Longitud,POSDECIMAL,'LA LONGITUD NO COINCIDE CON LA TABLA REESTRUCT'
				FROM	dbo.esq_tablasprd 
				WHERE	CONCAT(NomTabla,NomCampo,rtrim(TipoDato),Longitud,POSDECIMAL) NOT IN 
						(SELECT CONCAT(NomTabla,NomCampo,rtrim(TipoDato),Longitud,DECIMAL) FROM #tempEstructura) and 
						CONCAT(NomTabla,NomCampo,rtrim(TipoDato)) IN (SELECT CONCAT(NomTabla,NomCampo,rtrim(TipoDato)) 
																FROM #tempEstructura)
						ORDER BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,posdecimal,observacion)
			SELECT	'CNT',#tempEstructura.NomTabla,#tempEstructura.NomCampo,#tempEstructura.TipoDato,#tempEstructura.Longitud,POSDECIMAL,'EL CAMPO NO EXISTE EN LA TABLA REESTRUCT' 
				FROM	dbo.esq_tablasprd a RIGHT join #tempEstructura on #tempEstructura.NomTabla=a.NomTabla and #tempEstructura.NomCampo=a.NomCampo
				Where a.NomCampo is null
				ORDER BY #tempEstructura.NomTabla

			SELECT * FROM ##tempDiagnostico		
GO
IF OBJECT_ID('db_SP_Crear_Campos','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Crear_Campos
GO
CREATE PROCEDURE [dbo].[db_SP_Crear_Campos]
AS	
BEGIN
	DECLARE @estado		VARCHAR(100)
	DECLARE @tabla		VARCHAR(100)
	DECLARE @campo		VARCHAR(100)
	DECLARE	@tipodato	VARCHAR(100)
	DECLARE @longitud	VARCHAR(100)
	DECLARE @posdecimal	VARCHAR(100)
	DECLARE	@vlrdefault	VARCHAR(100)
	DECLARE @sql		NVARCHAR(MAX)
	exec db_SP_Diagnostico_Estructuras_BD;
	DECLARE curCrearCampos CURSOR FOR
		SELECT	Temp.estado,Temp.tabla,Temp.campo,Temp.tipo,Temp.longitud,Res.VlrDefault,temp.POSDECIMAL
		FROM	##tempDiagnostico Temp 
		LEFT JOIN dbo.esq_tablasprd Res ON CONCAT(Temp.tabla,Temp.campo)=CONCAT(Res.NomTabla,Res.NomCampo)
		WHERE Temp.estado='CNE'
	OPEN curCrearCampos
	FETCH NEXT FROM curCrearCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud,@vlrdefault,@posdecimal
	WHILE(@@FETCH_STATUS=0) 
	BEGIN
	BEGIN TRY
			IF(@longitud=0 OR @tipodato='int')
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ADD ['+@campo+'] '+@tipodato+' CONSTRAINT DF_'+@tabla+'_'+@campo+' DEFAULT '+@vlrdefault+' WITH VALUES ;'
				EXEC SP_EXECUTESQL @sql
				print @sql
			END
			ELSE IF(@tipodato='decimal' or @tipodato='numeric')
			BEGIN
				SET @sql='ALTER TABLE dbo.'+@tabla+' ADD ['+@campo+'] '+@tipodato+'('+@longitud+','+@posdecimal+') CONSTRAINT DF_'+@tabla+'_'+@campo+' DEFAULT '+@vlrdefault+' WITH VALUES ;'
				EXEC SP_EXECUTESQL @sql
				print @sql
			END
			ELSE IF(@longitud=-1)
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ADD ['+@campo+'] '+@tipodato+'(MAX)  CONSTRAINT DF_'+@tabla+'_'+@campo+' DEFAULT '+@vlrdefault+' WITH VALUES ;' 
				EXEC SP_EXECUTESQL @sql
				print @sql
			END
			ELSE
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ADD ['+@campo+'] '+@tipodato+'('+@longitud+') CONSTRAINT DF_'+@tabla+'_'+@campo+' DEFAULT '+@vlrdefault+' WITH VALUES ;'
				EXEC SP_EXECUTESQL @sql
				print @sql
			END	
		END TRY
		BEGIN CATCH
		print @sql
		END CATCH
		FETCH NEXT FROM curCrearCampos   
			INTO @estado, @tabla, @campo, @tipodato, @longitud,@vlrdefault,@posdecimal
	 END
	 CLOSE curCrearCampos
	 DEALLOCATE curCrearCampos
END
GO
IF OBJECT_ID('db_SP_Tabla_Alterar_Estructura','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Tabla_Alterar_Estructura
GO
CREATE PROCEDURE [dbo].[db_SP_Tabla_Alterar_Estructura]
AS
BEGIN
	DECLARE @estado		VARCHAR(100)
	DECLARE @tabla		VARCHAR(100)
	DECLARE @campo		VARCHAR(100)
	DECLARE	@tipodato	VARCHAR(100)
	DECLARE @longitud	VARCHAR(100)
	DECLARE @sql		NVARCHAR(MAX)
	exec db_SP_Diagnostico_Estructuras_BD;
	IF OBJECT_ID('tempdb..##tempConstraint') IS NOT NULL
	BEGIN
		DROP TABLE ##tempConstraint
	END
	CREATE TABLE ##tempConstraint(
		nomtabla	VARCHAR(100),
		nomcampo	VARCHAR(100),
		tipodato	VARCHAR(100),
		longitud	VARCHAR(100),
		nomconst	VARCHAR(100),
		tipo		VARCHAR(100)
	)
	DECLARE curAlterarCampos CURSOR FOR
		SELECT estado,tabla,campo,tipo,longitud
		FROM ##tempDiagnostico
	OPEN curAlterarCampos
	FETCH NEXT FROM curAlterarCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud
	WHILE(@@FETCH_STATUS=0) 
	BEGIN	
		IF(@estado='CDT' OR @estado='CDL')
		BEGIN
			IF EXISTS(SELECT sco.name AS csql
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@tabla AND tc.name=@campo)
			BEGIN
				INSERT INTO ##tempConstraint
				(nomtabla,nomcampo,tipodato,longitud,nomconst,tipo)
				SELECT tb.name,tc.name,@tipodato,@longitud, sco.name,sco.type_desc
				FROM   sys.Objects tb
					INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
					INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
					INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
					WHERE tb.name=@tabla AND tc.name=@campo
			END
			IF EXISTS(SELECT ind.name 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@tabla AND cols.name=@campo)
			BEGIN
				INSERT INTO ##tempConstraint
				(nomtabla,nomcampo,tipodato,longitud,nomconst,tipo)
				SELECT @tabla,cols.name,@tipodato,@longitud,ind.name,ind.type_desc
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@tabla AND cols.name=@campo
			END
		END
		FETCH NEXT FROM curAlterarCampos   
			INTO @estado, @tabla, @campo, @tipodato, @longitud	
	END
	CLOSE		curAlterarCampos
	DEALLOCATE	curAlterarCampos
	SELECT * FROM ##tempConstraint 
END
GO
IF OBJECT_ID('db_SP_Alterar_Estructura_Eliminar','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Alterar_Estructura_Eliminar
GO
CREATE PROCEDURE [dbo].[db_SP_Alterar_Estructura_Eliminar]
AS
BEGIN
	DECLARE @nomtabla VARCHAR(100)
	DECLARE @nomcampo VARCHAR(100)
	DECLARE @tipodato VARCHAR(100)
	DECLARE @longitud VARCHAR(100)
	DECLARE @nomconst VARCHAR(100)
	DECLARE @tipo	  VARCHAR(100)
	DECLARE @sql	  NVARCHAR(MAX)
	exec db_SP_Tabla_Alterar_Estructura
	DECLARE curEliminarEstructura CURSOR FOR
		SELECT nomtabla,nomcampo,tipodato,longitud,nomconst,tipo
		FROM ##tempConstraint 
	OPEN curEliminarEstructura
	FETCH NEXT FROM curEliminarEstructura 
		INTO @nomtabla,@nomcampo,@tipodato,@longitud,@nomconst,@tipo
	WHILE(@@FETCH_STATUS=0)
	BEGIN
	BEGIN TRY  
		IF(@tipo='DEFAULT_CONSTRAINT')
		BEGIN
			IF EXISTS(SELECT sco.name AS csql
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@nomtabla AND tc.name=@nomcampo)
			BEGIN
				SET @sql='ALTER TABLE dbo.'+@nomtabla+' DROP CONSTRAINT '+@nomconst+';'	
				EXEC SP_EXECUTESQL @sql
			END
		END
		ELSE IF(@tipo='NONCLUSTERED')
		BEGIN
			IF EXISTS(SELECT ind.name 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@nomtabla AND cols.name=@nomcampo)
			BEGIN
				SET @sql='DROP INDEX '+@nomconst+' ON dbo.'+@nomtabla+';'
				EXEC SP_EXECUTESQL @sql
			END
		END
		ELSE IF(@tipo='CLUSTERED')
		BEGIN
			IF EXISTS(SELECT ind.name 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@nomtabla AND cols.name=@nomcampo)
			BEGIN
				SET @sql='ALTER TABLE dbo.'+@nomtabla+' DROP CONSTRAINT '+@nomconst+';'
				EXEC SP_EXECUTESQL @sql
			END
		END	
	END TRY
	BEGIN CATCH  
  
	END CATCH;  
		FETCH NEXT FROM curEliminarEstructura 
			INTO @nomtabla,@nomcampo,@tipodato,@longitud,@nomconst,@tipo
	END
	CLOSE	   curEliminarEstructura
	DEALLOCATE curEliminarEstructura
END
GO
IF OBJECT_ID('db_SP_Alterar_Estructura_Crear','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Alterar_Estructura_Crear
GO
CREATE PROCEDURE [dbo].[db_SP_Alterar_Estructura_Crear]
AS
BEGIN
	DECLARE @estado		VARCHAR(100)
	DECLARE @tabla		VARCHAR(100)
	DECLARE @campo		VARCHAR(100)
	DECLARE	@tipodato	VARCHAR(100)
	DECLARE @longitud	VARCHAR(100)
	DECLARE @posdecimal	VARCHAR(100)
	DECLARE	@vlrdefault	VARCHAR(100)
	DECLARE @sql		NVARCHAR(MAX)
	EXEC db_SP_Diagnostico_Estructuras_BD
	DECLARE curAlterarCampos CURSOR FOR
		SELECT	Temp.estado,Temp.tabla,Temp.campo,Temp.tipo,Temp.longitud,Res.VlrDefault,temp.POSDECIMAL
		FROM	##tempDiagnostico Temp
		LEFT JOIN dbo.esq_tablasprd Res ON CONCAT(Temp.tabla,Temp.campo)=CONCAT(Res.NomTabla,Res.NomCampo)
		WHERE Temp.estado ='CDT' OR Temp.estado ='CDL'
	OPEN curAlterarCampos
	FETCH NEXT FROM curAlterarCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud, @vlrdefault,@posdecimal
	WHILE(@@FETCH_STATUS=0) 
	BEGIN	
	BEGIN TRY  
		print 'entro'
		IF(@longitud=0 OR @tipodato='int' )
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@tabla+' ALTER COLUMN '+@campo+' '+@tipodato+';' 
			EXEC SP_EXECUTESQL @sql
		END
		ELSE IF(@tipodato='decimal' or @tipodato='numeric')
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@tabla+' ALTER COLUMN '+@campo+' '+@tipodato+'('+@longitud+','+@posdecimal+');' 
			EXEC SP_EXECUTESQL @sql
		END
		ELSE IF(@longitud=-1)
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@tabla+' ALTER COLUMN '+@campo+' '+@tipodato+'(MAX);' 
			EXEC SP_EXECUTESQL @sql
		END
		ELSE
		BEGIN
			SET @sql= 'ALTER TABLE dbo.'+@tabla+' ALTER COLUMN '+@campo+' '+@tipodato+'('+@longitud+');' 
			EXEC SP_EXECUTESQL @sql
		END

		IF(NOT ISNULL(@vlrdefault,'')='')
		BEGIN
			SET @sql= 'ALTER TABLE [dbo].['+@tabla+'] ADD  CONSTRAINT [DF_'+@tabla+'_'+@campo+']  DEFAULT '+@vlrdefault+' FOR ['+@campo+']'
			EXEC SP_EXECUTESQL @sql  
		END
	END TRY  
	BEGIN CATCH  
		print @tabla+' '+@campo;
		print @sql
	END CATCH 
	
		FETCH NEXT FROM curAlterarCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud, @vlrdefault,@posdecimal
	END
	CLOSE curAlterarCampos
	DEALLOCATE curAlterarCampos	
END
GO
IF OBJECT_ID('db_SP_Alterar_Estructura_default','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Alterar_Estructura_default
GO
CREATE PROCEDURE [dbo].[db_SP_Alterar_Estructura_default]
AS
BEGIN
	DECLARE @estado		VARCHAR(100)
	DECLARE @tabla		VARCHAR(100)
	DECLARE @campo		VARCHAR(100)
	DECLARE	@tipodato	VARCHAR(100)
	DECLARE @longitud	VARCHAR(100)
	DECLARE	@vlrdefault	VARCHAR(100)
	DECLARE @sql		NVARCHAR(MAX)
	DECLARE curAlterarCampos CURSOR FOR
		SELECT	nomtabla,nomcampo,tipodato,longitud,vlrdefault
		from dbo.esq_tablasprd 
		WHERE VLRDEFAULT != ''
	OPEN curAlterarCampos
	FETCH NEXT FROM curAlterarCampos   
		INTO  @tabla, @campo, @tipodato, @longitud, @vlrdefault
	WHILE(@@FETCH_STATUS=0) 
	BEGIN	
	BEGIN TRY 
		print 'entro' 
		IF(NOT ISNULL(@vlrdefault,'')='')
		BEGIN
			SET @sql='ALTER TABLE dbo.'+@tabla+' DROP CONSTRAINT [DF_'+@tabla+'_'+@campo+'];'	
				EXEC SP_EXECUTESQL @sql

			SET @sql= 'ALTER TABLE [dbo].['+@tabla+'] ADD  CONSTRAINT [DF_'+@tabla+'_'+@campo+']  DEFAULT '+@vlrdefault+' FOR ['+@campo+']'
			EXEC SP_EXECUTESQL @sql  
		END
	END TRY  
	BEGIN CATCH  
		print @tabla+' '+@campo;
		print @sql
	END CATCH 
	
		FETCH NEXT FROM curAlterarCampos   
		INTO  @tabla, @campo, @tipodato, @longitud, @vlrdefault
	END
	CLOSE curAlterarCampos
	DEALLOCATE curAlterarCampos	
END
GO
IF OBJECT_ID('dbo.db_SP_BORRARPRIMARYKEYS','P') IS NOT NULL	DROP PROCEDURE db_SP_BORRARPRIMARYKEYS
GO
CREATE PROCEDURE [dbo].[db_SP_BORRARPRIMARYKEYS]
 AS
	SET NOCOUNT ON;
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
GO
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
GO
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
GO
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
	PRINT 'No se inserto en la tabla '+@cd_tbl_name + ' ERROR : '+ ERROR_MESSAGE();
	exec db_SP_SYN_HABILITARSEGUIMIENTO @cd_tbl_name
	--select ERROR_MESSAGE() AS ErrorMessage;  
	end catch
end
GO
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
GO
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
GO
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
GO
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
GO
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
GO
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
GO
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
GO
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
GO
IF OBJECT_ID('db_SP_SYN_VERSION_ESTRUCTURA','P')IS NOT NULL  
	DROP PROCEDURE db_SP_SYN_VERSION_ESTRUCTURA
GO
CREATE PROCEDURE [dbo].[db_SP_SYN_VERSION_ESTRUCTURA]
	 @version numeric(30,0),@cd_BD_ORIG VARCHAR(300), @fecha datetime
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(1000)	
	SET @sql ='SELECT [version] , cd_bd_orig, dt_Version FROM dbo.syn_Estructura 
		WHERE cd_BD_ORIG='''+ @cd_BD_ORIG + ''' and [version] > '+convert(nvarchar,@version)
		+' and dt_Version>'+convert(nvarchar,convert(date,@fecha))
	
	EXEC (@sql)
END
Go
IF NOT EXISTS(Select * From dbo.sysobjects Where name='SYN_ESTRUCTURA')
begin 
CREATE TABLE [dbo].[SYN_ESTRUCTURA](
	[version] [numeric](30, 0) NOT NULL,
	[cd_BD_ORIG] [varchar](300) NOT NULL,
	[dt_Version] [datetime] NOT NULL DEFAULT (getdate()),
	[codcto] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_SYN_ESTRUCTURA] PRIMARY KEY CLUSTERED 
(
	[cd_BD_ORIG]  ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='esq_tablasprd')
begin 

CREATE TABLE [dbo].[esq_tablasprd](
	[NOMTABLA] [nvarchar](100) NOT NULL,
	[NOMCAMPO] [nvarchar](200) NOT NULL,
	[POSICION] [int] NOT NULL,
	[TIPODATO] [nvarchar](50) NOT NULL,
	[LONGITUD] [numeric](10, 0) NOT NULL,
	[POSDECIMAL] [numeric](10, 0) NOT NULL,
	[VLRDEFAULT] [nvarchar](50) NULL,
	[IDENTIDAD] [bit] NOT NULL DEFAULT ((0)),
	[NULLVALUES] [bit] NOT NULL DEFAULT ((0)),
	[PRIMARYKEY] [bit] NOT NULL DEFAULT ((0)),
	[CHECK_CONSTRAINT] [varchar](512) NOT NULL DEFAULT (''),
	[USUARIO] [nvarchar](100) NULL,
	[FECHACREACION] [datetime] NULL,
	[FECHAMODIFIC] [datetime] NULL,
	[ESTADO] [int] NOT NULL,
 CONSTRAINT [PK_ESQ_TABLASPRD] PRIMARY KEY CLUSTERED 
(
	[NOMTABLA] ASC,
	[NOMCAMPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end 
GO
IF OBJECT_ID('dbo.db_SP_BorrarCampos_Inexistentes','P') IS NOT NULL	DROP PROCEDURE db_SP_BorrarCampos_Inexistentes
GO
CREATE PROCEDURE [dbo].[db_SP_BorrarCampos_Inexistentes]
 AS
	SET NOCOUNT ON;
	DECLARE @tabla		VARCHAR(100)
	DECLARE @campo		VARCHAR(100)
	DECLARE @sql		NVARCHAR(MAX)
	exec db_SP_Diagnostico_Estructuras_BD
	DECLARE curTablas CURSOR
		FOR SELECT	Temp.tabla,Temp.campo
		FROM	##tempDiagnostico Temp 
		WHERE Temp.estado='CNT' and temp.tabla<>'esq_tablasprd'
	OPEN curTablas 
	FETCH NEXT FROM curTablas InTO @tabla, @campo
	WHILE @@FETCH_STATUS=0
	BEGIN
		set @sql='ALTER TABLE '+@tabla+' Drop COLUMN '+ @campo
		begin try
		EXEC (@sql)
		end try
		begin catch
		print @sql + ' ERROR : '+ ERROR_MESSAGE();
		end catch
		FETCH NEXT FROM curTablas InTO  @tabla, @campo
	END
	CLOSE curTablas
	DEALLOCATE curTablas
GO
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