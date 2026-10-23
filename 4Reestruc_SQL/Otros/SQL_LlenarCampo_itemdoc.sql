--SELECT count(*)
--	FROM con_comprobante WITH(NOLOCK)
--	WHERE itemdoc=0

CREATE TABLE #tblTransacciones ( ident NUMERIC(10), itemdoc NUMERIC(10))

;WITH TBLDATOS AS (
SELECT Idemp,codcto,codtran,consec,ident,ROW_NUMBER() OVER(PARTITION BY Idemp,codcto,codtran,consec ORDER BY Idemp,codcto,codtran,consec,ident ) AS ITEMDOC
	FROM dbo.con_comprobante WITH(NOLOCK)
)
INSERT INTO #tblTransacciones(ident,itemdoc)
SELECT ident,itemdoc from TBLDATOS

select count(*) from con_comprobante WHERE itemdoc=0

update CONTAB set itemdoc=TRANS.itemdoc
 FROM dbo.con_comprobante CONTAB
 INNER JOIN #tblTransacciones TRANS ON (CONTAB.ident=TRANS.ident)

select count(*) from con_comprobante WHERE itemdoc=0

drop TABLE #tblTransacciones


