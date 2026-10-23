--********************************************************
--***** PROYECTO MOTOR DE SINCRONIZACION GLOBALSOFT ******
--AUTOR..: Guzmán D. Darío
--FECHA..: 2017-01-29
--********************************************************
IF (SELECT GSSYNC FROM Glb_Parametros) = 1
BEGIN
	select 'El parametro GsSync debe ser igual a 0' as MessageResult
	return
END
/*
	Backup de objetos df (valores por defecto) que fueron definidos por el usuario.
*/
DECLARE @DFBACKUPCOUNT NUMERIC(5)
IF EXISTS (Select * From dbo.sysobjects Where name='DfBackup')
BEGIN
	SELECT 'La tabla DfBackUp Ya existe.' as MessageResult
	RETURN
END
create table DfBackup (
	TABLE_NAME nvarchar(256),
	COLUMN_NAME nvarchar(256),
	CONSTRAINT_NAME nvarchar(256),
	DEFAULT_VALUE nvarchar(256)
)

insert into DfBackup (TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, DEFAULT_VALUE)
SELECT  
		b.name AS TABLE_NAME,
		d.name AS COLUMN_NAME,
		'DF_' + b.name + '_' + d.name AS CONSTRAINT_NAME,
		CASE REPLACE(REPLACE(c.text, '(', ''), ')', '')
			WHEN 'getdate' then 'getdate()'
			ELSE REPLACE(REPLACE(c.text, '(', ''), ')', '')
		END AS DEFAULT_VALUE
	FROM sys.sysobjects as a INNER JOIN
		(SELECT name, id
			FROM sys.sysobjects 
			WHERE xtype = 'U') as b on (a.parent_obj = b.id)
						INNER JOIN sys.syscomments as c ON (a.id = c.id)
						INNER JOIN sys.syscolumns as d ON (d.cdefault = a.id)                                   
	WHERE a.xtype = 'D' and a.name not like 'ms%' and d.name <> 'rowguid'
	ORDER BY b.name, a.name
SET @DFBACKUPCOUNT = (SELECT COUNT(*) FROM DfBackup)
/*
	Borrado de llaves foraneas, triggers, valores por defecto, llaves primarias.
*/
DECLARE @PKCOUNT NUMERIC(5)
DECLARE @FKCOUNT NUMERIC(5)
DECLARE @TRCOUNT NUMERIC(5)
DECLARE @DFCOUNT NUMERIC(5)
SET @PKCOUNT = 0
SET @FKCOUNT = 0
SET @TRCOUNT = 0
SET @DFCOUNT = 0
declare @TABLE_NAME nvarchar(256)
declare @OBJECT_NAME nvarchar(256)
declare @TYPE char(2)
declare @SQL varchar(1000)
declare curData cursor FOR         
select OBJECT_NAME(parent_object_id), name, type from sys.objects where type in ('PK', 'F' ,'TR', 'D') order by type, name
OPEN curdata
FETCH curdata INTO @TABLE_NAME, @OBJECT_NAME, @TYPE
WHILE (@@FETCH_STATUS = 0)
BEGIN	
	SET @SQL = CASE 
	WHEN @TYPE IN ('D', 'F', 'pk') THEN 'ALTER TABLE ' + @TABLE_NAME + ' DROP CONSTRAINT ' + @OBJECT_NAME
	WHEN @TYPE = 'TR' THEN 'DROP TRIGGER ' + @OBJECT_NAME
	END
	EXEC(@SQL)
	PRINT @SQL + ' - ' + @TYPE
	IF @TYPE = 'D'
	BEGIN
		SET @DFCOUNT = @DFCOUNT + 1
	END
	IF @TYPE = 'F'
	BEGIN
		SET @FKCOUNT = @FKCOUNT + 1
	END
	IF @TYPE = 'PK'
	BEGIN
		SET @PKCOUNT = @PKCOUNT + 1
	END
	IF @TYPE = 'TR'
	BEGIN
		SET @TRCOUNT = @TRCOUNT + 1
	END
    FETCH curdata INTO @TABLE_NAME, @OBJECT_NAME, @TYPE
END 
CLOSE curdata
DEALLOCATE curdata
/*
	Backup de indices definidos por el usuario.
*/
DECLARE @INDEXESBACKUPCOUNT NUMERIC(5)
IF EXISTS (Select * From dbo.sysobjects Where name='IndexesBackup')
BEGIN
	SELECT 'La tabla IndexesBackup Ya existe.' as MessageResult
	RETURN
