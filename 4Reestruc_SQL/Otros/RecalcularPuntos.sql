begin TRAN
DECLARE @NITCLI NVARCHAR(20)
DECLARE @netofac DECIMAL(14,0)
DECLARE @QUERYPOR DECIMAL(14,0) = 100
DECLARE @QUERYVALOR DECIMAL(14,0) = 100
DECLARE @QUERYPUNTOS DECIMAL(14,0) = 1
DECLARE @TOTALPUNTOS DECIMAL(14,0)
DECLARE @FECFAC DATE
DECLARE @IDEMP NVARCHAR(20)
DECLARE @CODCTO NVARCHAR(20)
DECLARE @TIPFAC NVARCHAR(20)
DECLARE @NUMFAC NVARCHAR(20)
DECLARE @PUNTOSR DECIMAL(14,0)


DECLARE db_cursor CURSOR FOR 
Select sum(netfac-otrfac-devfac) as netofac,nitcli,fecfac,idemp,codcto,tipfac,numfac from ven_facturas 
where fecfac between '20180608' and '20180630' AND NITCLI != '999999999' and estfac!='A' group by nitcli,fecfac,idemp,codcto,tipfac,numfac

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @netofac,@NITCLI,@FECFAC,@IDeMP,@CODCTO,@TIPFAC,@NUMFAC

WHILE @@FETCH_STATUS = 0  
BEGIN  
	  IF NOT EXISTS(select * from ven_facpuntos where idemp=@idemp and codcto=@CODCTO and numfac=@NUMFAC and tipfac=@tipfac and nitter=@NITCLI)
	  BEGIN
		SET @PUNTOSR = (select puntos from ven_puntosredimidos where idemp=@idemp and codcto=@CODCTO and numfac=@NUMFAC and tipfac=@tipfac and nitter=@NITCLI)
		set @PUNTOSR = iif(@PUNTOSR is null, 0,@PUNTOSR)

			SET @TOTALPUNTOS = ((@netofac * (@QUERYPOR/100)) / @QUERYVALOR) * @QUERYPUNTOS
		  IF EXISTS(select nitter from ven_totalpuntos where nitter = @NITCLI)
		  BEGIN 
			 UPDATE ven_totalpuntos set puntos = puntos + (@TOTALPUNTOS -@PUNTOSR) where nitter = @NITCLI
		  END
		  ELSE
		  BEGIN
			INSERT into ven_totalpuntos (nitter,puntos,fecsys) values (@NITCLI, (@TOTALPUNTOS -@PUNTOSR),getdate())
		  END
		  if @netofac >0
		  BEGIN
		  insert into ven_facpuntos (idemp,codcto,tipfac,numfac,netofac,puntos,fecfac,fecvenci,nitter,codigopuntos) 
		  VALUES (@idemp,@CODCTO,@TIPFAC,@NUMFAC,@netofac, (@TOTALPUNTOS -@PUNTOSR),@FECFAC,dateadd(year,1,@FECFAC),@NITCLI,'999999')
		  END
		  ELSE
		  BEGIN
			insert into ven_facpuntos (idemp,codcto,tipfac,numfac,netofac,puntos,fecfac,fecvenci,nitter,codigopuntos) 
			VALUES (@idemp,@CODCTO,@TIPFAC,@NUMFAC,@netofac,0,@FECFAC,dateadd(year,1,@FECFAC),@NITCLI,'999999')
		  END
		  UPDATE ven_facpuntos set puntos = 0 where puntos < 0
	  END
      FETCH NEXT FROM db_cursor INTO @netofac,@NITCLI,@FECFAC,@IDEMP,@CODCTO,@TIPFAC,@NUMFAC
END 

CLOSE db_cursor  
DEALLOCATE db_cursor
commit
