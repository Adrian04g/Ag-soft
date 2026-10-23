select * from ven_facturas where numfac >'00006877' and numfac < '00006899' order by numfac desc
--select * from ven_facdetalle where numfac >'00006877' and numfac < '00006899' order by numfac desc
--select * from ven_movcli where docven >'00006877' and docven < '00006899'  order by docven desc
select * from ven_pagos where numdoc >'00006877' and numdoc < '00006899' order by numdoc desc
select * from ven_pagdetalle where numdoc >'00006877' and numdoc < '00006899' order by numdoc desc
--select * from con_comprobante where codtran= 'FV'

begin tran
update ven_facturas set fecfac = '2019-11-08' where numfac >'00006877' and numfac < '00006899' 
update ven_facturas set venfac = '2019-11-08' where numfac >'00006877' and numfac < '00006899' 
rollback

begin tran
update ven_pagos set fecpag = '2019-11-08' where numdoc >'00006877' and numdoc < '00006899'
rollback

begin tran
update ven_pagdetalle set feccheq = '2019-11-08' where numdoc >'00006877' and numdoc < '00006899' 
rollback