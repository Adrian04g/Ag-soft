set ansi_warnings off;
update SYN_PUBLICACIONES set EquipoModificacion='PDESARROLLO'
update SYN_REG_VERSIONESTABLA set cd_SRV_NOMB = @@SERVERNAME
update syn_tablaspublicacion set EquipoModificacion='PDESARROLLO'
set ansi_warnings on;