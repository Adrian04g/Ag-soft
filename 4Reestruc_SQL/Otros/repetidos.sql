IF OBJECT_ID('tempdb..#tmp_Repeats') IS NOT NULL DROP TABLE #tmp_Repeats
Go

WITH tmp_Comp As (
					Select codcto,Codcon,numcon,codart,itemfac,Count(codart) Veces
					From alm_kardextemp
					--Where centra='008'--codtran='FK' --AND consec='2015-00-00005321'
					Group By codcto,Codcon,numcon,codart,itemfac 
				 )

Select T.codcto,T.codcon,T.numcon,T.codart,T.itemfac, (SELECT TOP 1 rowguid FROM alm_kardextemp C 
											  WHERE T.codcto=C.codcto AND T.numcon=C.numcon AND T.codcon=C.codcon AND T.codart=C.codart and t.itemfac=c.itemfac and contra='') RowGuid
Into #tmp_Repeats From tmp_Comp T
Where Veces>1
Group by T.codcto,T.codcon,T.numcon,T.codart,T.itemfac Order by T.codcto,T.codcon,T.numcon,T.codart,T.itemfac 

--Select * From #tmp_Repeats

Declare @cCodcto nVarChar(3), @cCodcon nVarChar(2), @cnumcon nVarchar(8), @cCodart nVarchar(10), @citemfac int,  @cRow nVarChar(50)
Declare cur_Comp Cursor For Select codcto,codcon,numcon,codart,itemfac,RowGuid From #tmp_Repeats Order By codcto,codcon,numcon,codart,itemfac
Open cur_Comp
Fetch cur_Comp Into @cCodcto, @cCodcon, @cnumcon, @cCodart,@citemfac, @cRow
While @@FETCH_STATUS = 0
begin
	PRINT 'Codcto: '+@cCodcto + ' Codcon: '+@cCodcon + ' Numcon: '+@cnumcon + ' Codart: '+@cCodart+ ' Itemfac: '+  CONVERT(varchar(5), @citemfac)+' Row: '+@cRow
	DELETE FROM Alm_kardextemp WHERE codcto=@cCodcto AND codcon=@cCodcon AND numcon=@cnumcon AND codart=@cCodart AND itemfac=@citemfac and rowguid=@cRow

	Fetch cur_Comp Into @cCodcto, @cCodcon, @cnumcon, @cCodart,@cItemfac,@cRow
end
Close cur_Comp
Deallocate cur_Comp

--Select codtran,codcto,consec,codcue,rowguid
--From Con_Comprobante
--Where codtran='FK' AND consec='2015-00-00005321' AND codcto='002'
--Order By codcue