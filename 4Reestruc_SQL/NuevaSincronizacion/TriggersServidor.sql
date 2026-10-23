DECLARE @query VARCHAR(MAX)
DECLARE @nombreTabla VARCHAR(MAX)
DECLARE curFacturas CURSOR
FOR 
SELECT CodTabla FROM dbo.SYN_TABLASPUBLICACION
OPEN curFacturas
FETCH curFacturas INTO @nombreTabla
WHILE (@@FETCH_STATUS = 0)
BEGIN
	FETCH curFacturas INTO @nombreTabla
	SET @nombreTabla = UPPER(@nombreTabla)
	PRINT 'Creando el trigger de la tabla: ' + @nombreTabla
	PRINT ''
	SET @query = 
	'IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) =''changeCD_BD_ORIG_' +
	@nombreTabla  + ''')
	BEGIN
	DROP TRIGGER  changeCD_BD_ORIG_' + @nombreTabla  + '
	END'
	EXEC (@query)
	PRINT @query
	PRINT 'GO'

	SET @query = 
	'CREATE TRIGGER [changeCD_BD_ORIG_' + @nombreTabla  + '] on [' + @nombreTabla  + ']
	AFTER Update
	AS
	IF APP_NAME() NOT IN (''GSUpdater'', ''GSSync'', ''Globalsoft Net'')
	BEGIN
		UPDATE [TABLA]
		SET SERVIDOR = ''SERVER''
		FROM [DBO].[' + @nombreTabla  + '] AS [TABLA] 
		INNER JOIN [INSERTED] AS [NUEVO]
		ON (' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviarllaveSERVERJOINSERVER(@nombreTabla,'TABLA','NUEVO') + ')
	END'
	EXEC (@query)
	PRINT @query
	PRINT 'GO -- ' + @nombreTabla 
	PRINT ''
END
CLOSE curFacturas
DEALLOCATE curFacturas
