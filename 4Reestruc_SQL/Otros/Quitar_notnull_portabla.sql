DECLARE @query VARCHAR(MAX)
DECLARE @nombreTabla VARCHAR(MAX)
DECLARE @nombreColumna VARCHAR(MAX)
DECLARE @tipo VARCHAR(MAX)
DECLARE @cm VARCHAR(MAX)
DECLARE @np int
DECLARE @ns int
DECLARE curFacturas CURSOR
FOR
SELECT TABLE_NAME, column_name, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
where IS_NULLABLE = 'NO' and TABLE_NAME = 'nom_transaccion'

OPEN curFacturas
FETCH curFacturas INTO @nombreTabla, @nombreColumna, @tipo, @cm, @np, @ns
WHILE (@@FETCH_STATUS = 0)
BEGIN
	FETCH curFacturas INTO @nombreTabla, @nombreColumna, @tipo, @cm, @np, @ns
	DECLARE @extra varchar(MAX)
	set @extra = ''
	IF @cm is not null
	begin 
		set @extra = '(' + @cm + ')'
	end
	IF @np is not null and @ns is not null
	begin 
		set @extra = '(' + cast(@np as varchar) + ', ' + cast(@ns as varchar) + ')'
	end
	SET @query = 'ALTER TABLE ' + @nombreTabla + ' ALTER COLUMN ' + @nombreColumna + ' ' + @tipo + @extra
	exec (@query)
	print @query
END
CLOSE curFacturas
DEALLOCATE curFacturas
