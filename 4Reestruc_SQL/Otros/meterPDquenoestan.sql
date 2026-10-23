declare @fecha1 date,@fecha2 date,@centro nvarchar(3)

set @fecha1='2018-01-01'
set @fecha2='2018-01-30'
set @centro ='001'
begin tran 

create table #temp (idemp nvarchar (3),codcto nvarchar (3),
					numcon nvarchar (8),fecmov date ,codcon nvarchar (3),codart nvarchar (10),
					qtyart decimal(18, 4),cosart decimal(18, 4) ,totart decimal(18, 4),netart decimal(18, 4),
					nitter nvarchar (15),observa nvarchar (15) ,codusu nvarchar (8),codartrel nvarchar (10),
					itemfac numeric(12, 0),itemprefac numeric(12, 0))
insert into #temp (idemp,codcto,numcon,fecmov,codcon,codart,qtyart,cosart,totart,netart,nitter,observa ,codusu,
		codartrel,itemfac,itemprefac)

select k.idemp,k.codcto,k.numcon,k.fecmov,'PD',k.codart,k.qtyart,k.cosart,k.totart,k.netart,k.nitter,'Global' ,
'GLOBAL',k.codartrel,k.itemfac,k.itemprefac 
 from alm_kardex as k
right  join 
					(select vd.codcto,vd.numpre,vd.codart,vd.qtyart,vd.devart,vd.qtyfac,vd.item  from ven_prefactura  as vc
					inner join  ven_prefacdetalle as vd
					on vc.numpre=vd.numpre  and vc.codcto=vd.codcto
					where vc.fecpre between @fecha1 and @fecha2 and  vd.devart<>0  and vc.codcto=@centro  ) pre

on  pre.numpre=k.numcon and pre.codcto=k.codcto and pre.codart=k.codartrel and pre.item=k.itemprefac 
where  numcon is not null 


commit  

-----------------------------------------

begin tran 

insert into alm_kardex(idemp,codcto,numcon,fecmov,codcon,codart,qtyart,cosart,totart,netart,nitter,observa ,codusu,
		codartrel,itemfac,itemprefac)

select  t.idemp,t.codcto,t.numcon,t.fecmov,t.codcon,t.codart,t.qtyart,t.cosart,t.totart,t.netart,t.nitter,t.observa ,t.codusu,
		t.codartrel,t.itemfac,t.itemprefac from #temp  as t 
	left join   alm_kardex as k 
	 on t.idemp=k.idemp and t.codcto=k.codcto and t.numcon=k.numcon and t.codcon=k.codcon and t.codart=k.codart and t.itemfac=k.itemfac
	 	 where   k.numcon is null 

rollback   
--drop table  #temp 