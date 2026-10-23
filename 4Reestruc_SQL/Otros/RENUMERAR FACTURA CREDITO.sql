--Cambiar consecutivo, cuando toma el consecutivo de la pos
SELECT * from ven_facturas where numfac = '00010642' and tipfac = 'z1'
SELECT * from ven_facdetalle where numfac = '00010642' and tipfac = 'z1'
SELECT * from con_comprobante where consec = '2024-00-00010642' and codtran = 'z1'
select * from ven_movcli where docven = '00010642' and tipdoc = 'Z1'
select * from ven_facuota where numfac = '00010642' and tipfac = 'Z1'

begin tran
update ven_facturas set numfac = '00011001' where numfac = '00010642' and tipfac = 'z1'
update ven_facdetalle set numfac = '00011001' where numfac = '00010642' and tipfac = 'z1'
update con_comprobante set consec = '2024-00-00011001' where consec = '2024-00-00010642' and codtran = 'z1'
update ven_movcli set docven = '00011001' where docven = '00010642' and tipdoc = 'Z1'
update ven_facuota set numfac = '00011001' where numfac = '00010642' and tipfac = 'Z1'
rollback