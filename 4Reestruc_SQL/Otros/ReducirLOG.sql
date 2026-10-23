Alter Database OSPINO_CAÑAS

Set Recovery Simple;
GO 

DBCC Shrinkfile(Herradura_log, 1)
GO
Alter Database OSPINO_CAÑAS

Set Recovery Full;
GO 
