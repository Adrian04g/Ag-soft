


begin tran 

---Ven_facturas 

	update ven_facturas set numfac='0000094' 
	where numfac='00000096' and codcto='052' and tipfac='FK'
Go
	update ven_facturas set numfac='00000096' 
	where numfac='00000094' and codcto='052' and tipfac='FK'
Go
	update ven_facturas set numfac='00000094' 
	where numfac='0000094' and codcto='052' and tipfac='FK'
Go

--Ven_facdetalle 
	update ven_facdetalle  set numfac='0000094' 
	where numfac='00000096' and codcto='052' and tipfac='FK'
Go
	update ven_facdetalle  set numfac='00000096' 
	where numfac='00000094' and codcto='052' and tipfac='FK'
Go

	update ven_facdetalle  set numfac='00000094' 
	where numfac='0000094' and codcto='052' and tipfac='FK'
Go

--Con_comprobante
update con_comprobante set consec='2015-00-0000094'
where consec='2015-00-00000096' and codcto='052' and codtran='FK'

update con_comprobante set consec='2015-00-00000096'
where consec='2015-00-00000094' and codcto='052' and codtran='FK'

update con_comprobante set consec='2015-00-00000094'
where consec='2015-00-0000094' and codcto='052' and codtran='FK'

--Alm_kardex 
 update alm_kardex set numcon='0000094'
 where numcon='00000096' and codcto='052' and codcon='FK'

  update alm_kardex set numcon='00000096'
  where numcon='00000094' and codcto='052' and codcon='FK'

  update alm_kardex set numcon='00000094'
  where numcon='0000094' and codcto='052' and codcon='FK'

--Ven_pagos

	update ven_pagos set numdoc='0000094'
	where numdoc='00000096' and codcto='052' and tippag='FK'

	update ven_pagos set numdoc='00000096'
	where numdoc='00000094' and codcto='052' and tippag='FK'

	update ven_pagos set numdoc='00000094'
	where numdoc='0000094' and codcto='052' and tippag='FK'

-- ven_padgetalle 

update ven_pagdetalle  set numdoc='0000094'
	where numdoc='00000096' and codcto='052' and tippag='FK'

	update ven_pagdetalle  set numdoc='00000096'
	where numdoc='00000094' and codcto='052' and tippag='FK'

	update ven_pagdetalle set numdoc='00000094'
	where numdoc='0000094' and codcto='052' and tippag='FK'

rollback 
