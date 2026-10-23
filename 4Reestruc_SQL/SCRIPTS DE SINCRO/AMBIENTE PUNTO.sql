set ansi_warnings off;
update SYN_PUBLICACIONES set EquipoModificacion=@@SERVERNAME
update SYN_REG_VERSIONESTABLA set cd_SRV_NOMB = @@SERVERNAME
update syn_tablaspublicacion set EquipoModificacion=@@SERVERNAME
set ansi_warnings on;