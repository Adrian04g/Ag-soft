BEGIN TRANSACTION
DECLARE @strTable VARCHAR(50)
DECLARE @strDefaultName VARCHAR(150)
DECLARE @strCampo VARCHAR(150)
 
SET @strTable = 'com_notastemp'
SET @strCampo = 'valorcruce'
SELECT @strDefaultName=CONST.name
       FROM sys.default_constraints const
       INNER JOIN sys.columns columns ON (const.object_id=columns.default_object_id)
       WHERE const.parent_object_id=object_id(@strTable,'U')
       AND columns.name=@strCampo
 
IF NOT @strDefaultName IS NULL
BEGIN
       DECLARE @strCadenaSQL NVARCHAR(MAX)
       SET @strCadenaSQL='ALTER TABLE ' + @strTable + ' DROP CONSTRAINT ' + @strDefaultName
       EXEC (@strCadenaSQL)
       print 'Eliminado'
END
 
ROLLBACK
 