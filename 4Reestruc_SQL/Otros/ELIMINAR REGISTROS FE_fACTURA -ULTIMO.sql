begin tran
DELETE FROM f
FROM fe_factura f
JOIN (
    SELECT numero, Item,
           ROW_NUMBER() OVER (PARTITION BY numero ORDER BY Item DESC) AS RowNum
    FROM fe_factura
) AS subquery
ON f.numero = subquery.numero AND f.Item = subquery.Item
WHERE subquery.RowNum > 1;
select numero from fe_factura order by numero asc
rollback