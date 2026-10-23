
--Alter Table ven_facdetalle Add ident numeric(10) identity(1,1)  --(1)
--Alter Table ven_facdepre Add ident numeric(10) identity(1,1)  --(2)


CREATE TABLE #tblTransacciones ( ident NUMERIC(10), itemdoc NUMERIC(10))

;WITH TBLDATOS AS (
SELECT Idemp,codcto,tipfac,numfac,ident,ROW_NUMBER() OVER(PARTITION BY Idemp,codcto,tipfac,numfac ORDER BY Idemp,codcto,tipfac,numfac ) AS ITEMDOC
	FROM dbo.ven_facdetalle WITH(NOLOCK)
)
INSERT INTO #tblTransacciones(ident,itemdoc)
SELECT ident,itemdoc from TBLDATOS

--select count(*) from ven_facdetalle WHERE item=0

update CONTAB set item=TRANS.itemdoc
 FROM dbo.ven_facdetalle CONTAB
 INNER JOIN #tblTransacciones TRANS ON (CONTAB.ident=TRANS.ident)
	
--select count(*) from ven_facdetalle WHERE item=0

drop TABLE #tblTransacciones


