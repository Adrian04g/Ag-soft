

SELECT 'ALTER TABLE ' + tbl.TABLE_NAME + ' DROP ' + obj.name
	 FROM SYSOBJECTS obj
	INNER JOIN (SELECT OBJECT_ID(TABLE_NAME) OBID , TABLE_NAME
	from INFORMATION_SCHEMA.COLUMNS where DATA_TYPE = 'uniqueidentifier'
		AND NOT (TABLE_NAME LIKE 'MSMERGE_%'
			OR TABLE_NAME LIKE 'sys%'
			OR TABLE_NAME LIKE 'mssu%'
			OR TABLE_NAME LIKE 'msdyn%')) TBL ON OBID=parent_obj 
	WHERE xtype= 'I'
	AND NAME LIKE 'MSmerge_df_rowguid%'

select * from sys.indexes where name like 'MSmerge_index%'

select * from INFORMATION_SCHEMA.COLUMNS where DATA_TYPE = 'uniqueidentifier'

SELECT 'ALTER TABLE ' + TABLE_NAME + ' DROP COLUMN ' + COLUMN_NAME 
	from INFORMATION_SCHEMA.COLUMNS where DATA_TYPE = 'uniqueidentifier'
	AND NOT (TABLE_NAME LIKE 'MSMERGE_%'
		OR TABLE_NAME LIKE 'sys%'
		OR TABLE_NAME LIKE 'mssu%'
		OR TABLE_NAME LIKE 'msdyn%')
