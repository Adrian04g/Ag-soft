IF OBJECT_ID('tempdb..#tmp_Repeats') IS NOT NULL DROP TABLE #tmp_Repeats
Go
WITH tmp_Comp As (	Select idemp,tipfac,codcto,numfac,codart,Count(codart) Veces
					From Ven_facdetalle
					Where tipfac='FV' --AND numfac='2015-00-00000397'
					Group By idemp,tipfac,codcto,numfac,codart
				 )
Select T.idemp,T.tipfac,T.codcto,T.numfac,T.codart,
											(SELECT TOP 1 rowguid FROM Ven_facdetalle C 
											 WHERE T.tipfac=C.tipfac AND T.codcto=C.codcto AND T.numfac=C.numfac AND T.codart=C.codart) RowGuid
Into #tmp_Repeats From tmp_Comp T
Where Veces>1
Group by T.idemp,T.tipfac,T.codcto,T.numfac,T.codart

Select * From #tmp_Repeats Order by numfac,codart

Declare @ctipfac nVarChar(2), @cCodcto nVarChar(3), @cnumfac nVarchar(8), @ccodart nVarchar(10), @cRow nVarChar(50)
Declare cur_Comp Cursor For Select tipfac,codcto,numfac,codart,RowGuid From #tmp_Repeats Order By codart

Open cur_Comp
Fetch cur_Comp Into @ctipfac, @cCodcto, @cnumfac, @ccodart, @cRow
While @@FETCH_STATUS = 0
begin
	PRINT 'Codtra: '+@ctipfac + ' Centro: '+@cCodcto + ' numfac: '+@cnumfac + ' codart: '+@ccodart+' Row: '+@cRow
	DELETE FROM Ven_facdetalle WHERE tipfac=@ctipfac AND codcto=@cCodcto AND numfac=@cnumfac AND codart=@ccodart AND rowguid=@cRow

	Fetch cur_Comp Into @ctipfac, @cCodcto, @cnumfac, @ccodart, @cRow
end
Close cur_Comp
Deallocate cur_Comp

--SELECT tipfac,codcto,numfac,itemdoc,codart,credito,fecsys--,rowguid
--FROM	Ven_facdetalle
--WHERE tipfac='FP' AND numfac='2015-00-00000397'
--ORDER BY codart,itemdoc

