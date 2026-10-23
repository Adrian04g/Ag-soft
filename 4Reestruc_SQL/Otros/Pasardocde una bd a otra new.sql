GO 
BEGIN TRAN 

INSERT INTO Okeysport.dbo.ven_facturas(idemp, codcto, tipfac, numfac, orden, fecfac, venfac, codcue, nitcli, nitven, vtafac, ivafac, otrfac, 
cuofac, ajpfac, antfac, devfac, abofac, dctfac, retfac, ricfac,rivfac, netfac, cosfac, numcon, estfac, entrega, cambio, codusu, observa, 
ajuste, inifac, cosaju, pendiente, fecsys, estado, estret, plaza, tipoventa, valini, saldocli,docrel, codturno, placa, valadmon, valimprev, 
valutil, tipo, trm, cuoini, lnentrega, lnvueltas, vuelo, porflete, porvol, valdolar, propina, despacho, cendespach, admon,intmora, cuotaext, 
transporte, arancel, impfac, comie, contrato, valflete, confirmada, anticipo, comision, totbono, devretfac, devricfac, devrivfac, bpromo, 
bviatico, qtyper, domicilio, adultos, ninos, codguia, impofac, crefac, devcrefac)
Select	idemp, codcto, tipfac, numfac, orden, fecfac, venfac, codcue, nitcli, nitven, vtafac, ivafac, otrfac, 
		cuofac, ajpfac, antfac, devfac, abofac, dctfac, retfac, ricfac,rivfac, netfac, cosfac, numcon, estfac, entrega, cambio, codusu, observa, 
		ajuste, inifac, cosaju, pendiente, fecsys, estado, estret, plaza, tipoventa, valini, saldocli,docrel, codturno, placa, valadmon, valimprev, 
		valutil, tipo, trm, cuoini, lnentrega, lnvueltas, vuelo, porflete, porvol, valdolar, propina, despacho, cendespach, admon,intmora, cuotaext, 
		transporte, arancel, impfac, comie, contrato, valflete, confirmada, anticipo, comision, totbono, devretfac, devricfac, devrivfac, bpromo, 
		bviatico, qtyper, domicilio, adultos, ninos, codguia, impofac, crefac, devcrefac	
from	okeysport_back.dbo.ven_facturas   
where	concat(idemp,codcto,tipfac,numfac) not in ( 
		select concat(idemp,codcto,tipfac,numfac) 
		from	Okeysport.dbo.ven_facturas  )  


INSERT INTO Okeysport.dbo.ven_facdetalle(idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, numcon, valdes, valdev, valtot, valaju, descrip, docrel, titulo, 
                         valiva, piezas, valdolar, qtyvol, qtylibra, vrlibra, vrvol, wr, qtyfac, porcom, comie, bono, anticipo, comision, equipo, item, obsequio, promo, qtyobsequi, serial, 
                         simcard, bpromo, bviatico, aplcomi, valimpo, porimpo)
select idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, numcon, valdes, valdev, valtot, valaju, descrip, docrel, titulo, 
                         valiva, piezas, valdolar, qtyvol, qtylibra, vrlibra, vrvol, wr, qtyfac, porcom, comie, bono, anticipo, comision, equipo, item, obsequio, promo, qtyobsequi, serial, 
                         simcard, bpromo, bviatico, aplcomi, valimpo, porimpo
from okeysport_back.dbo.ven_facdetalle 
where CONCAT(idemp,codcto,tipfac,numfac,codart) not in (
		select	CONCAT(idemp,codcto,tipfac,numfac,codart)
		from Okeysport.dbo.ven_facdetalle )

INSERT INTO Okeysport.dbo.ven_pagos(idemp, codcto, tippag, numdoc, clapag, fecpag, nitcli, pagval, netpag, estpag, fecsys, codusu, detalle, cobrador, cambio, recibo, porcom)
select idemp, codcto, tippag, numdoc, clapag, fecpag, nitcli, pagval, netpag, estpag, fecsys, codusu, detalle, cobrador, cambio, recibo, porcom
from okeysport_back.dbo.ven_pagos  
where CONCAT(idemp,codcto,tippag,numdoc) not in (
		select CONCAT(idemp,codcto,tippag,numdoc)
		from Okeysport.dbo.ven_pagos )

INSERT INTO Okeysport.dbo.ven_pagdetalle(idemp, codcto, tippag, numdoc, forpag, valpag, codban, afedoc, feccheq, estcheq, vrrtecom, vrrtefte, 
			vrrteica, vrrteiva, codusu, turno, valpropina, numrec,consig)
