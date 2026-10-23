begin tran 
		update com_facdescuentos
		set 	item = c2.Item1
		from	com_facdescuentos c1
				inner join (SELECT	idemp,codcto,tippag,numdoc,coddes,pordes,valdes,fecsys,
									ROW_NUMBER() OVER (PARTITION BY idemp,codcto,numdoc,tippag	
									ORDER BY			idemp,codcto,tippag) AS Item1
							FROM com_facdescuentos) as c2 on	c1.idemp=c2.idemp and 
															c1.idemp=c2.idemp and 
															c1.codcto=c2.codcto and 
															c1.tippag=c2.tippag and 
															c1.numdoc=c2.numdoc and 
															c1.coddes=c2.coddes and 
															c1.pordes=c2.pordes and 
															c1.valdes=c2.valdes and  
															c1.fecsys=c2.fecsys 



rollback 

