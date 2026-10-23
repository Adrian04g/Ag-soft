alter FUNCTION dbo.db_FC_SYN_DATOSTRANSACCION_EnviarColumnaDefinicion(
	@cd_TBL_NAME VARCHAR(20) ,
	@cd_COL_NAME VARCHAR(200))
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @ds_Definicion VARCHAR(2000)
	DECLARE @ds_DataType VARCHAR(40)
	DECLARE @am_CharacterMaximumLength NUMERIC(10)
	DECLARE @am_NumericPrecision NUMERIC(10)
	DECLARE @am_NumericScale NUMERIC(10)

	SELECT @ds_DataType = DATA_TYPE
		, @am_CharacterMaximumLength = CHARACTER_MAXIMUM_LENGTH 
		, @am_NumericPrecision = NUMERIC_PRECISION
		, @am_NumericScale = NUMERIC_SCALE
		FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @cd_TBL_NAME
		AND TABLE_CATALOG = DB_NAME()
		AND COLUMN_NAME = @cd_COL_NAME
	IF (@ds_DataType IS NULL)
	BEGIN
		SET @ds_Definicion=''
	END
	ELSE
	BEGIN
		SET @ds_Definicion='[' + @cd_COL_NAME+'] ' + @ds_DataType
		IF (NOT @ds_DataType IN('SMALLDATETIME','DATETIME','DATE','BIT'))
		BEGIN
			IF (@ds_DataType IN('NUMERIC','DECIMAL'))
			BEGIN
				SET @ds_Definicion = @ds_Definicion + '(' + CONVERT(VARCHAR(10),@am_NumericPrecision) + ',' + CONVERT(VARCHAR(10),@am_NumericScale) + ')'
			END
			ELSE
			BEGIN
				IF (@ds_DataType IN('UNIQUEIDENTIFIER','FLOAT','INT'))
				BEGIN
					SET @ds_Definicion = @ds_Definicion 
				END
				ELSE
				BEGIN
					IF (@ds_DataType IN('NVARCHAR','VARCHAR') AND @am_CharacterMaximumLength=-1)
					BEGIN
						SET @ds_Definicion = @ds_Definicion + '(MAX)'
					END
					ELSE
					BEGIN
						SET @ds_Definicion = @ds_Definicion + '(' + CONVERT(VARCHAR(10),@am_CharacterMaximumLength) + ')'
					END
				END
			END
		END
	END
	RETURN (IsNull(@ds_Definicion,''))
END