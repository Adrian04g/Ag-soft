alter table con_comprobante alter column idemp nvarchar(3) not null
GO
IF EXISTS (SELECT DISTINCT OBJECT_NAME(object_id) FROM sys.objects WHERE OBJECT_NAME(object_id) ='DF__ven_facdep__item__545E8529')
BEGIN
	ALTER TABLE ven_facdepre DROP CONSTRAINT DF__ven_facdep__item__545E8529
END
GO
