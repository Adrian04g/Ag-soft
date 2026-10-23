DECLARE @SqlQuery VARCHAR(300)
DECLARE @SqlQuery2 VARCHAR(300)
DECLARE @i numeric(10)
set @i = 1
DECLARE INDEXES CURSOR 
FOR
SELECT 'ALTER INDEX [' + i.name + '] ON [dbo].[' + t.name + '] REORGANIZE WITH ( LOB_COMPACTION = ON )' as sqlQuery,
'ALTER INDEX ' + i.name + ' ON ' + t.name + ' REBUILD' as SqlQuery2
FROM SYS.indexes as i
inner join sys.tables as t on (i.object_id = t.object_id)
WHERE i.NAME is not null
OPEN INDEXES
FETCH INDEXES INTO @SqlQuery, @SqlQuery2
WHILE (@@FETCH_STATUS = 0)
	BEGIN 
	FETCH INDEXES INTO @SqlQuery, @SqlQuery2
		print concat(@i,  ' - ', @SqlQuery)
		EXEC (@SqlQuery)
		print concat(@i,  ' - ', @SqlQuery2)
		EXEC (@SqlQuery2)
		set @i = @i + 1
	END
CLOSE INDEXES
DEALLOCATE INDEXES
