
begin tran 
declare @mnit nvarchar(15), @mnumfac nvarchar(8), @mconsec nvarchar(16)
set @mnit = '901148315'
set @mnumfac = '00005133'
set @mconsec = concat('2018-00-',@mnumfac)

update ven_facturas set nitcli=@mnit where  codcto='001' and tipfac='FC' and numfac=@mnumfac
update ven_movcli   set nitcli=@mnit where  codcto='001' and tipdoc='FC' and docven=@mnumfac
update con_comprobante set nitter=@mnit where  codcto='001' and codtran='FC' and consec=@mconsec

commit 



