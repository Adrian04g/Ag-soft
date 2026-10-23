select * from alm_articulos 
--where codart = 'AGU-000001'
--where ivaart = 0
where porimpo = 0

select * from alm_inventario 
where codart = 'AGU-000001'

--begin tran
--update alm_inventario
--set pvcart = pvcart * 0.925925926
--where codart = 'AGU-000001'
--and pvcart > 0
--rollback

begin tran
update alm_articulos
set ivaart = 0
--where ivaart = 0
commit


begin tran
update alm_articulos
set ivacero = '1'
where ivaart = 0
commit

begin tran
update alm_articulos
set porimpo = 8
where ivaart = 0
commit

begin tran
update alm_articulos
set Impoconsumocero = '0'
where porimpo = 8
commit