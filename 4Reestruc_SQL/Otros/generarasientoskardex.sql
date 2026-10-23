--select codcon FRom ALM_KARDEX GROUP BY CODCON ORDER BY CODCON

-- GENERAR ASIENTOS CONTABLES DESDE EL KARDEX.  MOVIENTOS DE INVETARIO

-- PRIMERO SE ACTU EL COSTO EN EL KARDEX DESDE INVETARIO
declare @mcodcto nvarchar(3)
declare @midemp nvarchar(3)

set @mcodcto = '001'
set @midemp	 = '001'

UPDATE Alm_Kardex													 
SET 	cosart=Inv.Valprom,	totart=ROUND(qtyart * cosart,0),	
		netart=ROUND(totart * (1+(ivaart/100)),0) 				
from	alm_kardex kar 												
		inner join alm_inventario inv on kar.IdEmp=inv.idemp and kar.codcto=inv.codcto and 
										 kar.codart=inv.codart and inv.codcto=@mcodcto and inv.IdEmp=@mIdemp 		
WHERE 	year(Kar.fecmov)=2018 and Kar.IdEmp=@midemp and kar.codcto=@mcodcto and 
		codcon in ('AB','AC','AD','CC','EP','SA','SB','SC','SD','SN')

-- SE BORRARON LOS COMPROBANTES PARA GENERARLOS NUEVAMENTE.
--begin tran 
-- cta inventario 
insert into con_comprobante( idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, debito, credito, codusu, itemdoc)
SELECT 	max(kar.idemp), kar.codcto, kar.codcto, kar.codcto, kar.codcon, concat('2018-00-',kar.numcon), kar.codcto,max(kar.fecmov), gru.ctacmp,'900100092',
		concat(tra.nomtran,' Nro.',kar.numcon),iif(tra.tipcon='E',SUM(kar.TOTART),0),iif(tra.tipcon='S',SUM(kar.TOTART),0),max(kar.codusu),right(gru.ctacmp,1)
from 	alm_kardex kar 															
		inner join alm_articulos   art on kar.codart=art.codart 				
		inner  join alm_grupos 	   gru on art.codgru=gru.codgru					
		inner join glb_transaccion tra on kar.codcon=tra.codtran				
WHERE   YEAR(kar.fecmov)=2018 and kar.codcon in ('AB','AC','AD','CC','EP','SA','SB','SC','SD','SN')     	
		GROUP BY kar.CODCto,kar.CODCON,kar.NUMCON,gru.ctacmp,tra.nomtran,tra.tipcon  
		order by kar.codcon, kar.numcon

--contra partida 
insert into con_comprobante( idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, debito, credito, codusu, itemdoc)
SELECT 	max(kar.idemp), kar.codcto, kar.codcto, kar.codcto, kar.codcon, concat('2018-00-',kar.numcon), kar.codcto,max(kar.fecmov), max(tra.codcue),'900100092',
		concat(tra.nomtran,' Nro.',kar.numcon),iif(tra.tipcon='S',SUM(kar.TOTART),0),iif(tra.tipcon='E',SUM(kar.TOTART),0),max(kar.codusu),6
from 	alm_kardex kar 															
		inner join alm_articulos   art on kar.codart=art.codart 				
		inner  join alm_grupos 	   gru on art.codgru=gru.codgru					
		inner join glb_transaccion tra on kar.codcon=tra.codtran				
WHERE   YEAR(kar.fecmov)=2018 and kar.codcon in ('AB','AC','AD','CC','EP','SA','SB','SC','SD','SN')     	
		GROUP BY kar.CODCto,kar.CODCON,kar.NUMCON,tra.nomtran,tra.tipcon  
		order by kar.codcon, kar.numcon
	
	--rollback


