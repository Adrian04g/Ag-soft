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
from	OkeyBodegaPrin.dbo.ven_facturas   ---BACK
EXCEPT 
select	idemp, codcto, tipfac, numfac, orden, fecfac, venfac, codcue, nitcli, nitven, vtafac, ivafac, otrfac, 
		cuofac, ajpfac, antfac, devfac, abofac, dctfac, retfac, ricfac,rivfac, netfac, cosfac, numcon, estfac, entrega, cambio, codusu, observa, 
		ajuste, inifac, cosaju, pendiente, fecsys, estado, estret, plaza, tipoventa, valini, saldocli,docrel, codturno, placa, valadmon, valimprev, 
		valutil, tipo, trm, cuoini, lnentrega, lnvueltas, vuelo, porflete, porvol, valdolar, propina, despacho, cendespach, admon,intmora, cuotaext, 
		transporte, arancel, impfac, comie, contrato, valflete, confirmada, anticipo, comision, totbono, devretfac, devricfac, devrivfac, bpromo, 
		bviatico, qtyper, domicilio, adultos, ninos, codguia, impofac, crefac, devcrefac 
from	Okeysport.dbo.ven_facturas    -- DESTINO


INSERT INTO Okeysport.dbo.ven_facdetalle(idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, numcon, valdes, valdev, valtot, valaju, descrip, docrel, titulo, 
                         valiva, piezas, valdolar, qtyvol, qtylibra, vrlibra, vrvol, wr, qtyfac, porcom, comie, bono, anticipo, comision, equipo, item, obsequio, promo, qtyobsequi, serial, 
                         simcard, bpromo, bviatico, aplcomi, valimpo, porimpo)
select idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, numcon, valdes, valdev, valtot, valaju, descrip, docrel, titulo, 
                         valiva, piezas, valdolar, qtyvol, qtylibra, vrlibra, vrvol, wr, qtyfac, porcom, comie, bono, anticipo, comision, equipo, item, obsequio, promo, qtyobsequi, serial, 
                         simcard, bpromo, bviatico, aplcomi, valimpo, porimpo
from OkeyBodegaPrin.dbo.ven_facdetalle   ---BACK
EXCEPT
select	idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, numcon, valdes, valdev, valtot, valaju, descrip, docrel, titulo, 
        valiva, piezas, valdolar, qtyvol, qtylibra, vrlibra, vrvol, wr, qtyfac, porcom, comie, bono, anticipo, comision, equipo, item, obsequio, promo, qtyobsequi, serial, 
                         simcard, bpromo, bviatico, aplcomi, valimpo, porimpo
from Okeysport.dbo.ven_facdetalle   -- DESTINO

INSERT INTO Okeysport.dbo.ven_pagos(idemp, codcto, tippag, numdoc, clapag, fecpag, nitcli, pagval, netpag, estpag, fecsys, codusu, detalle, cobrador, cambio, recibo, porcom)
select idemp, codcto, tippag, numdoc, clapag, fecpag, nitcli, pagval, netpag, estpag, fecsys, codusu, detalle, cobrador, cambio, recibo, porcom
from OkeyBodegaPrin.dbo.ven_pagos   ---BACK
except  
select idemp, codcto, tippag, numdoc, clapag, fecpag, nitcli, pagval, netpag, estpag, fecsys, codusu, detalle, cobrador, cambio, recibo, porcom
from Okeysport.dbo.ven_pagos   -- DESTINO

INSERT INTO Okeysport.dbo.ven_pagdetalle(idemp, codcto, tippag, numdoc, forpag, valpag, codban, afedoc, feccheq, estcheq, vrrtecom, vrrtefte, 
			vrrteica, vrrteiva, codusu, turno, valpropina, numrec,consig)
select idemp, codcto, tippag, numdoc, forpag, valpag, codban, afedoc, feccheq, estcheq, vrrtecom, vrrtefte, 
			vrrteica, vrrteiva, codusu, turno, valpropina, numrec,consig
from OkeyBodegaPrin.dbo.ven_pagdetalle   ---BACK
EXCEPT
select idemp, codcto, tippag, numdoc, forpag, valpag, codban, afedoc, feccheq, estcheq, vrrtecom, vrrtefte, 
			vrrteica, vrrteiva, codusu, turno, valpropina, numrec,consig
from  Okeysport.dbo.ven_pagdetalle   ---DESTINO 

INSERT INTO Okeysport.dbo.alm_kardex(idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, 
	codusu, qtypro, qtyfac, undart, estord, despacho, cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, 
    estexist, regiserv, usuconftra, fecsysconftra)
select	idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, 
		codusu, qtypro, qtyfac, undart, estord, despacho, cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, 
		estexist, regiserv, usuconftra, fecsysconftra
from	OkeyBodegaPrin.dbo.Alm_Kardex   ---BACK
EXCEPT
select	idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, 
		codusu, qtypro, qtyfac, undart, estord, despacho, cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, 
		estexist, regiserv, usuconftra, fecsysconftra
from	Okeysport.dbo.alm_kardex    ---DESTINO 

INSERT INTO Okeysport.dbo.con_comprobante(idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, debito, 
			credito, fecsys, codusu, estcomp, numche, codact, base,turno, estconcili, codimp, ctacomitar, nitter2, saldoa, ivamayvlr, itemdoc)
select	idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, debito, 
		credito, fecsys, codusu, estcomp, numche, codact, base,turno, estconcili, codimp, ctacomitar, nitter2, saldoa, ivamayvlr, itemdoc
from	OkeyBodegaPrin.dbo.con_comprobante   ---BACK
EXCEPT
select	idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, debito, 
		credito, fecsys, codusu, estcomp, numche, codact, base,turno, estconcili, codimp, ctacomitar, nitter2, saldoa, ivamayvlr, itemdoc
from	Okeysport.dbo.con_comprobante    ---DESTINO 


INSERT INTO Okeysport.dbo.Tes_egresos(idemp, codcto, tipfac, consec, codcue, fecegr, nomben, posfec, numche, valegr, desegr, netegr, estegr, tipo, observa, idusu, fecsys, observa2)
select	idemp, codcto, tipfac, consec, codcue, fecegr, nomben, posfec, numche, valegr, desegr, netegr, estegr, tipo, observa, idusu, fecsys, observa2
from	OkeyBodegaPrin.dbo.tes_egresos   ---BACK
EXCEPT
select	idemp, codcto, tipfac, consec, codcue, fecegr, nomben, posfec, numche, valegr, desegr, netegr, estegr, tipo, observa, idusu, fecsys, observa2
from	Okeysport.dbo.tes_egresos    ---DESTINO 

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
FROM	OkeyBodegaPrin.dbo.glb_terceros where nitter not in
		(SELECT	nitter FROM	Okeysport.dbo.glb_terceros)

ROLLBACK 


GO 