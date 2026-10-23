Begin tran 
delete  from ven_facturas where numfac='00005123' and codcto='012' and tipfac='FK'

delete  from ven_facdetalle where numfac='00005123' and codcto='012' and tipfac='FK'

delete  from alm_kardex where numcon='00005123' and codcto='012' and codcon='FK'

delete  from con_comprobante where consec='2015-00-00005123' and codtran='FK' and codcto='012'

delete  from ven_pagos  where numdoc='00005123' and codcto='012' and tippag='FK'

delete  from ven_pagdetalle  where numdoc='00005123' and codcto='012' and tippag='FK'

rollback 