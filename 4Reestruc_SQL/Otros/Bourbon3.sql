---- consulta de lo que estan diferentes 
select det.codart, det.porimpo, art.porimpo 
from  ven_facdetalle det 
		inner join alm_articulos art on det.codart=art.codart 
WHERE DET.porimpo!=art.porimpo
		group by det.codart,det.porimpo,art.porimpo


begin tran 
	
	update	ven_facdetalle
	set		porimpo= art.porimpo
	from	ven_facdetalle  det 
			inner join alm_articulos art on det.codart=art.codart 
	WHERE DET.porimpo!=art.porimpo and tipfac='FV'
	
	update	ven_facturas 
	set		ricfac = 0
	where	tipfac='FV' 


	update	ven_facturas 
	set		impofac= round(Det.Valimpo,0) 
	from	ven_facturas fac 
			inner join (Select	det1.idemp, det1.codcto, det1.tipfac, det1.numfac,sum((det1.valtot-det1.valdes)  * (det1.porimpo/100) ) as valimpo
						from	ven_facdetalle det1
								group by det1.idemp,det1.codcto,det1.tipfac,det1.numfac ) as  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.numfac=det.numfac
	where fac.tipfac='FV'

	update	ven_facturas 
	set		dctfac= round(Det.Valdes,0) 
	from	ven_facturas fac 
			inner join (Select	det1.idemp, det1.codcto, det1.tipfac, det1.numfac,sum(det1.valdes) as valdes
						from	ven_facdetalle det1
								group by det1.idemp,det1.codcto,det1.tipfac,det1.numfac ) as  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.numfac=det.numfac
	
	update	ven_facturas 
	set		ajpfac= Netfac - (vtafac + ivafac + otrfac + impofac -dctfac) 
	where	tipfac='FV' 

		
select codcto, tipfac, numfac, ricfac,impofac , netfac,vtafac,ivafac,ajpfac,dctfac, otrfac 
from ven_facturas	
where tipfac='FV' and (ajpfac<-1 OR ajpfac>1)
order by tipfac,numfac
	
rollback 
	
--commit 