---- consulta de lo que estan diferentes 

/*select	det.tipfac, det.numfac, det.codart, det.ivaart, art.ivaart, det.porimpo, det.valart, det.valtot
from	ven_facdetalle det 
		inner join alm_articulos art on det.codart=art.codart 
WHERE	DET.ivaart!=art.ivaart and det.valart>1
	*/	
begin tran 
	
	UPDATE	ven_facdetalle 
	set		valart = valart * (1 + (abs(det.ivaart-det.porimpo)/100) )
	from	ven_facdetalle det 
			inner join alm_articulos art on det.codart=art.codart 
			inner join ven_facturas fac on fac.codcto=det.codcto and fac.tipfac=det.tipfac and fac.numfac=det.numfac
	WHERE	DET.ivaart!=art.ivaart and valart > 1 and det.ivaart!=0 and fac.fecfac ='20160202'
			

	UPDATE	ven_facdetalle 
	set		valtot = valart * qtyart 
	from	ven_facdetalle det 
			inner join alm_articulos art on det.codart=art.codart 
			inner join ven_facturas fac on fac.codcto=det.codcto and fac.tipfac=det.tipfac and fac.numfac=det.numfac
	WHERE	DET.ivaart!=art.ivaart and valart > 1 and det.ivaart!=0 and fac.fecfac ='20160202'
	
	update	ven_facturas 
	set		vtafac= round(Det.Valtot,0)
	from	ven_facturas fac 
			inner join (Select	idemp,codcto,tipfac,numfac,sum(valtot) as valtot
						from	ven_facdetalle 
								group by idemp,codcto,tipfac,numfac ) as  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.numfac=det.numfac
	where fac.fecfac='20160202'

	update	ven_facturas 
	set		impofac= round(Det.valimpo,0)
	from	ven_facturas fac 
			inner join (Select	idemp,codcto,tipfac,numfac,sum((valtot-valdes)  * (porimpo/100)) as valimpo
						from	ven_facdetalle 
								group by idemp,codcto,tipfac,numfac ) as  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.numfac=det.numfac
	where fac.fecfac='20160202'

	update	ven_facdetalle
	set		ivaart= art.ivaart
	from	ven_facdetalle  det 
			inner join alm_articulos art on det.codart=art.codart 
			inner join ven_facturas fac on fac.codcto=det.codcto and fac.tipfac=det.tipfac and fac.numfac=det.numfac
	WHERE DET.ivaart!=art.ivaart and fac.fecfac='20160202'

	update	ven_facturas 
	set		ivafac= round(Det.valiva,0)
	from	ven_facturas fac 
			inner join (Select	idemp,codcto,tipfac,numfac,sum(valtot * (ivaart/100)) as valiva
						from	ven_facdetalle 
								group by idemp,codcto,tipfac,numfac ) as  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.numfac=det.numfac
	where fac.fecfac='20160202'


	update	ven_facturas 
	set		ajpfac= Netfac - (vtafac + ivafac + otrfac + impofac -dctfac) 
	where fecfac='20160202'

		
	select codcto,tipfac,numfac,vtafac,ivafac,dctfac,otrfac,ajpfac,impofac,netfac, sum(vtafac+ivafac-dctfac+otrfac+ajpfac+impofac) 
	from ven_facturas	
	where fecfac='20160202'
	GROUP BY codcto,tipfac,numfac,vtafac,ivafac,dctfac,otrfac,ajpfac,impofac,netfac
	order by tipfac,numfac

	rollback 
	
	--commit 