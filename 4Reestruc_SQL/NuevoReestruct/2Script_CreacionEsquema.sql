/***********************************************************************
 *		SCRIPT DE CREACION DE LA ESTRUCTURA DE LA BASE DE DATO		   *
 ***********************************************************************/
DECLARE		@Tabla				VARCHAR(100)
DECLARE		@Sql				VARCHAR(MAX)
DECLARE		CurRecorreTablas	CURSOR FOR
	SELECT NomTabla FROM dbo.[Restruc_table_Developer] GROUP BY NomTabla ORDER BY NomTabla
	OPEN CurRecorreTablas
FETCH NEXT FROM CurRecorreTablas INTO @Tabla
WHILE(@@FETCH_STATUS=0) 
BEGIN
	DECLARE		@Campo			VARCHAR(100)
	DECLARE		@Dato			VARCHAR(100)	
	DECLARE		@longitud		VARCHAR(100)
	DECLARE		@default		VARCHAR(100)
	DECLARE		@Num			INT	
	DECLARE		@Cont			INT		=	1
	DECLARE		CurCrearCampo	CURSOR FOR
				SELECT NomCampo,TipoDato,Longitud,vlrdefault FROM dbo.Restruc_table_Developer WHERE NomTabla=@Tabla
	OPEN		CurCrearCampo
	FETCH	NEXT	FROM  CurCrearCampo INTO @Campo, @Dato, @longitud,@default
	SET @Sql= 'IF OBJECT_ID(N''dbo.['+@Tabla+']'', N''U'')IS NULL '
	SET @Sql= @Sql+'BEGIN '
	SET @Sql= @Sql+ SPACE(2)+'CREATE TABLE dbo.'+@Tabla+'('
	SELECT	@Num	=	@@CURSOR_ROWS;
	WHILE(@@FETCH_STATUS=0)
	BEGIN
		IF(@longitud=0 OR @DATO='int' OR  @DATO='image')
		BEGIN
			IF (@Cont=@Num)
			BEGIN
				SET @Sql= @Sql+ SPACE(4)+'['+@Campo+'] '+@Dato+ 'NOT NULL DEFAULT '+ @default
			END
			ELSE
			BEGIN
				SET @Sql= @Sql+ SPACE(4)+'['+@Campo+'] '+@Dato+' NOT NULL DEFAULT '+ @default+','
			END
		END
		ELSE IF(@longitud=-1)
		BEGIN
			IF (@Cont=@Num)
			BEGIN
				SET @Sql= @Sql+ SPACE(4)+'['+@Campo+'] '+@Dato+'(MAX) NOT NULL DEFAULT '+ @default
			END
			ELSE
			BEGIN
				SET @Sql= @Sql+ SPACE(4)+'['+@Campo+'] '+@Dato+'(MAX) NOT NULL DEFAULT '+ @default+','
			END
		END
		ELSE 
		BEGIN
			IF (@Cont=@Num)
			BEGIN
				SET @Sql= @Sql+ SPACE(4)+'['+@Campo+'] '+@Dato+'('+@longitud+') NOT NULL DEFAULT '+ @default
			END
			ELSE
			BEGIN
				SET @Sql= @Sql+ SPACE(4)+'['+@Campo+'] '+@Dato+'('+@longitud+') NOT NULL DEFAULT '+ @default+','
			END
		END
		SET @Cont	=	@Cont	+	1
		FETCH	NEXT	FROM  CurCrearCampo INTO @Campo, @Dato, @longitud,@default
	END
	
	SET @Sql= @Sql+ SPACE(2)+')'
	SET @Sql= @Sql+ 'END'
	print @sql
	EXEC( @sql )  
	CLOSE		CurCrearCampo
	DEALLOCATE	CurCrearCampo
	FETCH NEXT FROM CurRecorreTablas INTO @Tabla
END
CLOSE		CurRecorreTablas
DEALLOCATE	CurRecorreTablas
/***********************************************************************
 *								FIN DE SCRIPT						   *
 ***********************************************************************/





