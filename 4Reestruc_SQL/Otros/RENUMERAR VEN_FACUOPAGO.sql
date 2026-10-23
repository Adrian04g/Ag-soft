begin tran 
		update ven_facuopagos
		set 	item = c2.Item1
		from	ven_facuopagos c1
				inner join (SELECT	idemp,codcto,tipfac,numfac,tippag,cenpag,numpag,numcuo,fecsys,
									ROW_NUMBER() OVER (PARTITION BY idemp,codcto,tipfac,numfac
									ORDER BY			idemp,codcto,tipfac,numfac) AS Item1
							FROM ven_facuopagos) as c2 on	c1.idemp=c2.idemp and 
															c1.codcto=c2.codcto and  
															c1.tipfac=c2.tipfac and
															c1.numfac=c2.numfac and
															c1.tippag=c2.tippag and
															c1.cenpag=c2.cenpag and
															c1.numpag=c2.numpag and
															c1.numcuo=c2.numcuo and
															c1.fecsys=c2.fecsys 



rollback 
		

