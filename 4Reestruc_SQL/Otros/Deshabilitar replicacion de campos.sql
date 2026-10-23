DECLARE @strPublicacion VARCHAR(120)

DECLARE curPublicaciones CURSOR
	FOR
	SELECT name
		FROM dbo.syspublications

OPEN curPublicaciones
FETCH NEXT FROM curPublicaciones INTO @strPublicacion
DECLARE @strInstruccionSQL NVARCHAR(MAX)
DECLARE @strMensaje VARCHAR(150)
WHILE @@FETCH_STATUS=0
BEGIN
	SET @strMensaje = 'Deshabilitando publicacion en cambios de esquema para publicacion ' +  @strPublicacion
	RAISERROR(@strMensaje,10,1)
	SET @strInstruccionSQL = 'EXEC sp_changepublication @publication = N'''+@strInstruccionSQL+''', @property = N''replicate_ddl'', @value = 0'
	EXEC (@strInstruccionSQL)
	FETCH NEXT FROM curPublicaciones INTO @strPublicacion
END
CLOSE curPublicaciones
DEALLOCATE curPublicaciones

RAISERROR('Fin',10,1)
