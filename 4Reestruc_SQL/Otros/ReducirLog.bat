echo on
sqlcmd -E -S SERVIDOR\DESARROLLO  -d OSPINO_CAÑAS -i G:\4Reestruc_SQL\Otros\ReducirLOG.sql
CLS
@exit

echo Proceso Completa

pause

exit
pause
:ERROR