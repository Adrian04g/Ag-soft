IF OBJECT_ID('tempdb..#tmp_Repeats') IS NOT NULL DROP TABLE #tmp_Repeats
Go

WITH tmp_Comp As (
					Select codtran,codcto,consec,codcue,Count(codcue) Veces
					From Con_Comprobante
					Where codtran='AM' AND fecdoc>'2016-12-31'
					Group By codtran,codcto,consec,codcue
				 )

Select T.codtran,T.codcto,T.consec,T.codcue, (SELECT TOP 1 rowguid FROM Con_Comprobante C 
											  WHERE T.codtran=C.codtran AND T.codcto=C.codcto AND T.consec=C.consec AND T.codcue=C.codcue) RowGuid
Into #tmp_Repeats From tmp_Comp T
Where Veces>1
Group by T.codtran,T.codcto,T.consec,T.codcue Order by T.codcue

--Select * From #tmp_Repeats

Declare @cCodtran nVarChar(2), @cCodcto nVarChar(3), @cConsec nVarchar(16), @cCodcue nVarchar(8), @cRow nVarChar(50)
Declare cur_Comp Cursor For Select codtran,codcto,consec,codcue, RowGuid From #tmp_Repeats Order By codcue
Open cur_Comp
Fetch cur_Comp Into @cCodtran, @cCodcto, @cConsec, @cCodcue, @cRow
While @@FETCH_STATUS = 0
begin
	PRINT 'Codtra: '+@cCodtran + ' Centro: '+@cCodcto + ' Consec: '+@cConsec + ' Codcue: '+@cCodcue+' Row: '+@cRow
	--DELETE FROM Con_Comprobante WHERE codtran=@cCodtran AND codcto=@cCodcto AND consec=@cConsec AND codcue=@cCodcue AND rowguid=@cRow

	Fetch cur_Comp Into @cCodtran, @cCodcto, @cConsec, @cCodcue, @cRow
end
Close cur_Comp
Deallocate cur_Comp

--Select codtran,codcto,consec,codcue,rowguid
--From Con_Comprobante
--Where codtran='FK' AND consec='2015-00-00005321' AND codcto='002'
--Order By codcue