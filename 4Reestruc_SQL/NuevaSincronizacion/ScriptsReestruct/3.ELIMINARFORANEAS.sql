DECLARE @SQL as varchar(2000)
DECLARE @Schema as varchar(200)
DECLARE @Table as varchar(200)
DECLARE @Constraint as varchar(200)

DECLARE FKCursor CURSOR READ_ONLY FOR
SELECT Table_Schema,Table_Name, Constraint_Name
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'

OPEN FKCursor
FETCH NEXT FROM FKCursor INTO @Schema,@Table,@Constraint
WHILE (@@fetch_status <> -1)
BEGIN
 IF (@@fetch_status <> -2)
 BEGIN
  EXEC ('ALTER TABLE  '+ @Schema + '.[' + @Table+ '] DROP CONSTRAINT [' + @Constraint + ']')
 END
 FETCH NEXT FROM FKCursor INTO @Schema,@Table,@Constraint
END

CLOSE FKCursor
DEALLOCATE FKCursor