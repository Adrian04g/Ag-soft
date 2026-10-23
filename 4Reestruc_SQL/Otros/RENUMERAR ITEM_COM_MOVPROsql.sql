begin tran 
		update com_movpro
		set 	item = c2.Item1
		from	com_movpro c1
				inner join (SELECT	idemp,codcto,doccom,tipdoc,afedoc,nitpro,debcom,crecom,fecsys,
									ROW_NUMBER() OVER (PARTITION BY idemp,codcto,doccom,tipdoc	
									ORDER BY			idemp,codcto,tipdoc) AS Item1
							FROM com_movpro) as c2 on	c1.idemp=c2.idemp and 
															c1.idemp=c2.idemp and 
															c1.codcto=c2.codcto and 
															c1.doccom=c2.doccom and 
															c1.tipdoc=c2.tipdoc and 
															c1.afedoc=c2.afedoc and 
															c1.nitpro=c2.nitpro and 
															c1.debcom=c2.debcom and 
															c1.crecom=c2.crecom and 
															c1.fecsys=c2.fecsys 



rollback 
