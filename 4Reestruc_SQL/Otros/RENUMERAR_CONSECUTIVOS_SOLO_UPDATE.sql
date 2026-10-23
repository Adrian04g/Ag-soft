--use contable
update con_comprobante 
set consec =x.num 
from con_comprobante c 
inner join (select codcto, codtran,consec,  ROW_NUMBER ( )   
			OVER (  PARTITION BY codcto, codtran order by codcto, codtran,consec  )  + 445 as num
			from con_comprobante where codtran='CF' and consec!=''  and codcto='001'
			group by codcto, codtran,consec  order by codcto, codtran,consec) as x on --cocdto tip num  