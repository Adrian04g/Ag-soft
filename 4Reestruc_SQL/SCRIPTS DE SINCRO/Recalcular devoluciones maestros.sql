DECLARE @idemp NVARCHAR(3)
DECLARE @codcto NVARCHAR(3)
DECLARE @numfac NVARCHAR(max)
DECLARE @tipfac NVARCHAR(2)
DECLARE @devolucion NUMERIC(18,4)
DECLARE Curfacturas CURSOR FOR SELECT  d.idemp,d.codcto,d.numfac,d.tipfac,sum(iif(d.ivaart>0,Cast((valdev+(valdev*(ivaart/100))) AS NUMERIC(18,4)),0)) AS DEVOLUCION FROM ven_facturas f inner join ven_facdetalle d on d.numfac=f.numfac and d.idemp=f.idemp and d.codcto=f.codcto and d.tipfac=f.tipfac WHERE f.devfac=0 and estfac<>'A' and d.devart>0 GROUP BY d.numfac,d.tipfac,d.codcto,d.idemp
OPEN Curfacturas
FETCH NEXT FROM Curfacturas INTO @idemp,@codcto,@numfac,@tipfac,@devolucion
WHILE @@FETCH_STATUS=0
BEGIN
update ven_facturas set devfac=@devolucion where idemp=@idemp and codcto=@codcto and numfac=@numfac and tipfac=@tipfac
FETCH NEXT FROM Curfacturas INTO @idemp,@codcto,@numfac,@tipfac,@devolucion
END
CLOSE Curfacturas
DEALLOCATE Curfacturas