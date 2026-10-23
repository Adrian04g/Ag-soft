USE [Nando]
GO
/****** Object:  StoredProcedure [dbo].[db_Sp_Maestros_PasoInformacion]    Script Date: 12/09/2015 02:29:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[db_Sp_Movimientos_PasoInformacion]
	@strIdemp		nvarchar (3) ='',	@strCodCto	nvarchar(3)='',	@strBdDestino nvarchar(100)='',		@strBdOrigen	nvarchar(100)='',
	@datFecini		date,				@datFecFin date,			@numTipo numeric(1)=0		
AS	
BEGIN TRY
	--@numtipo =1 toda las transacciones =2 todas menos las de vtas
	Declare	@mNerror	int=0,			@mMsg		nvarchar(190),
			@mLinea		int=0,			@mAddMsg	nvarchar(50),		@mDebito decimal(14,2),
			@mCredito	decimal(14,2),	@mCodcen	nvarchar(3),		@mCodalm nvarchar(3),
			@mEstcomp	nvarchar(1),	@mFecdoc	date,				@mProc   nvarchar(30),
			@pVerMsg	int=0,			@mItemDoc	numeric(6),			@strCodCto_Lc nvarchar(3)
	
	SET @strCodCto_Lc	= Case When @strCodCto='' Then NULL Else @strCodCto End


	Declare @strCadenaSql	 nVarchar(Max)
	
	--1 Com facturas 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_Facturas(idemp, codcto, numfac, tipfac, fecfac, venfac, codcue, nitpro, valfac, desfac, ivafac, impfac, 
										poriva, retiva, devfac, abofac, netfac, estfac, fecsys, codusu, observa, docfac, codcue2, vrxser, despacho, cendespach, ivamayorvr, 
										cambioFact )
						select	Fac.idemp, Fac.codcto, Fac.numfac, Fac.tipfac, Fac.fecfac, Fac.venfac, Fac.codcue, Fac.nitpro, Fac.valfac, Fac.desfac, Fac.ivafac, 
								Fac.impfac, Fac.poriva, Fac.retiva, Fac.devfac, Fac.abofac, Fac.netfac, Fac.estfac, Fac.fecsys, Fac.codusu, Fac.observa, Fac.docfac, 
								Fac.codcue2, Fac.vrxser, Fac.despacho, Fac.cendespach, Fac.ivamayorvr, Fac.cambioFact
						FROM	'+@strBdOrigen+'.dbo.Com_Facturas Fac
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.tipfac=Tra.CodTran 
						Where	Fac.IdEmp=@strIdemp and Fac.Fecfac between @datFecini and @datFecFin and Tra.Doble=1 and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
								
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp

	--2 com facdetalle 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_Facdetalle(idemp, codcto, numfac, tipfac, codart, undart, totart, desart, ivaart, impart, sia, 
									 qtyart, devart, cosart, descrip, numord, codact, tipord, ivaartinf, item, ppublico, pordes)
							select	 Det.idemp, Det.codcto, Det.numfac, Det.tipfac, Det.codart, Det.undart, Det.totart, Det.desart, Det.ivaart, Det.impart, Det.sia,
									 Det.qtyart, Det.devart, Det.cosart, Det.descrip, Det.numord, Det.codact, Det.tipord, Det.ivaartinf, Det.item, Det.ppublico, 
									 Det.pordes
							FROM	'+@strBdOrigen+'.dbo.Com_Facturas Fac
									inner join  '+@strBdOrigen+'.dbo.Com_Facdetalle  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.tipfac=det.tipfac  and fac.numfac=det.numfac 
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.tipfac=Tra.CodTran 
							Where	Fac.IdEmp=@strIdemp and Fac.Fecfac between @datFecini and @datFecFin and Tra.Doble=1 and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'

	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp
		 
	 --3 com facdescuentos
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_Facdescuentos( idemp, codcto, tippag, numdoc, coddes, base, pordes, valdes, tipdes)
						select	dcto.idemp, dcto.codcto, dcto.tippag, dcto.numdoc, dcto.coddes, dcto.base, dcto.pordes, dcto.valdes, dcto.tipdes
						FROM	'+@strBdOrigen+'.dbo.Com_Facturas Fac
								inner join '+@strBdOrigen+'.dbo.Com_Facdescuentos	dcto on fac.idemp=dcto.idemp and fac.codcto=dcto.codcto and fac.tipfac=dcto.tippag  and fac.numfac=dcto.numdoc 
								inner join '+@strBdOrigen+'.dbo.Glb_Transaccion		Tra on Fac.tipfac=Tra.CodTran 
						Where	Fac.IdEmp=@strIdemp and Fac.Fecfac between @datFecini and @datFecFin and Tra.Doble=1 and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp
	
	 --4 com movpro
	 SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_MovPro( idemp, codcto, doccom, tipdoc, feccom, nitpro, afecen, afetip, afedoc, debcom, crecom, 
								fecsys, codusu, estmov)
						select	 Mov.idemp, Mov.codcto, Mov.doccom, Mov.tipdoc, Mov.feccom, Mov.nitpro, Mov.afecen, Mov.afetip, Mov.afedoc, Mov.debcom, 
								Mov.crecom, Mov.fecsys, Mov.codusu, Mov.estmov
						FROM	'+@strBdOrigen+'.dbo.Com_MovPro Mov
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Mov.DocCom=Tra.CodTran 
						Where	Mov.IdEmp=@strIdemp and Mov.FecCom between @datFecini and @datFecFin and Tra.Doble=1 and  (Mov.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
								
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp

	--5 ordenes 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_ordenes(idemp, codcto, tipfac, numfac, fecfac, venfac, codcue, nitpro, valfac, desfac, ivafac, 
								impfac, poriva, retiva, devfac, abofac, netfac, estfac, fecsys, codusu, observa, docfac, fecdocfac, tipdocfac, fecent, codcan)
						select	Fac.idemp, Fac.codcto, Fac.tipfac, Fac.numfac, Fac.fecfac, Fac.venfac, Fac.codcue, Fac.nitpro, Fac.valfac, Fac.desfac, Fac.ivafac,
								Fac.impfac, Fac.poriva, Fac.retiva, Fac.devfac, Fac.abofac, Fac.netfac, Fac.estfac, Fac.fecsys, Fac.codusu, Fac.observa, Fac.docfac, 
								Fac.fecdocfac, Fac.tipdocfac, Fac.fecent, Fac.codcan
						FROM	'+@strBdOrigen+'.dbo.Com_ordenes Fac
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.tipfac=Tra.CodTran 
						Where	Fac.IdEmp=@strIdemp and Fac.Fecfac between @datFecini and @datFecFin and Tra.Doble=1 and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
								
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp
		
	--6 detalle ordenes 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_Orddetalle(idemp, codcto, numfac, codart, undart, totart, desart, ivaart, impart, sia, qtyart, 
									devart, cosart, descrip, numord, qtyped, tipfac, colart, numreq, pordes, observa, ivaartinf)
							select	Det.idemp, Det.codcto, Det.numfac, Det.codart, Det.undart, Det.totart, Det.desart, Det.ivaart, Det.impart, Det.sia, Det.qtyart, 
									Det.devart, Det.cosart, Det.descrip, Det.numord, Det.qtyped, Det.tipfac, Det.colart, Det.numreq, Det.pordes, Det.observa, Det.ivaartinf
							FROM	'+@strBdOrigen+'.dbo.Com_ordenes Fac
									inner join  '+@strBdOrigen+'.dbo.Com_Orddetalle  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.tipfac=det.tipfac  and fac.numfac=det.numfac 
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.tipfac=Tra.CodTran 
							Where	Fac.IdEmp=@strIdemp and Fac.Fecfac between @datFecini and @datFecFin and Tra.Doble=1 and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'

	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp
	
	--7 com notas 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Com_Notas(idemp, codcto, tipnot, numnot, fecnot, valnot, valiva, concepto, afecen, afetip, afedoc, 
								devpro, observa, impnota, estnot, abofact)
						select	Fac.idemp, Fac.codcto, Fac.tipnot, Fac.numnot, Fac.fecnot, Fac.valnot, Fac.valiva, Fac.concepto, Fac.afecen, Fac.afetip, 
								Fac.afedoc, Fac.devpro, Fac.observa, Fac.impnota, Fac.estnot, Fac.abofact
						FROM	'+@strBdOrigen+'.dbo.Com_Notas Fac
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.tipnot=Tra.CodTran 
						Where	Fac.IdEmp=@strIdemp and Fac.Fecnot between @datFecini and @datFecFin and Tra.Doble=1 and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp

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
	
	--10 Con comprobante 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Con_Comprobante( idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, 
								detalle, debito, credito, fecsys, codusu, estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar, nitter2, 
								saldoa, ivamayvlr, itemdoc, timedife, prefijo, revelaciones)
						select	Com.idemp, Com.codalm, Com.codcen, Com.codcto, Com.codtran, Com.consec, Com.codctodet, Com.fecdoc, Com.codcue, Com.nitter, 
								Com.detalle, Com.debito, Com.credito, Com.fecsys, Com.codusu, Com.estcomp, Com.numche, Com.codact, Com.base, Com.turno, 
								Com.estconcili, Com.codimp, Com.ctacomitar, Com.nitter2, Com.saldoa, Com.ivamayvlr, Com.itemdoc, Com.timedife, Com.prefijo, 
								Com.revelaciones
						FROM	'+@strBdOrigen+'.dbo.Con_Comprobante  Com
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Com.CodTran=Tra.CodTran and Tra.codmod!=''VT''
						Where	Com.IdEmp=@strIdemp and Com.FecDoc between @datFecini and @datFecFin and Tra.Doble=1 
								and  (Com.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp




END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
