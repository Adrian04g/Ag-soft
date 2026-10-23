---Costo
--Colar los valores de las varibles 

begin tran
Declare @Centro			nvarchar(3)='001',
		@Transaccion	nVarchar(2)='FV',
		@FechaIni		nVarchar(8)='20190401', ---AAAAMMDD   '20190401'  o '2019-04-01'
		@FechaFin		nVarchar(8)='20190401', ---AAAAMMDD   '20190401'  o '2019-04-01'
		@Porcentaje		decimal(14,6)=0.8 
		

select * from con_comprobante 
where	codcto=@Centro --and codtran=@transaccion --and fecdoc between @FechaIni and @FechaFin --and codcue in ( select ctacosto from alm_grupos)

		
update	con_comprobante set debito= round(debito * @Porcentaje,0) 
where	codcto=@Centro and codtran=@transaccion and fecdoc between @FechaIni and @FechaFin and codcue in ( select ctacosto from alm_grupos)
	
	
update	con_comprobante set credito= round(credito * @Porcentaje,0) 
where	codcto=@Centro and codtran=@transaccion and fecdoc between @FechaIni and @FechaFin and codcue in ( select ctacmp from alm_grupos)


	
rollback