select idemp, codcto, tippag, numdoc, forpag, valpag, codban, afedoc, feccheq, estcheq, vrrtecom, vrrtefte, 
			vrrteica, vrrteiva, codusu, turno, valpropina, numrec,consig
from okeysport_back.dbo.ven_pagdetalle
where CONCAT(idemp,codcto,tippag,numdoc,forpag) not in (
		select CONCAT(idemp,codcto,tippag,numdoc,forpag) 
		from  Okeysport.dbo.ven_pagdetalle )  

INSERT INTO Okeysport.dbo.ven_mesa(iidemp, codcto, mesa, ubica, iconfile, meseroid, mesero, prefijo, ubicaimg, descripcion, domicilio, nitcli, vlrdomi, qtyper, codusu, ocupada)
select idemp, codcto, mesa, ubica, iconfile, meseroid, mesero, prefijo, ubicaimg, descripcion, domicilio, nitcli, vlrdomi, qtyper, codusu, ocupada
from okeysport_back.dbo.ven_mesa
where CONCAT(idemp, codcto, mesa, ubica) not in (
		select CONCAT(idemp, codcto, mesa, ubica) 
		from  Okeysport.dbo.ven_mesa )  


INSERT INTO Okeysport.dbo.glb_caja(idemp, codcto, codter, fecha, hora, jornada, base, activo, caja, codusu, codusuc, faltante, feccierre, fecsys, ipcaja, numero, sobrante)
select idemp, codcto, codter, fecha, hora, jornada, base, activo, caja, codusu, codusuc, faltante, feccierre, fecsys, ipcaja, numero, sobrante
from okeysport_back.dbo.glb_caja
where CONCAT(idemp, codcto, codter,caja, codusu, codusuc) not in (
		select CONCAT(idemp, codcto, codter,caja, codusu, codusuc) 
		from  Okeysport.dbo.glb_caja ) 



INSERT INTO Okeysport.dbo.alm_kardex(idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, 
	codusu, qtypro, qtyfac, undart, estord, despacho, cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, 
    estexist, regiserv, usuconftra, fecsysconftra)
select	idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, 
		codusu, qtypro, qtyfac, undart, estord, despacho, cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, 
		estexist, regiserv, usuconftra, fecsysconftra
from	okeysport_back.dbo.Alm_Kardex   
where CONCAT(idemp,codcto,codcon,numcon,codart) not in (
		select	CONCAT(idemp,codcto,codcon,numcon,codart)
		from	Okeysport.dbo.alm_kardex )


INSERT INTO Okeysport.dbo.alm_kardextemp(idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, 
codusu, qtypro, qtyfac, undart, codcue, estado, numsal, nument, usuconftra, fecsysconftra, itemfac)
select 	idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, 
		codusu, qtypro, qtyfac, undart, codcue, estado, numsal, nument, usuconftra, fecsysconftra, itemfac	
FROM    Okeysport_back.dbo.alm_kardextemp 
where	concat(idemp, codcto,codcon,numcon)  
		select concat (idemp, codcto,codcon,numcon)  
		from Okeysport.dbo.alm_kardextemp    



INSERT INTO Okeysport.dbo.con_comprobante(idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, debito, 
			credito, fecsys, codusu, estcomp, numche, codact, base,turno, estconcili, codimp, ctacomitar, nitter2, saldoa, ivamayvlr, itemdoc)
select	idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, debito, 
		credito, fecsys, codusu, estcomp, numche, codact, base,turno, estconcili, codimp, ctacomitar, nitter2, saldoa, ivamayvlr, itemdoc
from	okeysport_back.dbo.con_comprobante   
where  CONCAT(idemp,codcto,codtran,consec,codcue,nitter) not in (
		select	CONCAT(idemp,codcto,codtran,consec,codcue,nitter)
		from	Okeysport.dbo.con_comprobante)


INSERT INTO Okeysport.dbo.Tes_egresos(idemp, codcto, tipfac, consec, codcue, fecegr, nomben, posfec, numche, valegr, desegr, netegr, estegr, tipo, observa, idusu, fecsys, observa2)
select	idemp, codcto, tipfac, consec, codcue, fecegr, nomben, posfec, numche, valegr, desegr, netegr, estegr, tipo, observa, idusu, fecsys, observa2
from	okeysport_back.dbo.tes_egresos   
where CONCAT(idemp,codcto,tipfac,consec) not in (
		select	 CONCAT(idemp,codcto,tipfac,consec)
		from	Okeysport.dbo.tes_egresos  )

