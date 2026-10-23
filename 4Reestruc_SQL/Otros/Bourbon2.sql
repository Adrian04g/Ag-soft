begin tran 
	--update ven_facdetalle set valart = (valart * 1.8)/1.08 where numfac='00094601' and porimpo=80
	--update ven_facdetalle set valtot = valart * qtyart where numfac='00094601' and porimpo=80
	--update ven_facdetalle set porimpo = 8 where numfac='00094601' and porimpo=80
	--update ven_facdetalle set valart = (valart * 1.8)/1.08 where numfac='00093032' and porimpo=80
	--update ven_facdetalle set valtot = valart * qtyart where numfac='00093032' and porimpo=80
	--update ven_facdetalle set porimpo = 8 where numfac='00093032' and porimpo=80

	UPDATE	ven_facdetalle 
	set		valart = ((valart*0.08) +  (valart*0.16) + valart)/1.08 
	where	codart='HEI-000003' and ivaart=16

	update ven_facdetalle set valtot = valart * qtyart where codart='HEI-000003' and ivaart=16

	update	ven_facturas 
	set		vtafac= round(Det.Valtot,0)
	from	ven_facturas fac 
			inner join (Select	idemp,codcto,tipfac,numfac,sum(valtot) as valtot
						from	ven_facdetalle 
								group by idemp,codcto,tipfac,numfac ) as  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.numfac=det.numfac
	where	fac.fecfac ='20151117' 

	update	ven_facturas 
	set		impofac= round(Det.valimpo,0)
	from	ven_facturas fac 
			inner join (Select	idemp,codcto,tipfac,numfac,sum(valtot * .08) as valimpo
						from	ven_facdetalle 
								group by idemp,codcto,tipfac,numfac ) as  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.numfac=det.numfac
	where	fac.fecfac ='20151117' 	

	update	ven_facdetalle 
	set		codctogru= Gru.codctogru 
	from	ven_facdetalle det 
			inner join (Select	Art.codart,gru1.codctogru
						from	alm_articulos art 
								inner join alm_grupos gru1 on art.codgru=gru1.codgru) as gru on det.codart=gru.codart 
	WHERE DET.codctogru=''		

	--delete from con_comprobante where codtran='CF'
rollback 
--commit 
