begin tran 

UPDATE	Com_Facturas 
SET		abofac = Abonos.DEBCOM
FROM	Com_facturas fac1 
		inner join (SELECT FAC.IDEMP,mov.nitpro,fac.tipfac,fac.codcto,fac.numfac, round(sum(Mov.debcom),0) as DEBCOM 
					FROM 	com_movpro Mov 
							INNER JOIN com_facturas 	Fac	 ON Mov.IdEmp=Fac.IdEmp and Mov.AfeCen=Fac.CodCto and 
																Fac.tipfac=Mov.afetip and Fac.numfac=Mov.afedoc  
							Left join  tes_egresos 		Pag  ON Mov.Idemp=Pag.Idemp and Mov.CodCto=Fac.CodCto and 
																Pag.tipfac=Mov.tipdoc and RIGHT(pag.consec,8)=Mov.doccom
							left join  com_notas 		Nota ON Mov.IdEmp=Nota.IdEmp and Mov.codcto=Nota.CodCto and Nota.tipnot=Mov.tipdoc																	and Nota.numnot=Mov.doccom and Mov.afecen=Nota.afecen 
																and Mov.afetip=Nota.afetip and Mov.afedoc=Nota.afedoc 
					WHERE 	Mov.IdEmp='001' and Mov.estmov='' and  (Pag.estegr='' or Pag.estegr  is null)  	 
							and Fac.estfac!='A' and  (Nota.estnot=''  or Nota.estnot is null)  
					group by mov.nitpro,fac.idemp,fac.codcto,fac.tipfac,fac.numfac) as abonos on fac1.idemp=abonos.idemp and 
			fac1.codcto=abonos.codcto and	
			fac1.tipfac=abonos.tipfac and 
			fac1.numfac=abonos.numfac 


commit 