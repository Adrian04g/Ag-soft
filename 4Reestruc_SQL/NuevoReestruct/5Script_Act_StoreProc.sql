IF OBJECT_ID('dbo.Com_Sp_ActFacturaProveedor','P') IS NOT NULL	DROP PROCEDURE dbo.Com_Sp_ActFacturaProveedor
GO
CREATE PROCEDURE dbo.Com_Sp_ActFacturaProveedor
	@pIdemp		 nvarchar(3)  ='',	 @pCodcto     nvarchar(3)  ='',	@pNumfac     nvarchar(08)='',
	@pTipfac	 nvarchar(2)  ='',	 @pFecfac     nvarchar(10) ='',	@pVenfac     nvarchar(10)='',
	@pCodcue	 nvarchar(8)  ='',	 @pNitpro     nvarchar(12) ='',	@pValfac     decimal (12)=0,
	@pDesfac	 decimal(12,2)=00,   @pIvafac     decimal(12,0)= 0,	@pImpfac     decimal (12)=0,
	@pPoriva	 decimal(8,3) =00,   @pRetiva     decimal(12,2)= 0,	@pDevfac     decimal (12)=0,
	@pAbofac	 decimal(12)  =00,   @pNetfac     decimal(12)  = 0,	@pEstfac     nvarchar(01)='',
    @pCodusu	 nvarchar(8)  ='',   @pObserva    nvarchar(max)='',
	@pDocfac	 nvarchar(10) ='',   @pCodcue2    nvarchar(8)  ='',	@pVrxser     decimal(12 ,2)=0,
	@pDespacho	 nvarchar(8)  ='',   @pCendespach nvarchar(3)  ='',	@pIvamayorvr decimal(14 ,2)=0,
	@pCambioFact nVarchar(14) ='',   @pCodctoA    nvarchar(3)  ='',	@pTipfacA    nVarchar(2)   ='',
	@pNumfacA	 nvarchar(8)  ='',   @pProc       int             ,	@pAnuFac     bit = 0 ,
	@pFecAnul	 nvarchar(10) ='',	 @pItem numeric(10)=0,			@pModificadoc Numeric(6)=0
AS
BEGIN TRY
	Declare @mExiste char(1),		@mNerror int,		@mMsg nvarchar(190),	@mLinea  int,
			@mAddMsg nvarchar(50),	@mProc   char(20),	@mFecfac date,			@mVenfac date,
			@pVerMsgBox int = 0,	@mFecanul date,		@mItemDoc	numeric(5)
	
	Select	@mExiste ='N',		@mNerror=57021,		@mLinea=0,		@mProc ='Com_Sp_ActFacturaProveedor',		@mAddMsg=' ',
			@mFecfac = convert(date,@pFecfac),		@mVenfac = convert(date,@pVenfac),			@mFecAnul = convert(date,@pFecAnul)

	
	If @pProc = 3 --Eliminar Resgistro
	Begin
		DELETE FROM Con_Comprobante 
		WHERE idemp=@pIdemp And codcto=@pcodcto And codtran=@pTipfac And RIGHT(consec,8)=@pNumfac
		DELETE FROM Alm_Kardex 
		WHERE Idemp=@pIdemp And codcon=@pTipfac And codcto=@pCodcto And numcon=@pNumfac
		DELETE FROM Com_Facdescuentos 
		WHERE idemp=@pIdemp And codcto=@pCodcto And numdoc=@pNumfac And tippag = @pTipfac
		DELETE FROM Com_Facdetremi 
		WHERE idemp=@pIdemp And codcto=@pCodcto And numfac=@pNumfac And tipfac=@pTipfac 
		DELETE FROM Com_Movpro 
		WHERE idemp=@pIdemp And Codcto=@pCodcto And Doccom=@pNumfac And tipdoc=@pTipfac 
		DELETE FROM Com_Facdetalle 
		WHERE idemp=@pIdemp And codcto=@pCodcto And numfac=@pNumfac And tipfac=@pTipfac 
		DELETE FROM com_facturas  
		WHERE idemp=@pIdemp And codcto=@pCodcto And numfac=@pNumfac And tipfac=@pTipfac 
	End 	

	If @pProc = 1  --Nuevo Registro
	Begin  
		INSERT INTO com_facturas(idemp,codcto,numfac,tipfac,fecfac,venfac,codcue,nitpro,valfac,desfac,
	                           ivafac,impfac,poriva,retiva,devfac,abofac,netfac,estfac,codusu,observa,
							   docfac,codcue2,vrxser,despacho,cendespach,ivamayorvr,CambioFact,modificadoc) 
		VALUES(@pIdemp,@pCodcto,@pNumfac,@pTipfac,@mFecfac,@mVenfac,@pCodcue,@pNitpro,@pValfac,@pDesfac,
			        @pIvafac,@pImpfac,@pPoriva,@pRetiva,@pDevfac,@pAbofac,@pNetfac,@pEstfac,@pCodusu,@pObserva,
					@pDocfac,@pCodcue2,@pVrxser,@pDespacho,@pCendespach,@pIvamayorvr,@pCambiofact,@pModificadoc)
		
		UPDATE	com_ordenes 
		SET		EstFac = 'F', DOCFAC=@pNumfac , TIPDOCFAC=@pTipfac, FECDOCFAC=@mFecfac 
		WHERE	codcto=@pCodctoA  AND tipdocfac=@pTipfacA AND Docfac=@pNumfacA
	End 
  
	IF @pProc = 4  --Anulacion registro  
	BEGIN  
		If Exists(	Select CodCto,TipFac,Numfac 
					From   com_facturas 
					Where  Idemp=@pIdemp And CodCto=@pCodcto And TipFac=@pTipfac And Numfac=@pNumfac)
	     UPDATE com_facturas 
		 SET	EstFac='A' 
		 WHERE	Idemp=@pIdemp And CodCto=@pCodcto And TipFac=@pTipfac And Numfac=@pNumfac
	
	If Exists(	Select TIPDOC,CODCTO,DOCCOM 
	            From   Com_movpro 
				Where  idemp=@pIdemp And TIPDOC=@pTipfac And CODCTO=@pCodcto And DOCCOM=@pNumfac )
	Begin 
		If @pAnufac = 0
		Begin 
			Insert Into com_movpro(idemp,CodCto,TipDoc,DocCom,FecCom,NitPro,Afecen,AfeTip,Afedoc,DebCom,Codusu,item)
		    select	idemp,CodCto,@pTipfacA as TipDoc,DocCom,@mFecAnul as FecCom,NitPro,Afecen,TipDoc as AfeTip,
					DocCom as Afedoc,CreCom as DebCom,@pCodusu as Codusu,@pItem
		    From	com_movpro 
		    Where	idemp=@pIdemp And TIPDOC=@pTipfac And CODCTO=@pCodcto And DOCCOM=@pNumfac
		End 
		Else 
			Update	com_movpro 
			Set		Estmov='A' 
			Where	idemp=@pIdemp And TIPDOC=@pTipfac And CODCTO=@pCodcto And DOCCOM=@pNumfac
		End 
	End 
End TRY

Begin Catch
   set	@mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch  
GO

IF OBJECT_ID('Com_Sp_Ordenes','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Com_Sp_Ordenes
END
GO
CREATE PROCEDURE Com_Sp_Ordenes

  @pIdemp       nvarchar(3),  @pCodcto      nvarchar(3),    @pNumfac   nvarchar(8),  
   @pTipfac      nvarchar(2),  @pFecfac      date,           @pVenfac   date,  
   @pCodcue      nvarchar(8),  @pNitpro      nvarchar(12),   @pValfac   decimal(12,0),  
   @pDesfac      decimal(12,2),@pIvafac      decimal(12,0),  @pImpfac   decimal(12,0),  
   @pPoriva      decimal(8,3), @pRetiva      decimal(12,2),  @pDevfac   decimal(12,0),  
   @pAbofac      decimal(12,0),@pNetfac      decimal(12,0),  @pEstfac   nvarchar(1),  
   @pCodusu      nvarchar(8),  @pObserva     nvarchar(max),  @pDocfac   nvarchar(10),  
   @pFecdocfac   date,         @pTipdocfac   nvarchar(3),    @pFecent   date,  
   @pCodcan      nvarchar(2)  

   	
AS
BEGIN
  select * from com_cancela 	
END
GO

IF OBJECT_ID('dbo.Con_Sp_ActParametros','P') IS NOT NULL	DROP PROCEDURE Con_Sp_ActParametros
GO
CREATE PROCEDURE dbo.Con_Sp_ActParametros
		@añomayoriza    decimal(4,0)=0,		@codcto			nvarchar(10)='',	@ctauti         nvarchar(8)='',		@ctaper			nvarchar(8)='',
		@ctaivacom      nvarchar(8)='',		@ctaivavta		nvarchar(8)='',		@ctaicacom      nvarchar(8)='',		@ctaicavta		nvarchar(8)='',
		@ctaretcom      nvarchar(8)='',		@ctaretvta		nvarchar(8)='',		@ctaretiva      nvarchar(8)='',		@ctarivacom		nvarchar(8)='',
		@ctacxp         nvarchar(8)='',		@ctacxc			nvarchar(8)='',		@ctadesc		nvarchar(8)='',		@ctaing			nvarchar(8)='',
		@ctacaja		nvarchar(8)='',		@ctacosto		nvarchar(8)='',		@ctainv			nvarchar(8)='',		@ctaped			nvarchar(8)='',
		@iva			decimal(6,2)=0,		@ctapropd		nvarchar(8)='',		@ctapropc		nvarchar(8)='',		@ctaajpdb		nvarchar(8)='',
		@ctaajpcr		nvarchar(8)='',		@ctaabono		nvarchar(8)='',		@ctaingreso		nvarchar(8)='',		@ctapropina		nvarchar(8)='',
		@porcentaje		decimal(6,2)=0,		@descuento		decimal(6,2)=0,		@ctacuota		nvarchar(8)='',		@ctaobra		nvarchar(8)='',
		@ctaretserv		nvarchar(8)='',		@nivelmay		nvarchar(8)='',		@ctaimpcom		nvarchar(8)='',		@cuecen			nvarchar(8)='',
		@cuenit			nvarchar(15)='',	@ctaadmon		nvarchar(8)='',		@ctaimprevisto	nvarchar(8)='',		@ctautilidad	nvarchar(8)='',
		@formatoegre	decimal(1,0)=0,		@noagrudepre	bit=0,				@ivainclu		nvarchar(8)='',		@ctacomitar		nvarchar(8)='',
		@ctaint			nvarchar(8)='',		@ctatransp		nvarchar(8)='',		@coddepre		nvarchar(8)='',		@ctadevol		nvarchar(8)='',
		@codtraneg		nvarchar(8)='',		@ctaanticip		nvarchar(8)='',		@ctagastos		nvarchar(8)='',		@ctaivasimp		nvarchar(8)='',
		@ctareftesi		nvarchar(8)='',		@ctaxpotr		nvarchar(8)='',		@nit2			nvarchar(8)='',		@ctaivacomdev	nvarchar(8)='',
		@ctaivavtadev	nvarchar(8)='',		@ctaivagas		nvarchar(8)='',		@ctaimpo		nvarchar(8)='',		@pIdemp			nvarchar(3),
		@ctareftesimpli	nvarchar(8)='',		@ctacomitarj	nvarchar(8)='',		@ctaanticipo	nvarchar(8)='',		@ctaivasimpli	nvarchar(8)='',
		@CtaCreeVta		nvarchar(8)='',		@CtaCreeVtaCr	nvarchar(8)='',		@añoniif		decimal(10,0)=0,	@prefniif		nvarchar(2)='',
		@autoretcre		bit=0,				@CtaRetgta	nvarchar(8)='',			@ctaMerca		nvarchar(8)='',		@cpdecima		decimal(10,0)=0
AS
BEGIN TRY
	Declare @mAddMsg	nvarchar(230)='',
			@pVerMsg	int=0,
			@mProc		nvarchar(30)='Con_Sp_ActParametros'

	IF Exists (Select * From Con_Parametros Where idemp=@pIdemp)
		Update	Con_Parametros 
		   Set	añomayoriza=@añomayoriza,		codcto=@codcto,				ctauti=@ctauti,					ctaper=@ctaper,
				ctaivacom=@ctaivacom,			ctaivavta=@ctaivavta,		ctaicacom=@ctaicacom,			ctaicavta=@ctaicavta,
				ctaretcom=@ctaretcom,			ctaretvta=@ctaretvta,		ctaretiva=@ctaretiva,			ctarivacom=@ctarivacom,
				ctacxp=@ctacxp,					ctacxc=@ctacxc,				ctadesc=@ctadesc,				ctaing=@ctaing,
				ctacaja=@ctacaja,				ctacosto=@ctacosto,			ctainv=@ctainv,					ctaped=@ctaped,
				iva=@iva,						ctapropd=@ctapropd,			ctapropc=@ctapropc,				ctaajpdb=@ctaajpdb,
				ctaajpcr=@ctaajpcr,				ctaabono=@ctaabono,			ctaingreso=@ctaingreso,			ctapropina=@ctapropina,
				porcentaje=@porcentaje,			descuento=@descuento,		ctacuota=@ctacuota,				ctaobra=@ctaobra,
				ctaretserv=@ctaretserv,			nivelmay=@nivelmay,			ctaimpcom=@ctaimpcom,			cuecen=@cuecen,
				cuenit=@cuenit,					ctaadmon=@ctaadmon,			ctaimprevisto=@ctaimprevisto,	ctautilidad=@ctautilidad,
				formatoegre=@formatoegre,		noagrudepre=@noagrudepre,	ivainclu=@ivainclu,				ctacomitar=@ctacomitar,
				ctaint=@ctaint,					ctatransp=@ctatransp,		coddepre=@coddepre,				ctadevol=@ctadevol,
				codtraneg=@codtraneg,			ctaanticip=@ctaanticip,		ctagastos=@ctagastos,			ctaivasimp=@ctaivasimp,
				ctareftesi=@ctareftesi,			ctaxpotr=@ctaxpotr,			nit2=@nit2,						ctaivacomdev=@ctaivacomdev,
				ctaivavtadev=@ctaivavtadev,		ctaivagas=@ctaivagas,		ctaimpo=@ctaimpo,
				ctareftesimpli=@ctareftesimpli,	ctacomitarj=@ctacomitarj,	ctaanticipo=@ctaanticipo,		ctaivasimpli=@ctaivasimpli,
				CtaCreeVta=@CtaCreeVta,			CtaCreeVtaCr=@CtaCreeVtaCr,	añoniif=@añoniif,				prefniif=@prefniif,
				autoretcre=@autoretcre,CtaRetgta = @CtaRetgta, ctamerca=@ctaMerca, cpdecima=@cpdecima
		Where	idemp = @pIdemp
	Else
		Insert Into Con_Parametros ( añomayoriza, codcto, ctauti, ctaper,
									 ctaivacom, ctaivavta, ctaicacom, ctaicavta,
									 ctaretcom, ctaretvta, ctaretiva,ctarivacom,
									 ctacxp, ctacxc, ctadesc, ctaing,
									 ctacaja, ctacosto,ctainv, ctaped,
									 iva, ctapropd, ctapropc, ctaajpdb,
									 ctaajpcr, ctaabono, ctaingreso, ctapropina,
									 porcentaje, descuento, ctacuota, ctaobra,
									 ctaretserv, nivelmay, ctaimpcom, cuecen,
									 cuenit, ctaadmon, ctaimprevisto, ctautilidad,
									 formatoegre, noagrudepre, ivainclu, ctacomitar,
									 ctaint, ctatransp, coddepre, ctadevol,
									 codtraneg, ctaanticip, ctagastos, ctaivasimp,
									 ctareftesi, ctaxpotr, nit2, ctaivacomdev,
									 ctaivavtadev, ctaivagas, ctaimpo, idemp,
									 ctareftesimpli, ctacomitarj, ctaanticipo, ctaivasimpli,
									 CtaCreeVta, CtaCreeVtaCr, añoniif,	prefniif,
									 autoretcre,ctaretgta,ctamerca,cpdecima)
							Values ( @añomayoriza, @codcto, @ctauti, @ctaper,
									 @ctaivacom, @ctaivavta, @ctaicacom, @ctaicavta,
									 @ctaretcom, @ctaretvta, @ctaretiva, @ctarivacom,
									 @ctacxp, @ctacxc, @ctadesc, @ctaing,
									 @ctacaja, @ctacosto,@ctainv, @ctaped,
									 @iva, @ctapropd, @ctapropc, @ctaajpdb,
									 @ctaajpcr, @ctaabono, @ctaingreso, @ctapropina,
									 @porcentaje, @descuento, @ctacuota, @ctaobra,
									 @ctaretserv, @nivelmay, @ctaimpcom, @cuecen,
									 @cuenit, @ctaadmon, @ctaimprevisto, @ctautilidad, 
									 @formatoegre, @noagrudepre, @ivainclu, @ctacomitar,
									 @ctaint, @ctatransp, @coddepre, @ctadevol,
									 @codtraneg, @ctaanticip, @ctagastos, @ctaivasimp,
									 @ctareftesi, @ctaxpotr,@nit2, @ctaivacomdev,
									 @ctaivavtadev, @ctaivagas, @ctaimpo, @pIdemp,
									 @ctareftesimpli, @ctacomitarj, @ctaanticipo, @ctaivasimpli,
									 @CtaCreeVta, @CtaCreeVtaCr, @añoniif, @prefniif,
									 @autoretcre,@CtaRetgta,@ctamerca,@cpdecima)
END TRY

Begin Catch 
   Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO



IF OBJECT_ID('dbo.Con_Sp_CtaComprobante','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE dbo.Con_Sp_CtaComprobante
END
GO
CREATE PROCEDURE dbo.Con_Sp_CtaComprobante
	@pIdemp    nvarchar(3),	 @pCodcto   nvarchar(3), @pCodtran  nvarchar(2),
	@pConsec   nvarchar(30), @pOp       int = 0
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int =0,
           @mProc   char(20)
   select @existe ='N'
   select @mNerror=57021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='Con_Sp_CtaComprobante' 
   
   If @pOp = 0 
 	  Select  C.*,p.porret,p.natcue,p.retcue,
		      dbo.FE_LetraCapital(P.NomCue) as NomCue,
		      dbo.FE_LetraCapital(T.NomTer) as NomTer
      From 	  Con_Comprobante C
		      INNER JOIN  Con_Puc P      ON C.CodCue=P.CodCue
 		      INNER JOIN  Glb_Terceros T ON C.NitTer= T.NitTer
      Where   C.Consec  = @pConsec	And C.CodTran = @pCodtran	And 
	          C.codcto = @pCodcto And C.idemp = @pIdemp and c.docdelete=0
   
   If @pOp = 1 
 	  Select  C.*
      From 	  Con_Comprobante C
      Where   C.Consec  = @pConsec	And C.CodTran = @pCodtran	And 
	          C.codcto = @pCodcto And C.idemp = @pIdemp and c.docdelete=0
END TRY 

Begin catch
  set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch 
GO

IF OBJECT_ID('Con_Sp_InsComprobante','P') IS NOT NULL DROP PROCEDURE Con_Sp_InsComprobante
GO

CREATE PROCEDURE Con_Sp_InsComprobante
	@pIdemp			nvarchar (3)='',	@pTipTran	char(1)='',				@pDebito  decimal(18,4)=0,		@pCredito   decimal(18,4)=0,
	@pConsec		nvarchar(16)='',	@pCodCue	nvarchar(8)='',			@pDetalle nvarchar(90)='',		@pCodcto    nvarchar  (3)='',
	@pNitter		nvarchar(15)=0,		@pCodtran	nvarchar(2)='',			@pCodusu  nvarchar(10)='',		@pBase		decimal(18,4)=0,
	@pFecha			nvarchar(10)='',	@pCodctodet nvarchar(3)=@pCodcto,	@pTurno	  decimal(10,0)=0,		@pIvamayvlr decimal(18,4)=0,
	@pNumche		nvarchar(10)='',	@pCodact	nvarchar(10)='',		@pNitter2 nvarchar(12)='',		@Tabla		nvarchar  (1)='',
	@pTimeDife		numeric(3)=0,		@pPrefijo	nVarChar(2)='',			@pRevelac nVarChar(Max)='',		@pDocDelete	bit=0,
	@pModificadoc	numeric(5)=0,		@pEstniif	bit=0
AS
BEGIN TRY
	Declare	@mNerror	int=0,			@mMsg		nvarchar(190),
			@mLinea		int=0,			@mAddMsg	nvarchar(50),		@mDebito decimal(18,4),
			@mCredito	decimal(18,4),	@mCodcen	nvarchar(3),		@mCodalm nvarchar(3),
			@mEstcomp	nvarchar(1),	@mFecdoc	date,				@mProc   nvarchar(30),
			@pVerMsg	int=0,			@mItemDoc	numeric(6)

	Select @mCodalm=codalm, @mCodcen=codcen From Con_CenCostos Where idemp=@pIdemp AND codcto=@pCodcto

	Select @mFecdoc=Convert(Date,@pFecha), @mEstcomp='', @mNerror=57021, @mLinea=0, @mProc='Con_Sp_InsComprobante', @mAddMsg=' '

	Set @mItemDoc = ISNULL((Select dbo.FE_ItemComp (@pIdemp,@pCodcto,@pCodtran,@pConsec)),1)

	If @Tabla <> 'T'
		begin
			if @pDebito > 0 or @pCredito > 0
			begin
			Insert Into Con_Comprobante (idemp,codalm,codcen,codtran,consec,fecdoc,codcue,nitter,detalle,debito,credito,
										 codcto,codctodet,estcomp,base,Ivamayvlr,Nitter2,itemDoc,numche,codact,timedife,
										 prefijo,revelaciones,codusu,docdelete,modificadoc,estniif)
								 Values (@pIdemp,@mCodalm,@mcodcen,@pCodtran,@pConsec,@mFecdoc,@pCodCue,@pNitter,@pDetalle,@pDebito,@pCredito,
										 @pCodCto,@pCodctodet,@mEstcomp,@pBase,@pIvamayvlr,@pNitter2,@mItemDoc,@pNumche,@pCodact,@pTimeDife,
										 @pPrefijo,@pRevelac,@pCodusu,@pDocDelete,@pModificadoc,@pEstniif)
			end
		end
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Éduar Álvarez - Junio 16 de 2015.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_sp_Insert_ComproNIIF','P') IS NOT NULL DROP PROCEDURE db_sp_Insert_ComproNIIF
GO

CREATE PROCEDURE db_sp_Insert_ComproNIIF
	@pIdemp		nvarchar(03)='',	@pDebito	decimal(14,2)=0,	@pCredito decimal(14,2)=0,		@pConsec    nvarchar(16)='',
	@pCodCue	nvarchar(8)='',		@pDetalle	nvarchar(90)='',	@pCodcto  nvarchar(3)='',		@pNitter	nvarchar(12)=0,
	@pCodtran	nvarchar(2)='',		@pCodusu	nvarchar(10)='',	@pBase	  decimal(14,2)=0,		@pCodctodet nvarchar(3)=@pCodcto,
	@pIvamayvlr	decimal(14,2)=0,	@pNumche	nvarchar(10)='',	@pCodact  nvarchar(10)='',		@pNitter2	nvarchar(12)='',
	@pFecha		nvarchar(10)='',	@pTimeDife	numeric(3)=0,		@pRevelac nVarChar(Max)=''
AS
BEGIN TRY
   Declare	@mNerror  int,				@mMsg	 nvarchar(190),		@pVerMsg int=0,
			@mLinea	  int=0,			@mAddMsg nvarchar(50)=' ',	@mCodcen nvarchar(3),
			@mEstcomp nvarchar(1)='',	@mFecdoc date,				@mProc   nvarchar(30),
			@mItemDoc numeric(6)=0

	Select @mFecdoc=Convert(Date,@pFecha), @mNerror=57021, @mProc='db_sp_Insert_ComproNIIF'

	Select @mCodcen=codcen From Con_CenCostos Where idemp=@pIdemp And codcto=@pCodcto

	Set @mItemDoc = ISNULL((Select	Max(itemdoc) + 1 AS ItemDoc 
							From	Con_ComproNIIF 
							Where	idemp=@pIdemp AND codcto=@pCodCto AND codtran=@pCodtran AND consec=@pConsec and docdelete=0),1)

	Insert Into Con_ComproNIIF (idemp,codcen,codtran,consec,fecdoc,codcue,nitter,detalle,debito,credito,
								codcto,codctodet,estcomp,base,Ivamayvlr,Nitter2,itemDoc,numche,codact,
								timedife,revelaciones,codusu)
						Values (@pIdemp,@mCodcen,@pCodtran,@pConsec,@mFecdoc,@pCodCue,@pNitter,@pDetalle,@pDebito,@pCredito,
								@pCodCto,@pCodctodet,@mEstcomp,@pBase,@pIvamayvlr,@pNitter2,@mItemDoc,@pNumche,@pCodact,
								@pTimeDife,@pRevelac,@pCodusu)
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('CtaExisten','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE CtaExisten
END
GO
CREATE PROCEDURE CtaExisten
 @pIdEmp nvarchar(3), 
	   @Tabla varchar(90)=null,
	   @campo varchar(90),
	   @dato  varchar(90) 
	
AS
BEGIN
	declare @cadena nvarchar(250)
	
  set @cadena = 'select * from  '+ @Tabla +' where idemp='+@pIdEmp+' and ' +
                @campo + ' = ' + @dato
  exec (@cadena)
  --print @cadena
   
  
END
GO

IF OBJECT_ID('Glb_Sp_ActKardex','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Glb_Sp_ActKardex
END
GO
CREATE PROCEDURE Glb_Sp_ActKardex
   @pIdemp      nvarchar(3),     @pCodcto     nvarchar(3),     @pNumcon    nvarchar(8)='',  
   @pFecmov     nvarchar(10)='', @pCodcon     nvarchar(2)='',  @pCodart    nvarchar(10),  
   @pQtyart     decimal(14,4)=0, @pCosart     decimal(14,2)=0, @pValart    decimal(14,2)=0,  
   @pIvaart     decimal(14,2)=0, @pTotart     decimal(14,2)=0, @pNetart    decimal(14,2)=0,  
   @pTraalm     nvarchar(3)='',  @pCentra     nvarchar(3)='',  @pContra    nvarchar(8)='',  
   @pConsec     nvarchar(16)='', @pNitter     nvarchar(12)='', @pObserva   nvarchar(80)='',  
   @pEstkar     nvarchar(1)='',  @pCodusu     nvarchar(8)='',  @pQtypro    decimal(14,2)=0,
   @pQtyfac     decimal(14,2)=0, @pUndart     nvarchar(3)='0',  @pEstord    bit=0,           
   @pDespacho   nvarchar(8)='',  @pCendespach nvarchar(3)='',  @pEstserial nvarchar(1)='',  
   @pCodartrel  nvarchar(10)='', @pDocfac     nvarchar(10)='', @pFecvence  nvarchar(10)='', 
   @pItemprefac decimal(3,0)=0,  @pCodprod    nvarchar(10)='', @pValimpo   decimal(14,2)=0, 
   @pItemfac    decimal(3,0)=0,  @pOp         int = 0,			@pporimpo	decimal(14,2)=0,
	@pdevpro	decimal(14,2)=0, @pestexist		nVarchar(1)='',	@pregiserv	nvarchar(1)='',	
	@pDocRel	nvarchar(13)='', @pcodctogru	nvarchar(2)='', @pModificadoc numeric(5)=0   
AS
BEGIN TRY
    Declare @mExiste char(1),      @mNerror   int, @mMsg    nvarchar(190),@mLinea int,
           @mAddMsg nvarchar(230), @mFecvence date,	  @mFecmov date,         @mProc  char(20),
		   @pVerMsgBox int=0 
         
   Select @mExiste ='N', @mNerror=57021,@mLinea=0, @mProc  ='Glb_Sp_ActKardex',@mAddMsg=' ',
          @mFecvence =convert(date,@pFecvence),@mFecmov=convert(date,@pFecmov)

   if @pItemfac=0
		Set @pItemfac = ISNULL((Select dbo.FE_Itemkar (@pIdemp,@pCodcto,@pCodcon,@pnumcon)),1)

   If @pOp=0
   Begin
      select @mNerror=57003, @mAddMsg=';Dentro de los parametros enviados;no se ha indicado la operacion a realizar.',@pVerMsgBox=1;
	  throw  @mNerror,@mAddMsg,1;
      --raiserror ('No se ha indicado la operacion a realizar',16,-1)
   End 
   --===============================
   -- Nuevo registro [1]
   --===============================
   If @pOp=1 
      Insert Into Alm_Kardex(idemp,codcto, numcon, fecmov, codcon, codart, qtyart, cosart, 
	                         valart, ivaart, totart, netart, traalm, centra, contra,
							 consec, nitter, observa, estkar, codusu,qtypro, qtyfac, undart,
							 estord, despacho, cendespach, estserial, codartrel, docfac, 
							 fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, estexist, 
							regiserv, DocRel, codctogru,modificadoc)
					  Values(@pIdemp,@pCodcto,@pNumcon,@mFecmov,@pCodcon,@pCodart,@pQtyart,@pCosart,
					         @pValart,@pIvaart,@pTotart,@pNetart,@pTraalm,@pCentra,@pContra,
							 @pConsec,@pNitter,@pObserva,@pEstkar,@pCodusu,@pQtypro,@pQtyfac,@pUndart,
							 @pEstord,@pDespacho,@pCendespach,@pEstserial,@pCodartrel,@pDocfac,
							 @mFecvence,@pItemprefac,@pCodprod,@pValimpo,@pItemfac,@pporimpo, @pdevpro, @pestexist, 
							@pregiserv, @pDocRel, @pcodctogru,@pModificadoc)


  --===============================
   -- Act de estado 
   --===============================
	if @pOP=2
		UPDATE	alm_kardex 
		SET		EstKAr = @pEstkar
		WHERE	idemp=@pIdemp and codcto=@pCodcto and codcon=@pCodcon and numcon=@pNumcon 	
		
		
   /*
   If @@ERROR=0 
   Begin 		
      set @mMsg=(select m.Mensaje+@mAddMsg  from glb_mensaje m where m.id=@mNerror)
      exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
   End */
     
End TRY

Begin Catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch  
GO

IF OBJECT_ID('Inv_Sp_ActSaldoInventario','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Inv_Sp_ActSaldoInventario
END
GO
CREATE PROCEDURE Inv_Sp_ActSaldoInventario
-- Add the parameters for the stored procedure here
	@pIdemp    nvarchar(3), @pCodcto nvarchar(3), @pCodart nvarchar(10),
	@pCantidad float = 0,   @pProc   int = 0,	  @pOpc   int = 0  

AS
BEGIN TRY
  declare @mexiste char(1),
           @mNerror int,
           @mMsg    nvarchar(230),
           @mLinea  int,
           @mAddMsg nvarchar(200),
		   @pVerMsgBox int =0,
		   @mCantidad numeric(15,2)=0,
           @mProc   char(30)
   
   select @mNerror=57021,@mLinea=0,@mAddMsg='',@mExiste ='N', @mProc  ='Inv_Sp_ActSaldoInventario'
   
   --0= suma(+)
   --1= resta(-)
   
   If exists(Select codart From Alm_Articulos where ltrim(rtrim(codart))=ltrim(rtrim(@pCodart)))   
   Begin 
      
	  If  Exists(select caninv From alm_inventario where idemp=@pIdemp And Codcto=@pCodcto And Codart=@pCodart)
	  Begin  
         select @mCantidad=cantidad From vActInventario where idemp=@pIdemp And Codcto=@pCodcto And Codart=@pCodart
	     If @mCantidad < @pCantidad And (@pOpc=1 AND @pProc=1)
		 Begin
		    select @mNerror=57023,@mAddMsg=';En el Inventario o su cantidad es inferior a la de las salidas.;Codigo del Articulo [ '+@pCodart+' ];Se sugiere realizar auditoria en el inventario. ',
	        @pVerMsgBox =1;      
            Throw @mNerror,@mAddMsg,1  
		 End 
		 Else 
		 Begin 
		    Update alm_inventario Set caninv = (case when  @pProc = 0 then @mCantidad + @pCantidad
                                                     when  @pProc = 1 Then @mCantidad - @pCantidad 
                                                end)
            where idemp=@pIdemp And Codcto=@pCodcto And Codart=@pCodart
		 End 
      End
	  Else 
	  Begin 
	     select @mNerror=57023,@mAddMsg=';En el Inventario.;Codigo del Articulo [ '+@pCodart+' ];Se sugiere realizar auditoria en el inventario. ',
	        @pVerMsgBox =1;      
         Throw @mNerror,@mAddMsg,1      
	  End 
   End 
   Else
   Begin  
     select @mNerror=57023,@mAddMsg=';En el maestro de Articulos;Codigo del Articulo [ '+@pCodart+' ];Se sugiere realizar auditoria en el inventario. ',
	        @pVerMsgBox =1;      
     Throw @mNerror,@mAddMsg,1
   End 
End TRY

Begin Catch
     set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
     Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch  

GO

IF OBJECT_ID('Nom_Sp_ActBancos','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Nom_Sp_ActBancos
END
GO
CREATE PROCEDURE Nom_Sp_ActBancos
@pcodigo nvarchar(2), @pnombanco nvarchar(30)=''
AS
BEGIN
  
  if not exists(select codigo from nom_bancos WHERE CODIGO=@pcodigo)
    insert into nom_bancos(codigo,nombanco)values(@pcodigo,@pnombanco) 
  else 
     update nom_bancos set nombanco=@pnombanco  where codigo=@pcodigo 
	 
	 	  	
END
GO

IF OBJECT_ID('SP_ActMescierre','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_ActMescierre
END
GO
CREATE PROCEDURE SP_ActMescierre
 @pCerrar bit,
   @pIdemp   nchar(3),
   @pMes    char(2)=null,
   @pAño    numeric(4,0),
   @proc    int = 0
    
	
AS
BEGIN Try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
           @mProc   char(20)
   select @existe ='N',@mNerror=7021,@mLinea=0,@mAddMsg='',@mProc  ='SP_ActMescierre' 
   
   
   if exists (select * from con_mescierre where idemp=@pIdemp and mes=@pMes and año=@pAño)
      select @existe='S'
  
   
   
   if @proc=1
      if @existe='N'
         insert into con_mescierre(mes,año)values(@pMes,@pAño)
      Else 
	     Set @mNerror = 7014  
    
    
   if @proc=2 
      if @existe='S'
         update con_mescierre set cerrar =@pcerrar  where idemp=@pIdemp and mes=@pMes and año=@pAño
      Else 
	     Set @mNerror = 7023
   
   if @proc=3 
      If @existe='S'
         delete from con_mescierre where idemp=@pIdemp and cerrar = 0 --idemp=@pIdemp and mes=@pMes and año=@pAño
      Else 
	     Set @mNerror = 7023 
   
   if @@ERROR=0 
   Begin 		
     set @mMsg=(select m.nombre+@mAddMsg  from glb_error m where m.id=@mNerror)
     exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
   End   
  
END Try
Begin Catch 
   Exec sp_MensajeSql 
End Catch 

GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado Mayo 26 de 2015 - Éduar Álvarez.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_ActPUC','P') IS NOT NULL	DROP PROCEDURE SPG_ActPUC
GO

CREATE PROCEDURE SPG_ActPUC
	 @pCodcue     nVarchar(8)='',	@pNomcue     nVarchar(40)='',	@pAuxcue     Bit=0,				@pNumche	 Decimal(10,0)=0
	,@pRetcue     Bit=0,			@pAjucue     Bit=0,				@pPorret     Decimal(5,2)=0,	@pMonto		 Decimal(14,2)=0
	,@pCtajustd   nVarchar(8)='',	@pCtajustc   nVarchar(8)='',	@pDepcue     Bit=0,				@pAñodep	 Decimal(02,0)=0
	,@pSancue     Decimal(15,2)=0,	@pNatcue     nVarchar(1)='',	@pNivcue     Decimal(1,0)=0,	@pCentro	 Bit=0
	,@pTercero    Bit=0,			@pInf        Bit=0,				@pFormato    nVarchar(60)='',	@pCodadd	 nVarchar(2)=''
	,@pPoriva     Decimal(06,2)=0,	@pIvacue     Bit=0,				@pMacentro   Bit=0,				@pManit		 Bit=0
	,@pManitbco   Bit=0,			@pNitbco     nVarchar(15)='',	@pCtaegrcaj  Bit=0,				@pTiprete	 Decimal(1)=0
	,@pDiferido   Bit=0,			@pCtaGasDife nVarchar(08)='',	@pCodGruNiif nVarChar(2)='',	@pCodCueNiif nVarChar(8)=''
	,@pNomCueNiif nVarchar(40)='',	@pManActivo	 Bit=0,				@pCtaOri	 Bit=0
	,@proc        Int,				@pcerrarcta	 Bit=0,				@pctacierre  nVarchar(8)='',	@pnitcierre  nVarchar(15)='' 		
AS
BEGIN TRY
	Declare @existe	 Char(1),
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mNerror Char(3),
			@mMsg    nVarChar(190),
			@mLinea  Int,
			@mProc   Char(20)

	Select @existe ='N', @mNerror='021',@mLinea=0, @mMsg='', @mProc = 'SP_ActPuc'

	If Exists (Select codcue From Con_Puc Where Codcue=@pCodcue)
		Select @existe='S'

	If @proc=1
	begin
		if @existe='N'
		begin
			insert into con_puc (Codcue,		Nomcue,			Auxcue,			Numche
								,Retcue,		Ajucue,			Porret,			Monto
								,Ctajustd,		Ctajustc,		Depcue,			Añodep
								,Sancue,		Natcue,			Nivcue,			Centro
								,Tercero,		Inf,			Formato,		Codadd
								,Poriva,		Ivacue,			Macentro,		Manit
								,Manitbco,		Nitbco,			Ctaegrcaj,		Tiprete
								,Diferido,		CtaGasDife,		CodGruNiif,		CodCueNiif
								,NomCueNiif,	ManActivo,		CtaOri,			cerrarcta	 				
								,ctacierre,		nitcierre)
						values ( @pCodcue,		@pNomcue,		@pAuxcue,		@pNumche
								,@pRetcue,		@pAjucue,		@pPorret,		@pMonto
								,@pCtajustd,	@pCtajustc,		@pDepcue,		@pAñodep
								,@pSancue,		@pNatcue,		@pNivcue,		@pCentro
								,@pTercero,		@pInf,			@pFormato,		@pCodadd
								,@pPoriva,		@pIvacue,		@pMacentro,		@pManit
								,@pManitbco,	@pNitbco,		@pCtaegrcaj,	@pTiprete
								,@pDiferido,	@pCtaGasDife,	@pCodGruNiif,	@pCodCueNiif
								,@pNomCueNiif,	@pManActivo,	@pCtaOri,		@pcerrarcta	
								,@pctacierre,	@pnitcierre  		)
		end
	end

	if @proc=2 
	begin
		if @existe='S'
		begin
			Update Con_Puc
			   Set Nomcue=@pNomcue,			 Auxcue=@pAuxcue,		  Numche=@pNumche
				   ,Retcue=@pRetcue,		 Ajucue=@pAjucue,		  Porret=@pPorret,		   Monto=@pMonto
				   ,Ctajustd=@pCtajustd,	 Ctajustc=@pCtajustc,	  Depcue=@pDepcue,		   Añodep=@pAñodep
				   ,Sancue=@pSancue,		 Natcue=@pNatcue,		  Nivcue=@pNivcue,		   Centro=@pCentro
				   ,Tercero=@pTercero,		 Inf=@pInf,				  Formato=@pFormato,	   Codadd=@pCodadd
				   ,Poriva=@pPoriva,		 Ivacue=@pIvacue,		  Macentro=@pMacentro,	   Manit=@pManit
				   ,Manitbco=@pManitbco,	 Nitbco=@pNitbco,		  Ctaegrcaj=@pCtaegrcaj,   Tiprete=@pTiprete
				   ,Diferido=@pDiferido,	 CtaGasDife=@pCtaGasDife, CodGruNiif=@pCodGruNiif, CodCueNiif=@pCodCueNiif
				   ,NomCueNiif=@pNomCueNiif, ManActivo=@pManActivo,	  CtaOri=@pCtaOri,			cerrarcta=@pcerrarcta	 				
					,ctacierre=@pctacierre,	nitcierre=@pnitcierre
			Where  Codcue=@pCodcue
		end
	end

	if @proc=3
		begin
			if @existe='S'
				begin
					if Not Exists (Select codcue From con_comprobante Where codcue=@pCodcue)
						begin
							Delete From con_puc Where Codcue=@pCodcue
							set @mNerror = '002'
						end
					else
						begin
							set @mNerror = '002'
							set @mMsg    = ' Contabilidad'
							set @mLinea  = 105
						end
				end
		end
END TRY 

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg, @mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado Junio 17 de 2015 - Éduar Álvarez.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_Act_PUCNIIF','P') IS NOT NULL	DROP PROCEDURE db_SP_Act_PUCNIIF
GO

CREATE PROCEDURE db_SP_Act_PUCNIIF
	@pCodcue     nVarchar(8)='',	@pNomcue     nVarchar(40)='',		@pAuxcue     Bit=0,					@pNumche	 Decimal(10,0)=0,
	@pRetcue     Bit=0,				@pAjucue     Bit=0,					@pPorret     Decimal(5,2)=0,		@pMonto		 Decimal(14,2)=0,
	@pCtajustd   nVarchar(8)='',	@pCtajustc   nVarchar(8)='',		@pDepcue     Bit=0,					@pAñodep	 Decimal(02,0)=0,
	@pSancue     Decimal(15,2)=0,	@pNatcue     nVarchar(1)='',		@pNivcue     Decimal(1,0)=0,		@pCentro	 Bit=0,
	@pTercero    Bit=0,				@pInf        Bit=0,					@pFormato    nVarchar(60)='',		@pCodadd	 nVarchar(2)='',
	@pPoriva     Decimal(06,2)=0,	@pIvacue     Bit=0,					@pMacentro   Bit=0,					@pManit		 Bit=0,
	@pManitbco   Bit=0,				@pNitbco     nVarchar(15)='',		@pCtaegrcaj  Bit=0,					@pTiprete	 Decimal(1)=0,
	@pDiferido   Bit=0,				@pCtaGasDife nVarchar(08)='',		@pManActivo	 Bit=0,					@pCtaOri	 Bit=0,
	@Proc        Int,				@pCtaConcilia bit	= 0
AS
BEGIN TRY
	Declare @mExiste Char(1),
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mNerror Char(3),
			@mMsg    nVarChar(190),
			@mLinea  Int,
			@mProc   Char(20)

	Select @mExiste ='N', @mNerror='021', @mLinea=0, @mMsg='', @mProc = 'db_SP_Act_PUCNIIF'

	If Exists (Select codcue From Con_PucNIIF Where CodCue=@pCodcue)
		Select @mExiste='S'

	If @Proc = 1 AND @mExiste = 'N'
		Insert Into Con_PucNIIF (CodCue,		NomCue,			Auxcue,			Numche
								,Retcue,		Ajucue,			Porret,			Monto
								,Ctajustd,		Ctajustc,		Depcue,			Añodep
								,Sancue,		Natcue,			Nivcue,			Centro
								,Tercero,		Inf,			Formato,		Codadd
								,Poriva,		Ivacue,			Macentro,		Manit
								,Manitbco,		Nitbco,			Ctaegrcaj,		Tiprete
								,Diferido,		CtaGasDife,		ManActivo,		CtaOri
								,CtaConcilia)
						Values (@pCodcue,		@pNomcue,		@pAuxcue,		@pNumche
								,@pRetcue,		@pAjucue,		@pPorret,		@pMonto
								,@pCtajustd,	@pCtajustc,		@pDepcue,		@pAñodep
								,@pSancue,		@pNatcue,		@pNivcue,		@pCentro
								,@pTercero,		@pInf,			@pFormato,		@pCodadd
								,@pPoriva,		@pIvacue,		@pMacentro,		@pManit
								,@pManitbco,	@pNitbco,		@pCtaegrcaj,	@pTiprete
								,@pDiferido,	@pCtaGasDife,	@pManActivo,	@pCtaOri
								,@pctaConcilia)

	If @Proc=2 AND @mExiste='S'
		Update Con_PucNIIF
			Set NomCue=@pNomcue,		Auxcue=@pAuxcue,			Numche=@pNumche
				,Retcue=@pRetcue,		Ajucue=@pAjucue,			Porret=@pPorret,			Monto=@pMonto
				,Ctajustd=@pCtajustd,	Ctajustc=@pCtajustc,		Depcue=@pDepcue,			Añodep=@pAñodep
				,Sancue=@pSancue,		Natcue=@pNatcue,			Nivcue=@pNivcue,			Centro=@pCentro
				,Tercero=@pTercero,		Inf=@pInf,					Formato=@pFormato,			Codadd=@pCodadd
				,Poriva=@pPoriva,		Ivacue=@pIvacue,			Macentro=@pMacentro,		Manit=@pManit
				,Manitbco=@pManitbco,	Nitbco=@pNitbco,			Ctaegrcaj=@pCtaegrcaj,		Tiprete=@pTiprete
				,Diferido=@pDiferido,	CtaGasDife=@pCtaGasDife,	ManActivo=@pManActivo,		CtaOri=@pCtaOri
				,ctaconcilia=@pCtaconcilia
		Where  CodCue=@pCodcue

	If @Proc = 3 AND @mExiste = 'S'
		begin
			If Not Exists (Select CodCue From Con_ComproNIIF Where codcue=@pCodcue)
				begin
					Delete From Con_PucNIIF Where CodCue=@pCodcue
					Set @mNerror = '002'
				end
			Else
				begin
					Set @mNerror = '002'
					Set @mMsg    = ' Contabilidad'
					Set @mLinea  = 105
				end
		end
END TRY 

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg, @mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SP_ActUnicaMensual','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_ActUnicaMensual
END
GO
CREATE PROCEDURE SP_ActUnicaMensual
	@pIdEmp   nvarchar(3),			@pCodcto  nvarchar(3),			@pCodtran  nvarchar(2),
	@pContran decimal(8,0)=1,		@pPrefijo nvarchar(5)='',		@pFacemp   nvarchar(60)='',
	@pTiremp  nvarchar(60)='',		@pResemp  nvarchar(255)='',		@pAñotran  decimal (4,0)=1,
	@pMes01   decimal (8,0)=1,		@pMes02   decimal (8,0)=1,		@pMes03    decimal (8,0)=1, 
	@pMes04   decimal (8,0)=1,		@pMes05   decimal (8,0)=1,		@pMes06    decimal (8,0)=1, 
	@pMes07   decimal (8,0)=1,		@pMes08   decimal (8,0)=1,		@pMes09    decimal (8,0)=1, 
	@pMes10   decimal (8,0)=1,		@pMes11   decimal (8,0)=1,		@pMes12    decimal (8,0)=1,
	@ptiptran decimal (1,0)=1   
AS
BEGIN TRY
	Declare	@mAddMsg nvarchar(50), @pVerMsg int=0, @mProc char(20)
	SET @mProc = 'SP_ActUnicaMensual'

	Print @ptiptran
	if @ptiptran=1
		begin
			if Not Exists(Select codtran
							From Glb_Unica
						   Where idemp=@pIdEmp AND codcto=@pCodcto AND codtran=@pCodtran)
				begin
				Insert Into Glb_Unica (  idemp,  codcto,  codtran,  contran,  prefijo,  facemp,  tiremp,  resemp)
							   Values (@pIdemp,@pCodcto,@pCodtran,@pContran,@pPrefijo,@pFacemp,@pTiremp,@pResemp)
				end
			else
				begin
					Update Glb_Unica
					   Set contran=@pContran, prefijo=@pPrefijo, resemp=@pResemp
					 Where idemp=@pIdEmp AND codcto=@pcodcto AND codtran=@pCodtran
				end
		end

	If @ptiptran=2
		begin
			If Not Exists(Select idemp, codcto, codtran, añotran
						  From   glb_mensual 
						  Where  idemp=@pIdemp AND codcto=@pCodcto AND codtran=@pCodtran AND añotran=@pAñotran)
				begin
					Insert Into glb_mensual (  idemp,  codcto,  codtran,  añotran,  mes01,  mes02,  mes03,  mes04,  mes05,  mes06,  mes07,  mes08,  mes09,  mes10,  mes11,  mes12)
									 Values (@pIdemp,@pCodcto,@pCodtran,@pAñotran,@pMes01,@pMes02,@pMes03,@pMes04,@pMes05,@pMes06,@pMes07,@pMes08,@pMes09,@pMes10,@pMes11,@pMes12)
				end
			Else
				begin
					Update Glb_mensual
					Set mes01=@pMes01, mes02=@pMes02, mes03=@pMes03, mes04=@pMes04, mes05=@pMes05, mes06=@pMes06,
						mes07=@pMes07, mes08=@pMes08, mes09=@pMes09, mes10=@pMes10, mes11=@pMes11, mes12=@pMes12
					Where  idemp=@pIdEmp and codcto=@pCodcto and codtran=@pCodtran and  añotran=@pAñotran
				end
		end
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg, @mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO



IF OBJECT_ID('SP_ActUsuarios','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_ActUsuarios
END
GO
CREATE PROCEDURE SP_ActUsuarios
	@codusu     nvarchar(8),		@nomusu nvarchar(50), 
	@codper     nvarchar(3),		@codter nvarchar(12)='',	
	@Clausu		nVarchar(15),		@centro nvarchar(3)='', 
	@valcos     bit=0       ,		@entinv numeric(1,0)=0, 
	@salinv     numeric(1,0)=0,		@trasinv numeric(1,0)=0, 
	@centinv    numeric(1,0)=0,		@csalinv numeric(1,0)=0, 
	@ctrasinv   numeric(1,0)=0,		@ppublico bit=0 , 
	@pmayorista bit=0,				@pespecial bit=0 , 
	@pespecial1 bit=0,				@pespecial2 bit=0 ,
	@infcentro  bit=0,				@formato nvarchar(60)='', 
	@formato2   nvarchar(60)='',	@proc      int,
	@CamFecEgr	bit=0,				@DesActPuc bit=0, 
	@DesActConse bit=0,				@DesDcto	bit=0,
	@Destranegr	bit=0,				@inactivo	bit=0,
	@nofactcred bit=0,				@actcupo	bit=0
AS
BEGIN
	Declare @r int, 
			@existe char(1),
			@mCodigo nvarchar(45),
			@Clausunet nchar(100)

	Select @r = 0 , @existe ='N'

	if exists (select * from glb_usuarios where codusu=@codusu)
		select @existe='S'

	if @proc=1 begin 
		if @existe='N'
		begin
			Insert Into Glb_Usuarios (CodUsu,NomUsu,CodPer,centro,codter,valcos,ppublico,pmayorista,pespecial,pespecial1,pespecial2,
									  infcentro,CamFecEgr,DesActPuc,DesActConse,DesDcto,Destranegr,inactivo,nofactcred, actcupo)
							  Values (@CodUsu,@NomUsu,@CodPer,@centro,@codter,@valcos,@ppublico,@pmayorista,@pespecial,@pespecial1,@pespecial2,
									  @infcentro,@CamFecEgr,@DesActPuc,@DesActConse,@DesDcto,@Destranegr,@inactivo,@nofactcred,@actcupo)
			select @r = 1
		end 
    end

	if @proc=2
	begin
		if @existe='S'
		begin
			Update	Glb_Usuarios
			Set		NomUsu=@NomUsu,	CodPer=@CodPer, centro=@centro,	codter=@codter, valcos=@valcos, pPublico=@pPublico,	pMayorista=@pMayorista,	
					pespecial=@pespecial, pEspecial1=@pEspecial1,	pEspecial2=@pEspecial2,	infcentro=@infcentro, CamFecEgr=@CamFecEgr, DesActPuc=@DesActPuc,
					DesActConse=@DesActConse, DesDcto=@DesDcto, Destranegr=@Destranegr,	inactivo=@inactivo,	nofactcred=@nofactcred, ActCupo=@ActCupo
			Where	codusu=@codusu
			Select @r = 1
		end
	end

   if @proc=3
   begin
      if @existe='S'
      begin
         Delete From Glb_Usuarios Where codusu=@codusu
         Select @r = 1
      end
   end

   --Registro de Clave.
	if @proc=4
	begin
		Select @Clausunet=CONVERT(nchar(100),dbo.FE_GenerarClave(@Codusu,@Clausu))
		Update Glb_Usuarios Set clausunet = @Clausunet Where codusu=@codusu
		Select @r = 1
	end
	Return (@r)
END
GO

IF OBJECT_ID('SP_allZonas','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_allZonas
END
GO
CREATE PROCEDURE SP_allZonas
  @r int 
AS
begin 
  SELECT Z.codigo AS codzona,z.nombre as nomzona,
       B.codbarr, B.nombarr, B.horaini1 as horaini, B.horafin1 as horafin, 
       B.valor1, B.valor2
  FROM   dbo.glb_zonas Z 
       INNER JOIN  dbo.glb_barrio B ON Z.codigo = B.codzona                                      
  union all 
  SELECT Z.codigo AS codzona,z.nombre as nomzona,
       B.codbarr, B.nombarr, B.horaini2 as horaini, B.horafin2 as horafin, 
       B.valor1, B.valor2
  FROM   dbo.glb_zonas Z 
       INNER JOIN  dbo.glb_barrio B ON Z.codigo = B.codzona2 
       
  order by nomzona,nombarr 
 
end 
GO




IF OBJECT_ID('SP_CtaArbol','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_CtaArbol
END
GO
CREATE PROCEDURE SP_CtaArbol
 @pCodigo nvarchar(18)   
         
AS
BEGIN 
   declare @mLen    int,
           @mCad    nvarchar(180),
           @mCampos nchar(27)
   
   set @mLen =0
   
   Set @mLen = Len(ltrim(rtrim(@pCodigo)))
   
   select @mCad=
   case @mLen
      ---'Select id, nomemp from glb_empresa'
      
      When 3  Then 'Select idemp, codalm, nomalm 
                    from glb_almacen 
                    Where idemp='''+LEFT(@pCodigo,3)+''''
      When 6  Then 'Select idemp, codalm, codcen, nomcen 
                    from glb_cenconsumo 
                    Where idemp='''+LEFT(@pCodigo,3)+''' and 
                          codalm='''+substring(@pCodigo,4,3)+''''
      When 9  Then 'Select idemp, codalm, codcen, codcto, nomcto '+
                   'from   con_cencostos  '/*+
                   'Where  idemp='''+LEFT(@pCodigo,3)+''' and 
                           codcen='''+substring(@pCodigo,7,3)+''''
                           --codalm='''+substring(@pCodigo,4,3)+''' and */
      When 12  Then 'Select idemp, codalm, codcen, codcto, nomcto '+
                    'from   con_cencostos  '--+
                    /*'Where  idemp='''+LEFT(@pCodigo,3)+''' and 
                           codcen='''+substring(@pCodigo,7,3)+''''
                           --codalm='''+substring(@pCodigo,4,3)+''' and */                     
   Else
      'Select id, nomemp from glb_empresa'   
   End 
    
   Exec (@mCad)
   --print @mCad
End  
GO

IF OBJECT_ID('SP_CtaCCosto','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_CtaCCosto
END
GO
CREATE PROCEDURE SP_CtaCCosto
 @pCCosto nvarchar(12)   
         
AS
BEGIN 
   declare @mLen    int,
           @mSql    nvarchar(250),
           @mCad    nvarchar(70)
           
   Select @mCad= dbo.FE_FiltroCodcc(@pCCosto)
   
   Set @mSql = 'Select idemp, codalm, codcen, codcto, nomcto '+
               'from   con_cencostos Where   '+@mCad  
   Exec (@mSql)
   
End  
GO

IF OBJECT_ID('SP_DcoTransaccion','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_DcoTransaccion
END
GO

IF OBJECT_ID('SP_IniciarMayorizacion','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SP_IniciarMayorizacion
END
GO
CREATE PROCEDURE SP_IniciarMayorizacion
@pIdemp nvarchar(3)
AS
BEGIN try 
	declare @mCodcto nvarchar(3)
	delete from con_ctacencostos where idemp=@pIdemp 
	
	declare cCENTRO cursor for 
	select codcto from Con_CenCostos where idemp=@pIdemp 
	
	Open cCENTRO 
	Fetch cCENTRO Into @mCodcto
	while @@FETCH_STATUS =0
	Begin
	   insert into con_ctacencostos(idemp,codcto,codcue,natcue)
	   select @pIdemp as idemp, @mCodcto as codcto,codcue,natcue
	   from con_puc 
	   
	   Fetch cCENTRO Into @mCodcto
	End
	
	close cCENTRO
	DEALLOCATE cCENTRO 
	
	update con_puc set sancue=0,  d01cue=0,  c01cue=0,  d02cue=0,  c02cue=0, 
	        d03cue=0,  c03cue=0,  d04cue=0,  c04cue=0,  d05cue=0,  c05cue=0,  
	        d06cue=0,  c06cue=0,  d07cue=0,  c07cue=0,  d08cue=0,  c08cue=0,  
	        d09cue=0,  c09cue=0,  d10cue=0,  c10cue=0,  d11cue=0,  c11cue=0,  
	        d12cue=0,  c12cue=0
	         
   
 
  return 1
   
  
END try 

Begin Catch 
   --rollback 
   Exec sp_MensajeSql 
end Catch 

GO

IF OBJECT_ID('sp_MensajeSql','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE sp_MensajeSql
END
GO
CREATE PROCEDURE sp_MensajeSql
 @pSw       bit=0, 
     @pMsg      nVarchar(230)='',
	 @pProc     nVarchar(90)='',
	 @pLinea    int=0,
	 @pNroError int=0 --char(3)=''
As
Begin	
	declare @mMsg      nVarchar(230),
	        @mProc     nVarchar(90),
	        @mLinea    int,
	        @mNroError char(9)
  if @pSw=0 
  Begin	         
    set @mMsg      = ERROR_MESSAGE()
    set	@mProc     = ERROR_PROCEDURE()
    set	@mLinea    = ERROR_LINE()
    set	@mNroError = ERROR_NUMBER() --convert(char(9),ERROR_NUMBER())	
  End 
  Else
  Begin 
    set @mMsg      = @pMsg
    set	@mProc     = @pProc
    set	@mLinea    = @pLinea
    set	@mNroError = @pNroError	
  End 	
  
  select @mProc SP, @mNroError NError , @mLinea Linea , @mMsg	Msg

	
End
GO

IF OBJECT_ID('sp_prbsistemas','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE sp_prbsistemas
END
GO
CREATE PROCEDURE sp_prbsistemas
@pId nchar(3), @pNombre nchar(10)='', @pSexo bit=0,
	@pNhijos int=0
AS
BEGIN
	if exists(select * from prbsistemas where ID=@pId )
	Begin
	  update prbsistemas set  nombre=@pNombre, sexo=@pSexo,
	         nHijos=@pNhijos 
	  Where  ID=@pId       
	End 
	Else
	Begin
	  insert into prbsistemas(id, nombre, sexo, nhijos)
	         values(@pid, @pnombre, @psexo, @pnhijos)
	End 
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SP_ValAcceso','P') IS NOT NULL	DROP PROCEDURE SP_ValAcceso
GO
CREATE PROCEDURE SP_ValAcceso
	@pIdusu nvarchar(30),
	@pCampo nvarchar(30),
	@pForma nvarchar(30) output
AS
BEGIN
	declare @mCampo  nvarchar(30),
	        @mCadena nvarchar(200),
	        @mDato   nvarchar(250)

	Set @mCadena = 'SELECT '+@pCampo+' AS per FROM Glb_Accesos WHERE codper='''+@pIdusu +'''  AND nomfor='''+@pForma+''''

    if Exists (SELECT * FROM Glb_Accesos WHERE codper=@pIdusu and nomfor=@pForma)
		EXEC (@mCadena)
    else
		SELECT * FROM Glb_Accesos WHERE codper=@pIdusu and nomfor=@pForma
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_ActAccesos','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActAccesos
END
GO
CREATE PROCEDURE SPG_ActAccesos
@accfor bit,			
  --@nuefor bit,		
  @modfor bit,		
  @elifor bit, 
  @impfor bit,			
  --@entinv bit,		@salinv bit,		@trasinv bit, 
  @codper nvarchar(3),  @idemp  nvarchar(3),@proc As Integer,	@nomfor as nvarchar(60)
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
             
   --if @proc=1
        --insert into glb_accesos (codigo,nombre)values(@codigo,@nombre)
     
    
   If @proc=2 
            update glb_accesos  set 
				accfor = @accfor, 
				 --nuefor = @nuefor, 
				modfor = @modfor, elifor = @elifor, impfor = @impfor 
				--entinv = @entinv, salinv = @salinv,  trasinv = @trasinv 
			WHERE nomfor =@nomfor AND  idemp = @idemp AND codper = @codper
     
   
   
   --If @proc=3 
           -- delete from glb_niveles where codigo=@codigo
 
END Try 

Begin catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 


GO

IF OBJECT_ID('SPG_ActAlimfisicos','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActAlimfisicos
END
GO
CREATE PROCEDURE SPG_ActAlimfisicos
  @pIdemp  nvarchar(3), @pAnoinv decimal(4,0), @pMesinv decimal(2,0),  
   @pCodcto nvarchar(3), @pCodart nvarchar(10), @pQty    decimal(12,2),  
   @pFecinv datetime,    @pProc   int 

	
AS
BEGIN TRY
   Declare @mExiste char(1) 
   Declare @mNerror char(5),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
           @mProc   char(20)
       
      
   Select @mExiste ='N', @mNerror='021',@mLinea=0, @mProc  ='SPG_ActAlimfisicos'
   
   If Exists(SELECT codart FROM alm_alimfisico	WHERE idemp=@pIdemp And codart =@pCodart)
        Set @mExiste ='S'
    
   
   
   If @pProc=1 
   Begin
      If @mExiste ='N' 
      Begin 
         Insert Into alm_alimfisico(idemp,anoinv,mesinv,codcto,codart,qty,fecinv)
                            Values (@pIdemp,@pAnoinv,@pMesinv,@pCodcto,@pCodart,@pQty,@pFecinv)  
      End
      Else 
         set @mNerror='014' 
      
   End 
   
   If @pProc=2 
   Begin
      If @mExiste ='S'
      Begin ---codart=@pCodart,
         Update alm_alimfisico 
         Set    anoinv=@pAnoinv,mesinv=@pMesinv,codcto=@pCodcto,
                qty=@pQty,fecinv=@pFecinv
         where  idemp=@pIdemp And codart =@pCodart     
      End 
      Else 
      Begin 
         set @mNerror='023'
      End    
   End
   
   
   
   If @pProc=3 
   Begin  
      If @mExiste='S'
      Begin
         delete from alm_alimfisico  where idemp=@pIdemp And codart =@pCodart
      End
      Else
      Begin 
        set @mNerror='023'         
      End    
   End
   
  If @@ERROR=0 
   Begin 		
     set @mMsg=(select m.Mensaje+@mAddMsg  from glb_mensaje m where m.id=@mNerror)
     exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
   End  
End TRY

Begin Catch
   Exec sp_MensajeSql 
End Catch  
GO


IF OBJECT_ID('SPG_ActAlmacen','P') IS NOT NULL	DROP PROCEDURE SPG_ActAlmacen
GO

CREATE PROCEDURE SPG_ActAlmacen
	@pIdemp           nvarchar(03)='',  @pCodalm          nvarchar(03)='',  @pNomalm          nvarchar(30)='',  @pDiralm          nvarchar(30)='',
    @pTelalm          nvarchar(20)='',  @pResalm          nvarchar(20)='',  @pEntalm          decimal (08)=0,   @pSalalm          decimal(8,0)=0,
    @pCiualm          nvarchar(30)='',  @pPrealm          nvarchar(05)='',  @pNota            nvarchar(100)='', @pResol           nvarchar(max)='',
    @pFacalm          nvarchar(03)='',  @pRangoi          decimal (14)=0,	@pRangof          decimal (14)=0,	@pComemp          nvarchar(40)='',
    @pFactura         nvarchar(30)='',  @pFacturac        nvarchar(30)='',  @pTipimp          decimal (01)=0,	@pEmail           nvarchar(150)='',
    @pTiremp          nvarchar(50)='',  @pDivalm          nvarchar(01)='',  @pNitalm          nvarchar(15)='',  @pValife          bit=0,
    @pAbreviatura     nvarchar(05)='',  @pBacktolog       bit,				@pClase           decimal (10)=0,	@pComanda         bit=0,
    @pComfinal        decimal (18)=0,	@pComini          decimal (18)=0,	@pCtrlcierre      bit=0,			@pFiltralin       bit=0,
    @pImpcocina       bit=0,			@pRutimpcocina    nvarchar(80)='',  @pPrintercoc      nvarchar(60)='',  @pExento          bit=0,
    @pImptodo         bit=0,			@pConsecocina     decimal (10)=0,	@pConsecoc        bit=0,			@pDiapromo        bit=0,
    @pNomequipo       nvarchar(60)='',  @pLogcerrarfac    bit=0,			@pSeparargru      bit=0,			@pImpsolovtes     bit=0,
    @pImpsticker      nvarchar(60)='',  @pImpespecial     bit=0,			@pAnulatouch      bit=0,			@pPassanulatouch  bit=0,
    @pRutimpcocina1   nvarchar(80)='',  @pRutimpcocina2   nvarchar(80)='',  @pRutimpcocina3   nvarchar(80)='',  @pRutimpcocina4   nvarchar(80)='',
    @pImpprefactura   nvarchar(80)='',  @pImpfactura      nvarchar(80)='',  @pPreciovta       bit=0,			@pNopropina       bit=0,
    @pMesabierta      bit=0,			@pVrsturnos       bit=0,			@pAlerta          decimal (14,2)=0, @pConfpago        bit=0,
    @pDescripmesa     decimal(1,0)=0,	@pCodzona         nvarchar(04)='',  @pDominf          bit=0,			@pValifec         bit=0,
    @pFijarcc         bit=0,			@pCcfijo          nvarchar(03)='',  @pEdformula       bit=0,			@pGruformula      bit=0,
    @pOcupada         bit=0,			@pStickerlis      nvarchar(max)='', @pRutaredeban     nvarchar(40)='',  @pTipoplato       bit=0,
    @pObserdevol      bit=0,			@pBloqmesero      bit=0,			@pObseranul       bit=0,			@pDispropina      bit=0,
    @pCtatrasalm      bit=0,			@pCtatras         nvarchar(08)='',  @pFilubicmesa     bit=0,			@proc             int=0,
	@pResoln		  nVarchar(200)='', @pPrdctoIva		  bit=0,			@pAgruart		  bit=0,			@pAddingyegr	  bit=0,
	@pDigiturno		  bit=0,			@pOrdgrunom		  bit=0,			@pImpfacconf	  bit=0,			@pDigNroPerso	  bit=0,
	@pDomiExpres	  bit=0,			@pForpagcoman	  bit=0,			@pImpcomdomi	  bit=0,			@pDomiciliario	  bit=0,
	@pCamesacto		  bit=0,			@pTurnovrios	  bit=0,			@pDctoxProd		  bit=0,			@pDesActProd	  bit=0,
	@pValcajero		  bit=0,			@pFactdcto		  bit=0,			@pInvenxcto		  bit=0,			@pImpgenxcto	  bit=0,
	@pConfirtras	  bit=0,			@pControlinv	  bit=0,			@pNrocolsti		  Decimal(2)=0,		@pCopiasfact	  nchar(1)='',
	@pCopiasfact2	  nchar(1)='',		@pPorStock		  Decimal(5)=0,		@pDiasped		  Decimal(5),		@pDctoMaxAlm	  Decimal(5),
	@pPassDcto		  Bit=0,			@pValhoracierre	  nVarchar(5)='',	@pVerImpSer		  bit=0,			@pDetServicio	  nvarchar(50)='',
	@pBloFecApe		  Bit=0,			@pImpxUsuRemo	  bit=0,			@pValexisinsumo	  Bit=0,			@pCladespro		  bit=0,
	@pValUsuFacUsuAper Bit=0,			@pVerExisInsumo	  Bit=0,			@pactbtoncajon	  Bit=0,			@phorafacreimp	  bit=0,
	@pCambioUsuario	  Bit=0,			@pAlrFacCont	  numeric(10)=0,	@pAlrFacTexto	  nVarchar(200)='',	@pAlrFacCcuanto	  numeric(10)=0,
	@pCambioTran	  bit=0,			@PedImpComandar	  bit=0			 		 	
										
AS
BEGIN TRY
	Declare @existe	 char(1),
			@mNerror int,
            @mMsg    nvarchar(190),
            @mLinea  int,
            @mAddMsg nvarchar(50),
		    @pVerMsg int=0,
            @mProc   char(20)

	Select @existe='N', @mNerror=57021, @mLinea=0, @mAddMsg=''
	Set @mProc = 'SPG_ActAlmacen'

	If Exists (Select codalm From Glb_Almacen Where idemp=@pIdemp AND codalm=@pCodalm)
		Select @existe='S'

	If @proc=1
	begin
		If @existe='N'
			begin
			Insert Into Glb_Almacen (idemp,codalm,nomalm,diralm,telalm,resalm,entalm,salalm,ciualm,prealm,
									 nota,resol,facalm,rangoi,rangof,comemp,factura,facturac,tipimp,email,tiremp,divalm,nitalm,valife,
									 abreviatura,backtolog,clase,comanda,comfinal,comini,ctrlcierre,filtralin,impcocina,rutimpcocina,
									 printercoc,exento,imptodo,consecocina,consecoc,diapromo,nomequipo,logcerrarfac,separargru,impsolovtes
									 ,impsticker,impespecial,anulatouch,passanulatouch,rutimpcocina1,rutimpcocina2,rutimpcocina3,rutimpcocina4,
									 impprefactura,impfactura,preciovta,nopropina,mesabierta,vrsturnos,alerta,confpago,descripmesa,codzona,
									 dominf,valifec,fijarcc,ccfijo,edformula,gruformula,ocupada,stickerlis,rutaredeban,tipoplato,obserdevol,
									 bloqmesero,obseranul,dispropina,ctatrasalm,ctatras,filubicmesa,resolN,PrdctoIva,agruart,addingyegr,digiturno,
									 ordgrunom,impfacconf,DigNroPerso,DomiExpres,forpagcoman,impcomdomi,domiciliario,camesacto,turnovrios,DctoxProd,DesActProd,
									 Valcajero, Factdcto, Invenxcto, Impgenxcto, Confirtras, Controlinv, Nrocolsti, Copiasfact, Copiasfact2, 
									 PorStock, Diasped, DctoMaxAlm,PassDcto,Valhoracierre,verimpser,detservicio,blofecape,impxusuremo,Valexisinsumo,cladespro,ValUsuFacUsuAper,
									 VerExisInsumo,actbtoncajon,horafacreimp,cambiousuario,AlrFacCont,AlrFacTexto,AlrFacCcuanto,cambiotran,PedImpComandar)
							 Values (@pIdemp,@pCodalm,@pNomalm,@pDiralm,@pTelalm,@pResalm,@pEntalm,@pSalalm,@pCiualm,@pPrealm,
									 @pNota,@pResol,@pFacalm,@pRangoi,@pRangof,@pComemp,@pFactura,@pFacturac,@pTipimp,@pEmail,@pTiremp,@pDivalm,@pNitalm,@pValife,
									 @pAbreviatura,@pBacktolog,@pClase,@pComanda,@pComfinal,@pComini,@pCtrlcierre,@pFiltralin,@pImpcocina,@pRutimpcocina,
									 @pPrintercoc,@pExento,@pImptodo,@pConsecocina,@pConsecoc,@pDiapromo,@pNomequipo,@pLogcerrarfac,@pSeparargru,@pImpsolovtes,
									 @pImpsticker,@pImpespecial,@pAnulatouch,@pPassanulatouch,@pRutimpcocina1,@pRutimpcocina2,@pRutimpcocina3,@pRutimpcocina4,
									 @pImpprefactura,@pImpfactura,@pPreciovta,@pNopropina,@pMesabierta,@pVrsturnos,@pAlerta,@pConfpago,@pDescripmesa,@pCodzona,
									 @pDominf,@pValifec,@pFijarcc,@pCcfijo,@pEdformula,@pGruformula,@pOcupada,@pStickerlis,@pRutaredeban,@pTipoplato,@pObserdevol,
									 @pBloqmesero,@pObseranul,@pDispropina,@pCtatrasalm,@pCtatras,@pFilubicmesa,@pResoln,@pPrdctoIva,@pAgruart,@pAddingyegr,@pDigiturno,
									 @pOrdgrunom,@pImpfacconf,@pDigNroPerso,@pDomiExpres,@pForpagcoman,@pImpcomdomi,@pDomiciliario,@pCamesacto,@pTurnovrios,@pDctoxProd,
									 @pDesActProd,@pValcajero, @pFactdcto, @pInvenxcto, @pImpgenxcto, @pConfirtras, @pControlinv, @pNrocolsti, @pCopiasfact, @pCopiasfact2,
									 @pPorStock, @pDiasped, @pDctoMaxAlm,@pPassDcto,@pValhoracierre,@pverimpser,@pDetServicio,@pBloFecApe,@pImpxUsuRemo,@pValexisinsumo,@pCladespro,
									 @pValUsuFacUsuAper,@pVerExisInsumo,@pactbtoncajon,@phorafacreimp,@pcambiousuario,@pAlrFacCont,@pAlrFacTexto,@pAlrFacCcuanto,@pCambiotran,
									 @PedImpComandar)
			End
		Else
			set @mNerror=27014
	end

	if @proc=2 
	begin
		if @existe='S'
		begin
			Update Glb_Almacen	Set 
			idemp		= @pIdemp,			codalm		= @pCodalm,			nomalm		= @pNomalm,				diralm			= @pDiralm,				telalm		= @pTelalm,
			resalm		= @pResalm,			entalm		= @pEntalm,			salalm		= @pSalalm,				ciualm			= @pCiualm,				prealm		= @pPrealm,
			nota		= @pNota,			resol		= @pResol,			facalm		= @pFacalm,				rangoi			= @pRangoi,				rangof		= @pRangof,
			comemp		= @pComemp,			factura		= @pFactura,		facturac	= @pFacturac,			tipimp			= @pTipimp,				email		= @pEmail,
			tiremp		= @pTiremp,			divalm		= @pDivalm,			nitalm		= @pNitalm,				valife			= @pValife,				abreviatura	= @pAbreviatura,
			backtolog	= @pBacktolog,		clase		= @pClase,			comanda		= @pComanda,			comfinal		= @pComfinal,			comini		= @pComini,
			ctrlcierre	= @pCtrlcierre,		filtralin	= @pFiltralin,		impcocina	= @pImpcocina,			rutimpcocina	= @pRutimpcocina,		printercoc	= @pPrintercoc,
			exento		= @pExento,			imptodo		= @pImptodo,		consecocina = @pConsecocina,		consecoc		= @pConsecoc,			diapromo	= @pDiapromo,
			nomequipo	= @pNomequipo,		logcerrarfac= @pLogcerrarfac,	separargru	= @pSeparargru,			impsolovtes		= @pImpsolovtes,		impsticker	= @pImpsticker,
			impespecial = @pImpespecial,	anulatouch	= @pAnulatouch,		passanulatouch=@pPassanulatouch,	rutimpcocina1	= @pRutimpcocina1,		rutimpcocina2=@pRutimpcocina2,
			rutimpcocina3=@pRutimpcocina3,	rutimpcocina4= @pRutimpcocina4,	impprefactura= @pImpprefactura,		impfactura		= @pImpfactura,			preciovta	= @pPreciovta,
			nopropina	= @pNopropina,		mesabierta	= @pMesabierta,		vrsturnos	= @pVrsturnos,			alerta			= @pAlerta,				confpago	= @pConfpago,
			descripmesa = @pDescripmesa,	codzona		= @pCodzona,		dominf		= @pDominf,				valifec			= @pValifec,			fijarcc		= @pFijarcc,
			ccfijo		= @pCcfijo,			edformula	= @pEdformula,		gruformula	= @pGruformula,			ocupada			= @pOcupada,			stickerlis	= @pStickerlis,
			rutaredeban = @pRutaredeban,	tipoplato	= @pTipoplato,		obserdevol	= @pObserdevol,			bloqmesero		= @pBloqmesero,			obseranul	= @pObseranul,
			dispropina	= @pDispropina,		ctatrasalm	= @pCtatrasalm,		ctatras		= @pCtatras,			filubicmesa		= @pFilubicmesa,		resolN		= @pResoln, 
			PrdctoIva	= @pPrdctoIva,		agruart		= @pAgruart,		addingyegr	= @pAddingyegr,			digiturno		= @pDigiturno,			ordgrunom	= @pOrdgrunom, 
			impfacconf	= @pImpfacconf,		DigNroPerso = @pDigNroPerso,	DomiExpres	= @pDomiExpres,			forpagcoman		= @pForpagcoman,		impcomdomi	= @pImpcomdomi, 
			domiciliario= @pDomiciliario,	camesacto	= @pCamesacto,		turnovrios	= @pTurnovrios,			DctoxProd		= @pDctoxProd,			DesActProd	= @pDesActProd, 
			Valcajero	= @pValcajero,		Factdcto	= @pFactdcto,		Invenxcto	= @pInvenxcto,			Impgenxcto		= @pImpgenxcto,			Confirtras	= @pConfirtras, 
			Controlinv	= @pControlinv,		Nrocolsti	= @pNrocolsti,		Copiasfact	= @pCopiasfact,			Copiasfact2		= @pCopiasfact2,		PorStock	= @pPorStock, 
			Diasped		= @pDiasped,		DctoMaxAlm	= @pDctoMaxAlm,		PassDcto	= @pPassDcto,			Valhoracierre	= @pValhoracierre,		VerImpSer	= @pVerImpSer,
			DetServicio	= @pDetServicio,	blofecape	= @pBloFecApe,		impxusuremo = @pImpxUsuRemo,		Valexisinsumo	= @pValexisinsumo,		cladespro	= @pCladespro,
			ValUsuFacUsuAper=@pValUsuFacUsuAper,							VerExisInsumo=@pVerExisInsumo,		actbtoncajon	=@pactbtoncajon,		horafacreimp= @phorafacreimp,
			cambiousuario=@pCambioUsuario,	AlrFacCont  =@pAlrFacCont,		AlrFacTexto  =@pAlrFacTexto,		AlrFacCcuanto	=@pAlrFacCcuanto,		Cambiotran	= @pCambioTran,
			PedImpComandar=@PedImpComandar 
			Where	Idemp=@pIdemp AND codalm=@pCodalm
		end
		else 
			set @mNerror=57023
	end

	If @proc=3
		begin
			if @existe='S'
				begin
					If Exists(Select idemp,codalm From Glb_Cenconsumo Where idemp=@pIdemp AND codalm=@pcodalm)
						begin
							Select @mNerror=57002, @mAddMsg='; Centro de Consumo.', @pVerMsg=1;
							Throw  @mNerror,@mAddMsg,1;
						end
						If LEN(LTRIM(RTRIM(@mAddMsg)))=0
							Delete From Glb_Almacen Where idemp=@pIdemp AND codalm=@pCodalm
				end
		end
	Else
		Set @mNerror=57023

END TRY 

Begin Catch
	If @@TRANCOUNT>0
		ROLLBACK

	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO


IF OBJECT_ID('SPG_ActArticulos','P') IS NOT NULL	DROP PROCEDURE SPG_ActArticulos
GO
CREATE PROCEDURE SPG_ActArticulos
	@pCodart      nvarchar(10)='',		@pNomart       nvarchar(80)='',		@pCodgru      nvarchar(3)='',		@pCodlin		nvarchar(4)='',
	@pUndart      nvarchar(15)='',		@pIvaart       decimal(6,2)=0,		@pRuta        nvarchar(254)='',		@pComart		bit=0,
	@pDetart      nvarchar(max)='',		@pFecsys       datetime=getdate,	@pCodusu      nvarchar(10)='',		@pNompro		nvarchar(50)='',
	@pCodreg      decimal(9,0)=0,		@pCodter       nvarchar(15)='',		@pCodbar      nvarchar(25)='',		@pPreart		decimal(14,2)=0,
	@pRefart      nvarchar(25)='',		@pImpart       decimal(6,2)=0,		@pCodcol      nvarchar(3)='',		@pMasa			nvarchar(2)='',
	@pAcabado     nvarchar(1)='',		@pCodac        nvarchar(2)='',		@pGenero      nvarchar(2)='',		@pCodmat		nvarchar(2)='',
	@pExtimg      nvarchar(4)='',		@pImgart       nvarchar(max)='',	@pTallas      bit=0,				
	@pPorcom      decimal(4,3)=0,		@pUbic         nvarchar(3)='',		@pDesperdicio decimal(10,2)=0,		@pCodmar		nvarchar(3)='',
	@pInactivo    bit=0,				@pPorutil      decimal(8,2)=0,		@pPeso        bit=0,				
	@pCodtalla    nvarchar(4)='',		@pCalcivainclu decimal(1,0)=0,		@pActivo      bit=0,				@pPromxcant		bit=0,
	@pCodrel      nvarchar(10)='',		@pPlanilla     bit=0,				@pPrecio      decimal(14,2)=0,		@pPreciocos		decimal(14,2)=0,
	@pPreciocuc   decimal(14,2)=0,		@pPesocodbar   bit=0,				@pAlquila     bit=0,				@pAreac			decimal(10,0)=0,
	@pAreat       decimal(10,0)=0,		@pCalle        nvarchar(5)='',		@pCarrera     nvarchar(5)='',		@pCodbarrio		nvarchar(3)='',
	@pCodciu      nvarchar(3)='',		@pCoddpto      nvarchar(3)='',		@pCodtipo     nvarchar(2)='0',		@pEstado		decimal(1,0)=0,
	@pEstrato     nvarchar(1)='',		@pFecha        datetime=getdate,	@pFondo       decimal(10,0)=0,		@pFrente		decimal(10,0)=0,
	@pNitarren    nvarchar(15)='',		@pPermuta      bit=0,				@pPropietario nvarchar(15)='',		@pVende			bit=0,
	@pPropio      bit=0,				@pComercial    bit=0,				@pCfm         decimal(14,2)=0,		@pClasificacion decimal(1,0)=0,
	@pClausulas   decimal(2,0)=0,		@pTipo         decimal(1,0)=0,		@pTipo2       decimal(1,0)=0,		@pUp			bit=0,
	@pNocomision  bit=0,				@pVlrcomision  decimal(14,2)=0,		@pVariante    bit=0,				@pPorimpo		decimal(10,2)=0,
	@pValimpo     decimal(14,2)=0,		@pRepo         bit=0,				@pIvacmp      decimal(6,2)=0,		@pIvacero		bit=0,
	@pCambiapre   bit=0,				@pDctoart      numeric(6,2)=0,		@pProc        int=0,				@pCostoFijo		bit=0,
	@pRifaArt	  Bit=0,				@pCodtar	   nvarchar(2)='',		@pCodtemp	  nvarchar(4)='',		@pVlrResidual	numeric(14,2)=0,
	@pVidaUtil	  numeric(5)=0,			@pVidaUtilNiif numeric(5)=0,		@pctadepre	  nvarchar(8)='',		@pctagasto		nvarchar(8)='',
	@pDepreciable bit=0,				@pPedircod	   bit=0,				@pImpoconsumocero numeric(1)=0 			
AS
BEGIN TRY
   BEGIN TRAN 
   Declare @mExiste char(1), 
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsg int =0,
           @mProc   char(20)

	Select @mExiste ='N', @mNerror=57021,@mLinea=0, @mProc  ='SPG_ActArticulos',@mAddMsg=' '

	If Exists(SELECT codart FROM alm_articulos	WHERE codart=@pCodart )
		Set @mExiste ='S'

	If @pProc=1 
	Begin
		If @mExiste ='N' 
			Insert Into Alm_Articulos ( codart,nomart, codgru, codlin, undart, ivaart, ruta, comart,detart, fecsys, codusu, nompro, codreg, codter, codbar,
										preart, refart, impart, codcol, masa, acabado, codac, genero, codmat, extimg, imgart, tallas, porcom, ubic, 
										desperdicio, codmar, inactivo, porutil, peso,  codtalla, calcivainclu, activo, promxcant, codrel, planilla, 
										precio, preciocos, preciocuc, pesocodbar, alquila, areac, areat, calle, carrera, codbarrio, codciu, coddpto, codtipo, estado, 
										estrato, fecha, fondo, frente, nitarren, permuta, propietario, vende, propio, comercial, cfm, clasificacion, clausulas, tipo, tipo2, 
										up, nocomision, vlrcomision, variante, porimpo, valimpo, repo,ivacmp,ivacero,cambiapre,dctoart,costofijo,RifaArt,
										codtar,codtemp,VlrResidual,VidaUtil,VidaUtilNiif,ctadepre,ctagasto,depreciable,pedircod,Impoconsumocero)
							   Values ( @pCodart,@pNomart,@pCodgru,@pCodlin,@pUndart,@pIvaart,@pRuta,@pComart,@pDetart,@pFecsys,@pCodusu,@pNompro,@pCodreg,@pCodter,@pCodbar,
										@pPreart,@pRefart,@pImpart,@pCodcol,@pMasa,@pAcabado,@pCodac,@pGenero,@pCodmat,@pExtimg,@pImgart,@pTallas,@pPorcom,@pUbic,
										@pDesperdicio,@pCodmar,@pInactivo,@pPorutil,@pPeso,@pCodtalla,@pCalcivainclu,@pActivo,@pPromxcant,@pCodrel,@pPlanilla,
										@pPrecio,@pPreciocos,@pPreciocuc,@pPesocodbar,@pAlquila,@pAreac,@pAreat,@pCalle,@pCarrera,@pCodbarrio,@pCodciu,@pCoddpto,@pCodtipo,@pEstado,
										@pEstrato,@pFecha,@pFondo,@pFrente,@pNitarren,@pPermuta,@pPropietario,@pVende,@pPropio,@pComercial,@pCfm,@pClasificacion,
										@pClausulas,@pTipo,@pTipo2,@pUp,@pNocomision,@pVlrcomision,@pVariante,@pPorimpo,@pValimpo,@pRepo,
										@pIvacmp,@pIvacero,@pCambiapre,@pDctoart,@pCostoFijo,@pRifaArt,
										@pcodtar,@pCodtemp,@pVlrResidual,@pVidaUtil,@pVidaUtilNiif,@pctadepre,@pctagasto,@pDepreciable,@pPedircod,@pImpoconsumocero)
	End

	If @pProc=2
	Begin
		If @mExiste ='S'
         Update Alm_Articulos
			Set nomart=@pNomart,				codgru=@pCodgru,				codlin=@pCodlin,				undart=@pUndart,				ivaart=@pIvaart,		
				ruta=@pRuta,					comart=@pComart,				detart=@pDetart,				fecsys=@pFecsys,				codusu=@pCodusu,		
				nompro=@pNompro,				codreg=@pCodreg,				codter=@pCodter,				codbar=@pCodbar,				preart=@pPreart,		
				refart=@pRefart,				impart=@pImpart,				codcol=@pCodcol,				masa=@pMasa,					acabado=@pAcabado,		
				codac=@pCodac,					genero=@pGenero,				codmat=@pCodmat,				extimg=@pExtimg,				imgart=@pImgart,		
				tallas=@pTallas,				porcom=@pPorcom,				ubic=@pUbic,					codmar=@pCodmar,		
				desperdicio=@pDesperdicio,		inactivo=@pInactivo,			porutil=@pPorutil,				peso=@pPeso,							
				codtalla=@pCodtalla,			calcivainclu=@pCalcivainclu,	activo=@pActivo,				promxcant=@pPromxcant,			codrel=@pCodrel,
				planilla=@pPlanilla,			precio=@pPrecio,				preciocos=@pPreciocos,			preciocuc=@pPreciocuc,			pesocodbar=@pPesocodbar,			
				alquila=@pAlquila,				areac=@pAreac,					areat=@pAreat,					calle=@pCalle,					carrera=@pCarrera,		
				codbarrio=@pCodbarrio,			codciu=@pCodciu,				coddpto=@pCoddpto,				codtipo=@pCodtipo,				estado=@pEstado,		
				fecha=@pFecha,					estrato=@pEstrato,				fondo=@pFondo,					frente=@pFrente,				nitarren=@pNitarren,
				permuta=@pPermuta,				propietario=@pPropietario,		vende=@pVende,					propio=@pPropio,				comercial=@pComercial,
				cfm=@pCfm,						clasificacion=@pClasificacion,	clausulas=@pClausulas,			tipo=@pTipo,					tipo2=@pTipo2,			
				up=@pUp,						nocomision=@pNocomision,		variante=@pVariante,			porimpo=@pPorimpo,				vlrcomision=@pVlrcomision,			
				valimpo=@pValimpo,				pedircod=@pPedircod, 
				repo=@pRepo,					ivacmp=@pIvacmp,				ivacero=@pIvacero,				cambiapre=@pCambiapre,			dctoart=@pDctoart,
				costofijo=@pCostoFijo,			RifaArt=@pRifaArt,				codtar=@pcodtar,				codtemp=@pcodtemp,				VlrResidual=@pVlrResidual,
				VidaUtil=@pVidaUtil,			VidaUtilNiif=@pVidaUtilNiif,	ctadepre=@pctadepre,			ctagasto=@pctagasto,			depreciable=@pdepreciable,
				Impoconsumocero=@pImpoconsumocero		
		  Where codart =@pCodart
	End

	If @pProc=3
	Begin
		If @mExiste='S'
		Begin
			If dbo.FE_EliminarArticulos(@pCodart) = 0 
				Begin                 
					Select @mNerror=57002, @mAddMsg='; Kardex o depende de una Formula.',@pVerMsg=1 ;
					Throw @mNerror,@mAddMsg,1
				End
			Else 
				Begin 
					delete from alm_inventario where codart=@pCodart 
					delete from alm_codbarras  where codart=@pCodart 
					delete from alm_Articulos  where codart=@pCodart            
				 End   
		End
	End
	Commit Tran
END TRY

Begin Catch
	If @@TRANCOUNT>0 
		Rollback Tran

	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+ ' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch  
GO


IF OBJECT_ID('SPG_ActBancos','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActBancos
END
GO
CREATE PROCEDURE SPG_ActBancos
  @codbco nvarchar(2),
   @nombco nvarchar(30)='',
   @proc     int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int= 0,
           @mProc   char(20)
   select @existe ='N'
   select @mNerror=7021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActBancos' 
   
   
   if exists (select * from glb_bancos where codbco=@codbco)
      select @existe='S'
   
   
   
   if @proc=1
      if @existe='N'
         insert into glb_bancos(codbco,nombco)values(@codbco,@nombco) --codbco,@codbco,
      else
	  Begin  
	     select @mNerror = 57014,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End 

    
   if @proc=2 
      if @existe='S'
         update glb_bancos set nombco=@nombco where codbco=@codbco
      else
	  Begin  
	     select @mNerror = 57023,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End  
	    
   if @proc=3 
      if @existe='S'
	  Begin    
        delete from glb_bancos where codbco=@codbco
      End 
      else 
	  Begin  
	     select @mNerror = 57023,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End 
  
END Try 

Begin catch
    set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 
GO


IF OBJECT_ID('SPG_ActBarrio','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActBarrio
END
GO
CREATE PROCEDURE SPG_ActBarrio
 @codbarr   nvarchar(3),
   @nombarr   nvarchar(200), 
   @codzona   nvarchar(4), 
   @codzona2  nvarchar(4), 
   @horaini1  nvarchar(5), 
   @horafin1  nvarchar(5), 
   @horaini2  nvarchar(5), 
   @horafin2  nvarchar(5), 
   @valor1    numeric(14,0), 
   @valor2    numeric(14,0),
   @proc      int
   
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int =0,
           @mProc   char(20)
   select @existe ='N'
   select @mNerror=57021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActBarrio' 
   
   if exists (select * from glb_barrio where codbarr=@codbarr)
      select @existe='S'
   
   
   
   --codbarr, @codbarr,
   if @proc=1
      if @existe='N'
         insert into glb_barrio(codbarr,nombarr, codzona, codzona2, horaini1, horafin1, horaini2, horafin2, valor1, valor2)values( @codbarr,@nombarr, @codzona, @codzona2, @horaini1, @horafin1, @horaini2, @horafin2, @valor1, @valor2)
      else
	  Begin  
	     select @mNerror = 57014,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End 
	     
    
  
   if @proc=2 
      if @existe='S'
         update glb_barrio set nombarr=@nombarr, codzona=@codzona, 
                              codzona2=@codzona2, horaini1=@horaini1, 
                              horafin1=@horafin1, horaini2=@horaini2, 
                              horafin2=@horafin2, valor1=@valor1, 
                              valor2=@valor2 
         where codbarr=@codbarr
      else
	  Begin  
	     select @mNerror = 57023,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End 
	    
   
   
   
   if @proc=3
      if @existe='S'
         delete from glb_barrio where codbarr=@codbarr
      else
	  Begin  
	     select @mNerror = 57023,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End

END TRY

Begin Catch
	Set @mAddMsg = iif(ERROR_PROCEDURE() is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO


IF OBJECT_ID('SPG_ActCargos','P')		 IS NOT NULL DROP PROCEDURE SPG_ActCargos
GO
IF OBJECT_ID('db_SP_NOM_CARGOS_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_CARGOS_Set
GO

CREATE PROCEDURE db_SP_NOM_CARGOS_Set
	@codigo nvarchar(3),
	@nombre nvarchar(30)='',
	@proc   int = 0
AS
BEGIN TRY
	declare @existe		char(1),
			@mNerror	int,
			@mMsg		nvarchar(190),
			@mLinea		int,
			@mAddMsg	nvarchar(50),
			@pVerMsg	int= 0,
			@mProc		char(20)

	Select @existe ='N'
	Select @mNerror=7021, @mLinea=0, @mAddMsg='' 
	set @mProc ='db_SP_NOM_CARGOS_Set'

	If Exists (select * from nom_cargos where codi_cargo=@codigo)
		Select @existe='S'
   
	If @proc=1
		If @existe='N'
			Insert Into nom_cargos(codi_cargo,nomb_cargo) values (@codigo,@nombre)
		Else
		begin  
			Select @mNerror = 57014,@pVerMsg = 1;
			Throw @mNerror,@mAddMsg,1
		end 
    
	If @proc=2 
		If @existe='S'
			Update nom_cargos Set nomb_cargo=@nombre Where codi_cargo=@codigo
		Else
		begin  
			Select @mNerror = 57023,@pVerMsg = 1;
			Throw @mNerror,@mAddMsg,1
		end

	If @proc=3 
		If @existe='S'
			Delete From nom_cargos Where codi_cargo=@codigo
		Else
		begin  
			Select @mNerror = 57023,@pVerMsg = 1;
			Throw @mNerror,@mAddMsg,1
		end

END TRY 

Begin Catch
    Set @mAddMsg = IIF(ERROR_PROCEDURE()  IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch 
GO


IF OBJECT_ID('SPG_ActCarreras','P')			IS NOT NULL	DROP PROCEDURE SPG_ActCarreras
GO
IF OBJECT_ID('db_SP_NOM_CARRERAS_Set','P')  IS NOT NULL DROP PROCEDURE db_SP_NOM_CARRERAS_Set
GO

CREATE PROCEDURE db_SP_NOM_CARRERAS_Set
	@codi_curso		nvarchar (4),
	@titulo			nvarchar (30),
	@nivel_educ		nvarchar (2),
	@periodo		decimal,
	@num_periodos	decimal,
	@costo_periodo	decimal,
	@proc			int
AS
BEGIN TRY 
	Declare @existe char(1), @mNerror int, @mMsg nvarchar(190), @mLinea int, @mAddMsg nvarchar(50),@mProc char(20),@pVerMsgBox int=0

	Select @existe ='N', @mNerror = 7021, @mLinea = 0, @mAddMsg = '', @mProc = 'db_SP_NOM_CARRERAS_Set'

	If Exists (Select codi_curso,@titulo From nom_carreras Where codi_curso=@codi_curso)
		Select @existe='S'

	If @proc = 1
	begin
		if @existe='N'
		begin
			Insert Into nom_carreras (codi_curso
									 ,titulo
									 ,nivel_educ
									 ,periodo
									 ,num_periodos
									 ,costo_periodo)
			     Values (@codi_curso
						,@titulo
						,@nivel_educ
						,@periodo
						,@num_periodos
						,@costo_periodo)
		end
	end

	If @proc=2 
	begin
		If @existe='S'
		begin
			Update Nom_Carreras 
			   set codi_curso=@codi_curso
				  ,titulo=@titulo
				  ,nivel_educ=@nivel_educ
				  ,periodo=@periodo
				  ,num_periodos=@num_periodos
				  ,costo_periodo=@costo_periodo
			 Where codi_curso=@codi_curso
		end
	end

	If @proc=3 
		If @existe='S'
			Delete From nom_carreras Where codi_curso=@codi_curso
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO


IF OBJECT_ID('SPG_ActCausales','P')		   IS NOT NULL DROP PROCEDURE SPG_ActCausales
GO
IF OBJECT_ID('db_SP_NOM_CAUSALES_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_CAUSALES_Set
GO

CREATE PROCEDURE db_SP_NOM_CAUSALES_Set
	@codi_causal nvarchar(6),
	@nombre		 nvarchar(50)='',
	@indemniza	 bit='',
	@proc		 int=0
AS
BEGIN TRY
	Declare @existe	 char(1),
			@mNerror char(3),
			@mMsg	 nvarchar(190),
			@mLinea	 int,
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc	 char(20)

	Select @existe='N', @mNerror=7021, @mLinea=0, @mAddMsg='', @mProc ='db_SP_NOM_CAUSALES_Set'

	If EXISTS (Select * From nom_causales Where codcau=@codi_causal)
		Set @existe='S'

	If @proc=1
		If @existe='N' Insert Into nom_causales (codcau,nomcau,indem) Values (@codi_causal,@nombre,@indemniza)

	If @proc=2 
		If @existe='S' Update nom_causales Set nomcau=@nombre, indem=@indemniza Where codcau=@codi_causal

	If @proc=3
		If @existe='S' Delete From nom_causales Where codcau=@codi_causal
END TRY

Begin catch
   Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO


IF OBJECT_ID('SPG_ActCenconsumo','P') IS NOT NULL DROP PROCEDURE SPG_ActCenconsumo
GO

CREATE PROCEDURE SPG_ActCenconsumo
	@pIdemp    nvarchar(3),
	@pCodalm   nvarchar(3),
	@pCodcen   nvarchar(3),
	@pNomcen   nvarchar(25),
	@pCtacaj   nvarchar(8),
	@pNitcen   nvarchar(12),
	@pRoc      int
AS
BEGIN TRY
	Declare @existe char(1),
			@mNerror int,
			@mMsg    nvarchar(190),
			@mLinea  int,
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc   char(30)

	SELECT @existe ='N', @mNerror=57021,@mLinea=0 ,@mAddMsg='', @mProc ='SPG_ActCenconsumo'

	IF Exists (Select codalm from glb_Cenconsumo where Idemp=@pIdemp and codcen=@pCodcen)
		Select @existe='S'

	IF @proc=1
		begin
			IF @existe='N'
				Insert Into glb_Cenconsumo(Idemp,Codalm,codcen,Nomcen,Ctacaj,Nitcen) Values (@pIdemp,@pCodalm,@pCodcen,@pNomcen,@pCtacaj,@pNitcen)
		end
	Else 
		set @mNerror=57014

	IF @proc=2
	begin
		IF @existe='S'
			update	glb_Cenconsumo 
			set		nomcen=@pNomcen,
					ctacaj=@pCtacaj,
					nitcen=@pNitcen,
					codalm=@pcodalm 
			Where	Idemp=@pIdemp and codcen=@pCodcen
		ELSE
			Set @mNerror=57023
	end

	IF @proc = 3
	begin
		IF @existe='S'
		begin
			IF Exists (Select idemp,codcen From con_cencostos Where Idemp=@pIdemp and codalm=@pcodalm and codcen=@pCodcen)
			begin
				Select @mNerror=57002, @mAddMsg='; Centro de Costos.', @pVerMsg=1;
				Throw  @mNerror,@mAddMsg,1;
			end

			IF LEN(ltrim(rtrim(@mAddMsg)))=0
				Delete From glb_Cenconsumo where Idemp=@pIdemp and codalm=@pcodalm and codcen=@pCodcen
			ELSE
				Set @mNerror=57023
		end
	end
END TRY 

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO

IF OBJECT_ID('SPG_ActCencostos','P') IS NOT NULL DROP PROCEDURE SPG_ActCenCostos
GO

CREATE PROCEDURE SPG_ActCencostos
	@pIdemp    nvarchar(3),
	@pCodalm   nvarchar(3),
	@pCodcen   nvarchar(3),
	@pCodcto   nvarchar(3),
	@pNomcto   nvarchar(40),
	@pCodrel   nvarchar(33),
	@pAlmfac   nvarchar(3),
	@proc      INT,
	@pCtacaj   NVARCHAR(8) 
        
AS
BEGIN TRY 
	Declare @existe char(1),
			@mNerror  int,
			@mMsg     nvarchar(190),
			@mLinea   int,
			@mProc    char(20),
			@mCodtran nvarchar(2), 
			@mNomtran nVarchar(30), 
			@mTiptran decimal(1,0),
			@mAñotran decimal(4,0),
			@pVerMsgBox int=0,
			@mAddMsg  nvarchar (50)
           
   select @existe	='N', @mNerror=57021,@mLinea=0 
   set @mProc		='SP_ActCencostos'        
   set @mAddMsg		=''
   Set @mAñotran	= datepart(year,getdate())
   
	if exists(	select codcto from	con_cencostos where	Idemp =@pIdemp and codcto=@pCodcto)
	begin 
      select @existe='S'
	end 

	if @proc=1
	begin 
		if @existe='N'
		begin 
			insert into con_cencostos (Idemp,Codalm,Codcen,Codcto,Nomcto,Codrel,Almfac,ctacaj)
			values (@pIdemp,@pCodalm,@pCodcen,@pCodcto,@pNomcto,@pCodrel,@pAlmfac,@pCtacaj)
		
			insert into glb_unica (idemp, codcto, codtran, contran)
			select	@pIdemp,@pCodcto,Codtran,1 
			from	glb_transaccion 
			where	Tiptran=1 and concat(@pIdemp,@pCodcto,codtran) not in (select concat(idemp,codcto,codtran) from glb_unica Where idemp=@pIdemp and codcto=@pCodcto)
			
			insert into glb_mensual(idemp, codcto, codtran, añotran, mes01, mes02, mes03, mes04, mes05, mes06, mes07, mes08, mes09, mes10, mes11, mes12)
			select	@pIdemp,@pCodcto,Codtran,@mAñotran,1,1,1,1,1,1,1,1,1,1,1,1 
			From	glb_transaccion 
			where	tiptran=2 and concat(@pIdemp,@pCodcto,codtran) not in 
					(select concat(idemp,codcto,codtran) from glb_mensual Where idemp=@pIdemp and codcto=@pCodcto and añotran=@mAñotran)

			--Se Deben crear los articulos en este centro 
			insert into alm_inventario(idemp,codcto,codart)
			select	@pIdemp,@pCodcto,codart 
			from	alm_articulos 
			where	concat(@pIdemp,@pCodcto,codart) 
					not in (select	concat(Idemp,Codcto,codart) 
							from	alm_inventario where codcto=@pCodcto)
		End
	end  	 
	
	if @proc=2 
	begin
		if @existe='S'
		begin
			update	con_cencostos
			set		nomcto=@pNomcto,codrel=@pCodrel,
					almfac=@pAlmfac,ctacaj=@pCtacaj, codcen=@pCodcen 
			Where	Idemp=@pIdemp and codcto=@pCodcto
		End
		Else 
		Begin 
			set @mNerror=57023
		End   
	End
  
	If @proc=3 
	Begin 
		if @existe='S'
		Begin
			If Exists(Select idemp,codcto From con_Comprobante where idemp=@pIdemp and codcto=@pCodcto)
			Begin                 
				Select @mNerror=57002, @mAddMsg='; Contabilidad.',@pVerMsgBox=1;
				Throw  @mNerror,@mAddMsg,1;
			End 
         
			If len(ltrim(rtrim(@mAddMsg)))=0
			Begin 
				Begin Tran 
					Delete From	glb_mensual   where idemp=@pIdemp and codcto=@pCodcto
					Delete From glb_Unica     where idemp=@pIdemp and codcto=@pCodcto
					Delete from con_cencostos where Idemp=@pIdemp and codcto=@pCodcto
                Commit                                 
			End                                   
		End
		Else
		Begin 
			set @mNerror=57023         
		End    
	End /*Fin @Proc=3*/
END Try 
Begin catch
	If @@TRANCOUNT>0
		ROLLBACK
	
	set @mAddMsg = iif(ERROR_PROCEDURE() IS NULL, @mProc+ ' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 
GO


IF OBJECT_ID('SPG_ActCodbarras','P') IS NOT NULL DROP PROCEDURE SPG_ActCodbarras
GO

CREATE PROCEDURE SPG_ActCodbarras
	@pCodart nvarchar(10), @pCodbarra nvarchar(25), @pProc int 
AS
BEGIN TRY
   Declare @mExiste char(1) 
   Declare @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
   
   Select @mExiste ='N', @mNerror=57021,@mLinea=0, @mProc  ='SPG_ActCodbarras',@mAddMsg=''
   
   If Exists(SELECT codart FROM alm_codbarras WHERE codart=@pCodart and Codbarra=@pCodbarra )
      Set @mExiste ='S'
   
   If @pProc = 1 
      If @mExiste ='N' 
         insert into alm_codbarras(codart,codbarra)values(@pcodart,@pCodbarra)   
   
   
   If @pProc=3 
      If @mExiste='S'
         Delete From alm_codbarras where codart=@pCodart and Codbarra=@pCodbarra
  
   
  

End TRY
Begin Catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch  
GO


IF OBJECT_ID('SPG_ActComParametros','P') IS NOT NULL DROP PROCEDURE SPG_ActComParametros
GO

CREATE PROCEDURE SPG_ActComParametros
	@pIdemp			nvarchar(3)='',		@pIvainclu		bit=0,					@pUnialm       bit=0,
	@pInvtran		nvarchar(2)='',		@pPordes		bit=0,					@pPromcos      bit=0,
	@pValorayuda	decimal(1,0)=0,		@pDiasvenci		decimal(10,0)=0,		@pReemplazacos bit=0,  
	@pNoreversainv	bit=0,				@pNoversaen		bit=0,					@pCentroscomp  bit=0,  
	@pReversaen		bit=0,				@pEntcomp		nvarchar(2)='',			@pDesactplazo	bit=0,  
	@pVariosivas	bit=0,				@pAnticipo		bit=0,					@pIngserial		bit=0,  
	@pCtaant		nvarchar(10)='',	@pDigitarvl		bit=0,					@pModiva		bit=0,  
	@pActprecios	bit=0,				@pPoractprec	decimal(10,0)=0,		@pRoundoc		bit=0,  
	@pBlooptimp		bit=0,				@pValimp		decimal(1,0)=0,			@pCtaxegre		bit=0,
	@pTotinfcxp		bit=0,				@pRepitem		bit=0,					@pIvainf		bit=0,
	@pDcto100		bit=0,				@pIvaantdcto	bit=0,					@pValpromitem	bit=0,  
	@pActpredig		bit=0,				@pUniqtyart		bit=0,					@pactrete		bit=0,  		
	@pctafp			bit=0,				@pnotxallcc		bit=0,					@ppagprovros	bit=0,	
	@pvalpromcto	bit=0,				@pordernumfa	bit=0,					@pnoafecost		bit=0,
	@paprueoc		bit=0,				@pactpredigOtr	bit=0,					@paproxivlr		bit=0,
	@pvlraproxi		numeric(10)=0
   
AS 
BEGIN Try 
	declare @r int , @mExiste char(1)
	declare @mNerror char(3),
			@mMsg    nvarchar(190),
			@mLinea  int,
			@mAddMsg nvarchar(50),
			@pVerMsgBox int=0,
			@mProc   char(20)
   
	select @r = 0 , @mExiste ='N', @mNerror='021',@mLinea=0,@mAddMsg='' 
	set @mProc  ='SPG_ActComParametros'        

	If exists (Select Idemp From com_parametros where Idemp=@pIdemp)
	Begin 
		Update	com_parametros 
		Set		ivainclu	=@pIvainclu,		unialm		=@pUnialm,			invtran		=@pInvtran,				pordes		=@pPordes,					
				promcos		=@pPromcos,			valorayuda	=@pValorayuda,		diasvenci	=@pDiasvenci,			reemplazacos=@pReemplazacos,		
				noreversainv=@pNoreversainv,	noversaen	=@pNoversaen,		centroscomp	=@pCentroscomp,			reversaen	=@pReversaen,
				entcomp		=@pEntcomp,			desactplazo	=@pDesactplazo,		variosivas	=@pVariosivas,			anticipo	=@pAnticipo,
				ingserial	=@pIngserial,		ctaant		=@pCtaant,			digitarvl	=@pDigitarvl,			modiva		=@pModiva,
				actprecios	=@pActprecios,		poractprec	=@pPoractprec,		roundoc		=@pRoundoc,				blooptimp	=@pBlooptimp,
				valimp		=@pValimp,			ctaxegre	=@pCtaxegre,		totinfcxp	=@pTotinfcxp,			repitem		=@pRepitem,
				ivainf		=@pIvainf,			dcto100		=@pDcto100,			ivaantdcto	=@pIvaantdcto,			valpromitem	=@pValpromitem,
				actpredig	=@pActpredig,		uniqtyart	=@pUniqtyart,		actrete		=@pactrete,				ctafp		=@pctafp,
				notxallcc	=@pnotxallcc,		pagprovros	=@ppagprovros,		valpromcto	=@pvalpromcto,			ordernumfa	=@pordernumfa,
				noafecost	=@pnoafecost,		aprueoc		=@paprueoc,			actpredigOtr=@pactpredigOtr,		aproxivlr	=@paproxivlr,
				vlraproxi	=@pvlraproxi		
		Where Idemp=@pIdemp
	End 
	Else 
	Begin 
		Insert Into com_parametros(idemp,			ivainclu,		unialm,			invtran,		pordes,			promcos,		valorayuda,		diasvenci,		reemplazacos, 
								noreversainv,		noversaen,		centroscomp,	reversaen,		entcomp,		desactplazo,	variosivas,		anticipo,		ingserial, 
								ctaant,				digitarvl,		modiva,			actprecios,		poractprec,		roundoc,		blooptimp,		valimp,			ctaxegre,
								totinfcxp,			repitem,		ivainf,			dcto100,		ivaantdcto,		valpromitem,	actpredig,		uniqtyart,		actrete,
								ctafp,				notxallcc,		pagprovros,		valpromcto,		ordernumfa,		noafecost,		aprueoc,		actpredigOtr,	aproxivlr)
						Values (@pIdemp,			@pIvainclu,		@pUnialm,		@pInvtran,		@pPordes,		@pPromcos,		@pValorayuda,	@pDiasvenci,	@pReemplazacos,
								@pNoreversainv,		@pNoversaen,	@pCentroscomp,	@pReversaen,	@pEntcomp,		@pDesactplazo,	@pVariosivas,	@pAnticipo,		@pIngserial,
								@pCtaant,			@pDigitarvl,	@pModiva,		@pActprecios,	@pPoractprec,	@pRoundoc,		@pBlooptimp,	@pValimp,		@pCtaxegre,
								@pTotinfcxp,		@pRepitem,		@pIvainf,		@pDcto100,		@pIvaantdcto,	@pValpromitem,	@pActpredig,	@pUniqtyart,	@pactrete,
								@pctafp,			@pnotxallcc,	@ppagprovros,	@pvalpromcto,	@pordernumfa,	@pnoafecost,	@paprueoc,		@pactpredigOtr,	@paproxivlr)		
   End  
END TRY
Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch 
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_ActComprobante','P') IS NOT NULL	DROP PROCEDURE db_SP_ActComprobante
GO
IF OBJECT_ID('SPG_ActComprobante','P') IS NOT NULL	DROP PROCEDURE SPG_ActComprobante
GO
CREATE PROCEDURE db_SP_ActComprobante
		@pIdemp          nvarchar(3)  ='',			@pCodalm     varchar(3)  ='',	@pCodcen   nvarchar(3)  ='',
		@pCodcto         nvarchar(3)  ='',			@pCodtran    nvarchar(2) ='',	@pConsec   nvarchar(16) ='',
		@pCodctodet      nvarchar(3)  =@pcodcto,	@pFecdoc     nvarchar(50)='',	@pCodcue   nvarchar(8)  ='',
		@pNitter         nvarchar(12) =0,			@pDetalle    nvarchar(90)='',	@pDebito   decimal(14,2)=0,
		@pCredito        decimal(14,2)=0,			@pCodusu     nvarchar(10)='',	@pEstcomp  nvarchar(1)  ='',
		@pNumche         nvarchar(10) ='',			@pCodact     nvarchar(10)='',	@pBase     decimal(14,2)=0,
		@pTurno          decimal(10,0)=0,			@pEstconcili nvarchar(1) ='',	@pCodimp   nvarchar(3)  ='',
		@pCtacomitar     nvarchar(8)  ='',			@pNitter2    nvarchar(15)='',	@pSaldoa   bit=0,
		@pProc           int		  =0,			@pItemdoc    decimal(6,0)=0,	@pAnulComp bit=0,
		@pFecAnul		 nvarchar(50) ='',			@cNorma		 char(1)='P',		@timedife	Numeric(3)=0
AS
BEGIN TRY
	Declare @mExiste char(1),		@mNerror int,		@mMsg nvarchar(190),	@mLinea int,
			@mAddMsg nvarchar(230),	@mProc   char(20),	@mFecfac date,			@mVenfac date, 
			@mFecDoc date,			@pVerMsgBox int=0,	@mAnulCodtran nVarchar(2), @mFecAnul date

	Select	@mExiste='N', @mNerror=57027, @mLinea=0, @mProc='db_SP_ActComprobante', @mAddMsg=' ', @pEstcomp=ISNULL(@pEstcomp,''), 
			@mAnulCodtran='', @mFecDoc=Convert(Date,@pFecdoc), @mFecAnul=iif(@pFecAnul='',getdate(),convert(date,@pFecAnul))

	If @pCodcue='' AND  @pProc<>3
	begin
		Select  @mNerror=57025,@mAddMsg =';El doc. Transaccion no tiene una cuenta valida.;', @pVerMsgBox = 1;
		Throw @mNerror,@mAddMsg,1;
	end

	If @pProc = 1
	begin
		If @cNorma = 'P'
			begin
				Set @pItemDoc = IIF(@pItemDoc=0,ISNULL((Select Dbo.Fe_ItemComp(@pIdemp,@pCodcto,@pCodtran,@pConsec)),1),@pItemDoc)

				Insert Into Con_Comprobante (idemp,			codalm,		codcen,		codcto,		codtran,	consec,
											 fecdoc,		codcue,		nitter,		detalle,	debito,		credito,
											 estcomp,		numche,		codact,		base,		turno,		estconcili,	
											 ctacomitar,	codimp,		nitter2,	saldoa,		itemdoc,	codctodet,	 codusu, timedife)
									 Values (@pIdemp,		@pCodalm,   @pCodcen,	@pCodcto,  @pCodtran,	@pConsec,
						 					 @pFecdoc,		@pCodcue,   @pNitter,	@pDetalle, @pDebito,	@pCredito,
					 						 @pEstcomp,		@pNumche,   @pCodact,	@pBase,    @pTurno,		@pEstconcili,
											 @pCtacomitar,	@pCodimp,	@pNitter2,	@pSaldoa,  @pItemdoc,	@pCodctodet, @pCodusu, @timedife)
			end
		Else
			begin
				Set @pItemDoc = IIF(@pItemDoc=0,ISNULL((Select Dbo.Fe_ItemCompNIIF(@pIdemp,@pCodcto,@pCodtran,@pConsec)),1),@pItemDoc)

				Insert Into Con_ComproNIIF  (idemp,			codalm,		codcen,		codcto,		codtran,	consec,
											 fecdoc,		codcue,		nitter,		detalle,	debito,		credito,
											 estcomp,		numche,		codact,		base,		turno,		estconcili,	
											 ctacomitar,	codimp,		nitter2,	saldoa,		itemdoc,	codctodet,	codusu)
											 
									 Values (@pIdemp,		@pCodalm,	@pCodcen,   @pCodcto,	@pCodtran,	@pConsec,
						 					 @pFecdoc,		@pCodcue,   @pNitter,	@pDetalle,	@pDebito,	@pCredito,
					 						 @pEstcomp,		@pNumche,	@pCodact,	@pBase,		@pTurno,	@pEstconcili,	
											 @pCtacomitar,	@pCodimp,	@pNitter2,	@pSaldoa,	@pItemdoc,	@pCodctodet, @pCodusu)
			end
	end

	If @pProc = 2
		begin
			If @cNorma = 'P'
				Update Con_Comprobante Set codcto=@pCodcto, codcue=@pCodcue, detalle=@pDetalle,
										   nitter=@pNitter, debito=@pDebito, credito=@pCredito,
										   codusu=@pCodusu, fecdoc=@pFecdoc, codctodet=@pCodctodet, numche=@pNumche, timedife=@timedife
									 Where idemp=@pIdemp AND codcto=@pCodcto AND consec=@pConsec AND itemdoc=@pItemdoc AND codtran=@pCodtran
			Else
				Update Con_ComproNIIF  Set codcto=@pCodcto, codcue=@pCodcue, detalle=@pDetalle,
										   nitter=@pNitter, debito=@pDebito, credito=@pCredito,
										   codusu=@pCodusu, fecdoc=@pFecdoc, codctodet=@pCodctodet, numche=@pNumche
									 Where idemp=@pIdemp AND codcto=@pCodcto AND consec=@pConsec AND itemdoc=@pItemdoc AND codtran=@pCodtran
		end

	If @pProc = 3
		begin
			If @pAnulComp = 0
				begin
					If @cNorma = 'P'
						Update Con_Comprobante Set estcomp='A' Where idemp=@pIdemp AND codcto=@pCodcto AND consec=@pConsec AND itemdoc=@pItemdoc AND codtran=@pCodtran
					Else
						Update Con_ComproNIIF  Set estcomp='A' Where idemp=@pIdemp AND codcto=@pCodcto AND consec=@pConsec AND itemdoc=@pItemdoc AND codtran=@pCodtran
				end
			Else
				begin
					Set @mAnulCodtran = dbo.Fe_CtaTransAnul(@pCodtran)
					If LEN(@mAnulCodtran)>0
						begin --@pFecdoc @mFecAnul
							If @cNorma = 'P'
								Insert Into Con_Comprobante (idemp, codalm, codcen, codcto, codtran, consec, codctodet,
															 fecdoc, codcue, nitter, detalle, debito, credito, codusu,
															 estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar,
															 nitter2, saldoa, ivamayvlr,itemdoc, timedife)
													  Select idemp, codalm, codcen, codcto, @mAnulCodtran AS codtran, consec, codctodet,
										 					 @pFecdoc AS fecdoc, codcue, nitter, 'Anulamos '+SUBSTRING(Detalle,1,80) AS Detalle, credito as debito,
									 						 debito AS credito, @pCodusu AS codusu, estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar,
															 nitter2, saldoa, ivamayvlr, itemdoc, timedife
														From Con_Comprobante
													   Where idemp=@pIdemp AND codtran=@pCodtran AND consec=@pConsec AND codcto=@pCodcto
							Else
								Insert Into Con_ComproNIIF  (idemp, codalm, codcen, codcto, codtran, consec, codctodet,
															 fecdoc, codcue, nitter, detalle, debito, credito, codusu,
															 estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar,
															 nitter2, saldoa, ivamayvlr,itemdoc)
													  Select idemp, codalm, codcen, codcto, @mAnulCodtran AS codtran, consec, codctodet,
										 					 @pFecdoc AS fecdoc, codcue, nitter, 'Anulamos '+SUBSTRING(Detalle,1,80) AS Detalle, credito as debito,
									 						 debito AS credito, @pCodusu AS codusu, estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar,
															 nitter2, saldoa, ivamayvlr, itemdoc
														From Con_ComproNIIF
													   Where idemp=@pIdemp AND codtran=@pCodtran AND consec=@pConsec AND codcto=@pCodcto
						end
					Else 
						begin
							Select  @mNerror=57023,@mAddMsg =';Esta Transaccion no tiene relacionado el Doc que Anula.', @pVerMsgBox = 1;
							Throw @mNerror,@mAddMsg,1;
						end 
				end
		end
END TRY

Begin Catch 
	If @mNError = ERROR_NUMBER()
		Select  @pVerMsgBox=1
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch  
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_ActConceptos','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActConceptos
END
GO
CREATE PROCEDURE SPG_ActConceptos
  @pIdemp  nvarchar(3),  @pcodcon nvarchar(2), @pnomcon nvarchar(40),
      @pcodcue nvarchar(12)='', @pOp int
AS
BEGIN Try 
   declare @existe char(1),
           @mNerror INT,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox INT =0,
           @mProc   char(20)
   select @existe ='N'
   select @mNerror=57021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActConceptos'
   
   if exists (select * from com_conceptos where Idemp=@pIdemp And codcon=@pcodcon)
      select @existe='S'
  
   
   
   if @pOp=1
      if @existe='N'
         insert into com_conceptos(idemp, codcon, nomcon, codcue)values(@pidemp, @pcodcon, @pnomcon, @pcodcue)
      
    
   if @pOp=2 
      if @existe='S'
        update com_conceptos set nomcon=@pnomcon, codcue=@pcodcue where Idemp=@pIdemp And codcon=@pcodcon
   
   if @pOp=3 
      if @existe='S'
        delete from com_conceptos where Idemp=@pIdemp And codcon=@pcodcon


END Try 

Begin catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 

GO


IF OBJECT_ID('SPG_ActContac','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActContac
END
GO
CREATE PROCEDURE SPG_ActContac
 @codigo nvarchar(2) =null,
   @nombre nvarchar(30)=null,
   @contac bit, 
   @sector bit, 
   @proc   int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int=0, --char(3),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int = 0,
           @mProc   char(20)
   
   select @existe ='N',@mNerror=7021,@mLinea=0,@mAddMsg='',@mProc  ='SPG_ActContac'
   
   
   if exists (select * from glb_contac where codigo=@codigo)
      select @existe='S'
   
   
   
   if @proc=1
      if @existe='N'
         insert into glb_contac(codigo,nombre,contac,sector)values(@codigo,@nombre,@contac,@sector)
      
    
   if @proc=2 
      if @existe='S'
         update glb_contac set nombre=@nombre,contac=@contac, sector=@sector where codigo=@codigo
      
   
   if @proc=3 
      if @existe='S'
         delete from glb_contac where codigo=@codigo
 
END Try 

Begin catch
    set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 

GO

IF OBJECT_ID('SPG_ActConteo','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActConteo
END
GO
CREATE PROCEDURE SPG_ActConteo
 	@pIdemp   nvarchar(3),	@pCodcto nvarchar(3),  @pNumcont nvarchar(8),
	@pFecha   nvarchar(20), @pCodart nvarchar(10), @pQtyart decimal(14,2),
	@pEstcont nvarchar(1),	@pCodusu nvarchar(10), @pItem int 
AS
BEGIN try 
      Declare @mFecha date,@mAddMsg nvarchar(230)='', @pVerMsgBox int =0,@mProc nvarchar(30)='SPG_ActConteo'  
   
   Set @mFecha = CONVERT(date,LTRIM(RTRIM(@pfecha)))
   If Exists (Select numcont 
              from   Alm_Conteoinv 
              where  Idemp = @pidemp And Codcto=@pcodcto And 
                     codusu=@pCodusu And Estcont=@pEstcont And codart = @pCodart and itemart=@pItem)
      Update Alm_Conteoinv 
	  Set	 Qtyart=@pQtyart  
      where  Idemp = @pidemp And Codcto=@pcodcto And 
             Codusu=@pCodusu And Estcont=@pEstcont And codart = @pCodart  and itemart=@pItem
   Else 
      Insert Into Alm_Conteoinv (idemp,codcto,numcont,fecha,codart,qtyart,estcont,codusu,itemart)
            Values(@pidemp,@pcodcto,@pnumcont,@mfecha,@pcodart,@pqtyart,@pestcont,@pcodusu,@pItem)                   

END try 

Begin Catch 
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End catch 
GO


IF OBJECT_ID('SPG_ActDescuentos','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActDescuentos
END
GO
CREATE PROCEDURE SPG_ActDescuentos
 @pIdemp   nvarchar(3),    @pCoddes     nvarchar(3),  
   @pNomdes   nvarchar(30),  @pPordes     decimal(6,2),  
   @pTipdes   nvarchar(1),   @pCtavta     nvarchar(8),  
   @pCtacom   nvarchar(8),   @pAplicaser  bit,  
   @pMontodes decimal(14,2), @pProc       int 

AS
BEGIN try 
   declare @existe char(1),
           @mNerror char(3),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
           @mProc   char(20)
   select @existe ='N'
   select @mNerror='021',@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActDescuentos'
   
   
   
   if exists (select * from Glb_Descuentos where Idemp=@pIdemp And Coddes=@pCoddes)
      select @existe='S'
  
   
   
   if @pProc=1
      if @existe='N'
         insert into Glb_Descuentos(idemp,coddes,nomdes,pordes,tipdes,ctavta,ctacom,aplicaser,montodes)
		                     values(@pIdemp,@pCoddes,@pNomdes,@pPordes,@pTipdes,@pCtavta,@pCtacom,@pAplicaser,@pMontodes)
      
    
   if @pProc=2 
      if @existe='S'
        Update Glb_Descuentos 
		Set    nomdes=@pNomdes, pordes=@pPordes, tipdes=@pTipdes, ctavta=@pCtavta, 
		       ctacom=@pCtacom, aplicaser=@pAplicaser, montodes=@pMontodes
	    Where  Idemp=@pIdemp And Coddes=@pCoddes
    
   
   if @pProc=3 
      if @existe='S'
        delete from Glb_Descuentos where Idemp=@pIdemp And Coddes=@pCoddes
     
   
     
   
   
  
if @@ERROR=0 
   Begin 		
     set @mMsg=(select m.Mensaje+@mAddMsg  from glb_mensaje m where m.id=@mNerror)
     exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
   End   
  
END Try 

Begin catch
   Exec sp_MensajeSql 
End Catch 
GO


IF OBJECT_ID('SPG_ActDetinvfisicos','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActDetinvfisicos
END
GO
CREATE PROCEDURE SPG_ActDetinvfisicos
 @pIdinvfisicos int,           @pCodart   nvarchar(10),  @pRefart    nvarchar(25),  
   @pNomart       nvarchar(60),  @pQtysis   decimal(14,4), @pValsis    decimal(14,2),  
   @pCosart       decimal(14,2), @pQtyfis   decimal(14,4), @pValfis    decimal(14,2),  
   @pQtydif       decimal(14,4),  @pValdif   decimal(14,2), @pOk        bit,  
   @pCodcue       nvarchar(8),   @pMotivo   nvarchar(60),  @pCodgru    nvarchar(3),  
   @pNomgru       nvarchar(60),  @pCodlin   nvarchar(3),   @pNomlin    nvarchar(40),  
   @pCodmar       nvarchar(3),   @pNommar   nvarchar(40),  @pCodter    nvarchar(12),  
   @pNompro       nvarchar(60),  @pTiporeg  decimal(1,0),  @pQtyserial decimal(14,2),  
   @pConsigna     bit,           @pUndart   nvarchar(4)
         
AS
BEGIN try 
   declare @mNerror char(3),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
           @mProc   char(20)
           
   select @mNerror='021',@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActDetinvfisicos'        
   
   If not exists (select Idinvfisicos from alm_detinvfisicos  where Idinvfisicos=@pIdinvfisicos and codart=@pCodart)
      Begin 
      Insert Into alm_detinvfisicos(Idinvfisicos,codart, refart, nomart, qtysis, 
                                    valsis, cosart, qtyfis, valfis, qtydif, 
                                    valdif, ok, codcue, motivo, codgru, nomgru, 
                                    codlin, nomlin, codmar, nommar, codter, nompro, 
                                    tiporeg, qtyserial, consigna, undart) 
                             values(@pIdinvfisicos,@pCodart,@pRefart,@pNomart,@pQtysis,
                                    @pValsis,@pCosart,@pQtyfis,@pValfis,@pQtydif,
                                    @pValdif,@pOk,@pCodcue,@pMotivo,@pCodgru,@pNomgru,
                                    @pCodlin,@pNomlin,@pCodmar,@pNommar,@pCodter,@pNompro,
                                    @pTiporeg,@pQtyserial,@pConsigna,@pUndart)      
      
      End 
   Else 
   Begin 
      Update alm_detinvfisicos 
      Set    codart=@pCodart, refart=@pRefart,nomart=@pNomart,qtysis=@pQtysis,
             valsis=@pValsis, cosart=@pCosart,qtyfis=@pQtyfis,valfis=@pValfis,
             qtydif=@pQtydif, valdif=@pValdif,ok=@pOk,codcue=@pCodcue,
             motivo=@pMotivo, codgru=@pCodgru,nomgru=@pNomgru,codlin=@pCodlin,
             nomlin=@pNomlin, codmar=@pCodmar,nommar=@pNommar,codter=@pCodter,
             nompro=@pNompro, tiporeg=@pTiporeg,qtyserial=@pQtyserial,
             consigna=@pConsigna,undart=@pUndart
        Where  Idinvfisicos=@pIdinvfisicos and codart=@pCodart
   End
   
   
   
   
   
   if @@ERROR=0 
   Begin 		
     set @mMsg=(select m.Mensaje+@mAddMsg  from glb_mensaje m where m.id=@mNerror)
     exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
   End   
  
  
END try 
Begin catch
   exec sp_MensajeSql 
End Catch
GO


IF OBJECT_ID('SPG_ActDotaciones','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActDotaciones
END
GO
CREATE PROCEDURE SPG_ActDotaciones
 @codigo nvarchar(3),
   @nombre nvarchar(30)='',
   @proc     int = 0
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int= 0,
           @mProc   char(20)
   
   select @existe ='N'
   select @mNerror=7021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActDotaciones' 
   
   
   if exists (select * from nom_dotacion where codigo=@codigo)
      select @existe='S'
   
   
   
   if @proc=1
      if @existe='N'
         insert into nom_dotacion(codigo,nombre)values(@codigo,@nombre)
      else
	  Begin  
	     select @mNerror = 57014,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End 

    
   if @proc=2 
      if @existe='S'
         update nom_dotacion set nombre=@nombre where codigo=@codigo
      else
	  Begin  
	     select @mNerror = 57023,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End  
	    
   if @proc=3 
      if @existe='S'
	  Begin    
        delete from nom_dotacion where codigo=@codigo
      End 
      else 
	  Begin  
	     select @mNerror = 57023,@pVerMsgBox = 1;
		 throw @mNerror,@mAddMsg,1
      End 
  
END Try 

Begin catch
    set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 
GO



IF OBJECT_ID('SPG_ActEmpresa','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActEmpresa
END
GO
CREATE PROCEDURE SPG_ActEmpresa
	@pId              nvarchar(03)='',	@pNomemp	 nvarchar(100)='',	@pNitemp	nvarchar(15)='',	@pDivemp          nvarchar(01)='',
	@pDiremp          nvarchar(30)='',	@pTelemp     nvarchar(20)='',	@pCiuemp    nvarchar(20)='',    @pGeremp          nvarchar(30)='',
	@pConemp          nvarchar(30)='',	@pTipemp     decimal(1,0)=0,	@pFacemp    nvarchar(30)='',    @pResemp          nvarchar(max)='',
	@pEgremp          nvarchar(30)='',	@pCmpart     nvarchar(10)='',	@pCalcvta   bit=0,              @pCompref         nvarchar(40)='',
	@pComemp          nvarchar(60)='',	@pTiremp     nvarchar(30)='',	@pNotemp    nvarchar(max)='',   @pCotemp          nvarchar(30)='',
	@pDelemp          bit=0,			@pRuta       nvarchar(100)='',	@pTipconse  decimal(1,0)=0,     @pTipo            decimal(1,0)=0,
	@pValfecha        bit=0,			@pRevisor    nvarchar(30)='',	@pEmail     nvarchar(50)='',    @pWeb             nvarchar(50)='',
	@pCodsuscriptor   nvarchar(10)='',	@pC0         nvarchar(1)='',	@pC1        nvarchar(1)='',     @pC2              nvarchar(01)='',
	@pC3              nvarchar(01)='',	@pC4         nvarchar(1)='',	@pC5        nvarchar(1)='',     @pC6              nvarchar(01)='',
	@pC7              nvarchar(01)='',	@pC8         nvarchar(1)='',	@pC9        nvarchar(1)='',     @pRepsticker      nvarchar(30)='',
	@pClapuc          decimal(1,0)=0,	@pFecmovfin  nvarchar(20)='',	@pFecmovini nvarchar(20)='',    @pRepsalmateria   nvarchar(30)='',
	@pTouchnom        bit=0,			@pRepconsumo nvarchar(30)='',	@pCodequipo nvarchar(10)='',    @pCodsim          nvarchar(10)='',
	@pImppdf          nvarchar(60)='',	@pF01        bit=0,				@pF03       bit=0,              @pF05             bit=0,
	@pF06             bit=0,			@pF07        bit=0,				@pF08       bit=0,              @pF09             bit=0,
	@pF11             bit=0,			@pF12        bit=0,				@pF37       bit=0,              @pF47             bit=0,
	@pSticvarios      bit=0,			@pSticlist   nvarchar(max)='',	@pEmpfact   nvarchar(100)='',   @pProc            int,
	@pRegImpo		  bit=0,			@pPlan		 nvarchar(2)='',	@pSuperin	nvarchar(2)=''	

AS
BEGIN TRY
	BEGIN TRAN
	Declare @mExiste Char(1), @mFecmovini Date, @mFecmovfin Date, @pVerMsgBox int=0
	Declare @mNerror Int,
			@mMsg    nvarchar(190),
			@mLinea  int,
			@mAddMsg nvarchar(50)='',
			@mProc   char(20)

	Select	@mExiste ='N', @mNerror=57021,@mLinea=0, @mAddMsg='',
			@mFecmovfin=Convert(DATE,LTRIM(RTRIM(@pFecmovfin))),
			@mFecmovini=Convert(DATE,LTRIM(RTRIM(@pFecmovini))),
			@mProc = 'SP_ActEmpresa'

	If exists (select Id from Glb_Empresa Where Id=@pId)
		Select @mExiste='S'

	If @pProc=1 AND @mExiste='N'
	begin
		Exec SPG_ActTerceros @pNitter=@pNitemp,@pNomter=@pnomemp,@pDivter=@pdivemp,@pTipter=@ptipemp,@Proc=1
         
		Insert Into Glb_Empresa (id,nomemp,nitemp,divemp,
                                 diremp,telemp,ciuemp,geremp,
                                 conemp,tipemp,facemp,resemp,
                                 egremp,cmpart,calcvta,compref,
                                 comemp,tiremp,notemp,cotemp,
                                 delemp,ruta,tipconse,tipo,
                                 valfecha,revisor,email,web,
                                 codsuscriptor,c0,c1,c2,
                                 c3,c4,c5,c6,c7,c8,c9,repsticker,
                                 clapuc,fecmovfin,fecmovini,repsalmateria,
                                 touchnom,repconsumo,codequipo,codsim,imppdf,
                                 f01,f03,f05,f06,f07,f08,f09,f11,f12,f37,f47,
                                 sticvarios,sticlist,empfact,RegImpo,[plan],superin)
						Values ( @pid,@pnomemp,@pnitemp,@pdivemp,
                                 @pdiremp,@ptelemp,@pciuemp,@pgeremp,
                                 @pconemp,@ptipemp,@pfacemp,@presemp,
                                 @pegremp,@pcmpart,@pcalcvta,@pcompref,
                                 @pcomemp,@ptiremp,@pnotemp,@pcotemp,
                                 @pdelemp,@pruta,@ptipconse,@ptipo,
                                 @pvalfecha,@previsor,@pemail,@pweb,
                                 @pcodsuscriptor,@pc0,@pc1,@pc2,
                                 @pc3,@pc4,@pc5,@pc6,@pc7,@pc8,@pc9,
                                 @prepsticker,@pclapuc,@mfecmovfin,@mfecmovini,
                                 @prepsalmateria,@ptouchnom,@prepconsumo,@pcodequipo,
                                 @pcodsim,@pimppdf,@pf01,@pf03,@pf05,@pf06,@pf07,
                                 @pf08,@pf09,@pf11,@pf12,@pf37,@pf47,@psticvarios,
                                 @psticlist,@pempfact,@pRegImpo,@pPlan,@pSuperin)

		Exec SPG_ActComParametros @pIdemp=@pId --*
		Exec Con_SP_ActParametros @pIdemp=@pId --*
		Exec Ven_SP_ActParametros @pIdemp=@pId --*

		--Descomentarear cuando se halla creado.
		--Exec SPG_ActProParametros @pIdemp=@pId 
		--Exec SPG_ActTraParametros @pIdemp=@pId
		--Exec SPG_ActNomParametros @pIdemp=@pId
	end

	If @pProc=2 and @mExiste='S'
		Update Glb_Empresa
        Set    nomemp=@pNomemp,nitemp=@pNitemp,divemp=@pDivemp,diremp=@pDiremp,
               telemp=@pTelemp,ciuemp=@pCiuemp,geremp=@pGeremp,conemp=@pConemp,
               tipemp=@pTipemp,facemp=@pFacemp,resemp=@pResemp,egremp=@pEgremp,
               cmpart=@pCmpart,calcvta=@pCalcvta,compref=@pCompref,comemp=@pComemp,
               tiremp=@pTiremp,notemp=@pNotemp,cotemp=@pCotemp,delemp=@pDelemp,
               ruta=@pRuta,tipconse=@pTipconse,tipo=@pTipo,valfecha=@pValfecha,
               revisor=@pRevisor,email=@pEmail,web=@pWeb,codsuscriptor=@pCodsuscriptor,
               c0=@pC0,c1=@pC1,c2=@pC2,c3=@pC3,c4=@pC4,c5=@pC5,c6=@pC6,c7=@pC7,c8=@pC8,
               c9=@pC9,repsticker=@pRepsticker,clapuc=@pClapuc,fecmovfin=@mFecmovfin,
               fecmovini=@mFecmovini,repsalmateria=@pRepsalmateria,touchnom=@pTouchnom,
               repconsumo=@pRepconsumo,codequipo=@pCodequipo,codsim=@pCodsim,imppdf=@pImppdf,
               f01=@pF01,f03=@pF03,f05=@pF05,f06=@pF06,f07=@pF07,f08=@pF08,f09=@pF09,f11=@pF11,
               f12=@pF12,f37=@pF37,f47=@pF47,sticvarios=@pSticvarios,sticlist=@pSticlist,
               empfact=@pEmpfact,RegImpo=@pRegImpo,[plan]=@pPlan,superin=@pSuperin
        Where  Id=@pId

	If @pProc=3 and @mExiste='S'
	begin 
		If Exists(Select idemp,codalm From Glb_Almacen Where idemp=@pId)
			begin
				Select @mNerror=57002, @mAddMsg='; Almacen.',@pVerMsgBox=1;
				Throw  @mNerror,@mAddMsg,1;
			end
		Else
			begin
				If LEN(LTRIM(RTRIM(@mAddMsg)))=0
					Delete From Glb_Terceros Where nitter=@pNitemp 
					Delete From Con_Parametros where Idemp=@pId
					Delete From Com_Parametros where Idemp=@pId
					Delete From Ven_Parametros where Idemp=@pId

					--Delete from Pro_Parametros where Idemp=@pId
					--Delete from Tra_Parametros where Idemp=@pId
					--Delete from Nom_Otrdat     where Idemp=@pId 
					Delete From Glb_Empresa Where id=@pId
			end
	end
	Commit 
   
END TRY
Begin Catch
	If @@TRANCOUNT>0
		Rollback

	Set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch 
GO


-- Agregado por Éduar Álvarez - Febrero 26 de 2015.
IF OBJECT_ID('db_SP_NOM_ENTIDAD_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_ENTIDAD_Set
GO
IF OBJECT_ID('SPG_ActEntidades','P') IS NOT NULL DROP PROCEDURE SPG_ActEntidades
GO

CREATE PROCEDURE db_SP_NOM_ENTIDAD_Set
	@codigo		nvarchar(03)='',
	@nombre		nvarchar(40)='',
	@direccion	nvarchar(30)='',
	@ciudad		nvarchar(15)='',
	@telefono	nvarchar(20)='',
	@num_aprob	nvarchar(15)='',
	@proc		int = 0
AS
BEGIN TRY
   Declare @existe char(1), @mNerror int, @mMsg nvarchar(190), @mLinea int, @mAddMsg nvarchar(50), @pVerMsgBox int= 0, @mProc char(20)
   Select @existe ='N'
   Select @mNerror=7021,@mLinea=0,@mAddMsg=''
   Set	  @mProc  ='db_SP_NOM_ENTIDAD_Set'

   if Exists (Select * From nom_entidad Where codi_enti=@codigo)
	Select @existe='S'

   if @proc = 1
		if @existe='N'
			Insert Into nom_entidad (codi_enti,nombre,direccion, ciudad,telefono,num_aprob)
							 Values (@codigo,@nombre,@direccion,@ciudad,@telefono,@num_aprob)
		else
		  begin  
			 Select @mNerror = 57014, @pVerMsgBox = 1;
			 throw @mNerror,@mAddMsg,1
		  end 

   if @proc = 2
		if @existe='S'
			Update nom_entidad 
			   Set nombre=@nombre, direccion=@direccion, ciudad=@ciudad, telefono=@telefono, num_aprob=@num_aprob
			 Where codi_enti=@codigo
		else
			begin  
				Select @mNerror = 57023,@pVerMsgBox = 1;
				Throw @mNerror,@mAddMsg,1
			end

   if @proc = 3
		if @existe='S'
			begin    
				Delete From nom_entidad Where codi_enti=@codigo
			end
		else 
			begin  
				Select @mNerror = 57023,@pVerMsgBox = 1;
				Throw @mNerror,@mAddMsg,1
			end
END TRY

Begin Catch
    Set @mAddMsg = IIF(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox
End Catch
GO

IF OBJECT_ID('SPG_ActErrores','P') IS NOT NULL DROP PROCEDURE SPG_ActErrores
GO

CREATE PROCEDURE SPG_ActErrores
	@pId		int,
	@pNombre	nvarchar(220), 
	@pDetalle	nvarchar(max), 
	@pSug		nvarchar(max)
AS	
BEGIN
   
   if exists(Select ID From glb_error Where id=@pId)	
   Begin
      Update glb_error Set nombre=@pNombre, detalle=@pDetalle, Sug=@pSug
      Where id=@pId
   End
   Else 
   Begin 
      Insert Into glb_error(id,nombre,Sug)Values(@pId,@pNombre,@pSug)
   End  	
END
GO


IF OBJECT_ID('SPG_ActEstados','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActEstados
END
GO
CREATE PROCEDURE SPG_ActEstados
 @codest nvarchar(3) =null,
   @nomest nvarchar(40)=null,
   @proc     int = 0
    
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int =0,
           @mProc   char(20)
   select @existe ='N'
   select @mNerror=7021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActEstados'
   
   if exists (select * from glb_estados where codest=@codest)
      select @existe='S'
   
   if @proc=1
      if @existe='N'
         insert into glb_estados(codest,nomest)values(@codest,@nomest)
     
   if @proc=2 
      if @existe='S'
         update glb_estados set nomest=@nomest where codest=@codest
       
   if @proc=3 
      if @existe='S'
         delete from glb_estados where codest=@codest

END TRY 

Begin catch
   Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO


IF OBJECT_ID('db_SP_NOM_ESTADOS_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_ESTADOS_Set
GO
IF OBJECT_ID('SPG_ActEstados_nom','P') IS NOT NULL DROP PROCEDURE SPG_ActEstados_nom
GO

CREATE PROCEDURE db_SP_NOM_ESTADOS_Set
	@codi_estado nvarchar(3) =null,
	@nombre		 nvarchar(40)=null,
	@proc		 int = 0
AS
BEGIN TRY 
   declare @existe		char(1),
           @mNerror		int,
           @mMsg		nvarchar(190),
           @mLinea		int,
           @mAddMsg		nvarchar(50),
		   @pVerMsgBox	int =0,
           @mProc		char(20)

   select @existe ='N'
   select @mNerror=7021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='db_SP_NOM_ESTADOS_Set'

   if exists (Select * From nom_estados Where codi_estado=@codi_estado)
      select @existe='S'

   if @proc=1
	   if @existe='N'
			 Insert Into nom_estados (codi_estado,nombre) Values(@codi_estado,@nombre)

   if @proc=2 
	   if @existe='S'
			 Update nom_estados Set nombre=@nombre Where codi_estado=@codi_estado

   if @proc=3 
	   if @existe='S'
			Delete From nom_estados Where codi_estado=@codi_estado
END TRY 

Begin Catch
   Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO


IF OBJECT_ID('db_SP_NOM_FESTIVOS_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_FESTIVOS_Set
GO
IF OBJECT_ID('SPG_ActFestivos','P') IS NOT NULL DROP PROCEDURE SPG_ActFestivos
GO

CREATE PROCEDURE db_SP_NOM_FESTIVOS_Set
	@fecha	date,
	@nombre nvarchar(30)='',
	@proc   int = 0
AS
BEGIN TRY
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int= 0,
           @mProc   char(20)

	select @existe ='N'
	select @mNerror=7021,@mLinea=0,@mAddMsg=''
	set @mProc ='db_SP_NOM_FESTIVOS_Set'

	IF EXISTS (Select @fecha From nom_festivos Where fecha=@fecha)
		begin
			if @proc=2
				Update nom_festivos Set nombre=@nombre where fecha=@fecha
			if @proc=3
				Delete From nom_festivos Where fecha=@fecha
		end
	ELSE
		begin
			Insert Into nom_festivos (fecha,nombre) Values (@fecha,@nombre)
		end
END TRY

Begin catch
    Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO


IF OBJECT_ID('SPG_ActHobby','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActHobby
END
GO
CREATE PROCEDURE SPG_ActHobby
@codigo nvarchar(2) =null,
   @nombre nvarchar(30)=null,
   @proc   int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror char(3),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
   select @existe ='N'
   select @mNerror='021',@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_ActHobby' 
   
   if exists (select * from glb_hobby where codigo=@codigo)
      select @existe='S'
   
   
   
   if @proc=1
      if @existe='N'
         insert into glb_hobby(codigo,nombre)values(@codigo,@nombre)
       
     
    
   if @proc=2 
      if @existe='S'
         update glb_hobby set nombre=@nombre where codigo=@codigo
   
   
   if @proc=3 
      if @existe='S'
         delete from glb_hobby where codigo=@codigo

  
END Try 

Begin catch
    set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 
GO

IF OBJECT_ID('SPG_ActInventario','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActInventario
END
GO
CREATE PROCEDURE SPG_ActInventario
	@pIdemp   nvarchar(3)	='',	@pCodcto  nvarchar(3)	='',	@pCodart  nvarchar(10)	='',  
	@pCaninv  float			=0,		@pValprom decimal(14,2)	='',    @pUcoart  decimal(14,2)	='',  
	@pPvdart  decimal(14,2)	=0,		@pPveart  decimal(14,2)	=0,		@pPvmart  decimal(14,2)	=0,  
	@pPvcart  decimal(14,2)	=0,		@pPvaart  decimal(14,2)	=0,		@pPvbart  decimal(14,2)	=0,  
	@pMinart  decimal(14,0)	=0,		@pMaxart  decimal(14,0)	=0,		@pUtcart  decimal(10,3)	=0,  
	@pUtdart  decimal(10,3)	=0,		@pUteart  decimal(10,3)	=0,		@pFrainv  decimal(12,2)	=0,  
	@pQtyfra  decimal(12,2)	=0,		@pUcompra nvarchar(10)	='',	@pUnumfac nvarchar(10)	='',  
	@pMaxdcto decimal(14,2)	=0,		@pIvaArtCto	decimal(6,2)=0,		@pOtrGas  decimal(14,2) =0	
AS
BEGIN TRY
   Declare @mExiste char(1), 
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
		   @mUcompra date,
           @mProc   char(20)
   
   Select @mExiste ='N', @mNerror=57021,@mLinea=0, @mProc  ='SPG_ActInventario',@mAddMsg='',
          @mUcompra = convert(date,@pUcompra)
   
   If Exists (SELECT Idemp,Codcto,codart FROM alm_inventario WHERE idemp=@pIdemp and codcto=@pCodcto and codart=@pCodart)
      set @mExiste ='S'
   
   If @mExiste='S' 
   Begin 
      Update	alm_inventario 
	  Set		valprom	= @pValprom,	ucoart	= @pUcoart,		pvdart	= @pPvdart,	pveart	= @pPveart,
				pvcart	= @pPvcart,		pvaart	= @pPvaart,		pvbart	= @pPvbart,	minart	= @pMinart,
				maxart	= @pMaxart,		IvaArtCto=@pIvaArtCto,  ucompra = @mUcompra, unumfac=@pUnumfac,
				otrgas	= @pOtrgas	 
      Where		idemp=@pIdemp And codcto=@pCodcto And codart=@pCodart 
 
   End 
   Else 
   Begin 
      If @mExiste ='N' 
		insert into alm_inventario
			(idemp,codcto, codart, caninv, valprom, ucoart, pvdart, pveart, pvmart, pvcart, pvaart, pvbart, 
			 minart, maxart, utcart, utdart, uteart, frainv, qtyfra, ucompra, unumfac, maxdcto, IvaArtCto,otrgas)
		values(@pIdemp, @pCodcto, @pCodart, @pCaninv, @pValprom, @pUcoart, @pPvdart, @pPveart, @pPvmart, @pPvcart, @pPvaart, @pPvbart,
			   @pMinart, @pMaxart, @pUtcart, @pUtdart, @pUteart, @pFrainv, @pQtyfra, @mUcompra, @pUnumfac, @pMaxdcto, @pIvaArtCto,@pOtrGas)   
   End 
End TRY
Begin Catch
   Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch  
GO

-- Modificado por Éduar Álvarez - Agosto 12 de 2015.
IF OBJECT_ID('SPG_Actinvfisicos','P') IS NOT NULL	DROP PROCEDURE SPG_Actinvfisicos
GO
CREATE PROCEDURE SPG_Actinvfisicos
	@pIdinvfisicos	int,				@pIdemp		nvarchar(3),		@pCodcto	nvarchar(3),
	@pFecinv		datetime,			@pMesinv    decimal(2,0),		@pAñoinv	decimal(4,0),
	@pDetinv		nvarchar(max)='',	@pProcinv   bit,				@pIdusu		nvarchar(10),
	@pDetinvtalla	nvarchar(max)='',	@pCodgru	nvarchar(3),		@pCodter	nvarchar(15),
	@pCodlin		nvarchar(4),		@pCodmar	nvarchar(3),		@pTipo		decimal(1,0),
	@pDetserial		nvarchar(max)='',	@pEstado	Char(1)=''
AS
BEGIN TRY
	Declare @mNerror char(3),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
           @mProc   char(20)

	Select @mNerror='021',@mLinea=0,@mAddMsg='' 
	Set @mProc  ='SPG_Actinvfisicos'

	If Not Exists (Select Idinvfisicos From Alm_InvFisicos Where Idinvfisicos=@pIdinvfisicos AND idemp=@pIdemp) OR @pIdinvfisicos=0
		Insert Into Alm_InvFisicos (idemp, codcto, fecinv, mesinv, añoinv, detinv, procinv, idusu,  detinvtalla, 
									codgru, codter, codlin, codmar, tipo, detserial, estado)
                            Values (@pIdemp,@pCodcto,@pFecinv,@pMesinv,@pAñoinv,@pDetinv,@pProcinv,@pIdusu,@pDetinvtalla,
									@pCodgru,@pCodter,@pCodlin,@pCodmar,@pTipo,@pDetserial,@pEstado)
	Else 
		Update	Alm_InvFisicos
		   Set	idemp=@pIdemp,codcto=@pCodcto,fecinv=@pFecinv,mesinv=@pMesinv,añoinv=@pAñoinv,detinv=@pDetinv,procinv=@pProcinv,idusu=@pIdusu,detinvtalla=@pDetinvtalla,
				codgru=@pCodgru,codter=@pCodter,codlin=@pCodlin,codmar=@pCodmar,tipo=@pTipo,detserial=@pDetserial,estado=@pEstado
		 Where  Idinvfisicos=@pIdinvfisicos

	If @@ERROR=0 
	Begin 		
		Set @mMsg=(Select m.Mensaje+@mAddMsg From Glb_Mensaje m Where m.id=@mNerror)
		Exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
	End   

END TRY

Begin Catch
	Exec sp_MensajeSql
End Catch 
GO


IF OBJECT_ID('SPG_ActLabores','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActLabores
END
GO
CREATE PROCEDURE SPG_ActLabores
 @codigo nvarchar(2) =null,
   @nombre nvarchar(30)=null,
   @proc   int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
   select @existe ='N',@mNerror=7021,@mLinea=0,@mAddMsg='',@mProc  ='SPG_ActLabores'
   
   
   if exists (select * from glb_labores where codigo=@codigo)
      select @existe='S'
   
   
   
   if @proc=1
      if @existe='N'
         insert into glb_labores(codigo,nombre)values(@codigo,@nombre)
      
    
   if @proc=2 
      if @existe='S'
        update glb_labores set nombre=@nombre where codigo=@codigo
     
   
   if @proc=3 
      if @existe='S'
         delete from glb_labores where codigo=@codigo
     
END Try 

Begin catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 

GO



IF OBJECT_ID('SPG_ActMenu','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActMenu
END
GO
CREATE PROCEDURE SPG_ActMenu
	@pnomfor nvarchar(20), @pmodulo nvarchar(2),  @pcodigo decimal(3,0),
	@pdesopc nvarchar(60), @ppadre decimal(10,0), @parcdll nvarchar(25),
	@ptipopc decimal(1,0)
AS
Begin
   if Exists (Select codigo 
              From   glb_menu 
              Where  nomfor=@pnomfor AND modulo=@pmodulo AND codigo=@pcodigo)
	   begin
		  Update glb_menu
		  Set    desopc=@pdesopc, padre=@ppadre, arcdll=@parcdll, tipopc=@ptipopc
		  Where  nomfor=@pnomfor AND modulo=@pmodulo AND codigo=@pcodigo
	   end
   Else
	   begin
		  Insert Into glb_menu (nomfor, modulo, codigo, desopc, padre, arcdll, tipopc)
						Values (@pnomfor, @pmodulo, @pcodigo, @pdesopc, @ppadre, @parcdll, @ptipopc)
	   end            
End 
GO



IF OBJECT_ID('SPG_ActNiveles','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActNiveles
END
GO
CREATE PROCEDURE SPG_ActNiveles
@codigo nvarchar(2) ='',
   @nombre nvarchar(30)='',
   @proc   int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
   select @existe ='N',@mNerror=7021,@mLinea=0,@mAddMsg='',@mProc  ='SPG_ActNiveles' 
   
   If exists (select * from glb_niveles where codigo=@codigo)
      select @existe='S'
    
   if @proc=1
      if @existe='N'
         insert into glb_niveles(codigo,nombre)values(@codigo,@nombre)
     
   If @proc=2 
      If @existe='S'
         update glb_niveles set nombre=@nombre where codigo=@codigo
     
   If @proc=3 
      If @existe='S'
         delete from glb_niveles where codigo=@codigo
END TRY

Begin Catch
   Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 
GO


-- Modificado por Éduar Álvarez - Febrero 27 de 2015.
IF OBJECT_ID('SPG_ActNomControlcierre','P')		IS NOT NULL DROP PROCEDURE SPG_ActNomControlcierre
GO
IF OBJECT_ID('db_SP_NOM_CONTROLCIERRE_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_CONTROLCIERRE_Set
GO

CREATE PROCEDURE db_SP_NOM_CONTROLCIERRE_Set
	@año	   int=0,		@mes	 char(2)='',	@codi_sec nvarchar(6)='',	@idemp nchar(6)='',
	@dev01	   bit=0,		@dev02	 bit=0,			@qui01	  bit=0,			@qui02 bit=0,
	@provision bit=0,		@aportes bit=0
AS
BEGIN TRY
	Declare @mMsg nvarchar(190), @mAddMsg nvarchar(50), @pVerMsg int=0, @mProc char(30), @añoNext Numeric(4), @mesNext Char(2)
	Select @mAddMsg='', @mProc='db_SP_NOM_CONTROLCIERRE_Set'
	SET @añoNext = @año + 1
	SET @mesNext = RIGHT('00'+CONVERT(varchar(2),CONVERT(numeric,@mes)+1),2)

	If NOT EXISTS (Select mes From Nom_Controlcierre Where año=@año AND mes=@mes AND codi_sec=@codi_sec AND idemp=@idemp)
		Insert Into Nom_Controlcierre (año, mes, codi_sec, idemp, qui01, qui02, dev01, dev02, provision, aportes) Values (@año, @mes, @codi_sec, @idemp, 0, 0, 0, 0, 0, 0)

	Update Nom_Controlcierre Set dev01=@dev01, dev02=@dev02, qui01=@qui01, qui02=@qui02, provision=@provision, aportes=@aportes 
	Where año=@año AND mes=@mes AND codi_sec=@codi_sec AND idemp=@idemp

	If @mes='12'
		begin
		If NOT EXISTS (Select mes From Nom_Controlcierre Where año=@añoNext AND mes='01' AND codi_sec=@codi_sec AND idemp=@idemp) AND @qui01 = 1 AND @qui02 = 1
			Insert Into Nom_Controlcierre (año, mes, codi_sec, idemp, qui01, qui02, dev01, dev02, provision, aportes) Values (@añoNext, '01', @codi_sec, @idemp, 0, 0, 0, 0, 0, 0)
		end
	Else
		begin
		If NOT EXISTS (Select mes From Nom_Controlcierre Where año=@año AND mes=@mesNext AND codi_sec=@codi_sec AND idemp=@idemp) AND @qui01 = 1 AND @qui02 = 1
			Insert Into Nom_Controlcierre (año, mes, codi_sec, idemp, qui01, qui02, dev01, dev02, provision, aportes) Values (@año, @mesNext, @codi_sec, @idemp, 0, 0, 0, 0, 0, 0)
		end
		delete from nom_controlcierre where idemp is NULL
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO


-- Modificado por Éduar Álvarez - Marzo 5 de 2015.
IF OBJECT_ID('SPG_ActNomlabores','P')	  IS NOT NULL DROP PROCEDURE SPG_ActNomlabores
GO
IF OBJECT_ID('db_SP_NOM_LABORES_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_LABORES_Set
GO

CREATE PROCEDURE db_SP_NOM_LABORES_Set	@codigo		nvarchar (2),
										@nombre		nvarchar (30),
										@tipo		decimal,
										@alarmbc	decimal,
										@alarmdias	decimal,
										@alarmfc	decimal,
										@alarmvence bit,
										@diasvigen	decimal,
										@rutaplani	nvarchar (100),
										@servicio	bit,
										@proc		int = 0
AS
BEGIN TRY
	Declare @existe	 char(1),
			@mNerror int=0,
			@mMsg    nvarchar(190),
			@mLinea  int=0,
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc   char(20)
	Select @existe ='N', @mNerror=7021,@mLinea=0,@mAddMsg='' 
	Set @mProc ='db_SP_NOM_LABORES_Set'
  
	If Exists (Select * From nom_labores Where codigo=@codigo)
		Select @existe='S'

	If @proc=1
		If @existe='N'
			begin
			Insert Into nom_labores (codigo
									,nombre
									,tipo
									,alarmdias
									,alarmbc
									,alarmfc
									,alarmvence
									,diasvigen
									,rutaplani
									,servicio)
							 Values (@codigo
									,@nombre
									,@tipo
									,@alarmdias
									,@alarmbc
									,@alarmfc
									,@alarmvence
									,@diasvigen
									,@rutaplani
									,@servicio)
			end
	If @proc=2
		If @existe='S'
			Update nom_labores Set codigo	  = @codigo
								  ,nombre	  = @nombre
								  ,tipo		  = @tipo
								  ,alarmdias  = @alarmdias
								  ,alarmbc	  = @alarmbc
								  ,alarmfc	  = @alarmfc
								  ,alarmvence = @alarmvence
								  ,diasvigen  = @diasvigen
								  ,rutaplani  = @rutaplani
								  ,servicio	  = @servicio
		Where codigo=@codigo

   If @proc=3
		If @existe='S'
			Delete From nom_labores Where codigo=@codigo
END TRY

Begin Catch
   Set @mAddMsg = IIF(ERROR_PROCEDURE() Is Null, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch 
GO


IF OBJECT_ID('db_SP_NOM_OTRDAT_Set','P') IS NOT NULL	
	DROP PROCEDURE db_SP_NOM_OTRDAT_Set
GO
IF OBJECT_ID('SPG_ActNomotrdat','P') IS NOT NULL		
	DROP PROCEDURE SPG_ActNomotrdat
GO

CREATE PROCEDURE db_SP_NOM_OTRDAT_Set
@direccion	 nvarchar (40)='',	@telefono	nvarchar (15)='',	@ciudad		 nvarchar (30)='',	@codprima	nvarchar (4)='',
@codcesan	 nvarchar (4)='',	@codinter	nvarchar (4)='',	@codvacac	 nvarchar (4)='',	@codiextras	nvarchar (4)='',
@coddiat	 nvarchar (4)='',	@codsubt	nvarchar (4)='',	@codpension	 nvarchar (4)='',	@codsalud	nvarchar (4)='',
@codindem	 nvarchar (4)='',	@subtrans	decimal  (14,2)=0,	@anoproc	 nvarchar (4)='',	@codsancion	nvarchar (4)='',
@codsolid	 nvarchar (4)='',	@codsindi	nvarchar (4)='',	@salminimo	 decimal  (14,2)=0,	@retesueldo	nvarchar (4)='',
@embalim	 nvarchar (4)='',	@embcomer	nvarchar (4)='',	@auxcuoman	 decimal  (14,2)=0,	@ahofondo	nvarchar (4)='',
@sena		 decimal  (5,2)=0,	@icbf		decimal  (5,2)=0,	@jef_bien	 nvarchar (40)='',	@ctasueldo	nvarchar (8)='',
@salude		 decimal  (5,2)=0,	@saludp		decimal  (5,2)=0,	@pensione	 decimal  (5,3)=0,	@pensionp	decimal  (5,3)=0,
@solie		 decimal  (5,3)=0,	@solip		decimal  (5,3)=0,	@arp		 decimal  (5,3)=0,	@nit		nvarchar (12)='',
@comfamiliar decimal  (5,2)=0,	@corte1		decimal  (2,0)=0,	@corte2		 decimal  (2,0)=0,	@año		decimal  (4,0)=0,
@codincap	 nvarchar (4)='',	@tipocorte	decimal  (1,0)=0,	@cansub		 decimal  (1,0)=0,	@repnom		nvarchar (50)='',
@codarp		 nvarchar (4)='',	@codccf		nvarchar (4)='',	@liqprima	 bit = 0,			@codfes		nvarchar (4)='',
@codhed		 nvarchar (4)='',	@codhedf	nvarchar (4)='',	@codhen		 nvarchar (4)='',	@codhenf	nvarchar (4)='',
@codrec		 nvarchar (4)='',	@codrecf	nvarchar (4)='',	@codinca	 nvarchar (4)='',	@codinca2	nvarchar (4)='',
@repnom1	 nvarchar (30)='',	@codant		nvarchar (4)='',	@reccant	 bit = 0,			@rutcontab	nvarchar (100)='',
@manejadia	 bit = 0,			@nosalmini	bit = 0,			@transfijas	 bit = 0,			@recalcular	bit = 0,
@notaing	 nvarchar (MAX)='',	@consec		decimal  (10,0)=0,	@firmadoc	 nvarchar (MAX)='',	@leyenvaca	bit = 0,
@recalprest	 bit = 0,			@cxppresta	bit = 0,			@ctaxpagar	 nvarchar (8)='',	@ctapresta	nvarchar (8)='',
@cxcprest	bit = 0,			@ctaxcbD	 nvarchar (8)='',	@ctaxcbC	nvarchar (8)='',
@transpres	 nvarchar (2)='',	@idemp		nvarchar (3)='',	@mesesprom	 numeric  (4)=0,	@mesescesan	numeric  (4)=0,	-- Éduar.
@codprimvac	 nvarchar (4)='',	@ctaconduc	nvarchar (8)='',	@conliqprim  bit = 0,			@ctapagvac	nvarchar (8)='',
@salminin	 numeric  (2)=0,	@liqcesmin	bit = 0,			@perliqprim  bit = 0,			@primavaca	bit = 0,
@liqvacadia	 bit = 0,			@vacdomingo bit = 0,			@ctacrliqprm nvarchar (8)='',	@tipdocpres	 nvarchar (2)='',
@tipdocrc	 nvarchar (50)='',	@tipdocxc	nvarchar (50)='',	@tipdocxp	nvarchar (50)='',	@pagparfis	 bit = 0,
@cajaxcen	 bit = 0,			@VacLiqCon   bit = 0,			@TipDocNC	nVarchar(2)='',		@calcdiaMes	 bit=0, 
@calcdiafecha bit =0,			@ConcepCxc	 Bit=0,				@codIntereses nVarchar(8)='',	@bancos		 bit =0,
@smtp		nvarchar(100)='',	@correo		nvarchar(100)='',	@password	nvarchar(100)='',	@Rounplanilla bit= 0

AS 
BEGIN TRY 
	declare @mExiste char(1),
			@mMsg	 nvarchar(190),
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc	 char(20)

	Select @mExiste='N', @mAddMsg='', @mProc='db_SP_NOM_OTRDAT_Set'

	If Exists (Select Idemp From nom_otrdat Where Idemp=@idemp)
		begin
			Update nom_otrdat
			   Set	 direccion	 = @direccion
					,telefono	 = @telefono
					,ciudad		 = @ciudad
					,codprima	 = @codprima
					,codcesan	 = @codcesan
					,codinter	 = @codinter
					,codvacac	 = @codvacac
					,codiextras	 = @codiextras
					,coddiat	 = @coddiat
					,codsubt	 = @codsubt
					,codpension	 = @codpension
					,codsalud	 = @codsalud
					,codindem	 = @codindem
					,subtrans	 = @subtrans
					,anoproc	 = @anoproc
					,codsancion	 = @codsancion
					,codsolid	 = @codsolid
					,codsindi	 = @codsindi
					,salminimo	 = @salminimo
					,retesueldo	 = @retesueldo
					,embalim	 = @embalim
					,embcomer	 = @embcomer
					,auxcuoman	 = @auxcuoman
					,ahofondo	 = @ahofondo
					,sena		 = @sena
					,icbf		 = @icbf
					,jef_bien	 = @jef_bien
					,ctasueldo	 = @ctasueldo
					,salude		 = @salude
					,saludp		 = @saludp
					,pensione	 = @pensione
					,pensionp	 = @pensionp
					,solie		 = @solie
					,solip		 = @solip
					,arp		 = @arp
					,nit		 = @nit
					,comfamiliar = @comfamiliar
					,corte1		 = @corte1
					,corte2		 = @corte2
					,año		 = @año
					,codincap	 = @codincap
					,tipocorte	 = @tipocorte
					,cansub		 = @cansub
					,repnom		 = @repnom
					,codarp		 = @codarp
					,codccf		 = @codccf
					,liqprima	 = @liqprima
					,codfes		 = @codfes
					,codhed		 = @codhed
					,codhedf	 = @codhedf
					,codhen		 = @codhen
					,codhenf	 = @codhenf
					,codrec		 = @codrec
					,codrecf	 = @codrecf
					,codinca	 = @codinca
					,codinca2	 = @codinca2
					,repnom1	 = @repnom1
					,codant		 = @codant
					,reccant	 = @reccant
					,rutcontab	 = @rutcontab
					,manejadia	 = @manejadia
					,nosalmini	 = @nosalmini
					,transfijas	 = @transfijas
					,recalcular	 = @recalcular
					,notaing	 = @notaing
					,consec		 = @consec
					,firmadoc	 = @firmadoc
					,leyenvaca	 = @leyenvaca
					,recalprest	 = @recalprest
					,cxppresta	 = @cxppresta
					,ctaxpagar	 = @ctaxpagar
					,ctapresta	 = @ctapresta
					,cxcprest	 = @cxcprest
					,ctaxcbD	 = @ctaxcbD
					,ctaxcbC	 = @ctaxcbC
					,transpres	 = @transpres
					,mesesprom	 = @mesesprom		-- Ini: Éduar.
					,mesescesan  = @mesescesan
					,codprimvac  = @codprimvac
					,ctaconduc	 = @ctaconduc
					,conliqprim  = @conliqprim
					,ctapagvac	 = @ctapagvac
					,salminin	 = @salminin
					,liqcesmin	 = @liqcesmin
					,perliqprim	 = @perliqprim
					,primavaca	 = @primavaca
					,liqvacadia	 = @liqvacadia
					,vacdomingo	 = @vacdomingo
					,ctacrliqprm = @ctacrliqprm
					,tipdocpres	 = @tipdocpres
					,tipdocrc	 = @tipdocrc
					,tipdocxc	 = @tipdocxc
					,tipdocxp	 = @tipdocxp
					,pagparfis	 = @pagparfis
					,cajaxcen	 = @cajaxcen
					,VacLiqCon	 = @VacLiqCon 
					,TipDocNC	 =@TipDocNC
					,calcdiaMes	 =@calcdiaMes
					,calcdiafecha=@calcdiafecha
					,Concepcxc	 =@ConcepCxc
					,codintereses=@codIntereses
					,bancos      =@bancos
					,smtp		 =@smtp
					,correo		 =@correo
					,password1	 =dbo.fnColocaClave(@password)
					,Rounplanilla=@Rounplanilla
		  Where Idemp=@Idemp
		end 
	Else 
		begin 
		Insert Into nom_otrdat
				   (direccion
					,telefono
					,ciudad
					,codprima
					,codcesan
					,codinter
					,codvacac
					,codiextras
					,coddiat
					,codsubt
					,codpension
					,codsalud
					,codindem
					,subtrans
					,anoproc
					,codsancion
					,codsolid
					,codsindi
					,salminimo
					,retesueldo
					,embalim
					,embcomer
					,auxcuoman
					,ahofondo
					,sena
					,icbf
					,jef_bien
					,ctasueldo
					,salude
					,saludp
					,pensione
					,pensionp
					,solie
					,solip
					,arp
					,nit
					,comfamiliar
					,corte1
					,corte2
					,año
					,codincap
					,tipocorte
					,cansub
					,repnom
					,codarp
					,codccf
					,liqprima
					,codfes
					,codhed
					,codhedf
					,codhen
					,codhenf
					,codrec
					,codrecf
					,codinca
					,codinca2
					,repnom1
					,codant
					,reccant
					,rutcontab
					,manejadia
					,nosalmini
					,transfijas
					,recalcular
					,notaing
					,consec
					,firmadoc
					,leyenvaca
					,recalprest
					,cxppresta
					,ctaxpagar
					,ctapresta
					,cxcprest
					,ctaxcbC
					,ctaxcbD
					,transpres
					,idemp
					,mesesprom
					,mesescesan
					,codprimvac		-- Ini: Agregados por Éduar Álvarez.
					,ctaconduc
					,conliqprim
					,ctapagvac
					,salminin
					,liqcesmin
					,perliqprim
					,primavaca
					,liqvacadia
					,vacdomingo
					,ctacrliqprm
					,tipdocpres
					,tipdocrc
					,tipdocxc
					,tipdocxp
					,pagparfis
					,cajaxcen	
					,VacLiqCon		
					,TipDocNC
					,calcdiaMes	
					,calcdiafecha	
					,Concepcxc
					,codintereses
					,bancos
					,smtp
					,correo
					,password1
					,Rounplanilla
		  )
		  Values   ( @direccion
					,@telefono
					,@ciudad
					,@codprima
					,@codcesan
					,@codinter
					,@codvacac
					,@codiextras
					,@coddiat
					,@codsubt
					,@codpension
					,@codsalud
					,@codindem
					,@subtrans
					,@anoproc
					,@codsancion
					,@codsolid
					,@codsindi
					,@salminimo
					,@retesueldo
					,@embalim
					,@embcomer
					,@auxcuoman
					,@ahofondo
					,@sena
					,@icbf
					,@jef_bien
					,@ctasueldo
					,@salude
					,@saludp
					,@pensione
					,@pensionp
					,@solie
					,@solip
					,@arp
					,@nit
					,@comfamiliar
					,@corte1
					,@corte2
					,@año
					,@codincap
					,@tipocorte
					,@cansub
					,@repnom
					,@codarp
					,@codccf
					,@liqprima
					,@codfes
					,@codhed
					,@codhedf
					,@codhen
					,@codhenf
					,@codrec
					,@codrecf
					,@codinca
					,@codinca2
					,@repnom1
					,@codant
					,@reccant
					,@rutcontab
					,@manejadia
					,@nosalmini
					,@transfijas
					,@recalcular
					,@notaing
					,@consec
					,@firmadoc
					,@leyenvaca
					,@recalprest
					,@cxppresta
					,@ctaxpagar
					,@ctapresta
					,@cxcprest
					,@ctaxcbD
					,@ctaxcbC
					,@transpres
					,@idemp
					,@mesesprom
					,@mesescesan
					,@codprimvac		-- Ini: Agregados por Éduar Álvarez.
					,@ctaconduc
					,@conliqprim
					,@ctapagvac
					,@salminin
					,@liqcesmin
					,@perliqprim
					,@primavaca
					,@liqvacadia
					,@vacdomingo
					,@ctacrliqprm
					,@tipdocpres
					,@tipdocrc
					,@tipdocxc
					,@tipdocxp
					,@pagparfis
					,@cajaxcen		
					,@VacLiqCon
					,@tipdocNC 
					,@calcdiaMes	
					,@calcdiafecha	
					,@ConcepCxc
					,@codIntereses
					,@bancos
					,@smtp
					,@correo
					,dbo.fnColocaClave(@password)
					,@Rounplanilla
			)
	   End  
END TRY
Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch 
GO



-- Modificado por Éduar Álvarez - Marzo 4 de 2015.
IF OBJECT_ID('SPG_ActNomtarifas','P')	  IS NOT NULL DROP PROCEDURE SPG_ActNomtarifas
GO
IF OBJECT_ID('db_SP_NOM_TARIFAS_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_TARIFAS_Set
GO

CREATE PROCEDURE db_SP_NOM_TARIFAS_Set 
	@tran_codi  nvarchar (4),
	@codi_emple	nvarchar (4),
	@proc Int
AS
BEGIN TRY 
	Declare	@mMsg    nvarchar(190),
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc   char(25)

	Select @mAddMsg=''
	Set @mProc ='db_SP_NOM_TARIFAS_Set'

If Exists (Select tran_codi From Nom_Tarifas Where codi_emple=@codi_emple AND tran_codi = @tran_codi)
	begin	
		If @proc = 3
		BEGIN
		Delete From Nom_Tarifas Where codi_emple = @codi_emple  AND tran_codi = @tran_codi
		END

				Update Nom_Tarifas
				Set    tran_codi = @tran_codi, codi_emple=@codi_emple
				Where  codi_emple = @codi_emple  AND tran_codi = @tran_codi
	END
	else
	begin
	Insert Into nom_tarifas (tran_codi, codi_emple) Values (@tran_codi,@codi_emple)

	END

END TRY 
Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch 
GO



IF OBJECT_ID('SPG_ActPerfil','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActPerfil
END
GO
CREATE PROCEDURE SPG_ActPerfil
 @pIdemp  nvarchar(3), @pCodper  nvarchar(3), @pNomfor nvarchar(60),
  @pAccfor bit=0,       @pNuefor  bit=0,       @pModfor bit=0,
  @pElifor bit=0,       @pImpfor  bit=0,       @pEntinv bit=0,
  @pSalinv bit=0,       @pTrasinv bit=0 	
AS
BEGIN

   If exists(Select codper From glb_accesos 
             Where idemp =@pIdemp and codper = @pCodper and nomfor =@pNomfor)
      Update glb_accesos Set accfor=@pAccfor, nuefor=@pNuefor, modfor=@pModfor, elifor=@pElifor, 
             impfor=@pImpfor, entinv=@pEntinv, salinv=@pSalinv, trasinv=@pTrasinv 
      Where  idemp =@pIdemp and codper = @pCodper and nomfor =@pNomfor
   Else 
      Insert into glb_accesos(idemp, codper, nomfor, accfor, nuefor, modfor, 
                              elifor, impfor, entinv, salinv, trasinv)
                       Values(@pIdemp ,@pCodper, @pnomfor, @pAccfor, @pNuefor, @pModfor, 
                              @pElifor, @pImpfor, @pEntinv, @pSalinv, @pTrasinv)               
   
END
GO


IF OBJECT_ID('SPG_ActPerfiles','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActPerfiles
END
GO
CREATE PROCEDURE SPG_ActPerfiles
  @codper nvarchar(3) =null,
   @nomper nvarchar(30)=null,
   @tipper decimal (9,0)=0, 
   @proc   int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
   select @existe ='N',@mNerror=7021,@mLinea=0,@mAddMsg='',@mProc  ='SPG_ActLabores'
   
   
   if exists (select * from glb_perfiles  where codper =@codper)
      select @existe='S'
   
   
   
   if @proc=1
      if @existe='N'
         insert into glb_perfiles (codper ,nomper,tipper )values(@codper ,@nomper,@tipper)
      
    
   if @proc=2 
      if @existe='S'
        update glb_perfiles  set nomper=@nomper,tipper = @tipper 
        where codper=@codper
     
   
   if @proc=3 
      if @existe='S'
         delete from glb_perfiles where codper=@codper
     
END Try 

Begin catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 
GO


IF OBJECT_ID('SPG_ActPrecios','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActPrecios
END
GO
CREATE PROCEDURE SPG_ActPrecios
	@pIdemp		char(3),			@pCodcto	char(3),			@pCodart	nvarchar(10),  
	@pPveArt	decimal(14,2),		@pPvaArt	decimal(14,2),		@pPvbArt	decimal(14,2),	
	@pPvdArt	decimal(14,2),		@pPvcArt	decimal(14,2),		@pValprom	decimal(14,2),
	@pTodos		bit=0,				@pInvDia	bit
AS
BEGIN
	Declare @mCad nvarchar(max),@mCond nvarchar(90)
   
	If @pTodos=1
		Set @mCond =' and codart= @pCodart '
	Else
		Set @mCond =' and codcto= @pCodcto and codart= @pCodart'
   
	Set @mCad = 'Update alm_inventario
				 Set	PveArt=@pPveArt ,PvaArt=@pPvaArt ,pvbArt=@ppvbArt ,
						PvdArt=@pPvdArt ,PvcArt=@pPvcArt ,valprom=@pvalprom,  invdia = @pInvDia 
				Where  idemp=@pIdemp '+ @mCond 

	EXEC sp_executesql	@mCad, N'@pIdemp char(3), @pCodcto	char(3), @pCodart	nvarchar(10), @pPveArt	decimal(14,2),	@pPvaArt decimal(14,2),	@pPvbArt decimal(14,2),	
		@pPvdArt decimal(14,2),	@pPvcArt	decimal(14,2),	@pValprom	decimal(14,2),@pTodos	bit, @pInvDia	bit',
		@pIdemp=@pIdemp, @pCodcto=@pCodcto, @pCodart=@pCodart, @pPveArt=@pPveArt,	@pPvaArt=@pPvaArt,	@pPvbArt=@pPvbArt, @pPvdArt=@pPvdArt, @pPvcArt=@pPvcArt,	
		@pValprom=@pValprom, @pTodos=@pTodos, @pInvDia=@pInvDia
END
GO

-- Modificado por Éduar Álvarez - Febrero 27 de 2015.
IF OBJECT_ID('SPG_ActProfesion','P')		IS NOT NULL	DROP PROCEDURE SPG_ActProfesion
GO
IF OBJECT_ID('db_SP_GLB_PROFESION_Set','P') IS NOT NULL DROP PROCEDURE db_SP_GLB_PROFESION_Set
GO

CREATE PROCEDURE db_SP_GLB_PROFESION_Set @codi_prof nvarchar(2), @titulo nvarchar(60)='', @nivel_educ nvarchar(4)='', @proc	int=0
AS
BEGIN TRY
	Declare @existe		char(1),
			@mAddMsg	nvarchar(50),
			@pVerMsg	int=0,
			@mProc		char(20)

	Select @existe='N', @mAddMsg='', @mProc='db_SP_GLB_PROFESION_Set'

	if Exists (Select codi_prof From Glb_Profesion Where codi_prof=@codi_prof) Set @existe='S'

	if @proc = 1
		if @existe='N' Insert Into Glb_Profesion (codi_prof,titulo,nivel_educ) Values (@codi_prof,@titulo,@nivel_educ)

	if @proc = 2
		if @existe='S' Update Glb_Profesion Set titulo=@titulo, nivel_educ=@nivel_educ Where codi_prof=@codi_prof

	if @proc = 3
		if @existe='S' Delete From Glb_Profesion Where codi_prof=@codi_prof

END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO



-- Modificado por Éduar Álvarez - Marzo 3 de 2015.
IF OBJECT_ID('SPG_ActSeccion','P')		  IS NOT NULL DROP PROCEDURE SPG_ActSeccion
GO
IF OBJECT_ID('db_SP_NOM_SECCION_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_SECCION_Set
GO

CREATE PROCEDURE db_SP_NOM_SECCION_Set
@codi_sec	nvarchar (3)='',	@nombre		  nvarchar (70)='',	@tasa_ces	decimal  (5,2)=0,	@tasa_ints	  decimal  (5,2)=0,
@tasa_vac	decimal  (5,2)=0,	@tasa_prima	  decimal  (5,2)=0,	@tasa_dotac decimal  (5,2)=0,	@tasa_arp	  decimal  (5,3)=0,
@tasa_fondo	decimal  (5,3)=0,	@tasa_eps	  decimal  (5,3)=0,	@dias_base	decimal  (3,0)=0,	@ctacesd	  nvarchar (8)='',
@ctacesc	nvarchar (8)='',	@ctaintd	  nvarchar (8)='',	@ctaintc	nvarchar (8)='',	@ctavacd	  nvarchar (8)='',
@ctavacc	nvarchar (8)='',	@ctaprid	  varchar  (8)='',	@ctapric	nvarchar (8)='',	@ctaepsd	  nvarchar (8)='',
@ctaepsc	nvarchar (8)='',	@ctafond	  nvarchar (8)='',	@ctafonc	nvarchar (8)='',	@ctaarpd	  nvarchar (8)='',
@ctaarpc	nvarchar (8)='',	@ctasena	  nvarchar (8)='',	@ctacaja	nvarchar (8)='',	@ctaicbf	  nvarchar (8)='',
@ctaaporte	nvarchar (8)='',	@ctavacacon	  nvarchar (8)='',	@ctaintcon	nvarchar (8)='',	@ctacescon	  nvarchar (8)='',
@ctaprimcon	nvarchar (8)='',	@tipliq		  decimal  (1)=0,	@corte1		decimal	 (2)=0,		@corte2		  decimal  (2)=0,
@perliq		decimal	 (1)=0,		@codenti	  nvarchar (15)='', @tiponov	nvarchar (4)='',	@ctasueldo	  nvarchar (8)='',
@nitcta		nvarchar (1)='',	@nitcesantias decimal  (1)=0,	@codicbf	nvarchar (15)='',	@codccf		  nvarchar (15)='',
@niteps		decimal	 (1)=0,		@nitpension	  decimal  (1)=0,	@nitarp		decimal	 (1)=0,		@nitarlcr	  nvarchar (1)='',
@nitarldb 	nvarchar (1)='',	@nitcescr 	  nvarchar (1)='',	@nitcesdb 	nvarchar (1)='',	@nitepscr	  nvarchar (1)='',
@nitepsdb 	nvarchar (1)='',	@nitpencr 	  nvarchar (1)='',	@nitpendb 	nvarchar (1)='',	@nitprimcr	  nvarchar (1)='',
@nitprimdb 	nvarchar (1)='',	@nitvaccr 	  nvarchar (1)='',	@nitvacdb	nvarchar (1)='',	@idemp		  nchar    (3)='',
@proc		int

AS
BEGIN TRY 
	Declare @existe char(1), @mMsg nvarchar(190), @mLinea int, @mAddMsg nvarchar(50), @mProc char(30), @pVerMsg int=0

	Select @existe='N', @mLinea=0, @mAddMsg='',@mProc = 'db_SP_NOM_SECCION_Set'
   
	If Exists (Select codi_sec,nombre from nom_seccion where codi_sec=@codi_sec)
		Select @existe='S'

	If @proc = 1
	begin 
		If @existe='N'
		begin 
			  Insert into nom_seccion ( codi_sec,	 nombre,	  tasa_ces,		tasa_ints,
										tasa_vac,	 tasa_prima,  tasa_dotac,	tasa_arp,
										tasa_fondo,  tasa_eps,	  dias_base,	ctacesd,
										ctacesc,	 ctaintd,	  ctaintc,		ctavacd, 
										ctavacc,	 ctaprid,	  ctapric,		ctaepsd,
										ctaepsc,	 ctafond,	  ctafonc,		ctaarpd,
										ctaarpc,	 ctasena,	  ctacaja,		ctaicbf,
										ctaaporte,	 ctavacacon,  ctaintcon,	ctacescon,
										ctaprimcon,	 tipliq,	  corte1,		corte2,
										perliq,		 codenti,	  tiponov,		ctasueldo,
										nitcta,		 codicbf,	  codccf,		nitcesantias,
										niteps,		 nitpension,  nitarp,		nitarlcr,
										nitarldb, 	 nitcescr, 	  nitcesdb, 	nitepscr,
										nitepsdb, 	 nitpencr, 	  nitpendb, 	nitprimcr,
										nitprimdb, 	 nitvaccr, 	  nitvacdb,		idemp)
							  Values  ( @codi_sec,	 @nombre,	  @tasa_ces,	@tasa_ints,
										@tasa_vac,	 @tasa_prima, @tasa_dotac,	@tasa_arp,
										@tasa_fondo, @tasa_eps,	  @dias_base,	@ctacesd,
										@ctacesc,	 @ctaintd,	  @ctaintc,		@ctavacd,
										@ctavacc,	 @ctaprid,	  @ctapric,		@ctaepsd,
										@ctaepsc,	 @ctafond,	  @ctafonc,		@ctaarpd,
										@ctaarpc,	 @ctasena,	  @ctacaja,		@ctaicbf,
										@ctaaporte,	 @ctavacacon, @ctaintcon,	@ctacescon,
										@ctaprimcon, @tipliq,	  @corte1,		@corte2,
										@perliq,	 @codenti,	  @tiponov,		@ctasueldo,
										@nitcta,	 @codicbf,	  @codccf,		@nitcesantias,
										@niteps,	 @nitpension, @nitarp,		@nitarlcr,
										@nitarldb, 	 @nitcescr,	  @nitcesdb, 	@nitepscr,
										@nitepsdb, 	 @nitpencr,   @nitpendb, 	@nitprimcr,
										@nitprimdb,  @nitvaccr,   @nitvacdb,	@idemp)
		end
	end

	If @proc = 2
	begin
		If @existe='S'
		begin
		update nom_seccion set codi_sec=@codi_sec,		nombre=@nombre,			tasa_ces=@tasa_ces,		tasa_ints=@tasa_ints,
							   tasa_vac=@tasa_vac,		tasa_prima=@tasa_prima,	tasa_dotac=@tasa_dotac,	tasa_arp=@tasa_arp,
							   tasa_fondo=@tasa_fondo,	tasa_eps=@tasa_eps,		dias_base=@dias_base,	ctacesd=@ctacesd,
							   ctacesc=@ctacesc,		ctaintd=@ctaintd,		ctaintc=@ctaintc,		ctavacd=@ctavacd,
							   ctavacc=@ctavacc,		ctaprid=@ctaprid,		ctapric=@ctapric,		ctaepsd=@ctaepsd,
							   ctaepsc=@ctaepsc,		ctafond=@ctafond,		ctafonc=@ctafonc,		ctaarpd=@ctaarpd,
							   ctaarpc=@ctaarpc,		ctasena=@ctasena,		ctacaja=@ctacaja,		ctaicbf=@ctaicbf,
							   ctaaporte=@ctaaporte,	ctavacacon=@ctavacacon,	ctaintcon=@ctaintcon,	ctacescon=@ctacescon,
							   ctaprimcon=@ctaprimcon,	tipliq=@tipliq,			corte1=@corte1,			corte2=@corte2,
							   perliq=@perliq,			codenti=@codenti,		tiponov=@tiponov,		ctasueldo=@ctasueldo,
							   nitcta=@nitcta,			codicbf=@codicbf,		codccf=@codccf,			nitcesantias=@nitcesantias,
							   niteps=@niteps,			nitpension=@nitpension,	nitarp=@nitarp,			nitarlcr=@nitarlcr,
							   nitarldb=@nitarldb,		nitcescr=@nitcescr,		nitcesdb=@nitcesdb, 	nitepscr=@nitepscr,
							   nitepsdb=@nitepsdb, 		nitpencr=@nitpencr,		nitpendb=@nitpendb, 	nitprimcr=@nitprimcr,
							   nitprimdb=@nitprimdb,	nitvaccr=@nitvaccr,		nitvacdb=@nitvacdb,		idemp=@idemp
        where codi_sec=@codi_sec
		end
	end

	If @proc = 3
		If @existe='S' Delete From Nom_Seccion Where codi_sec=@codi_sec

END TRY 

Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End catch 
GO


-- Modificado por Éduar Álvarez - Febrero 27 de 2015
IF OBJECT_ID('SPG_ActSucursales','P') IS NOT NULL DROP PROCEDURE SPG_ActSucursales
GO
IF OBJECT_ID('db_SP_NOM_SUCURSAL_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_SUCURSAL_Set
GO

CREATE PROCEDURE db_SP_NOM_SUCURSAL_Set
	@codi_suc nvarchar(3)='',
	@nombre	  nvarchar(40)='',
	@proc     int = 0
AS
BEGIN TRY
   Declare @existe char(1),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsg int =0,
           @mProc   char(20)
	Select @existe ='N', @mLinea=0, @mAddMsg='' 
	Set @mProc ='db_SP_NOM_SUCURSAL_Set'

	If Exists (Select * From nom_sucursal Where codi_suc=@codi_suc)
		Select @existe='S'

	If @proc=1
		If @existe='N' Insert Into nom_sucursal (codi_suc,nombre) Values (@codi_suc,@nombre)

	If @proc=2
		If @existe='S' Update nom_sucursal set nombre=@nombre Where codi_suc=@codi_suc

	If @proc=3
		If @existe='S' Delete From nom_sucursal Where codi_suc=@codi_suc

END TRY

Begin catch
   Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('SPG_ActTerceros','P') IS NOT NULL		DROP PROCEDURE SPG_ActTerceros
GO
CREATE PROCEDURE SPG_ActTerceros
@pNitter		nVarChar(15)='',		@pNomter		nVarChar(60)='',		@pTipter        Decimal(1,0)=0,			@pDivter		nVarChar(1)='',
@pClater		Decimal(1,0)=0,			@pTerotr		Bit=0,					@pTerven        Bit=0,					@pTeremp		Bit=0, 
@pTerpro		Bit=0,					@pTercli		Bit=0,					@pTercob        Bit=0,					@pTelter		Decimal(15,0)=0,
@pDirter		nVarChar(60)='',		@pDirter2		nVarChar(60)='',		@pCiuter        nVarChar(20)='',		@pIdusu			nVarChar(10)='',
@pIva			Bit=0,					@pContacto		nVarChar(60)='',		@pCelular       nVarChar(20)='',		@pFax			Decimal(15,0)=0,
@pDescrip		nVarChar(150)='',		@pCodpro		nVarChar(15)='',		@pRango			Decimal(1,0)=0,			@pCodgru		nVarChar(3)='',
@pCodigo		nVarChar(15)='',		@pFecnac		nVarChar(10)='',		@pMail			nVarChar(60)='',		@pSexo			Decimal(1,0)=0,
@pWeb			nVarChar(60)='',		@pLista			Decimal(1,0)=0,			@pArp			Bit=0,					@pCesantia		Bit=0,
@pCodest		nVarChar(3)='',			@pConduc		Bit=0,					@pEps			Bit=0,					@pPension		Bit=0,
@pBarrio		nVarChar(3)='',			@pOcupacion		nVarChar(150)='',		@pApellido1		nVarChar(70)='',		@pApellido2		nVarChar(70)='',
@pCupocre		Decimal(12,0)=0,		@pDiasvenc		Decimal(3,0)=0,			@pDptoter		nVarChar(2)='',			@pNombre1		nVarChar(70)='',
@pOtros			nVarChar(70)='',		@pSector		nVarChar(3)='',			@pTipid			nVarChar(2)='0',		@pVendedor		nVarChar(15)='',
@pActivo		Bit=0,					@pCivil			nVarChar(40)='',		@pCodbar		nVarChar(25)='',		@pCodtipo		nVarChar(4)='',
@pFoto			nVarChar(254)='',		@pLugexp		nVarChar(40)='',		@pLugnac		nVarChar(40)='',		@pOtrosest		nVarChar(40)='',
@pPorcom        Decimal(6,2)=0,			@pPrimaria		Bit=0,					@pSecundaria	Bit=0,					@pTerprof		Bit=0,
@pZona          nVarChar(4)='0',		@pCedulafiad	nVarChar(15)='',		@pCedulafia2	nVarChar(15)='',		@pCelfiad1		nVarChar(15)='',
@pCelfiad2      nVarChar(15)='',		@pCuota			Decimal(14,2)=0,		@pDirfiad1		nVarChar(60)='',		@pDirfiad2		nVarChar(60)='',
@pDirter3       nVarChar(60)='',		@pNombrefiad	nVarChar(40)='',		@pNombrefia2	nVarChar(40)='',		@pTelfiad1		Decimal(20,0)=0,
@pTelfiad2      Decimal(20,0)=0,		@pTelter2		Decimal(15,0)=0,		@pUcmpmcl		nVarChar(10)='',		@pUcmvmcl		Decimal(14,2)=0,
@pUpgomcl       nVarChar(10)='',		@pUpgvmcl		Decimal(14,2)=0,		@pCupo			Decimal(12,0)=0,		@pCedulafia3	nVarChar(15)='',
@pDiacobro1     Decimal(2,0)=0,			@pDiacobro2		Decimal(2,0)=0,			@pFcobro		nVarChar(10)='',		@pFinicial		nVarChar(10)='',
@pNombrefia3    nVarChar(40)='',		@pPeriodo		Decimal(1,0)=0,			@pVrcuota		Decimal(14,2)=0,		@pVrinicial		Decimal(14,2)=0,
@pCodcargo      nVarChar(3)='0',		@pCodhobby		nVarChar(2)='0',		@pCodprof		nVarChar(2)='0',		@pEmpresa		nVarChar(50)='',
@pHijos         Decimal(2,0)=0,			@pSueldo		Decimal(10,0)=0,		@pFcobroseg		nVarChar(10)='',		@pCedulafia4	nVarChar(15)='',
@pCelfiad3      nVarChar(20)='',		@pDirfiad3		nVarChar(60)='',		@pNombrefia4	nVarChar(60)='',		@pTelfiad3		nVarChar(20)='',
@pAct_eco       nVarChar(2)='',			@pCiiu			Decimal(4,0)=0,			@pEstrato		Decimal(1,0)=0,			@pFec_exp		nVarChar(10)='',
@pInicio_labora nVarChar(10)='',		@pNit_empresa	nVarChar(15)='',		@pNiv_est		nVarChar(2)='',			@pPer_cargo		Decimal(3,0)=0,
@pTip_contrato  nVarChar(2)='',			@pTercon		Bit=0,					@pOcultaremi	Bit=0,					@pCedulafia5	nVarChar(15)='',
@pCedulafia6    nVarChar(15)='',		@pNombrefia5	nVarChar(40)='',		@pNombrefia6	nVarChar(60)='',		@pDatacredito	Bit=0,
@pDatacredi2    Bit=0,					@pDatacredi3	Bit=0,					@pDiremp		nVarChar(60)='',		@pTelemp		nVarChar(20)='',
@pContac        nVarChar(60)='',		@pClasiven		nVarChar(2)='0',		@pCodconcepto	nVarChar(2)='',			@pGuia			nVarChar(16)='',
@pCodpais       nVarChar(3)='0',		@pObsequio		Bit=0,					@pQtyobsequi	Decimal(14,0)=0,		@pMontorf		Decimal(14,2)=0,
@pPorrefte      Decimal(12,4)=0,		@pPorrica		Decimal(12,4)=0,		@pPorriva		Decimal(12,4)=0,		@pRfuente		Bit=0,
@pRica          Bit=0,					@pRiva			Bit=0,					@pFormato		nVarChar(40)='',		@pEstado		nVarChar(01)='',
@pNrotarjeta    nVarChar(15)='',		@pCmprfuente	nVarChar(3)='',			@pCmprica		nVarChar(3)='',			@pCmpriva		nVarChar(03)='',
@pNombrefiad2   nVarChar(40)='',		@pNombrefiad3	nVarChar(60)='',		@pCedulafiad2	nVarChar(15)='',		@pCedulafiad3	nVarChar(15)='',
@pDatacredito1  Bit=0,					@pDatacredito2	Bit=0,					@proc			int=0,					@pDctoter		Decimal(6,2)=0,
@pDiasCart		Decimal(3,0)=0,			@pCmpCree		nVarChar(3)='',			@pRcree			Bit=0,					@pTerinactivo	Bit=0,
@pCodctoter		nVarChar(3)='',			@pTerbloq		Bit=0,					@pPoliza		Bit=0,					@pClasiven2		nVarChar(2)='',
@pClasiven3		nVarChar(2)='',			@pAplimercha	Bit=0,					@pNomcom		nvarchar(200)='',		@pCodeudor		bit=0,@pNombreemp		nVarchar(50)='',@pOcupaemp	nVarchar(50)=''
AS
BEGIN TRY
	Declare @existe	Char(1), @mNerror Int, @mMsg nVarChar(190), @mLinea int, @mAddMsg nVarChar(50),	@mProc char(20), @pVerMsgBox int=0,
			@mUcmpmcl		Date = Convert(Date,@pUcmpmcl),
			@mFcobro		Date = Convert(Date,@pFcobro),
			@mFcobroseg		Date = Convert(Date,@pFcobroseg),
			@mFinicial		Date = Convert(Date,@pFinicial),
			@mFec_exp		Date = Convert(Date,@pFec_exp),
			@mFecnac		Date = Convert(Date,@pFecnac),
			@mUpgomcl		Date = Convert(Date,@pUpgomcl),
			@mInicio_labora Date = Convert(Date,@pInicio_labora)

	Select @existe ='N',@mNerror = 7021, @mLinea=0, @mAddMsg='', @mProc='SPG_ActTerceros'

	If Exists (Select nitter,nomter From Glb_Terceros Where nitter=@pNitter)
		Select @existe='S'

	If @proc=1
	begin 
		If @existe='N'
		begin
			Insert into Glb_Terceros (	Nitter,			Nomter,			Tipter,			Divter,			Clater,			Terotr,			Terven,			Teremp, 
						Terpro,			Tercli,			Tercob,			Telter,			Dirter,			Dirter2,		Ciuter,			Idusu,			Iva,  
						Contacto,		Celular,		Fax,			Descrip,		Codpro,			Rango,			Codgru,			Codigo,			Fecnac, 
						Mail,			Sexo,			Web,			Lista,			Arp,			Cesantia,		Codest,			Conduc,			Eps, 
						Pension,		Barrio,			Ocupacion,		Apellido1,		Apellido2,		Cupocre,		Diasvenc,		Dptoter,		Nombre1,
						Otros,			Sector,			Tipid,			Vendedor,		Activo,			Civil,			Codbar,			Codtipo,		Foto, 
						Lugexp,			Lugnac,			Otrosest,		Porcom,			Primaria,		Secundaria,		Terprof,		Zona,			Cedulafiad, 
						Cedulafia2,		Celfiad1,		Celfiad2,		Cuota,			Dirfiad1,		Dirfiad2,		Dirter3,		Nombrefiad,		Nombrefia2,  
						Telfiad1,		Telfiad2,		Telter2,		Ucmpmcl,		Ucmvmcl,		Upgomcl,		Upgvmcl,		Cupo,			Cedulafia3,
						Diacobro1,		Diacobro2,		Fcobro,			Finicial,		Nombrefia3,		Periodo,		Vrcuota,		Vrinicial,		Codcargo, 
						Codhobby,		Codprof,		Empresa,		Hijos,			Sueldo,			Fcobroseg,		Cedulafia4,		Celfiad3,		Dirfiad3, 
						Nombrefia4,		Telfiad3,		Act_eco,		Ciiu,			Estrato,		Fec_exp,		Inicio_labora,	Nit_empresa,	Niv_est,  
						Per_cargo,		Tip_contrato,	Tercon,			Ocultaremi,		Cedulafia5,		Cedulafia6,		Nombrefia5,		Nombrefia6,		Datacredito,
						Datacredi2,		Datacredi3,		Diremp,			Telemp,			Contac,			Clasiven,		Codconcepto,	Guia,			Codpais, 
						Obsequio,		Qtyobsequi,		Montorf,		Porrefte,		Porrica,		Porriva,		Rfuente,		Rica,			Riva, 
						Formato,		Estado,			Nrotarjeta,		Cmprfuente,		Cmprica,		Cmpriva,		Nombrefiad2,	Nombrefiad3,	Cedulafiad2,  
						Cedulafiad3,	Datacredito1,	Datacredito2,	dctoter,		diascart,		cmpcree,		rcree,			Terinactivo,	Codctoter, 
						Terbloq,		Poliza,			Clasiven2,		Clasiven3,		Aplimercha,		nomcom,			codeudor)
			Values (	@pNitter,		@pNomter,		@pTipter,		@pDivter,		@pClater,		@pTerotr,		@pTerven,		@pTeremp,		@pTerpro,  
						@pTercli,		@pTercob,		@pTelter,		@pDirter,		@pDirter2,		@pCiuter,		@pIdusu,		@pIva,			@pContacto, 
						@pCelular,		@pFax,			@pDescrip,		@pCodpro,		@pRango,		@pCodgru,		@pCodigo,		@mFecnac,		@pMail, 
						@pSexo,			@pWeb,			@pLista,		@pArp,			@pCesantia,		@pCodest,		@pConduc,		@pEps,			@pPension,
						@pBarrio,		@pOcupacion,	@pApellido1,	@pApellido2,	@pCupocre,		@pDiasvenc,		@pDptoter,		@pNombre1,		@pOtros, 
						@pSector,		@pTipid,		@pVendedor,		@pActivo,		@pCivil,		@pCodbar,		@pCodtipo,		@pFoto,			@pLugexp, 
						@pLugnac,		@pOtrosest,		@pPorcom,		@pPrimaria,		@pSecundaria,	@pTerprof,		@pZona,			@pCedulafiad,	@pCedulafia2,  
						@pCelfiad1,		@pCelfiad2,		@pCuota,		@pDirfiad1,		@pDirfiad2,		@pDirter3,		@pNombrefiad,	@pNombrefia2,	@pTelfiad1,
						@pTelfiad2,		@pTelter2,		@mUcmpmcl,		@pUcmvmcl,		@mUpgomcl,		@pUpgvmcl,		@pCupo,			@pCedulafia3,	@pDiacobro1, 
						@pDiacobro2,	@mFcobro,		@mFinicial,		@pNombrefia3,	@pPeriodo,		@pVrcuota,		@pVrinicial,	@pCodcargo,		@pCodhobby, 
						@pCodprof,		@pEmpresa,		@pHijos,		@pSueldo,		@mFcobroseg,	@pCedulafia4,	@pCelfiad3,		@pDirfiad3,		@pNombrefia4,  
						@pTelfiad3,		@pAct_eco,		@pCiiu,			@pEstrato,		@mFec_exp,		@mInicio_labora,@pNit_empresa,	@pNiv_est,		@pPer_cargo,
						@pTip_contrato, @pTercon,		@pOcultaremi,	@pCedulafia5,	@pCedulafia6,	@pNombrefia5,	@pNombrefia6,	@pDatacredito,	@pDatacredi2, 
						@pDatacredi3,	@pDiremp,		@pTelemp,		@pContac,		@pClasiven,		@pCodconcepto,  @pGuia,			@pCodpais,		@pObsequio, 
						@pQtyobsequi,	@pMontorf,		@pPorrefte,		@pPorrica,		@pPorriva,		@pRfuente,		@pRica,			@pRiva,			@pFormato,  
						@pEstado,		@pNrotarjeta,	@pCmprfuente,	@pCmprica,		@pCmpriva,		@pNombrefiad2,	@pNombrefiad3,	@pCedulafiad2,  @pCedulafiad3,
						@pDatacredito1, @pDatacredito2, @pDctoter,		@pDiasCart,		@pCmpCree,		@pRcree,		@pTerinactivo,	@pCodctoter,	@pTerbloq, 
						@pPoliza,		@pClasiven2,	@pClasiven3,	@pAplimercha,	@pNomcom,		@pCodeudor)
		end 
	end     
  
	if @proc=2 
	begin
		if @existe='S'
		begin
		Update	Glb_Terceros 
		Set		Nitter=@pNitter,			Nomter=@pNomter,			Tipter=@pTipter,			Divter=@pDivter,			Clater=@pClater,			Terotr=@pTerotr, 
				Terven=@pTerven,			Teremp=@pTeremp,			Terpro=@pTerpro,			Tercli=@pTercli,			Tercob=@pTercob,			Telter=@pTelter,
				Dirter=@pDirter,			Dirter2=@pDirter2,			Ciuter=@pCiuter,			Idusu=@pIdusu,				Iva=@pIva,					Contacto=@pContacto, 
				Celular=@pCelular,			Fax=@pFax,					Descrip=@pDescrip,			Codpro=@pCodpro,			Rango=@pRango,				Codgru=@pCodgru,
				Codigo=@pCodigo,			Fecnac=@mFecnac,			Mail=@pMail,				Sexo=@pSexo,				Web=@pWeb,					Lista=@pLista, 
				Arp=@pArp,					Cesantia=@pCesantia,		Codest=@pCodest,			Conduc=@pConduc,			Eps=@pEps,					Pension=@pPension,
				Barrio=@pBarrio,			Ocupacion=@pOcupacion,		Apellido1=@pApellido1,		Apellido2=@pApellido2,		Cupocre=@pCupocre,			Diasvenc=@pDiasvenc, 
				Dptoter=@pDptoter,			Nombre1=@pNombre1,			Otros=@pOtros,				Sector=@pSector,			Tipid=@pTipid,				Vendedor=@pVendedor,
				Activo=@pActivo,			Civil=@pCivil,				Codbar=@pCodbar,			Codtipo=@pCodtipo,			Foto=@pFoto,				Lugexp=@pLugexp, 
				Lugnac=@pLugnac,			Otrosest=@pOtrosest,		Porcom=@pPorcom,			Primaria=@pPrimaria,		Secundaria=@pSecundaria,	Terprof=@pTerprof,
				Zona=@pZona,				Cedulafiad=@pCedulafiad,	Cedulafia2=@pCedulafia2,	Celfiad1=@pCelfiad1,		Celfiad2=@pCelfiad2,		Cuota=@pCuota, 
				Dirfiad1=@pDirfiad1,		Dirfiad2=@pDirfiad2,		Dirter3=@pDirter3,			Nombrefiad=@pNombrefiad,	Nombrefia2=@pNombrefia2,	Telfiad1=@pTelfiad1,
				Telfiad2=@pTelfiad2,		Telter2=@pTelter2,			Ucmpmcl=@mUcmpmcl,			Ucmvmcl=@pUcmvmcl,			Upgomcl=@mUpgomcl,			Upgvmcl=@pUpgvmcl, 
				Cupo=@pCupo,				Cedulafia3=@pCedulafia3,	Diacobro1=@pDiacobro1,		Diacobro2=@pDiacobro2,		Fcobro=@mFcobro,			Finicial=@mFinicial,
				Nombrefia3=@pNombrefia3,	Periodo=@pPeriodo,			Vrcuota=@pVrcuota,			Vrinicial=@pVrinicial,		Codcargo=@pCodcargo,		Codhobby=@pCodhobby, 
				Codprof=@pCodprof,			Empresa=@pEmpresa,			Hijos=@pHijos,				Sueldo=@pSueldo,			Fcobroseg=@mFcobroseg,		Cedulafia4=@pCedulafia4,
				Celfiad3=@pCelfiad3,		Dirfiad3=@pDirfiad3,		Nombrefia4=@pNombrefia4,	Telfiad3=@pTelfiad3,		Act_eco=@pAct_Eco,			Ciiu=@pCiiu, 
				Estrato=@pEstrato,			Fec_exp=@mFec_exp,			Inicio_labora=@mInicio_labora,							Nit_empresa=@pNit_Empresa,	Niv_est=@pNiv_Est, 
				Per_cargo=@pPer_Cargo,		Tip_contrato=@pTip_Contrato,							Tercon=@pTercon,			Ocultaremi=@pOcultaremi,	Cedulafia5=@pCedulafia5,
				Cedulafia6=@pCedulafia6,	Nombrefia5=@pNombrefia5,	Nombrefia6=@pNombrefia6,	Datacredito=@pDatacredito,	Datacredi2=@pDatacredi2,	Datacredi3=@pDatacredi3, 
				Diremp=@pDiremp,			Telemp=@pTelemp,			Contac=@pContac,			Clasiven=@pClasiven,		Codconcepto=@pCodconcepto,	Guia=@pGuia,
				Codpais=@pCodpais,			Obsequio=@pObsequio,		Qtyobsequi=@pQtyobsequi,	Montorf=@pMontorf,			Porrefte=@pPorrefte,		Porrica=@pPorrica, 
				Porriva=@pPorriva,			Rfuente=@pRfuente,			Rica=@pRica,				Riva=@pRiva,				Formato=@pFormato,			Estado=@pEstado,
				Nrotarjeta=@pNrotarjeta,	Cmprfuente=@pCmprfuente,	Cmprica=@pCmprica,			Cmpriva=@pCmpriva,			Nombrefiad2=@pNombrefiad2,	Nombrefiad3=@pNombrefiad3, 				Cedulafiad2=@pCedulafiad2,	Cedulafiad3=@pCedulafiad3,	Datacredito1=@pDatacredito1,							Datacredito2=@pDatacredito2, 
				dctoter=@pDctoter,			diascart=@pDiasCart,		cmpcree=@pCmpCree,			rcree=@pRcree,				terinactivo=@pTerinactivo,	Codctoter=@pCodctoter, 
				Terbloq=@pTerbloq,			Poliza=@pPoliza,			Clasiven2=@pClasiven2,		Clasiven3=@pClasiven3,		Aplimercha=@pAplimercha,	nomcom = @pNomcom,codeudor=@pcodeudor
        where nitter=@pNitter
		end
	end

	if @proc=3
		If @existe='S'
			Delete From Glb_Terceros Where nitter=@pNitter
END TRY 

Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO

-----------------------------ASOCIADOS

IF OBJECT_ID('SPG_ActAsociados','P') IS NOT NULL		DROP PROCEDURE SPG_ActAsociados
GO
CREATE PROCEDURE SPG_ActAsociados
@pNitter		nVarChar(15)='',		@pNomter		nVarChar(60)='',		@pTipter        Decimal(1,0)=0,			@pDivter		nVarChar(1)='',
@pClater		Decimal(1,0)=0,			@pTerotr		Bit=0,					@pTerven        Bit=0,					@pTeremp		Bit=0, 
@pTerpro		Bit=0,					@pTercli		Bit=0,					@pTercob        Bit=0,					@pTelter		Decimal(15,0)=0,
@pDirter		nVarChar(60)='',		@pDirter2		nVarChar(60)='',		@pCiuter        nVarChar(20)='',		@pIdusu			nVarChar(10)='',
@pIva			Bit=0,					@pContacto		nVarChar(60)='',		@pCelular       nVarChar(20)='',		@pFax			Decimal(15,0)=0,
@pDescrip		nVarChar(150)='',		@pCodpro		nVarChar(15)='',		@pRango			Decimal(1,0)=0,			@pCodgru		nVarChar(3)='',
@pCodigo		nVarChar(15)='',		@pFecnac		nVarChar(10)='',		@pMail			nVarChar(60)='',		@pSexo			Decimal(1,0)=0,
@pWeb			nVarChar(60)='',		@pLista			Decimal(1,0)=0,			@pArp			Bit=0,					@pCesantia		Bit=0,
@pCodest		nVarChar(3)='',			@pConduc		Bit=0,					@pEps			Bit=0,					@pPension		Bit=0,
@pBarrio		nVarChar(3)='',			@pOcupacion		nVarChar(150)='',		@pApellido1		nVarChar(70)='',		@pApellido2		nVarChar(70)='',
@pCupocre		Decimal(12,0)=0,		@pDiasvenc		Decimal(3,0)=0,			@pDptoter		nVarChar(2)='',			@pNombre1		nVarChar(70)='',
@pOtros			nVarChar(70)='',		@pSector		nVarChar(3)='',			@pTipid			nVarChar(2)='0',		@pVendedor		nVarChar(15)='',
@pActivo		Bit=0,					@pCivil			nVarChar(40)='',		@pCodbar		nVarChar(25)='',		@pCodtipo		nVarChar(4)='',
@pFoto			nVarChar(254)='',		@pLugexp		nVarChar(40)='',		@pLugnac		nVarChar(40)='',		@pOtrosest		nVarChar(40)='',
@pPorcom        Decimal(6,2)=0,			@pPrimaria		Bit=0,					@pSecundaria	Bit=0,					@pTerprof		Bit=0,
@pZona          nVarChar(4)='0',		@pCedulafiad	nVarChar(15)='',		@pCedulafia2	nVarChar(15)='',		@pCelfiad1		nVarChar(15)='',
@pCelfiad2      nVarChar(15)='',		@pCuota			Decimal(14,2)=0,		@pDirfiad1		nVarChar(60)='',		@pDirfiad2		nVarChar(60)='',
@pDirter3       nVarChar(60)='',		@pNombrefiad	nVarChar(40)='',		@pNombrefia2	nVarChar(40)='',		@pTelfiad1		Decimal(20,0)=0,
@pTelfiad2      Decimal(20,0)=0,		@pTelter2		Decimal(15,0)=0,		@pUcmpmcl		nVarChar(10)='',		@pUcmvmcl		Decimal(14,2)=0,
@pUpgomcl       nVarChar(10)='',		@pUpgvmcl		Decimal(14,2)=0,		@pCupo			Decimal(12,0)=0,		@pCedulafia3	nVarChar(15)='',
@pDiacobro1     Decimal(2,0)=0,			@pDiacobro2		Decimal(2,0)=0,			@pFcobro		nVarChar(10)='',		@pFinicial		nVarChar(10)='',
@pNombrefia3    nVarChar(40)='',		@pPeriodo		Decimal(1,0)=0,			@pVrcuota		Decimal(14,2)=0,		@pVrinicial		Decimal(14,2)=0,
@pCodcargo      nVarChar(3)='0',		@pCodhobby		nVarChar(2)='0',		@pCodprof		nVarChar(2)='0',		@pEmpresa		nVarChar(50)='',
@pHijos         Decimal(2,0)=0,			@pSueldo		Decimal(10,0)=0,		@pFcobroseg		nVarChar(10)='',		@pCedulafia4	nVarChar(15)='',
@pCelfiad3      nVarChar(20)='',		@pDirfiad3		nVarChar(60)='',		@pNombrefia4	nVarChar(60)='',		@pTelfiad3		nVarChar(20)='',
@pAct_eco       nVarChar(2)='',			@pCiiu			Decimal(4,0)=0,			@pEstrato		Decimal(1,0)=0,			@pFec_exp		nVarChar(10)='',
@pInicio_labora nVarChar(10)='',		@pNit_empresa	nVarChar(15)='',		@pNiv_est		nVarChar(2)='',			@pPer_cargo		Decimal(3,0)=0,
@pTip_contrato  nVarChar(2)='',			@pTercon		Bit=0,					@pOcultaremi	Bit=0,					@pCedulafia5	nVarChar(15)='',
@pCedulafia6    nVarChar(15)='',		@pNombrefia5	nVarChar(40)='',		@pNombrefia6	nVarChar(60)='',		@pDatacredito	Bit=0,
@pDatacredi2    Bit=0,					@pDatacredi3	Bit=0,					@pDiremp		nVarChar(60)='',		@pTelemp		nVarChar(20)='',
@pContac        nVarChar(60)='',		@pClasiven		nVarChar(2)='0',		@pCodconcepto	nVarChar(2)='',			@pGuia			nVarChar(16)='',
@pCodpais       nVarChar(3)='0',		@pObsequio		Bit=0,					@pQtyobsequi	Decimal(14,0)=0,		@pMontorf		Decimal(14,2)=0,
@pPorrefte      Decimal(12,4)=0,		@pPorrica		Decimal(12,4)=0,		@pPorriva		Decimal(12,4)=0,		@pRfuente		Bit=0,
@pRica          Bit=0,					@pRiva			Bit=0,					@pFormato		nVarChar(40)='',		@pEstado		nVarChar(01)='',
@pNrotarjeta    nVarChar(15)='',		@pCmprfuente	nVarChar(3)='',			@pCmprica		nVarChar(3)='',			@pCmpriva		nVarChar(03)='',
@pNombrefiad2   nVarChar(40)='',		@pNombrefiad3	nVarChar(60)='',		@pCedulafiad2	nVarChar(15)='',		@pCedulafiad3	nVarChar(15)='',
@pDatacredito1  Bit=0,					@pDatacredito2	Bit=0,					@proc			int=0,					@pDctoter		Decimal(6,2)=0,
@pDiasCart		Decimal(3,0)=0,			@pCmpCree		nVarChar(3)='',			@pRcree			Bit=0,					@pTerinactivo	Bit=0,
@pCodctoter		nVarChar(3)='',			@pTerbloq		Bit=0,					@pPoliza		Bit=0,					@pClasiven2		nVarChar(2)='',
@pClasiven3		nVarChar(2)='',			@pAplimercha	Bit=0,					@pNomcom		nvarchar(200)='',		@pCodeudor		bit=0,									@pFechaexp		nVarchar(20)='',		@pLugarexp		varchar(50) ='',		@pNombreemp		nVarchar(50)='',		@pDiremp2		nvarchar(50)='',		
@pMailemp		nvarchar(50)='',		@pTelemp2		nVarchar(20)='',		@pDptoemp		nvarchar(10)='',		@pCiuemp		nvarchar(10)='',		
@pPaisemp		nvarchar(20)='',		@pDepemp		nvarchar(10)='',		@pSecemp		nvarchar(10)='',		@pOcupaemp		nvarchar(10)='',						@pProfeemp		nvarchar(10)='',		@pIngreeemp		decimal(14,4)=0,		@pPagoemp		nvarchar(10)='',		@pContraemp		nvarchar(10)='',		
@pNivelingemp	nvarchar(10)='',		@pCodemp nvarchar(3)='',				@pFecing		nvarchar(10)='',		@pActa			nvarchar(20)='',			@pDelegado		bit=0,							@pCurso			bit=0,					@pFecren		nvarchar(20)='',			@pGrupo			nvarchar(6)='',					@pOrganizmo		nvarchar(20)='',		@pFoto2		nvarchar(300)='',			@pfirma			nvarchar(300)='',		@pSocio			Bit =0,			@pCodusu			nvarchar(300)='',
@pFtitular			Bit =0,@pFconjuntas		Bit =0,@pFalternas		Bit =0,@pFsellos			Bit =0,	@pEps2 NVARCHAR(50)='',		@pRefid1 nvarchar(30)='',	@pRefid2 nvarchar(30)='',	@pRefid3 nvarchar(30) = '',	@pRef1 NVARCHAR(30)='',		@pRef2 nvarchar(30) = '',		@pRef3 nvarchar(30) = '',	@pEstaso nvarchar(3)='',	@pTipaso nvarchar(3)='',	@pTipoviv nvarchar(3)='',	@pNivedu nvarchar(3)='',	
@pFecingemp nvarchar(10)='',	@pDeteps nvarchar(3)='',		@pFecact nvarchar(10)='',	
@pNitref nvarchar(20)='',		 @pNomref nvarchar(50)='',	@pActividadeco nvarchar(3)='',	@pRlegal nvarchar(50)='',
@pNitrl nvarchar(30)='',@pDirrl	nvarchar(30)='',		@pTelrl  nvarchar(30)='',		@pFecharl nvarchar(30)='',
@pTesororl nvarchar(3)='',@pActorl nvarchar(3)='',			@pRegimen nvarchar(3)='',	@pDeporte nvarchar(50)='',
@pCodre nvarchar(3)='',	@pDeclaracion nvarchar(300)=''
AS
BEGIN TRY
	Declare @existe	Char(1), @mNerror Int, @mMsg nVarChar(190), @mLinea int, @mAddMsg nVarChar(50),	@mProc char(20), @pVerMsgBox int=0,
			@mUcmpmcl		Date = Convert(Date,@pUcmpmcl),
			@mFcobro		Date = Convert(Date,@pFcobro),
			@mFcobroseg		Date = Convert(Date,@pFcobroseg),
			@mFinicial		Date = Convert(Date,@pFinicial),
			@mFec_exp		Date = Convert(Date,@pFec_exp),
			@mFecnac		Date = Convert(Date,@pFecnac),
			@mUpgomcl		Date = Convert(Date,@pUpgomcl),
			@mInicio_labora Date = Convert(Date,@pInicio_labora),
			@mFechaexp		Date = Convert(Date,@pFechaexp),
			@mFecing		Date = Convert(Date,@pFecing),
			@mFecren		Date = Convert(Date,@pFecren),
			@mFecingemp		Date = Convert(Date,@pFecingemp),
			@mFecact		Date = Convert(Date,@pFecact),
			@mFecharl		Date = Convert(Date,@pFecharl)

	Select @existe ='N',@mNerror = 7021, @mLinea=0, @mAddMsg='', @mProc='SPG_ActAsociados'

	If Exists (Select nitter,nomter From Glb_Terceros Where nitter=@pNitter)
		Select @existe='S'

	If @proc=1
	begin 
		If @existe='N'
		begin
			Insert into Glb_Terceros (	Nitter,			Nomter,			Tipter,			Divter,			Clater,			Terotr,			Terven,			Teremp, 
						Terpro,			Tercli,			Tercob,			Telter,			Dirter,			Dirter2,		Ciuter,			Idusu,			Iva,  
						Contacto,		Celular,		Fax,			Descrip,		Codpro,			Rango,			Codgru,			Codigo,			Fecnac, 
						Mail,			Sexo,			Web,			Lista,			Arp,			Cesantia,		Codest,			Conduc,			Eps, 
						Pension,		Barrio,			Ocupacion,		Apellido1,		Apellido2,		Cupocre,		Diasvenc,		Dptoter,		Nombre1,
						Otros,			Sector,			Tipid,			Vendedor,		Activo,			Civil,			Codbar,			Codtipo,		Foto, 
						Lugexp,			Lugnac,			Otrosest,		Porcom,			Primaria,		Secundaria,		Terprof,		Zona,			Cedulafiad, 
						Cedulafia2,		Celfiad1,		Celfiad2,		Cuota,			Dirfiad1,		Dirfiad2,		Dirter3,		Nombrefiad,		Nombrefia2,  
						Telfiad1,		Telfiad2,		Telter2,		Ucmpmcl,		Ucmvmcl,		Upgomcl,		Upgvmcl,		Cupo,			Cedulafia3,
						Diacobro1,		Diacobro2,		Fcobro,			Finicial,		Nombrefia3,		Periodo,		Vrcuota,		Vrinicial,		Codcargo, 
						Codhobby,		Codprof,		Empresa,		Hijos,			Sueldo,			Fcobroseg,		Cedulafia4,		Celfiad3,		Dirfiad3, 
						Nombrefia4,		Telfiad3,		Act_eco,		Ciiu,			Estrato,		Fec_exp,		Inicio_labora,	Nit_empresa,	Niv_est,  
						Per_cargo,		Tip_contrato,	Tercon,			Ocultaremi,		Cedulafia5,		Cedulafia6,		Nombrefia5,		Nombrefia6,		Datacredito,
						Datacredi2,		Datacredi3,		Diremp,			Telemp,			Contac,			Clasiven,		Codconcepto,	Guia,			Codpais, 
						Obsequio,		Qtyobsequi,		Montorf,		Porrefte,		Porrica,		Porriva,		Rfuente,		Rica,			Riva, 
						Formato,		Estado,			Nrotarjeta,		Cmprfuente,		Cmprica,		Cmpriva,		Nombrefiad2,	Nombrefiad3,	Cedulafiad2,  
						Cedulafiad3,	Datacredito1,	Datacredito2,	dctoter,		diascart,		cmpcree,		rcree,			Terinactivo,	Codctoter, 
						Terbloq,		Poliza,			Clasiven2,		Clasiven3,		Aplimercha,		nomcom,			codeudor,fechaexp,		lugarexp,		nombreemp,		diremp2,			mailemp,		telemp2,
						dptoemp,		ciuemp,			paisemp,		depemp,			secemp,			ocupaemp,		profeemp,
						ingreemp,pagoemp,contraemp,nivelingemp,codemp,fecing,acta,
						delegado,curso,fecren,grupo,organizmo,foto2,firma,socio,codusu,ftitular,fconjuntas,falternas,fsellos,
						nomeps,refid1,refid2,refid3,ref1,ref2,ref3,estaso,tipaso,tipoviv,nivedu,fecingemp,
						deteps,fecact,nitref,nomref,actividadeco,rlegal,nitrl,dirrl,telrl,fecharl,tesororl,actorl,
						regimen,deporte,codre,declaracion)
			Values (	@pNitter,		@pNomter,		@pTipter,		@pDivter,		@pClater,		@pTerotr,		@pTerven,		@pTeremp,		@pTerpro,  
						@pTercli,		@pTercob,		@pTelter,		@pDirter,		@pDirter2,		@pCiuter,		@pIdusu,		@pIva,			@pContacto, 
						@pCelular,		@pFax,			@pDescrip,		@pCodpro,		@pRango,		@pCodgru,		@pCodigo,		@mFecnac,		@pMail, 
						@pSexo,			@pWeb,			@pLista,		@pArp,			@pCesantia,		@pCodest,		@pConduc,		@pEps,			@pPension,
						@pBarrio,		@pOcupacion,	@pApellido1,	@pApellido2,	@pCupocre,		@pDiasvenc,		@pDptoter,		@pNombre1,		@pOtros, 
						@pSector,		@pTipid,		@pVendedor,		@pActivo,		@pCivil,		@pCodbar,		@pCodtipo,		@pFoto,			@pLugexp, 
						@pLugnac,		@pOtrosest,		@pPorcom,		@pPrimaria,		@pSecundaria,	@pTerprof,		@pZona,			@pCedulafiad,	@pCedulafia2,  
						@pCelfiad1,		@pCelfiad2,		@pCuota,		@pDirfiad1,		@pDirfiad2,		@pDirter3,		@pNombrefiad,	@pNombrefia2,	@pTelfiad1,
						@pTelfiad2,		@pTelter2,		@mUcmpmcl,		@pUcmvmcl,		@mUpgomcl,		@pUpgvmcl,		@pCupo,			@pCedulafia3,	@pDiacobro1, 
						@pDiacobro2,	@mFcobro,		@mFinicial,		@pNombrefia3,	@pPeriodo,		@pVrcuota,		@pVrinicial,	@pCodcargo,		@pCodhobby, 
						@pCodprof,		@pEmpresa,		@pHijos,		@pSueldo,		@mFcobroseg,	@pCedulafia4,	@pCelfiad3,		@pDirfiad3,		@pNombrefia4,  
						@pTelfiad3,		@pAct_eco,		@pCiiu,			@pEstrato,		@mFec_exp,		@mInicio_labora,@pNit_empresa,	@pNiv_est,		@pPer_cargo,
						@pTip_contrato, @pTercon,		@pOcultaremi,	@pCedulafia5,	@pCedulafia6,	@pNombrefia5,	@pNombrefia6,	@pDatacredito,	@pDatacredi2, 
						@pDatacredi3,	@pDiremp,		@pTelemp,		@pContac,		@pClasiven,		@pCodconcepto,  @pGuia,			@pCodpais,		@pObsequio, 
						@pQtyobsequi,	@pMontorf,		@pPorrefte,		@pPorrica,		@pPorriva,		@pRfuente,		@pRica,			@pRiva,			@pFormato,  
						@pEstado,		@pNrotarjeta,	@pCmprfuente,	@pCmprica,		@pCmpriva,		@pNombrefiad2,	@pNombrefiad3,	@pCedulafiad2,  @pCedulafiad3,
						@pDatacredito1, @pDatacredito2, @pDctoter,		@pDiasCart,		@pCmpCree,		@pRcree,		@pTerinactivo,	@pCodctoter,	@pTerbloq, 
						@pPoliza,		@pClasiven2,	@pClasiven3,	@pAplimercha,	@pNomcom,		@pCodeudor,	@mFechaexp,@plugarexp,@pNombreemp,@pDiremp2,@pMailemp,@pTelemp2,@pDptoemp,@pCiuemp,@pPaisemp,@pDepemp,@pSecemp,@pOcupaemp,@pProfeemp,
						@pIngreeemp,@pPagoemp,@pContraemp,@pNivelingemp,@pCodemp,@mFecing,@pActa,@pDelegado,@pCurso,@mFecren,
						@pGrupo,@pOrganizmo,@pFoto2,@pfirma,@pSocio,@pCodusu,@pFtitular,@pFconjuntas,@pFalternas,@pFsellos,@pEps2,@pRefid1,
						@pRefid2,@pRefid3,@pRef1,@pRef2,@pRef3,@pEstaso,@pTipaso,@pTipoviv,@pNivedu,@mFecingemp,
						@pDeteps,@mFecact,@pNitref,@pNomref,@pActividadeco,@pRlegal,@pNitrl,@pDirrl,@pTelrl,
						@mFecharl,@pTesororl,@pActorl,@pRegimen,@pDeporte,@pCodre,@pDeclaracion)
		end 
	end     
  
	if @proc=2 
	begin
		if @existe='S'
		begin
		Update	Glb_Terceros 
		Set		Nitter=@pNitter,			Nomter=@pNomter,			Tipter=@pTipter,			Divter=@pDivter,			Clater=@pClater,			Terotr=@pTerotr, 
				Terven=@pTerven,			Teremp=@pTeremp,			Terpro=@pTerpro,			Tercli=@pTercli,			Tercob=@pTercob,			Telter=@pTelter,
				Dirter=@pDirter,			Dirter2=@pDirter2,			Ciuter=@pCiuter,			Idusu=@pIdusu,				Iva=@pIva,					Contacto=@pContacto, 
				Celular=@pCelular,			Fax=@pFax,					Descrip=@pDescrip,			Codpro=@pCodpro,			Rango=@pRango,				Codgru=@pCodgru,
				Codigo=@pCodigo,			Fecnac=@mFecnac,			Mail=@pMail,				Sexo=@pSexo,				Web=@pWeb,					Lista=@pLista, 
				Arp=@pArp,					Cesantia=@pCesantia,		Codest=@pCodest,			Conduc=@pConduc,			Eps=@pEps,					Pension=@pPension,
				Barrio=@pBarrio,			Ocupacion=@pOcupacion,		Apellido1=@pApellido1,		Apellido2=@pApellido2,		Cupocre=@pCupocre,			Diasvenc=@pDiasvenc, 
				Dptoter=@pDptoter,			Nombre1=@pNombre1,			Otros=@pOtros,				Sector=@pSector,			Tipid=@pTipid,				Vendedor=@pVendedor,
				Activo=@pActivo,			Civil=@pCivil,				Codbar=@pCodbar,			Codtipo=@pCodtipo,			Foto=@pFoto,				Lugexp=@pLugexp, 
				Lugnac=@pLugnac,			Otrosest=@pOtrosest,		Porcom=@pPorcom,			Primaria=@pPrimaria,		Secundaria=@pSecundaria,	Terprof=@pTerprof,
				Zona=@pZona,				Cedulafiad=@pCedulafiad,	Cedulafia2=@pCedulafia2,	Celfiad1=@pCelfiad1,		Celfiad2=@pCelfiad2,		Cuota=@pCuota, 
				Dirfiad1=@pDirfiad1,		Dirfiad2=@pDirfiad2,		Dirter3=@pDirter3,			Nombrefiad=@pNombrefiad,	Nombrefia2=@pNombrefia2,	Telfiad1=@pTelfiad1,
				Telfiad2=@pTelfiad2,		Telter2=@pTelter2,			Ucmpmcl=@mUcmpmcl,			Ucmvmcl=@pUcmvmcl,			Upgomcl=@mUpgomcl,			Upgvmcl=@pUpgvmcl, 
				Cupo=@pCupo,				Cedulafia3=@pCedulafia3,	Diacobro1=@pDiacobro1,		Diacobro2=@pDiacobro2,		Fcobro=@mFcobro,			Finicial=@mFinicial,
				Nombrefia3=@pNombrefia3,	Periodo=@pPeriodo,			Vrcuota=@pVrcuota,			Vrinicial=@pVrinicial,		Codcargo=@pCodcargo,		Codhobby=@pCodhobby, 
				Codprof=@pCodprof,			Empresa=@pEmpresa,			Hijos=@pHijos,				Sueldo=@pSueldo,			Fcobroseg=@mFcobroseg,		Cedulafia4=@pCedulafia4,
				Celfiad3=@pCelfiad3,		Dirfiad3=@pDirfiad3,		Nombrefia4=@pNombrefia4,	Telfiad3=@pTelfiad3,		Act_eco=@pAct_Eco,			Ciiu=@pCiiu, 
				Estrato=@pEstrato,			Fec_exp=@mFec_exp,			Inicio_labora=@mInicio_labora,							Nit_empresa=@pNit_Empresa,	Niv_est=@pNiv_Est, 
				Per_cargo=@pPer_Cargo,		Tip_contrato=@pTip_Contrato,							Tercon=@pTercon,			Ocultaremi=@pOcultaremi,	Cedulafia5=@pCedulafia5,
				Cedulafia6=@pCedulafia6,	Nombrefia5=@pNombrefia5,	Nombrefia6=@pNombrefia6,	Datacredito=@pDatacredito,	Datacredi2=@pDatacredi2,	Datacredi3=@pDatacredi3, 
				Diremp=@pDiremp,			Telemp=@pTelemp,			Contac=@pContac,			Clasiven=@pClasiven,		Codconcepto=@pCodconcepto,	Guia=@pGuia,
				Codpais=@pCodpais,			Obsequio=@pObsequio,		Qtyobsequi=@pQtyobsequi,	Montorf=@pMontorf,			Porrefte=@pPorrefte,		Porrica=@pPorrica, 
				Porriva=@pPorriva,			Rfuente=@pRfuente,			Rica=@pRica,				Riva=@pRiva,				Formato=@pFormato,			Estado=@pEstado,
				Nrotarjeta=@pNrotarjeta,	Cmprfuente=@pCmprfuente,	Cmprica=@pCmprica,			Cmpriva=@pCmpriva,			Nombrefiad2=@pNombrefiad2,	Nombrefiad3=@pNombrefiad3, 				Cedulafiad2=@pCedulafiad2,	Cedulafiad3=@pCedulafiad3,	Datacredito1=@pDatacredito1,							Datacredito2=@pDatacredito2, 
				dctoter=@pDctoter,			diascart=@pDiasCart,		cmpcree=@pCmpCree,			rcree=@pRcree,				terinactivo=@pTerinactivo,	Codctoter=@pCodctoter, 
				Terbloq=@pTerbloq,			Poliza=@pPoliza,			Clasiven2=@pClasiven2,		Clasiven3=@pClasiven3,		Aplimercha=@pAplimercha,	nomcom = @pNomcom,
				codeudor=@pcodeudor, fechaexp =@mFechaexp, lugarexp = @pLugarexp, nombreemp = @pNombreemp,diremp2 = @pDiremp2,
				mailemp = @pMailemp,telemp2 =@pTelemp2,dptoemp = @pDptoemp,ciuemp=@pCiuemp,paisemp = @pPaisemp,
				depemp = @pDepemp,secemp = @pSecemp,ocupaemp = @pOcupaemp,profeemp=@pProfeemp,ingreemp=@pIngreeemp,
				pagoemp= @pPagoemp,contraemp = @pContraemp,nivelingemp = @pNivelingemp,codemp=@pCodemp,fecing = @mFecing,
				acta = @pActa,delegado=@pDelegado,curso=@pCurso,fecren=@mFecren,grupo=@pGrupo,organizmo=@pOrganizmo,
				foto2=@pFoto2,firma=@pfirma,socio=@pSocio,codusu=@pCodusu,ftitular = @pFtitular,fconjuntas=@pFconjuntas,
				falternas=@pFalternas, fsellos = @pFsellos, nomeps =@pEps2, refid1 = @pRefid1,refid2 = @pRefid2,
				refid3 = @pRefid3,ref1 = @pRef1,ref2 = @pRef2,ref3 = @pRef3,estaso = @pEstaso, tipaso = @pTipaso, tipoviv = @pTipoviv, nivedu = @pNivedu,   fecingemp = @mFecingemp, deteps = @pDeteps, fecact=@mFecact,
				nitref = @pNitref, nomref = @pNomref, actividadeco = @pActividadeco,rlegal=@pRlegal,nitrl=@pNitrl, dirrl =						@pDirrl,telrl = @pTelrl,fecharl=@mFecharl,tesororl = @pTesororl, actorl = @pActorl, regimen=@pRegimen,
				deporte=@pDeporte, codre =@pCodre, declaracion =@pDeclaracion
        where nitter=@pNitter
		end
	end

	if @proc=3
		If @existe='S'
			Delete From Glb_Terceros Where nitter=@pNitter
END TRY 

Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO

----------

IF OBJECT_ID('SPG_ActTiptercero','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActTiptercero
END
GO
CREATE PROCEDURE SPG_ActTiptercero
 @codtipo nvarchar(4),
   @nomtipo nvarchar(30)=null,
   @proc     int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
   select @existe ='N',@mNerror=7021,@mLinea=0,@mAddMsg='',@mProc  ='SPG_ActTiptercero'
   
   
   if exists (select * from glb_Tiptercero where codtipo=@codtipo)
      select @existe='S'
   
   
   --codtipo,@codtipo,
   if @proc=1
      if @existe='N'
         insert into glb_Tiptercero(codtipo,nomtipo)values(@codtipo,@nomtipo)

   
   if @proc=2 
      if @existe='S'
        update glb_Tiptercero set nomtipo=@nomtipo where codtipo=@codtipo

   
   if @proc=3 
      if @existe='S'
         delete from glb_Tiptercero where codtipo=@codtipo
     
END Try 

Begin catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado Mayo 28 de 2015 - Éduar Álvarez.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SP_Consecut','P') IS NOT NULL		DROP PROCEDURE SP_Consecut
GO

CREATE PROCEDURE SP_Consecut
	@pIdEmp   nVarchar(3),
    @pCodCto  nvarchar(3),
    @pCodTran nchar(2),
    @pAñoTran Numeric(4),
    @pMes     nVarchar(15), 
    @pSw      bit = 0
AS
BEGIN
Declare @mConsecut int, @mCad nvarchar(70), @mSql nVarchar(190), @mTiptran int, @mFuente nvarchar(10),@mCodtran nvarchar(10)
	Set @mConsecut = 0
	Set @mTiptran  = 0

	Select @mTipTran=tiptran, @mFuente = fuente,@mCodtran=codtran  from glb_transaccion where codtran=@pCodTran

	If @mTiptran = 1
	begin
		if @mFuente = '' or @mFuente is null or @mFuente = @mCodtran
		begin
			Select @mConsecut=contran 
			From   Glb_Unica 
			Where  idemp=@pIdEmp AND codcto=@pCodcto AND codtran=@pCodTran
		end 
		if @mFuente <>'' and @mFuente <> @mCodtran 
		begin
			Select @mConsecut = contran
				From   Glb_Unica
				Where  idemp=@pIdEmp AND codcto=@pCodCto AND codtran=@mFuente
		end

		If @pSw = 1
		begin 
			if @mFuente = '' or @mFuente is null
			begin
				Update Glb_Unica
				Set    contran = @mConsecut + 1
				Where  idemp=@pIdEmp AND codcto=@pCodCto AND (codtran=@pCodTran or 
						codtran in (Select	codtran 
									from	glb_transaccion 
									where	fuente=@pCodTran  and codtran!=@pCodTran))
			end

			if @mFuente <>'' 
			begin
				Update Glb_Unica
				Set    contran = @mConsecut + 1
				Where  idemp=@pIdEmp AND codcto=@pCodCto AND (codtran=@mFuente or 
						codtran in (Select	codtran 
									from	glb_transaccion 
									where	fuente=@mFuente  and codtran!=@mFuente))
			end	
		end 
		Select @mConsecut AS contran
	end

	If @mTiptran = 2 
	begin
		if not exists (select codtran from glb_mensual where idemp=@pIdEmp and codtran=@pCodTran and añotran=@pAñoTran and codcto=@pCodcto)
				insert into glb_mensual(idemp,codcto,codtran,añotran,mes01,mes02,mes03,mes04,mes05,mes06,mes07,mes08,mes09,mes10,mes11,mes12)
				Values(@pIdEmp,@pCodcto,@pCodTran,@pAñoTran,1,1,1,1,1,1,1,1,1,1,1,1)

		Set @mSql = 'Declare @mconsecut int '+        
					'set @mConsecut=0 '+
					'Select @mConsecut=Mes'+@pMes +'  '+
					'From   Glb_Mensual  '+
					'Where  idemp='''+@pIdEmp+''' and codcto='''+@pCodcto+''' and codtran='''+@pCodTran+''' and añotran='+convert(char(4),@pAñoTran)+
					'select @mConsecut as contran'                     
		Exec(@mSql)
	

		If @pSw = 1
		begin
			Set @mSql =	'Update glb_mensual '+
						'Set Mes'+@pMes+'='+@pMes+' + 1 '+
						'Where  idemp= '''+@pIdEmp+'''  and codcto='''+@pCodcto+''' and codtran = '''+@pCodTran +''''
			Exec(@mSql)
		end
	end

   If @mTiptran = 0 
		Select @mTiptran AS contran
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado Mayo 28 de 2015 - Éduar Álvarez.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_ActUnicaMensual','P') IS NOT NULL		DROP PROCEDURE SPG_ActUnicaMensual
GO
CREATE PROCEDURE SPG_ActUnicaMensual
	@pIdEmp   nVarchar(3),		@pCodcto	nVarchar(3),		@pCodtran  nVarchar(2),
	@pContran decimal(8,0)=1,	@pPrefijo	nVarchar(5)='',		@pFacemp   nVarchar(60)='',
	@pTiremp  nVarchar(60)='',	@pResEmp	nVarchar(255)='',	@pAñotran  Numeric (4)=0,
	@pMes01   decimal (8,0)=1,	@pMes02		decimal (8,0)=1,	@pMes03    decimal (8,0)=1, 
	@pMes04   decimal (8,0)=1,	@pMes05		decimal (8,0)=1,	@pMes06    decimal (8,0)=1, 
	@pMes07   decimal (8,0)=1,	@pMes08		decimal (8,0)=1,	@pMes09    decimal (8,0)=1, 
	@pMes10   decimal (8,0)=1,	@pMes11		decimal (8,0)=1,	@pMes12    decimal (8,0)=1,
	@ptiptran decimal (1,0)=1,	@pResEmpN	nVarchar(200)='',	@pContran2 Numeric (8)=1
AS
BEGIN TRY
	Declare @Existe	 char(1),
			@mNerror int,
			@mMsg    nvarchar(190),
			@mLinea  int,
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc   char(20)
	Select @Existe ='N', @mNerror=57021, @mLinea=0, @mAddMsg='', @mProc = 'SPG_ActUnicaMensual'

	If @ptiptran=1
	Begin
		If Not Exists (Select codtran From Glb_Unica Where idemp=@pIdEmp AND codcto=@pcodcto AND codtran=@pCodtran)

			Insert Into Glb_Unica (  idemp,  codcto,  codtran,  contran,  contran2,  prefijo,  facemp,  tiremp,  resemp,  resempn)
						   Values (@pIdemp,@pCodcto,@pCodtran,@pContran,@pContran2,@pPrefijo,@pFacemp,@pTiremp,@pResEmp,@pResEmpN)
		Else
	        Update Glb_Unica
			   Set contran=@pContran, contran2=@pContran2, prefijo=@pPrefijo, resemp=@pResemp, resempn=@pResEmpN Where idemp=@pIdEmp AND codcto=@pCodcto AND codtran=@pCodtran
	End

	If @ptiptran=2
	Begin
		If Not Exists (Select codtran From Glb_Mensual Where idemp=@pIdemp AND codcto=@pCodcto AND codtran=@pCodtran AND añotran=@pAñotran)
			Insert Into Glb_Mensual (idemp, codcto, codtran, añotran,
									 mes01, mes02, mes03, mes04, mes05, mes06, mes07, mes08, mes09, mes10, mes11, mes12)
							Values (@pIdemp, @pCodcto, @pCodtran, @pAñotran,
									@pMes01, @pMes02, @pMes03, @pMes04, @pMes05, @pMes06, @pMes07, @pMes08, @pMes09, @pMes10, @pMes11, @pMes12)
	     Else
			Update Glb_Mensual
			   Set mes01=@pMes01, mes02=@pMes02, mes03=@pMes03, mes04=@pMes04, mes05=@pMes05, mes06=@pMes06,
				   mes07=@pMes07, mes08=@pMes08, mes09=@pMes09, mes10=@pMes10, mes11=@pMes11, mes12=@pMes12
             Where idemp=@pIdEmp AND codcto=@pCodcto AND codtran=@pCodtran AND añotran=@pAñotran
	End

END TRY 

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO


IF OBJECT_ID('SPG_ActZonas','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActZonas
END
GO
CREATE PROCEDURE SPG_ActZonas
 @codigo nvarchar(4) ,
   @nombre nvarchar(30)=null,
   @proc   int = 0
    
	
AS
BEGIN try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
		   @mExistRel nvarchar(90)='',
           @mProc   char(20)
   select @existe ='N',@mNerror=7021,@mLinea=0,@mAddMsg='',@mProc  ='SPG_ActZonas'
   
   if exists (select * from glb_zonas where codigo=@codigo)
      select @existe='S'
    
   if @proc=1
      if @existe='N'
         insert into glb_zonas(codigo,nombre)values(@codigo,@nombre)
       
   if @proc=2 
      if @existe='S'
        update glb_zonas set nombre=@nombre where codigo=@codigo
        
   if @proc=3
   Begin 
      if @existe='S'
	  Begin 
	     if exists(select zona from glb_terceros where zona=@codigo)
		    set @mExistRel ='Terceros '
         If exists(select codzona,codzona2 from glb_barrio where codzona = @codigo or codzona2 = @codigo)
	        Set @mExistRel = @mExistRel +'Barrio '

		 If len(ltrim(rtrim(@mExistRel))) > 0 
		 Begin 
		    select @mAddMsg =';'+@mExistRel, @pVerMsgBox = 1;
			Throw 57002,@mAddMsg,1
         End 
		 
		 delete from glb_zonas where codigo=@codigo
      End
   End 
     
   if @proc = 4
   begin
     SELECT Z.codigo AS codzona,z.nombre as nomzona,
            B.codbarr, B.nombarr, B.horaini1 as horaini, B.horafin1 as horafin, 
            B.valor1 as valor 
     FROM   dbo.glb_zonas Z 
            INNER JOIN  dbo.glb_barrio B ON Z.codigo = B.codzona                                      
     union all 
     SELECT Z.codigo AS codzona,z.nombre as nomzona,
            B.codbarr, B.nombarr, B.horaini2 as horaini, B.horafin2 as horafin, 
            B.valor2 as valor
     FROM   dbo.glb_zonas Z 
            INNER JOIN  dbo.glb_barrio B ON Z.codigo = B.codzona2 
     order by nomzona,nombarr 
   End   
  
END Try 

Begin catch
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 

GO


IF OBJECT_ID('SPG_CambiarCuenta','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_CambiarCuenta
END
GO
CREATE PROCEDURE SPG_CambiarCuenta
	@pIdEmp   nvarchar (3)='',		@pCodcueA nvarchar (12)='',		@pCodcueN nvarchar (12)='',		@pFechaI  date,
    @pFechaF  date,					@pTipDoc  nVarchar(3)= ''
    
AS
BEGIN try
	Begin tran   
	declare @existe char(1),	@mNerror int,	@mMsg    nvarchar(190),		@mLinea  int,		@mAddMsg nvarchar(50)='',		@pVerMsgBox int =0,
			@mProc   char(20),	@Tipdoc_Local  VARCHAR(2)
	
	SET @Tipdoc_Local = Case When @pTipDoc='' Then NULL Else @pTipDoc End

	select @existe ='N'
	select @mNerror=57021,@mLinea=0,@mAddMsg='', @mProc  ='SPG_CambiarCuenta'        

    IF EXISTS(select codcue from con_puc where codcue=@pCodcueN)
    begin 
       UPDATE	con_comprobante 
	   set		codcue=@pCodcueN 
	   where	idemp=@pIdemp		and
				(codtran=@Tipdoc_Local OR @Tipdoc_Local is null) and 
				codcue=@pCodcueA	and 
				fecdoc  between @pFechaI and @pFechaF  
	End  
	COMMIT
END try
Begin catch 
	If @@TRANCOUNT > 0 
		Rollback 

	set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox   
end catch 
GO


IF OBJECT_ID('SPG_CambioDeNit','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_CambioDeNit
END
GO
CREATE PROCEDURE SPG_CambioDeNit
  @pIdemp nvarchar(3), @pNitActual nvarchar(15), @pNitNuevo nvarchar(15) 
as
Begin try 
   declare @existe char(1),
           @mNerror int,
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
   select @existe ='N',@mNerror=57021,@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_CambioDeNit' 
   
   
   If Exists(Select nitter From glb_terceros where nitter=@pNitActual) 
   Begin 
      Begin Tran
         --Contabilidad
         Update Con_Comprobante Set nitter =@pNitNuevo Where nitter =@pNitActual
         
         --Ventas
         Update Ven_Facturas    Set nitcli =@pNitNuevo Where nitcli =@pNitActual 
         Update Ven_Facturas    Set nitven =@pNitNuevo Where nitven =@pNitActual
         Update Ven_movcli      Set nitcli =@pNitNuevo Where nitcli =@pNitActual 
         Update Ven_pedidos     Set nitven =@pNitNuevo Where nitven =@pNitActual
         Update Ven_pedidos     Set nitcli =@pNitNuevo Where nitven =@pNitActual
         
         --Compras
         Update Com_Facturas    Set nitpro =@pNitNuevo Where nitpro =@pNitActual
         Update Com_movpro      Set nitpro =@pNitNuevo Where nitpro =@pNitActual
         Update Com_ordenes     Set nitpro =@pNitNuevo Where nitpro =@pNitActual
      
         --Transportes  se desactiva para DELIPIZZA		 
		   
         --Update Tra_Planilla    Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_Busruta     Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_Cartera     Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_detaCartera Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_Control     Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_Desvincula  Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_Detrecaudo  Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_patron      Set nitter =@pNitNuevo Where nitter =@pNitActual
         --Update Tra_detplanilla Set nitter =@pNitNuevo Where nitter =@pNitActual
         
         --Delete  from glb_terceros  where nitter = @pNitActual  
         
         COMMIT  
   End 
   
 /*  
   if @@ERROR=0 
   Begin 		
     set @mMsg=(select m.Mensaje+@mAddMsg  from glb_mensaje m where m.id=@mNerror)
     exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
   End   
*/
End try 
Begin Catch
  If @@trancount > 0 
     RollBack

  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch 
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_Consecut','P') IS NOT NULL	DROP PROCEDURE SPG_Consecut
GO
CREATE PROCEDURE SPG_Consecut
	@pIdEmp   nVarchar(3),
	@pCodcto  nvarchar(3),
	@pCodTran nchar(2),
	@pAñoTran decimal(4,0),
	@pMes     nVarchar(15), 
	@pSw      bit = 0
AS
BEGIN
Declare @mConsecut int, @mCad nvarchar(70), @mSql nVarchar(190), @mTiptran int, @mFuente nvarchar(10),@mCodtran nvarchar(10)
	Set @mConsecut = 0
	Set @mTiptran  = 0

	Select @mTipTran=tiptran, @mFuente = fuente,@mCodtran=codtran  from glb_transaccion where codtran=@pCodTran

	If @mTiptran = 1
	begin
		if @mFuente = '' or @mFuente is null or @mFuente = @mCodtran
		begin
			Select @mConsecut=contran 
			From   Glb_Unica 
			Where  idemp=@pIdEmp AND codcto=@pCodcto AND codtran=@pCodTran
		end 
		if @mFuente <>'' and @mFuente <> @mCodtran 
		begin
			Select @mConsecut = contran
				From   Glb_Unica
				Where  idemp=@pIdEmp AND codcto=@pCodCto AND codtran=@mFuente
		end

		If @pSw = 1
		begin 
			if @mFuente = '' or @mFuente is null
			begin
				Update Glb_Unica
				Set    contran = @mConsecut + 1
				Where  idemp=@pIdEmp AND codcto=@pCodCto AND (codtran=@pCodTran or 
						codtran in (Select	codtran 
									from	glb_transaccion 
									where	fuente=@pCodTran  and codtran!=@pCodTran))
			end

			if @mFuente <>'' 
			begin
				Update Glb_Unica
				Set    contran = @mConsecut + 1
				Where  idemp=@pIdEmp AND codcto=@pCodCto AND (codtran=@mFuente or 
						codtran in (Select	codtran 
									from	glb_transaccion 
									where	fuente=@mFuente  and codtran!=@mFuente))
			end	
		end 
		Select @mConsecut AS contran
	end

	If @mTiptran = 2 
	begin
		if not exists (select codtran from glb_mensual where idemp=@pIdEmp and codtran=@pCodTran and añotran=@pAñoTran and codcto=@pCodcto)
				insert into glb_mensual(idemp,codcto,codtran,añotran,mes01,mes02,mes03,mes04,mes05,mes06,mes07,mes08,mes09,mes10,mes11,mes12)
				Values(@pIdEmp,@pCodcto,@pCodTran,@pAñoTran,1,1,1,1,1,1,1,1,1,1,1,1)

		Set @mSql = 'Declare @mconsecut int '+        
					'set @mConsecut=0 '+
					'Select @mConsecut=Mes'+@pMes +'  '+
					'From   Glb_Mensual  '+
					'Where  idemp='''+@pIdEmp+''' and codcto='''+@pCodcto+''' and codtran='''+@pCodTran+''' and añotran='+convert(char(4),@pAñoTran)+
					'select @mConsecut as contran'                     
		Exec(@mSql)
	

		If @pSw = 1
		begin
			Set @mSql =	'Update glb_mensual '+
						'Set Mes'+@pMes+'='+@pMes+' + 1 '+
						'Where  idemp= '''+@pIdEmp+'''  and codcto='''+@pCodcto+''' and codtran = '''+@pCodTran +''''
			Exec(@mSql)
		end
	end

   If @mTiptran = 0 
		Select @mTiptran AS contran
END
GO

IF OBJECT_ID('SPG_CtaArbol','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_CtaArbol
END
GO

CREATE PROCEDURE SPG_CtaArbol
	@pCodigo nvarchar(18)   
AS
BEGIN 
	Declare @mLen    int,
			@mCad    nvarchar(180),
			@mCampos nchar(27)
	Set @mLen = 0
	Set @mLen = Len(LTRIM(RTRIM(@pCodigo)))

	Select @mCad =	Case @mLen
						When 3  Then 'Select idemp, codalm, nomalm From Glb_Almacen Where idemp='''+LEFT(@pCodigo,3)+''''
					
						When 6  Then 'Select idemp, codalm, codcen, nomcen From Glb_CenConsumo
									  Where idemp='''+LEFT(@pCodigo,3)+''' AND codalm='''+SubString(@pCodigo,4,3)+''''
					
						When 9  Then 'Select idemp, codalm, codcen, codcto, nomcto From Con_Cencostos '
					
						When 12 Then 'Select idemp, codalm, codcen, codcto, nomcto From Con_Cencostos '
					Else
						'Select id, nomemp from Glb_Empresa'
					End
   Exec (@mCad)
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_CtaCCosto','P') IS NOT NULL	DROP PROCEDURE SPG_CtaCCosto
GO
CREATE PROCEDURE SPG_CtaCCosto
	@pCCosto nvarchar(12)   
AS
Begin 
	Declare @mLen    int,
			@mSql    nvarchar(250),
			@mCad    nvarchar(70)

	Select @mCad = dbo.FE_FiltroCodcc(@pCCosto)

	Set @mSql = 'Select idemp, codalm, codcen, codcto, nomcto '+
                'From Con_Cencostos Where '+@mCad
	Exec (@mSql)
End
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_CtaComprobante','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_CtaComprobante
END
GO
CREATE PROCEDURE SPG_CtaComprobante
	@pIdemp  nvarchar(3),	@pCodcto nvarchar(3),	@pCodtran char(2),	@pConsec nvarchar(16)	
AS
BEGIN
	Select A.*, B.nomcue 
	From   con_comprobante A 
	       Inner Join con_puc B on(B.codcue=A.codcue)
	Where  idemp=@pIdemp and A.codcto=@pCodcto and A.codtran=@pCodtran and A.consec=@pConsec and A.docdelete=0
	order by a.itemdoc 
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_CtaComproNiif','P') IS NOT NULL		
	DROP PROCEDURE db_SP_CtaComproNiif
GO
CREATE PROCEDURE db_SP_CtaComproNiif
	@pIdemp nvarchar(3), @pCodcto nvarchar(3), @pCodtran char(2), @pConsec nvarchar(16)
AS
Begin
	Select	Con.*, Puc.nomcue 
	From	Con_ComproNiif Con 
			Inner Join Con_PucNiif Puc On Con.codcue=Puc.codcue
	Where  idemp=@pIdemp AND Con.codcto=@pCodcto AND Con.codtran=@pCodtran AND Con.consec=@pConsec and con.docdelete=0
END
GO

IF OBJECT_ID('SPG_DcoTransaccion','P') IS NOT NULL		
	DROP PROCEDURE SPG_DcoTransaccion
GO
CREATE PROCEDURE SPG_DcoTransaccion
	@pcodtran		nvarchar(2)='',		@pnomtran		nvarchar(30)='',	@ptiptran		decimal(1,0)=1,		@pmodulo	bit=0,
	@pcodmod		nvarchar(2)='',		@pcodcue		nvarchar(8)='',		@ptipcon		nvarchar(1)='',		@pcodfue	nvarchar(5)='', 
	@pcodmov		nvarchar(3)='',		@pcodcod		nvarchar(3)='',		@panultran		nvarchar(2)='',		@ptipven	decimal(1,0)=0,
	@pdoble			bit=0,				@pTraslado		bit=0,				@pactiva		bit=0,				@pcontable	bit=0,
	@pdevolprove	bit=0,				@pmanejaiva		bit=0,				@pfiscdefaul	bit=0,				@pfuente	nvarchar(2)='',
	@pexenta		bit=0,				@pconsignacion	bit=0,				@ptrancm		nvarchar(2)='',		@ptrannd    nvarchar(2)='',
	@ptrancp		nvarchar(2)='',		@pnoenvio		bit=0,				@punificarcf	bit=0,				@pbalaninv	bit=0,
	@pIdEmp			nvarchar(3)='',		@pContran		decimal(8,0)=1,		@pAñotran		decimal (4,0)=0,	@pProc      int,
	@pTransacNIIF	bit=0,				@pTipoNorma		Char(1)='',			@pTranEdit		nvarchar(2)='',		@pnCopias	Int=0,
	@pMostrartouch	bit=1		
AS
BEGIN TRY
	BEGIN TRANSACTION
    DECLARE @mIdemp	 nvarchar(3),
            @mCodcto nvarchar(3),
            @mProc	 nvarchar(50)='SPG_DcoTransaccion',
            @mDco	 nvarchar (95),
            @mRS	 decimal (5,0),
            @mNota	 nchar(50),
			@mAddMsg nvarchar(230)='',
			@pVerMsg int=0,
			@mExist	 char(1)='N',
            @mSwEli	 int

    If Exists (Select * From Glb_Transaccion Where codtran=@pCodTran)
		Set @mExist = 'S'

	IF @mExist = 'N'
		begin 
			Insert Into Glb_Transaccion (	codtran,		nomtran,		tiptran,		modulo,
											codmod,			codcue,			tipcon,			codfue,
											codmov,			codcod,			anultran,		tipven, 
											doble,			traslado,		activa,			contable,
											devolprove,		manejaiva,		fiscdefaul,		fuente,
											exenta,			consignacion,	trancm,			trannd,
											trancp,			noenvio,		unificarcf,		balaninv,
											transacniif,	TipoNorma,		tranEdit,		nCopias,
											Mostrartouch)
								 Values (	@pCodtran,		@pnomtran,		@ptiptran,		@pmodulo,
											@pcodmod,		@pcodcue,		@ptipcon,		@pcodfue,
											@pcodmov,		@pcodcod,		@panultran,		@ptipven,
											@pdoble,		@pTraslado,		@pactiva,		@pcontable,
											@pdevolprove,	@pmanejaiva,	@pfiscdefaul,	@pfuente,
											@pexenta,		@pconsignacion, @ptrancm,		@ptrannd,
											@ptrancp,		@pnoenvio,		@punificarcf,	@pbalaninv,
											@pTransacNIIF,	@pTipoNorma,	@pTranEdit,		@pncopias,
											@pMostrartouch)
			Set @mExist = 'S'
		end
	Else 
		Update Glb_Transaccion	Set nomtran		= @pNomtran,		tiptran		 = @ptiptran,			modulo	   = @pmodulo,
									codmod		= @pcodmod,			codcue		 = @pcodcue,			tipcon	   = @pTipcon,			codfue   = @pcodfue,
									codmov		= @pcodmov,			codcod		 = @pcodcod,			anultran   = @panultran,		tipven   = @ptipven,
									doble		= @pdoble,			traslado	 = @pTraslado,			activa	   = @pactiva,			contable = @pcontable,
									devolprove	= @pdevolprove,		manejaiva	 = @pmanejaiva,			fiscdefaul = @pfiscdefaul,		fuente	 = @pfuente,
									exenta		= @pexenta,			consignacion = @pconsignacion,		trancm	   = @ptrancm,			trannd	 = @ptrannd, 
									trancp		= @ptrancp,			noenvio		 = @pnoenvio,			unificarcf = @punificarcf,		balaninv = @pbalaninv,
									transacniif	= @pTransacNIIF,	TipoNorma	 = @pTipoNorma,			tranedit   = @pTranEdit,		nCopias	 = @pnCopias,
									Mostrartouch= @pMostrartouch	
							  Where codtran=@pCodTran 
	If @mExist = 'S' 
	Begin
		If @pProc=1  --Nuevo dco.
		begin
			Declare CurCCosto Cursor
			For Select idemp,codcto From Con_Cencostos Where idemp=@pIdEmp

			If @ptiptran=1
			begin
				Open CurCCosto
				Fetch CurCCosto Into @mIdEmp, @mCodcto

				While @@FETCH_STATUS=0
				begin 
					Insert Into Glb_Unica (  idemp,  codcto,  codtran,  contran, prefijo, facemp, tiremp, resemp)
								   Values (@mIdemp,@mCodcto,@pCodtran,@pContran, 0,'','','')
					Fetch CurCCosto Into @mIdEmp, @mCodcto
				end
			end

			If @ptiptran=2
			begin
				Open CurCCosto
				Fetch CurCCosto INTO @mIdEmp, @mCodcto

				While @@FETCH_STATUS=0
				begin 
					Insert Into Glb_Mensual (  idemp,  codcto,  codtran,  añotran, mes01, mes02, mes03, mes04, mes05, mes06, mes07, mes08, mes09, mes10, mes11, mes12)
									 Values (@mIdemp,@mCodcto,@pCodtran,@pAñotran, 1,1,1,1,1,1,1,1,1,1,1,1)
					Fetch CurCCosto INTO @mIdEmp, @mCodcto
				end 
			End
			Close CurCCosto
			Deallocate CurCCosto  	     	     
		end
	End
	COMMIT 
END TRY 

BEGIN CATCH
	If @@TRANCOUNT > 0
		Rollback 
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
END CATCH 
GO


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_EliminarTransaccion','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_EliminarTransaccion
END
GO
CREATE PROCEDURE SPG_EliminarTransaccion
 @pIdEmp   nvarchar(3),
    @pCodTran nvarchar (3),
    @pOp    int
    
    
    
AS
BEGIN try
   Declare @mRs int,@mReturn nvarchar(230),@mAddMsg nvarchar(230), @pVerMsgBox int=0,
           @mProc nvarchar(30)='SPG_EliminarTransaccion'       
   Set @mRs = 0 
    
   IF EXISTS(select * from glb_transaccion where codtran=@pCodTran)
   Begin 
      if @pOp=3 
      Begin
	    select @mReturn=dbo.F_SwDelTransaccion(@pIdEmp,@pcodtran)
		print @mReturn
        If @mReturn ='S'
        Begin
           Begin Tran 
              if exists(select * from glb_mensual Where idemp=@pIdEmp and  codtran= @pCodTran)
              Begin
                 Delete from glb_mensual Where idemp=@pIdEmp and  codtran= @pCodTran
              End
          
              If Exists(select * from glb_unica   Where idemp=@pIdEmp and  codtran= @pCodTran)
              Begin
                 Delete  from glb_unica   Where idemp=@pIdEmp and  codtran= @pCodTran
              End 
           
              Delete From glb_transaccion Where CodTran= @pCodTran
           Commit       
        End
		Else 
		Begin
		   select @mAddMsg = ltrim(rtrim(@mReturn)),@pVerMsgBox = 1;
		   Throw 57002,@mAddMsg,1;  
		End   
      End
   End  

END try

Begin catch 
   if @@TRANCOUNT > 0 
     rollback 
    
  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
end catch 
GO

IF OBJECT_ID('SPG_Empresas','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_Empresas
END
GO
CREATE PROCEDURE SPG_Empresas
 @pPerfil char(3)
AS
BEGIN
   If @pPerfil='000'
      select id, nomemp, nitemp,cmpart,ruta 
      from glb_empresa E
   Else    
      select id, nomemp, nitemp,cmpart,ruta 
      from glb_empresa 
      where id in(Select idemp From glb_accesos A
                  where codper=@pPerfil)
END
GO

IF OBJECT_ID('SPG_EnviarCorreo','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_EnviarCorreo
END
GO
CREATE PROCEDURE SPG_EnviarCorreo
 @pNumerror int,           @pLinea int,            @pProceso nvarchar(180),
   @pTexto    nvarchar(max), @pEmpresa nvarchar(90), @pPC      nvarchar(90),
   @pUser     nvarchar(90),  @pOp int 
AS
BEGIN
	Declare @mProfile nvarchar(90)='ProfileGlobalMail', @mMail char(30),
	        @mbody nvarchar(max), @mSubject nvarchar(180)

	If @pOp = 1 
	Begin
	   Set @mbody ='Error Nro: '+convert(nvarchar(30),@pNumerror)+char(13)+
	               'Proceso  : '+@pProceso+char(13)+
                   'Linea que produce el ERROR: '+convert(nvarchar(30),@pLinea)+char(13)+
                   'Instrucción del ERROR: '+@pTexto+CHaR(13)+
                   'Usuario : '+@pUser
	   
	   Set @mSubject ='Error generado en '+@pEmpresa
              
	   Declare cMail Cursor 
	   For Select mail from glb_mail 
       
	   Open cMail 
       FETCH cMail Into @mMail

       While @@FETCH_STATUS=0
       Begin
	        
		  EXEC msdb.dbo.sp_send_dbmail @profile_name='ProfileGlobal', 
                                       @recipients=@mMail, 
                                       @subject=@mSubject, 
                                       @body=@mbody
	      FETCH cMail Into @mMail
	   End
	   CLOSE cMail
       DEALLOCATE cMail 
	End 
	 
END
GO


IF OBJECT_ID('SPG_Existen','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_Existen
END
GO
CREATE PROCEDURE SPG_Existen
@pTabla nvarchar(50), @pCampos nvarchar(90),@pCondicion nvarchar(90),@mNreg int=0 output  

AS
BEGIN
	DECLARE  @mCadm nvarchar(180)--@mNreg int,
	Set @mNreg =0
	
	
	SET @mCadm ='SELECT '+LTRIM(RTRIM(@pCampos))+' FROM '+@pTabla+' WHERE '+
	            LTRIM( RTRIM (@pCondicion))
	exec (@mCadm)            
	--set   @mNreg = @@rowcount 
	
	return  @mNreg --as nreg
END
GO

-- Modificado por Éduar Álvarez - Marzo 24 de 2015.
IF OBJECT_ID('SPG_frNomCartera','P')	IS NOT NULL DROP PROCEDURE SPG_frNomCartera
IF OBJECT_ID('db_SP_frNOM_CARTERA','P') IS NOT NULL DROP PROCEDURE db_SP_frNOM_CARTERA
GO

CREATE PROCEDURE db_SP_frNOM_CARTERA
	@nserie		nvarchar(5)='',		@codi_emple	nvarchar(4)='',		@nroprest	nvarchar(10)='',	@codi_tran	nvarchar(4)='',
	@fecha_ptmo	datetime,			@fecha_ini	datetime,			@num_cuota	decimal(18,2)=0,	@vr_cuotas	decimal(18,2)=0,
	@vr_ptmo	decimal(18,2)=0,	@periodo	nvarchar(1)='',		@num_pagada	decimal(18,2)=0,	@vr_pagado	decimal(18,2)=0,
	@salpre		decimal(18,2)=0,	@codusu		nvarchar(8)='',		@fecsys		datetime,			@estado		decimal(18,2)=0,
	@idemp		nvarchar(3)=''
AS
BEGIN TRY
	Declare @mMsg    nvarchar(190),
			@mAddMsg nvarchar(50)='',
			@pVerMsg int=0,
			@mProc   char(30)
	Set @mProc='db_SP_frNOM_CARTERA'

	If Exists (Select nserie From Nom_Cartera Where idemp=@idemp AND nserie=@nserie)
		begin
			Update Nom_Cartera Set	nroprest=@nroprest, --codcenfac='', numdocfac='', tipdocfac='',
									fecha_ptmo=@fecha_ptmo, fecha_ini=@fecha_ini,		num_cuota=@num_cuota,	vr_cuotas=@vr_cuotas,
									vr_ptmo=@vr_ptmo,		periodo=@periodo,			num_pagada=@num_pagada, vr_pagado=@vr_pagado,
									salpre=@salpre,			codusu=@codusu,				fecsys=@fecsys,			estado=@estado
			Where nserie=@nserie AND codi_emple=@codi_emple AND codi_tran=@codi_tran AND idemp=@idemp
		end
	Else
		begin
		Insert Into Nom_Cartera
					(nserie,codi_emple,nroprest,codi_tran,fecha_ptmo,fecha_ini,num_cuota,vr_cuotas,vr_ptmo,periodo, --codcenfac, numdocfac, tipdocfac,
					 num_pagada,vr_pagado,salpre,codusu,fecsys,estado,idemp)
			 Values (@nserie,@codi_emple,@nroprest,@codi_tran,@fecha_ptmo,@fecha_ini,@num_cuota,@vr_cuotas,@vr_ptmo,@periodo,
					 @num_pagada,@vr_pagado,@salpre,@codusu,@fecsys,@estado,@idemp)
		end
END TRY
Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc +' '+ @mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO


-- Modificado por Éduar Álvarez - Marzo 24 de 2015.
IF OBJECT_ID('SPG_frNomdetaCartera','P')	IS NOT NULL DROP PROCEDURE SPG_frNomdetaCartera
IF OBJECT_ID('db_SP_frNom_DetaCartera','P') IS NOT NULL DROP PROCEDURE db_SP_frNom_DetaCartera
GO

CREATE PROCEDURE db_SP_frNom_DetaCartera
	@nserie		nvarchar (6)='',	@codi_emple	nvarchar(4)='',		@feccuo	nvarchar(10)='',
	@valcuo		decimal(18,2)=0,	@valabo		decimal(18,2)=0,	@valsal	decimal(18,2)=0,
	@nomcuo		nvarchar(25)='',	@ncuota		decimal(18,2)=0,	@plazo	decimal(18,2)=0,
	@porcen		decimal(18,2)=0,	@codusu		nvarchar(8)='',		@fecsys	datetime,
	@ok			bit=0,				@vrdebito	decimal(18,2)=0,	@idemp	nvarchar(3)=''

AS 
BEGIN TRY
	Declare @mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc   char(30),
			@mFeccuo date

	Select @mAddMsg='', @mProc='db_SP_frNom_DetaCartera', @mfeccuo = convert(date,@feccuo)

	If Exists (Select nserie From Nom_Detacartera Where codi_emple=@codi_emple AND nserie=@nserie AND ncuota=@ncuota AND idemp=@Idemp)
		begin 
			Update Nom_DetaCartera Set	nserie   = @nserie,   feccuo  = @mfeccuo,
										valcuo	 = @valcuo,	  valabo  = @valabo,
										valsal	 = @valsal,	  nomcuo  = @nomcuo,
										ncuota	 = @ncuota,	  plazo	  = @plazo,
										porcen   = @porcen,   codusu  = @codusu,
										fecsys   = @fecsys,   ok	  = @ok,
										vrdebito = @vrdebito, idemp	  = @idemp
			Where codi_emple=@codi_emple AND nserie=@nserie AND ncuota=@ncuota AND idemp=@idemp
		end
	Else 
		begin 
			Insert Into Nom_Detacartera 
				   ( nserie, codi_emple, feccuo, valcuo, valabo, valsal, nomcuo, ncuota, plazo, porcen, codusu, fecsys, ok, vrdebito, idemp)
			Values (@nserie,@codi_emple,@mfeccuo,@valcuo,@valabo,@valsal,@nomcuo,@ncuota,@plazo,@porcen,@codusu,@fecsys,@ok,@vrdebito,@idemp)
		end  
END TRY 
Begin catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE()  IS NULL, @mProc +' '+ @mAddMsg, @mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
Go



-- Modificado por Éduar Álvarez - Marzo 20 de 2015.
IF OBJECT_ID('SPG_frNomHistoria','P')		IS NOT NULL DROP PROCEDURE SPG_frNomHistoria
IF OBJECT_ID('db_SP_NOM_HISTORIA_Set','P')	IS NOT NULL DROP PROCEDURE db_SP_NOM_HISTORIA_Set
GO

CREATE PROCEDURE db_SP_NOM_HISTORIA_Set
@ano		numeric(4)=0,
@mes		nvarchar(2)='',
@periodo	nvarchar(1)='',
@codi_sec	nvarchar(3)='',
@codi_emple	nvarchar(4)='',
@tran_codi	nvarchar(4)='',
@fecnov		datetime,
@qty		decimal(18,2)=0,
@qtyh		decimal(18,2)=0,
@valdeduc	decimal(18,2)=0,
@valdeven	decimal(18,2)=0,
@vr_parcial	decimal(18,2)=0,
@vr_total	decimal(18,2)=0,
@fecini		datetime,
@fecfin		datetime,
@consec		nvarchar(16)='',
@proc		int=0

AS 
BEGIN TRY
	Declare @mExiste char(1),
			@mNerror char(3),
			@mMsg	 nvarchar(190),
			@mLinea	 int,
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc	 char(25)

    Select @mExiste='N', @mNerror=7021, @mLinea=0, @mAddMsg='', @mProc='db_SP_NOM_HISTORIA_Set'

	If Exists (Select * From Nom_Historia 
			   Where año=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND tran_codi=@tran_codi)
		Set @mExiste='S'

	If @proc=1
	begin
		If @mExiste='N'
		begin
			Insert Into Nom_Historia (año,mes,periodo,codi_sec,codi_emple,tran_codi,fecnov,
									  qty,qtyh,valdeduc,valdeven,vr_parcial,vr_total,fecini,fecfin,consec)
							  Values (@ano,@mes,@periodo,@codi_sec,@codi_emple,@tran_codi,@fecnov,
									  @qty,@qtyh,@valdeduc,@valdeven,@vr_parcial,@vr_total,@fecini,@fecfin,@consec)
		end
	end

	If @proc=2
	begin
		If @mExiste='S'
		begin
			Update Nom_Historia
			   Set fecnov=@fecnov,mes=@mes, qty=@qty, qtyh=@qtyh, valdeduc=@valdeduc, valdeven=@valdeven,
				   vr_parcial=@vr_parcial,vr_total=@vr_parcial, fecini=fecini, fecfin=fecfin, consec=@consec
			 Where año=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND tran_codi=@tran_codi
		end
	end

	If @proc=3
	begin
		If @mExiste='S'
		begin
			Delete From Nom_Historia 
				  Where año=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND tran_codi=@tran_codi
		end
	end

END TRY 
Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO



-- Agregado por Éduar Álvarez - Marzo 20 de 2015.
IF OBJECT_ID('db_SP_NOM_ACUMULADO_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_ACUMULADO_Set
GO

CREATE PROCEDURE db_SP_NOM_ACUMULADO_Set
@ano		numeric(4)=0,
@mes		nvarchar(2)='',
@periodo	nvarchar(1)='',
@codi_sec	nvarchar(3)='',
@codi_emple	nvarchar(4)='',
@codi_tran	nvarchar(4)='',
@fecha		datetime,
@qty		decimal(18,2)=0,
@qtyh		decimal(18,2)=0,
@valor		decimal(18,2)=0,
@proc		int=0

AS 
BEGIN TRY
	Declare @mExiste char(1),
			@mNerror char(3),
			@mMsg	 nvarchar(190),
			@mLinea	 int,
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc	 char(25)

    Select @mExiste='N', @mNerror=7021, @mLinea=0, @mAddMsg='', @mProc='db_SP_NOM_ACUMULADO_Set'

	If Exists (Select * From Nom_Acumulado
			   Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND codi_tran=@codi_tran)
		Set @mExiste='S'

	If @proc=1
	begin
		If @mExiste='N'
		begin
			Insert Into Nom_Acumulado 
						( ano, mes, periodo, codi_sec, codi_emple, codi_tran, fecha, qty, qtyh, valor)
				 Values (@ano,@mes,@periodo,@codi_sec,@codi_emple,@codi_tran,@fecha,@qty,@qtyh,@valor)
		end
	end

	If @proc=2
	begin
		If @mExiste='S'
		begin
			Update Nom_Acumulado
			   Set codi_sec=@codi_sec,fecha=@fecha,qty=@qty,qtyh=@qtyh, valor=@valor
			 Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND codi_tran=@codi_tran
		end
	end

	If @proc=3
	begin
		If @mExiste='S'
		begin
			Delete From Nom_Acumulado
				  Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND codi_tran=@codi_tran
		end
	end

END TRY 
Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsg 
End Catch 
GO



IF OBJECT_ID('SPG_frNomHistoriaCons','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_frNomHistoriaCons
END
GO
CREATE PROCEDURE SPG_frNomHistoriaCons

@coddiat	nvarchar (4),
@codsubt	nvarchar (4),
@codsalud	nvarchar (4),
@codpension	nvarchar (4),
@codsolid	nvarchar (4),
@ano		decimal(4, 0),
@mes		nvarchar (2),
@periodo	nvarchar (1),
@idemp		nvarchar (3),
@tablanomina nvarchar(20)


AS 
BEGIN Try 
   declare @r int , @mExiste char(1)
   declare @mNerror char(3),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)
           
   select @r = 0 , @mExiste ='N', @mNerror='021',@mLinea=0,@mAddMsg='' 
   set @mProc  ='SPG_frNomCartera'        

if @tablanomina = 'nom_historia'
begin
  SELECT e.nombret,e.cedula,e.salario,e.sueldo, h.*,
	   (case when (tr.acumula  = 1 and h.tran_codi  =@coddiat)  then h.valdeven else 0 end) as sueldobase,
	   (case when (tr.acumula  = 1 and h.tran_codi  = @codsubt)  then h.valdeven else 0 end) as subsidioT,
	   (case when (h.tran_codi  = @codsalud)  then h.valdeduc else 0 end) as salud,
	   (case when (h.tran_codi  = @codpension)  then h.valdeduc else 0 end) as pension,
	   (case when (h.tran_codi  = @codsolid)  then h.valdeduc else 0 end) as solidaridad,
	   	  
	   (case when ( h.tran_codi  <> @coddiat AND 
					h.tran_codi  <> @codsubt AND 
					h.tran_codi  <> @codsalud AND 
					h.tran_codi  <> @codpension AND 
					h.tran_codi  <> @codsolid)  
				    then h.valdeven else 0 end) AS Odevengados,

		(case when ( h.tran_codi  <> @coddiat AND 
					h.tran_codi  <> @codsubt AND 
					h.tran_codi  <> @codsalud AND 
					h.tran_codi  <> @codpension AND 
					h.tran_codi  <> @codsolid )  
    			    then h.valdeduc  else 0 end) AS Odeducidos,
		
		(case when ( tr.base = 4 ) then h.valdeven  else 0 end) AS Hextras

		
FROM   nom_historia  as   h LEFT join nom_otrdat o  ON 
		(h.tran_codi  = o.coddiat)  OR
		(h.tran_codi  = o.codsubt) OR 
		(h.tran_codi  = o.codsalud)  OR 
		(h.tran_codi  = o.codpension  ) 
	    inner join nom_empleado as e ON h.codi_emple = e.codi_emple 
	    inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi
WHERE  h.año=@ano AND h.mes=@mes AND h.periodo= @periodo
order by e.nombret
end 

if @tablanomina = 'nom_novedad'
begin
  SELECT e.nombret,e.cedula,e.salario,e.sueldo, h.*,
	   (case when (tr.acumula  = 1 and h.tran_codi  =@coddiat)  then h.valdeven else 0 end) as sueldobase,
	   (case when (tr.acumula  = 1 and h.tran_codi  = @codsubt)  then h.valdeven else 0 end) as subsidioT,
	   (case when (h.tran_codi  = @codsalud)  then h.valdeduc else 0 end) as salud,
	   (case when (h.tran_codi  = @codpension)  then h.valdeduc else 0 end) as pension,
	   (case when (h.tran_codi  = @codsolid)  then h.valdeduc else 0 end) as solidaridad,
	   	  
	   (case when ( h.tran_codi  <> @coddiat AND 
					h.tran_codi  <> @codsubt AND 
					h.tran_codi  <> @codsalud AND 
					h.tran_codi  <> @codpension AND 
					h.tran_codi  <> @codsolid)  
				    then h.valdeven else 0 end) AS Odevengados,

		(case when ( h.tran_codi  <> @coddiat AND 
					h.tran_codi  <> @codsubt AND 
					h.tran_codi  <> @codsalud AND 
					h.tran_codi  <> @codpension AND 
					h.tran_codi  <> @codsolid )  
    			    then h.valdeduc  else 0 end) AS Odeducidos,
		
		(case when ( tr.base = 4 ) then h.valdeven  else 0 end) AS Hextras

		
FROM   nom_novedad  as   h LEFT join nom_otrdat o  ON 
		(h.tran_codi  = o.coddiat)  OR
		(h.tran_codi  = o.codsubt) OR 
		(h.tran_codi  = o.codsalud)  OR 
		(h.tran_codi  = o.codpension  ) 
	    inner join nom_empleado as e ON h.codi_emple = e.codi_emple 
	    inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi
WHERE  h.ano=@ano AND h.mes=@mes AND h.periodo= @periodo
order by e.nombret
end 
/*
   if @@ERROR=0 
   Begin 		
     set @mMsg=(select m.Mensaje+@mAddMsg  from glb_mensaje m where m.id=@mNerror)
     exec sp_MensajeSql 1,@mMsg,@mProc,@mLinea,@mNerror
   End   
  
 */ 
END try 
Begin catch
  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 

GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado por Éduar Álvarez - Marzo 12 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_frNomNovedad','P')		 IS NOT NULL DROP PROCEDURE SPG_frNomNovedad
IF OBJECT_ID('db_SP_fr_Nom_Novedad_Set','P') IS NOT NULL DROP PROCEDURE db_SP_fr_Nom_Novedad_Set
GO

CREATE PROCEDURE db_SP_FR_NOM_NOVEDAD_Set
	@ano		numeric (4)=0,		@mes		nvarchar(2)='',	 @periodo	nvarchar(1)='',		@codi_emple	nvarchar(4)='',		@codi_sec nvarchar(3)='',
	@tran_codi	nvarchar(4)='',		@fecnov		datetime,		 @qty		decimal (18,2)=0,	@qtyh		decimal(18,2)=0,	@valdeven decimal(18,2)=0,
	@valdeduc	decimal (18,2)=0,	@vr_parcial	decimal(18,2)=0, @vr_total	decimal	(18,2)=0,	@fecini		datetime,			@fecfin	  datetime, 	
	@codusu		nvarchar(10)='',	@opcion		numeric(1)=0
AS
SET NOCOUNT ON
BEGIN TRY
	Declare	@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc   char(30)

	Select @mAddMsg='', @mProc = 'db_SP_fr_Nom_Novedad_Set'
	
	if @opcion = 0
	begin 
		If NOT EXISTS (Select codi_emple From Nom_Novedad Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND tran_codi=@tran_codi)
		begin
			Insert Into Nom_Novedad (ano,   mes,  periodo,  codi_emple,  codi_sec,  tran_codi,  qty,  qtyh,	 fecnov,  fecini,  fecfin,  valdeven,  valdeduc,  
					vr_parcial,  vr_total,  codusu)
			Values (@ano, @mes, @periodo, @codi_emple, @codi_sec, @tran_codi, @qty, @qtyh,	@fecnov, @fecini, @fecfin, @valdeven, @valdeduc, @vr_parcial, @vr_total, @codusu)
		end
		Else
		begin
			Update	Nom_Novedad
			Set		codi_sec=@codi_sec, qty=@qty, qtyh=@qtyh, fecnov=@fecnov, fecini=@fecini, fecfin=@fecfin, valdeven=@valdeven, valdeduc=@valdeduc, vr_parcial=@vr_parcial,
					vr_total=@vr_total, codusu=@codusu 
			Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND tran_codi=@tran_codi
		end
	end 
	else 
		delete from Nom_Novedad 
		Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND tran_codi=@tran_codi

	
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO



IF OBJECT_ID('SPG_frProvisionesACUM','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_frProvisionesACUM
END
GO
CREATE PROCEDURE SPG_frProvisionesACUM

@ano nvarchar (4), 
@mes  nvarchar (2),
@codi_sec nvarchar (4)


  --@pComporta    nVarchar(max), 
AS
BEGIN try 
   declare @r int , @existe char(1),@mNerror int,@mMsg nvarchar(190),@mLinea  int,
           @mAddMsg nvarchar(50),@mProc char(20),@pVerMsgBox int=0

   select @existe ='N',@mNerror = 7021,@mLinea=0,@mAddMsg='',@mProc = 'SPG_frProvisionesSPAC'
     

   begin
    
	 SELECT h.codi_emple,e.nombret, h.codi_sec,'' as devengado, 
                             '' as salud,'' as pension,'' as arl, 
                             '' as cajacomp,'' as sena,'' as icbf, '' as Total 
                     FROM nom_historia as h inner join nom_empleado as e
                              ON h.codi_emple = e.codi_emple 
                     
                     
					WHERE h.mes=@mes AND  h.año = @ano AND 
                            h.codi_sec=@codi_sec

					 GROUP BY h.codi_emple,e.nombret,h.codi_sec 
   end
    
 
  
END try 

Begin Catch
  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End catch 

GO

IF OBJECT_ID('SPG_frProvisionesCIPV','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_frProvisionesCIPV
END
GO
CREATE PROCEDURE SPG_frProvisionesCIPV

@ano nvarchar (4), 
@mes  nvarchar (2),
@codi_sec nvarchar (4),
@porccesan decimal (12,4),
@porcintcesan decimal (12,4),
@porcprimas decimal (12,4),
@porcvacac decimal (12,4)


  --@pComporta    nVarchar(max), 
AS
BEGIN try 
   declare @r int , @existe char(1),@mNerror int,@mMsg nvarchar(190),@mLinea  int,
           @mAddMsg nvarchar(50),@mProc char(20),@pVerMsgBox int=0

   select @existe ='N',@mNerror = 7021,@mLinea=0,@mAddMsg='',@mProc = 'SPG_frProvisionesCIPV'
     

   begin
    
	SELECT h.codi_emple,e.nombret,
       h.codi_sec,
        SUM(case when tr.acumula  = 1  then h.valdeven else 0 end) as devengado,      
       (SUM(case when tr.accesan  = 1 and e.acuprov =1 then  h.valdeven else 0 end))*@porccesan as cesantias,          
       (SUM(case when tr.acinter  = 1 and e.acuprov=1 then h.valdeven else 0 end))*@porcintcesan as Intereses,   
       (SUM(case when tr.acprima  = 1  then h.valdeven else 0 end))*@porcprimas as Primas,   
       (SUM(case when tr.acvacac  = 1  then h.valdeven else 0 end))*@porcvacac as vacaciones,
        '' as Total
     FROM nom_historia as h
                    inner join nom_empleado as e ON h.codi_emple = e.codi_emple
                    inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi              
                      
    WHERE h.mes=@mes AND  h.año = @ano AND
                          h.codi_sec= @codi_sec
 
                     GROUP BY h.codi_emple,e.nombret,h.codi_sec
   end
    
 
  
END try 

Begin Catch
  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End catch 
GO

IF OBJECT_ID('SPG_frProvisionesENT','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_frProvisionesENT
END
GO
CREATE PROCEDURE SPG_frProvisionesENT

@ano nvarchar (4), 
@mes  nvarchar (2),
@codi_sec nvarchar (4),
@porcpension decimal (12,4),
@porcsalud decimal (12,4),
@porcesantias decimal (12,4)


  --@pComporta    nVarchar(max), 
AS
BEGIN try 
   declare @r int , @existe char(1),@mNerror int,@mMsg nvarchar(190),@mLinea  int,
           @mAddMsg nvarchar(50),@mProc char(20),@pVerMsgBox int=0

   select @existe ='N',@mNerror = 7021,@mLinea=0,@mAddMsg='',@mProc = 'SPG_frProvisionesSPAC'
     

   begin
    
--PENSION ---------------------------------------------------------------------------------
SELECT   h.codi_sec,t1.nitter ,t1.nomter as entidad,
	   (SUM(case when tr.acpension = 1 and e.acupen =1 then h.valdeven else 0 end))*@porcpension as valor,	  	   
	    '' as Total, 'PENSION'	as entidadPF				
FROM nom_historia as h 
    inner join nom_empleado as e ON h.codi_emple = e.codi_emple 
    inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi
	left join glb_terceros as t1 ON  e.codi_pension = t1.nitter 	
WHERE h.mes=@mes AND  h.año =@ano AND h.codi_sec= @codi_sec
GROUP BY h.codi_sec, T1.NITTER, t1.nomter
UNION ALL
--SALUD ---------------------------------------------------------------------------------
SELECT   h.codi_sec,t2.nitter ,t2.nomter,
	   (SUM(case when tr.acsalud = 1 and e.acueps =1 then h.valdeven else 0 end))*@porcsalud as sumsalud,	  	   
	    '' as Total, 'SALUD'					
FROM nom_historia as h 
    inner join nom_empleado as e ON h.codi_emple = e.codi_emple 
    inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi
	left join glb_terceros as t2 ON  e.codi_eps = t2.nitter 
	
WHERE h.mes=@mes AND  h.año =@ano AND h.codi_sec= @codi_sec
GROUP BY h.codi_sec,e.codi_eps, T2.NITTER, t2.nomter
UNION ALL
--CESANTIAS--------------------------------------------------------------------------------
SELECT  h.codi_sec,t3.nitter ,t3.nomter as entidad,
	   (SUM(case when tr.accesan = 1 then h.valdeven else 0 end))*@porcesantias as sumcesan,	  	   
	    '' as Total,'CESANTIAS'					
FROM nom_historia as h 
    inner join nom_empleado as e ON h.codi_emple = e.codi_emple 
    inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi	
	left join glb_terceros as t3 ON  e.codi_cesan = t3.nitter 
	
WHERE h.mes=@mes AND  h.año =@ano AND h.codi_sec= @codi_sec
GROUP BY h.codi_sec, T3.NITTER, t3.nomter
UNION ALL 
--ARL------------------------------------------------------------------------------------
SELECT   h.codi_sec,t4.nitter ,t4.nomter as entidad,
	   (SUM(case when tr.acarp = 1 then h.valdeven else 0 end))*e.arpemp/100 as sumarl,	  	   
	    '' as Total, 'ARL'				
FROM nom_historia as h 
    inner join nom_empleado as e ON h.codi_emple = e.codi_emple 
    inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi	
	left join glb_terceros as t4 ON  e.codi_arp = t4.nitter 
WHERE h.mes=@mes AND  h.año =@ano AND h.codi_sec= @codi_sec
GROUP BY h.codi_sec,e.arpemp,e.codi_ARP, T4.NITTER, t4.nomter
   end
    
 
  
END try 

Begin Catch
  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End catch 

GO

IF OBJECT_ID('SPG_frProvisionesPLAN','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_frProvisionesPLAN
END
GO
CREATE PROCEDURE SPG_frProvisionesPLAN

@ano nvarchar (4),
@mes  nvarchar (2),
@codi_sec nvarchar (4),
@porcpensionE decimal (12,4),
@porcpensionT decimal (12,4),
@porcsaludE decimal (12,4),
@porcsaludT decimal (12,4)
 
  --@pComporta    nVarchar(max),
AS
BEGIN try
   declare @r int , @existe char(1),@mNerror int,@mMsg nvarchar(190),@mLinea  int,
           @mAddMsg nvarchar(50),@mProc char(20),@pVerMsgBox int=0
 
   select @existe ='N',@mNerror = 7021,@mLinea=0,@mAddMsg='',@mProc = 'SPG_frProvisionesPLAN'
      
 
   begin
     
       
    SELECT h.codi_emple,e.nombret,e.arpemp,
       h.codi_sec,
       SUM(case when tr.acumula  = 1  then h.valdeven else 0 end) as devengado,      
       (SUM(case when tr.acarp   = 1 then h.valdeven else 0 end))* (e.arpemp/100)  as arl,
       (SUM(case when tr.acpension = 1 and e.acupen=1 then  h.valdeven else 0 end))*@porcpensionT as pensionT, 
       (SUM(case when tr.acpension = 1 and e.acupen=1 then  h.valdeven else 0 end))*@porcpensionE as pensionE,        
       (SUM(case when tr.acsalud   = 1 and e.acueps=1 then h.valdeven else 0 end))*@porcsaludT as saludT,         
       (SUM(case when tr.acsalud   = 1 and e.acueps=1 then h.valdeven else 0 end))*@porcsaludE as saludE,
                      
       '' as Total,    
                             e.codi_pension,e.codi_eps,e.codi_cesan,e.codi_arp,
                            t1.nomter as nompension, t2.nomter as nomsalud,
                            t3.nomter as nomcesantias, t4.nomter as nomarl
                     FROM nom_historia as h
                             inner join nom_empleado as e ON h.codi_emple = e.codi_emple
                             inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi
                             left join glb_terceros as t1 ON  e.codi_pension = t1.nitter
                             left join glb_terceros as t2 ON  e.codi_eps = t2.nitter
                             left join glb_terceros as t3 ON  e.codi_cesan = t3.nitter
                             left join glb_terceros as t4 ON  e.codi_arp = t4.nitter
                      
                    WHERE h.mes=@mes AND  h.año = @ano AND
                            h.codi_sec= @codi_sec
 
                     GROUP BY h.codi_emple,e.nombret,h.codi_sec,e.arpemp,
                          e.codi_pension,e.codi_eps,e.codi_cesan,e.codi_arp,
                               t1.nomter, t2.nomter, t3.nomter, t4.nomter
 
     
   end  
  
   
END try
 
Begin Catch
  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox
End catch
 
GO

IF OBJECT_ID('SPG_frProvisionesSPAC','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_frProvisionesSPAC
END
GO
CREATE PROCEDURE SPG_frProvisionesSPAC

@ano nvarchar (4), 
@mes  nvarchar (2),
@codi_sec nvarchar (4),
@porcpension decimal (12,4),
@porcsalud decimal (12,4),
@porccc decimal (12,4),
@porcsena decimal (12,4),
@porcicbf decimal (12,4)
  --@pComporta    nVarchar(max), 
AS
BEGIN try 
   declare @r int , @existe char(1),@mNerror int,@mMsg nvarchar(190),@mLinea  int,
           @mAddMsg nvarchar(50),@mProc char(20),@pVerMsgBox int=0

   select @existe ='N',@mNerror = 7021,@mLinea=0,@mAddMsg='',@mProc = 'SPG_frProvisionesSPAC'
     

   begin
    
	SELECT h.codi_emple,e.nombret,e.arpemp,
	   h.codi_sec, 
	    SUM(case when tr.acumula  = 1  then h.valdeven else 0 end) as devengado,	   
	   (SUM(case when tr.acpension = 1 and e.acupen=1 then  h.valdeven else 0 end))*@porcpension as pension,	   	   
	   (SUM(case when tr.acsalud   = 1 and e.acueps=1 then h.valdeven else 0 end))*@porcsalud as salud,	   
       (SUM(case when tr.acarp   = 1 then h.valdeven else 0 end))* (e.arpemp/100)  as arl,	   
	   (SUM(case when tr.accomfa = 1 then h.valdeven else 0 end))*@porccc as cajacomp,	   
	   (SUM(case when tr.acsena = 1 then h.valdeven else 0 end))*@porcsena as sena,	   
	   (SUM(case when tr.acicbf = 1 then h.valdeven else 0 end))*@porcicbf as icbf,	          	   
	   '' as Total,		
							 e.codi_pension,e.codi_eps,e.codi_cesan,e.codi_arp,
							t1.nomter as nompension, t2.nomter as nomsalud, 
							t3.nomter as nomcesantias, t4.nomter as nomarl
                     FROM nom_historia as h 
					         inner join nom_empleado as e ON h.codi_emple = e.codi_emple 
							 inner join nom_transaccion as tr ON  tr.tran_codi = h.tran_codi
							 left join glb_terceros as t1 ON  e.codi_pension = t1.nitter 
							 left join glb_terceros as t2 ON  e.codi_eps = t2.nitter 
							 left join glb_terceros as t3 ON  e.codi_cesan = t3.nitter 
							 left join glb_terceros as t4 ON  e.codi_arp = t4.nitter 
					WHERE h.mes=@mes AND  h.año = @ano AND 
                            h.codi_sec= @codi_sec
					 GROUP BY h.codi_emple,e.nombret,h.codi_sec,e.arpemp,
					      e.codi_pension,e.codi_eps,e.codi_cesan,e.codi_arp,
							   t1.nomter, t2.nomter, t3.nomter, t4.nomter

   end
END try 

Begin Catch
  set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End catch 
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_MensajeSql','P') IS NOT NULL	DROP PROCEDURE SPG_MensajeSql
GO
CREATE PROCEDURE SPG_MensajeSql
	@pAddMsg nVarchar(230)='', @pVerMsgBox int=0
AS
Begin
	Declare @mMsg      nVarchar(230) = ERROR_MESSAGE(),
	        @mProc     nVarchar(90)  = ISNULL(ERROR_PROCEDURE(),@pAddMsg),
	        @mLinea    int           = ERROR_LINE(),-- IIf(@pnError<>0,ERROR_NUMBER(),@pnError),--ERROR_LINE(),
			@mDet      nVarchar(230) = '',
			@mSug      nVarchar(230) = '',
			@mSev      int           = ERROR_SEVERITY(),
	        @mNroError int           = ERROR_NUMBER() --IIf(@pnError=0,ERROR_NUMBER(),@pnError)

	If @mNroError < 50001
		Select 0 msgsug, @mProc SP, @mNroError NError, @mLinea Linea, @mMsg	Msg, @pVerMsgBox VerMsgBox
	Else
		Begin
			Set	@mNroError = @mNroError-50000
			Select @mMsg=LTRIM(RTRIM(m.nombre))+@pAddMsg,@mDet=detalle,@mSug=sug  from glb_error m where m.id=@mNroError
			Select 1 msgsug,@mProc SP, @mNroError NError , @mLinea Linea , @mMsg	Msg, @mDet detalle,@mSug sug, @pVerMsgBox VerMsgBox
		End
End


/****** Object:  StoredProcedure [dbo].[Com_Sp_ActFacturaProveedor]    Script Date: 16/12/2013 7:41:43 ******/
SET ANSI_NULLS ON
GO

IF OBJECT_ID('SPG_Menu','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_Menu
END
GO
CREATE PROCEDURE SPG_Menu
	@pIdemp nvarchar(3), @pPerfil nvarchar(3)
AS
BEGIN TRY
	DECLARE @mCount numeric(10)

   If @pPerfil ='000'
      Select * From glb_menu ME 
                    inner join glb_modulos MO on MO.codmod=ME.modulo and  ME.codigo <>'0'  and ME.TipOpc<4 And ME.Ver=1
   Else
   Begin 
  --    RAISERROR ('Perfil Errado o no Existe.',16,1)
		DECLARE @TemMenu TABLE (nomfor nvarchar(40), modulo nvarchar(2), codigo decimal(3,0), desopc nvarchar(60), padre decimal(10,0),
								arcdll nvarchar(25), tipopc decimal(1,0),nommod nvarchar(30))
		DECLARE @TemCodigo TABLE (padre decimal(10, 0), modulo nvarchar(2))
		DECLARE @TemPadre  TABLE (padre decimal(10, 0), modulo nvarchar(2))
		
		INSERT INTO @TemMenu(nomfor,modulo,codigo,desopc,padre,arcdll,tipopc,nommod)
		SELECT	me.nomfor, me.modulo, me.codigo, me.desopc, me.padre, me.arcdll, me.tipopc,md.nommod  
		FROM	glb_menu me
				INNER JOIN glb_accesos ac ON me.nomfor = ac.nomfor 
				INNER JOIN glb_modulos md ON me.modulo = md.codmod 
		WHERE	me.tipopc<4 AND ac.codper=@pPERFIL AND ac.accfor=1

		INSERT INTO @TemCodigo(padre,modulo)
		SELECT Padre,modulo FROM @TemMenu  

		SELECT @mCount=Count(*) From @TemCodigo

		while @mcount > 0 begin 
			INSERT INTO @TemMenu(nomfor,modulo,codigo,desopc,padre,arcdll,tipopc,nommod)
			select	me.nomfor, me.modulo, me.codigo, me.desopc, me.padre, me.arcdll, me.tipopc,md.nommod  
			from	glb_menu me
					INNER JOIN glb_modulos md ON me.modulo = md.codmod 
			where	me.TipOpc<4 and concat(me.Codigo,me.modulo) in (Select concat(Padre,modulo) FROM @TemCodigo)
					AND me.Codigo!=me.Padre
			
			delete from @TemPadre 
			insert into @TemPadre(Padre,modulo) 
			select	me.padre,me.codigo
			from	glb_menu me
					INNER JOIN glb_modulos md ON me.modulo = md.codmod 
			where	me.TipOpc<4 and concat(me.Codigo,me.modulo) in (Select concat(Padre,modulo) FROM @TemCodigo)
					AND me.Codigo!=me.Padre
						
			Delete from @TemCodigo
			insert into @TemCodigo(padre,modulo)	
			SELECT Padre,modulo FROM @TemPadre 

			select @mCount=count(*) from @TemCodigo	
		end 
		--Selecciono los nodos principales
		select	nomfor,modulo,codigo,desopc,padre,arcdll,tipopc,nommod 
		from	@TemMenu
		union all 
		SELECT	me.nomfor, me.modulo, codigo, me.desopc, me.padre, me.arcdll, me.tipopc, mo.nommod
		FROM 	Glb_menu me 
				inner join Glb_modulos mo ON me.modulo = mo.codmod 
		WHERE 	me.Padre=me.codigo AND me.TipOpc<4 and 	
				concat(me.Codigo,me.modulo) in (Select Concat(Padre,modulo) FROM @TemMenu) 
		order by modulo,padre,codigo
	End    
	
END TRY 

Begin Catch 
   Exec sp_MensajeSql
End Catch 
GO






IF OBJECT_ID('SPG_TransaccionesAbiertas','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_TransaccionesAbiertas
END
GO
CREATE PROCEDURE SPG_TransaccionesAbiertas
@pCerrar bit=0 -- 0=ROLLBACK y 1=COMMIT 
AS
BEGIN
	DECLARE @mNro int 
	
	select @mNro= @@TRANCOUNT  
	If @mNro > 0
	Begin 
	   If @pCerrar =0 
	      ROLLBACK
	   If @pCerrar =1 
	      COMMIT 
	End  
	     
END
GO

IF OBJECT_ID('SPG_ValidaDcoTransaccion','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ValidaDcoTransaccion
END
GO
CREATE PROCEDURE SPG_ValidaDcoTransaccion
 @pcodtran nvarchar(2), @pnomtran nvarchar(30),@pTiptran bit,
   @pTipcon  nvarchar(1), @pFuesys  bit,         @pModulo bit
AS
BEGIN
   Declare @mCodmod      nvarchar(2)='',  
           @mCodcue      nvarchar(8)='', @mCodfue       nvarchar(5)='', 
           @mCodmov      nvarchar(3)='', @mCodcod       nvarchar(3)='', @mAnultran   nvarchar(2)='', 
           @mTipven      decimal(1,0)=0, @mDoble        bit=0,          @mConsec     bit=0,           
           @mActiva      bit=0,          @mContable     bit=0,          @mDevolprove bit=0 ,         
           @mManejaiva   bit=0,          @mFiscdefaul   bit=0,          @mFuente     nvarchar(2)='',  
           @mExenta      bit=0,          @mConsignacion bit=0,          @mTrancm     nvarchar(2)='',  
           @mTrannd      nvarchar(2)='', @mTrancp       nvarchar(2)='', @mNoenvio    bit=0,          
           @mUnificarcf  bit=0,          @mBalaninv     bit=0,          @mIdEmp      nvarchar(3)='',
           @mContran     decimal(8,0)=1,   @mAñotran      decimal (4,0),  @mOp         int=1
   
   If Not Exists(Select codtran From Glb_Transaccion Where Codtran=@pcodtran)
   Begin        
      Exec SPG_DcoTransaccion @pcodtran, @pnomtran,     @pTiptran,  @pModulo,    @mCodmod,
                             @mCodcue,  @pTipcon,      @mCodfue,   @mCodmov,    @mCodcod,
                             @mAnultran,@mTipven,      @mDoble,    @mConsec,    @mActiva,
                             @mContable,@mDevolprove,  @mManejaiva,@mFiscdefaul,@mFuente,
                             @mExenta,  @mConsignacion,@mTrancm,   @mTrannd,    @mTrancp,
                             @mNoenvio, @mUnificarcf,  @mBalaninv, @mIdEmp,     @mContran,
                             @mAñotran, @mOp
   End         
END
GO

IF OBJECT_ID('SPG_VenFacturas','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_VenFacturas
END
GO
CREATE PROCEDURE SPG_VenFacturas
-- Add the parameters for the stored procedure here
	@pIdemp      nvarchar(3)      , @pCodcto     nvarchar(3),       @pTipfac     nvarchar(2),
	@pNumfac     nvarchar(8)      , @pOrden      nvarchar(10) = '', @pFecfac     nvarchar(10),--datetime 
	@pVenfac     datetime     = '', @pCodcue     nvarchar(8),       @pNitcli     nvarchar(15)   = '',
	@pNitven     nvarchar(15) = '', @pVtafac     decimal(12,0)= 0,  @pIvafac     decimal(12 ,0) = 0,
	@pOtrfac     decimal(12,2)= 0,  @pCuofac     decimal(12,0)= 0,  @pAjpfac     decimal(12 ,2) = 0,
	@pAntfac     decimal(12,2)= 0,  @pDevfac     decimal(12,0)= 0,  @pAbofac     decimal(12 ,0) = 0,
	@pDctfac     decimal(12,0)= 0,  @pRetfac     decimal(12,0)= 0,  @pRicfac     decimal(12 ,0) = 0,
	@pRivfac     decimal(12,0)= 0,  @pNetfac     decimal(12,0)= 0,  @pCosfac     decimal(12 ,0) = 0,
	@pNumcon     nvarchar(8)  = '', @pEstfac     nvarchar(1)  = '', @pEntrega    decimal(14 ,2) = 0,
	@pCambio     decimal(14,2)= 0,  @pCodusu     nvarchar(8)  = '', @pObserva    nvarchar(max)  = '',
	@pAjuste     bit          = 0,  @pInifac     datetime     = '', @pCosaju     float          = '',
	@pPendiente  bit          = 0,	@pEstado     nvarchar(10)   = '', 
	@pEstret     nvarchar(1)  = '', @pPlaza      nvarchar(40) = '', @pTipoventa  nvarchar(10)   = '', 
	@pValini     decimal(14 ,2) = 0,@pSaldocli   decimal(12,2)= 0,  @pDocrel     nvarchar(13)   = '', 
	@pCodturno   decimal(10 ,0) = 0,@pPlaca      nvarchar(6)  = '', @pValadmon   decimal(14,2)  = 0,  
	@pValimprev  decimal(14 ,2) = 0,@pValutil    decimal(14,2)= 0,  @pTipo       nvarchar(2)    = '', 
	@pTrm        decimal(14 ,2) = 0,@pCuoini     decimal(10,2)= 0,  @pLnentrega  decimal(10,0)  = 0,  
	@pLnvueltas  decimal(10 ,0) = 0,@pVuelo      decimal(10,0)= 0,  @pPorflete   decimal(14,2)  = 0,  
	@pPorvol     decimal(14 ,2) = 0,@pValdolar   decimal(14,2)= 0,  @pPropina    decimal(14,2)  = 0,  
	@pDespacho   nvarchar(8)  = '',	@pCendespach nvarchar(3)  = '', @pAdmon      decimal(14,2)  = 0,  
	@pIntmora    decimal(14 ,2) = 0,@pCuotaext   decimal(14,2)= 0,  @pTransporte decimal(14,2)  = 0,  
	@pArancel    decimal(14 ,2) = 0,@pImpfac     decimal(14,2)= 0,  @pComie      decimal(14,2)  = 0,  
	@pContrato   nvarchar(10) = '',	@pValflete   decimal(14,2)= 0,  @pConfirmada bit            = 0,  
	@pAnticipo   decimal(14 ,2) = 0,@pComision   decimal(14,2)= 0,  @pTotbono    decimal(14,2)  = 0,  
	@pDevretfac  decimal(14 ,2) = 0,@pDevricfac  decimal(14,2)= 0,  @pDevrivfac  decimal(14,2)  = 0,  
	@pBpromo     decimal(14 ,0) = 0,@pBviatico   decimal(14,0)= 0,  @pQtyper     decimal(3,0)   = 0,  
	@pDomicilio  bit          = 0,	@pAdultos    decimal(10,0)= 0,  @pNinos      decimal(10,0)  = 0, 
	@pCodguia    nvarchar(15) = '',	@pImpofac    decimal(14,2)= 0

	
AS
BEGIN TRY
   --@pFecfac,@pVenfac,@pInifac
   Declare @mExiste char(1), 
           @mNerror int=57027,
           @mMsg    nvarchar(230),
           @mLinea  int,
           @mAddMsg nvarchar(190),
           @mProc   char(20),
		   @pVerMsgBox int=0,
		   @mNumfac nvarchar(8)='',
		   @mAno    integer,
		   @mMes    integer,
           @mdFecfac date,
		   @mdVenfac date,
		   @mdInifac date,
           @mSqlm nvarchar(max)
   
   select @mAno = datepart(year,getdate()),@mMes = month(getdate())
   
   exec spg_consecut @pIdemp,@pCodcto,@pTipfac,@mAno,@mMes,1 
   select @mNumfac = dbo.FE_Consecut ( @pIdemp,@pCodcto,@pTipfac,@mAno,@mMes,0)
   Select @mNumfac =replicate('0',8-len(ltrim(rtrim(convert(nvarchar(8),@mNumfac)))))+convert(nvarchar(8),@mNumfac)    
   
   If exists(select numfac from ven_facturas where idemp=@pIdemp And numfac=@pNumfac And tipfac=@pTipfac)
   Begin 
      select @mNerror=57005,@mAddMsg=';Ya existe.;';
	  throw @mNerror,@mAddMsg,1
   End
   Else 
   Begin 
     Insert Into Ven_Facturas(idemp,codcto,tipfac,numfac,orden,fecfac,venfac,codcue,nitcli,
	                          nitven,vtafac,ivafac,otrfac, cuofac, ajpfac, antfac, devfac,abofac, 
							  dctfac, retfac, ricfac, rivfac, netfac, cosfac, numcon, estfac, entrega, 
							  cambio, codusu, observa, ajuste, inifac, cosaju, pendiente,estado,estret, 
							  plaza, tipoventa, valini, saldocli, docrel, codturno, placa, valadmon, valimprev, 
							  valutil, tipo, trm, cuoini, lnentrega, lnvueltas, vuelo, porflete, porvol, 
							  valdolar, propina, despacho, cendespach, admon, intmora, cuotaext, transporte, arancel, 
							  impfac, comie, contrato, valflete, confirmada, anticipo, comision, totbono, devretfac, 
							  devricfac, devrivfac, bpromo, bviatico, qtyper, domicilio, adultos, ninos, codguia, 
							  impofac)
				       Values(@pIdemp,@pCodcto,@pTipfac,@pNumfac,@pOrden,@pFecfac,@pVenfac,@pCodcue,@pNitcli,
					          @pNitven,@pVtafac,@pIvafac,@pOtrfac,@pCuofac,@pAjpfac,@pAntfac,@pDevfac,@pAbofac,
							  @pDctfac,@pRetfac,@pRicfac,@pRivfac,@pNetfac,@pCosfac,@pNumcon,@pEstfac,@pEntrega,
							  @pCambio,@pCodusu,@pObserva,@pAjuste,@pInifac,@pCosaju,@pPendiente,@pEstado,@pEstret,
							  @pPlaza,@pTipoventa,@pValini,@pSaldocli,@pDocrel,@pCodturno,@pPlaca,@pValadmon,@pValimprev,
							  @pValutil,@pTipo,@pTrm,@pCuoini,@pLnentrega,@pLnvueltas,@pVuelo,@pPorflete,@pPorvol,
							  @pValdolar,@pPropina,@pDespacho,@pCendespach,@pAdmon,@pIntmora,@pCuotaext,@pTransporte,@pArancel,
							  @pImpfac,@pComie,@pContrato,@pValflete,@pConfirmada,@pAnticipo,@pComision,@pTotbono,@pDevretfac,
							  @pDevricfac,@pDevrivfac,@pBpromo,@pBviatico,@pQtyper,@pDomicilio,@pAdultos,@pNinos,@pCodguia,
							  @pImpofac)

     

     --print 'Factura creada' 
   End 

   
       
End TRY

Begin Catch
       
	Set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch  

GO

IF OBJECT_ID('SPG_VenFacturasprb','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_VenFacturasprb
END
GO
CREATE PROCEDURE SPG_VenFacturasprb
	-- Add the parameters for the stored procedure here
	@pIdemp      nvarchar(3),      
	@pVenfac     datetime     = '', @pNitcli     nvarchar(15)   = '',
	@pNitven     nvarchar(15) = '', @pVtafac     decimal(12,0)= 0,  @pIvafac     decimal(12 ,0) = 0,
	@pOtrfac     decimal(12,2)= 0,  @pCuofac     decimal(12,0)= 0,  @pAjpfac     decimal(12 ,2) = 0,
	@pAntfac     decimal(12,2)= 0,  @pDevfac     decimal(12,0)= 0,  @pAbofac     decimal(12 ,0) = 0,
	@pDctfac     decimal(12,0)= 0,  @pRetfac     decimal(12,0)= 0,  @pRicfac     decimal(12 ,0) = 0,
	@pRivfac     decimal(12,0)= 0,  @pNetfac     decimal(12,0)= 0,  @pCosfac     decimal(12 ,0) = 0,
	@pNumcon     nvarchar(8)  = '', @pEstfac     nvarchar(1)  = '', @pEntrega    decimal(14 ,2) = 0,
	@pCambio     decimal(14,2)= 0,  @pCodusu     nvarchar(8)  = '', @pObserva    nvarchar(max)  = '',
	@pAjuste     bit          = 0,  @pInifac     datetime     = '', @pCosaju     float          = 0,
	@pPendiente  bit          = 0,	@pEstado     nvarchar(10)   = '', 
	@pEstret     nvarchar(1)  = '', @pPlaza      nvarchar(40) = '', @pTipoventa  nvarchar(10)   = '', 
	@pValini     decimal(14 ,2) = 0,@pSaldocli   decimal(12,2)= 0,  @pDocrel     nvarchar(13)   = '', 
	@pCodturno   decimal(10 ,0) = 0,@pPlaca      nvarchar(6)  = '', @pValadmon   decimal(14,2)  = 0,  
	@pValimprev  decimal(14 ,2) = 0,@pValutil    decimal(14,2)= 0,  @pTipo       nvarchar(2)    = '', 
	@pTrm        decimal(14 ,2) = 0,@pCuoini     decimal(10,2)= 0,  @pLnentrega  decimal(10,0)  = 0,  
	@pLnvueltas  decimal(10 ,0) = 0,@pVuelo      decimal(10,0)= 0,  @pPorflete   decimal(14,2)  = 0,  
	@pPorvol     decimal(14 ,2) = 0,@pValdolar   decimal(14,2)= 0,  @pPropina    decimal(14,2)  = 0,  
	@pDespacho   nvarchar(8)  = '',	@pCendespach nvarchar(3)  = '', @pAdmon      decimal(14,2)  = 0,  
	@pIntmora    decimal(14 ,2) = 0,@pCuotaext   decimal(14,2)= 0,  @pTransporte decimal(14,2)  = 0,  
	@pArancel    decimal(14 ,2) = 0,@pImpfac     decimal(14,2)= 0,  @pComie      decimal(14,2)  = 0,  
	@pContrato   nvarchar(10) = '',	@pValflete   decimal(14,2)= 0,  @pConfirmada bit            = 0,  
	@pAnticipo   decimal(14 ,2) = 0,@pComision   decimal(14,2)= 0,  @pTotbono    decimal(14,2)  = 0,  
	@pDevretfac  decimal(14 ,2) = 0,@pDevricfac  decimal(14,2)= 0,  @pDevrivfac  decimal(14,2)  = 0,  
	@pBpromo     decimal(14 ,0) = 0,@pBviatico   decimal(14,0)= 0,  @pQtyper     decimal(3,0)   = 0,  
	@pDomicilio  bit          = 0,	@pAdultos    decimal(10,0)= 0,  @pNinos      decimal(10,0)  = 0, 
	@pCodguia    nvarchar(15) = '',	@pImpofac    decimal(14,2)= 0

	

AS
BEGIN TRY
   --@pFecfac,@pVenfac,@pInifac
   Declare @mExiste char(1)='N', 
           @mNerror int,
           @mMsg    nvarchar(230),
           @mLinea  int,
           @mAddMsg nvarchar(190),
           @mProc   char(20),
		   @pVerMsgBox int,
		   @mNumfac nvarchar(8)='',
		   @mAno    integer,
		   @mMes    integer,
           @mdFecfac date,
		   @mdVenfac date,
		   @mdInifac date,
           @mSqlm nvarchar(max)
   if @mExiste ='N'
   Begin
      select @mNerror=57005,@mAddMsg=';Ya existe.;';
      throw @mNerror,@mAddMsg,1
   end


End TRY

Begin Catch
    If @mNError = ERROR_NUMBER() 
       Select  @pVerMsgBox = 1
    
	Set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch  

GO


IF OBJECT_ID('Tec_Sp_Actualizacion','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Tec_Sp_Actualizacion
END
GO
CREATE PROCEDURE Tec_Sp_Actualizacion
-- Add the parameters for the stored procedure here
	@p1 integer=0,      @p2 nvarchar(30)='', @p3 nvarchar(30)='',  
	@p4 nvarchar(30)='',@p5 nvarchar(30)='', @p6 nvarchar(30)='',  
	@p7 nvarchar(30)=''
AS
BEGIN TRY
   Declare @mExiste char(1), 
           @mNerror int,
           @mMsg    nvarchar(230),
           @mLinea  int,
           @mAddMsg nvarchar(190),
           @mProc   char(20)='',
		   @pVerMsgBox int,
		   @mNomConstrain nvarchar(90),
		   @mTipo   nvarchar(30),
           @mSqlm nvarchar(max)
      
   Select @mExiste ='N', @mNerror=57027,@mLinea=0, 
          @mProc  ='Tec_Sp_Actualizacion',@mAddMsg=' ',@pVerMsgBox=0
   
   --========================
   -- Creacion de columna
   -- @p2=Tabla, @p3=Nomcolum,@p4=Tipo,@p5=Longitud
   -- @p6=valorDefault  
   --========================      
   If @p1=11 
   Begin
      
	  If Not exists(select column_name FROM   INFORMATION_SCHEMA.COLUMNS AS c1
                     where  c1.column_name = @p3 and c1.table_name = @p2 ) 
	  Begin 
	     set @mNomConstrain = 'DF_'+@p2+'_'+@p3
	     Select @mTipo=
	         case 
			    when @p4='C' then 'nvarchar('+@p5+') '
				when @p4='I' then 'integer '
				when @p4='N' then 'numeric('+@p5+')'
				when @p4='B' then 'bit '
				when @p4='F' then 'date '
				
			 end

         Set @mSqlm = 'ALTER TABLE '+@p2+' ADD '+@p3+' '+@mTipo+' NOT NULL '+'CONSTRAINT '+
	               @mNomConstrain +'  DEFAULT ('
	  
	  
	     select @mSqlm =
            case  
	           when @p4 = 'C' then  @mSqlm+''''') '
	        
	           when @p4 = 'I' or @p4='N'  or @p4='B' then  @mSqlm+'(0)) '

	           when @p4 = 'F' then  @mSqlm+'getdate()) '

	        End      
       End 
   End 
   
  
   If @mSqlm <> ''
   Begin
      Exec (@mSqlm)
	  select @mSqlm  
   End 
       
End TRY

Begin Catch
    If @mNError = ERROR_NUMBER()
    Select  @pVerMsgBox = 1
    
	Set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
	print @mAddMsg
    --Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch  
GO


IF OBJECT_ID('Tec_Sp_CtaEspecial','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Tec_Sp_CtaEspecial
END
GO
CREATE PROCEDURE Tec_Sp_CtaEspecial
-- Add the parameters for the stored procedure here
	@pIdemp nvarchar(3), @pNomCta nvarchar(30),@p1 nvarchar(30)='',
	@p2 nvarchar(30)='', @p3 nvarchar(30)='',  @p4 nvarchar(30)='',
	@p5 nvarchar(30)='', @p6 nvarchar(30)='',  @p7 nvarchar(30)=''
AS
BEGIN TRY
   Declare @mExiste char(1), 
           @mNerror int,
           @mMsg    nvarchar(230),
           @mLinea  int,
           @mAddMsg nvarchar(190),
           @mProc   char(20),
		   @pVerMsgBox int,
           @mSqlm nvarchar(max)
      
   Select @mExiste ='N', @mNerror=57027,@mLinea=0, 
          @mProc  ='Tec_Sp_CtaEspecial',@mAddMsg=' ',@pVerMsgBox=0,
          @mSqlm = case @pNomcta
                   When 'PreFac' Then 'Select CodCto, NomCto, CODCEN as CodAlm, Prealm  '+
			             'From Con_cencostos C Inner join Glb_Almacen A on '+
			             'C.Almfac=A.Codalm and C.codalm=A.codalm And A.idemp='+@pIdemp+''+
			             'Where C.idemp='''+@pIdemp+''' Order by Codcto '

	               When 'KarInv' Then 'SELECT a.*,b.nomart '+
			             'FROM 	 alm_kardex a '+  
					            'INNER JOIN alm_articulos b ON a.codart=b.codart '+ 
			             'WHERE  a.idemp ='''+@pIdemp+''' AND '+ 
						        'a.codcto='''+@p1+''' AND '+ 
					            'a.numcon='''+@p2+''' AND '+ 
					            'a.codcon='''+@p3+''''
								--====================================
								--@p1 = codcto ;@p2=numfac;@p3=tipnot
								--====================================
                   When 'IdMax' Then  'select isnull(max(convert(numeric,'+@p2+')),0) as idmax '+
	                     'From  '+@p1                     
						 --====================================
						 --@p1 = Tabla; @p2= Campo
						 --====================================
	  
	               when 'MesasConfirmada' then 'SELECT codcto, tipfac, numfac  FROM 	Ven_Facturas  '+
                                  'WHERE  idemp ='''+@pIdemp+''' And estfac='''+''' AND confirmada=1 AND '+
								  'codcto='''+@p1+''''
                   
				   when 'Alma' Then 'select * from   glb_almacen where  idemp='+@pIdemp+' and codalm=  (select codalm '+
                                    'from con_cencostos  where codcto='+@p1+' )'
                   
				   when 'CenConsumo' Then 'select * from   glb_cenconsumo where  idemp='+@pIdemp+' and codcen=  (select codcen '+
                                          'from con_cencostos  where codcto='+@p1+' )'
				   
				   
				   when 'FacturaCliente' Then 'select * from Ven_Facturas where  idemp='''+@pIdemp+''' and codcto='''+@p1+''' and '+
				                              'tipfac='''+@p2+''' And numfac='''+@p3+''''     
				  
				   else 
	                  ''
                   End 

   If @mSqlm <> ''
      Exec (@mSqlm)
	  --select @mSqlm  
   Else
   Begin  
      select @mNerror=57005,@mAddMsg=';Verificar los parametros enviados.;Nombre de la consulta no existe.';
	  throw @mNerror,@mAddMsg,1
	  --raiserror( @mNerror,@mAddMsg,1)
	End 
       
End TRY

Begin Catch
    If @mNError = ERROR_NUMBER()
    Select  @pVerMsgBox = 1
    
	Set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
    Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch  

GO



IF OBJECT_ID('Tec_Sp_ValidaElimacion','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Tec_Sp_ValidaElimacion
END
GO
CREATE PROCEDURE Tec_Sp_ValidaElimacion
  @pcTablaPk nvarchar(50), @pcDato nvarchar(30)='',@pnDato int=0
AS
BEGIN
	select * from  glb_terceros
END
GO


IF OBJECT_ID('Ven_Sp_ActParametros','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Ven_Sp_ActParametros
END
GO
CREATE PROCEDURE Ven_Sp_ActParametros
	@pIdemp			nvarchar(3),				@pComini		decimal(8,0)=0,				@pComfinal		decimal(8,0)=0,			@pCodprop			nvarchar(10)='',  
	@pCodser        nvarchar(10)='',			@pServidor		nvarchar(50)='',			@pBandeja		nvarchar(50)='',		@pCodcto			nvarchar(3)='',   
	@pDesctira      decimal(14,2)=0,			@pValcuota      decimal(14,0)=0,			@pCodcuota		nvarchar(10)='',		@pComanda			bit=0,          
	@pImpcocina     bit=0,						@pCajon         decimal(1,0)=0,				@pFormato		decimal(1,0)=0,			@pInventa			bit=0,           
	@pTotimpuesto   decimal(1,0)=0,				@pTurno         decimal(12,0)=0,			@pTipconse		decimal(1,0)=0,			@pAbono				bit=0,
	@pAjpeso        bit=0,						@pLineamod      nvarchar(4)='',				@pPrtefte		decimal(8,3)=0,			@pPrteica			decimal(8,3)=0,   
	@pPrteiva       decimal(8,3)=0,				@pTdisplay      bit=0,						@pImpgen		bit=0,					@pRutimpcocina		nvarchar(100)='',
	@pCtafalta      nvarchar(8)='',				@pCtapue        nvarchar(8)='',				@pCtasobra		nvarchar(8)='',			@pImpcorte			bit=0,          
	@pNumaper       decimal(10,0)=0,			@pPorinteres    decimal(10,2)=0,			@pSerialpc		nvarchar(10)='',		@pRepart			bit=0,           
	@pUtlart        bit=0,						@pDevinv        bit=0,						@pPropina		decimal(3,0)=0,			@pRepref			bit=0,
	@pOpcaja        bit=0,						@pForpazysal    nvarchar(20)='',			@pDisiva		bit=0,					@pContabven			bit=0,           
	@pRemipre       bit=0,						@pClase         decimal(1,0)=0,				@pCtatras		nvarchar(8)='',			@pOtrgas			bit=0,           
	@pCtaotr        nvarchar(8)='',				@pCodturn       decimal(10,0)=0,			@pImpfis		bit=0,					@pPtadmon			decimal(8,2)=0, 
	@pPtimprevisto  decimal(8,2)=0,				@pPtutilidad    decimal(8,2)=0,				@pImprc			bit=0,					@pTopenotas			decimal(14,2)=0,  
	@pCvtope        nvarchar(40)='',			@pUtilprecio    bit=0,						@pDevpedido		bit=0,					@pDecimales			decimal(1,0)=0,
	@pFocus         bit=0,						@pPorutil       decimal(6,2)=0,				@pDiasvencidos	bit=0,					@pCalcprecio		bit=0,
	@pPoriva        decimal(10,2)=0,			@pNodigprecio   bit=0,						@pHoraentam		nvarchar(5)='',			@pHorasalam			nvarchar(5)='',   
	@pHoraenrpm     nvarchar(5)='',				@pHorasalpm     nvarchar(5)='',				@pIntervalo		decimal(2,0)=0,			@pDeshabilitadcto	bit = 0,          
	@pValidakardex  bit=0,						@pPorflete      decimal(14,2)=0,			@pPorvol		decimal(14,2)=0,		@pValidafecanula	bit = 0,           
	@pEditclicoti	bit=0,						@pNoitemcoti    bit=0,						@pDctomax		bit=0,					@pDctomaxfac		decimal(10,2)=0,
	@pNumcopias     nvarchar(1)='',				@pNopropina     bit=0,						@pProprefac		bit=0,					@pBlocosto			bit=0,           
	@pCostocortesia bit=0,						@pFectouch      bit=0,						@pRetenfac		decimal(1,0)=0,			@pPrefactura		bit=0,           
	@pPagocentro    bit=0,						@pDesactpropina bit=0,						@pDesactingre	bit=0,					@pContabvta			bit=0,          
	@pCtoegreso     bit=0,						@pCtacajaegreso bit=0,						@pRetarjetouch	bit=0,					@pCentrosinv		bit=0,           
	@pEditprecios   bit=0,						@pPassprecios   bit=0,						@pTransvta		nvarchar(2)='',			@pNitpro			nvarchar(15)='',
	@pTranscomp     nvarchar(2)='',				@pImpgen2       bit=0,						@pTransdespacho	nvarchar(2)='',			@pTransdevol		nvarchar(2)='',  
	@pRoundprecio   bit=0,						@pInvfcodbar    bit=0,						@pValpie		decimal(14,2)=0,		@pPagoxcen			bit=0,           
	@pTransdevolp   nvarchar(2)='',				@pFeckardex     bit=0,						@pFecsys		bit=0,					@pNnccxc			bit=0,          
	@pPorvta        decimal(10,2)=0,			@pVlrdia        decimal(14,2)=0,			@pFecsysinv		bit=0,					@pPormerienda		decimal(14,2)=0,  
	@pCtaanulacion  bit=0,						@pImpqty        bit=0,						@pNoactart		bit=0,					@pRetetarjetas		bit=0,
	@pFiltrocentro  bit=0,						@pInvfac        bit=0,						@pActremision	bit=0,					@pFactparcial		bit=0,           
	@pCentroegre    bit=0,						@pFacosto       bit=0,						@pInvserial		bit=0,					@pModiva			bit=0,           
	@pCierreusu     bit=0,						@pIngserial     bit=0,						@pRefactc		bit=0,					@pImppdf			bit=0,          
	@pInvserialent  bit=0,						@pInvserialsal  bit=0,						@pInvserialtras	bit=0,					@pPasscomi			decimal(10,0)=0, 
	@pCodalim       nvarchar(10)='',			@pGridalim      bit=0,						@pStickersis	bit=0,					@pIngdcto			bit=0,
	@pPropres       bit=0,						@pCodconrc      nvarchar(2)='',				@pCodtraneg		nvarchar(2)='',			@pCodtranrc			nvarchar(2) = '',
    @pValab         decimal(14,2)=0,			@pValmx         decimal(14,2)=0,			@pDctopor		bit=0,					@pDignroperso		bit=0,               
    @pCambio        bit=0,						@pNitvtactdo    nvarchar(15)='',			@pDctoiva		bit=0,					@pCodartayu			bit=0,
	@pQtymayor0     bit=0,						@pColumitem     bit=0,						@pPminvta		bit=0,					@pRelafpyce			bit=0,           
	@pCotiref       bit=0,						@pFecsysco      bit=0,						@pCtainvtran	bit=0,					@pEliminaitem		bit=0,
	@pInftotvta     bit=0,						@pInftotforp    bit=0,						@pInfforpdet	bit=0,					@pInfhora			bit=0,          
	@pInfubica      bit=0,						@pInftotprod    bit=0,						@pInfdiaria		bit=0,					@pInfprdtran		bit=0,           
	@pValimp        decimal(1,0)=0,				@pActimp        bit=0,						@pInfhorares	bit=0,					@pNoagruitem		bit=0,
	@pVlruniremi    nvarchar(10)='',			@pModvalcoti    bit=0,						@pModrefe		bit=0,					@pPropina2			decimal(3,0)=0,   
	@pPlazo         decimal(3,0)=0,				@pFiltronom     bit=0,						@pPorfact		decimal(12,5)=0,		@pDecimalvlr		numeric(1,0)=0,  
	@pDiasvalfec    numeric(2,0)=0,				@pRedvalprom    bit=0,						@pVlrxpago		bit=0,					@pRifa				bit=0,           
	@pValtrasinv    bit=0,						@pRepitem       bit=0,						@pModinv		bit=0,					@pValmedele			bit=0,          
	@pInfoxusu      bit=0,						@pValtipegr     bit=0,						@pFijarund		bit=0,					@pValmesa			bit=0,           
	@pLimitemfac    bit=0,						@pDismpvta      bit=0,						@pEditnomter	bit=0,					@pRoundfact			bit=0,
	@pFacrete       bit=0,						@pArtxtalla     bit=0,						@pCfvtacont		bit=0,					@pRestaurante		bit=0,           
	@pLimtefact     bit=0,						@pGrupoxcto     bit=0,						@pSumqty		bit=0,					@pAgrudpp			bit=0,
	@pAntcxc        bit=0,						@pDomivta       bit=0,						@pAntxcen		bit=0,					@pActrete			bit=0,          
	@pActpvctras    bit=0,						@pPorcomiprd    bit=0,						@pActalerta		bit=0,					@pArtxcen        	bit=0,           
	@pFilserprod    bit=0,						@pFactordser    bit=0,						@pFiusuxtran	bit=0,					@pFacvlrcero		bit=0,
	@pSaldorcotr    bit=0,						@pVtasxfecha    bit=0,						@pInvxfecha		bit=0,					@pCominicial		numeric(8,0)=0, 
	@pCopiacoti     numeric(2,0)=0,				@pItemfac       numeric(2,0)=0,				@pClasiven		numeric(1,0)=0,			@pVlrmacfac			numeric(14,0)=0,  
	@pPoradic       numeric(5,2)=0,				@pPcree         numeric(8,2)=0,				@pOptinv		numeric(1,0)=0,			@pBaseriva			numeric(10,0)=0, 
	@pBaserica      numeric(10,0)=0,			@pBaserfte      numeric(10,0)=0,			@pBasercree		numeric(10,0)=0,		@pPvtouch			nvarchar(6)='',  
	@pDetrifa       nvarchar(200)='',			@pinfvtaxgru	bit=0 ,						@pPretgta		numeric(10,0)=0,					@pBaseretgta	numeric(10,0)=0

AS
BEGIN try 
	declare	@mNreg		int,
			@mAddMsg	nvarchar(230)='', 
			@pVerMsgBox int=0,
			@mProc		nvarchar(30)='Ven_Sp_ActParametros'


   If Not Exists(Select Idemp From ven_parametros Where idemp=@pIdemp)
   Begin 
      Insert Into Ven_Parametros(idemp,comini,comfinal,codprop,codser,servidor,bandeja,codcto,desctira,valcuota, 
                  codcuota, comanda,impcocina,cajon,formato,inventa,totimpuesto,turno,tipconse,abono, 
				  ajpeso,lineamod,prtefte,prteica,prteiva,tdisplay,impgen,rutimpcocina,ctafalta,ctapue,
				  ctasobra,impcorte,numaper,porinteres,serialpc,repart,utlart,devinv,propina,repref,
				  opcaja,forpazysal,disiva,contabven,remipre,clase,ctatras,otrgas,ctaotr,codturn,
				  impfis, ptadmon,ptimprevisto,ptutilidad,imprc,topenotas,cvtope,utilprecio,devpedido,decimales,
				  focus,porutil,diasvencidos,calcprecio,poriva,nodigprecio,horaentam,horasalam,horaenrpm,horasalpm,
				  intervalo,deshabilitadcto,validakardex,porflete,porvol,validafecanula,editclicoti,noitemcoti,dctomax,dctomaxfac,
				  numcopias,nopropina,proprefac,blocosto,costocortesia,fectouch,retenfac,prefactura,pagocentro,desactpropina,
				  desactingre,contabvta,ctoegreso,ctacajaegreso,retarjetouch,centrosinv,editprecios,passprecios,transvta,nitpro,
				  transcomp,impgen2,transdespacho,transdevol,roundprecio,invfcodbar,valpie,pagoxcen,transdevolp,feckardex,
				  fecsys,nnccxc,porvta,vlrdia,fecsysinv,pormerienda,ctaanulacion,impqty,noactart,retetarjetas,
				  filtrocentro,invfac,actremision,factparcial,centroegre,facosto,invserial,modiva,cierreusu,ingserial,
				  refactc,imppdf,invserialent,invserialsal,invserialtras,passcomi,codalim,gridalim,stickersis,ingdcto,
				  propres,codconrc,codtraneg,codtranrc,valab,valmx,
				  dctopor,dignroperso,
				  cambio,nitvtactdo,dctoiva,codartayu,
				  qtymayor0,columitem,pminvta,relafpyce,cotiref,fecsysco,ctainvtran,eliminaitem,inftotvta,inftotforp,
				  infforpdet,infhora,infubica,inftotprod,infdiaria,infprdtran,valimp,actimp,infhorares,noagruitem,
				  vlruniremi,modvalcoti,modrefe,propina2,plazo,filtronom,porfact,decimalvlr,diasvalfec,
				  redvalprom,vlrxpago,rifa,valtrasinv,repitem,modinv,valmedele,infoxusu,valtipegr,fijarund,
				  valmesa,limitemfac,dismpvta,editnomter,roundfact,facrete,artxtalla,cfvtacont,restaurante,limtefact,
				  grupoxcto,sumqty,agrudpp,antcxc,domivta,antxcen,actrete,actpvctras,porcomiprd,actalerta,
				  artxcen,filserprod,factordser,fiusuxtran,facvlrcero,saldorcotr,vtasxfecha,invxfecha,cominicial,copiacoti,
				  itemfac,clasiven,vlrmacfac,poradic,pcree,optinv,baseriva,baserica,baserfte,
				  basercree,pvtouch,detrifa,infvtaxgru,pretgta,baseretgta)
		    Values(@pIdemp,@pComini,@pComfinal,@pCodprop,@pCodser,@pServidor,@pBandeja,@pCodcto,@pDesctira,@pValcuota,
			       @pCodcuota,@pComanda,@pImpcocina,@pCajon,@pFormato,@pInventa,@pTotimpuesto,@pTurno,@pTipconse,@pAbono,
				   @pAjpeso,@pLineamod,@pPrtefte,@pPrteica,@pPrteiva,@pTdisplay,@pImpgen,@pRutimpcocina,@pCtafalta,@pCtapue,
				   @pCtasobra,@pImpcorte,@pNumaper,@pPorinteres,@pSerialpc,@pRepart,@pUtlart,@pDevinv,@pPropina,@pRepref,
				   @pOpcaja,@pForpazysal,@pDisiva,@pContabven,@pRemipre,@pClase,@pCtatras,@pOtrgas,@pCtaotr,@pCodturn,
				   @pImpfis,@pPtadmon,@pPtimprevisto,@pPtutilidad,@pImprc,@pTopenotas,@pCvtope,@pUtilprecio,@pDevpedido,@pDecimales,
				   @pFocus,@pPorutil,@pDiasvencidos,@pCalcprecio,@pPoriva,@pNodigprecio,@pHoraentam,@pHorasalam,@pHoraenrpm,@pHorasalpm,
				   @pIntervalo,@pDeshabilitadcto,@pValidakardex,@pPorflete,@pPorvol,@pValidafecanula,@pEditclicoti,@pNoitemcoti,@pDctomax,@pDctomaxfac,
				   @pNumcopias,@pNopropina,@pProprefac,@pBlocosto,@pCostocortesia,@pFectouch,@pRetenfac,@pPrefactura,@pPagocentro,@pDesactpropina,
				   @pDesactingre,@pContabvta,@pCtoegreso,@pCtacajaegreso,@pRetarjetouch,@pCentrosinv,@pEditprecios,@pPassprecios,@pTransvta,@pNitpro,
				   @pTranscomp,@pImpgen2,@pTransdespacho,@pTransdevol,@pRoundprecio,@pInvfcodbar,@pValpie,@pPagoxcen,@pTransdevolp,@pFeckardex,
				   @pFecsys,@pNnccxc,@pPorvta,@pVlrdia,@pFecsysinv,@pPormerienda,@pCtaanulacion,@pImpqty,@pNoactart,@pRetetarjetas,
				   @pFiltrocentro,@pInvfac,@pActremision,@pFactparcial,@pCentroegre,@pFacosto,@pInvserial,@pModiva,@pCierreusu,@pIngserial,
				   @pRefactc,@pImppdf,@pInvserialent,@pInvserialsal,@pInvserialtras,@pPasscomi,@pCodalim,@pGridalim,@pStickersis,@pIngdcto,
				   @pPropres,@pCodconrc,@pCodtraneg,@pCodtranrc,@pValab,@pValmx,
				   @pDctopor,@pDignroperso,
				   @pCambio,@pNitvtactdo,@pDctoiva,@pCodartayu,
				   @pQtymayor0,@pColumitem,@pPminvta,@pRelafpyce,@pCotiref,@pFecsysco,@pCtainvtran,@pEliminaitem,@pInftotvta,@pInftotforp,
				   @pInfforpdet,@pInfhora,@pInfubica,@pInftotprod,@pInfdiaria,@pInfprdtran,@pValimp,@pActimp,@pInfhorares,@pNoagruitem,
				   @pVlruniremi,@pModvalcoti,@pModrefe,@pPropina2,@pPlazo,@pFiltronom,@pPorfact,@pDecimalvlr,@pDiasvalfec,
				   @pRedvalprom,@pVlrxpago,@pRifa,@pValtrasinv,@pRepitem,@pModinv,@pValmedele,@pInfoxusu,@pValtipegr,@pFijarund,
				   @pValmesa,@pLimitemfac,@pDismpvta,@pEditnomter,@pRoundfact,@pFacrete,@pArtxtalla,@pCfvtacont,@pRestaurante,@pLimtefact,
				   @pGrupoxcto,@pSumqty,@pAgrudpp,@pAntcxc,@pDomivta,@pAntxcen,@pActrete,@pActpvctras,@pPorcomiprd,@pActalerta,
				   @pArtxcen,@pFilserprod,@pFactordser,@pFiusuxtran,@pFacvlrcero,@pSaldorcotr,@pVtasxfecha,@pInvxfecha,@pCominicial,@pCopiacoti,
				   @pItemfac,@pClasiven,@pVlrmacfac,@pPoradic,@pPcree,@pOptinv,@pBaseriva,@pBaserica,@pBaserfte,
				   @pBasercree,@pPvtouch,@pDetrifa,@pinfvtaxgru,@pPretgta,@pBaseretgta)
   End 
   Else 
   Begin 
      Update Ven_Parametros 
	  Set    comini=@pComini,comfinal=@pComfinal,codprop=@pCodprop,codser=@pCodser,servidor=@pServidor,
	         bandeja=@pBandeja,codcto=@pCodcto,desctira=@pDesctira,valcuota=@pValcuota,codcuota=@pCodcuota,
			 comanda=@pComanda,impcocina=@pImpcocina,cajon=@pCajon,formato=@pFormato,inventa=@pInventa,
			 totimpuesto=@pTotimpuesto,turno=@pTurno,tipconse=@pTipconse,abono=@pAbono,ajpeso=@pAjpeso,
			 lineamod=@pLineamod,prtefte=@pPrtefte,prteica=@pPrteica,prteiva=@pPrteiva,tdisplay=@pTdisplay,
			 impgen=@pImpgen,rutimpcocina=@pRutimpcocina,ctafalta=@pCtafalta,ctapue=@pCtapue,ctasobra=@pCtasobra,
			 impcorte=@pImpcorte,numaper=@pNumaper,porinteres=@pPorinteres,serialpc=@pSerialpc,repart=@pRepart,
			 utlart=@pUtlart,devinv=@pDevinv,propina=@pPropina,repref=@pRepref,opcaja=@pOpcaja,forpazysal=@pForpazysal,
			 disiva=@pDisiva,contabven=@pContabven,remipre=@pRemipre,clase=@pClase,ctatras=@pCtatras,otrgas=@pOtrgas,
			 ctaotr=@pCtaotr,codturn=@pCodturn,impfis=@pImpfis,ptadmon=@pPtadmon,ptimprevisto=@pPtimprevisto,
			 ptutilidad=@pPtutilidad,imprc=@pImprc,topenotas=@pTopenotas,cvtope=@pCvtope,utilprecio=@pUtilprecio,
			 devpedido=@pDevpedido,decimales=@pDecimales,focus=@pFocus,porutil=@pPorutil,diasvencidos=@pDiasvencidos,
			 calcprecio=@pCalcprecio,poriva=@pPoriva,nodigprecio=@pNodigprecio,horaentam=@pHoraentam,horasalam=@pHorasalam,
			 horaenrpm=@pHoraenrpm,horasalpm=@pHorasalpm,intervalo=@pIntervalo,deshabilitadcto=@pDeshabilitadcto,
			 validakardex=@pValidakardex,porflete=@pPorflete,porvol=@pPorvol,validafecanula=@pValidafecanula,
			 editclicoti=@pEditclicoti,noitemcoti=@pNoitemcoti,dctomax=@pDctomax,dctomaxfac=@pDctomaxfac,numcopias=@pNumcopias,
			 nopropina=@pNopropina,proprefac=@pProprefac,blocosto=@pBlocosto,costocortesia=@pCostocortesia,
			 fectouch=@pFectouch,retenfac=@pRetenfac,prefactura=@pPrefactura,pagocentro=@pPagocentro,desactpropina=@pDesactpropina,
			 desactingre=@pDesactingre,contabvta=@pContabvta,ctoegreso=@pCtoegreso,ctacajaegreso=@pCtacajaegreso,
			 retarjetouch=@pRetarjetouch,centrosinv=@pCentrosinv,editprecios=@pEditprecios,passprecios=@pPassprecios,
			 transvta=@pTransvta,nitpro=@pNitpro,transcomp=@pTranscomp,impgen2=@pImpgen2,transdespacho=@pTransdespacho,
			 transdevol=@pTransdevol,roundprecio=@pRoundprecio,invfcodbar=@pInvfcodbar,valpie=@pValpie,pagoxcen=@pPagoxcen,
			 transdevolp=@pTransdevolp,feckardex=@pFeckardex,fecsys=@pFecsys,nnccxc=@pNnccxc,porvta=@pPorvta,vlrdia=@pVlrdia,
			 fecsysinv=@pFecsysinv,pormerienda=@pPormerienda,ctaanulacion=@pCtaanulacion,impqty=@pImpqty,noactart=@pNoactart,
			 retetarjetas=@pRetetarjetas,filtrocentro=@pFiltrocentro,invfac=@pInvfac,actremision=@pActremision,factparcial=@pFactparcial,
			 centroegre=@pCentroegre,facosto=@pFacosto,invserial=@pInvserial,modiva=@pModiva,cierreusu=@pCierreusu,ingserial=@pIngserial,
			 refactc=@pRefactc,imppdf=@pImppdf,invserialent=@pInvserialent,invserialsal=@pInvserialsal,invserialtras=@pInvserialtras,
			 passcomi=@pPasscomi,codalim=@pCodalim,gridalim=@pGridalim,stickersis=@pStickersis,ingdcto=@pIngdcto,propres=@pPropres,
			 codconrc=@pCodconrc,codtraneg=@pCodtraneg,codtranrc=@pCodtranrc,
			 valab=@pValab,valmx=@pValmx,dctopor=@pDctopor,
			 dignroperso=@pDignroperso,
			 cambio=@pCambio,nitvtactdo=@pNitvtactdo,dctoiva=@pDctoiva,
			 codartayu=@pCodartayu,qtymayor0=@pQtymayor0,columitem=@pColumitem,pminvta=@pPminvta,relafpyce=@pRelafpyce,cotiref=@pCotiref,
			 fecsysco=@pFecsysco,ctainvtran=@pCtainvtran,eliminaitem=@pEliminaitem,inftotvta=@pInftotvta,inftotforp=@pInftotforp,
			 infforpdet=@pInfforpdet,infhora=@pInfhora,infubica=@pInfubica,inftotprod=@pInftotprod,infdiaria=@pInfdiaria,
			 infprdtran=@pInfprdtran,valimp=@pValimp,actimp=@pActimp,infhorares=@pInfhorares,noagruitem=@pNoagruitem,vlruniremi=@pVlruniremi,
			 modvalcoti=@pModvalcoti,modrefe=@pModrefe,propina2=@pPropina2,plazo=@pPlazo,filtronom=@pFiltronom,porfact=@pPorfact,
			 decimalvlr=@pDecimalvlr,diasvalfec=@pDiasvalfec,redvalprom=@pRedvalprom,vlrxpago=@pVlrxpago,
			 rifa=@pRifa,valtrasinv=@pValtrasinv,repitem=@pRepitem,modinv=@pModinv,valmedele=@pValmedele,infoxusu=@pInfoxusu,
			 valtipegr=@pValtipegr,fijarund=@pFijarund,valmesa=@pValmesa,limitemfac=@pLimitemfac,dismpvta=@pDismpvta,editnomter=@pEditnomter,
			 roundfact=@pRoundfact,facrete=@pFacrete,artxtalla=@pArtxtalla,cfvtacont=@pCfvtacont,restaurante=@pRestaurante,limtefact=@pLimtefact,
			 grupoxcto=@pGrupoxcto,sumqty=@pSumqty,agrudpp=@pAgrudpp,antcxc=@pAntcxc,domivta=@pDomivta,antxcen=@pAntxcen,actrete=@pActrete,
			 actpvctras=@pActpvctras,porcomiprd=@pPorcomiprd,actalerta=@pActalerta,artxcen=@pArtxcen,filserprod=@pFilserprod,factordser=@pFactordser,
			 fiusuxtran=@pFiusuxtran,facvlrcero=@pFacvlrcero,saldorcotr=@pSaldorcotr,vtasxfecha=@pVtasxfecha,invxfecha=@pInvxfecha,
			 cominicial=@pCominicial,copiacoti=@pCopiacoti,itemfac=@pItemfac,clasiven=@pClasiven,vlrmacfac=@pVlrmacfac,
			 poradic=@pPoradic,pcree=@pPcree,optinv=@pOptinv,baseriva=@pBaseriva,baserica=@pBaserica,baserfte=@pBaserfte,basercree=@pBasercree,
			 pvtouch=@pPvtouch,detrifa=@pDetrifa, infvtaxgru=@pinfvtaxgru,pretgta=@pPretgta,baseretgta=@pBaseretgta
      Where idemp=@pIdemp
   End

END try 

Begin Catch 
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
end catch 


GO

IF OBJECT_ID('Ven_Sp_AperturaCierreCaja','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE Ven_Sp_AperturaCierreCaja
END
GO
CREATE PROCEDURE Ven_Sp_AperturaCierreCaja
	-- Add the parameters for the stored procedure here
	@pIdemp  nvarchar(3),      @pCodcto  nvarchar(3),      @pFecha    nvarchar(10)= '',
	@pCodter nvarchar(15)= '', @pHora    nvarchar(5)= '',  @pJornada  nvarchar(2)= '',
	@pBase   decimal(14,0)= 0, @pActivo  nvarchar(1)= '',  @pCaja     nvarchar(3)= '',
	@pCodusu nvarchar(8)= '',  @pCodusuc nvarchar(8)= '',  @pFaltante decimal(12,0)= 0,
	@pIpcaja nvarchar(15)= '', @pNumero  decimal(10,0)= 0, @pSobrante decimal(12,0)= 0,
    @pProc   bit = 0,			@pitem	  numeric(10)=0
AS
BEGIN TRY
   Declare @mExiste char(1),  @mNerror char(5), @mMsg nvarchar(230),
           @mLinea  int,      @mAddMsg nvarchar(190), @mCOnsecut int,
           @mProc   char(20), @mFecha datetime,@pVerMsgBox int =0
      
   Select @mExiste ='N', @mNerror=57021,@mLinea=0, @mProc  ='Ven_Sp_AperturaCierreCaja',@mAddMsg=' ',
          @mFecha = CONVERT(datetime,@pFecha), @mCOnsecut = 0
   
   
   If @pProc = 0 
   Begin  
      Begin Tran 
      If Exists(Select numaper From Ven_Parametros Where idemp=@pIdemp)
	     SET @pActivo = 'T'
         Update Ven_Parametros 
		 Set	numaper=numaper+1 
		 Where	idemp=@pIdemp 
		 
		 Select @mConsecut =  numaper 
		 From	Ven_Parametros 
		 Where idemp=@pIdemp
		 
		 SET @pnumero = @mConsecut
		 
		 Insert Into Glb_Caja(idemp,codcto,CodTer,Fecha,Hora,Base,numero,codusu,codusuc,caja,ipcaja,activo,item)
		 Values(@pIdemp,@pcodcto,@pCodTer,@mFecha,@pHora,@pBase,@pnumero,@pcodusu,@pcodusu,@pcaja,@pipcaja,@pActivo,@pitem)
		 
		 select   @mConsecut as consecut
      Commit 
      
	 

   End
   Else
   Begin 
      Update glb_caja 
	  Set    feccierre=getdate(), faltante=@pfaltante, sobrante=@psobrante,
		     codusuc=@pcodusuc, Activo=@pActivo
	  where  idemp=@pIdemp And codcto=@pCodcto and numero=@pNumero
   End 
End TRY

Begin Catch
   Exec SPG_TransaccionesAbiertas 0
   If @mNError = ERROR_PROCEDURE()
      Select  @pVerMsgBox = 1
   
   Set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox  
End Catch  
GO


IF OBJECT_ID('db_SP_Alm_Inventario_UpdExist','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE db_SP_Alm_Inventario_UpdExist
END
GO
CREATE PROCEDURE db_SP_Alm_Inventario_UpdExist
	@pIdEmp	nvarchar(3), @pCentro nvarchar(3)= ''
AS
BEGIN
	if @pcentro=''	
		UPDATE	alm_inventario 
		SET		alm_inventario.caninv  =  Vinv.cantidad
		FROM	alm_inventario as inv
				INNER JOIN VACTinventario as Vinv ON inv.idemp  = Vinv.idemp AND 
				inv.codcto = Vinv.codcto  and 
				inv.codart = Vinv.CODART 
	else 
		update alm_inventario set  caninv= 0  where codcto=@pCentro

		UPDATE	alm_inventario 
		SET		alm_inventario.caninv  =  Vinv.cantidad
		FROM	alm_inventario as inv
				INNER JOIN VACTinventario as Vinv ON inv.idemp  = Vinv.idemp AND 
				inv.codcto = Vinv.codcto  and 
				inv.codart = Vinv.CODART where inv.codcto=@pCentro

END
GO


IF OBJECT_ID('db_SP_Ven_SaldoAfavor_UpdSaldo','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE db_SP_Ven_SaldoAfavor_UpdSaldo
END
GO
CREATE PROCEDURE db_SP_Ven_SaldoAfavor_UpdSaldo
	@pCodCue nvarchar(8), @pNitter nvarchar(15)=''
AS
BEGIN
	DECLARE @TemSaldo TABLE ( Id int identity(1,1), IdEmp nvarchar(3), Nitter nvarchar(15), Saldo decimal(14,2))
	DECLARE @nCont Int,  @nRegistros int, @mNitter nvarchar(15), @mIdEmp nvarchar(3), @mSaldo decimal(14,2)
	Declare @pNitter_lc nVarchar(15)
	SET @pNitter_lc	= Case When @pNitter='' Then NULL Else @pNitter End
	
	Set @nCont = 1
	
	INSERT INTO @TemSaldo(IdEmp,Nitter,Saldo)
	SELECT	idemp, nitter, sum(Credito-Debito)
	FROM	Con_Comprobante 
	WHERE	Codcue=@pCodcue and estcomp<>'A'
			and (Nitter=@pNitter_lc OR @pNitter_lc is null)
			group by idemp,Nitter order by idemp,nitter 	

	SET @nRegistros=(SELECT COUNT(*) FROM @TemSaldo)	

	WHILE @nCont<=@nRegistros 
	BEGIN 		
		select  @mNitter=Nitter,@mIdEmp=IdEmp, @mSaldo=Saldo from @TemSaldo where Id=@nCont 
		if not exists(select nitter from Ven_Saldosf WHERE Nitter=@mNitter)
			insert into ven_saldosf(idemp,nitter,saldo,codcto) values(@mIdEmp,@mNitter,@mSaldo,'') 
		else 
			update Ven_SaldosF set Saldo=@mSaldo where idemp=@mIdEmp and nitter=@mnitter  
	
		Set @nCont = @nCont + 1
	end 		
END
GO

-- Agregado por Éduar Álvarez. Febrero 12 de 2015.

IF OBJECT_ID('db_SP_NOM_TABLACON_Set','P') IS NOT NULL
BEGIN
	DROP PROCEDURE db_SP_NOM_TABLACON_Set
END
GO

CREATE PROCEDURE db_SP_NOM_TABLACON_Set
			@codi_sec   nvarchar(3)='',	 @tran_codi nvarchar(04)='', @tipcue	 nvarchar(01)='', @codcueD    nvarchar(8)='',
			@codnit	    nvarchar(01)='', @numnit	nvarchar(15)='', @cxcCodcueD nvarchar(8)='',
			@cxcCodcueC	nvarchar(8)='',  @cxcNit	nvarchar(15)='', @cxcCodCen  nvarchar(03)=''
AS 
BEGIN TRY
   Declare @r int,
		   @mExiste char(1),
		   @mNerror char(3),
           @mMsg    nvarchar(190),
           @mLinea  int,
           @mAddMsg nvarchar(50),
		   @pVerMsgBox int=0,
           @mProc   char(20)

   Select @r = 0 , @mExiste ='N', @mNerror='021',@mLinea=0,@mAddMsg='' 
   Set @mProc  ='db_SP_NOM_TABLACON_Set'        

   If exists (Select codi_sec From nom_tablacon where codi_sec=@codi_sec AND tran_codi= @tran_codi)
	   Begin
		  Update nom_tablacon
			 Set codi_sec=@codi_sec, tran_codi=@tran_codi, tipcue=@tipcue, codcued=@codcued, codnit=@codnit,
				 numnit=@numnit, cxcCodcueD=@cxcCodcueD, cxcCodcueC=@cxcCodcueC, cxcNit=@cxcNit, cxcCodCen=@cxcCodCen
		   Where codi_sec=@codi_sec AND tran_codi= @tran_codi
	   End
   Else
	   Begin
   		  Insert Into nom_tablacon
					 (codi_sec, tran_codi, tipcue, codcued, codnit, numnit, cxcCodcueD, cxcCodcueC, cxcNit, cxcCodCen)
			  Values (@codi_sec,@tran_codi, @tipcue,@codcued,@codnit,@numnit,@cxcCodcueD,@cxcCodcueC,@cxcNit,@cxcCodCen)
	   End
END TRY 

Begin Catch
  Set @mAddMsg = iif(ERROR_PROCEDURE() is null, @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch
GO


-- Agregado en Febrero 18 de 2015 por Éduar Álvarez.
IF OBJECT_ID('db_SP_NOM_DEVENGOS_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_DEVENGOS_Set
GO

CREATE PROCEDURE db_SP_NOM_DEVENGOS_Set
	@Vr01 decimal(14)=0,	@Vr02 decimal(14)=0,	@Vr03 decimal(14)=0,	@Vr04 decimal(14)=0,	@Vr05 decimal(14)=0,	@Vr06 decimal(14)=0,
	@Vr07 decimal(14)=0,	@Vr08 decimal(14)=0,	@Vr09 decimal(14)=0,	@Vr10 decimal(14)=0,	@Vr11 decimal(14)=0,	@Vr12 decimal(14)=0,
	@Di01 decimal(02)=0,	@Di02 decimal(02)=0,	@Di03 decimal(02)=0,	@Di04 decimal(02)=0,	@Di05 decimal(02)=0,	@Di06 decimal(02)=0,
	@Di07 decimal(02)=0,	@Di08 decimal(02)=0,	@Di09 decimal(02)=0,	@Di10 decimal(02)=0,	@Di11 decimal(02)=0,	@Di12 decimal(02)=0,
	@Codi nvarchar(08)='',  @nAno decimal(04)=0,	@Prom decimal(14)=0,	@Tota decimal(14)=0
AS
BEGIN TRY
   Declare @mMsg	nvarchar(190)='',
           @mAddMsg	nvarchar(50)='',
		   @pVerMsg	int=0,
           @mProc	char(25)='db_SP_NOM_DEVENGOS_Set'

	If Exists (Select codi_emple From Nom_Devengos Where codi_emple=@Codi AND año=@nAno)
		Begin
			Update Nom_Devengos
			Set vr_01=@Vr01,	vr_02=@Vr02,	vr_03=@Vr03,	vr_04=@Vr04,	vr_05=@Vr05,	vr_06=@Vr06,
				vr_07=@Vr07,	vr_08=@Vr08,	vr_09=@Vr09,	vr_10=@Vr10,	vr_11=@Vr11,	vr_12=@Vr12,
				dias_01=@Di01,	dias_02=@Di02,	dias_03=@Di03,	dias_04=@Di04,	dias_05=@Di05,	dias_06=@Di06,
				dias_07=@Di07,	dias_08=@Di08,	dias_09=@Di09,	dias_10=@Di10,	dias_11=@Di11,	dias_12=@Di12,
				vr_acumula=@Tota, sueldo_prom=@Prom
			Where codi_emple=@Codi AND año=@nAno
	   End
   Else
	   Begin
   		  Insert Into Nom_Devengos
					 (codi_emple, año,
						vr_01,	vr_02,	vr_03,	vr_04,	vr_05,	vr_06,	vr_07,	vr_08,	vr_09,	vr_10,	vr_11,	vr_12,
					  dias_01,dias_02,dias_03,dias_04,dias_05,dias_06,dias_07,dias_08,dias_09,dias_10,dias_11,dias_12,
					  sueldo_prom, vr_acumula)
			  Values (@Codi, @nAno,
					  @Vr01, @Vr02, @Vr03, @Vr04, @Vr05, @Vr06, @Vr07, @Vr08, @Vr09, @Vr10, @Vr11, @Vr12,
					  @Di01, @Di02, @Di03, @Di04, @Di05, @Di06, @Di07, @Di08, @Di09, @Di10, @Di11, @Di12,
					  @Prom, @Tota)
	   End
END TRY 

Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+ ' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado en Marzo 21 y Abril 28 de 2015 por Éduar Álvarez.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_NOM_DEVENGOS_SetUpdate','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_DEVENGOS_SetUpdate
GO

CREATE PROCEDURE db_SP_NOM_DEVENGOS_SetUpdate
	@codi_emple nvarchar(4), @ano Numeric(4), @mes nvarchar(2), @dias Numeric(5)=0, @valor decimal(14,2), @sueldo decimal(14,2)
AS
BEGIN
	DECLARE @strCadenaSql nvarchar(MAX)
	SET @mes = RIGHT('00'+CONVERT(varchar(2),@mes),2)
	print @mes

	If NOT EXISTS(SELECT codi_emple FROM Nom_Devengos WHERE codi_emple=@codi_emple AND año=@ano)
		SET @strCadenaSql = 'INSERT INTO Nom_Devengos (codi_emple, año, vr_'+@mes+', dias_'+@mes+', sueldo'+@mes+') VALUES (@codi_emple,@ano,@valor,@dias,@sueldo)'
	Else
		SET @strCadenaSql = 'UPDATE Nom_Devengos SET vr_'+@mes +'='+ 'vr_'+@mes + '+ @valor'+', dias_'+@mes +'='+ 'dias_'+@mes +'+ @dias'+', sueldo'+@mes+'=@sueldo
							 WHERE codi_emple=@codi_emple AND año=@ano'

	EXEC sp_executesql	@strCadenaSql,N'@codi_emple nvarchar(4),	@ano Numeric(4), @valor decimal(14,2),  @dias Numeric(5), @sueldo decimal(14,2)',
										@codi_emple=@codi_emple,	@ano=@ano,		 @valor=@valor,			@dias=@dias,	   @sueldo=@sueldo
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado por Éduar Álvarez - Febrero 18 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('SPG_ActDotaciones','P')		IS NOT NULL DROP PROCEDURE SPG_ActDotaciones
GO
IF OBJECT_ID('db_SP_NOM_DOTACION_Set','P')  IS NOT NULL DROP PROCEDURE db_SP_NOM_DOTACION_Set
GO

CREATE PROCEDURE db_SP_NOM_DOTACION_Set
   @codigo nvarchar(4),
   @nombre nvarchar(40)='',
   @proc   int = 0
AS
BEGIN TRY
	DECLARE @existe  char(1),
			@mNerror int,
			@mMsg    nvarchar(190),
			@mLinea  int,
			@mAddMsg nvarchar(50),
			@pVerMsg int= 0,
			@mProc   char(20)

	select @existe ='N', @mNerror=7021, @mLinea=0, @mAddMsg='' 
	set @mProc  ='db_SP_NOM_DOTACION_Set'
 	if Exists (Select * From Nom_Dotacion Where codigo=@codigo)
		select @existe='S'
 	if @proc=1
		if @existe='N'
			insert into Nom_Dotacion (codigo,nombre) values (@codigo,@nombre)
		else
			Begin  
				select @mNerror = 57014,@pVerMsg = 1;
				throw @mNerror,@mAddMsg,1
			End

	if @proc=2 
		if @existe='S'
			update Nom_Dotacion set nombre=@nombre where codigo=@codigo
		else
			Begin  
				select @mNerror = 57023,@pVerMsg = 1;
				throw @mNerror,@mAddMsg,1
			End  

	if @proc=3
		if @existe='S'
			Begin
			delete from Nom_Dotacion where codigo=@codigo
			End
		else 
			Begin  
				select @mNerror = 57023,@pVerMsg = 1;
				throw @mNerror,@mAddMsg,1
			End
END TRY

BEGIN CATCH
	Set @mAddMsg = IIF(ERROR_PROCEDURE() is null, @mProc+ ' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg 
END CATCH
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificado por Éduar Álvarez - Agosto 25 del 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_NOM_EMPLEADO_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_EMPLEADO_Set
GO
IF OBJECT_ID('SPG_ActEmpleados','P') IS NOT NULL DROP PROCEDURE SPG_ActEmpleados
GO
CREATE PROCEDURE db_SP_NOM_EMPLEADO_Set
	@codi_emple		nvarchar (4)='',			@cedula			nvarchar(15)='',			@lugexp			nvarchar(25)='',			@nombres		nvarchar(30)='',
	@apellido_1		nvarchar(25)='',			@apellido_2		nvarchar(25)='',			@codcto			nvarchar (3)='',			@codi_suc		nvarchar (2)='',
	@codi_sec		nvarchar (3)='',			@codi_obra		nvarchar (3)='',			@direccion		nvarchar(30)='',			@telefono		nvarchar(10)='',
	@celular		nvarchar(10)='',			@ciudad			nvarchar(15)='',			@codi_cargo		nvarchar (3)='',			@codi_labor		nvarchar (2)='',
	@estado_civil	decimal  (1)=0,				@num_hijos		decimal  (2)=0,				@codi_estado	nvarchar (2)='',			@fecha_nac		nvarchar(19)='19000101',
	@fecha_ing		nvarchar(19)='19000101',	@fecha_vac		nvarchar(19)='19000101',	@fecha_sueldo	nvarchar(19)='19000101',	@fecha_ces		nvarchar(19)='19000101',
	@fecha_int		nvarchar(19)='19000101',	@fecha_prima	nvarchar(19)='19000101',	@fecha_retiro	nvarchar(19)='19000101',	@codi_eps		nvarchar(15)='',
	@codi_cesan		nvarchar(15)='',			@codi_pension	nvarchar(15)='',			@codi_arp		nvarchar(15)='',			@codi_ctopago	nvarchar(15)='',
	@codi_ctapago	nvarchar(15)='',			@codi_nivel		nvarchar (2)='',			@codi_prof		nvarchar (2)='',			@codi_entidad	nvarchar (4)='',
	@fecha_grado	nvarchar(19)='19000101',	@codi_carrera	nvarchar (4)='',			@num_grado		decimal  (2)=0,				@talla_calza	decimal  (2)=0,
	@talla_camisa	nvarchar (2)='',			@talla_panta	decimal  (2)=0,				@talla_casco	decimal  (2)=0,				@talla_guante	decimal  (2)=0,
	@sueldo			decimal(14,2)=0,			@sindicato		bit=0,						@subtrans		bit=0,						@salintegral	bit=0,
	@obra			bit=0,						@dedret			decimal(2,2)=0,				@nocuoman		bit=0,						@porret			decimal(10,2)=0,
	@jefe			bit=0,						@acuprov		bit=0,						@acuaporte		bit=0,						@nombret		nvarchar(200)='',
	@estado			decimal(1,0)=0,				@acueps			bit=0,						@banco			nvarchar(200)='',			@acusoli		bit=0,
	@nombre2		nvarchar(30)='',			@tipid			nvarchar (2)='',			@smextras		bit=0,						@tipcot			nvarchar (2)='',
	@aplsoi			bit=0,						@codciu			nvarchar (4)='',			@coddpto		nvarchar (2)='',			@arpemp			decimal(5,3)=0,
	@email			nvarchar(50)='',			@tallabota		decimal  (9)=0,				@tallamalla		decimal  (9)=0,				@tallatapab		decimal(9,0)=0,
	@pproduc		bit=0,						@acupen			bit=0,						@sexo			decimal  (1)=0,				@aportesdev		bit=0,
	@salario		decimal  (1)=0,				@nomhijo1		nvarchar(30)='',			@nomhijo2		nvarchar(30)='',			@nomhijo3		nvarchar(30)='',
	@nomhijo4		nvarchar(30)='',			@nomhijo5		nvarchar(30)='',			@fechijo1		nvarchar(19)='19000101',	@fechijo2		nvarchar(19)='19000101',
	@fechijo3		nvarchar(19)='19000101',	@fechijo4		nvarchar(19)='19000101',	@fechijo5		nvarchar(19)='19000101',	@nomconyuge		nvarchar(30)='',
	@fecconyuge		nvarchar(19)='19000101',	@ocuconyuge		nvarchar(30)='',			@fecexpcc		nvarchar(19)='19000101',	@HExtEsp		bit=0,
	@tipvin			nvarchar (2)='',			@laborasab		bit=0,						@acuepsemp		bit=0,						@tipdom			nvarchar(2)='',
	@vlr_ibc		decimal(14,2)=0,			@idemp			nvarchar (3)='',			@proc			int=0,						@ActVacaciones	bit=0,
	@dctoapocoo		bit=0
AS
BEGIN TRY
	Declare @existe Char(1),		@mNerror int,			@mLinea int,				@mAddMsg nvarchar(50),		@mProc char(22),		@mMsg nvarchar(190), @pVerMsg int,
			@mfecha_nac date,		@mfecha_ing datetime,	@mfecha_vac	datetime,		@mfecha_sueldo datetime,	@mfecha_ces datetime,
			@mfecha_int datetime,	@mfecha_prima datetime,	@mfecha_retiro datetime,	@mfecha_grado datetime,		@mfechijo1 datetime,
			@mfechijo2 datetime,	@mfechijo3 datetime,	@mfechijo4 datetime,		@mfechijo5 datetime,		@mfecexpcc datetime,
			@mfecconyuge datetime

	Select  @existe ='N',	 @mNerror=7021, @mLinea=0,	 @mAddMsg='',	@mProc='db_SP_NOM_EMPLEADO_Set', 
			@mfecha_nac		= convert(date,@fecha_nac),		@mfecha_ing		= convert(date,@fecha_ing),		@mfecha_vac		= convert(date,@fecha_vac),		
			@mfecha_sueldo	= convert(date,@fecha_sueldo),	@mfecha_ces		= convert(date,@fecha_ces),		@mfecha_int		= convert(date,@fecha_int),		
			@mfecha_prima	= convert(date,@fecha_prima),	@mfecha_retiro	= convert(date,@fecha_retiro),	@mfecha_grado	= convert(date,@fecha_grado),	
			@mfechijo1		= convert(date,@fechijo1),		@mfechijo2		= convert(date,@fechijo2),		@mfechijo3		= convert(date,@fechijo3),		
			@mfechijo4		= convert(date,@fechijo4),		@mfechijo5		= convert(date,@fechijo5),		@mfecexpcc		= convert(date,@fecexpcc),
			@mfecconyuge	= convert(date,@fecconyuge)

	If Exists (Select codi_emple,cedula From Nom_Empleado Where codi_emple=@codi_emple)
		Select @existe='S'

	If @proc=1
	begin
		If @existe='N'
		begin
		Insert Into Nom_Empleado 
			(codi_emple,			cedula,					lugexp,					nombres,				apellido_1,				apellido_2,			codcto
			,codi_suc,				codi_sec,				codi_obra,				direccion,				telefono,				celular,			ciudad				
			,codi_cargo,			codi_labor,				estado_civil,			num_hijos,				codi_estado,			fecha_nac,			fecha_ing			
			,fecha_vac,				fecha_sueldo,			fecha_ces,				fecha_int,				fecha_prima,			fecha_retiro,		fecexpcc			
			,codi_eps,				codi_cesan,				codi_pension,			codi_arp,				codi_ctopago,			codi_ctapago,		codi_nivel			
			,codi_prof,				codi_entidad,			fecha_grado,			codi_carrera,			num_grado,				talla_calza,		talla_camisa		
			,talla_panta,			talla_casco,			talla_guante,			sueldo,					ibc,					sindicato,			subtrans			
			,salintegral,			obra,					dedret,					nocuoman,				porret,					jefe,				acuprov			
			,acuaporte,				nombret,				estado,					acueps,					banco,					acusoli,			nombre2			
			,tipid,					smextras,				tipcot,					aplsoi,					codciu,					coddpto,			arpemp				
			,email,					tallabota,				tallamalla,				tallatapab,				pproduc,				acupen,				sexo				
			,aportesdev,			salario,				nomhijo1,				nomhijo2,				nomhijo3,				nomhijo4,			nomhijo5			
			,fechijo1,				fechijo2,				fechijo3,				fechijo4,				fechijo5,				nomconyuge,			fecconyuge			
			,ocuconyuge,			HExtEsp,				tipvin,					laborasab,				acuepsemp,				tipdom,				idemp
			,ActVacaciones,			dctoapocoo)
		Values 
		(	@codi_emple,			@cedula,				@lugexp,				@nombres,				@apellido_1,			@apellido_2,		@codcto
			,@codi_suc,				@codi_sec,				@codi_obra,				@direccion,				@telefono,				@celular,			@ciudad
			,@codi_cargo,			@codi_labor,			@estado_civil,			@num_hijos,				@codi_estado,			@fecha_nac,			@fecha_ing
			,@fecha_vac,			@fecha_sueldo,			@fecha_ces,				@fecha_int,				@fecha_prima,			@fecha_retiro,		@fecexpcc
			,@codi_eps,				@codi_cesan,			@codi_pension,			@codi_arp,				@codi_ctopago,			@codi_ctapago,		@codi_nivel
			,@codi_prof,			@codi_entidad,			@fecha_grado,			@codi_carrera,			@num_grado,				@talla_calza,		@talla_camisa
			,@talla_panta,			@talla_casco,			@talla_guante,			@sueldo,				@vlr_ibc,				@sindicato,			@subtrans
			,@salintegral,			@obra,					@dedret,				@nocuoman,				@porret,				@jefe,				@acuprov
			,@acuaporte,			@nombret,				@estado,				@acueps,				@banco,					@acusoli,			@nombre2
			,@tipid,				@smextras,				@tipcot,				@aplsoi,				@codciu,				@coddpto,			@arpemp
			,@email,				@tallabota,				@tallamalla,			@tallatapab,			@pproduc,				@acupen,			@sexo
			,@aportesdev,			@salario,				@nomhijo1,				@nomhijo2,				@nomhijo3,				@nomhijo4,			@nomhijo5
			,@fechijo1,				@fechijo2,				@fechijo3,				@fechijo4,				@fechijo5,				@nomconyuge,		@fecconyuge
			,@ocuconyuge,			@HExtEsp,				@tipvin,				@laborasab,				@acuepsemp,				@tipdom,			@idemp
			,@actVacaciones,		@dctoapocoo)
		end
	end

	If @proc=2 
	begin
		If @existe='S'
		Begin
        Update	Nom_Empleado 
		   Set	lugexp		=@lugexp,			nombres		=@nombres,			apellido_1	=@apellido_1,		apellido_2	=@apellido_2,	codcto		=@codcto,		
				codi_suc	=@codi_suc,			codi_sec	=@codi_sec,			codi_obra	=@codi_obra,		direccion	=@direccion,	telefono	=@telefono,
				celular		=@celular,			ciudad		=@ciudad,			codi_cargo	=@codi_cargo,		codi_labor	=@codi_labor,	estado_civil=@estado_civil,
				num_hijos	=@num_hijos,		codi_estado	=@codi_estado,		fecha_nac	=@mfecha_nac,		fecha_ing	=@mfecha_ing,	fecha_vac	=@mfecha_vac,
				fecha_sueldo=@mfecha_sueldo,	fecha_ces	=@mfecha_ces,		fecha_int	=@mfecha_int,		fecha_prima	=@mfecha_prima,	fecha_retiro=@mfecha_retiro,
				fecexpcc	=@mfecexpcc,		codi_eps	=@codi_eps,			codi_cesan	=@codi_cesan,		codi_pension=@codi_pension,	codi_arp	=@codi_arp,
				codi_ctopago=@codi_ctopago,		codi_ctapago=@codi_ctapago,		codi_nivel	=@codi_nivel,		codi_prof	=@codi_prof,	codi_entidad=@codi_entidad,
				fecha_grado	=@mfecha_grado,		codi_carrera=@codi_carrera,		num_grado	=@num_grado,		talla_calza	=@talla_calza,	talla_camisa=@talla_camisa,
				talla_panta	=@talla_panta,		talla_casco	=@talla_casco,		talla_guante=@talla_guante,		sueldo		=@sueldo,		ibc			=@vlr_ibc,
				sindicato	=@sindicato,		subtrans	=@subtrans,			salintegral	=@salintegral,		obra		=@obra,			dedret		=@dedret,
				nocuoman	=@nocuoman,			porret		=@porret,			jefe		=@jefe,				acuprov		=@acuprov,		acuaporte	=@acuaporte,
				nombret		=@nombret,			estado		=@estado,			acueps		=@acueps,			banco		=@banco,		acusoli		=@acusoli,
				nombre2		=@nombre2,			tipid		=@tipid,			smextras	=@smextras,			tipcot		=@tipcot,		aplsoi		=@aplsoi,
				codciu		=@codciu,			coddpto		=@coddpto,			arpemp		=@arpemp,			email		=@email,		tallabota	=@tallabota,
				tallamalla	=@tallamalla,		tallatapab	=@tallatapab,		pproduc		=@pproduc,			acupen		=@acupen,		sexo		=@sexo,
				aportesdev	=@aportesdev,		salario		=@salario,			nomhijo1	=@nomhijo1,			nomhijo2	=@nomhijo2,		nomhijo3	=@nomhijo3,
				nomhijo4	=@nomhijo4,			nomhijo5	=@nomhijo5,			fechijo1	=@mfechijo1,		fechijo2	=@mfechijo2,	fechijo3	=@mfechijo3,
				fechijo4	=@mfechijo4,		fechijo5	=@mfechijo5,		nomconyuge	=@nomconyuge,		fecconyuge	=@mfecconyuge,	ocuconyuge	=@ocuconyuge,
				HExtEsp		=@HExtEsp,			tipvin		=@tipvin,			laborasab	=@laborasab,		acuepsemp	=@acuepsemp,	tipdom		=@tipdom,
				idemp		=@idemp,			cedula		=@cedula,			actvacaciones=@actvacaciones,	dctoapocoo	=@dctoapocoo 	
        Where	codi_emple	=@codi_emple
		End
	end
	If @proc=3 AND @existe='S'
		Delete From nom_empleado Where codi_emple=@codi_emple

	--GUARDAR O ACTUALIZAR EMPLEADO EN GLB_TERCEROS
	DECLARE @fecsys datetime,
			@telter decimal (15,0)
		SET @fecsys = SYSDATETIME()
		SET @telter=0

	If  not exists (select nitter from glb_terceros where nitter=@cedula) 
	begin
		Insert Into glb_terceros (nitTer,  nomTer,  telTer, dirTer,    ciuTer, fecSys,eps,pension,arp,cesantia,apellido1,  apellido2,  nombre1, otros,   sexo,teremp,tipter)
						  Values (@cedula,@nombret,@telter,@direccion,@codciu,@fecsys,0, 0, 0, 0,			  @apellido_1,@apellido_2,@nombres,@nombre2,@sexo,1,3)
	end
	UPDATE glb_terceros SET NomTer	  = @nombret
						   ,TelTer	  = @telefono
						   ,DirTer	  = @direccion
						   ,CiuTer	  = @codciu
						   ,FecSys	  = @fecsys
						   ,apellido1 = @apellido_1
						   ,apellido2 = @apellido_2
						   ,nombre1	  = @nombres
						   ,otros	  = @nombre2
						   ,sexo	  = @sexo
						   ,teremp	  = 1
						   ,tipter	  = 3
	WHERE nitter=@cedula
END TRY 

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End catch 
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Éduar Álvarez - Marzo 5 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_NOM_TRANSACCION_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_TRANSACCION_Set
GO
IF OBJECT_ID('SPG_ActTransacciones','P') IS NOT NULL DROP PROCEDURE SPG_ActTransacciones
GO

CREATE PROCEDURE db_SP_NOM_TRANSACCION_Set
@tran_codi	 nvarchar(4)='',	@tran_nomb	nvarchar(50)='',	@camposai	nvarchar (3)='',	@abrev		nvarchar (10)='',
@tipo		 decimal=0,			@clase		decimal(1)=0,		@acumula	bit,				@periodo	decimal(1)=0,
@formula	 nvarchar(254)='',	@acprima	bit,				@accesan	bit,				@acinter	bit,
@acvacac	 bit,				@acpension	bit,				@acsalud	bit,				@unidad		nvarchar (1)='',
@acicbf		 bit,				@accomfa	bit,				@acsena		bit,				@acarp		bit,
@extra		 bit,				@base		nvarchar(1)='',		@opera		nvarchar(1)='',		@vrfactor	decimal(18,4)=0,
@corte		 decimal(10)=0,		@acanticipo	bit,				@acsoi		bit,				@otringreso	bit,
@dctodia	 bit,				@dctotransp	bit,				@dctopensi	bit,				@dctosalud	bit,
@vlrinfo	 bit,				@liqcomple	bit,				@noaplivaca	bit,				@tfijaformu bit,
@noaplitfija bit,				@recargos	bit,				@retencion  bit,				@propordia	bit,
@prodiainca  bit,				@clasif		nvarchar(2),		@orden		Numeric(3)=0,		@ctaxc		Char(8)='',
@prioridad	 Numeric(2),		@tranagru	nvarchar(4),		@gencxc		bit,				@gencxp		bit,
@genrc		 bit,				@detalle	bit,				@proc		int

AS
BEGIN TRY
	Declare @existe char(1), @mNerror int, @mMsg nvarchar(190), @mLinea int,
			@mAddMsg nvarchar(50),@mProc char(20),@pVerMsg int=0
	Select @existe ='N', @mNerror = 7021, @mLinea=0, @mAddMsg='', @mProc = 'db_SP_NOM_TRANSACCION_Set'

	If Exists (Select tran_codi,tran_nomb From nom_transaccion Where tran_codi=@tran_codi)
		Select @existe='S'

	If @proc=1
	begin 
		If @existe='N'
		begin
			Insert Into nom_transaccion (tran_codi
										,tran_nomb
										,camposai
										,abrev
										,tipo
										,clase
										,acumula
										,periodo
										,formula
										,acprima
										,accesan
										,acinter
										,acvacac
										,acpension
										,acsalud
										,unidad
										,acicbf
										,accomfa
										,acsena
										,acarp
										,extra
										,base
										,opera
										,vrfactor
										,corte
										,acanticipo
										,acsoi
										,otringreso
										,dctodia
										,dctotransp
										,dctopensi
										,dctosalud
										,vlrinfo
										,liqcomple
										,noaplivaca
										,tfijaformu
										,noaplitfija
										,recargos
										,retencion
										,propordia
										,prodiainca
										,clasif
										,orden
										,ctaxc
										,prioridad
										,tranagru
										,gencxc
										,gencxp
										,genrc
										,detalle)  
								Values ( @tran_codi
										,@tran_nomb
										,@camposai
										,@abrev
										,@tipo
										,@clase
										,@acumula
										,@periodo
										,@formula
										,@acprima
										,@accesan
										,@acinter
										,@acvacac
										,@acpension
										,@acsalud
										,@unidad
										,@acicbf
										,@accomfa
										,@acsena
										,@acarp
										,@extra
										,@base
										,@opera
										,@vrfactor
										,@corte
										,@acanticipo
										,@acsoi
										,@otringreso
										,@dctodia
										,@dctotransp
										,@dctopensi
										,@dctosalud
										,@vlrinfo
										,@liqcomple
										,@noaplivaca
										,@tfijaformu
										,@noaplitfija
										,@recargos
										,@retencion
										,@propordia
										,@prodiainca
										,@clasif
										,@orden
										,@ctaxc
										,@prioridad
										,@tranagru
										,@gencxc
										,@gencxp
										,@genrc
										,@detalle)
		end
	end

	If @proc = 2
	begin
		If @existe='S'
		begin
			Update nom_transaccion
			   Set tran_codi	= @tran_codi
				  ,tran_nomb	= @tran_nomb
				  ,camposai		= @camposai
				  ,abrev		= @abrev
				  ,tipo			= @tipo
				  ,clase		= @clase
				  ,acumula		= @acumula
				  ,periodo		= @periodo
				  ,formula		= @formula
				  ,acprima		= @acprima
				  ,accesan		= @accesan
				  ,acinter		= @acinter
				  ,acvacac		= @acvacac
				  ,acpension	= @acpension
				  ,acsalud		= @acsalud
				  ,unidad		= @unidad
				  ,acicbf		= @acicbf
				  ,accomfa		= @accomfa
				  ,acsena		= @acsena
				  ,acarp		= @acarp
				  ,extra		= @extra
				  ,base			= @base
				  ,opera		= @opera
				  ,vrfactor		= @vrfactor
				  ,corte		= @corte
				  ,acanticipo	= @acanticipo
				  ,acsoi		= @acsoi
				  ,otringreso	= @otringreso
				  ,dctodia		= @dctodia
				  ,dctotransp	= @dctotransp
				  ,dctopensi	= @dctopensi
				  ,dctosalud	= @dctosalud
				  ,vlrinfo		= @vlrinfo
				  ,liqcomple	= @liqcomple
				  ,noaplivaca	= @noaplivaca
				  ,tfijaformu	= @tfijaformu
				  ,noaplitfija	= @noaplitfija
				  ,recargos		= @recargos
				  ,retencion	= @retencion
				  ,propordia	= @propordia
				  ,prodiainca	= @prodiainca
				  ,clasif		= @clasif
				  ,orden		= @orden
				  ,ctaxc		= @ctaxc
				  ,prioridad	= @prioridad
				  ,tranagru		= @tranagru
				  ,gencxc		= @gencxc
				  ,gencxp		= @gencxp
				  ,genrc		= @genrc
				  ,detalle		= @detalle
			Where tran_codi	= @tran_codi
		end
	end

	If @proc = 3 
		If @existe='S'
			Delete From nom_transaccion Where tran_codi=@tran_codi
END TRY

Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Éduar Álvarez - Marzo 12 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_Nom_DetNovedad_Set','P') IS NOT NULL DROP PROCEDURE db_SP_Nom_DetNovedad_Set
GO

CREATE PROCEDURE db_SP_NOM_DETNOVEDAD_Set

@ano		numeric  (4)=0,
@mes		nvarchar (2)='',
@periodo	nvarchar (1)='',
@codi_emple	nvarchar (4)='',
@codcen		nvarchar (6)='',
@tran_codi	nvarchar (4)='',
@fecnov		datetime,
@qty		decimal  (18,2)=0,
@valdeven	decimal	 (18,2)=0,
@valdeduc	decimal  (18,2)=0,
@vr_parcial	decimal	 (18,2)=0,
@vr_total	decimal	 (18,2)=0,
@codusu		nvarchar (10)

AS
BEGIN TRY
	Declare @mExiste char(1),
			@mAddMsg nvarchar(50),
			@pVerMsg int=0,
			@mProc   char(25)

	Select @mExiste='N', @mAddMsg='', @mProc = 'db_SP_Nom_DetNovedad_Set'

	If Exists (Select * From Nom_DetNovedad
			   Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND tran_codi=@tran_codi AND codcen=@codcen)
		Set @mExiste='S'

	If @mExiste='N'
		begin
		Insert Into Nom_DetNovedad
			   ( ano, mes, periodo, codi_emple, codcen, tran_codi, fecnov, qty, valdeven, valdeduc, vr_parcial, vr_total, codusu)
		Values (@ano,@mes,@periodo,@codi_emple,@codcen,@tran_codi,@fecnov,@qty,@valdeven,@valdeduc,@vr_parcial,@vr_total,@codusu)
		end
	Else
		begin
			Update Nom_DetNovedad
			   Set fecnov=@fecnov, qty=@qty, valdeven=@valdeven, valdeduc=@valdeduc,
				   vr_parcial=@vr_parcial, vr_total=@vr_parcial, codusu=@codusu
			 Where ano=@ano AND mes=@mes AND periodo=@periodo AND codi_emple=@codi_emple AND codcen=@codcen AND tran_codi=@tran_codi
		end
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg, @mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO

IF OBJECT_ID('db_SP_ALM_ART_INV_MAR_Get','P') IS NOT NULL
BEGIN
	DROP PROCEDURE db_SP_ALM_ART_INV_MAR_Get
END
GO
CREATE PROCEDURE db_SP_ALM_ART_INV_MAR_Get
	@IdEmp NVARCHAR(4),	@CodCto NVARCHAR(3),	@CodTer	NVARCHAR(15),	@CodGru NVARCHAR(3),	@CodLin nvarchar(4),
	@CodMar nvarchar(4)
AS
BEGIN 
	DECLARE @strConsulta NVARCHAR(MAX),	@strCondCodcto NVARCHAR(250),	@strCondNitPro NVARCHAR(250),	@strCondGru NVARCHAR(250),
			@strCondLin NVARCHAR(250),  @strCondMar NVARCHAR(250)

	SET @strCondCodcto	= IIF(@codCto ='','',' and Inv.CodCto='+@CodCto)
	SET @strCondNitPro	= IIF(@CodTer ='','',' and Art.CodTer='+@CodTer)
	SET @strCondGru		= IIF(@CodGru ='','',' and Art.CodGru='+@CodGru)
	SET @strCondLin		= IIF(@CodLin ='','',' and Art.CodLin='+@CodLin)
	SET @strCondMar		= IIF(@CodMar ='','',' and Art.CodMar='+@CodMar)


	--IIF(Mar.nommar is Null,'+'Sin Marca'+',Mar.nommar)
	SET @strConsulta ='	SELECT	Art.codart, Art.nomart, Art.refart, Mar.nommar as Marca, Inv.pvcart as valunt, 
								Inv.valprom as cosunt, Inv.codCto, Inv.caninv as QtyExi  
						FROM 	Alm_Articulos Art 
								LEFT JOIN Alm_Marcas 		Mar ON Art.codmar=Mar.codmar 
								Inner Join Alm_Inventario	Inv on Art.codart=Inv.CodArt 
						WHERE	Inv.IdEmp='+@IdEmp  + @strCondCodcto + @strCondNitPro + @strCondGru + @strCondLin + @strCondMar +
								' ORDER BY Art.CODART ' 

	EXEC sp_executesql @strConsulta
END
GO

IF OBJECT_ID('db_SP_ALM_KARDEX_GetStocks','P') IS NOT NULL 
	DROP PROCEDURE db_SP_ALM_KARDEX_GetStocks
GO
CREATE PROCEDURE db_SP_ALM_KARDEX_GetStocks 
	@idEmp VARCHAR(03),			@CodCto VARCHAR(03)='',		@strCodpro varchar(15)='',
	@strCodMar	varchar(3)='',	@strCodGru	varchar(3)='',	@strCodLin	varchar(4)='',
	@datFechaIni DATE,			@datFechaFin DATE
	WITH RECOMPILE
AS
BEGIN
	DECLARE @idEmp_Local  VARCHAR(03)
	DECLARE @CodCto_Local VARCHAR(03)
	DECLARE @datFechaIni_Local DATE
	DECLARE @datFechaFin_Local DATE
	DECLARE @strCodGru_Lc varchar(3)	
	DECLARE @strCodLin_Lc varchar(4)	
	DECLARE @strCodMar_Lc varchar(3)	
	DECLARE @strCodPro_Lc varchar(15)	
	
	SET @datFechaIni_Local	= @datFechaIni
	SET @datFechaFin_Local	= @datFechaFin
	SET @idEmp_Local		= @idEmp
	SET @CodCto_Local		= Case When @CodCto='' Then NULL Else @CodCto End
	SET @strCodGru_Lc		= Case When @strCodGru='' Then NULL Else @strCodGru End
	SET @strCodLin_Lc		= Case When @strCodLin='' Then NULL Else @strCodLin End
	SET @strCodMar_Lc		= Case When @strCodMar='' Then NULL Else @strCodMar End
	SET @strCodPro_Lc		= Case When @strCodPro='' Then NULL Else @strCodPro End
	
	RAISERROR('Cargando Datos en tabla Temporal',10,1) WITH NOWAIT
	;with tblDatos AS(
	SELECT	 kar.idemp 
			,kar.codart
			,space(1) as tipcon 
			,SUM((CASE tra.tipcon WHEN 'E' THEN kar.qtyart WHEN 'S' THEN kar.qtyart * - 1 END)) AS Salant
			, 0.00 AS QtyCom
			, 0.00 AS QtyMov
			, 0.00 AS QtyVta
			, 0.00 AS ValTot
			, 0.00 AS Costot
			, 0.00 AS QtyEnt
			, 0.00 AS QtyEntNC
			, 0.00 AS QtySal
			, 0.00 AS CanInv
			, '19000101' as fecucom
	FROM	alm_kardex AS kar 
			INNER JOIN glb_transaccion AS tra ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@idEmp_Local
			and Kar.FecMov<@datFechaIni_Local
			and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			GROUP BY kar.idemp, kar.codart
	UNION ALL
	SELECT	kar.idemp			-- Qty compras
			, kar.codart
			, tra.tipcon 
			, 0.00 AS SalAnt
			, SUM(kar.qtyart) AS QtyCom
			, 0.00 AS QtyMov
			, 0.00 AS QtyVta
			, 0.00 AS ValTot
			, 0.00 AS Costot
			, 0.00 AS QtyEnt
			, 0.00 AS QtyEntNC
			, 0.00 AS QtySal
			, 0.00 AS CanInv
			, max(kar.fecmov) as fecucom
	FROM	alm_kardex kar WITH(NOLOCK)
			INNER JOIN glb_transaccion	AS tra WITH(NOLOCK) ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@idEmp_Local
			and Kar.FecMov BETWEEN @datFechaIni_Local AND @datFechaFin_Local
			and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			and (tra.codmod='CM'  or kar.codcon='EN')  --or tra.codmod='DC')
			GROUP BY kar.idemp, kar.codart,tra.tipcon 
	UNION ALL
	SELECT	kar.idemp			-- Total Entradas sin tener en cuenta las NC por devolucion ni las anulaciones de venta, por que las voy a quitar del todal vendido
			, kar.codart
			, tra.tipcon 
			, 0.00 AS SalAnt
			, 0.00 AS QtyCom
			, 0.00 AS QtyMov
			, 0.00 AS QtyVta
			, 0.00 AS ValTot
			, 0.00 AS Costot
			,  SUM(kar.qtyart) AS QtyEnt
			, 0.00 AS QtyEntNC
			, 0.00 AS QtySal
			, 0.00 AS CanInv
			, '19000101' as fecucom
	FROM	alm_kardex kar WITH(NOLOCK)
			INNER JOIN glb_transaccion	AS tra WITH(NOLOCK) ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@idEmp_Local
			and Kar.FecMov BETWEEN @datFechaIni_Local AND @datFechaFin_Local
			and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			and Tra.tipcon ='E' 
			AND Tra.codmod!='CM' 
			AND Kar.codcon!='EN'
			and tra.codmod!='DV'
			and tra.codmod!='NC'
			GROUP BY kar.idemp, kar.codart,tra.tipcon 
	UNION ALL
	SELECT	kar.idemp			-- Total Entradas por devolucion 'NC'
			, kar.codart
			, tra.tipcon 
			, 0.00 AS SalAnt
			, 0.00 AS QtyCom
			, 0.00 AS QtyMov
			, 0.00 AS QtyVta
			, 0.00 AS ValTot
			, 0.00 AS Costot
			, 0.00 AS QtyEnt
			,  SUM(kar.qtyart) AS QtyEntNC
			, 0.00 AS QtySal
			, 0.00 AS CanInv
			, '19000101' as fecucom
	FROM	alm_kardex kar WITH(NOLOCK)
			INNER JOIN glb_transaccion	AS tra WITH(NOLOCK) ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@idEmp_Local
			and Kar.FecMov BETWEEN @datFechaIni_Local AND @datFechaFin_Local
			and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			AND Tra.codmod='NC' 
			GROUP BY kar.idemp, kar.codart,tra.tipcon 
	UNION ALL
	SELECT	kar.idemp			-- Total salidas Busco todas las salidas menos las de ventas 
			, kar.codart
			, tra.tipcon 
			, 0.00 AS SalAnt
			, 0.00 AS QtyCom
			, 0.00 AS QtyMov
			, 0.00 AS QtyVta
			, 0.00 AS ValTot
			, 0.00 AS Costot
			, 0.00 AS QtyEnt
			, 0.00 AS QtyEntNC
			,SUM(kar.qtyart) AS QtySal
			, 0.00 AS CanInv
			, '19000101' as fecucom
	FROM	alm_kardex kar WITH(NOLOCK)
			INNER JOIN glb_transaccion	AS tra WITH(NOLOCK) ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@idEmp_Local
			and Kar.FecMov BETWEEN @datFechaIni_Local AND @datFechaFin_Local
			and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			and Tra.tipcon='S' 
			AND NOT Tra.codmod IN('VT','ND','DC')
			GROUP BY kar.idemp, kar.codart,tra.tipcon 
	UNION ALL
	SELECT	fac.idemp					-- Qty Vtas
			, Det.codart
			, 'E' as tipcon 
			, 0.00 AS SalAnt
			, 0.00 AS QtyCom
			, 0.00 AS QtyMov
			, Sum(Det.qtyart) as qtyvta
			, sum(Det.ValTot-Det.ValDes-ROUND((((Det.ValTot-Det.ValDes)/Det.QtyArt)*Det.DevArt),0)) as ValTot
			,sum((Det.QtyArt-Det.Devart) * Det.CosIns) as Costot 
			, 0.00 AS QtyEnt
			, 0.00 AS QtyEntNC
			, 0.00 AS QtySal
			, 0.00 AS CanInv
			, '19000101' as fecucom
			FROM ven_facturas fac WITH(NOLOCK)
				INNER JOIN ven_facdetalle  AS det WITH(NOLOCK) ON fac.idemp=det.idemp and fac.codcto=det.codcto and fac.tipfac = det.tipfac and fac.numfac = det.numfac
			WHERE fac.IdEmp=@idEmp_Local 
			and fac.Fecfac BETWEEN @datFechaIni_Local AND @datFechaFin_Local
			and (fac.CodCto=@CodCto_Local OR @CodCto_Local is null)
			AND fac.estfac=''
			GROUP BY fac.idemp,det.codart
	union all 
	SELECT	kar.idemp			--existencias 
			, kar.codart
			,tra.tipcon 
			, 0.00 AS SalAnt
			, 0.00 AS QtyCom
			, 0.00 AS QtyMov
			, 0.00 AS QtyVta
			, 0.00 AS ValTot
			, 0.00 AS Costot
			, 0.00 AS QtyEnt
			, 0.00 AS QtyEntNC
			, 0.00 AS QtySal
			,SUM(kar.qtyart) AS CanInv
			, '19000101' as fecucom
	FROM	alm_kardex kar WITH(NOLOCK)
			INNER JOIN glb_transaccion	AS tra WITH(NOLOCK) ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@idEmp_Local
			and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			GROUP BY kar.idemp, kar.codart,tra.tipcon 
	)	
	SELECT	kar.idemp   -- esta es para traer el precio y el costo para que si lo add abajo me da valores errados 
			,kar.codart
			,kar.tipcon
			,kar.SalAnt AS SalAnt
			,kar.QtyCom AS QtyCom
			,kar.QtyMov AS QtyMov
			,kar.QtyVta AS QtyVta
			,kar.VAlTot AS ValTot
			,kar.CosTot AS CosTot
			,kar.QtyEnt AS QtyEnt
			,kar.QtyEntNC AS QtyEntNC
			,kar.QtySal AS QtySal
			,kar.Caninv AS Caninv
			,max(inv.pvcart) as valunt 
			,max(inv.valprom) as cosunt 
			,max(kar.fecucom) as fecucom
	INTO	#tblTEmp1
	FROM	tblDatos kar 
			inner join alm_inventario as inv WITH(NOLOCK) on kar.idemp=inv.idemp and  kar.codart=inv.codart
			GROUP BY kar.idemp,kar.codart,kar.tipcon,kar.SalAnt,kar.QtyCom,kar.QtyMov,kar.QtyVta,kar.VAlTot,kar.CosTot,kar.QtyEnt,kar.QtyEntNC,kar.QtySal,kar.Caninv
				
	RAISERROR('Ejecutando Informe',10,1) WITH NOWAIT
	
	SELECT	kar.idemp
			,kar.codart
			,kar.tipcon
			,SUM(kar.SalAnt) AS SalAnt
			,SUM(kar.QtyCom) AS QtyCom
			,SUM(kar.QtyMov) AS QtyMov
			,SUM(kar.QtyVta) AS QtyVta
			,SUM(kar.VAlTot) AS ValTot
			,SUM(kar.CosTot) AS CosTot
			,SUM(kar.QtyEnt) AS QtyEnt
			,SUM(kar.QtyEntNC) AS QtyEntNC
			,SUM(kar.QtySal) AS QtySal
			,SUM(kar.Caninv) AS Caninv
			,max(kar.valunt) as valunt  
			,max(kar.cosunt) as cosunt   
			,max(kar.fecucom) as fecucom
	INTO	#tblTEmp
	FROM	#tblTEmp1 kar 
			GROUP BY kar.idemp,kar.codart,kar.tipcon
			
			
		
	SELECT	kar.idemp
			,Art.refart
			,max(ARt.NomARt) as Nomart
			,iif(Mar.nommar is null,'',Mar.nommar) as Marca 
			,max(Art.Undart) as undart  
			,SUM((CASE KAR.tipcon WHEN 'E' THEN kar.caninv WHEN 'S' THEN kar.caninv * - 1 END))  AS QtyExi
			,sum(kar.SalAnt)  AS SalAnt
			,SUM((CASE KAR.tipcon WHEN 'E' THEN kar.QtyMov WHEN 'S' THEN Kar.QtyMov * - 1  END)) AS QtyMov
			,SUM((CASE KAR.tipcon WHEN 'E' THEN kar.QtyCom WHEN 'S' THEN Kar.QtyCom * - 1  END)) AS QtyCom
			,SUM(kar.QtyVta) AS QtyVTa
			,sum(kar.costot) as costot
			,sum(kar.Valtot) as Valtot
			,SUM((CASE KAR.tipcon WHEN 'E' THEN kar.QtyEnt WHEN 'S' THEN Kar.QtyEnt * - 1  END)) AS QtyEnt
			,SUM(QtyEntNC) AS QtyEntNC
			,SUM((CASE KAR.tipcon WHEN 'E' THEN kar.QtySal * - 1  WHEN 'S' THEN Kar.QtySal  END)) AS QtySal
			,0.00 as utilidad
			,max(kar.valunt) as valunt
			,max(kar.cosunt) as cosunt 
			,max(kar.fecucom) as fecucom
	FROM	#tblTemp KAR  
			inner join alm_articulos	as Art WITH(NOLOCK) on Kar.Codart = Art.codart 
			left join alm_marcas		as Mar WITH(NOLOCK) on Art.codmar =  Mar.codmar
	WHERE	KAR.IdEmp=@idEmp_Local
			and (Art.CodLin=@strCodLin_Lc OR @strCodLin_Lc is null)
			and (Art.CodMar=@strCodMar_Lc OR @strCodMar_Lc is null)
			and (Art.CodTer=@strCodPro_Lc OR @strCodPro_Lc is null)
			and (Art.CodGru=@strCodGru_Lc OR @strCodGru_Lc is null)
			GROUP BY kar.idemp,Art.refart,Mar.nommar

END
GO

IF OBJECT_ID('db_SP_CON_fr_Medios_Pro1001','P') IS NOT NULL DROP PROCEDURE db_SP_CON_fr_Medios_Pro1001
GO
CREATE PROCEDURE db_SP_CON_fr_Medios_Pro1001
	@strIdEmp nvarchar(3)='',		@lnAño Numeric(4)=0,	@lnTope Numeric(20)=0,		@cTipoNit nVarChar(6)=''
	WITH RECOMPILE
AS
SET NOCOUNT ON
BEGIN
	;WITH tblDatos AS
	(	SELECT 	A.idemp,
				A.nitter,
				ROUND(Debito-Credito,0)		AS PagDedu,
				cast('0' as decimal(18,2))	as PAGNODEDU,  
				a.ivamayvlr		 			as ivamayorvlrdedu,
				cast('0' as decimal(18,2)) 	as ivamayorvlrnodedu,
				B.tope,
				B.codcon,
				A.codcue,
				'  ' AS anultran,
				A.codtran,
				A.codcto,
				A.consec
		FROM 	con_Comprobante A
				INNER JOIN Con_ConMedios B ON A.codcue=B.codcue
		WHERE 	B.codmedio='1001' AND B.numcolum='14' AND B.codcon<>'' AND LEFT(A.codcue,2)<>'14' and a.codtran!='CI'  and 
				a.estcomp='' and year(a.fecdoc)=@lnAño
		UNION ALL
		SELECT 	A.idemp,
				A.nitter,
				cast('0' as decimal(18,2))	AS PagDedu,
				ROUND(Debito-Credito,0)		as PAGNODEDU,  
				cast('0' as decimal(18,2)) 	as ivamayorvlrdedu,
				a.ivamayvlr					as ivamayorvlrnodedu,
				B.tope,
				B.codcon,
				A.codcue,
				'  ' AS anultran,
				A.codtran,
				A.codcto,
				A.consec
		FROM 	con_Comprobante  A
				INNER JOIN Con_ConMedios B ON A.codcue=B.codcue
		WHERE 	B.codmedio='1001' AND B.numcolum='15' AND B.codcon<>'' AND LEFT(A.codcue,2)<>'14' and a.codtran!='CI' 
				 and a.estcomp='' and year(a.fecdoc)=@lnAño
		UNION ALL		-- Cuentas de compra pero solo las transacciones de compra.
		SELECT 	A.idemp,
				A.nitter,
				ROUND(Debito-Credito,0)		AS PagDedu,
				cast('0' as decimal(18,2))	as PAGNODEDU,  
				a.ivamayvlr		 			as ivamayorvlrdedu,
				cast('0' as decimal(18,2)) 	as ivamayorvlrnodedu,
				B.tope,
				B.codcon,
				A.codcue,
				D.anultran,
				A.codtran,
				A.codcto,
				A.consec
		FROM 	con_Comprobante  A
				INNER JOIN Con_ConMedios 	B ON A.codcue =B.codcue
				INNER JOIN Glb_Transaccion 	D ON A.codtran=D.codtran
		WHERE 	codmedio='1001' AND B.numcolum='14' AND B.codcon<>'' AND LEFT(A.codcue,2)='14' AND D.codmod='CM' and a.codtran!='CI'  
				and a.estcomp='' and year(a.fecdoc)=@lnAño
		UNION ALL
		SELECT 	A.idemp,
				A.nitter,
				cast('0' as decimal(18,2))	AS PagDedu,
				ROUND(Debito-Credito,0)		as PAGNODEDU,  
				cast('0' as decimal(18,2)) 	as ivamayorvlrdedu,
				a.ivamayvlr					as ivamayorvlrnodedu,
				B.tope,
				B.codcon,
				A.codcue,
				D.anultran,
				A.codtran,
				A.codcto,
				A.consec
		FROM 	con_Comprobante  A
				INNER JOIN Con_ConMedios   B ON A.codcue = B.codcue
				INNER JOIN Glb_Transaccion D ON A.codtran= D.codtran
		WHERE 	B.codmedio='1001' AND B.numcolum='15' AND B.codcon<>'' AND LEFT(A.codcue,2)='14' AND D.codmod='CM'  and a.codtran!='CI' 
				 and a.estcomp='' and year(a.fecdoc)=@lnAño
	)
		
	SELECT	idemp, 
			Case When @cTipoNit='CodPro' Then ter.codpro Else com.nitter End AS nitter , 
			PagDedu, 
			PagNoDedu, 
			tope, 
			codcon, 
			codcue, 
			anultran, 
			ivamayorvlrdedu, 
			ivamayorvlrnodedu
	FROM 	tblDatos com
			inner join glb_terceros ter on com.nitter=ter.nitter
	WHERE  	concat(Com.codcto,Com.anultran,Com.consec,Com.codcue,Com.nitter)
			NOT IN ( SELECT	concat(codcto,codtran,consec,codcue,nitter) 
					 FROM	con_comprobante group by codcto,codtran,consec,codcue,nitter )
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creado por Éduar Álvarez - Abril 10 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_CON_fr_Medios_Pro1005','P') IS NOT NULL DROP PROCEDURE db_SP_CON_fr_Medios_Pro1005
GO
CREATE PROCEDURE db_SP_CON_fr_Medios_Pro1005	@lnAño Numeric(4)=0, @lcCiudad nVarChar(3)='', @lcDpto nVarChar(2)='', @lnTope Numeric(20)=0, @cTipoNit nVarChar(6)=''
WITH RECOMPILE
AS
SET NOCOUNT ON
BEGIN
	SELECT	Case When @cTipoNit='CodPro' Then E.codpro Else A.nitter End AS nitter
			,A.debito
			,ROUND(A.debito,0)		AS VlrIVA
			,ROUND(A.debito,0)		AS VlrDevol
			,00000000000000000000	AS Base
			,SPACE(2) AS anultran
			,A.codtran
			,A.codcen
			,A.codcue
			,A.consec
	INTO	#cur_Comprobante
	FROM 	Con_Comprobante A WITH(NOLOCK)
			INNER JOIN Glb_Terceros E ON RTRIM(A.nitter)=RTRIM(E.nitter)
	WHERE	YEAR(fecdoc)=@lnAño and A.estcomp=''

	; WITH tblDatos AS
	(	SELECT 	 A.nitter
				,A.VlrIVA
				,00000000000000000000 AS VlrDevol
				,ROUND(((A.debito)*100)/C.poriva,0) AS Base
				,T.anultran
				,A.codcen
				,A.codcue
				,A.consec
		FROM 	#cur_Comprobante A
				INNER JOIN Con_ConMedios 	B ON RTRIM(A.codcue)  = RTRIM(B.codcue)
				INNER JOIN Con_PUC 		 	C ON RTRIM(B.codcue)  = RTRIM(C.codcue)
				INNER JOIN Glb_Terceros  	E ON RTRIM(A.nitter)  = RTRIM(E.nitter)
				INNER JOIN Glb_Transaccion 	T ON RTRIM(A.codtran) = RTRIM(T.codtran)
		WHERE 	RTRIM(B.codmedio)='1005' AND B.numcolum='09'
		UNION ALL
		SELECT 	 A.nitter
				,00000000000000000000 AS VlrIVA
				,ROUND(A.debito,0)	  AS VlrDevol
				,ROUND(((A.debito)*100)/C.poriva,0) AS Base
				,T.anultran
				,A.codcen
				,A.codcue
				,A.consec
		FROM 	#cur_Comprobante A
				INNER JOIN Con_ConMedios 	B ON RTRIM(A.codcue)  = RTRIM(B.codcue)
				INNER JOIN Con_PUC 		 	C ON RTRIM(B.codcue)  = RTRIM(C.codcue)
				INNER JOIN Glb_Terceros  	E ON RTRIM(A.nitter)  = RTRIM(E.nitter)
				INNER JOIN Glb_Transaccion 	T ON RTRIM(A.codtran) = RTRIM(T.codtran)
		WHERE 	RTRIM(B.codmedio)='1005' AND B.numcolum='10'
	)

	SELECT 	nitter
			,vlriva
			,vlrdevol
			,base
	FROM 	tblDatos
	WHERE  	RTRIM(codcen)+RTRIM(anultran)+RTRIM(consec)+RTRIM(codcue)+RTRIM(nitter)
			NOT IN (SELECT	RTRIM(codcen)+RTRIM(codtran)+RTRIM(consec)+RTRIM(codcue)+RTRIM(nitter)
					FROM	#cur_Comprobante)
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creado por Éduar Álvarez - Abril 10 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_CON_fr_Medios_Pro1006','P') IS NOT NULL DROP PROCEDURE db_SP_CON_fr_Medios_Pro1006
GO
CREATE PROCEDURE db_SP_CON_fr_Medios_Pro1006	
	@pIdEmp nvarchar(3)='',		@lnAño Numeric(4)=0,	@lnTope Numeric(20)=0,		@cTipoNit nVarChar(6)=''
WITH RECOMPILE
AS
SET NOCOUNT ON
BEGIN
	; WITH tblDatos AS(
	SELECT 	Case When @cTipoNit='CodPro' Then E.codpro Else A.nitter End AS nitter,
			ROUND(A.Credito,0)					AS VLRiva ,
			cast('0' as decimal(18,2))			AS vlrdevol, 
			ROUND(((A.CREDITO)*100)/c.poriva,0)	as base,
			t.anultran,
			a.codcto,
			a.codcue,
			a.consec,a.codtran 
	FROM 	Con_Comprobante A 
			INNER JOIN Con_ConMedios B 	ON A.codcue=B.codcue
			inner JOIN Con_PUC C 		ON B.codcue=C.codcue
			INNER JOIN Glb_Terceros  E  ON a.nitter=e.nitter
			INNER JOIN Glb_Transaccion 	T ON a.codtran=t.codtran 
	WHERE 	a.Idemp=@pIdEmp and  B.codmedio='1006' AND b.numcolum='09' AND YEAR(A.fecdoc)=@lnAño AND a.estcomp='' 
	UNION ALL 
	SELECT 	Case When @cTipoNit='CodPro' Then E.codpro Else A.nitter End AS nitter,
			cast('0' as decimal(18,2))			AS vlriva,
			ROUND(A.Credito,0)					AS VLRdevol ,
			ROUND(((A.CREDITO)*100)/c.poriva,0)	as  base,
			t.anultran,
			a.codcto,
			a.codcue,
			a.consec,a.codtran 
	FROM 	Con_Comprobante A 
			INNER JOIN Con_ConMedios B 	ON A.codcue=B.codcue
			inner JOIN Con_PUC C 		ON B.codcue=C.codcue 
			INNER JOIN Glb_Terceros  E  ON a.nitter=e.nitter
			INNER JOIN Glb_Transaccion 	T ON a.codtran=t.codtran
	WHERE 	a.Idemp=@pIdEmp and B.codmedio='1006' AND numcolum='10' AND  YEAR(A.fecdoc)=@lnAño AND a.estcomp=''
	)
	SELECT 	nitter, vlriva, vlrdevol, base, anultran,codtran
	FROM 	tblDatos
	WHERE  	codtran not in 
			(SELECT anultran FROM glb_transaccion)


	--SELECT	Case When @cTipoNit='CodPro' Then E.codpro Else A.nitter End AS nitter
	--		,A.credito
	--		,ROUND(A.credito,0)		AS VlrIVA
	--		,ROUND(A.credito,0)		AS VlrDevol
	--		,00000000000000000000	AS Base
	--		,SPACE(2) AS anultran
	--		,A.codtran
	--		,A.codcen
	--		,A.codcue
	--		,A.consec
	--INTO	#cur_Comprobante
	--FROM 	Con_Comprobante A WITH(NOLOCK) INNER JOIN Glb_Terceros E ON RTRIM(A.nitter)=RTRIM(E.nitter)
	--WHERE	YEAR(fecdoc)=@lnAño and A.estcomp='' 

	--; WITH tblDatos AS
	--(	SELECT 	 A.nitter
	--			,A.VlrIVA
	--			,00000000000000000000 AS VlrDevol
	--			,ROUND(((A.credito)*100)/C.poriva,0) AS Base
	--			,T.anultran
	--			,A.codcen
	--			,A.codcue
	--			,A.consec
	--	FROM 	#cur_Comprobante A
	--			INNER JOIN Con_ConMedios 	B ON RTRIM(A.codcue)  = RTRIM(B.codcue)
	--			INNER JOIN Con_PUC 		 	C ON RTRIM(B.codcue)  = RTRIM(C.codcue)
	--			INNER JOIN Glb_Terceros  	E ON RTRIM(A.nitter)  = RTRIM(E.nitter)
	--			INNER JOIN Glb_Transaccion 	T ON RTRIM(A.codtran) = RTRIM(T.codtran)
	--	WHERE 	RTRIM(B.codmedio)='1006' AND B.numcolum='09'
	--	UNION ALL
	--	SELECT 	 A.nitter
	--			,00000000000000000000 AS VlrIVA
	--			,ROUND(A.credito,0)	  AS VlrDevol
	--			,ROUND(((A.credito)*100)/C.poriva,0) AS Base
	--			,T.anultran
	--			,A.codcen
	--			,A.codcue
	--			,A.consec
	--	FROM 	#cur_Comprobante A
	--			INNER JOIN Con_ConMedios 	B ON RTRIM(A.codcue)  = RTRIM(B.codcue)
	--			INNER JOIN Con_PUC 		 	C ON RTRIM(B.codcue)  = RTRIM(C.codcue)
	--			INNER JOIN Glb_Terceros  	E ON RTRIM(A.nitter)  = RTRIM(E.nitter)
	--			INNER JOIN Glb_Transaccion 	T ON RTRIM(A.codtran) = RTRIM(T.codtran)
	--	WHERE 	RTRIM(B.codmedio)='1006' AND B.numcolum='10'
	--)

	--SELECT 	nitter, vlriva, vlrdevol, base
	--FROM 	tblDatos
	--WHERE  	RTRIM(codcen)+RTRIM(anultran)+RTRIM(consec)+RTRIM(codcue)+RTRIM(nitter)
	--		NOT IN (SELECT RTRIM(codcen)+RTRIM(codtran)+RTRIM(consec)+RTRIM(codcue)+RTRIM(nitter) FROM #cur_Comprobante)
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado en Abril 10 de 2015 por Éduar Álvarez.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_NOM_APORTES_Set','P') IS NOT NULL DROP PROCEDURE db_SP_NOM_APORTES_Set
GO

CREATE PROCEDURE db_SP_NOM_APORTES_Set
	@CodEmp		nVarChar(4)='',		@CodSec	nVarChar(3)='',		@Año		Numeric(4)=0,		@Mes		nVarChar(2)='',
	@Cesantias	Decimal (12,2)=0,	@IntCes Decimal (12,2)=0,	@Primas		Decimal (12,2)=0,	@Vacaciones Decimal (12,2)=0,
	@PensionP	Decimal (12,2)=0,	@SaludP Decimal (12,2)=0,	@Caja		Decimal (12,2)=0,	@Sena		Decimal (12,2)=0,
	@Icbf		Decimal (12,2)=0,	@Arpx	Decimal (12,2)=0,	@ValorDev	Decimal (14,2)=0,	@codeps		nVarchar(8)='',
	@codpen		nVarchar(8)='',		@codarp	nVarchar(8)='',		@Liqint		Bit=0,				@Liqpri		Bit=0,
	@Proceso	Char(11)=''
AS
BEGIN TRY
	Declare @mAddMsg nVarChar(50),
			@pVerMsg Int=0,
			@mProc   Char(25)

	Select @mAddMsg='', @mProc = 'db_SP_NOM_APORTES_Set'

	If Not Exists (Select * From Nom_Aportes Where CodEmp=@CodEmp AND ano=@Año AND mes=@Mes)
		begin
			Insert Into Nom_Aportes
				   ( codemp,  codsec,  ano,  mes,  valordev,  cesantias,  intces,  primas,  vacaciones,  pensionp,  saludp,  caja,  sena,  icbf,  arpx,  liqint,  liqpri)
			Values (@Codemp, @CodSec, @Año, @Mes, @Valordev, @Cesantias, @IntCes, @Primas, @Vacaciones, @PensionP, @SaludP, @Caja, @Sena, @Icbf, @Arpx, @Liqint, @Liqpri)
		end
	Else
		begin
			If RTRIM(@Proceso)='Aportes'
				Select	@Cesantias=cesantias, @IntCes=intces, @Primas=primas, @Vacaciones=vacaciones From Nom_Aportes Where CodEmp=@CodEmp AND ano=@Año AND mes=@Mes
			Else
				Select	@PensionP=pensionp, @SaludP=saludp, @Caja=caja, @Arpx=arpx From Nom_Aportes Where CodEmp=@CodEmp AND ano=@Año AND mes=@Mes

			Update Nom_Aportes
			   Set codsec=@CodSec, valordev=@ValorDev, cesantias=@Cesantias, intces=@Intces, primas=@Primas, vacaciones=@Vacaciones,
				   pensionp=@Pensionp, saludP=@SaludP, caja=@Caja, sena=@Sena, icbf=@Icbf,  arpx=@Arpx
			 Where codemp=@CodEmp AND ano=@Año AND mes=@Mes
		end
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg, @mAddMsg)
	Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
Go

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregado por Éduar Álvarez. Abril 30 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('db_SP_Ven_Facuota_Set','P') IS NOT NULL DROP PROCEDURE db_SP_Ven_Facuota_Set
GO

CREATE PROCEDURE db_SP_Ven_Facuota_Set
	@CodCto	nVarChar(3)='',	@Tipfac nVarChar(3)='', @NumFac	nVarChar(16)='', @NumCuo Decimal(3)=0, @FecCuo DateTime, @PorCuo Decimal(5,2)='', @ValCuo Decimal(14,2)=0
AS
BEGIN TRY
   DECLARE @mMsg    nVarChar(190),
           @mAddMsg nVarChar(50),
		   @pVerMsg int=0,
           @mProc   char(21)
   Select @mAddMsg='', @mProc='db_SP_Ven_Facuota_Set'

   If Exists (Select numfac From Ven_Facuota Where codcto=@CodCto AND tipfac=@Tipfac AND numfac=@NumFac AND numcuo=@NumCuo)
		Update Ven_Facuota SET feccuo=@FecCuo, valcuo=@ValCuo Where codcto=@CodCto AND tipfac=@Tipfac AND numfac=@NumFac AND numcuo=@NumCuo
   Else
		Insert Into Ven_Facuota (idemp, codcto,tipfac,numfac,numcuo,feccuo,porcuo,valcuo) Values ('001',@CodCto,@TipFac,@NumFac,@NumCuo,@FecCuo,@PorCuo,@ValCuo)
END TRY

Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg, @mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO


IF OBJECT_ID('db_SP_GLB_TERCEROS_CERTIFICADO','P') IS NOT NULL 
	DROP PROCEDURE db_SP_GLB_TERCEROS_CERTIFICADO
GO
CREATE PROCEDURE db_SP_GLB_TERCEROS_CERTIFICADO
	@idEmp VARCHAR(03)
	WITH RECOMPILE
AS
BEGIN
	DECLARE @idEmp_Local  VARCHAR(03)

	SET @idEmp_Local		= @idEmp
	;with tblnit AS(
	SELECT	COM.nitter	
	FROM	con_comprobante AS COM  WITH(NOLOCK) 
			INNER JOIN CON_PUC AS PUC WITH(NOLOCK)  ON COM.CODCUE=PUC.CODCUE 
	where	COM.idemp=@idEmp_Local AND PUC.RETCUE=1
			GROUP BY nitter
	)

	select	com.nitter
			,ter.Nomter	
			,ter.telter	
			,ter.fax		
			,ter.ciuter	
			,ter.dirter	
			,ter.divter	
			,ter.dptoter	
	FROM	tblnit com 
			inner join glb_terceros ter on com.nitter=ter.nitter 
END
GO




-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Vistas --
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IF OBJECT_ID('vArticulosInv','V') IS NOT NULL	DROP VIEW vArticulosInv
--GO
--CREATE VIEW vArticulosInv
--AS
--SELECT	dbo.alm_articulos.codart, dbo.alm_articulos.nomart, dbo.alm_articulos.codgru, dbo.alm_articulos.codlin, dbo.alm_articulos.undart, dbo.alm_articulos.ivaart,
--        dbo.alm_articulos.codter, dbo.alm_articulos.refart, dbo.alm_articulos.preart, dbo.alm_articulos.ubic, dbo.alm_articulos.codmar, dbo.alm_inventario.caninv,
--        dbo.alm_inventario.valprom, dbo.alm_inventario.pvcart, dbo.alm_inventario.pvdart, dbo.alm_inventario.pveart, dbo.alm_inventario.pvmart,
--        dbo.alm_inventario.pvaart, dbo.alm_inventario.pvbart, dbo.alm_grupos.nomgru, dbo.alm_inventario.idemp, dbo.alm_inventario.codcto,
--        dbo.alm_articulos.porutil AS margen, dbo.alm_articulos.codbar, dbo.alm_articulos.codtalla
--FROM    dbo.alm_articulos
--		INNER JOIN dbo.alm_inventario ON dbo.alm_articulos.codart = dbo.alm_inventario.codart
--		INNER JOIN dbo.alm_grupos     ON dbo.alm_articulos.codgru = dbo.alm_grupos.codgru
--GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IF OBJECT_ID('vActInventario','V') IS NOT NULL	DROP VIEW vActInventario
--GO
--CREATE VIEW vActInventario
--AS
--	SELECT	k.idemp, k.codcto, k.codart, SUM((CASE t .tipcon WHEN 'E' THEN k.qtyart WHEN 'S' THEN k.qtyart * - 1 END)) AS cantidad
--	FROM    dbo.alm_kardex AS k INNER JOIN dbo.glb_transaccion AS t ON k.codcon = t.codtran
--	GROUP BY k.idemp, k.codcto, k.codart
--GO

IF OBJECT_ID('db_SP_AyudaArt_Get','P') IS NOT NULL DROP PROCEDURE db_SP_AyudaArt_Get
GO
CREATE PROCEDURE db_SP_AyudaArt_Get
	@strIdEmp		varchar(03),		@strCodCto		varchar(03)='',		@strCampo1 varchar(10)='CodArt',	@strCampo2 varchar(10)='RefArt',	@IntPrecio int=1,
	@strCondMayo0	nVarchar(20)='',	@strCondArtxCen nVarchar(20)='',	@bitInsumo bit=0
WITH RECOMPILE
AS
BEGIN
	DECLARE @strIdEmp_Local   VarChar(03),
			@strCodCto_Local  VarChar(03),
			@strCondicion	 nVarChar(50),
			@strCadenaSql	 nVarchar(Max)

	SET @strIdEmp_Local	 = @strIdEmp
	SET @strCodCto_Local = CASE WHEN @strCodCto='' THEN '001' ELSE @strCodCto END
	SET @strCondicion	 = CASE WHEN @bitInsumo=0 and @strCondMayo0=''  THEN '(Gru.TipGru = 1 OR Gru.TipGru=2 or Gru.TipGru=5)' 
								when @bitInsumo=0 and @strCondMayo0!='' THEN '(Gru.TipGru = 1 OR Gru.TipGru=2 )' 	  --OR Gru.TipGru=5
												   ELSE 'Gru.TipGru<>2 AND Gru.TipGru<>5' END

	SET @strCadenaSql = 'SELECT	 Art.' +@strCampo1+ ' AS RefArt
								,Art.' +@strCampo2+ ' AS RefArt2
								,Art.NomArt
								,Mar.NomMar
								,IIF(Inv.CanInv IS NULL,0,Inv.CanInv) AS CanInv
								,IIF(@IntPrecio = 1, IIF(Inv.PvcArt IS NULL,0,Inv.PvcArt), IIF(Inv.PvdArt IS NULL,0,Inv.PvdArt)) AS PvcArt
								,Art.IvaArt
								,000000.00 AS IvaArt2
								,Art.IvaCmp
								,Art.CodGru
								,Art.CodBar
								,Art.UndArt
								,Art.UndArt AS UndCon
								,Art.CodArt
								,Art.CodMar
								,Art.CodTer
								,IIF(Inv.ValProm IS NULL,0,ROUND(Inv.ValProm,0)) AS ValProm
								,IIF(@IntPrecio = 1,IIF(Inv.PvmArt IS NULL,0,Inv.PvmArt),IIF(Inv.PvdArt IS NULL,0,Inv.PvdArt)) AS ValMin
								,IIF(@IntPrecio = 1,IIF(Inv.PvcArt IS NULL,0,Inv.PvcArt),IIF(Inv.PvdArt IS NULL,0,Inv.PvdArt)) AS ValMax
								,Gru.CtaCosto
								,Gru.CtaVta
								,Gru.CtaCmp
								,Gru.CtaCmp AS CodCue
								,Gru.NomGru
								,Gru.TipGru
								,SPACE(60) AS NomPro
								,Art.PorUtil
								,Art.Ubic
								,Art.CodLin
								,isnull(Lin.NomLin,'''') as nomlin
								,Inv.UcoArt
								,Inv.ucoart AS UCompra
								,Art.CostoFijo
								,Inv.NoApliDcto
								,Art.DctoArt
								,Gru.CodctoGru
								,Art.RifaArt
								,Art.Detart as descrip
								,gru.ctacmpvta
								,art.porcom
								,cast(''0'' as decimal(14,2)) as valadmon
								,cast(''0'' as decimal(14,2)) as valcomi
								,Inv.pvdart
								,Inv.pvaart  
								,Inv.pvbart 
								,Inv.pveart 
								,Art.porimpo
								,Art.Cambiapre 
								,Art.Genero
								,FraInv
								,PreArt
						FROM 	Alm_Articulos Art
								LEFT JOIN  Alm_Inventario Inv ON Art.CodArt = Inv.CodArt
								INNER JOIN Alm_Grupos 	  Gru ON Art.CodGru = Gru.CodGru
								LEFT JOIN  Alm_Marcas	  Mar ON Art.CodMar = Mar.CodMar
								LEFT JOIN  Alm_Lineas	  Lin ON Art.CodLin = Lin.CodLin
						WHERE 	Art.inactivo = 0
								AND Inv.IdEmp  = '+@strIdEmp_local +
							  ' AND Inv.CodCto = '+@strCodCto_Local +
							  ' AND ' + @strCondicion + @strCondMayo0 + @strCondArtxCen


	if @bitInsumo = 0 AND @strCondMayo0!='' --Hago la union de con los grupos intagibles por que estos no deben validar existencias.
	begin 
		SET @strCadenaSql = @strCadenaSql +
							'UNION ALL 
							SELECT	 Art.' +@strCampo1+ ' AS RefArt
									,Art.' +@strCampo2+ ' AS RefArt2
									,Art.NomArt
									,Mar.NomMar
									,IIF(Inv.CanInv IS NULL,0,Inv.CanInv) AS CanInv
									,IIF(@IntPrecio = 1, IIF(Inv.PvcArt IS NULL,0,Inv.PvcArt), IIF(Inv.PvdArt IS NULL,0,Inv.PvdArt)) AS PvcArt
									,Art.IvaArt
									,000000.00 AS IvaArt2
									,Art.IvaCmp
									,Art.CodGru
									,Art.CodBar
									,Art.UndArt
									,Art.UndArt AS UndCon
									,Art.CodArt
									,Art.CodMar
									,Art.CodTer
									,IIF(Inv.ValProm IS NULL,0,ROUND(Inv.ValProm,0)) AS ValProm
									,IIF(@IntPrecio = 1,IIF(Inv.PvmArt IS NULL,0,Inv.PvmArt),IIF(Inv.PvdArt IS NULL,0,Inv.PvdArt)) AS ValMin
									,IIF(@IntPrecio = 1,IIF(Inv.PvcArt IS NULL,0,Inv.PvcArt),IIF(Inv.PvdArt IS NULL,0,Inv.PvdArt)) AS ValMax
									,Gru.CtaCosto
									,Gru.CtaVta
									,Gru.CtaCmp
									,Gru.CtaCmp AS CodCue
									,Gru.NomGru
									,Gru.TipGru
									,SPACE(60) AS NomPro
									,Art.PorUtil
									,Art.Ubic
									,Art.CodLin
									,isnull(Lin.NomLin,'''') as nomlin
									,Inv.UcoArt
									,Inv.ucoart AS UCompra
									,Art.CostoFijo
									,Inv.NoApliDcto
									,Art.DctoArt
									,Gru.CodctoGru
									,Art.RifaArt
									,Art.Detart as descrip
									,gru.ctacmpvta
									,art.porcom
									,cast(''0'' as decimal(14,2)) as valadmon
									,cast(''0'' as decimal(14,2)) as valcomi
									,Inv.pvdart
									,Inv.pvaart  
									,Inv.pvbart  
									,Inv.pveart  
									,Art.porimpo
									,Art.Cambiapre
									,Art.Genero
									,FraInv
									,PreArt
							FROM 	Alm_Articulos Art	
									LEFT JOIN  Alm_Inventario 	Inv ON Art.CodArt = Inv.CodArt
									INNER JOIN Alm_Grupos 		Gru ON Art.CodGru = Gru.CodGru
									LEFT JOIN  Alm_Marcas		Mar ON Art.CodMar = Mar.CodMar
									LEFT JOIN  Alm_Lineas		Lin ON Art.CodLin = Lin.CodLin
							WHERE 	Art.inactivo = 0 
									AND Inv.IdEmp  = '+@strIdEmp_local +
								  ' AND Inv.CodCto = '+@strCodCto_Local +
								  ' AND Gru.TipGru=5' + @strCondArtxCen
	end  
	
	Print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@IntPrecio int,		@strIdEmp_local varchar(03),	 @strCodCto_Local varchar(03)',
									     @IntPrecio=@IntPrecio, @strIdEmp_local=@strIdEmp_Local, @strCodCto_Local=@strCodCto_Local
END
GO

IF OBJECT_ID('db_SP_SaldoAñoCtoCta_Get','P') IS NOT NULL DROP PROCEDURE db_SP_SaldoAñoCtoCta_Get
GO
CREATE PROCEDURE db_SP_SaldoAñoCtoCta_Get
	@cIdEmp		nVarchar(3)='001',
	@cAño		Char(4),
	@cCodCto	nVarchar(3),
	@nMes		Numeric(2)

WITH RECOMPILE
AS
BEGIN

DECLARE @cCodCue	nVarchar(8)='',
		@nMeses		Numeric(2)=0,
		@nNroMes	Numeric(2)=1,
		@cDeb		nVarChar(6)='',
		@cCre		nVarChar(6)='',
		@cCadena	nVarchar(Max)=''

IF OBJECT_ID('tempdb..#tmp_Ctas') IS NOT NULL DROP TABLE #tmp_Ctas

Create Table #tmp_Ctas (CodCue nVarChar(8), SaldoAnt Decimal(20,2))

Declare cur_Ctas Cursor For Select codcue From Con_CtaCenCostos Where año=@cAño AND codcto=@cCodCto Order By idemp,año,codcto,codcue
Open cur_Ctas
Fetch cur_Ctas Into @cCodcue
While @@FETCH_STATUS = 0
begin
	Set @cCadena = 'Insert Into #tmp_Ctas Values ('+@cCodCue+', (Select sancue From Con_CtaCenCostos Where año='+@cAño+' AND codcto='+@cCodCto+' AND codcue='+@cCodCue+'))'
	EXEC (@cCadena)

	Set @nMeses = Case When @nMes=1 Then 0 Else @nMes-1 End
	WHILE @nNroMes <= @nMeses
		begin
			SET @cDeb = 'D'+RIGHT('00'+RTRIM(CAST(@nNroMes AS Char)),2) + 'Cue'
			SET	@cCre = 'C'+RIGHT('00'+RTRIM(CAST(@nNroMes AS Char)),2) + 'Cue'

			SET @cCadena =  'Insert Into #tmp_Ctas VALUES ('+@cCodCue+', (Select IIF(NatCue=''D'', '+@cDeb+'-'+@cCre+', '+@cDeb+'+'+@cCre+') '+
							'From Con_CtaCenCostos Where año='+@cAño+' AND codcto='+@cCodCto+' AND codcue='+RTRIM(@cCodCue)+'))'
			EXEC (@cCadena)

			SET @nNroMes = @nNroMes + 1
		end
	Fetch cur_Ctas Into @cCodcue
end
Close cur_Ctas
Deallocate cur_Ctas

Select codcue, SUM(SaldoAnt) SaldoAnt From #tmp_Ctas Group By CodCue

IF OBJECT_ID('tempdb..#tmp_Ctas') IS NOT NULL DROP TABLE #tmp_Ctas

END
GO


IF OBJECT_ID('db_Sp_Movimientos_PasoInformacion','P') IS NOT NULL    --Lissette Sept 14 2015
	DROP PROCEDURE db_Sp_Movimientos_PasoInformacion
GO
CREATE PROCEDURE db_Sp_Movimientos_PasoInformacion
	@strIdemp		nvarchar (3) ='',	@strCodCto	nvarchar(3)='',	@strBdDestino nvarchar(100)='',		@strBdOrigen	nvarchar(100)='',
	@datFecini		date,				@datFecFin date,			@numTipo numeric(1)=0		
AS
BEGIN TRY
	--@numtipo =1 toda las transacciones =0 todas menos las de vtas
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
									inner join  '+@strBdOrigen+'.dbo.Com_Facdetalle  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.tipfac=det.tipfac  
																							and	 fac.numfac=det.numfac 
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
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Mov.tipdoc=Tra.CodTran 
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
	
	--10 Con comprobante 
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Con_Comprobante( idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, 
								detalle, debito, credito, fecsys, codusu, estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar, nitter2, 
								saldoa, ivamayvlr, itemdoc, timedife, prefijo, revelaciones)
						select	Com.idemp, Com.codalm, Com.codcen, Com.codcto, Com.codtran, iif(com.consec2='''',Com.consec,com.consec2), Com.codctodet, Com.fecdoc, Com.codcue, Com.nitter, 
								Com.detalle, Com.debito, Com.credito, Com.fecsys, Com.codusu, Com.estcomp, Com.numche, Com.codact, Com.base, Com.turno, 
								Com.estconcili, Com.codimp, Com.ctacomitar, Com.nitter2, Com.saldoa, Com.ivamayvlr, Com.itemdoc, Com.timedife, Com.prefijo, 
								Com.revelaciones
						FROM	'+@strBdOrigen+'.dbo.Con_Comprobante  Com
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Com.CodTran=Tra.CodTran and (Tra.codmod!=''VT'' or (Tra.codmod=''VT'' and tra.tipven=1))
						Where	Com.IdEmp=@strIdemp and Com.FecDoc between @datFecini and @datFecFin and Tra.Doble=1 
								and  (Com.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
	--print  @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
						@strIdemp nvarchar(3) ',
						@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
						@strIdemp=@strIdemp

	
	if @numTipo = 1  -- pasa las ventas tambien  sin modificar pantalla enviarinf
	begin 
		--11 ven pedidos 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_Pedidos(idemp, codcto, tipfac, numfac, fecfac, venfac, codcue, nitcli, nitven, vtafac, ivafac, otrfac, 
									antfac, devfac, abofac, dctfac, retfac, ricfac, rivfac, netfac, cosfac, numcon, estfac, fecsys, codusu, observa, ajuste, cosaju, 
									contacto, docrel, tiprel, codmar, horom, kilom, placa, feccierre, tipo, codcon, comision, contrato, equipo, simcard, totcomision, 
									anticipo, Impofac)
							select	Fac.idemp, Fac.codcto, Fac.tipfac, Fac.numfac, Fac.fecfac, Fac.venfac, Fac.codcue, Fac.nitcli, Fac.nitven, Fac.vtafac, Fac.ivafac, Fac.otrfac, 
									Fac.antfac, Fac.devfac, Fac.abofac, Fac.dctfac, Fac.retfac, Fac.ricfac, Fac.rivfac, Fac.netfac, Fac.cosfac, Fac.numcon, Fac.estfac, Fac.fecsys,
									Fac.codusu, Fac.observa, Fac.ajuste, Fac.cosaju, Fac.contacto, Fac.docrel, Fac.tiprel, Fac.codmar, Fac.horom, Fac.kilom, Fac.placa, 
									Fac.feccierre, Fac.tipo, Fac.codcon, Fac.comision, Fac.contrato, Fac.equipo, Fac.simcard, Fac.totcomision, Fac.anticipo, Fac.Impofac
							FROM	'+@strBdOrigen+'.dbo.Ven_Pedidos  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp
		--12 ven pDetalle  
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_PDetalle( idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, 
									numcon, valdes, valdev, valtot, valaju, descrip, nitven, valiva, qtyfac, piezas, comision, item, totcomision, anticipo, equipo, promo, 
									simcard, titulo, itemfac, porimpo, valimpo, rutafoto)
							select	Det.idemp, Det.codcto, Det.tipfac, Det.numfac, Det.codart, Det.undart, Det.qtyart, Det.devart, Det.cosins, Det.valart, Det.ivaart, Det.desart, 
									Det.numcon, Det.valdes, Det.valdev, Det.valtot, Det.valaju, Det.descrip, Det.nitven, Det.valiva, Det.qtyfac, Det.piezas, Det.comision, Det.item, 
									Det.totcomision, Det.anticipo, Det.equipo, Det.promo, Det.simcard, Det.titulo, Det.itemfac, Det.porimpo, Det.valimpo, Det.rutafoto
							FROM	'+@strBdOrigen+'.dbo.Ven_Pedidos  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_PDetalle  Det on Fac.Idemp=Det.IdEmp and Fac.Codcto=det.Codcto and Fac.tipfac=det.tipfac and fac.numfac=det.numfac
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--13 ven fACTURAS  
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_Facturas( idemp, codcto, tipfac, numfac, orden, fecfac, venfac, codcue, nitcli, nitven, vtafac, ivafac, 
									otrfac, cuofac, ajpfac, antfac, devfac, abofac, dctfac, retfac, ricfac, rivfac, netfac, cosfac, numcon, estfac, entrega, cambio, codusu, 
									observa, ajuste, inifac, cosaju, pendiente, fecsys, estado, estret, plaza, tipoventa, valini, saldocli, docrel, codturno, placa, valadmon, 
									valimprev, valutil, tipo, trm, cuoini, lnentrega, lnvueltas, vuelo, porflete, porvol, valdolar, propina, despacho, cendespach, admon, intmora, 
									cuotaext, transporte, arancel, impfac, comie, contrato, valflete, confirmada, anticipo, comision, totbono, devretfac, devricfac, devrivfac, 
									bpromo, bviatico, qtyper, domicilio, adultos, ninos, codguia, impofac, crefac, devcrefac, cendespacho)
							select	Fac.idemp, Fac.codcto, Fac.tipfac, Fac.numfac, Fac.orden, Fac.fecfac, Fac.venfac, Fac.codcue, Fac.nitcli, Fac.nitven, Fac.vtafac, Fac.ivafac, 
									Fac.otrfac, Fac.cuofac, Fac.ajpfac, Fac.antfac, Fac.devfac, Fac.abofac, Fac.dctfac, Fac.retfac, Fac.ricfac, Fac.rivfac, Fac.netfac, Fac.cosfac, 
									Fac.numcon, Fac.estfac, Fac.entrega, Fac.cambio, Fac.codusu, Fac.observa, Fac.ajuste, Fac.inifac, Fac.cosaju, Fac.pendiente, Fac.fecsys, 
									Fac.estado, Fac.estret, Fac.plaza, Fac.tipoventa, Fac.valini, Fac.saldocli, Fac.docrel, Fac.codturno, Fac.placa, Fac.valadmon, Fac.valimprev, 
									Fac.valutil, Fac.tipo, Fac.trm, Fac.cuoini, Fac.lnentrega, Fac.lnvueltas, Fac.vuelo, Fac.porflete, Fac.porvol, Fac.valdolar, Fac.propina, 
									Fac.despacho, Fac.cendespach, Fac.admon, Fac.intmora, Fac.cuotaext, Fac.transporte, Fac.arancel, Fac.impfac, Fac.comie, Fac.contrato, 
									Fac.valflete, Fac.confirmada, Fac.anticipo, Fac.comision, Fac.totbono, Fac.devretfac, Fac.devricfac, Fac.devrivfac, Fac.bpromo, Fac.bviatico, 
									Fac.qtyper, Fac.domicilio, Fac.adultos, Fac.ninos, Fac.codguia, Fac.impofac, Fac.crefac, Fac.devcrefac, Fac.cendespacho
							FROM	'+@strBdOrigen+'.dbo.Ven_Facturas  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp
		
		--14 ven fACDetalle  
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_FacDetalle( idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, numcon, 
										valdes, valdev, valtot, valaju, descrip, docrel, titulo, valiva, piezas, valdolar, qtyvol, qtylibra, vrlibra, vrvol, wr, qtyfac, porcom, 
										comie, bono, anticipo, comision, equipo, item, obsequio, promo, qtyobsequi, serial, simcard, bpromo, bviatico, aplcomi, valimpo, porimpo)
							select	Det.idemp, Det.codcto, Det.tipfac, Det.numfac, Det.codart, Det.undart, Det.qtyart, Det.devart, Det.cosins, Det.valart, Det.ivaart, Det.desart, 
									Det.numcon, Det.valdes, Det.valdev, Det.valtot, Det.valaju, Det.descrip, Det.docrel, Det.titulo, Det.valiva, Det.piezas, Det.valdolar, Det.qtyvol, 
									Det.qtylibra, Det.vrlibra, Det.vrvol, Det.wr, Det.qtyfac, Det.porcom, Det.comie, Det.bono, Det.anticipo, Det.comision, Det.equipo, Det.item, 
									Det.obsequio, Det.promo, Det.qtyobsequi, Det.serial, Det.simcard, Det.bpromo, Det.bviatico, Det.aplcomi, Det.valimpo, Det.porimpo
							FROM	'+@strBdOrigen+'.dbo.Ven_facturas  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_facDetalle  Det on Fac.Idemp=Det.IdEmp and Fac.Codcto=det.Codcto and Fac.tipfac=det.tipfac and fac.numfac=det.numfac
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--15 ven fAcuota  
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_Facuota(idemp, codcto, tipfac, numfac, numcuo, feccuo, porcuo, valcuo, estcuo, capital, interes, valorig, vcto, tippag)
							select	Det.idemp, Det.codcto, Det.tipfac, Det.numfac, Det.numcuo, Det.feccuo, Det.porcuo, Det.valcuo, Det.estcuo, Det.capital, Det.interes, Det.valorig, 
									Det.vcto, Det.tippag
							FROM	'+@strBdOrigen+'.dbo.Ven_facturas  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_facuota  Det on Fac.Idemp=Det.IdEmp and Fac.Codcto=det.Codcto and Fac.tipfac=det.tipfac and fac.numfac=det.numfac
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
	--	print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp


		--16 ven pagos
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_pagos(idemp, codcto, tippag, numdoc, clapag, fecpag, nitcli, pagval, netpag, estpag, fecsys, codusu, 
									detalle, cobrador, cambio, recibo, porcom)
							select	Fac.idemp, Fac.codcto, Fac.tippag, Fac.numdoc, Fac.clapag, Fac.fecpag, Fac.nitcli, Fac.pagval, Fac.netpag, Fac.estpag, Fac.fecsys, 
									Fac.codusu, Fac.detalle, Fac.cobrador, Fac.cambio, Fac.recibo, Fac.porcom
							FROM	'+@strBdOrigen+'.dbo.Ven_Pagos  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tippag=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecpag between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		-- 17 pag detalle
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_pagdetalle( idemp, codcto, tippag, numdoc, forpag, valpag, codban, afedoc, feccheq, estcheq, vrrtecom, 
									vrrtefte, vrrteica, vrrteiva, codusu, turno, valpropina, numrec, consig)
							select	Det.idemp, Det.codcto, Det.tippag, Det.numdoc, Det.forpag, Det.valpag, Det.codban, Det.afedoc, Det.feccheq, Det.estcheq, Det.vrrtecom, 
									Det.vrrtefte, Det.vrrteica, Det.vrrteiva, Det.codusu, Det.turno, Det.valpropina, Det.numrec, Det.consig
							FROM	'+@strBdOrigen+'.dbo.Ven_Pagos  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_Pagdetalle  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.tippag=det.tippag and fac.numdoc=det.numdoc
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tippag=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecpag between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp
 
		-- 18 facuopago 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_facuopagos( idemp, codcto, tipfac, numfac, tippag, cenpag, numpag, numcuo, valpag, estpag)
							select	Det.idemp, Det.codcto, Det.tipfac, Det.numfac, Det.tippag, Det.cenpag, Det.numpag, Det.numcuo, Det.valpag, Det.estpag
							FROM	'+@strBdOrigen+'.dbo.Ven_Pagos  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_facuopagos  Det on fac.idemp=det.idemp and fac.codcto=det.cenpag and fac.tippag=det.tippag and fac.numdoc=det.numpag
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tippag=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecpag between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--19 ven movcli 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_movcli(idemp, codcto, nitcli, docven, tipdoc, fecven, afecen, afetip, afedoc, debven, creven, 
									fecsys, codusu, estmov)
							select	Fac.idemp, Fac.codcto, Fac.nitcli, Fac.docven, Fac.tipdoc, Fac.fecven, Fac.afecen, Fac.afetip, Fac.afedoc, Fac.debven, Fac.creven, 
									Fac.fecsys, Fac.codusu, Fac.estmov
							FROM	'+@strBdOrigen+'.dbo.Ven_Movcli  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipdoc=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecven between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--20 ven notas
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_notas(idemp, codcto, tipnot, numnot, afecen, afetip, afedoc, fecnot, valnot, valiva, concepto, 
									devcli, observa, codturno, estfac, despacho, cendespacho, impnota)
							select	Fac.idemp, Fac.codcto, Fac.tipnot, Fac.numnot, Fac.afecen, Fac.afetip, Fac.afedoc, Fac.fecnot, Fac.valnot, Fac.valiva, 
									Fac.concepto, Fac.devcli, Fac.observa, Fac.codturno, Fac.estfac, Fac.despacho, Fac.cendespacho, Fac.impnota
							FROM	'+@strBdOrigen+'.dbo.Ven_Notas  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipnot=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecnot between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--21 alm kardex 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Alm_Kardex( idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, 
									netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, codusu, qtypro, qtyfac, undart, estord, despacho, 
									cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, estexist, regiserv, 
									DocRel)
							select	Kar.idemp, Kar.codcto, Kar.numcon, Kar.fecmov, Kar.codcon, Kar.codart, Kar.qtyart, Kar.cosart, Kar.valart, Kar.ivaart, Kar.totart,
									Kar.netart, Kar.traalm, Kar.centra, Kar.contra, Kar.consec, Kar.nitter, Kar.observa, Kar.estkar, Kar.fecsys, Kar.codusu, Kar.qtypro, 
									Kar.qtyfac, Kar.undart, Kar.estord, Kar.despacho, Kar.cendespach, Kar.estserial, Kar.codartrel, Kar.docfac, Kar.fecvence, 
									Kar.itemprefac, Kar.codprod, Kar.valimpo, Kar.itemfac, Kar.porimpo, Kar.devpro, Kar.estexist, Kar.regiserv, Kar.DocRel
							FROM	'+@strBdOrigen+'.dbo.Alm_KArdex Kar
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Kar.CodCon=Tra.CodTran and Tra.codmod=''VT''
							Where	Kar.IdEmp=@strIdemp and Kar.FecMov between @datFecini and @datFecFin and Tra.Doble=1 and  (Kar.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--21 Con comprobante 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Con_Comprobante( idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, 
								detalle, debito, credito, fecsys, codusu, estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar, nitter2, 
								saldoa, ivamayvlr, itemdoc, timedife, prefijo, revelaciones)
						select	Com.idemp, Com.codalm, Com.codcen, Com.codcto, Com.codtran, iif(com.consec2='''',Com.consec,com.consec2), Com.codctodet, Com.fecdoc, 
								Com.codcue, Com.nitter, 
								Com.detalle, Com.debito, Com.credito, Com.fecsys, Com.codusu, Com.estcomp, Com.numche, Com.codact, Com.base, Com.turno, 
								Com.estconcili, Com.codimp, Com.ctacomitar, Com.nitter2, Com.saldoa, Com.ivamayvlr, Com.itemdoc, Com.timedife, Com.prefijo, 
								Com.revelaciones
						FROM	'+@strBdOrigen+'.dbo.Con_Comprobante  Com
								inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Com.CodTran=Tra.CodTran and (Tra.codmod=''VT'' and tra.tipven!=1)
						Where	Com.IdEmp=@strIdemp and Com.FecDoc between @datFecini and @datFecFin and Tra.Doble=1 
								and  (Com.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp
	end 

	if @numTipo = 2  -- pasa las ventas Credito solamente para el caso de las pantallas Diferente a enviar tran 
	begin 
		--13 ven fACTURAS  
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_Facturas( idemp, codcto, tipfac, numfac, orden, fecfac, venfac, codcue, nitcli, nitven, vtafac, ivafac, 
									otrfac, cuofac, ajpfac, antfac, devfac, abofac, dctfac, retfac, ricfac, rivfac, netfac, cosfac, numcon, estfac, entrega, cambio, codusu, 
									observa, ajuste, inifac, cosaju, pendiente, fecsys, estado, estret, plaza, tipoventa, valini, saldocli, docrel, codturno, placa, valadmon, 
									valimprev, valutil, tipo, trm, cuoini, lnentrega, lnvueltas, vuelo, porflete, porvol, valdolar, propina, despacho, cendespach, admon, intmora, 
									cuotaext, transporte, arancel, impfac, comie, contrato, valflete, confirmada, anticipo, comision, totbono, devretfac, devricfac, devrivfac, 
									bpromo, bviatico, qtyper, domicilio, adultos, ninos, codguia, impofac, crefac, devcrefac, cendespacho)
							select	Fac.idemp, Fac.codcto, Fac.tipfac, IIF(fac.Despacho='''',Fac.numfac,Fac.Despacho), Fac.orden, Fac.fecfac, Fac.venfac, Fac.codcue, Fac.nitcli, Fac.nitven, Fac.vtafac, Fac.ivafac, 
									Fac.otrfac, Fac.cuofac, Fac.ajpfac, Fac.antfac, Fac.devfac, Fac.abofac, Fac.dctfac, Fac.retfac, Fac.ricfac, Fac.rivfac, Fac.netfac, Fac.cosfac, 
									Fac.numcon, Fac.estfac, Fac.entrega, Fac.cambio, Fac.codusu, Fac.observa, Fac.ajuste, Fac.inifac, Fac.cosaju, Fac.pendiente, Fac.fecsys, 
									Fac.estado, Fac.estret, Fac.plaza, Fac.tipoventa, Fac.valini, Fac.saldocli, Fac.docrel, Fac.codturno, Fac.placa, Fac.valadmon, Fac.valimprev, 
									Fac.valutil, Fac.tipo, Fac.trm, Fac.cuoini, Fac.lnentrega, Fac.lnvueltas, Fac.vuelo, Fac.porflete, Fac.porvol, Fac.valdolar, Fac.propina, 
									Fac.despacho, Fac.cendespach, Fac.admon, Fac.intmora, Fac.cuotaext, Fac.transporte, Fac.arancel, Fac.impfac, Fac.comie, Fac.contrato, 
									Fac.valflete, Fac.confirmada, Fac.anticipo, Fac.comision, Fac.totbono, Fac.devretfac, Fac.devricfac, Fac.devrivfac, Fac.bpromo, Fac.bviatico, 
									Fac.qtyper, Fac.domicilio, Fac.adultos, Fac.ninos, Fac.codguia, Fac.impofac, Fac.crefac, Fac.devcrefac, Fac.cendespacho
							FROM	'+@strBdOrigen+'.dbo.Ven_Facturas  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran and Tra.Doble=1 and NoEnvio=0 and tra.tipven=1
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp
		
		--14 ven fACDetalle  
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_FacDetalle( idemp, codcto, tipfac, numfac, codart, undart, qtyart, devart, cosins, valart, ivaart, desart, numcon, 
										valdes, valdev, valtot, valaju, descrip, docrel, titulo, valiva, piezas, valdolar, qtyvol, qtylibra, vrlibra, vrvol, wr, qtyfac, porcom, 
										comie, bono, anticipo, comision, equipo, item, obsequio, promo, qtyobsequi, serial, simcard, bpromo, bviatico, aplcomi, valimpo, porimpo)
							select	Det.idemp, Det.codcto, Det.tipfac, IIF(fac.Despacho='''',Fac.numfac,Fac.Despacho), Det.codart, Det.undart, Det.qtyart, Det.devart, Det.cosins, Det.valart, Det.ivaart, Det.desart, 
									Det.numcon, Det.valdes, Det.valdev, Det.valtot, Det.valaju, Det.descrip, Det.docrel, Det.titulo, Det.valiva, Det.piezas, Det.valdolar, Det.qtyvol, 
									Det.qtylibra, Det.vrlibra, Det.vrvol, Det.wr, Det.qtyfac, Det.porcom, Det.comie, Det.bono, Det.anticipo, Det.comision, Det.equipo, Det.item, 
									Det.obsequio, Det.promo, Det.qtyobsequi, Det.serial, Det.simcard, Det.bpromo, Det.bviatico, Det.aplcomi, Det.valimpo, Det.porimpo
							FROM	'+@strBdOrigen+'.dbo.Ven_facturas  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_facDetalle  Det on Fac.Idemp=Det.IdEmp and Fac.Codcto=det.Codcto and Fac.tipfac=det.tipfac and fac.numfac=det.numfac
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran and Tra.Doble=1 and NoEnvio=0 and tra.tipven=1
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--15 ven fAcuota  
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_Facuota(idemp, codcto, tipfac, numfac, numcuo, feccuo, porcuo, valcuo, estcuo, capital, interes, valorig, vcto, tippag)
							select	Det.idemp, Det.codcto, Det.tipfac, IIF(fac.Despacho='''',Fac.numfac,Fac.Despacho), Det.numcuo, Det.feccuo, Det.porcuo, Det.valcuo, Det.estcuo, Det.capital, Det.interes, Det.valorig, 
									Det.vcto, Det.tippag
							FROM	'+@strBdOrigen+'.dbo.Ven_facturas  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_facuota  Det on Fac.Idemp=Det.IdEmp and Fac.Codcto=det.Codcto and Fac.tipfac=det.tipfac and fac.numfac=det.numfac
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipfac=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.FecFac between @datFecini and @datFecFin and Tra.Doble=1 and Tra.NoEnvio=0
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
	--	print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp


		--16 ven pagos
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_pagos(idemp, codcto, tippag, numdoc, clapag, fecpag, nitcli, pagval, netpag, estpag, fecsys, codusu, 
									detalle, cobrador, cambio, recibo, porcom)
							select	Fac.idemp, Fac.codcto, Fac.tippag, Fac.numdoc, Fac.clapag, Fac.fecpag, Fac.nitcli, Fac.pagval, Fac.netpag, Fac.estpag, Fac.fecsys, 
									Fac.codusu, Fac.detalle, Fac.cobrador, Fac.cambio, Fac.recibo, Fac.porcom
							FROM	'+@strBdOrigen+'.dbo.Ven_Pagos  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tippag=Tra.CodTran and Tra.Doble=1  and tra.Codmod!=''VT''
							Where	fac.IdEmp=@strIdemp and fac.Fecpag between @datFecini and @datFecFin
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		-- 17 pag detalle
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_pagdetalle( idemp, codcto, tippag, numdoc, forpag, valpag, codban, afedoc, feccheq, estcheq, vrrtecom, 
									vrrtefte, vrrteica, vrrteiva, codusu, turno, valpropina, numrec, consig)
							select	Det.idemp, Det.codcto, Det.tippag, Det.numdoc, Det.forpag, Det.valpag, Det.codban, Det.afedoc, Det.feccheq, Det.estcheq, Det.vrrtecom, 
									Det.vrrtefte, Det.vrrteica, Det.vrrteiva, Det.codusu, Det.turno, Det.valpropina, Det.numrec, Det.consig
							FROM	'+@strBdOrigen+'.dbo.Ven_Pagos  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_Pagdetalle  Det on fac.idemp=det.idemp and fac.codcto=det.codcto and fac.tippag=det.tippag and fac.numdoc=det.numdoc
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tippag=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecpag between @datFecini and @datFecFin and Tra.Doble=1 and tra.Codmod!=''VT''
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp
 
		-- 18 facuopago 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_facuopagos( idemp, codcto, tipfac, numfac, tippag, cenpag, numpag, numcuo, valpag, estpag)
							select	Det.idemp, Det.codcto, Det.tipfac, Det.numfac, Det.tippag, Det.cenpag, Det.numpag, Det.numcuo, Det.valpag, Det.estpag
							FROM	'+@strBdOrigen+'.dbo.Ven_Pagos  Fac
									inner join '+@strBdOrigen+'.dbo.Ven_facuopagos  Det on fac.idemp=det.idemp and fac.codcto=det.cenpag and fac.tippag=det.tippag and fac.numdoc=det.numpag
									inner join '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tippag=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecpag between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--19 ven movcli 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_movcli(idemp, codcto, nitcli, docven, tipdoc, fecven, afecen, afetip, afedoc, debven, creven, 
									fecsys, codusu, estmov)
							select	Fac.idemp, Fac.codcto, Fac.nitcli, Fac.docven, Fac.tipdoc, Fac.fecven, Fac.afecen, Fac.afetip, Fac.afedoc, Fac.debven, Fac.creven, 
									Fac.fecsys, Fac.codusu, Fac.estmov
							FROM	'+@strBdOrigen+'.dbo.Ven_Movcli  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipdoc=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecven between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--20 ven notas
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_notas(idemp, codcto, tipnot, numnot, afecen, afetip, afedoc, fecnot, valnot, valiva, concepto, 
									devcli, observa, codturno, estfac, despacho, cendespacho, impnota)
							select	Fac.idemp, Fac.codcto, Fac.tipnot, Fac.numnot, Fac.afecen, Fac.afetip, Fac.afedoc, Fac.fecnot, Fac.valnot, Fac.valiva, 
									Fac.concepto, Fac.devcli, Fac.observa, Fac.codturno, Fac.estfac, Fac.despacho, Fac.cendespacho, Fac.impnota
							FROM	'+@strBdOrigen+'.dbo.Ven_Notas  Fac
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Fac.Tipnot=Tra.CodTran 
							Where	fac.IdEmp=@strIdemp and fac.Fecnot between @datFecini and @datFecFin and Tra.Doble=1 
									and  (Fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp

		--21 alm kardex 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Alm_Kardex( idemp, codcto, numcon, fecmov, codcon, codart, qtyart, cosart, valart, ivaart, totart, 
									netart, traalm, centra, contra, consec, nitter, observa, estkar, fecsys, codusu, qtypro, qtyfac, undart, estord, despacho, 
									cendespach, estserial, codartrel, docfac, fecvence, itemprefac, codprod, valimpo, itemfac, porimpo, devpro, estexist, regiserv, 
									DocRel)
							select	Kar.idemp, Kar.codcto, Kar.numcon, Kar.fecmov, Kar.codcon, Kar.codart, Kar.qtyart, Kar.cosart, Kar.valart, Kar.ivaart, Kar.totart,
									Kar.netart, Kar.traalm, Kar.centra, Kar.contra, Kar.consec, Kar.nitter, Kar.observa, Kar.estkar, Kar.fecsys, Kar.codusu, Kar.qtypro, 
									Kar.qtyfac, Kar.undart, Kar.estord, Kar.despacho, Kar.cendespach, Kar.estserial, Kar.codartrel, Kar.docfac, Kar.fecvence, 
									Kar.itemprefac, Kar.codprod, Kar.valimpo, Kar.itemfac, Kar.porimpo, Kar.devpro, Kar.estexist, Kar.regiserv, Kar.DocRel
							FROM	'+@strBdOrigen+'.dbo.Alm_KArdex Kar
									inner join  '+@strBdOrigen+'.dbo.Glb_Transaccion Tra on Kar.CodCon=Tra.CodTran and Tra.codmod=''VT'' and Tra.TipVen=1
							Where	Kar.IdEmp=@strIdemp and Kar.FecMov between @datFecini and @datFecFin and Tra.Doble=1 and  (Kar.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)'
	
		--print  @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100),	@datFecini date, @datfecfin date, @strCodCto_Lc nvarchar(3), 
							@strIdemp nvarchar(3) ',
							@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @datFecini=@datFecini, @datFecfin=@datFecfin, @strCodCto_Lc=@strCodCto_Lc,
							@strIdemp=@strIdemp
	end 
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO

IF OBJECT_ID('db_Sp_Maestros_PasoInformacion','P') IS NOT NULL 
	DROP PROCEDURE db_Sp_Maestros_PasoInformacion
GO
CREATE PROCEDURE db_Sp_Maestros_PasoInformacion
	@strIdemp		nvarchar (3) ='',	@strCodCto	nvarchar(3)='',			@strBdDestino nvarchar(100)='',		@strBdOrigen	nvarchar(100)=''
AS
BEGIN TRY
	Declare	@mNerror	int=0,			@mMsg		nvarchar(190),
			@mLinea		int=0,			@mAddMsg	nvarchar(50),		@mDebito decimal(14,2),
			@mCredito	decimal(14,2),	@mCodcen	nvarchar(3),		@mCodalm nvarchar(3),
			@mEstcomp	nvarchar(1),	@mFecdoc	date,				@mProc   nvarchar(30),
			@pVerMsg	int=0,			@mItemDoc	numeric(6)

	Declare @strCadenaSql	 nVarchar(Max)
	
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.glb_empresa(id, nomemp, nitemp, divemp, diremp, telemp, ciuemp, geremp, conemp, tipemp, facemp, resemp, egremp, 
										cmpart, calcvta, compref, comemp, tiremp, notemp, cotemp, delemp, ruta, tipconse, tipo, valfecha, revisor, email, web, codsuscriptor, 
										c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, repsticker, clapuc, fecmovfin, fecmovini, repsalmateria, touchnom, repconsumo, codequipo, 
										codsim, imppdf, f01, f03, f05, f06, f07, f08, f09, f11, f12, f37, f47, sticvarios, sticlist, empfact, domtran, touch, licTouch, 
										terxcen, leyendapro, consecxcen, cmpalm, rutabdcand, bdcanadian, gastoschuz, valizonalm, EstLlamada, regimpo, resempn, filtroxcto, 
										nitdian, ctoproduc, [plan], superin, normasin, NomApe, consedoble, activofijo, rutaped)
						select id, nomemp, nitemp, divemp, diremp, telemp, ciuemp, geremp, conemp, tipemp, facemp, resemp, egremp, cmpart, calcvta, compref, comemp, tiremp, 
								notemp, cotemp, delemp, ruta, tipconse, tipo, valfecha, revisor, email, web, codsuscriptor, c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, repsticker, 
								clapuc, fecmovfin, fecmovini, repsalmateria, touchnom, repconsumo, codequipo, codsim, imppdf, f01, f03, f05, f06, f07, f08, f09, f11, f12, 
								f37, f47, sticvarios, sticlist, empfact, domtran, touch, licTouch, terxcen, leyendapro, consecxcen, cmpalm, rutabdcand, bdcanadian, gastoschuz, 
								valizonalm, EstLlamada, regimpo, resempn, filtroxcto, nitdian, ctoproduc, [plan], superin, normasin, NomApe, consedoble, activofijo, rutaped
						FROM '+@strBdOrigen+'.dbo.Glb_empresa 
						Where Id not in (Select Id from '+ @strBdDestino+'.dbo.glb_empresa)'

	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_Almacen(idemp, codalm, nomalm, diralm, telalm, resalm, entalm, salalm, ciualm, prealm, nota, resol, 
										facalm, rangoi, rangof, comemp, factura, facturac, tipimp, email, tiremp, divalm, nitalm, valife, abreviatura, backtolog, clase, 
										comanda, comfinal, comini, ctrlcierre, filtralin, impcocina, rutimpcocina, printercoc, exento, imptodo, consecocina, consecoc, 
										diapromo, nomequipo, logcerrarfac, separargru, impsolovtes, impsticker, impespecial, anulatouch, passanulatouch, rutimpcocina1, 
										rutimpcocina2, rutimpcocina3, rutimpcocina4, impprefactura, impfactura, preciovta, nopropina, mesabierta, vrsturnos, alerta, 
										confpago, descripmesa, codzona, dominf, valifec, fijarcc, ccfijo, edformula, gruformula, ocupada, stickerlis, rutaredeban, 
										tipoplato, obserdevol, bloqmesero, obseranul, dispropina, ctatrasalm, ctatras, filubicmesa, dignroperso, impdomici, horacierre,
										ordgrunom, copiasfact, nrocolsti, invenxcto, impgenxcto, digiturno, copiasfact2, agruart, valcajero, impfacconf, cajon, 
										factdcto, addingyegr, domiexpres, forpagcoman, impcomdomi, domiciliario, ppublico, resoln, PrdctoIva, camesacto, turnovrios, 
										DctoxProd, DesActProd, confirtras, controlinv, PorStock, Diasped, DctoMaxAlm)
						Select			idemp, codalm, nomalm, diralm, telalm, resalm, entalm, salalm, ciualm, prealm, nota, resol, 
										facalm, rangoi, rangof, comemp, factura, facturac, tipimp, email, tiremp, divalm, nitalm, valife, abreviatura, backtolog, clase, 
										comanda, comfinal, comini, ctrlcierre, filtralin, impcocina, rutimpcocina, printercoc, exento, imptodo, consecocina, consecoc, 
										diapromo, nomequipo, logcerrarfac, separargru, impsolovtes, impsticker, impespecial, anulatouch, passanulatouch, rutimpcocina1, 
										rutimpcocina2, rutimpcocina3, rutimpcocina4, impprefactura, impfactura, preciovta, nopropina, mesabierta, vrsturnos, alerta, 
										confpago, descripmesa, codzona, dominf, valifec, fijarcc, ccfijo, edformula, gruformula, ocupada, stickerlis, rutaredeban, 
										tipoplato, obserdevol, bloqmesero, obseranul, dispropina, ctatrasalm, ctatras, filubicmesa, dignroperso, impdomici, horacierre,
										ordgrunom, copiasfact, nrocolsti, invenxcto, impgenxcto, digiturno, copiasfact2, agruart, valcajero, impfacconf, cajon, 
										factdcto, addingyegr, domiexpres, forpagcoman, impcomdomi, domiciliario, ppublico, resoln, PrdctoIva, camesacto, turnovrios, 
										DctoxProd, DesActProd, confirtras, controlinv, PorStock, Diasped, DctoMaxAlm
						from			'+@strBdOrigen+'.dbo.Glb_Almacen 
						Where			concat(idemp,codalm) not in (Select concat(idemp,codalm) from '+ @strBdDestino+'.dbo.glb_almacen)'
		
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
	
		

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.glb_cenconsumo(idemp, codalm, codcen, nomcen, ctacaj, nitcen)
						Select			idemp, codalm, codcen, nomcen, ctacaj, nitcen
						from			'+@strBdOrigen+'.dbo.Glb_Cenconsumo
						where			concat(idemp,codalm,codcen) not in (select concat(idemp,codalm,codcen) from '+ @strBdDestino+'.dbo.Glb_cenconsumo)'

		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_tipid(codigo, nombre, codcifin)
						Select			codigo, nombre, codcifin
						from			'+@strBdOrigen+'.dbo.Glb_tipid
						where codigo not in (Select codigo from '+ @strBdDestino+'.dbo.Glb_tipid)'

		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_bancos(codbco, nombco)
						Select			codbco, nombco
						from			'+@strBdOrigen+'.dbo.Glb_bancos
						where codbco not in (Select codbco from '+ @strBdDestino+'.dbo.Glb_bancos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_barrio(codbarr, nombarr, codzona, codzona2, horaini1, horafin1, horaini2, horafin2, valor1, valor2, IdEmp)
						Select			codbarr, nombarr, codzona, codzona2, horaini1, horafin1, horaini2, horafin2, valor1, valor2, IdEmp
						from			'+@strBdOrigen+'.dbo.Glb_barrio
						where codbarr not in (Select codbarr from '+ @strBdDestino+'.dbo.Glb_barrio)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_conceptoscli(codigo, nombre)
						Select			codigo, nombre 
						from			'+@strBdOrigen+'.dbo.Glb_conceptoscli
						where codigo not in (Select codigo from '+ @strBdDestino+'.dbo.Glb_conceptoscli)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_descuentos(idemp, coddes, nomdes, pordes, tipdes, ctavta, ctacom, aplicaser, montodes, autorete, retecree)
						Select			idemp, coddes, nomdes, pordes, tipdes, ctavta, ctacom, aplicaser, montodes, autorete, retecree
						from			'+@strBdOrigen+'.dbo.Glb_descuentos
						where			concat(idemp,coddes) not in (select concat(idemp,coddes) from '+ @strBdDestino+'.dbo.Glb_descuentos)'

		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_cargos(codi_cargo, nomb_cargo, tipo)
						Select			codi_cargo, nomb_cargo, tipo
						from			'+@strBdOrigen+'.dbo.Glb_cargos
						where codi_cargo not in (Select codi_cargo from '+ @strBdDestino+'.dbo.Glb_cargos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_pais(codpais,nompais)
						Select			codpais,nompais
						from			'+@strBdOrigen+'.dbo.Glb_pais
						where codpais not in (Select codpais from '+ @strBdDestino+'.dbo.Glb_pais)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_dpto(coddpto, nomdpto, codpais)
						Select			coddpto, nomdpto, codpais
						from			'+@strBdOrigen+'.dbo.Glb_dpto
						where coddpto not in (Select coddpto from '+ @strBdDestino+'.dbo.Glb_dpto)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_ciudad(coddpto, codciu, nomciu, coddane)
						Select			coddpto, codciu, nomciu, coddane
						from			'+@strBdOrigen+'.dbo.Glb_ciudad
						where codciu not in (Select codciu from '+ @strBdDestino+'.dbo.Glb_ciudad)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_clasiven(codigo, nombre, liqcom, comision, porcomi)
							Select			codigo, nombre, liqcom, comision, porcomi
							from			'+@strBdOrigen+'.dbo.Glb_clasiven
						where codigo not in (Select codigo from '+ @strBdDestino+'.dbo.Glb_clasiven)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_estados(codest,nomest)
							Select			codest,nomest
							from			'+@strBdOrigen+'.dbo.Glb_estados
						where codest not in (Select codest from '+ @strBdDestino+'.dbo.Glb_estados)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_Hobby(codigo, nombre)
							Select			codigo, nombre
							from			'+@strBdOrigen+'.dbo.Glb_Hobby
						where codigo not in (Select codigo from '+ @strBdDestino+'.dbo.Glb_Hobby)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_Labores(codigo, nombre)
							Select			codigo, nombre
							from			'+@strBdOrigen+'.dbo.Glb_Labores
						where codigo not in (Select codigo from '+ @strBdDestino+'.dbo.Glb_Labores)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_modulos(codmod, nommod)
							Select			codmod, nommod
							from			'+@strBdOrigen+'.dbo.Glb_modulos
						where codmod not in (Select codmod from '+ @strBdDestino+'.dbo.Glb_modulos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
						

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_menu(nomfor, modulo, codigo, desopc, padre, arcdll, tipopc, ver)
							Select			nomfor, modulo, codigo, desopc, padre, arcdll, tipopc, ver
							from			'+@strBdOrigen+'.dbo.Glb_menu
						   	where			concat(modulo,codigo) not in (select concat(modulo,codigo) from '+ @strBdDestino+'.dbo.Glb_menu)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_perfiles(codper, nomper, tipper)
							Select			codper, nomper, tipper
							from			'+@strBdOrigen+'.dbo.Glb_perfiles
						   	where codper not in (Select codper from '+ @strBdDestino+'.dbo.Glb_perfiles)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
	
	
	
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_accesos(idemp, codper, nomfor, accfor, nuefor, modfor, elifor, impfor, entinv, salinv, trasinv)
							Select			idemp, codper, nomfor, accfor, nuefor, modfor, elifor, impfor, entinv, salinv, trasinv
							from			'+@strBdOrigen+'.dbo.Glb_accesos
						   	where			concat(idemp, codper, nomfor) not in (select concat(idemp, codper, nomfor) from '+ @strBdDestino+'.dbo.Glb_accesos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_perfilcto(codcto, codper, activo)
							Select			codcto, codper, activo
							from			'+@strBdOrigen+'.dbo.Glb_perfilcto
						   	where			concat(codcto, codper, activo) not in (select concat(codcto, codper, activo) from '+ @strBdDestino+'.dbo.Glb_perfilcto)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
	
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_zonas(codigo, nombre)
							Select			codigo, nombre
							from			'+@strBdOrigen+'.dbo.Glb_zonas
							where codigo not in (Select codigo from '+ @strBdDestino+'.dbo.Glb_zonas)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_terceros(nitter, nomter, tipter, divter, clater, terotr, terven, teremp, terpro, tercli, tercob,
						 telter, dirter, dirter2, ciuter, idusu, fecsys, iva, contacto, celular, fax, descrip, codpro, rango, codgru, codigo, fecnac, mail, 
                         sexo, web, lista, arp, cesantia, codest, conduc, eps, pension, barrio, ocupacion, apellido1, apellido2, cupocre, diasvenc, dptoter,
						 nombre1, otros, sector, tipid, vendedor, activo, civil, codbar, codtipo, foto, lugexp,lugnac, otrosest, porcom, primaria, secundaria, 
						 terprof, zona, cedulafiad, cedulafia2, celfiad1, celfiad2, cuota, dirfiad1, dirfiad2, dirter3, nombrefiad, nombrefia2, telfiad1, telfiad2,
						 telter2, ucmpmcl, ucmvmcl,upgomcl, upgvmcl, cupo, cedulafia3, diacobro1, diacobro2, fcobro, finicial, nombrefia3, periodo, vrcuota, vrinicial,
						 codcargo, codhobby, codprof, empresa, hijos, sueldo, fcobroseg, cedulafia4, celfiad3, dirfiad3, nombrefia4, telfiad3, act_eco, ciiu, estrato, 
						 fec_exp, inicio_labora, nit_empresa, niv_est, per_cargo, tip_contrato, tercon, ocultaremi, cedulafia5, cedulafia6, nombrefia5, nombrefia6, 
						 datacredito, datacredi2, datacredi3, diremp, telemp, contac, clasiven, codconcepto, guia, codpais, obsequio, qtyobsequi, montorf, porrefte, 
						 porrica, porriva, rfuente, rica, riva, formato, estado, nrotarjeta, cmprfuente, cmprica, cmpriva, nombrefiad2, nombrefiad3, cedulafiad2, 
						 cedulafiad3, datacredito1, datacredito2, comporta, dctoter, diascart, cmpcree, rcree, Terinactivo, codctoter, terbloq, poliza, clasiven2, 
						 clasiven3, aplimercha, PorVtaCree)
		Select			 nitter, nomter, tipter, divter, clater, terotr, terven, teremp, terpro, tercli, tercob,
						 telter, dirter, dirter2, ciuter, idusu, fecsys, iva, contacto, celular, fax, descrip, codpro, rango, codgru, codigo, fecnac, mail, 
                         sexo, web, lista, arp, cesantia, codest, conduc, eps, pension, barrio, ocupacion, apellido1, apellido2, cupocre, diasvenc, dptoter,
						 nombre1, otros, sector, tipid, vendedor, activo, civil, codbar, codtipo, foto, lugexp,lugnac, otrosest, porcom, primaria, secundaria, 
						 terprof, zona, cedulafiad, cedulafia2, celfiad1, celfiad2, cuota, dirfiad1, dirfiad2, dirter3, nombrefiad, nombrefia2, telfiad1, telfiad2,
						 telter2, ucmpmcl, ucmvmcl,upgomcl, upgvmcl, cupo, cedulafia3, diacobro1, diacobro2, fcobro, finicial, nombrefia3, periodo, vrcuota, vrinicial,
						 codcargo, codhobby, codprof, empresa, hijos, sueldo, fcobroseg, cedulafia4, celfiad3, dirfiad3, nombrefia4, telfiad3, act_eco, ciiu, estrato, 
						 fec_exp, inicio_labora, nit_empresa, niv_est, per_cargo, tip_contrato, tercon, ocultaremi, cedulafia5, cedulafia6, nombrefia5, nombrefia6, 
						 datacredito, datacredi2, datacredi3, diremp, telemp, contac, clasiven, codconcepto, guia, codpais, obsequio, qtyobsequi, montorf, porrefte, 
						 porrica, porriva, rfuente, rica, riva, formato, estado, nrotarjeta, cmprfuente, cmprica, cmpriva, nombrefiad2, nombrefiad3, cedulafiad2, 
						 cedulafiad3, datacredito1, datacredito2, comporta, dctoter, diascart, cmpcree, rcree, Terinactivo, codctoter, terbloq, poliza, clasiven2, 
						 clasiven3, aplimercha, PorVtaCree
		from			'+@strBdOrigen+'.dbo.Glb_terceros 
		where nitter not in (Select nitter from '+ @strBdDestino+'.dbo.Glb_terceros)'
		
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_usuarios(codusu, nomusu, codper, clausu, codter, centro, valcos, entinv, salinv, 
											trasinv, centinv, csalinv, ctrasinv, ppublico, pmayorista, pespecial, pespecial1, pespecial2, infcentro, 
											formato, formato2, clasql, inactivo, desdcto, clausunet, camfecegr, desactconse, Desactpuc, Destranegr, 
											ActCupo, nofactcred, CodContras)
							Select			codusu, nomusu, codper, clausu, codter, centro, valcos, entinv, salinv, 
											trasinv, centinv, csalinv, ctrasinv, ppublico, pmayorista, pespecial, pespecial1, pespecial2, infcentro, 
											formato, formato2, clasql, inactivo, desdcto, clausunet, camfecegr, desactconse, Desactpuc, Destranegr, 
											ActCupo, nofactcred, CodContras
							from			'+@strBdOrigen+'.dbo.Glb_usuarios
							where codusu not in (Select codusu from '+ @strBdDestino+'.dbo.Glb_usuarios)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen


		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_transaccion(codtran, nomtran, tiptran, fuesys, modulo, codmod, codcue, tipcon, codfue, codmov, 
											codcod, anultran, tipven, doble, consec, activa, contable, devolprove, manejaiva, fiscdefaul, fuente, exenta, 
											consignacion, trancm, trannd, trancp, noenvio, unificarcf, balaninv, traslado, ccinv, ncopias, tranedit, 
											transacniif, TipoNorma, impstk)
							Select			codtran, nomtran, tiptran, fuesys, modulo, codmod, codcue, tipcon, codfue, codmov, 
											codcod, anultran, tipven, doble, consec, activa, contable, devolprove, manejaiva, fiscdefaul, fuente, exenta, 
											consignacion, trancm, trannd, trancp, noenvio, unificarcf, balaninv, traslado, ccinv, ncopias, tranedit, 
											transacniif, TipoNorma, impstk
							from			'+@strBdOrigen+'.dbo.Glb_transaccion
							where codtran not in (Select codtran from '+ @strBdDestino+'.dbo.Glb_transaccion)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_unica(idemp, codcto, codtran, contran, prefijo, facemp, tiremp, resemp, estacionmod, 
											fecsysmod, resempn, contran2, resemp2)
							Select			idemp, codcto, codtran, contran, prefijo, facemp, tiremp, resemp, estacionmod, 
											fecsysmod, resempn, contran2, resemp2
							from			'+@strBdOrigen+'.dbo.Glb_unica
							where			concat(idemp, codcto, codtran) not in (select concat(idemp, codcto, codtran) from '+ @strBdDestino+'.dbo.Glb_unica)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

				
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.Glb_mensual(idemp, codcto, codtran, añotran, mes01, mes02, mes03, mes04, mes05, mes06, mes07, 
											mes08, mes09, mes10, mes11, mes12)
							Select			idemp, codcto, codtran, añotran, mes01, mes02, mes03, mes04, mes05, mes06, mes07, 
											mes08, mes09, mes10, mes11, mes12
							from			'+@strBdOrigen+'.dbo.Glb_mensual
							where			concat(idemp, codcto, codtran) not in (select concat(idemp, codcto, codtran) from '+ @strBdDestino+'.dbo.Glb_mensual)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
				
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.con_cencostos(idemp, codalm, codcen, codcto, nomcto, codrel, almfac, domtran, ctacaj, ctoproduc)
							Select			idemp, codalm, codcen, codcto, nomcto, codrel, almfac, domtran, ctacaj, ctoproduc
							from			'+@strBdOrigen+'.dbo.con_cencostos
							where			concat(idemp, codalm, codcen, codcto) not in (select concat(idemp, codalm, codcen, codcto) from '+ @strBdDestino+'.dbo.con_cencostos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.con_folios(idemp, codlib, nomlib)
							Select			idemp, codlib, nomlib
							from			'+@strBdOrigen+'.dbo.con_folios
							where			concat(idemp, codlib, nomlib) not in (select concat(idemp, codlib, nomlib) from '+ @strBdDestino+'.dbo.con_folios)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.con_foldetalle(idemp, codlib, numcop, fecsys, codusu)
							Select			idemp, codlib, numcop, fecsys, codusu
							from			'+@strBdOrigen+'.dbo.con_foldetalle
							where			concat(idemp, codlib) not in (select concat(idemp, codlib) from '+ @strBdDestino+'.dbo.con_foldetalle)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
				
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.con_mescierre(cerrar, idemp, mes, año, Cierre_NIIF)
							Select			cerrar, idemp, mes, año, Cierre_NIIF
							from			'+@strBdOrigen+'.dbo.con_mescierre
							where			concat(cerrar, idemp, mes, año, Cierre_NIIF) not in (select concat(cerrar, idemp, mes, año, Cierre_NIIF) from '+ @strBdDestino+'.dbo.con_mescierre)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
				

		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.con_puc(codcue, nomcue, auxcue, numche, retcue, ajucue, porret, monto, ctajustd, ctajustc, depcue, añodep, sancue, d01cue, c01cue,
											d02cue, c02cue, d03cue, c03cue, d04cue, c04cue, d05cue, c05cue, d06cue, c06cue, d07cue, c07cue, d08cue, c08cue, d09cue, c09cue, d10cue, c10cue, d11cue, 
											c11cue, d12cue, c12cue, natcue, nivcue, centro, tercero, inf, formato, codadd, poriva, ivacue, macentro, manit, manitbco, nitbco, ctaegrcaj, tiprete, 
											diferido, ctagasdife, codgruniif, codcueniif, nomcueniif, manactivo, ctaori)
							Select			codcue, nomcue, auxcue, numche, retcue, ajucue, porret, monto, ctajustd, ctajustc, depcue, añodep, sancue, d01cue, c01cue,
											d02cue, c02cue, d03cue, c03cue, d04cue, c04cue, d05cue, c05cue, d06cue, c06cue, d07cue, c07cue, d08cue, c08cue, d09cue, c09cue, d10cue, c10cue, d11cue, 
											c11cue, d12cue, c12cue, natcue, nivcue, centro, tercero, inf, formato, codadd, poriva, ivacue, macentro, manit, manitbco, nitbco, ctaegrcaj, tiprete, 
											diferido, ctagasdife, codgruniif, codcueniif, nomcueniif, manactivo, ctaori
							from			'+@strBdOrigen+'.dbo.con_puc
							where codcue not in (Select codcue from '+ @strBdDestino+'.dbo.con_puc)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
			
				
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.con_parametros(idemp, añomayoriza, codcto, ctauti, ctaper, ctaivacom, ctaivavta, ctaicacom, ctaicavta, 
											ctaretcom, ctaretvta, ctaretiva, ctarivacom, ctacxp, ctacxc, ctadesc, ctaing, ctacaja, ctacosto, ctainv, ctaped, iva, 
											ctapropd, ctapropc, ctaajpdb, ctaajpcr, ctaabono, ctaingreso, ctapropina, porcentaje, descuento, ctacuota, ctaobra, ctaretserv, 
											nivelmay, ctaimpcom, cuecen, cuenit, ctaadmon, ctaimprevisto, ctautilidad, formatoegre, noagrudepre, ivainclu, ctacomitar, 
											ctaint, ctatransp, coddepre, ctadevol, codtraneg, ctaanticip, ctagastos, ctaivasimp, ctareftesi, ctaxpotr, nit2, ctaivacomdev, 
											ctaivavtadev, ctaivagas, ctaimpo, autoretcre, ctacomitarj, ctacreevta, ctaivavtanul, ctaivacomanul, ctacreevtacr, añoniif, 
											nitdian, ctareftesimpli, ctaanticipo, ctaivasimpli, prefniif, AñoMayorizaNIIF, codctoNIIF, cpdecima)
							Select			idemp, añomayoriza, codcto, ctauti, ctaper, ctaivacom, ctaivavta, ctaicacom, ctaicavta, 
											ctaretcom, ctaretvta, ctaretiva, ctarivacom, ctacxp, ctacxc, ctadesc, ctaing, ctacaja, ctacosto, ctainv, ctaped, iva, 
											ctapropd, ctapropc, ctaajpdb, ctaajpcr, ctaabono, ctaingreso, ctapropina, porcentaje, descuento, ctacuota, ctaobra, ctaretserv, 
											nivelmay, ctaimpcom, cuecen, cuenit, ctaadmon, ctaimprevisto, ctautilidad, formatoegre, noagrudepre, ivainclu, ctacomitar, 
											ctaint, ctatransp, coddepre, ctadevol, codtraneg, ctaanticip, ctagastos, ctaivasimp, ctareftesi, ctaxpotr, nit2, ctaivacomdev, 
											ctaivavtadev, ctaivagas, ctaimpo, autoretcre, ctacomitarj, ctacreevta, ctaivavtanul, ctaivacomanul, ctacreevtacr, añoniif, 
											nitdian, ctareftesimpli, ctaanticipo, ctaivasimpli, prefniif, AñoMayorizaNIIF, codctoNIIF, cpdecima
							from			'+@strBdOrigen+'.dbo.con_parametros
							where idemp not in (Select idemp from '+ @strBdDestino+'.dbo.con_parametros)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

				
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_genero(codgen, nomgen, genero)
							Select			codgen, nomgen, genero
							from			'+@strBdOrigen+'.dbo.alm_genero
							where codgen not in (Select codgen from '+ @strBdDestino+'.dbo.alm_genero)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_grupos(codgru, nomgru, tipgru, ctacosto, ctavta, ctaret, ctacmp, tirbar, promocion, clasificacion, 
											rutaimp, imagen, consigna, inmuebles, codserial, planes, sincomision, longitud, horaini, horafin, dia1, dia2, dia3, 
											dia4, dia5, dia6, dia7, ctacmpvta, ctacmpdev, ayudaingre, tipoplato, impdefault)
							Select			codgru, nomgru, tipgru, ctacosto, ctavta, ctaret, ctacmp, tirbar, promocion, clasificacion, 
											rutaimp, imagen, consigna, inmuebles, codserial, planes, sincomision, longitud, horaini, horafin, dia1, dia2, dia3, 
											dia4, dia5, dia6, dia7, ctacmpvta, ctacmpdev, ayudaingre, tipoplato, impdefault
							from			'+@strBdOrigen+'.dbo.alm_grupos
							where codgru not in (Select codgru from '+ @strBdDestino+'.dbo.alm_grupos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_lineas(codlin, nomlin, codgru, tirbar)
							Select			codlin, nomlin, codgru, tirbar
							from			'+@strBdOrigen+'.dbo.alm_lineas
							where codlin not in (Select codlin from '+ @strBdDestino+'.dbo.alm_lineas)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_marcas(codmar, nommar)
							Select			codmar, nommar
							from			'+@strBdOrigen+'.dbo.alm_marcas
							where codmar not in (Select codmar from '+ @strBdDestino+'.dbo.alm_marcas)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_tips(idemp, codtips, codgru, nomtips)
							Select			idemp, codtips, codgru, nomtips
							from			'+@strBdOrigen+'.dbo.alm_tips
							where codtips not in (Select codtips from '+ @strBdDestino+'.dbo.alm_tips)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_unidades(undcon, undnom, tipo, constante, factor, conversion, undglb)
							Select			undcon, undnom, tipo, constante, factor, conversion, undglb
							from			'+@strBdOrigen+'.dbo.alm_unidades
							where undcon not in (Select undcon from '+ @strBdDestino+'.dbo.alm_unidades)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		
			
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_articulos(codart, nomart, codgru, codlin, undart, ivaart, ruta, comart, detart, fecsys, codusu, 
											nompro, codreg, codter, codbar, preart, refart, impart, codcol, masa, acabado, codac, genero, codmat, extimg, imgart, 
											tallas, ucompra, porcom, ubic, desperdicio, codmar, inactivo, porutil, peso, unumfac, codtalla, calcivainclu, activo, 
											promxcant, codrel, planilla, precio, preciocos, preciocuc, pesocodbar, alquila, areac, areat, calle, carrera, codbarrio, 
											codciu, coddpto, codtipo, estado, estrato, fecha, fondo, frente, nitarren, permuta, propietario, vende, propio, comercial, 
											cfm, clasificacion, clausulas, tipo, tipo2, up, nocomision, vlrcomision, variante, porimpo, valimpo, repo, ivacmp, dctoart, 
											ivacero, cambiapre, ctagasto, ctadepre, depreciable, lugar, responsable, vidautil, vlrresidual, comiliquida, facconver, 
											pedircod, vidautilniif, concepent, costofijo)
							Select			codart, nomart, codgru, codlin, undart, ivaart, ruta, comart, detart, fecsys, codusu, 
											nompro, codreg, codter, codbar, preart, refart, impart, codcol, masa, acabado, codac, genero, codmat, extimg, imgart, 
											tallas, ucompra, porcom, ubic, desperdicio, codmar, inactivo, porutil, peso, unumfac, codtalla, calcivainclu, activo, 
											promxcant, codrel, planilla, precio, preciocos, preciocuc, pesocodbar, alquila, areac, areat, calle, carrera, codbarrio, 
											codciu, coddpto, codtipo, estado, estrato, fecha, fondo, frente, nitarren, permuta, propietario, vende, propio, comercial, 
											cfm, clasificacion, clausulas, tipo, tipo2, up, nocomision, vlrcomision, variante, porimpo, valimpo, repo, ivacmp, dctoart, 
											ivacero, cambiapre, ctagasto, ctadepre, depreciable, lugar, responsable, vidautil, vlrresidual, comiliquida, facconver, 
											pedircod, vidautilniif, concepent, costofijo
							from			'+@strBdOrigen+'.dbo.alm_articulos
							where codart not in (Select codart from '+ @strBdDestino+'.dbo.alm_articulos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_codbarras(codbarra, codart)
							Select			codbarra, codart
							from			'+@strBdOrigen+'.dbo.alm_codbarras
							where codbarra not in (Select codbarra from '+ @strBdDestino+'.dbo.alm_codbarras)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

		-- Se cambiaron los not in por left para optimizar la consulta. asi demora mucho pero mucho menos. Ing. Lissette Feb 13/02/2017 
		SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_inventario(idemp, codcto, codart, caninv, valprom, ucoart, pvdart, pveart, pvmart, pvcart, 
											pvaart, pvbart, minart, maxart, utcart, utdart, uteart, frainv, qtyfra, ucompra, unumfac, maxdcto, diascmp, diaseguri, 
											fecordcmp, tiemped, invdia, invmes, frecuped, otrgas, artlogistic, artpromo)
							Select	Inv2.idemp, Inv2.codcto, Inv2.codart, Inv2.caninv, Inv2.valprom, Inv2.ucoart, Inv2.pvdart, Inv2.pveart, Inv2.pvmart, Inv2.pvcart, 
									Inv2.pvaart, Inv2.pvbart, Inv2.minart, Inv2.maxart, Inv2.utcart, Inv2.utdart, Inv2.uteart, Inv2.frainv, Inv2.qtyfra, Inv2.ucompra, 
									Inv2.unumfac, Inv2.maxdcto, Inv2.diascmp, Inv2.diaseguri, Inv2.fecordcmp, Inv2.tiemped, Inv2.invdia, Inv2.invmes, Inv2.frecuped, 
									Inv2.otrgas, Inv2.artlogistic, Inv2.artpromo
							from	' + @strBdOrigen +'.dbo.alm_inventario Inv2
									left join '+ @strBdDestino+'.dbo.alm_inventario  Inv1 on Inv1.IdEmp=Inv2.IdEmp and Inv1.codcto=Inv2.codcto and Inv1.codart=Inv2.codart
							where	inv1.codart is null '
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
		print 'alm_inventario'	

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_tallasart(codigo, nombre)
							Select			codigo, nombre
							from			'+@strBdOrigen+'.dbo.alm_tallasart
						where codigo not in (Select codigo from '+ @strBdDestino+'.dbo.alm_tallasart)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_variantes(codart, citem, nomvar, codgru, qtypor, codusu, fecsys, idemp, valpromvar)
							Select	        codart, citem, nomvar, codgru, qtypor, codusu, fecsys, idemp, valpromvar
							from			'+@strBdOrigen+'.dbo.alm_variantes
						    where			concat(idemp,codgru,codart) not in (select concat(idemp,codgru,codart) from '+ @strBdDestino+'.dbo.alm_variantes)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
						
SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_promo(idemp, codcto, numero, fecha1, fecha2, hor1, min1, jor1, hor2, min2, jor2, dcto, codusu, 
											fecsys, estado, dia, tipo, todo)
							Select	        Prom1.idemp, Prom1.codcto, Prom1.numero, Prom1.fecha1, Prom1.fecha2, Prom1.hor1, Prom1.min1, Prom1.jor1, Prom1.hor2, 
											Prom1.min2, Prom1.jor2, Prom1.dcto, Prom1.codusu, 
											Prom1.fecsys, Prom1.estado, Prom1.dia, Prom1.tipo, Prom1.todo
							from			'+@strBdOrigen+'.dbo.alm_promo Prom1
											left join '+@strBdDestino+'.dbo.alm_promo Prom2 ON Prom1.idemp=Prom2.idemp and Prom1.Codcto=Prom2.Codcto and Prom1.Numero=Prom2.numero
						    where			Prom2.numero is null '
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
	
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.alm_promodet(idemp, codcto, numero, codart, vrdcto)
							Select	        Prom1.idemp, Prom1.codcto, Prom1.numero, Prom1.codart, Prom1.vrdcto
							from			'+@strBdOrigen+'.dbo.alm_promodet Prom1
											left join '+ @strBdDestino+'.dbo.alm_promodet Prom2 on Prom1.idemp=Prom2.idemp and Prom1.Codcto=Prom2.Codcto and 
											Prom1.Numero=Prom2.numero and Prom1.Codart=Prom2.Codart
						    where			Prom2.codart is null '
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.com_conceptos(idemp, codcon, nomcon, codcue)
							Select	        idemp, codcon, nomcon, codcue
							from			'+@strBdOrigen+'.dbo.com_conceptos
						    where			concat(idemp,codcon) not in (select concat(idemp,codcon) from '+ @strBdDestino+'.dbo.com_conceptos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
			
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.com_parametros(idemp, ivainclu, unialm, invtran, pordes, promcos, valorayuda, diasvenci, reemplazacos, 
											noreversainv, noversaen, centroscomp, reversaen, entcomp, desactplazo, variosivas, anticipo, ingserial, ctaant, digitarvl, 
											modiva, actprecios, poractprec, roundoc, blooptimp, valimp, ctaxegre, totinfcxp, repitem, ivainf, dcto100, ivaantdcto, 
											valpromitem, actpredig, uniqtyart, actrete, ctafp)
							Select	        idemp, ivainclu, unialm, invtran, pordes, promcos, valorayuda, diasvenci, reemplazacos, 
											noreversainv, noversaen, centroscomp, reversaen, entcomp, desactplazo, variosivas, anticipo, ingserial, ctaant, digitarvl, 
											modiva, actprecios, poractprec, roundoc, blooptimp, valimp, ctaxegre, totinfcxp, repitem, ivainf, dcto100, ivaantdcto, 
											valpromitem, actpredig, uniqtyart, actrete, ctafp
							from			'+@strBdOrigen+'.dbo.com_parametros
						    where idemp not in (Select idemp from '+ @strBdDestino+'.dbo.com_parametros)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
	
	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_conceptos(idemp, codcon, nomcon, codcue)
							Select	        idemp, codcon, nomcon, codcue
							from			'+@strBdOrigen+'.dbo.ven_conceptos
						    where			concat(idemp,codcon) not in (select concat(idemp,codcon) from '+ @strBdDestino+'.dbo.ven_conceptos)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen

	SET @strCadenaSql = 'Insert Into '+ @strBdDestino+'.dbo.ven_formapago(idemp, codfor, codcto, nomfor, codcue, porcom, editcom, pagsys, rtefte, rteica, tarjeta, 
										cuecom, cuerfte, cuerica, cueriva, efectivo, nitbco, rtecom, rteiva, tipo, poradic, ctacom, saldo, cheque, pagoxcen, 
										especial, detallar, listprecio, Bloxperfil)
							Select	    idemp, codfor, codcto, nomfor, codcue, porcom, editcom, pagsys, rtefte, rteica, tarjeta, 
										cuecom, cuerfte, cuerica, cueriva, efectivo, nitbco, rtecom, rteiva, tipo, poradic, ctacom, saldo, cheque, pagoxcen, 
										especial, detallar, listprecio, Bloxperfil
							from		'+@strBdOrigen+'.dbo.ven_formapago
						    where			concat(idemp,codfor,codcto) not in (select concat(idemp,codfor,codcto) from '+ @strBdDestino+'.dbo.ven_formapago)'
	
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100)', @strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen
													
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO

IF OBJECT_ID('db_Sp_Anuldoc_PasoInformacion','P') IS NOT NULL 
	DROP PROCEDURE db_Sp_Anuldoc_PasoInformacion
GO
CREATE PROCEDURE db_Sp_Anuldoc_PasoInformacion
	@strIdemp		nvarchar (3) ='',	@strBdDestino nvarchar(100)='',		@strBdOrigen	nvarchar(100)='', @intOpcion int = 0
AS
BEGIN TRY
	Declare	@mNerror	int=0,			@mMsg		nvarchar(190),
			@mLinea		int=0,			@mAddMsg	nvarchar(50),		@mDebito decimal(14,2),
			@mCredito	decimal(14,2),	@mCodcen	nvarchar(3),		@mCodalm nvarchar(3),
			@mEstcomp	nvarchar(1),	@mFecdoc	date,				@mProc   nvarchar(30),
			@pVerMsg	int=0,			@mItemDoc	numeric(6)

	Declare @strCadenaSql	 nVarchar(Max)
	if @IntOpcion = 0 
	begin 
		--1 Ven Facturas 
		SET @strCadenaSql = 'UPDATE '+ @strBdDestino+'.dbo.Ven_Facturas 
							 SET	'+ @strBdDestino+'.dbo.Ven_Facturas.EstFac = FacO.EstFac 
							 FROM	'+ @strBdDestino+'.dbo.Ven_Facturas FacD 
									inner join '+@strBdOrigen+'.dbo.Ven_facturas FacO  On FacD.IdEmp=FacO.Idemp and FacD.CodCto=FacO.CodCto and FacD.TipFac=FacO.TipFac and 
									FacD.NumFac=FacO.NumFac
							Where FacO.EstFac=''A''  and FacO.IdEmp=@strIdemp '	
		--	print @strCadenaSql
		EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3) ', 
												@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp
	end 


	--2 Com Facturas
	SET @strCadenaSql = 'UPDATE '+ @strBdDestino+'.dbo.Com_Facturas 
						 SET	'+ @strBdDestino+'.dbo.Com_Facturas.EstFac = FacO.EstFac 
						 FROM	'+ @strBdDestino+'.dbo.Com_Facturas FacD 
								inner join '+@strBdOrigen+'.dbo.Com_facturas FacO  On FacD.IdEmp=FacO.Idemp and FacD.CodCto=FacO.CodCto and FacD.TipFac=FacO.TipFac and 
								FacD.NumFac=FacO.NumFac
						Where FacO.EstFac=''A''  and FacO.IdEmp=@strIdemp '	
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3) ', 
										@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp

	--3 Alm Kardex
	SET @strCadenaSql = 'UPDATE '+ @strBdDestino+'.dbo.Alm_Kardex 
						 SET	'+ @strBdDestino+'.dbo.Alm_Kardex.EstKar = FacO.EstKar 
						 FROM	'+ @strBdDestino+'.dbo.Alm_Kardex FacD 
								inner join '+@strBdOrigen+'.dbo.Alm_Kardex FacO  On FacD.IdEmp=FacO.Idemp and FacD.CodCto=FacO.CodCto and FacD.CodCon=FacO.CodCon and 
								FacD.NumCon=FacO.NumCon
						Where FacO.EstKar=''A''  and FacO.IdEmp=@strIdemp '	
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3) ', 
										@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp
	--4 Con Comprobante
	SET @strCadenaSql = 'UPDATE '+ @strBdDestino+'.dbo.Con_Comprobante 
						 SET	'+ @strBdDestino+'.dbo.Con_Comprobante.EstComp = FacO.EstComp 
						 FROM	'+ @strBdDestino+'.dbo.Con_Comprobante FacD 
								inner join '+@strBdOrigen+'.dbo.Con_Comprobante FacO  On FacD.IdEmp=FacO.Idemp and FacD.CodCto=FacO.CodCto and FacD.CodTran=FacO.CodTran and 
								FacD.Consec=FacO.Consec and FacD.itemdoc=FacO.itemdoc
						Where FacO.EstComp=''A''  and FacO.IdEmp=@strIdemp '	
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3) ', 
										@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp

	--5 Ven Pagos
	SET @strCadenaSql = 'UPDATE '+ @strBdDestino+'.dbo.Ven_Pagos 
						 SET	'+ @strBdDestino+'.dbo.Ven_Pagos.EstPag = FacO.EstPag 
						 FROM	'+ @strBdDestino+'.dbo.Ven_Pagos FacD 
								inner join '+@strBdOrigen+'.dbo.Ven_Pagos FacO  On FacD.IdEmp=FacO.Idemp and FacD.CodCto=FacO.CodCto and FacD.TipPag=FacO.TipPag and 
								FacD.NumDoc=FacO.NumDoc
						Where FacO.EstPag=''A''  and FacO.IdEmp=@strIdemp '	
	
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3) ', 
										@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp

	--6 Tes Egresos
	SET @strCadenaSql = 'UPDATE '+ @strBdDestino+'.dbo.Tes_Egresos 
						 SET	'+ @strBdDestino+'.dbo.Tes_Egresos.EstEgr = FacO.EstEgr 
						 FROM	'+ @strBdDestino+'.dbo.Tes_Egresos FacD 
								inner join '+@strBdOrigen+'.dbo.Tes_Egresos FacO  On FacD.IdEmp=FacO.Idemp and FacD.CodCto=FacO.CodCto and FacD.TipFac=FacO.TipFac and 
								FacD.ConSec=FacO.ConSec
						Where FacO.EstEgr=''A''  and FacO.IdEmp=@strIdemp '	
	
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3) ', 
										@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp
													
END TRY
Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO

IF OBJECT_ID('db_Sp_CalcularAbonos_PasoInformacion','P') IS NOT NULL 
	DROP PROCEDURE db_Sp_CalcularAbonos_PasoInformacion
GO
CREATE PROCEDURE db_Sp_CalcularAbonos_PasoInformacion
	@strIdemp	nvarchar (3) ='',	@strCodcto nVarchar(3)='',	@strBdDestino nvarchar(100)='',		@strBdOrigen	nvarchar(100)=''
AS
BEGIN TRY
	Declare	@mNerror	int=0,			@mMsg		nvarchar(190),
			@mLinea		int=0,			@mAddMsg	nvarchar(50),		@mDebito decimal(14,2),
			@mCredito	decimal(14,2),	@mCodcen	nvarchar(3),		@mCodalm nvarchar(3),
			@mEstcomp	nvarchar(1),	@mFecdoc	date,				@mProc   nvarchar(30),
			@pVerMsg	int=0,			@mItemDoc	numeric(6),			@strCodCto_Lc nvarchar(3)
	
	SET @strCodCto_Lc	= Case When @strCodCto='' Then NULL Else @strCodCto End

	Declare @strCadenaSql	 nVarchar(Max)

	--1 Ventas 
	SET @strCadenaSql ='UPDATE	'+@strBdDestino+'.dbo.Ven_Facturas 
						SET		abofac = Abonos.DebVen 
						FROM	'+@strBdDestino+'.dbo.Ven_facturas fac 
								inner join (Select	Mov.IdEmp,Mov.AFECEN, Mov.AFETIP, Mov.AFEDOC, SUM(Mov.CREVEN) AS DEBVEN 
											FROM 	'+@strBdDestino+'.dbo.VEN_MOVCLI Mov 
													INNER JOIN '+@strBdDestino+'.dbo.Glb_Transaccion Tra ON Mov.TIPDOC=Tra.CODTRAN 
											WHERE 	Mov.IdEmp=@strIdEmp and (Tra.CODmod=''NC'' OR Tra.CODmod=''RC'') AND (Mov.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)
													AND concat(Mov.IdEmp,Mov.CodCto,Mov.TIPDOC,Mov.DOCVEN) 
													NOT IN (SELECt concat(IdEmp,AFECEN,AFETIP,AFEDOC) 
															FROM '+@strBdDestino+'.dbo.VEN_MOVCLI) 
															GROUP BY mov.idemp,Mov.AFECEN,Mov.AFETIP,Mov.AFEDOC ) as abonos on fac.idemp=abonos.idemp and 
																															  fac.codcto=abonos.afecen and 
																															  fac.tipfac=abonos.afetip and 
																															  fac.numfac=abonos.afedoc '
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3),@strCodCto_Lc nVarchar(3) ', 
										@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp,@strCodCto_lc=@strCodCto_Lc

	--2 Compras 
	SET @strCadenaSql ='UPDATE	'+@strBdDestino+'.dbo.Com_Facturas 
						SET		abofac = Abonos.DebVen 
						FROM	'+@strBdDestino+'.dbo.Com_facturas fac 
								inner join (Select	Mov.IdEmp,Mov.AFECEN, Mov.AFETIP, Mov.AFEDOC, SUM(Mov.DebCom) AS DEBVEN 
											FROM 	'+@strBdDestino+'.dbo.Com_MOVPro Mov 
													INNER JOIN '+@strBdDestino+'.dbo.Glb_Transaccion Tra ON Mov.TIPDOC=Tra.CODTRAN 
											WHERE 	Mov.IdEmp=@strIdEmp and (Tra.CODmod=''ND'' OR Tra.CODmod=''EG'') AND (Mov.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)
													AND concat(Mov.IdEmp,Mov.CodCto,Mov.TIPDOC,Mov.DocCom) 
													NOT IN (SELECt concat(IdEmp,AFECEN,AFETIP,AFEDOC) 
															FROM '+@strBdDestino+'.dbo.Com_MOVPro) 
															GROUP BY mov.idemp,Mov.AFECEN,Mov.AFETIP,Mov.AFEDOC ) as abonos on fac.idemp=abonos.idemp and 
																															  fac.codcto=abonos.afecen and 
																															  fac.tipfac=abonos.afetip and 
																															  fac.numfac=abonos.afedoc '
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strBdDestino nvarchar(100),	@strBdOrigen nvarchar(100), @strIdEmp nvarchar(3),@strCodCto_Lc nVarchar(3) ', 
										@strBdDestino=@strBdDestino, @strBdOrigen=@strBdOrigen, @strIdemp=@strIdemp,@strCodCto_lc=@strCodCto_Lc
													
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO


IF OBJECT_ID('db_Sp_Con_CtaCenCostos_UpCampos','P') IS NOT NULL   -- Ing Lissette Sept 15 de 2015  proceso para mayorizacion
	DROP PROCEDURE db_Sp_Con_CtaCenCostos_UpCampos
GO
CREATE PROCEDURE db_Sp_Con_CtaCenCostos_UpCampos
	@strIdemp	nvarchar (3) ='', @strTabla nVarchar(20)='Con_CtaCenCostos', @strTablaComp nVarchar(20)='Con_Comprobante' 
AS
BEGIN TRY
	Declare	@mNerror	int=0,			@mMsg		nvarchar(190),
			@mLinea		int=0,			@mAddMsg	nvarchar(50),		@mDebito decimal(14,2),
			@mCredito	decimal(14,2),	@mCodcen	nvarchar(3),		@mCodalm nvarchar(3),
			@mEstcomp	nvarchar(1),	@mFecdoc	date,				@mProc   nvarchar(30),
			@pVerMsg	int=0,			@mItemDoc	numeric(6)			
	
	Declare @strCadenaSql	 nVarchar(Max)
	--Primero actualizo campos de Natcue, codcen, codalm
	SET @strCadenaSql ='UPDATE	' + @strTabla + '    
						SET		NatCue = Puc.NatCue,
								CodCen = Cto.CodCen,
								CodAlm = Cto.CodAlm 
						FROM	'+ @strTabla +' Cta
								inner join Con_Puc			Puc on Cta.CodCue=Puc.CodCue
								inner join Con_CenCostos	Cto on Cta.CodCto=Cto.CodCto '		  	
	
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strTabla nVarchar(20) ', @strTabla=@strTabla
		
	SET @strCadenaSql ='Insert Into '+@strTabla +'(idemp, codcto, codcue, natcue, Año, codalm, codcen)
						select @strIdEmp as IdEmp, Cto.CodCto, Puc.CodCue, Puc.NatCue, Com.Año, Cto.CodAlm, Cto.CodCen 
						from	Con_Puc Puc  
								cross join  Con_CenCostos Cto 
								cross join (SELECT DISTINCT YEAR(FecDoc) AS Año 
											FROM '+@strTablaComp+' WHERE estcomp!=''A'' ) as Com 
						Where concat(@strIdEmp,Com.Año,Cto.CodCto,Puc.CodCue) not in (Select concat(IdEmp,Año,CodCto,CodCue) From '+@strTabla +' )'
	
	--print @strCadenaSql
	EXEC sp_executesql	@strCadenaSql, N'@strTabla nVarchar(20), @strIdEmp nVarchar(3) ',@strTabla=@strTabla, @strIdEmp=@strIdEmp
												
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO


IF OBJECT_ID('db_SP_CON_fr_Medios_Pro2276','P') IS NOT NULL 
	DROP PROCEDURE db_SP_CON_fr_Medios_Pro2276
GO
CREATE PROCEDURE db_SP_CON_fr_Medios_Pro2276
	@lnAño		Numeric(4)	=0, 
	@lnTope		Numeric(20)	=0,
	@StrIdemp	nvarchar(3) =''
	
	WITH RECOMPILE
AS
SET NOCOUNT ON
BEGIN
	SELECT	Com.nitter 
			,Com.Debito 
			,Com.Credito 
			,Com.codcue
	INTO	#cur_Comprobante
	FROM 	Con_Comprobante Com WITH(NOLOCK)
	WHERE	YEAR(Com.fecdoc)=@lnAño and Com.EstComp='' and com.idemp=@StrIdemp

	;WITH tblDatos AS
	(	SELECT 	Com.nitter
				,abs(Com.Debito-Com.Credito) as PagoE
				,0.00 as Cespag
				,0.00 as GasRepre
				,0.00 as Peninvali
				,0.00 as otringr
				,0.00 as aporsalud
				,0.00 as aporpenion
				,0.00 as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='18' 
		UNION ALL
		SELECT 	Com.nitter
				,0.00 as PagoE
				,abs(Com.Debito-Com.Credito) as Cespag
				,0.00 as GasRepre
				,0.00 as Peninvali
				,0.00 as otringr
				,0.00 as aporsalud
				,0.00 as aporpenion
				,0.00 as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='19' 		
		UNION ALL		
		SELECT 	Com.nitter
				,0.00 as PagoE
				,0.00 as Cespag
				,abs(Com.Debito-Com.Credito)  as GasRepre
				,0.00 as Peninvali
				,0.00 as otringr
				,0.00 as aporsalud
				,0.00 as aporpenion
				,0.00 as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='20' 		
		UNION ALL
		SELECT 	Com.nitter
				,0.00 as PagoE
				,0.00 as Cespag
				,0.00 as GasRepre
				,abs(Com.Debito-Com.Credito) as Peninvali
				,0.00 as otringr
				,0.00 as aporsalud
				,0.00 as aporpenion
				,0.00 as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='21' 		
		UNION ALL
		SELECT 	Com.nitter
				,0.00 as PagoE
				,0.00 as Cespag
				,0.00 as GasRepre
				,0.00 as Peninvali
				,abs(Com.Debito-Com.Credito) as otringr
				,0.00 as aporsalud
				,0.00 as aporpenion
				,0.00 as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='22' 		
		UNION ALL
		SELECT 	Com.nitter
				,0.00 as PagoE
				,0.00 as Cespag
				,0.00 as GasRepre
				,0.00 as Peninvali
				,0.00 as otringr
				,abs(Com.Debito-Com.Credito) as aporsalud
				,0.00 as aporpenion
				,0.00 as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='24' 		
		UNION ALL
		SELECT 	Com.nitter
				,0.00 as PagoE
				,0.00 as Cespag
				,0.00 as GasRepre
				,0.00 as Peninvali
				,0.00 as otringr
				,0.00 as aporsalud
				,abs(Com.Debito-Com.Credito) as aporpenion
				,0.00 as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='25' 		
		UNION ALL
		SELECT 	Com.nitter
				,0.00 as PagoE
				,0.00 as Cespag
				,0.00 as GasRepre
				,0.00 as Peninvali
				,0.00 as otringr
				,0.00 as aporsalud
				,0.00 as aporpenion
				,abs(Com.Debito-Com.Credito) as aporvol
				,0.00 as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='26' 		
		UNION ALL
		SELECT 	Com.nitter
				,0.00 as PagoE
				,0.00 as Cespag
				,0.00 as GasRepre
				,0.00 as Peninvali
				,0.00 as otringr
				,0.00 as aporsalud
				,0.00 as aporpenion
				,0.00 as aporvol
				,abs(Com.Debito-Com.Credito) as Valreten
		FROM 	#cur_Comprobante com
				INNER JOIN Con_ConMedios Med ON Com.codcue=Med.codcue
				INNER JOIN Con_PUC 		 Puc ON Med.codcue=Puc.codcue
		WHERE 	Med.codmedio='2276' AND Med.numcolum='27' 		
	)
	SELECT 	Com.nitter, 
			ter.apellido1,
			ter.apellido2,
			ter.nombre1,
			ter.otros,
			ter.mail as email,
			ter.dirter,
			ter.telter,
			ter.ciuter,
			ter.tipid,
			ter.dptoter,
			ter.codpais as paister,
			ter.dptoter as dptoterRet,
			ter.ciuter as ciuterRet,
			sum(Com.PagoE)		as PagoE, 
			sum(Com.Cespag)		as Cespag, 
			sum(Com.GasRepre)	as GasRepre, 
			sum(Com.Peninvali)	as Peninvali, 
			sum(Com.otringr)	as otringr, 
			sum(Com.aporsalud)	as aporsalud, 
			sum(Com.aporpenion) as aporpenion, 
			sum(Com.aporvol)	as aporvol, 
			sum(Com.Valreten)	as Valreten
	FROM 	tblDatos Com
			inner join glb_terceros ter on com.nitter=ter.nitter
			group by Com.nitter,ter.apellido1,ter.apellido2,ter.nombre1,ter.otros,ter.mail,ter.dirter,ter.telter,ter.ciuter,ter.tipid,ter.dptoter,ter.codpais
end 
GO


IF OBJECT_ID('db_SP_ALM_KARDEX_GetStocksDet','P') IS NOT NULL 
	DROP PROCEDURE db_SP_ALM_KARDEX_GetStocksDet
GO
CREATE PROCEDURE db_SP_ALM_KARDEX_GetStocksDet
	@idEmp VARCHAR(03),			@strRefArt nVarchar(25),	@datFechaIni DATE,			@datFechaFin DATE,	@CodCto VARCHAR(03)=''
	WITH RECOMPILE
AS
BEGIN
	DECLARE @strIdEmp_Lc  VARCHAR(03)
	DECLARE @strRefArt_Lc VARCHAR(25)
	DECLARE @strCodCto_Lc VARCHAR(03)
	DECLARE @datFechaIni_Local DATE
	DECLARE @datFechaFin_Local DATE
	
	SET @strCodCto_Lc	= Case When @CodCto='' Then NULL Else @CodCto End
	SET @strRefArt_Lc	= @strRefArt
	SET @stridEmp_Lc	= @idEmp
	SET @datFechaIni_Local	= @datFechaIni
	SET @datFechaFin_Local	= @datFechaFin
	

	--RAISERROR('Cargando Datos en tabla Temporal',10,1) WITH NOWAIT
	;with tblDatos1 AS(
	SELECT	kar.idemp			--Saldo anterior 
			,Kar.codart
			,tra.tipcon 
			,kar.codcto
			,SUM(kar.qtyart) AS SalAnt
			,0.00 AS QtyVta
	FROM	alm_kardex kar WITH(NOLOCK)
			INNER JOIN glb_transaccion	AS tra WITH(NOLOCK) ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@strIdEmp_Lc
			and (kar.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)
			GROUP BY kar.idemp,kar.codcto,kar.codart,tra.tipcon 
	UNION ALL
	SELECT	fac.idemp					-- Qty Vtas
			,Det.codart
			, 'S' as tipcon 
			,det.codcto
			, 0.00 AS SalAnt
			, Sum(Det.qtyart) as qtyvta
	FROM	ven_facturas fac WITH(NOLOCK)
			INNER JOIN ven_facdetalle	AS det WITH(NOLOCK) ON fac.idemp=det.idemp and fac.codcto=det.codcto and fac.tipfac = det.tipfac and fac.numfac = det.numfac
	WHERE	fac.IdEmp=@strIdEmp_Lc
			and fac.Fecfac BETWEEN @datFechaIni_Local AND @datFechaFin_Local
			and (fac.CodCto=@strCodCto_Lc OR @strCodCto_Lc is null)
			GROUP BY fac.idemp,det.codcto,det.codart
	)	

	SELECT	idemp
			,codart
			,tipcon
			,codcto
			,SUM(SalAnt) AS SalAnt
			,SUM(QtyVta) AS QtyVta
	INTO	#tblTEmp1
	FROM	tblDatos1 
			GROUP BY idemp,codcto,codart,tipcon
	--RAISERROR('Ejecutando Informe',10,1) WITH NOWAIT
			
	SELECT	kar.idemp
			,kar.codcto
			,cto.nomcto 
			,SUM((CASE KAR.tipcon WHEN 'E' THEN kar.SalAnt WHEN 'S' THEN kar.SalAnt * - 1 END))  AS QtyExi
			,SUM(kar.QtyVta) AS QtyVTa
	FROM	 #tblTemp1		as KAR  
			inner join alm_articulos	as Art WITH(NOLOCK) on Kar.Codart = Art.codart 
			inner join con_cencostos	as cto on kar.codcto = cto.codcto
	WHERE	KAR.IdEmp=@strIdEmp_Lc
			and Art.refart =@strRefArt_Lc 
			GROUP BY kar.idemp,kar.codcto,cto.nomcto 
END
go 

IF OBJECT_ID('db_SP_ALM_KARDEX_SinMov','P') IS NOT NULL 
	DROP PROCEDURE db_SP_ALM_KARDEX_SinMov
GO
CREATE PROCEDURE db_SP_ALM_KARDEX_SinMov
	@idEmp		VARCHAR(03),	@CodCto			VARCHAR(3)='',	@strCodpro varchar(15)='',
	@strCodMar	varchar(3)='',	@strCodGru		varchar(3)='',	@strCodLin	varchar(4)='',
	@numDias	numeric(10)=0,	@strExis		numeric=0
	WITH RECOMPILE
AS
BEGIN
	DECLARE @idEmp_Local  VARCHAR(03)
	DECLARE @CodCto_Local VARCHAR(03)
	DECLARE @strCodGru_Lc varchar(3)	
	DECLARE @strCodLin_Lc varchar(4)	
	DECLARE @strCodMar_Lc varchar(3)	
	DECLARE @strCodPro_Lc varchar(15)	
	
	SET @idEmp_Local		= @idEmp
	SET @CodCto_Local		= Case When @CodCto='' Then NULL Else @CodCto End
	SET @strCodGru_Lc		= Case When @strCodGru='' Then NULL Else @strCodGru End
	SET @strCodLin_Lc		= Case When @strCodLin='' Then NULL Else @strCodLin End
	SET @strCodMar_Lc		= Case When @strCodMar='' Then NULL Else @strCodMar End
	SET @strCodPro_Lc		= Case When @strCodPro='' Then NULL Else @strCodPro End
	
	RAISERROR('Cargando Datos en tabla Temporal',10,1) WITH NOWAIT
	;with tblDatos AS(
	SELECT	 kar.idemp			--buscando los dias de movimiento 
			,kar.codart
			,DATEDIFF(day,MAX(Kar.FECMOV),GETDATE())  AS  dias  
	FROM	alm_kardex kar WITH(NOLOCK)
			INNER JOIN glb_transaccion	AS tra WITH(NOLOCK) ON kar.codcon = tra.codtran
	WHERE	kar.IdEmp=@idEmp_Local
			and tra.CODMOD='VT' 
			and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			GROUP BY kar.idemp, kar.codart 
			having DATEDIFF(day,MAX(Kar.FECMOV),GETDATE())>=@numDias
	)
	select	Idemp
			,codart
			,dias 
	INTO	#tblTEmp1
	FROM	tblDatos kar 
		
	RAISERROR('Ejecutando Informe',10,1) WITH NOWAIT
	if @strExis = 0
		SELECT	Sum(inv.caninv)		as CanInv		
				,Max(Inv.valprom)	as Valprom 	
				,Max(Inv.PvcArt)	as PvcArt 
				,sum(Inv.caninv * Inv.valprom) as tprom
				,max(Art.REFART)	as refart			
				,max(Art.Ivaart)	as Ivaart 			
				,sum(Inv.caninv * Inv.pvcart) as TotPvc	
				,max(Gru.NomGru)	as nomgru 		
				,max(Lin.NomLin)	as Nomlin		
				,kar.CodArt		
				,mAx(Mar.NomMar)	as marca	
				,max(Art.codbar)	as Codbar			
				,IIF(max(Tal.nombre) is null,'',max(Tal.nombre)) as talla 	
				,max(Art.NomARt)	as nomart 			
				,max(Art.CodTer) 	as codter 	
				,max(dias)			as dias 		
		FROM	#tblTEmp1 kar
				inner join alm_articulos	as Art WITH(NOLOCK) on Kar.Codart = Art.codart 
				left join alm_marcas		as Mar WITH(NOLOCK) on Art.codmar =  Mar.codmar
				left join alm_inventario	as inv WITH(NOLOCK) on kar.codart=inv.codart and kar.idemp=inv.idemp and (inv.CodCto=@CodCto_Local OR @CodCto_Local is null)
				inner join alm_grupos		as gru WITH(NOLOCK) on art.codgru=gru.codgru 
				inner join alm_lineas		as lin WITH(NOLOCK) on art.codlin=lin.codlin
				left join alm_tallasart		as tal WITH(NOLOCK) on art.codtalla=tal.codigo 
				GROUP BY kar.idemp,kar.codart
	else 
		SELECT	Sum(inv.caninv)		as CanInv		
				,Max(Inv.valprom)	as Valprom 	
				,Max(Inv.PvcArt)	as PvcArt 
				,sum(Inv.caninv * Inv.valprom) as tprom
				,max(Art.REFART)	as refart			
				,max(Art.Ivaart)	as Ivaart 			
				,sum(Inv.caninv * Inv.pvcart) as TotPvc	
				,max(Gru.NomGru)	as nomgru 		
				,max(Lin.NomLin)	as Nomlin		
				,kar.CodArt		
				,mAx(Mar.NomMar)	as marca	
				,max(Art.codbar)	as Codbar			
				,IIF(max(Tal.nombre) is null,'',max(Tal.nombre)) as talla 	
				,max(Art.NomARt)	as nomart 			
				,max(Art.CodTer) 	as codter 		
				,max(dias)			as dias 	
		FROM	#tblTEmp1 kar
				inner join alm_articulos	as Art WITH(NOLOCK) on Kar.Codart = Art.codart 
				left join alm_marcas		as Mar WITH(NOLOCK) on Art.codmar =  Mar.codmar
				left join alm_inventario	as inv WITH(NOLOCK) on kar.codart=inv.codart and kar.idemp=inv.idemp and (inv.CodCto=@CodCto_Local OR @CodCto_Local is null)
				inner join alm_grupos		as gru WITH(NOLOCK) on art.codgru=gru.codgru 
				inner join alm_lineas		as lin WITH(NOLOCK) on art.codlin=lin.codlin
				left join alm_tallasart		as tal WITH(NOLOCK) on art.codtalla=tal.codigo 
				GROUP BY kar.idemp,kar.codart having Sum(Inv.caninv)>0 


END
GO

--SACA EL SALDO DEL KARDEX CANTIDADES Y VALORES PARA LOS BALANCES DE INVENTARIO   ING. LISSETTE CASTRO ABRIL 22 DE 2016
IF OBJECT_ID('db_SP_ALM_KARDEX_GETSALDO','P') IS NOT NULL 
	DROP PROCEDURE db_SP_ALM_KARDEX_GETSALDO
GO
CREATE PROCEDURE db_SP_ALM_KARDEX_GETSALDO
	 @pIdEMp   nVarchar(3)=''
	,@pCodCto  nVarchar(3)=''
	,@pFecMov  date=GETDATE
AS
BEGIN
	DECLARE @CodCto_Local VARCHAR(03)
	SET @CodCto_Local		= Case When @pCodCto='' Then NULL Else @pCodCto End

	SELECT	kar.idemp, kar.codcto, kar.codart, 
			SUM((CASE tra.tipcon WHEN 'E' THEN kar.qtyart WHEN 'S' THEN kar.qtyart * - 1 END)) AS cantidad, 
			SUM((CASE tra.tipcon WHEN 'E' THEN kar.qtyart * kar.Cosart WHEN 'S' THEN (kar.qtyart * kar.Cosart) * - 1 END)) AS saldoAnt
	FROM    alm_kardex AS kar WITH (NOLOCK) 
			INNER JOIN glb_transaccion AS tra WITH (NOLOCK) ON kar.codcon = tra.codtran
	WHERE	Kar.idemp=@pIdEMp and kar.fecmov<=@pFecMov 	and (kar.CodCto=@CodCto_Local OR @CodCto_Local is null)
			GROUP BY kar.idemp, kar.codcto, kar.codart
			ORDER BY kar.idemp, kar.codcto, kar.codart
END
GO


IF OBJECT_ID('db_SP_CON_fr_Medios_Pro1007','P') IS NOT NULL 
	DROP PROCEDURE db_SP_CON_fr_Medios_Pro1007
GO
CREATE PROCEDURE db_SP_CON_fr_Medios_Pro1007
	@strIdEmp nvarchar(3)='',		@lnAño Numeric(4)=0,	@lnTope Numeric(20)=0,		@cTipoNit nVarChar(6)=''
	WITH RECOMPILE
AS
SET NOCOUNT ON
BEGIN
	;WITH tblDatos AS
	(SELECT a.nitter,
			ROUND(A.Credito-A.Debito,0) AS INGBRUTO, 
			cast('0' as decimal(18,2)) AS INGCONSORCIO,
			cast('0' as decimal(18,2)) AS INGCONTRATO,
			cast('0' as decimal(18,2)) AS INGMINERALES,
			cast('0' as decimal(18,2)) AS INGFIDUCIA,
			cast('0' as decimal(18,2)) AS INGTERCEROS,
			tope, 
			B.codcon AS codcon 
	FROM 	Con_Comprobante A	
			INNER JOIN Con_ConMedios B ON A.codcue=B.codcue
	WHERE 	a.idemp=@stridemp and  B.codmedio='1007' AND B.numcolum='11' AND  YEAR(A.fecdoc)=@lnAño AND B.codcon!='' AND a.estcomp='' 
	union all 
	SELECT 	a.nitter,
			cast('0' as decimal(18,2))	AS INGBRUTO,
			ROUND(A.Credito-A.Debito,0) AS INGCONSORCIO,
			cast('0' as decimal(18,2))	AS INGCONTRATO,
			cast('0' as decimal(18,2))	AS INGMINERALES,
			cast('0' as decimal(18,2))	AS INGFIDUCIAS,
			cast('0' as decimal(18,2))	AS INGTERCEROS,
			tope, 
			B.codcon AS codcon 
	FROM 	Con_Comprobante A	
			INNER JOIN Con_ConMedios B ON A.codcue=B.codcue 
	WHERE 	a.idemp=@stridemp and B.codmedio='1007' AND B.numcolum='12' AND YEAR(A.fecdoc)=@lnAño AND B.codcon!='' AND a.estcomp='' 
	UNION ALL 
	SELECT 	a.nitter,
			cast('0' as decimal(18,2))	AS INGBRUTO,
			cast('0' as decimal(18,2))	AS INGCONSORCIO,
			ROUND(A.Credito-A.Debito,0) AS INGCONTRATO, 
			cast('0' as decimal(18,2))	AS INGMINERALES,
			cast('0' as decimal(18,2))	AS INGFIDUCIAS,
			cast('0' as decimal(18,2))	AS INGTERCEROS,
			tope, 
			B.codcon AS codcon 
	FROM 	Con_Comprobante A	
			INNER JOIN Con_ConMedios B ON A.codcue=B.codcue
	WHERE 	a.idemp=@stridemp and B.codmedio='1007' AND B.numcolum='13' AND  YEAR(A.fecdoc)=@lnAño AND B.codcon!='' AND a.estcomp=''
	UNION ALL 		
	SELECT 	a.nitter,
			cast('0' as decimal(18,2))	AS INGBRUTO,
			cast('0' as decimal(18,2))	AS INGCONSORCIO,
			cast('0' as decimal(18,2))  AS INGCONTRATO, 
			ROUND(A.Credito-A.Debito,0) AS INGMINERALES ,
			cast('0' as decimal(18,2))  AS INGFIDUCIAS,
			cast('0' as decimal(18,2))	AS INGTERCEROS,
			tope, 
			B.codcon AS codcon 
	FROM 	Con_Comprobante A	
			INNER JOIN Con_ConMedios B ON A.codcue=B.codcue
	WHERE 	a.idemp=@stridemp and B.codmedio='1007' AND B.numcolum='14' AND  YEAR(A.fecdoc)=@lnAño AND B.codcon!='' AND a.estcomp='' 
	UNION ALL 
	SELECT 	a.nitter,
			cast('0' as decimal(18,2))	AS INGBRUTO,
			cast('0' as decimal(18,2))	AS INGCONSORCIO,
			cast('0' as decimal(18,2))	AS INGCONTRATO, 
			cast('0' as decimal(18,2))	AS INGMINERALES ,
			ROUND(A.Credito-A.Debito,0) AS INGFIDUCIA,
			cast('0' as decimal(18,2))	AS INGTERCEROS,
			tope, 
			B.codcon AS codcon 
	FROM 	Con_Comprobante A	
			INNER JOIN Con_ConMedios B ON A.codcue=B.codcue 
	WHERE 	a.idemp=@stridemp and B.codmedio='1007' AND B.numcolum='15' AND  YEAR(A.fecdoc)!=@lnAño AND B.codcon!='' AND a.estcomp='' 
	UNION ALL 
	SELECT 	a.nitter,
			cast('0' as decimal(18,2))	AS INGBRUTO,
			cast('0' as decimal(18,2))	AS INGCONSORCIO,
			cast('0' as decimal(18,2))	AS INGCONTRATO, 
			cast('0' as decimal(18,2))	AS INGMINERALES ,
			cast('0' as decimal(18,2))	AS INGFIDUCIA,
			ROUND(A.Credito-A.Debito,0) AS INGTERCEROS , 
			tope, 
			B.codcon AS codcon 
	FROM 	Con_Comprobante A	
			INNER JOIN Con_ConMedios B ON A.codcue=B.codcue
	WHERE 	a.idemp=@stridemp and B.codmedio='1007' AND B.numcolum='16' AND  YEAR(A.fecdoc)=@lnAño AND B.codcon!='' AND a.estcomp='' 
	)
		
	SELECT	Case When @cTipoNit='CodPro' Then ter.codpro Else com.nitter End AS nitter , 
			com.INGBRUTO,
			com.INGCONSORCIO,
			com.INGCONTRATO, 
			com.INGMINERALES ,
			com.INGFIDUCIA,
			com.INGTERCEROS , 
			com.tope, 
			com.codcon,
			ter.tipid  AS tipid ,
			ter.divter ,
			ter.apellido1 ,
			ter.apellido2 ,
			ter.nombre1 ,
			ter.otros,
			IIF(ter.divter!='',ter.NOMTER,SPACE(200)) AS razon,
			ter.codpais AS paister
	FROM 	tblDatos com
			inner join glb_terceros ter on com.nitter=ter.nitter
END
GO

IF OBJECT_ID('db_SP_LeerVartransacciones','P') IS NOT NULL 
	DROP PROCEDURE db_SP_LeerVartransacciones
GO
CREATE PROCEDURE db_SP_LeerVartransacciones
AS
BEGIN
	DECLARE @mNro int 
	select  @mNro= @@TRANCOUNT  
	select  @mNro as vartrancount 
END
GO

IF OBJECT_ID('db_SP_ayudaArtTallas_Get','P') IS NOT NULL
	DROP PROCEDURE dbo.db_SP_ayudaArtTallas_Get
GO
CREATE PROCEDURE db_SP_ayudaArtTallas_Get
	@CAMPO nVARCHAR(15)='',		@IDEMP nVARCHAR(3)='',		@CODCTO nVARCHAR(3)='',		@CONDICION nVARCHAR(3000)=''
AS
BEGIN
	DECLARE @CodCto_Local nVARCHAR(3)
	SET @CodCto_Local		= Case When @CodCto='' Then NULL Else @CodCto End

	DECLARE @QUERY nVARCHAR(MAX)

	SET  @QUERY = 'SELECT  ' + @CAMPO + ' as RefArt, 
							Art.CodBar, 
							UPPER(Art.NomArt) as nomart, 
							IIF(Mar.NomMar  is null,space(30),Mar.NomMar) as NomMar,	
							IIF(Exi.Cantidad is null,00000000000,Exi.Cantidad) as CanInv, 
							IIF(Tal.Nombre is null,space(30),Tal.NomBre)  as talla,
							IIF(Inv.Pvcart is null,0000000000000.00,Inv.PvcArt) As PvcArt, 
							Art.Ubic, 
							IIF(col.nomcol is null,space(30),col.nomcol) as color,
							Art.UndArt, 									
		  	  				IIF(Inv.Valprom is null,0000000000000.00,Inv.Valprom) as Valprom, 
							Art.IvaArt, 
							Gru.ctacosto, 
							Gru.ctavta, 
							Gru. ctacmp, 	
		  	  				IIF(inv.PvbArt is null,00000000000.000,Inv.PvbArt) as pvbart, 
							Art.CodGru, 
							Gru.TipGru, 
							Art.CodLin, 
							Art.Codart, 		
		  	  				IIF(Lin.Nomlin is null,SPACE(60),Lin.NomLin) AS NomLin, 
							SPACE(60) as nompro, 
							Art.codmar, 
							Art.CodTer, 
							Art.codtalla,
							IIF(Inv.Valprom is null,000000000,Inv.Valprom)	as Valprom, 
							IIF(Inv.MinArt is null,000000000,Inv.MinArt)	as MinArt,	
							IIF(Inv.MaxArt is null,0000000000,Inv.MaxArt)	as MaxArt, 	
		  	  				IIF(Inv.maxdcto is null,0000.00,Inv.maxdcto) as maxdcto, 
							IIF(inv.codcto is null,SPACE(3),Inv.CodCto) as codCto,
							IIF(Inv.PvdArt is null,000000000,Inv.PvdArt)	as PvdArt, 	
							IIF(Inv.PveArt is null,0000000000,Inv.PveArt)	as PveArt 			
					FROM 	alm_articulos Art 																	
		  	  				INNER JOIN Alm_grupos 		Gru ON Art.CodGru=Gru.CodGru 							
		  	  				LEFT  JOIN Alm_Inventario 	Inv ON Inv.IdEmp=@IDEMP  AND (inv.CodCto=@CodCto_Local OR @CodCto_Local is null) and Art.CodArt=Inv.CodArt 
		  	  				LEFT  JOIN alm_tallasart	Tal	ON Art.codtalla=Tal.Codigo  						
		  	  				LEFT  JOIN Alm_Marcas		Mar ON Art.CodMar=Mar.codMar
							LEFT  JOIN Alm_color		col ON Art.codcol=col.codcol 							
		  	  				LEFT  JOIN Alm_lineas		Lin	ON Art.codlin=Lin.CodLin 							
		  	  				left  join vActInventario	exi on art.codart=exi.codart  and  Exi.IdEmp=@IDEMP AND (exi.CodCto= @CodCto_Local OR @CodCto_Local is null)
					WHERE 	Art.inactivo=0   ' + @CONDICION 
	
	EXEC sp_executesql	@QUERY, N'@IDEMP nvarchar(3), @CodCto_Local nvarchar(3), @CONDICION nVarchar(3000), @CAMPO nVarchar(15) ',
						@IDEMP=@idemp, @CodCto_Local=@CodCto_Local, @CONDICION=@CONDICION, @CAMPO=@CAMPO	
END
GO
IF OBJECT_ID('cargarpuntos','P') IS NOT NULL
	DROP PROCEDURE [cargarpuntos]
GO
CREATE PROCEDURE [cargarpuntos]
@idemp nvarchar(3)='',    @codcto nvarchar(3)='',   @nitter nvarchar(15)='',
@numfac nvarchar(8)='',	  @tipfac nvarchar(3)='',	@netofac numeric(20) =0, 
@fecfac date
AS
BEGIN
DECLARE @QUERY		  NUMERIC(20)
DECLARE @QUERYPUNTOS  NUMERIC(20)
DECLARE @QUERYVALOR   NUMERIC(20)
DECLARE @QUERYPOR   NUMERIC(20)
DECLARE @QUERYID   NUMERIC(20)
DECLARE @QUERYFECHAVENCI   DATETIME
DECLARE @TOTALPUNTOS NUMERIC(20)
DECLARE @CODIGO NUMERIC(20)
DECLARE @SQL VARCHAR(MAX) 


	SET @QUERY =(select MAX(codigo) as codigo from alm_puntos where fecfin >= @fecfac and codcto =@codcto and estado= 1 group by fecfin)
	IF @QUERY > 0
	BEGIN
		SET @QUERYPUNTOS =(select npuntos from alm_puntos where codigo=@QUERY)
		SET @QUERYVALOR =(select valor from alm_puntos where codigo=@QUERY)
		SET @QUERYPOR =(select porcentaje from alm_puntos where codigo=@QUERY)
		SET @QUERYFECHAVENCI =(select fecfin from alm_puntos where codigo=@QUERY)
		SET @QUERYID =(select codigo from alm_puntos where codigo=@QUERY)
		SET @CODIGO = @QUERYID
	END
	ELSE
		BEGIN
		SET @QUERYPUNTOS =(select npuntos from alm_globalpuntos where  codcto =@codcto and fecfin >= @fecfac and @fecfac >= fecini)
		SET @QUERYVALOR =(select valor from alm_globalpuntos where  codcto =@codcto and fecfin >= @fecfac and @fecfac >= fecini)
		SET @QUERYPOR =(select porcentaje from alm_globalpuntos where  codcto =@codcto and fecfin >= @fecfac and @fecfac >= fecini)
		SET @QUERYFECHAVENCI =(select fecfin from alm_globalpuntos where  codcto =@codcto and fecfin >= @fecfac and @fecfac >= fecini)
		SET @CODIGO = 999999
	END

	DECLARE @ANIO INT
	DECLARE @MES VARCHAR(30)
	DECLARE @DIA VARCHAR(30) 
	DECLARE @SUMANIO VARCHAR(30)
	DECLARE @FECHAVEN DATE
	DECLARE @T date = @fecfac;   
	SET @ANIO= (SELECT DATEPART(year, @t)) 
	SET @MES =(SELECT DATEPART(MONTH, @t));  
	SET @DIA =(SELECT DATEPART(DAY, @t));
	SET @SUMANIO = @ANIO + 1
	PRINT @SUMANIO
	SET @FECHAVEN = CONCAT(@SUMANIO,'/',@MES,'/',@DIA)

	--*******CACLULAMOS LOS PUNTOS*******----
	SET @TOTALPUNTOS = ((@netofac * (@QUERYPOR/100)) / @QUERYVALOR) * @QUERYPUNTOS
--	--SET @TOTALPUNTOS = (@netofac / @QUERYVALOR) * @QUERYPUNTOS
	
--	--*******LLENAMOS LA TABLA VEN_FACPUNTOS*****-----
	SET @TOTALPUNTOS = IIF(@TOTALPUNTOS is null,0,@TOTALPUNTOS)
	INSERT INTO ven_facpuntos (idemp,codcto,nitter,numfac,tipfac,netofac,puntos,codigopuntos,fecfac,fecvenci) VALUES
		 (@idemp,@codcto,@nitter,@numfac,@tipfac,@NETOFAC,@totalpuntos,@codigo,@fecfac,@FECHAVEN)

	DECLARE @puntosacumulados NUMERIC(20)
	SET @puntosacumulados=( SELECT SUM(puntos) as puntos FROM VEN_FACPUNTOS where fecvenci >= @fecfac and nitter = @nitter)

	IF NOT EXISTS(select nitter from ven_totalpuntos where nitter = @nitter)
	BEGIN
		INSERT INTO ven_totalpuntos (NITTER,PUNTOS) values (@nitter,@puntosacumulados)

	END
	ELSE
	begin
		UPDATE ven_totalpuntos SET puntos =PUNTOS + @TOTALPUNTOS  WHERE nitter = @nitter
	END
END
GO
IF OBJECT_ID('redimirpuntosxvalor','P') IS NOT NULL
	DROP PROCEDURE [redimirpuntosxvalor]
GO
CREATE PROCEDURE redimirpuntosxvalor
@idemp nvarchar(3)='',    @codcto nvarchar(3)='',   @nitter nvarchar(15)='',
@numfac nvarchar(8)='',	  @tipfac nvarchar(3)='',	@netofac numeric(20) =0, 
@puntos numeric(20) =0,  @fecpun date
AS
BEGIN
DECLARE @NPUNTOS NUMERIC(14)
DECLARE @PUNTOSQUERY NUMERIC(14)
SET @PUNTOSQUERY = (select puntos from ven_totalpuntos WHERE nitter = @nitter)
SET @NPUNTOS = @PUNTOSQUERY - @puntos
IF @NPUNTOS < 0
BEGIN
SET @NPUNTOS = 0
END

INSERT into ven_puntosredimidos (idemp,codcto,nitter,numfac,tipfac,netofac,puntos,fecpun)
VALUES (@idemp,@codcto,@nitter,@numfac,@tipfac,@netofac,@puntos,@fecpun)

UPDATE ven_totalpuntos SET puntos = @NPUNTOS WHERE nitter = @nitter

END
go  


IF OBJECT_ID('Ven_Sp_ActParametros2','P') IS NOT NULL 
	DROP PROCEDURE [Ven_Sp_ActParametros2]
GO
CREATE PROCEDURE Ven_Sp_ActParametros2
	@pIdemp			nvarchar(3),			@pefdefault		bit=0,				@pnitdevol		Bit=0,				@pdesacdcrip		bit=0,  
	@pnoveraiu		bit=0,					@pnit2fact		bit=0,				@pagrugenero	bit=0,				@pCosInvDet			bit=0,   
	@pInfpropina	bit=0,					@pcontrifa		decimal(14,0)=0,	@plimiterifa	nvarchar(10)='',	@pobsercomanfac		bit=0,          
	@pDETRIFA		nvarchar(max)='',		@ppassdctos		nvarchar(max)='',	@pCentro		nvarchar(3)='',		@pTransFormula		nvarchar(2)='',			
	@pNumapro		bit=0,					@pListPPublico  Numeric(1)=1,		@pinfofacanultouc bit=0,			@pImpMesasOcupada	nvarchar='',			
	@pHoracierre	bit=0,					@pPorconsumo	Decimal(5,3)=0,		@pInfVtaxTranxGru bit=0,			@plisprecios		bit=0,
	@pCodtranCambMesa nVarchar(2)='',		@pFecsysEg		bit=0,				@pSegBascula	Numeric(3)=0,		@pCajon				bit=0
AS
BEGIN try 
	declare	@mNreg		int,
			@mAddMsg	nvarchar(230)='', 
			@pVerMsgBox int=0,
			@mProc		nvarchar(30)='Ven_Sp_ActParametros2'

	If Not Exists(Select Idemp From ven_parametros2 Where idemp=@pIdemp)
	Begin 
		Insert Into Ven_Parametros2(idemp,efdefault,nitdevol,desacdcrip,noveraiu,nit2fact,agrugenero,CosInvDet,Infpropina,contrifa, 
				limiterifa,obsercomanfac,DETRIFA,passdctos,centro,TransFormula,numapro,ListPPublico,infofacanultouc,ImpMesasOcupada,horacierre,PorConsumo,
				InfVtaxTranxGru,lisprecios,CodtranCambMesa,FecsysEG,SegBascula,cajon )
		Values(@pidemp,@pefdefault,@pnitdevol,@pdesacdcrip,@pnoveraiu,@pnit2fact,@pagrugenero,@pCosInvDet,@pInfpropina,@pcontrifa, 
				@plimiterifa,@pobsercomanfac,@pDETRIFA,@ppassdctos,@pCentro,@pTransFormula,@pNumapro,@pListPPublico,@pinfofacanultouc,@pImpMesasOcupada,@pHoracierre,
				@pPorconsumo,@pInfVtaxTranxGru,@plisprecios,@pCodtranCambMesa,@pFecsysEG,@pSegBascula,@pCajon)
	End 
	Else 
	Begin 
		Update Ven_Parametros2 
		Set		efdefault		=@pefdefault,
				nitdevol		=@pnitdevol,
				desacdcrip		=@pdesacdcrip,
				noveraiu		=@pnoveraiu,
				nit2fact		=@pnit2fact,
				agrugenero		=@pagrugenero,
				CosInvDet		=@pCosInvDet,
				Infpropina		=@pInfpropina,
				contrifa		=@pcontrifa,	 
				limiterifa		=@plimiterifa,
				obsercomanfac	=@pobsercomanfac,
				DETRIFA			=@pDETRIFA,
				passdctos		=@ppassdctos,
				centro			=@pCentro,
				TransFormula	=@pTransFormula,
				numapro			=@pNumapro,
				ListPPublico	=@pListPPublico, 
				infofacanultouc =@pinfofacanultouc,
				ImpMesasOcupada	=@pImpMesasOcupada,
				Horacierre		=@pHoracierre,
				PorConsumo		=@pPorconsumo,
				InfVtaxTranxGru	=@pInfVtaxTranxGru,
				lisprecios		=@plisprecios,
				CodtranCambMesa =@pCodtranCambMesa,
				FecsysEG		=@pFecsysEG,
				SegBascula		=@pSegBascula,
				cajon			=@pCajon
      Where		idemp=@pIdemp
   End
END try 

Begin Catch 
   set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
end catch 
GO

IF OBJECT_ID('db_Sp_PasoInfo_comprobante_comproniif','P') IS NOT NULL   -- Ing Lissette Oct 23 de 2016  proceso para mayorizacion paso de inforacion niif 
	DROP PROCEDURE db_Sp_PasoInfo_comprobante_comproniif
GO
CREATE PROCEDURE db_Sp_PasoInfo_comprobante_comproniif
	@strIdemp	nvarchar (3) ='',	@numAñoniif numeric(4)=0
AS
BEGIN TRY
	Declare	@mNerror	int=0,			@mMsg		nvarchar(190),		@mLinea		int=0,			
			@mAddMsg	nvarchar(50),	@pVerMsg	int=0,				@mProc   char(20)
	
	--Declare @strCadenaSql	 nVarchar(Max)
	--inset de comprobante que no se han pasado 
	insert into Con_ComproNIIF(idemp, codalm, codcen, codcto, codtran, consec, codctodet, fecdoc, codcue, nitter, detalle, 
			debito, credito, codusu, estcomp, numche, codact, base, turno, estconcili, codimp, ctacomitar, nitter2, saldoa, 
			ivamayvlr, itemdoc, timedife, revelaciones,  docdelete)	
	select	com.idemp, com.codalm, com.codcen, com.codcto, com.codtran, com.consec, com.codctodet, com.fecdoc, 
			iif(puc.codcueniif='',com.codcue,puc.codcueniif) as codcue, com.nitter, com.detalle, 
			com.debito, com.credito, com.codusu, com.estcomp, com.numche, com.codact, com.base, com.turno, com.estconcili, com.codimp, 
			com.ctacomitar, com.nitter2, com.saldoa, com.ivamayvlr, com.itemdoc, com.timedife, com.revelaciones, com.docdelete
 	from	con_comprobante com 
			inner join glb_transaccion	Tra on com.codtran=Tra.codtran and tra.TipoNorma='A'
			inner join con_puc			Puc on com.codcue=puc.codcue 
	where	Com.idemp=@strIdemp and year(fecdoc)>=@numAñoniif and com.estniif=0 and com.estcomp='' and com.docdelete=0
	
	--Actualizacion de estniif en comprobante 
	update	con_comprobante 
	set		estniif = 1
	from	con_comprobante as com1
			inner join (select	com.idemp, com.codcto, com.codtran, com.consec, com.codctodet, com.itemdoc, com.modificadoc
 						from	con_comprobante com 
								inner join glb_transaccion	Tra on com.codtran=Tra.codtran and tra.TipoNorma='A'
								inner join con_puc			Puc on com.codcue=puc.codcue 
						where	Com.idemp=@strIdemp and year(fecdoc)>=@numAñoniif and com.estniif=0 and com.estcomp='' and com.docdelete=0) as com2
						on  com1.idemp=com2.idemp and com1.codcto=com2.codcto and com1.codtran=com2.codtran and 
							com1.itemdoc=com1.itemdoc and com1.modificadoc=com2.modificadoc
END TRY

Begin Catch
	Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsg
End Catch 
GO


--actualiza cantidades de inventario segun kardex por fecha. In. Lis 31/03/2017
IF OBJECT_ID('db_SP_Alm_Inventario_UpdExist_Fecha','P') IS NOT NULL 
	DROP PROCEDURE db_SP_Alm_Inventario_UpdExist_Fecha
GO
CREATE PROCEDURE db_SP_Alm_Inventario_UpdExist_Fecha
	 	@pIdEmp	nvarchar(3), @pCentro nvarchar(3)= '', @pFecha date
AS
BEGIN
		update alm_inventario set  caninv= 0  where codcto=@pCentro

		UPDATE	alm_inventario 
		SET		alm_inventario.caninv  =  Vinv.cantidad
		FROM	alm_inventario as inv
				INNER JOIN FT_ALM_KARDEX_GETCANTIDAD(@pIdEmp,@pCentro,@pFecha)  as Vinv ON inv.idemp  = Vinv.idemp AND 
				inv.codcto = Vinv.codcto  and 
				inv.codart = Vinv.CODART where inv.codcto=@pCentro
END
GO

IF OBJECT_ID('db_SP_GLB_TOUCIMPRESORAS_VACIO','P') IS NOT NULL 
	DROP PROCEDURE db_SP_GLB_TOUCIMPRESORAS_VACIO
GO
CREATE PROCEDURE db_SP_GLB_TOUCIMPRESORAS_VACIO
	@pIdEmp		VARCHAR(3) = ''
	WITH RECOMPILE
AS
BEGIN
	insert into Glb_TouchImpresoras(idemp,codalm,ItemImp,RutaImpCocina)
	Select @pIdEmp,codalm,'01',rutimpcocina1  from glb_almacen 

	insert into Glb_TouchImpresoras(idemp,codalm,ItemImp,RutaImpCocina)
	Select @pIdEmp,codalm,'02',rutimpcocina2  from glb_almacen 

	insert into Glb_TouchImpresoras(idemp,codalm,ItemImp,RutaImpCocina)
	Select @pIdEmp,codalm,'03',rutimpcocina3  from glb_almacen 

	insert into Glb_TouchImpresoras(idemp,codalm,ItemImp,RutaImpCocina)
	Select @pIdEmp,codalm,'04',rutimpcocina4  from glb_almacen 

	update	alm_grupos 
	set		RutaImp = replicate ('0',(2 - len(rtrim(ltrim(rutaimp))))) + rtrim(ltrim(rutaimp))
	where	rutaimp!=''
	

END
GO

IF OBJECT_ID('SPG_ActConPoliticas','P') IS NOT NULL 
BEGIN
	DROP PROCEDURE SPG_ActConPoliticas
END
GO
CREATE PROCEDURE SPG_ActConPoliticas
	@pIdemp  nvarchar(3)='',		@pItem nvarchar(2)='',			@pTitulo nvarchar(100)='',		@pDetalle nvarchar(max)='',
    @pcodusu nvarchar(10)='',		@pOp int
AS
BEGIN Try 
	declare @existe	char(1),		@mNerror INT,		@mMsg    nvarchar(190),			@mLinea  int,
			@mAddMsg nvarchar(50),	@pVerMsgBox INT =0,	@mProc   char(20)
	
	select @existe ='N'
	select @mNerror=57021,@mLinea=0,@mAddMsg='' 
	set @mProc  ='SPG_ActConPoliticas'
   
	if exists (select * from Con_Politicas where Idemp=@pIdemp And item=@pItem)
      select @existe='S'
   
	if @pOp=1
		if @existe='N'
			insert into Con_Politicas(idemp, item, titulo, detalle, codusu)
			values(@pidemp, @pitem, @ptitulo, @pdetalle, @pcodusu)
    
	if @pOp=2 
		if @existe='S'
			update	Con_Politicas
			set		Titulo=@pTitulo,	Detalle=@pDetalle 
			where	Idemp=@pIdemp And Item=@pItem
   
   if @pOp=3 
		if @existe='S'
			delete from Con_Politicas 
			where Idemp=@pIdemp And Item=@pItem
END Try 

Begin catch
	set @mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
	Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch 

GO

IF OBJECT_ID('SPG_ActCopParametros','P') IS NOT NULL
	DROP PROCEDURE SPG_ActCopParametros
GO
CREATE PROCEDURE SPG_ActCopParametros
	@pIdemp				nvarchar(3)='',		@pPorSeguro			Decimal(10,5)=0,		@pPorSeguro75		decimal(10,5)=0,
	@pCtaxCGaranReal	nvarchar(8)='',		@pCtaxCGaranPer		nvarchar(8)='',			@pCtaxCSinGarantia	nvarchar(8)='',
	@pCtaSeguro			nVarchar(8)='',		@pCtaDesembolso		nVarchar(8)='',			@pPorAporte			decimal(10,5)=0,
	@pSalariomin		decimal(20,4)=0,	@pCtaIntIng			nVarchar(8)='',			@pCtaIntx2			nVarchar(8)='',
	@pCtaIntx3			nVarchar(8)='',		@pPorAporteJuri		decimal(10,5)=0,		@pCtaIntMora		nVarchar(8)='',
	@pCtaIntx4			nVarchar(8)='',		@pCtaIntx5			nVarchar(8)='',			@pCtaIntIngx3		nVarchar(8)='',
	@pCtaIntIngx4		nVarchar(8)='',		@pCtaIntIngx5		nVarchar(8)='',			@pPa 
	decimal(18,4),							@pPb				Decimal(18,4),			@pPc
	decimal(18,4),							@pPd				Decimal(18,4),			@pPe
	decimal(18,4)
AS 
BEGIN Try 
	declare @r		int ,			@mExiste char(1),				@mNerror char(3),			@mMsg    nvarchar(190),		
			@mLinea  int,			@mAddMsg nvarchar(50),			@pVerMsgBox int=0,			@mProc  char(20)
   
	select @r=0, @mExiste='N', @mNerror='021', @mLinea=0, @mAddMsg='' 
	set @mProc  ='SPG_ActCopParametros'        

	If exists (Select Idemp From cop_parametros where Idemp=@pIdemp)
	Begin 
		Update	cop_parametros 
		Set		PorSeguro=@pPorSeguro,					PorSeguro75=@pPorSeguro75,		CtaxCGaranReal=@pCtaxCGaranReal,		CtaxCGaranPer=@pCtaxCGaranPer,
				CtaxCSinGarantia=@pCtaxCSinGarantia,	ctaSeguro=@pCtaSeguro,			CtaDesembolso=@pCtaDesembolso,			poraporte= @pPorAporte,
				salariomin=@pSalariomin,				CtaIntIng=@pCtaIntIng,			CtaIntx2=@pCtaIntx2,					CtaIntx3=@pCtaIntx3,
				PorAporteJuri=@pPorAporteJuri,			CtaIntMora=@pCtaIntMora,		CtaIntx4=@pCtaIntx4,					CtaIntx5=@pCtaIntx5,
				CtaIntIngx3=@pCtaIntIngx3,				CtaIntIngx4=@pCtaIntIngx4,		CtaIntIngx5=@pCtaIntIngx5, pa = @pPa, pb = @pPb, pc = @pPc, pd = @pPd, pe = @pPe		
		Where	Idemp=@pIdemp
	End 
	Else 
	Begin 
		Insert Into cop_parametros(idemp, PorSeguro, PorSeguro75, CtaxcGaranReal, CtaxcGaranPer, CtaxCsinGarantia, ctaseguro, ctadesembolso, 
					poraporte,salariomin,CtaIntIng,CtaIntx2,CtaIntx3,PorAportejuri,ctaintmora,CtaIntx4,CtaIntx5,CtaIntIngx3,CtaIntIngx4,CtaIntIngx5,pa,pb,pc,pd,pe)
		Values (@pIdemp, @pPorSeguro, @pPorSeguro75, @pCtaxCGaranReal,@pCtaxCGaranPer, @pCtaxCSinGarantia, @pCtaSeguro, @pCtaDesembolso, @pPorAporte,					  
			@pSalariomin,@pCtaIntIng,@pCtaIntx2,@pCtaIntx3,@pPorAporteJuri,@pCtaIntMora,@pCtaIntx4,@pCtaIntx5,@pCtaIntIngx3,@pCtaIntIngx4,@pCtaIntIngx5,@pPa,@pPb,@pPc,@pPd,@pPe)		
   End  
END TRY
Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch 
GO

IF OBJECT_ID('dbo.db_Sp_Restruc_tabla','P') IS NOT NULL	DROP PROCEDURE db_Sp_Restruc_tabla
GO
CREATE PROCEDURE dbo.db_Sp_Restruc_tabla
	@Fecha		datetime,			@Tipo		nvarchar(2)='',		@esquema	nvarchar(20)='',	@NomTabla	nvarchar(100)='',		@NomCampo	nvarchar(200)='',	
	@TipoDato	nvarchar(50)='',	@Longitud	numeric(10)=0,		@VlrDefault	nvarchar(50)='',	@NomDefault	nvarchar(100)='',		@posdecimal	numeric(10) = 0	
AS
BEGIN TRY
	Declare @mAddMsg	nvarchar(230)='',	@pVerMsg	int=0,	@mProc		nvarchar(30)='db_Sp_Restruc_tabla'

	Insert Into Restruc_tabla (Fecha, Tipo, esquema, NomTabla, NomCampo, TipoDato, Longitud, VlrDefault, NomDefault, posdecimal)
	values (@Fecha, @Tipo, @esquema, @NomTabla, @NomCampo, @TipoDato, @Longitud, @VlrDefault, @NomDefault,@posdecimal) 

END TRY

Begin Catch 
   Set	@mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO

IF OBJECT_ID('dbo.db_SP_Restruc_Crear_Tablas','P') IS NOT NULL	DROP PROCEDURE db_SP_Restruc_Crear_Tablas
GO
CREATE PROCEDURE dbo.db_SP_Restruc_Crear_Tablas
AS
BEGIN Try 
	declare @r		int ,			@mExiste char(1),				@mNerror char(3),			@mMsg    nvarchar(190),		
			@mLinea  int,			@mAddMsg nvarchar(50),			@pVerMsg int=0,			@mProc  char(20)='db_SP_Restruc_Crear_Tablas'

	CREATE TABLE #tempo_arreglo
	(	
		estado		VARCHAR(100) NULL,
		tabla		VARCHAR(50) NULL,
		campo		VARCHAR(50) NULL,
		tipo		VARCHAR(50) NULL,
		longitud	VARCHAR(50) NULL,
		observacion VARCHAR(50) NULL
	) 

	INSERT INTO #tempo_arreglo 
	EXEC db_Sp_Restruc_Diagnostico

	DECLARE @estado VARCHAR(100), @tabla VARCHAR(100)
 
	DECLARE crear_tablas CURSOR FOR
	SELECT	estado,tabla 
	FROM	#tempo_arreglo  

	OPEN crear_tablas
	FETCH NEXT FROM crear_tablas   
	INTO @estado, @tabla
 
	WHILE(@@FETCH_STATUS=0) 
	BEGIN
		IF(@estado='TNE')
		BEGIN
			DECLARE @campo VARCHAR(100),@tipodato VARCHAR(100), @longitud VARCHAR(100)

			DECLARE vendor_cursor CURSOR FOR   
			SELECT	NomCampo,TipoDato,Longitud 
			FROM	Restruc_tabla
			where	NomTabla=@tabla

			OPEN vendor_cursor  
			FETCH NEXT FROM vendor_cursor   
			INTO @campo, @tipodato, @longitud

			DECLARE @sql NVARCHAR(MAX)
			SET @sql= 'CREATE TABLE dbo.'+@tabla+'('

			WHILE(@@FETCH_STATUS=0) 
			BEGIN	
				IF(@longitud=0 OR @tipodato='int')
				BEGIN
					SET @sql=@sql+@campo+' '+@tipodato+','
				END
				ELSE IF(@longitud=-1)
				BEGIN
					SET @sql=@sql+ @campo+' '+@tipodato+'(MAX),'
				END
				ELSE
				BEGIN
					SET @sql=@sql+ @campo+' '+@tipodato+'('+@longitud+'),'	
				END
				FETCH NEXT FROM vendor_cursor   
				INTO @campo, @tipodato, @longitud
			END
			CLOSE vendor_cursor
			DEALLOCATE vendor_cursor
			SET @sql=SUBSTRING ( @sql, 1, Len( @sql) - 1 )
			SET @sql=@sql+')'
			EXEC SP_EXECUTESQL @sql
		END
		FETCH NEXT FROM crear_tablas   
		INTO @estado, @tabla
	 END

	 CLOSE crear_tablas
	 DEALLOCATE crear_tablas
END TRY

Begin Catch 
   Set	@mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO

IF OBJECT_ID('dbo.db_Sp_Restruc_Diagnostico','P') IS NOT NULL	DROP PROCEDURE db_Sp_Restruc_Diagnostico
GO
CREATE PROC db_Sp_Restruc_Diagnostico
AS
BEGIN TRY
	Declare @mAddMsg	nvarchar(230)='',	@pVerMsg	int=0,	@mProc		nvarchar(30)='db_Sp_Restruc_Diagnostico'

	SELECT	'C' AS tipo 
			,t.TABLE_SCHEMA		AS esquema 
			, t.table_name		AS NomTabla
			, c.COLUMN_NAME		AS NomCampo
			, c.DATA_TYPE		AS TipoDato
			, IIF(c.CHARACTER_MAXIMUM_LENGTH IS NULL,IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_PRECISION ,0),c.CHARACTER_MAXIMUM_LENGTH)  AS						Longitud 
			, isnull(IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_SCALE,0),0) AS DECIMAL 
			, c.COLUMN_DEFAULT AS VlrDefault
			, df.name AS NomDefault
			INTO #tempo_estructura
	FROM	INFORMATION_SCHEMA.TABLES t
			INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c ON c.TABLE_NAME = t.TABLE_NAME
			INNER JOIN  sys.columns AS sc ON sc.object_id = object_id(t.TABLE_NAME,'U') AND sc.name = c.COLUMN_NAME
			LEFT JOIN sys.default_constraints AS df ON df.object_id = sc.default_object_id
	WHERE	TABLE_TYPE = 'BASE TABLE'

	CREATE TABLE #tempo_tablas_diagnostico
	(
		estado		VARCHAR(100) NULL,
		tabla		VARCHAR(50) NULL,
		campo		VARCHAR(50) NULL,
		tipo		VARCHAR(50) NULL,
		longitud	VARCHAR(50) NULL,
		observacion VARCHAR(50) NULL
	) 
		INSERT INTO #tempo_tablas_diagnostico(estado,tabla,observacion)
		SELECT 'TNE',NomTabla,'TABLA NO EXISTE'
		FROM	Restruc_tabla
		WHERE	NomTabla NOT IN (SELECT NomTabla FROM #tempo_estructura)
				GROUP BY NomTabla

		INSERT INTO #tempo_tablas_diagnostico(estado,tabla,campo,observacion)
		SELECT 'CNE',NomTabla,NomCampo,'CAMPO NO EXISTE'
		FROM	Restruc_tabla
		WHERE	CONCAT(NomTabla,NomCampo) NOT IN (SELECT CONCAT(NomTabla,NomCampo) 
		FROM	#tempo_estructura) and 
				NomTabla IN (SELECT NomTabla FROM #tempo_estructura)
				ORDER BY NomTabla

		INSERT INTO #tempo_tablas_diagnostico(estado,tabla,campo,tipo,observacion)
		SELECT	'CDT',NomTabla,NomCampo,TipoDato,'EL TIPO DE DATO NO COINCIDE CON LA TABLA REESTRUCT'
		FROM	Restruc_tabla
		WHERE	CONCAT(NomTabla,NomCampo,TipoDato) 
					NOT IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato) FROM #tempo_estructura) and 
				CONCAT(NomTabla,NomCampo) IN (SELECT CONCAT(NomTabla,NomCampo) FROM #tempo_estructura)
				ORDER BY NomTabla

		INSERT INTO #tempo_tablas_diagnostico(estado,tabla,campo,tipo,longitud,observacion)
		SELECT 'CDL',NomTabla,NomCampo,TipoDato,Longitud,'LA LONGITUD NO COINCIDE CON LA TABLA REESTRUCT'
		FROM	Restruc_tabla
		WHERE	CONCAT(NomTabla,NomCampo,TipoDato,Longitud) 
					NOT IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato,Longitud) FROM #tempo_estructura) and 
				CONCAT(NomTabla,NomCampo,TipoDato) IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato) FROM #tempo_estructura)ORDER BY NomTabla
		
		select * from #tempo_tablas_diagnostico	
END TRY
Begin Catch 
   Set	@mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
GO

IF OBJECT_ID('dbo.db_Sp_Restruc_BD','P') IS NOT NULL	DROP PROCEDURE db_Sp_Restruc_BD
GO
CREATE PROCEDURE   db_Sp_Restruc_BD
AS
BEGIN TRY
	Declare @mAddMsg	nvarchar(230)='',	@pVerMsg	int=0,	@mProc		nvarchar(30)='db_Sp_Restruc_BD'

	CREATE TABLE #tempo_arreglo
	(	
		estado		VARCHAR(100) NULL,
		tabla		VARCHAR(50) NULL,
		campo		VARCHAR(50) NULL,
		tipo		VARCHAR(50) NULL,
		longitud	VARCHAR(50) NULL,
		observacion	VARCHAR(50) NULL
	) 

	INSERT INTO #tempo_arreglo 
	EXEC db_Sp_Restruc_Diagnostico

	IF EXISTS(SELECT estado FROM #tempo_arreglo WHERE estado='TNE')
	BEGIN
		EXECUTE db_SP_Restruc_Crear_Tablas
	END
	ELSE
	BEGIN
		PRINT 'TABLAS ACYUALIZADAS'
	END	

END TRY

Begin Catch 
   Set	@mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
go 

IF OBJECT_ID('db_sp_Restruct_DiagnosticoCreacionModificacion','P') IS NOT NULL  
	DROP PROCEDURE db_sp_Restruct_DiagnosticoCreacionModificacion
GO
CREATE PROC db_sp_Restruct_DiagnosticoCreacionModificacion
AS
	SELECT	 'C' AS tipo 
			,t.TABLE_SCHEMA		AS esquema 
			, t.table_name		AS NomTabla
			, c.COLUMN_NAME		AS NomCampo
			, c.DATA_TYPE		AS TipoDato
			, IIF(c.CHARACTER_MAXIMUM_LENGTH IS NULL,IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_PRECISION ,0),c.CHARACTER_MAXIMUM_LENGTH)	AS		Longitud 
			, isnull(IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_SCALE,0),0) AS DECIMAL 
			, c.COLUMN_DEFAULT AS VlrDefault
			, df.name AS NomDefault
			INTO #tempEstructura
			FROM	INFORMATION_SCHEMA.TABLES t
			INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c ON c.TABLE_NAME = t.TABLE_NAME
			INNER JOIN  sys.columns AS sc ON sc.object_id = object_id(t.TABLE_NAME,'U') AND sc.name = c.COLUMN_NAME
			LEFT JOIN sys.default_constraints AS df ON df.object_id = sc.default_object_id
			WHERE	TABLE_TYPE = 'BASE TABLE'
			IF OBJECT_ID(N'tempdb.dbo.##tempDiagnostico', N'U') IS NOT NULL
			BEGIN
				DROP TABLE ##tempDiagnostico
			END
	
			CREATE TABLE ##tempDiagnostico
			(
				estado VARCHAR(100) NULL,
				tabla VARCHAR(50) NULL,
				campo VARCHAR(50) NULL,
				tipo VARCHAR(50) NULL,
				longitud VARCHAR(50) NULL,
				observacion VARCHAR(50) NULL
			) 
			INSERT INTO ##tempDiagnostico(estado,tabla,observacion)
			SELECT 'TNE',NomTabla,'TABLA NO EXISTE'
				FROM dbo.Restruc_tabla 
				WHERE NomTabla NOT IN (SELECT NomTabla FROM #tempEstructura)
					GROUP BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,observacion)
			SELECT 'CNE',NomTabla,NomCampo,TipoDato,Longitud,'CAMPO NO EXISTE'
				FROM dbo.Restruc_tabla 
				WHERE CONCAT(NomTabla,NomCampo) NOT IN (SELECT CONCAT(NomTabla,NomCampo) 
					FROM #tempEstructura) and 
					NomTabla IN (SELECT NomTabla FROM #tempEstructura)
						ORDER BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,observacion)
			SELECT 'CDT',NomTabla,NomCampo,TipoDato,Longitud,'EL TIPO DE DATO NO COINCIDE CON LA TABLA REESTRUCT'
				FROM dbo.Restruc_tabla 
				WHERE CONCAT(NomTabla,NomCampo,TipoDato) 
				NOT IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato) 
					FROM #tempEstructura) and 
					CONCAT(NomTabla,NomCampo) 
					IN (SELECT CONCAT(NomTabla,NomCampo) FROM #tempEstructura)ORDER BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,observacion)
			SELECT 'CDL',NomTabla,NomCampo,TipoDato,Longitud,'LA LONGITUD NO COINCIDE CON LA TABLA REESTRUCT'
				FROM dbo.Restruc_tabla 
				WHERE CONCAT(NomTabla,NomCampo,TipoDato,Longitud) 
				NOT IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato,Longitud) 
					FROM #tempEstructura) and 
					CONCAT(NomTabla,NomCampo,TipoDato) 
					IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato) 
						FROM #tempEstructura)ORDER BY NomTabla
	/*CREAR TABLAS*/
	DECLARE @estado VARCHAR(100), @tabla VARCHAR(100)
	DECLARE curCrearTablas CURSOR FOR
		SELECT estado,tabla 
		FROM ##tempDiagnostico
	OPEN curCrearTablas
		FETCH NEXT FROM curCrearTablas   
		INTO @estado, @tabla
	WHILE(@@FETCH_STATUS=0) 
	BEGIN
		IF(@estado='TNE')
		BEGIN
			DECLARE @campo VARCHAR(100),@tipodato VARCHAR(100), @longitud VARCHAR(100)
			DECLARE curCompararBdNueva CURSOR FOR   
				SELECT NomCampo,TipoDato,Longitud 
				FROM dbo.Restruc_tabla 
					WHERE NomTabla=@tabla
			OPEN curCompararBdNueva  
			FETCH NEXT FROM curCompararBdNueva   
				INTO @campo, @tipodato, @longitud
			DECLARE @sql NVARCHAR(MAX)
			SET @sql= 'CREATE TABLE dbo.'+@tabla+'('
			WHILE(@@FETCH_STATUS=0) 
			BEGIN	
				IF(@longitud=0 OR @tipodato='int')
				BEGIN
					SET @sql=@sql+'['+@campo+'] '+@tipodato+','
				END
				ELSE IF(@longitud=-1)
				BEGIN
					SET @sql=@sql+'['+@campo+'] '+@tipodato+'(MAX),'
				END
				ELSE
				BEGIN
					SET @sql=@sql+'['+@campo+'] '+@tipodato+'('+@longitud+'),'	
				END
				FETCH NEXT FROM curCompararBdNueva   
					INTO @campo, @tipodato, @longitud
			END
			CLOSE curCompararBdNueva
			DEALLOCATE curCompararBdNueva
			SET @sql=SUBSTRING ( @sql, 1, Len( @sql) - 1 )
			SET @sql=@sql+')'
			EXEC SP_EXECUTESQL @sql
		END
		FETCH NEXT FROM curCrearTablas   
			INTO @estado, @tabla
	 END
	 CLOSE		curCrearTablas
	 DEALLOCATE curCrearTablas
	 /*CREAR CAMPOS*/
	DECLARE curCrearCampos CURSOR FOR
		SELECT	estado,tabla,campo,tipo,longitud
		FROM	##tempDiagnostico
	OPEN curCrearCampos
	FETCH NEXT FROM curCrearCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud
	WHILE(@@FETCH_STATUS=0) 
	BEGIN
		IF(@estado='CNE')
		BEGIN		
			IF(@longitud=0 OR @tipodato='int')
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ADD ['+@campo+'] '+@tipodato+';' 
				EXEC SP_EXECUTESQL @sql
			END
			ELSE IF(@longitud=-1)
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ADD ['+@campo+'] '+@tipodato+'(MAX);' 
				EXEC SP_EXECUTESQL @sql
			END
			ELSE
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ADD ['+@campo+'] '+@tipodato+'('+@longitud+');' 
				EXEC SP_EXECUTESQL @sql
			END	
		END
		FETCH NEXT FROM curCrearCampos   
			INTO @estado, @tabla, @campo, @tipodato, @longitud
	 END
	 CLOSE curCrearCampos
	 DEALLOCATE curCrearCampos
	 /*DIAGNOSTICO DE CAMPOS*/
	IF OBJECT_ID(N'tempdb.dbo.##tempConstraint', N'U') IS NOT NULL
	BEGIN
		DROP TABLE ##tempConstraint
	END
	CREATE TABLE ##tempConstraint(
		nomtabla	VARCHAR(100),
		nomcampo	VARCHAR(100),
		tipodato	VARCHAR(100),
		longitud	VARCHAR(100),
		nomconst	VARCHAR(100),
		tipo		VARCHAR(100)
	)
	DECLARE curAlterarCampos CURSOR FOR
		SELECT estado,tabla,campo,tipo,longitud
		FROM ##tempDiagnostico
	OPEN curAlterarCampos
	FETCH NEXT FROM curAlterarCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud
	WHILE(@@FETCH_STATUS=0) 
	BEGIN	
		IF(@estado='CDT' OR @estado='CDL')
		BEGIN
			IF EXISTS(SELECT sco.name AS csql
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@tabla AND tc.name=@campo)
			BEGIN
				INSERT INTO ##tempConstraint
				(nomtabla,nomcampo,tipodato,longitud,nomconst,tipo)
				SELECT tb.name,tc.name,@tipodato,@longitud, sco.name,sco.type_desc
				FROM   sys.Objects tb
					INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
					INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
					INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
					WHERE tb.name=@tabla AND tc.name=@campo
			END
			IF EXISTS(SELECT ind.name 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@tabla AND cols.name=@campo)
			BEGIN
				INSERT INTO ##tempConstraint
				(nomtabla,nomcampo,tipodato,longitud,nomconst,tipo)
				SELECT @tabla,cols.name,@tipodato,@longitud,ind.name,ind.type_desc
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@tabla AND cols.name=@campo
			END
		END
		FETCH NEXT FROM curAlterarCampos   
			INTO @estado, @tabla, @campo, @tipodato, @longitud	
	END
	CLOSE		curAlterarCampos
	DEALLOCATE	curAlterarCampos
	/*ELIMINAR RESTRICCIONES DE CAMPOS*/
	DECLARE @nomtabla VARCHAR(100)
	DECLARE @nomcampo VARCHAR(100)
	DECLARE @nomconst VARCHAR(100)
	DECLARE @tipo	  VARCHAR(100)
	DECLARE curEliminarEstructura CURSOR FOR
		SELECT nomtabla,nomcampo,tipodato,longitud,nomconst,tipo
		FROM ##tempConstraint 
	OPEN curEliminarEstructura
	FETCH NEXT FROM curEliminarEstructura 
		INTO @nomtabla,@nomcampo,@tipodato,@longitud,@nomconst,@tipo
	WHILE(@@FETCH_STATUS=0)
	BEGIN
		IF(@tipo='DEFAULT_CONSTRAINT')
		BEGIN
			IF EXISTS(SELECT sco.name AS csql
				FROM   sys.Objects tb
				INNER JOIN sys.Columns tc ON (tb.Object_id = tc.object_id)
				INNER JOIN sys.sysconstraints sc ON (tc.Object_ID = sc.id and tc.column_id = sc.colid)
				INNER JOIN sys.objects sco ON (sc.Constid = sco.object_id)
				WHERE tb.name=@nomtabla AND tc.name=@nomcampo)
			BEGIN
				SET @sql='ALTER TABLE dbo.'+@nomtabla+' DROP CONSTRAINT '+@nomconst+';'	
				EXEC SP_EXECUTESQL @sql
			END
		END
		ELSE IF(@tipo='NONCLUSTERED')
		BEGIN
			IF EXISTS(SELECT ind.name 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@nomtabla AND cols.name=@nomcampo)
			BEGIN
				SET @sql='DROP INDEX '+@nomconst+' ON dbo.'+@nomtabla+';'
				EXEC SP_EXECUTESQL @sql
			END
		END
		ELSE IF(@tipo='CLUSTERED')
		BEGIN
			IF EXISTS(SELECT ind.name 
				FROM	sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
				where	cols.object_id = ind.object_id and cols.object_id = ind_cols.object_id and 
				cols.column_id = ind_cols.column_id and ind.index_id = ind_cols.index_id and 
				object_name(cols.object_id) =@nomtabla AND cols.name=@nomcampo)
			BEGIN
				SET @sql='ALTER TABLE dbo.'+@nomtabla+' DROP CONSTRAINT '+@nomconst+';'
				EXEC SP_EXECUTESQL @sql
			END
		END	
		FETCH NEXT FROM curEliminarEstructura 
			INTO @nomtabla,@nomcampo,@tipodato,@longitud,@nomconst,@tipo
	END
	CLOSE	   curEliminarEstructura
	DEALLOCATE curEliminarEstructura
	/*ALTERAR CAMPOS*/
	DECLARE curAlterarCampos CURSOR FOR
		SELECT	estado,tabla,campo,tipo,longitud
		FROM	##tempDiagnostico	
	OPEN curAlterarCampos
	FETCH NEXT FROM curAlterarCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud
	WHILE(@@FETCH_STATUS=0) 
	BEGIN	
		IF(@estado='CDT' OR @estado='CDL')
		BEGIN
			IF(@longitud=0 OR @tipodato='int')
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ALTER COLUMN '+@campo+' '+@tipodato+';' 
				EXEC SP_EXECUTESQL @sql
			END
			ELSE IF(@longitud=-1)
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ALTER COLUMN '+@campo+' '+@tipodato+'(MAX);' 
				EXEC SP_EXECUTESQL @sql
			END
			ELSE
			BEGIN
				SET @sql= 'ALTER TABLE dbo.'+@tabla+' ALTER COLUMN '+@campo+' '+@tipodato+'('+@longitud+');' 
				EXEC SP_EXECUTESQL @sql
			END
		END
		FETCH NEXT FROM curAlterarCampos   
		INTO @estado, @tabla, @campo, @tipodato, @longitud	
	END
	CLOSE curAlterarCampos
	DEALLOCATE curAlterarCampos	

	SELECT * FROM ##tempDiagnostico	
	
GO

IF OBJECT_ID('db_SP_Diagnostico_Estructuras_BD','P')IS NOT NULL  
	DROP PROCEDURE db_SP_Diagnostico_Estructuras_BD
GO
CREATE PROC db_SP_Diagnostico_Estructuras_BD
AS
	SELECT	 'C' AS tipo 
			,t.TABLE_SCHEMA		AS esquema 
			, t.table_name		AS NomTabla
			, c.COLUMN_NAME		AS NomCampo
			, c.DATA_TYPE		AS TipoDato
			, IIF(c.CHARACTER_MAXIMUM_LENGTH IS NULL,IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_PRECISION ,0),c.CHARACTER_MAXIMUM_LENGTH)  AS						Longitud 
			, isnull(IIF(c.NUMERIC_PRECISION>0,c.NUMERIC_SCALE,0),0) AS DECIMAL 
			, c.COLUMN_DEFAULT AS VlrDefault
			, df.name AS NomDefault
			INTO #tempEstructura
			FROM	INFORMATION_SCHEMA.TABLES t
			INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c ON c.TABLE_NAME = t.TABLE_NAME
			INNER JOIN  sys.columns AS sc ON sc.object_id = object_id(t.TABLE_NAME,'U') AND sc.name = c.COLUMN_NAME
			LEFT JOIN sys.default_constraints AS df ON df.object_id = sc.default_object_id
			WHERE	TABLE_TYPE = 'BASE TABLE'
			IF OBJECT_ID(N'tempdb.dbo.##tempDiagnostico', N'U') IS NOT NULL
			BEGIN
				DROP TABLE ##tempDiagnostico
			END
	
			CREATE TABLE ##tempDiagnostico
			(
				estado VARCHAR(100) NULL,
				tabla VARCHAR(50) NULL,
				campo VARCHAR(50) NULL,
				tipo VARCHAR(50) NULL,
				longitud VARCHAR(50) NULL,
				observacion VARCHAR(50) NULL
			) 
			INSERT INTO ##tempDiagnostico(estado,tabla,observacion)
			SELECT 'TNE',NomTabla,'TABLA NO EXISTE'
				FROM dbo.Restruc_tabla 
				WHERE NomTabla NOT IN (SELECT NomTabla FROM #tempEstructura)
					GROUP BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,observacion)
			SELECT 'CNE',NomTabla,NomCampo,TipoDato,Longitud,'CAMPO NO EXISTE'
				FROM dbo.Restruc_tabla 
				WHERE CONCAT(NomTabla,NomCampo) NOT IN (SELECT CONCAT(NomTabla,NomCampo) 
					FROM #tempEstructura) and 
					NomTabla IN (SELECT NomTabla FROM #tempEstructura)
						ORDER BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,observacion)
			SELECT 'CDT',NomTabla,NomCampo,TipoDato,Longitud,'EL TIPO DE DATO NO COINCIDE CON LA TABLA REESTRUCT'
				FROM dbo.Restruc_tabla 
				WHERE CONCAT(NomTabla,NomCampo,TipoDato) 
				NOT IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato) 
					FROM #tempEstructura) and 
					CONCAT(NomTabla,NomCampo) 
					IN (SELECT CONCAT(NomTabla,NomCampo) FROM #tempEstructura)ORDER BY NomTabla
			INSERT INTO ##tempDiagnostico(estado,tabla,campo,tipo,longitud,observacion)
			SELECT 'CDL',NomTabla,NomCampo,TipoDato,Longitud,'LA LONGITUD NO COINCIDE CON LA TABLA REESTRUCT'
				FROM dbo.Restruc_tabla 
				WHERE CONCAT(NomTabla,NomCampo,TipoDato,Longitud) 
				NOT IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato,Longitud) 
					FROM #tempEstructura) and 
					CONCAT(NomTabla,NomCampo,TipoDato) 
					IN (SELECT CONCAT(NomTabla,NomCampo,TipoDato) 
						FROM #tempEstructura)ORDER BY NomTabla
			SELECT * FROM ##tempDiagnostico	
GO
--EXECUTE db_SP_Diagnostico_Estructuras_BD

		

IF OBJECT_ID('SPG_ActTerceros_Codeudor','P') IS NOT NULL		DROP PROCEDURE SPG_ActTerceros_Codeudor
GO
CREATE PROCEDURE SPG_ActTerceros_Codeudor
	@ptipid 		nVarChar(2)='0',		@pnitter		nVarChar(15)='',		@pdivter	nVarChar(1)='',
	@pnomter		nVarChar(60)='', 		@pNomcom 		nvarchar(200)='',		
	@ptipter		Decimal(1,0)=0,			@pTerinactivo	Bit=0,					@pterotr		Bit=0,					
	@pteremp		Bit=0,					@pCodeudor 		Bit=0, 
	@papellido1		nVarChar(70)='', 		@papellido2		nVarChar(70)='',		@pnombre1 	nVarChar(70)='',
	@potros 		nVarChar(70)='',		@pcontacto		nVarChar(60)='',		@pdirter	nVarChar(60)='',
	@pdirter2		nVarChar(60)='',		@ptelter		Decimal(15,0)=0,		@pcelular	 nVarChar(20)='',
	@pfax			Decimal(15,0)=0,		@ptelter2 		Decimal(15,0)=0,		@pbarrio	nVarChar(3)='',	
	@pmail			nVarChar(60)='', 		@pweb			nVarChar(60)='',		@pdptoter 	nVarChar(2)='',	
	@pciuter		nVarChar(20)='',		@pcodpais		nVarChar(3)='0',		@pFecnac	nVarChar(10)='', 
	@psexo			Decimal(1,0)=0,			@pdescrip		nVarChar(150)='', 
	@pOcupaemp		nVarchar(50)='', 		@pcodest		nVarChar(3)='',			@pnit_empresa	nVarChar(15)='',
	@pNombreemp		nVarchar(50)='',		@pdiremp 		nVarChar(60)='',		@ptelemp 	nVarChar(20)='',
	@pinicio_labora	nVarChar(10)='',		@psueldo 		Decimal(10,0)=0, 
	@phijos 		Decimal(2,0)=0, 		@Proc 			int=0,					@pdptoemp	nVarchar(2)='',
	@pCiuemp		nVarchar(20)='',		@pPaisemp		nVarChar(3)=''

AS
BEGIN TRY
	Declare @existe	Char(1), @mNerror Int, @mMsg nVarChar(190), @mLinea int, @mAddMsg nVarChar(50),	@mProc char(20), @pVerMsgBox int=0,
			@mFecnac		Date = Convert(Date,@pFecnac),
			@mInicio_labora Date = Convert(Date,@pInicio_labora)

	Select @existe ='N',@mNerror = 7021, @mLinea=0, @mAddMsg='', @mProc='SPG_ActTerceros_Codeudor'

	If Exists (Select nitter,nomter From Glb_Terceros Where nitter=@pNitter)
		Select @existe='S'

	If @proc=1
	begin 
		If @existe='N'
		begin
			Insert into Glb_Terceros (	tipid,				nitter,				divter,				nomter,				Nomcom,		
					tipter,				Terinactivo,		terotr,				teremp,				Codeudor, 			apellido1,		
					apellido2,			nombre1, 			otros,				contacto,			dirter,				dirter2,		
					telter,				celular,			fax,				telter2, 			barrio,				mail,			
					web,				dptoter, 			ciuter,				codpais,			Fecnac,				sexo,			
					descrip,			Ocupaemp,			codest,				nit_empresa,		Nombreemp,			diremp, 		
					telemp, 			inicio_labora,		sueldo, 			hijos,				dptoemp,			Ciuemp,		
					Paisemp) 		
			Values (@ptipid,			@pnitter,			@pdivter,			@pnomter,			@pNomcom,		
					@ptipter,			@pTerinactivo,		@pterotr,			@pteremp,			@pCodeudor, 		@papellido1,		
					@papellido2,		@pnombre1, 			@potros,			@pcontacto,			@pdirter,			@pdirter2,		
					@ptelter,			@pcelular,			@pfax,				@ptelter2, 			@pbarrio,			@pmail,			
					@pweb,				@pdptoter, 			@pciuter,			@pcodpais,			@pFecnac,			@psexo,			
					@pdescrip,			@pOcupaemp,			@pcodest,			@pnit_empresa,		@pNombreemp,		@pdiremp, 		
					@ptelemp, 			@pinicio_labora,	@psueldo, 			@phijos,			@pdptoemp,			@pCiuemp,		
					@pPaisemp) 		
		end 
	end     
  
	if @proc=2 
	begin
		if @existe='S'
		begin
		Update	Glb_Terceros 
		Set		tipid		=@ptipid,			divter			=@pdivter,				nomter		=@pnomter,			Nomcom		=@pNomcom,		
				tipter		=@ptipter,			Terinactivo		=@pTerinactivo,			terotr		=@pterotr,			teremp		=@pteremp,				
				Codeudor	=@pCodeudor, 		apellido1		=@papellido1,			apellido2	=@papellido2,		nombre1		=@pnombre1, 			
				otros		=@potros,			contacto		=@pcontacto,			dirter		=@pdirter,			dirter2		=@pdirter2,		
				telter		=@ptelter,			celular			=@pcelular,				fax			=@pfax,				telter2		=@ptelter2, 			
				barrio		=@pbarrio,			mail			=@pmail,				web			=@pweb,				dptoter		=@pdptoter, 			
				ciuter		=@pciuter,			codpais			=@pcodpais,				Fecnac		=@pFecnac,			sexo		=@psexo,			
				descrip		=@pdescrip,			Ocupaemp		=@pOcupaemp,			codest		=@pcodest,			nit_empresa	=@pnit_empresa,	
				Nombreemp	=@pNombreemp,		diremp			=@pdiremp, 				telemp		=@ptelemp, 			inicio_labora=@pinicio_labora,		
				sueldo		=@psueldo, 			hijos			=@phijos,				dptoemp		=@pdptoemp,			Ciuemp		=@pCiuemp,		
				Paisemp		=@pPaisemp 		
        where nitter=@pNitter
		end
	end

	if @proc=3
		If @existe='S'
			Delete From Glb_Terceros Where nitter=@pNitter

END TRY 

Begin Catch
  Set @mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
  Exec SPG_MensajeSql @mAddMsg, @pVerMsgBox
End Catch
GO

IF OBJECT_ID('dbo.SP_devolverclave','P') IS NOT NULL	DROP PROCEDURE SP_devolverclave
GO
CREATE PROCEDURE   SP_devolverclave
@usuario nvarchar (50),
@clave	 nvarchar (30)
AS
BEGIN TRY

	Declare @mAddMsg	nvarchar(230)='',	@pVerMsg	int=0,	@mProc		nvarchar(30)='SP_devolverclave'
   declare @usuarioclave nvarchar(80)
   declare @clavenet varbinary(max)

   SET @clavenet = (SELECT Convert(varbinary(max), clausunet, 1) FROM glb_usuarios
   Where codusu = @usuario)

   SET @usuarioclave = @usuario + @clave  
   SELECT dbo.FE_ObtenerClave(@usuarioclave,@clavenet)

END TRY 
Begin Catch 
   Set	@mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
go 

-----

IF OBJECT_ID('dbo.SP_devolverclave_dcto','P') IS NOT NULL	DROP PROCEDURE SP_devolverclave_dcto
GO
CREATE PROCEDURE   SP_devolverclave_dcto
@usuario nvarchar (50),
@clave	 nvarchar (30),
@idemp	 nvarchar (3)

AS
BEGIN TRY

	Declare @mAddMsg	nvarchar(230)='',	@pVerMsg	int=0,	@mProc		nvarchar(30)='SP_devolverclave'
   declare @usuarioclave nvarchar(80)
   declare @clavenet varbinary(max)

   SET @clavenet = (SELECT Convert(varbinary(max), passdctos, 1) FROM ven_parametros2
   Where idemp = @idemp)

   SET @usuarioclave = @usuario + @clave  
   SELECT dbo.FE_ObtenerClave(@usuarioclave,@clavenet)

END TRY 
Begin Catch 
   Set	@mAddMsg = IIF(ERROR_PROCEDURE() IS NULL, @mProc+' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg, @pVerMsg
End Catch
go 
