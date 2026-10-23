-- Declaraciones
----------------------------------------------
declare @codcto varchar(3)
declare @tipfac varchar(2)
declare @fechaInicial Date
declare @fechaFinal Date
declare @consecutivo varchar(8)
declare @cf bit
declare @commit bit

-- Parametros
----------------------------------------------
set @codcto = '001'
set @tipfac = '' -- Vacio igual todos
set @fechaInicial = '20230911' -- Formato AAAAMMDD
set @fechaFinal = convert(date, getdate()) -- Formato AAAAMMDD
set @consecutivo = '00167186'
set @cf = 'FALSE' -- Indica si la empresa trabaja con cierre -- FALSE/TRUE
set @commit = 'FALSE' -- Indica si se guardaran los cambios o no -- FALSE/TRUE

-- No tocar
----------------------------------------------
--begin
	IF OBJECT_ID('tempdb.dbo.#tablaTemporal', 'U') IS NOT NULL
	begin
		drop table #tablaTemporal
	end

	CREATE TABLE #tablaTemporal( 
		idemp VARCHAR(3), 
		codcto VARCHAR(3),
		tipfac VARCHAR(2),
		numfac VARCHAR(8),
		id_row NUMERIC(10) IDENTITY(1,1),
		numfac_new VARCHAR(8),
	)

	insert into #tablaTemporal (idemp,codcto,tipfac,numfac)
	select idemp,codcto,tipfac,numfac from ven_facturas where codcto = @codcto and convert(date, fecsys) between @fechaInicial and @fechaFinal and (tipfac = @tipfac or @tipfac = '') order by fecfac

	update #tablaTemporal
	set numfac_new = concat(replicate('0', (8 - len(id_row + @consecutivo - 1))), id_row + @consecutivo -1)

	begin tran

		print 'ven_facturas'
		update f set numfac = numfac_new
			from ven_facturas as f 
			inner join #tablaTemporal as t 
				on (f.idemp = t.idemp and f.codcto = t.codcto and f.tipfac = t.tipfac and f.numfac = t.numfac) 
		print 'ven_facdetalle'
		update fd set numfac = t.numfac_new
			from ven_facdetalle as fd 
			inner join #tablaTemporal as t 
				on (fd.idemp = t.idemp and fd.codcto = t.codcto and fd.tipfac = fd.tipfac and fd.numfac = t.numfac)
		print 'ven_facdepre'
		update fd set numfac = t.numfac_new
			from ven_facdepre as fd 
			inner join #tablaTemporal as t 
				on (fd.idemp = t.idemp and fd.codcto = t.codcto and fd.tipfac = fd.tipfac and fd.numfac = t.numfac)
		print 'ven_pagos'
		update p set numdoc = t.numfac_new 
			from ven_pagos as p 
			inner join #tablaTemporal as t 
				on (p.idemp = t.idemp and p.codcto = t.codcto and p.tippag = t.tipfac and p.numdoc = t.numfac)
		print 'ven_pagdetalle'
		update p set numdoc = t.numfac_new
			from ven_pagdetalle as p 
			inner join #tablaTemporal as t 
				on (p.idemp = t.idemp and p.codcto = t.codcto and p.tippag = t.tipfac and p.numdoc = t.numfac)
		print 'ven_movcli'
		update m set afedoc = t.numfac_new
			from ven_movcli as m 
			inner join #tablaTemporal as t 
				on (m.idemp = t.idemp and m.codcto = t.codcto and m.afetip = t.tipfac and m.afedoc = t.numfac)
		print 'ven_movcli'
		update m set docven = t.numfac_new 
			from ven_movcli as m
			inner join #tablaTemporal as t 
				on (m.idemp = t.idemp and m.codcto = t.codcto and m.tipdoc = t.tipfac and m.docven = t.numfac)
		print 'ven_facuota'
		update fc set numfac = t.numfac_new
			from ven_facuota as fc 
			inner join #tablaTemporal as t 
				on (fc.idemp = t.idemp and fc.codcto = t.codcto and fc.tipfac = t.tipfac and fc.numfac = t.numfac)
		if @cf = 'FALSE'
		begin
			print 'con_comprobante'
			update c set consec = concat(year(fecdoc),'-00-', t.numfac_new) 
				from con_comprobante as c 
				inner join #tablaTemporal as t 
					on (c.idemp = t.idemp and c.codcto = t.codcto and c.codtran = t.tipfac and right(c.consec,8) = t.numfac)
		end

		IF @fechafinal = convert(date, getdate())
		begin
			print 'glb_unica'
			update glb_unica set contran = (select max(id_row) from #tablaTemporal) + 1 where codtran = @tipfac
		end

		IF OBJECT_ID('tempdb.dbo.#tablaTemporal', 'U') IS NOT NULL
		begin
			drop table #tablaTemporal
		end
--end

-- Area de comprobacion
----------------------------------------------
select * from ven_facturas where codcto='001' and fecfac>'2023-09-11'  order by numfac       
----------------------------------------------
begin
	if @commit = 'TRUE'
	begin
		commit
		print 'Cambios guardados'
	end
	else
	begin
		rollback
		print 'Cambios reversados'
	end
end
