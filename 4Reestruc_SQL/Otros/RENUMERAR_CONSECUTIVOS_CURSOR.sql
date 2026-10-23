DECLARE @CONSEC AS nvarchar(32)
DECLARE @FECDOC AS DATE
DECLARE @NUMERO AS nvarchar (8)
SET @NUMERO = '00000445'

DECLARE comprobante CURSOR FOR SELECT DISTINCT consec, fecdoc FROM con_comprobante where codcto='001' and codtran='CF' ORDER BY CONSEC, FECDOC
OPEN comprobante
FETCH NEXT FROM comprobante INTO @CONSEC, @FECDOC
WHILE @@fetch_status = 0
BEGIN
	SET @NUMERO = @NUMERO+1
    SELECT  @NUMERO, @CONSEC, CONCAT(year(@FECDOC),'-00-', replicate ('0',(8 - len((@NUMERO)))) + convert(varchar,(@NUMERO)))
	UPDATE CON_COMPROBANTE SET consec = CONCAT(year(@FECDOC),'-00-', replicate ('0',(8 - len((@NUMERO)))) + convert(varchar,(@NUMERO)))
	where codcto='001' and codtran='CF' and consec = @CONSEC

    FETCH NEXT FROM comprobante INTO @CONSEC, @FECDOC
END
CLOSE comprobante
DEALLOCATE comprobante