--- Declaraciones
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
set @tipfac = 'CM' -- Vacio igual todos
set @fechaInicial = '20180101' -- Formato AAAAMMDD
set @fechaFinal = convert(date, getdate()) -- Formato AAAAMMDD
set @consecutivo = '2000'
set @cf = 'FALSE' -- Indica si la empresa trabaja con cierre -- FALSE/TRUE
set @commit = 'FALSE' -- Indica si se guardaran los cambios o no -- FALSE/TRUE

-- No tocar
----------------------------------------------
begin
	IF OBJECT_ID('tempdb.dbo.#tablaTemporal', 'U') IS NOT NULL
	begin
		drop table #tablaTemporal
	end

	CREATE TABLE #tablaTemporal( 
		idemp VARCHAR(3), 
		codcto VARCHAR(3),
		tipfac VARCHAR(2),
		consec VARCHAR(8),
		id_row NUMERIC(10) IDENTITY(1,1),
		numfac_new VARCHAR(8),
	)

	insert into #tablaTemporal (idemp,codcto,tipfac,consec)
	select idemp,codcto,tipfac,right(consec,8) as consec from tes_egresos where codcto = @codcto and convert(date, fecsys) between @fechaInicial and @fechaFinal and (tipfac = @tipfac or @tipfac = '') order by fecegr

	update #tablaTemporal
	set numfac_new = concat(replicate('0', (8 - len(id_row + @consecutivo - 1))), id_row + @consecutivo -1)

	begin tran

	
	
	 print 'tes_egresos'
			update c set consec = concat(year(fecegr),'-00-', t.numfac_new) 
				from tes_egresos as c 
				inner join #tablaTemporal as t 
					on (c.idemp = t.idemp and c.codcto = t.codcto and c.tipfac = t.tipfac and right(c.consec,8) = t.consec)
		print 'com_movpro'
		update m set afedoc = t.numfac_new
			from com_movpro as m 
			inner join #tablaTemporal as t 
				on (m.idemp = t.idemp and m.codcto = t.codcto and m.afetip = t.tipfac and m.afedoc = t.consec)
		print 'com_movpro'
		update m set doccom = t.numfac_new 
			from com_movpro as m
			inner join #tablaTemporal as t 
				on (m.idemp = t.idemp and m.codcto = t.codcto and m.tipdoc = t.tipfac and m.doccom = t.consec)
		--print 'ven_facuota'
		--update fc set numfac = t.numfac_new
		--	from ven_facuota as fc 
		--	inner join #tablaTemporal as t 
		--		on (fc.idemp = t.idemp and fc.codcto = t.codcto and fc.tipfac = t.tipfac and fc.numfac = t.numfac)
		if @cf = 'FALSE'
		begin
			print 'con_comprobante'
			update c set consec = concat(year(fecdoc),'-00-', t.numfac_new) 
				from con_comprobante as c 
				inner join #tablaTemporal as t 
					on (c.idemp = t.idemp and c.codcto = t.codcto and c.codtran = t.tipfac and right(c.consec,8) = t.consec)
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
end

-- Area de comprobacion
----------------------------------------------
select * from tes_Egresos where fecegr >'20171231'
order by consec   
select * from con_comprobante where codtran='CM' and  fecdoc >'20171231'
order by consec    
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
