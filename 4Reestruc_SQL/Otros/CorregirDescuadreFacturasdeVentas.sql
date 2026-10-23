-- Corregir descuadre Facturas de venta
DECLARE @QUERY varchar(20) = 'QUERY';
BEGIN TRAN @QUERY
DECLARE concomprobante_Cursor CURSOR FOR
select idemp,codalm,codcen,codcto,codtran,consec,sum(debito)as tdebito, sum(credito) as tcredito,((sum(debito)) - sum(credito)) as diferencia from con_comprobante    group by
idemp,codalm,codcen,codcto,codtran,consec having ((sum(debito)) - sum(credito)) <> 0 ;
OPEN concomprobante_Cursor ;
DECLARE @idemp nvarchar(50),@codalm nvarchar(50),@codcen nvarchar(50),@codcto nvarchar(50),@codtran nvarchar(50),@consec nvarchar(50),@tdebito nvarchar(50),@tcredito nvarchar(50),@diferencia nvarchar(50);
FETCH NEXT from concomprobante_Cursor
INTO @idemp,@codalm,@codcen,@codcto,@codtran,@consec,@tdebito,@tcredito,@diferencia
WHILE @@FETCH_STATUS = 0
   BEGIN
      FETCH NEXT FROM concomprobante_Cursor INTO @idemp,@codalm,@codcen,@codcto,@codtran,@consec,@tdebito,@tcredito,@diferencia;
	 UPDATE con_comprobante set credito = (credito + (@diferencia)) where codtran ='FV' and consec=@consec and codcue='41350508'
   END;
CLOSE concomprobante_Cursor;
DEALLOCATE concomprobante_Cursor;
GO
DECLARE @QUERY varchar(20) = 'QUERY';
ROLLBACK TRAN @QUERY
