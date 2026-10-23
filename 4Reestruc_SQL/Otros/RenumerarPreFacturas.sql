-- Declaraciones
----------------------------------------------
declare @codcto varchar(3)
--declare @tipfac varchar(2)
declare @fechaInicial Date
declare @fechaFinal Date
declare @consecutivo varchar(8)
declare @cf bit
declare @commit bit

-- Parametros
----------------------------------------------
set @codcto = '001'
--set @tipfac = 'fv' -- Vacio igual todos
set @fechaInicial = '20230921' -- Formato AAAAMMDD
set @fechaFinal = convert(date, getdate()) -- Formato AAAAMMDD
set @consecutivo = '00030384' 
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
		numpre VARCHAR(8),
		--numfac VARCHAR(8),
		id_row NUMERIC(10) IDENTITY(1,1),
		numpre_new VARCHAR(8),
	)

	insert into #tablaTemporal (idemp,codcto,numpre)
	select idemp,codcto,numpre from ven_prefactura where codcto = @codcto and convert(date, fecsys) between @fechaInicial and @fechaFinal order by fecpre

	update #tablaTemporal
	set numpre_new = concat(replicate('0', (8 - len(id_row + @consecutivo - 1))), id_row + @consecutivo -1)

	begin tran

		print 'ven_prefactura'
		update f set numpre = numpre_new
			from ven_prefactura as f 
			inner join #tablaTemporal as t 
				on (f.idemp = t.idemp and f.codcto = t.codcto and f.numpre = t.numpre) 

		IF OBJECT_ID('tempdb.dbo.#tablaTemporal', 'U') IS NOT NULL
		begin
			drop table #tablaTemporal
		end
--end

-- Area de comprobacion
----------------------------------------------
select * from ven_prefactura where codcto='001' and fecpre > '2023-09-20'  order by numpre asc 
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
