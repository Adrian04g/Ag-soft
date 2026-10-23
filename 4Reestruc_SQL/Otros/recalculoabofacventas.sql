begin tran 

UPDATE	ven_Facturas 
SET		abofac = Abonos.creven
FROM	ven_facturas fac1 
		inner join (SELECT FAC.IDEMP,mov.nitcli,fac.tipfac,fac.codcto,fac.numfac, round(sum(Mov.creven),0) as creven 
					FROM 	ven_movcli Mov 
							INNER JOIN ven_facturas 	Fac	 ON Mov.IdEmp=Fac.IdEmp and Mov.AfeCen=Fac.CodCto and 
																Fac.tipfac=Mov.afetip and Fac.numfac=Mov.afedoc  
							Left join  ven_pagos 		Pag  ON Mov.Idemp=Pag.Idemp and Mov.CodCto=pag.CodCto and 
																Pag.tippag=Mov.tipdoc and pag.numdoc=Mov.docven
							left join  ven_notas 		Nota ON Mov.IdEmp=Nota.IdEmp and Mov.codcto=Nota.CodCto and Nota.tipnot=Mov.tipdoc																	
																and Nota.numnot=Mov.docven and Mov.afecen=Nota.afecen 
																and Mov.afetip=Nota.afetip and Mov.afedoc=Nota.afedoc 
					WHERE 	Mov.IdEmp='001' and Mov.estmov='' and  (Pag.estpag='' or Pag.estpag  is null)  	 
							and Fac.estfac!='A' and  (Nota.estfac=''  or Nota.estfac is null)  
					group by mov.nitcli,fac.idemp,fac.codcto,fac.tipfac,fac.numfac) as abonos on fac1.idemp=abonos.idemp and 
			fac1.codcto=abonos.codcto and	
			fac1.tipfac=abonos.tipfac and 
			fac1.numfac=abonos.numfac 

commit 