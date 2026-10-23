
update glb_usuarios 
set clausunet= DBO.FE_GenerarClave ('MASTER','MASTER')
 WHERE CODUSU='MASTER'

