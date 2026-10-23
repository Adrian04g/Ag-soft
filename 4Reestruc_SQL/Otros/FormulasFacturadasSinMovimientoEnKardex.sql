declare @codcto varchar(3)
declare @fechaCorte date
set @codcto = '' -- Filtro por centro de costo *Dejar vacio para todos los centros
set @fechaCorte = '' -- Filtro por fecha *Dejar vacio para el inicio de la bd

select codcto, codins, sum(cantidad_facturada) as ajuste from (

	select temp.*, 'El articulo no se encuentra en el kardex' as Mensaje from (

		select f.codfor, f.codins, f.qtyart, p.codcto, p.tipfac, p.numpre, (f.qtyart * p.qtyfac) as cantidad_facturada
		from ven_prefacdetalle as p
		inner join pro_formulas as f on (p.codart = f.codfor)
		inner join ven_prefactura as pf on (p.idemp = pf.idemp and p.codcto = pf.codcto and p.numpre = pf.numpre)
		where (p.codcto = @codcto or (@codcto is null or @codcto = '')) and (pf.fecpre > @fechaCorte or (@fechaCorte is null or @fechaCorte = ''))

	) as temp
	left join alm_kardex as k on (temp.codcto = k.codcto and temp.numpre = k.numcon and temp.codfor = k.codartrel)
	where (k.codart is null or k.codartrel is null)

) as temp
group by codcto, codins
order by codcto
