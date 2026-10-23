update rem set rem.codori=kar.codcto
 from ven_facdetremi AS rem
 innEr join alm_kardex as kar 
     On rem.codcon=kar.codcon and  rem.codart=kar.codart and rem.numcon=kar.numcon