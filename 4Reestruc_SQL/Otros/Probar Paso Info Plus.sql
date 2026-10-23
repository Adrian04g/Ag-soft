begin tran 
declare 	@strIdemp		varchar(3)   ='001',
			@strCodCto		varchar(1)	 ='',
			@strBdDestino	varchar(20) ='Okey_Sayara',	
			@strBdOrigen	varchar(20) ='SAYARA',
			@datFecini		nvarchar(10)='20180501',
			@datFecFin		nvarchar(10)='20180530',
			@numTipo		numeric(1)	=1	,
			@strCadenaSql	nVarchar(Max),
			@strCodCto_Lc	nvarchar(3)

SET @strCodCto_Lc	= Case When @strCodCto='' Then NULL Else @strCodCto End
	 
					
--8 Egresos 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Tes_Egresos(idemp, codcto, tipfac, consec, codcue, fecegr, nomben, posfec, numche, valegr, desegr, 
								netegr, estegr, tipo, observa, idusu, fecsys, observa2)
						select	Egr.idemp, Egr.codcto, Egr.tipfac, Egr.consec, Egr.codcue, Egr.fecegr, Egr.nomben, Egr.posfec, Egr.numche, Egr.valegr, Egr.desegr, 
								Egr.netegr, Egr.estegr, Egr.tipo, Egr.observa, Egr.idusu, Egr.fecsys, Egr.observa2
						FROM	'+@strBdOrigen+'.dbo.Tes_Egresos Egr
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Egr.tipfac=Tra.CodTran 
						Where	Egr.IdEmp=@strIdemp and Egr.Fecegr between @datFecini and @datFecFin and Tra.Doble=1 and  (Egr.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp

	
	 --8.1 com facdescuentos de egresos 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_Facdescuentos( idemp, codcto, tippag, numdoc, coddes, base, pordes, valdes, tipdes)
						select	dcto.idemp, dcto.codcto, dcto.tippag, dcto.numdoc, dcto.coddes, dcto.base, dcto.pordes, dcto.valdes, dcto.tipdes
						FROM	'+@strBdOrigen+'.dbo.Tes_Egresos Fac
								inner join '+@strBdOrigen+'.dbo.Com_Facdescuentos	dcto on fac.idemp=dcto.idemp and fac.codcto=dcto.codcto and fac.tipfac=dcto.tippag  and RIGHT(fac.consec,8)=dcto.numdoc 
								inner join '+@strBdOrigen+'.dbo.Glb_Transaccion		Tra on Fac.tipfac=Tra.CodTran 
						Where	Fac.IdEmp=@strIdemp and Fac.FecEgr between @datFecini and @datFecFin and Tra.Doble=1 and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp



	--9 alm kardex 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Alm_Kardex( idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, 
								netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, codusu, qtypro, qtyfac, undart, estord, despacho, 
								cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, estexist, regiserv, 
								DocRel)
						select	Kar.idemp, Kar.codcto, Kar.numcon, Kar.fecmov, Kar.codcon, Kar.codart, Kar.qtyart, Kar.cosart, Kar.valart, Kar.ivaart, Kar.totart,
								Kar.netart, Kar.traalm, Kar.centra, Kar.contra, Kar.consec, Kar.nitter, Kar.observa, Kar.estkar, Kar.fecsys, Kar.codusu, Kar.qtypro, 
								Kar.qtyfac, Kar.undart, Kar.estord, Kar.despacho, Kar.cendespach, Kar.estserial, Kar.codartrel, Kar.docfac, Kar.fecvence, 
								Kar.itemprefac, Kar.codprod, Kar.valimpo, Kar.itemfac, Kar.porimpo, Kar.devpro, Kar.estexist, Kar.regiserv, Kar.DocRel
						FROM	'+@strBdOrigen+'.dbo.Alm_KArdex Kar
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Kar.CodCon=Tra.CodTran and Tra.codmod!=''VT''
						Where	Kar.IdEmp=@strIdemp and Kar.FecMov between @datFecini and @datFecFin and Tra.Doble=1 and  (Kar.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp
	
		rollback 