END
create table IndexesBackup (
	TABLE_NAME nvarchar(256),
	INDEX_NAME nvarchar(256),
	COLUMN_NAME nvarchar(256),
	SORT nvarchar(3),
	INDEX_TYPE nvarchar(120),
	ROW_LOCK BIT,
	PAGE_LOCK BIT,
	INCLUDED BIT
)

insert into IndexesBackup (TABLE_NAME, INDEX_NAME, COLUMN_NAME, SORT, INDEX_TYPE, ROW_LOCK, PAGE_LOCK, INCLUDED)
SELECT 
    t.name as TableName,
    ind.name as IndexName,
    col.name as ColumnName,
	case ic.is_descending_key 
		when 0 then 'ASC'
		ELSE 'DESC' 
	END as SORT,
	ind.type_desc,
	ind.allow_row_locks,
	ind.allow_page_locks,
	ic.is_included_column
FROM 
     sys.indexes ind 
INNER JOIN 
     sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
INNER JOIN 
     sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
INNER JOIN 
     sys.tables t ON ind.object_id = t.object_id 
WHERE 
     ind.is_primary_key = 0 
     AND ind.is_unique = 0 
     AND ind.is_unique_constraint = 0 
     AND t.is_ms_shipped = 0 
ORDER BY
     t.name, ind.name, ind.index_id, ic.index_column_id;
SET @INDEXESBACKUPCOUNT = (SELECT COUNT(*) FROM IndexesBackup)
/*
	Borrado de indices.
*/
DECLARE @INDEXESCOUNT NUMERIC(5)
SET @INDEXESCOUNT = 0
DECLARE @SqlQuery VARCHAR(1000)
DECLARE curINDEXES CURSOR 
FOR
SELECT 'DROP INDEX ' + t.name + '.' + i.name as sqlQuery FROM SYS.indexes as i
inner join sys.tables as t on (i.object_id = t.object_id)
WHERE i.type <> 0 and i.is_primary_key = 0 
OPEN curINDEXES
FETCH curINDEXES INTO @SqlQuery
WHILE (@@FETCH_STATUS = 0)
 BEGIN 
	print @sqlQuery
   EXEC (@SqlQuery)
   SET @INDEXESCOUNT = @INDEXESCOUNT + 1
 FETCH curINDEXES INTO @SqlQuery
END
CLOSE curINDEXES
DEALLOCATE curINDEXES
/*
	Borrado del campo rowguid.
*/
DECLARE @ROWGUIDCOUNT NUMERIC(5)
SET @ROWGUIDCOUNT = 0
DECLARE @SqlQuery2 VARCHAR(1000)
DECLARE curColumn CURSOR 
FOR
SELECT 'ALTER TABLE ' + TABLE_NAME + ' DROP COLUMN ' + COLUMN_NAME 
	from INFORMATION_SCHEMA.COLUMNS where DATA_TYPE = 'uniqueidentifier'
	AND NOT (TABLE_NAME LIKE 'MSMERGE_%'
		OR TABLE_NAME LIKE 'sys%'
		OR TABLE_NAME LIKE 'mssu%'
		OR TABLE_NAME LIKE 'msdyn%')
OPEN curColumn
FETCH curColumn INTO @SqlQuery2
WHILE (@@FETCH_STATUS = 0)
 BEGIN 
	print @SqlQuery2
    EXEC (@SqlQuery2)
	SET @ROWGUIDCOUNT = @ROWGUIDCOUNT + 1
 FETCH curColumn INTO @SqlQuery2
END
CLOSE curColumn
DEALLOCATE curColumn
/*
	Resultados.
*/
DECLARE @tempResults TABLE (Resultado nvarchar(1000), Cantidad numeric(5))
insert @tempResults (Resultado, Cantidad)
values 
('Numero de restricticiones (valores por defecto) copiados', @DFBACKUPCOUNT),
('Numero de llaves primarias eliminadas', @PKCOUNT),
('Numero de llaves foraneas eliminadas', @FKCOUNT),
('Numero de desencadenadores (triggers) eliminados', @TRCOUNT),
('Numero de restricticiones (valores por defecto) eliminados', @DFCOUNT),
('Numero de indices copiados', @INDEXESBACKUPCOUNT),
('Numero de indices eliminados', @INDEXESBACKUPCOUNT),
('numero de columnas (rowguid) eliminadas', @ROWGUIDCOUNT)
select * from @tempResults
