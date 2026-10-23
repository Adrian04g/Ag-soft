IF EXISTS(SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='com_facturas' AND CONSTRAINT_NAME LIKE 'PK%')
BEGIN
	DECLARE @NOMBRE nvarchar(100);
	SET @NOMBRE = (SELECT CONSTRAINT_NAME
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='com_facturas' AND CONSTRAINT_NAME LIKE 'PK%')
	EXEC('ALTER TABLE com_facturas DROP CONSTRAINT ' + @NOMBRE)
END
GO


--- este se debe reemplazar por el actual 
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
	@pFecAnul	 nvarchar(10) ='',	 @pItem			numeric(10)=0 , @pModificadoc Numeric(6)=0
AS
BEGIN TRY
	Declare @mExiste char(1),		@mNerror int,		@mMsg nvarchar(190),	@mLinea  int,
			@mAddMsg nvarchar(50),	@mProc   char(20),	@mFecfac date,			@mVenfac date,
			@pVerMsgBox int = 0,	@mFecanul date,		@mItemDoc	numeric(5)
	
	Select	@mExiste ='N',		@mNerror=57021,		@mLinea=0,		@mProc ='Com_Sp_ActFacturaProveedor',		@mAddMsg=' ',
			@mFecfac = convert(date,@pFecfac),		@mVenfac = convert(date,@pVenfac),			@mFecAnul = convert(date,@pFecAnul)

	
	If @pProc = 3 --Eliminar Resgistro
	Begin
		---- solo cambio esto los update por los delete 
		
		update	Con_Comprobante 
		set		DocDelete = 1
		WHERE	idemp=@pIdemp And codcto=@pcodcto And codtran=@pTipfac And RIGHT(consec,8)=@pNumfac and docdelete=0
		
		Update	Alm_Kardex 
		set		DocDelete = 1
		WHERE	Idemp=@pIdemp And codcon=@pTipfac And codcto=@pCodcto And numcon=@pNumfac and docdelete=0

		Update	Com_Facdescuentos 
		set		DocDelete = 1
		WHERE	idemp=@pIdemp And codcto=@pCodcto And numdoc=@pNumfac And tippag = @pTipfac and docdelete=0

		Update	Com_Facdetremi 
		set		DocDelete = 1
		WHERE	 idemp=@pIdemp And codcto=@pCodcto And numfac=@pNumfac And tipfac=@pTipfac and docdelete=0
		
		Update	Com_Movpro 
		set		DocDelete = 1
		WHERE	idemp=@pIdemp And Codcto=@pCodcto And Doccom=@pNumfac And tipdoc=@pTipfac and docdelete=0
		
		Update	Com_Facdetalle 
		set		DocDelete = 1
		WHERE	idemp=@pIdemp And codcto=@pCodcto And numfac=@pNumfac And tipfac=@pTipfac and docdelete=0
		
		Update	com_facturas  
		set		DocDelete = 1
		WHERE	idemp=@pIdemp And codcto=@pCodcto And numfac=@pNumfac And tipfac=@pTipfac and docdelete=0
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
					Where  Idemp=@pIdemp And CodCto=@pCodcto And TipFac=@pTipfac And Numfac=@pNumfac and docdelete=0)
	     UPDATE com_facturas 
		 SET	EstFac='A' 
		 WHERE	Idemp=@pIdemp And CodCto=@pCodcto And TipFac=@pTipfac And Numfac=@pNumfac and docdelete=0
	
	If Exists(	Select TIPDOC,CODCTO,DOCCOM 
	            From   Com_movpro 
				Where  idemp=@pIdemp And TIPDOC=@pTipfac And CODCTO=@pCodcto And DOCCOM=@pNumfac and docdelete=0 )
	Begin 
		If @pAnufac = 0
		Begin 
			Insert Into com_movpro(idemp,CodCto,TipDoc,DocCom,FecCom,NitPro,Afecen,AfeTip,Afedoc,DebCom,Codusu,item)
		    select	idemp,CodCto,@pTipfacA as TipDoc,DocCom,@mFecAnul as FecCom,NitPro,Afecen,TipDoc as AfeTip,
					DocCom as Afedoc,CreCom as DebCom,@pCodusu as Codusu,@pItem
		    From	com_movpro 
		    Where	idemp=@pIdemp And TIPDOC=@pTipfac And CODCTO=@pCodcto And DOCCOM=@pNumfac and docdelete=0
		End 
		Else 
			Update	com_movpro 
			Set		Estmov='A' 
			Where	idemp=@pIdemp And TIPDOC=@pTipfac And CODCTO=@pCodcto And DOCCOM=@pNumfac and docdelete=0
		End 
	End 
End TRY

Begin Catch
   set	@mAddMsg = iif(ERROR_PROCEDURE()  is null , @mProc+ ' '+@mAddMsg,@mAddMsg)
   Exec SPG_MensajeSql @mAddMsg , @pVerMsgBox 
End Catch  
GO