insert into Okeysport.dbo.glb_terceros(nitter, nomter, tipter, divter, clater, terotr, terven, teremp, terpro, tercli, tercob, telter, dirter, dirter2, ciuter, 
		idusu, fecsys, iva, contacto, celular, fax, descrip, codpro, rango, codgru, codigo, fecnac, mail,sexo, web, lista, arp, 
		cesantia, codest, conduc, eps, pension, barrio, ocupacion, apellido1, apellido2, cupocre, diasvenc, dptoter, nombre1, 
		otros, sector, tipid, vendedor, activo, civil, codbar, codtipo, foto, lugexp,lugnac, otrosest, porcom, primaria, 
		secundaria, terprof, zona, cedulafiad, cedulafia2, celfiad1, celfiad2, cuota, dirfiad1, dirfiad2, dirter3, nombrefiad, 
		nombrefia2, telfiad1, telfiad2, telter2, ucmpmcl, ucmvmcl,upgomcl, upgvmcl, cupo, cedulafia3, diacobro1, diacobro2, 
		fcobro, finicial, nombrefia3, periodo, vrcuota, vrinicial, codcargo, codhobby, codprof, empresa, hijos, sueldo, fcobroseg,
		cedulafia4, celfiad3, dirfiad3, nombrefia4, telfiad3, act_eco, ciiu, estrato, fec_exp, inicio_labora, nit_empresa, 
		niv_est, per_cargo, tip_contrato, tercon, ocultaremi, cedulafia5, cedulafia6, nombrefia5, nombrefia6, datacredito, 
		datacredi2, datacredi3, diremp, telemp, contac, clasiven, codconcepto, guia, codpais, obsequio, qtyobsequi, montorf, 
		porrefte, porrica, porriva, rfuente, rica, riva, formato, estado, nrotarjeta, cmprfuente, cmprica, cmpriva, nombrefiad2, 
		nombrefiad3, cedulafiad2, cedulafiad3, datacredito1, datacredito2, comporta, dctoter, diascart, cmpcree, rcree)
SELECT	nitter, nomter, tipter, divter, clater, terotr, terven, teremp, terpro, tercli, tercob, telter, dirter, dirter2, ciuter, 
		idusu, fecsys, iva, contacto, celular, fax, descrip, codpro, rango, codgru, codigo, fecnac, mail,sexo, web, lista, arp, 
		cesantia, codest, conduc, eps, pension, barrio, ocupacion, apellido1, apellido2, cupocre, diasvenc, dptoter, nombre1, 
		otros, sector, tipid, vendedor, activo, civil, codbar, codtipo, foto, lugexp,lugnac, otrosest, porcom, primaria, 
		secundaria, terprof, zona, cedulafiad, cedulafia2, celfiad1, celfiad2, cuota, dirfiad1, dirfiad2, dirter3, nombrefiad, 
		nombrefia2, telfiad1, telfiad2, telter2, ucmpmcl, ucmvmcl,upgomcl, upgvmcl, cupo, cedulafia3, diacobro1, diacobro2, 
		fcobro, finicial, nombrefia3, periodo, vrcuota, vrinicial, codcargo, codhobby, codprof, empresa, hijos, sueldo, fcobroseg,
		cedulafia4, celfiad3, dirfiad3, nombrefia4, telfiad3, act_eco, ciiu, estrato, fec_exp, inicio_labora, nit_empresa, 
		niv_est, per_cargo, tip_contrato, tercon, ocultaremi, cedulafia5, cedulafia6, nombrefia5, nombrefia6, datacredito, 
		datacredi2, datacredi3, diremp, telemp, contac, clasiven, codconcepto, guia, codpais, obsequio, qtyobsequi, montorf, 
		porrefte, porrica, porriva, rfuente, rica, riva, formato, estado, nrotarjeta, cmprfuente, cmprica, cmpriva, nombrefiad2, 
		nombrefiad3, cedulafiad2, cedulafiad3, datacredito1, datacredito2, comporta, dctoter, diascart, cmpcree, rcree
FROM	okeysport_back.dbo.glb_terceros where nitter not in
		(SELECT	nitter FROM	Okeysport.dbo.glb_terceros)

ROLLBACK 


GO 