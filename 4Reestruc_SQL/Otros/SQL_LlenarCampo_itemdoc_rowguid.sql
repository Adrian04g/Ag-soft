--SELECT count(*)
--	FROM alm_kardex WITH(NOLOCK)
--	WHERE itemfac=0

CREATE TABLE #tblTransacciones ( rowid nvarchar(50), itemfac NUMERIC(10))

;WITH TBLDATOS AS (
SELECT Idemp,codcto,codcon,numcon,rowguid,ROW_NUMBER() OVER(PARTITION BY Idemp,codcto,codcon,numcon ORDER BY Idemp,codcto,codcon,numcon,rowguid ) AS itemfac
	FROM dbo.alm_kardex WITH(NOLOCK)
)
INSERT INTO #tblTransacciones(rowid,itemfac)
SELECT rowguid,itemfac from TBLDATOS

select count(*) from alm_kardex WHERE itemfac=0

update CONTAB set itemfac=TRANS.itemfac
 FROM dbo.alm_kardex CONTAB
 INNER JOIN #tblTransacciones TRANS ON (CONTAB.rowguid=TRANS.rowid)

select count(*) from alm_kardex WHERE itemfac=0

drop TABLE #tblTransacciones


