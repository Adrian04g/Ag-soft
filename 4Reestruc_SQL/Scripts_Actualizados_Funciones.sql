IF Exists (Select name From SysObjects Where name = 'FE_ObtenerClave') 
	DROP FUNCTION FE_ObtenerClave
GO

CREATE FUNCTION FE_ObtenerClave
(
	@ll		 nvarchar (45)
	,@mClave varbinary(8000)
)
RETURNS nvarchar(45)
AS
BEGIN
	DECLARE  @pass AS nvarchar(45)
	SET		 @pass = DECRYPTBYPASSPHRASE(@ll, @mClave)
	RETURN	 @pass
END
GO

-----------------------------------------------------------------------------------------------------------------------
IF Exists (Select name From SysObjects Where name = 'Fe_ItemComp')	DROP FUNCTION Fe_ItemComp
GO
CREATE FUNCTION Fe_ItemComp
(	@pIdEMp   nVarChar(3)
	,@pConCto  nVarchar(3)
	,@pCodtran nvarchar(2)
	,@pConsec  nVarChar(16)
)

RETURNS Numeric(6)
AS
BEGIN
	Declare @mItemDoc Numeric(6)

	Select	@mItemDoc = Max(itemdoc) + 1
	From	Con_Comprobante
	Where	idemp=@pidEmp AND codcto=@pConCto AND codtran=@pCodtran AND consec=@pConsec and docdelete=0

	RETURN @mItemDoc 
END
Go 

-----------------------------------------------------------------------------------------------------------------------
IF Exists (Select name From SysObjects Where name = 'Fe_ItemCompNIIF')	DROP FUNCTION Fe_ItemCompNIIF
GO
CREATE FUNCTION Fe_ItemCompNIIF
(	 @pIdemp   nVarChar(3)
	,@pCodCto  nVarchar(3)
	,@pCodtran nvarchar(2)
	,@pConsec  nVarChar(16)
)
RETURNS Numeric(6)
AS
BEGIN
	Declare @mItemDoc Numeric(6)

	Select	@mItemDoc = Max(itemdoc) + 1
	From	Con_ComproNIIF
	Where	idemp=@pidEmp AND codcto=@pCodCto AND codtran=@pCodtran AND consec=@pConsec

	RETURN @mItemDoc 
END
Go 


IF Exists (Select name From SysObjects Where name = 'FT_ALM_KARDEX_GETCANTIDAD') 
	DROP FUNCTION FT_ALM_KARDEX_GETCANTIDAD
GO
CREATE FUNCTION FT_ALM_KARDEX_GETCANTIDAD
(
	 @pIdEMp   nVarchar(3)
	,@pCodCto  nVarchar(3)
	,@pFecMov  date
)
RETURNS TABLE 
AS
	return(
		SELECT		kar.idemp
					,kar.codcto
					,kar.codart 
					,ARt.NomARt
					,Art.Undart 
					,Inv.caninv
					,SUM((CASE tra.tipcon WHEN 'E' THEN kar.qtyart WHEN 'S' THEN kar.qtyart * - 1 END)) AS cantidad
		FROM		Alm_kardex AS kar  
					INNER JOIN glb_transaccion	AS tra ON kar.codcon = tra.codtran
					inner join alm_articulos	as Art on Kar.Codart = Art.codart 
					inner join alm_inventario	as Inv on kar.codart = Inv.codart and Kar.codcto=inv.codcto 
		WHERE		Kar.idemp=@pIdEMp and kar.docdelete = 0 and Kar.Codcto=@pCodCto and kar.fecmov<=@pFecMov 	
					GROUP BY kar.idemp,kar.codcto,Kar.codart,Art.NomArt,ARt.undart,Inv.caninv);


Go

IF Exists (Select name From SysObjects Where name = 'FT_Documentos') 
	DROP FUNCTION FT_Documentos
GO
CREATE  FUNCTION FT_Documentos
(		
		@pIdEMp nVarchar(3)
)
RETURNS TABLE 
AS
 
   return(select B.codtran , A.codalm, A.codcen, B.codcto, C.tiptran, B.contran
          from con_cencostos A
               inner join glb_unica   B on(A.codcto =B.codcto And A.idemp=@pIdEMp And B.idemp=@pIdEMp  )
               inner join glb_transaccion C on(C.codtran=B.codtran )
          union all 
          select B.codtran, A.codalm, A.codcen, B.codcto, C.tiptran,  
                 case replicate ('0',(2 - len(month(getdate())))) + convert(varchar, month(getdate())) 
                    when '01' then b.mes01
                    when '02' then b.mes02
                    when '03' then b.mes03
                    when '04' then b.mes04
                    when '05' then b.mes05
                    when '06' then b.mes06
                    when '07' then b.mes07
                    when '08' then b.mes08
                    when '09' then b.mes09
                    when '10' then b.mes10
                    when '11' then b.mes11
                    when '12' then b.mes12
                 end as contran   
          from con_cencostos  A            
               inner join glb_mensual B on(B.codcto =A.codcto  and B.idemp=@pIdEMp and A.idemp =@pIdEmp)
               inner join glb_transaccion C on(C.codtran=B.codtran )      );

GO

IF Exists (Select name From SysObjects Where name = 'F_mensaje') 
	DROP FUNCTION F_mensaje
GO
CREATE  Function F_mensaje
(
		@pNroMsg   decimal(5,0)  
)
Returns nVarchar(230)
As
Begin	
	declare @mMsg nVarchar(230) 
	declare @mCad nVarchar(230)    
    
    select @mMsg=nombre from glb_error where ID=@pNroMsg
    
    return @mMsg
	
End

GO

IF Exists (Select name From SysObjects Where name = 'F_MensajeSql') 
	DROP FUNCTION F_MensajeSql
GO
create  Function F_MensajeSql
(
	@pNroMsg   decimal(5,0)  
)
Returns nVarchar(145)
As
Begin	
	declare @mMsg nVarchar(185) 
	declare @mCad nVarchar(185)    
    
    select @mMsg=ltrim(rtrim(m.description)) from sys.sysmessages m where m.error=@pNroMsg and m.msglangid=3082
    
    return @mMsg
	
End

GO


IF Exists (Select name From SysObjects Where name = 'F_SwDelTransaccion') 
	DROP FUNCTION F_SwDelTransaccion
GO
CREATE   Function F_SwDelTransaccion
(
	 @pIdEmp   nvarchar (3)
	,@pCodTran nvarchar (3)   
)
Returns nvarchar(90)
As
Begin	
	declare @mSw  nvarchar(90)=''        
    declare @mMsg nvarchar(230)=''
    
    
    set @mSw = 'S' 
    
    IF NOT EXISTS(select * from glb_transaccion where codtran=@pCodTran)
    BEGIN
      set @mSw = ltrim(rtrim(dbo.f_mensaje(7001)))
    END 
    --=================================================
	-- idemp=@pIdEmp and solo utilizar este filtro
	-- cuando las transacciones sean multiempresa.
	--=================================================
    If exists(select * 
              from con_comprobante 
              where idemp=@pIdEmp and codtran=@pCodTran and docdelete =0)
    Begin 
      select  @mSw = ' ;CONTABILIDAD2.' --ltrim(rtrim(dbo.f_mensaje(7002)))+         
    End           
    
    If exists(select * 
              from alm_kardex
              where codcon=@pCodTran and docdelete = 0)--idemp=@pIdEmp and)
    Begin
      select @mSw = @mSw +' ;KARDEX.'   --ltrim(rtrim(dbo.f_mensaje(7002)))+      
    End          
    
    
	If exists(select * 
              from ven_facturas
              where  tipfac=@pCodTran)--idemp=@pIdEmp and
    Begin 
      select @mSw = @mSw +' ;VENTAS.'   --ltrim(rtrim(dbo.f_mensaje(7002)))+       
    End       
    
    
	If exists(select * 
              from com_facturas
              where tipfac=@pCodTran and modificadoc =0)--idemp=@pIdEmp and 
    Begin 
      select @mSw = @mSw +' ;COMPRAS.'   --ltrim(rtrim(dbo.f_mensaje(7002)))+      
    End               
    
    
	Return @mSw


End

GO

IF Exists (Select name From SysObjects Where name = 'FE_BuscarFK') 
	DROP FUNCTION FE_BuscarFK
GO
CREATE FUNCTION FE_BuscarFK
(
	 @pNombreTabla nvarchar(30)
	,@pNombreCampo nvarchar(30)
)
RETURNS bit 
AS
BEGIN
   --Declaración de variables
   DECLARE @mRsm bit 
   
   Set @mRsm = 0
   
   If exists(SELECT fk.name AS FK,
                        OBJECT_NAME(fk.parent_object_id) AS TableName,
                        COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
                        OBJECT_NAME (fk.referenced_object_id) AS ReferenceTableName,
                        COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ReferenceColumnName
                 FROM   sys.foreign_keys AS fk
                        INNER JOIN sys.foreign_key_columns AS fc ON fk.OBJECT_ID = fc.constraint_object_id
                 WHERE  OBJECT_NAME(fk.parent_object_id)=@pNombreTabla and COL_NAME(fc.parent_object_id,fc.parent_column_id)=@pNombreCampo)
      Set @mRsm =1 
   
   
   RETURN @mRsm    

END
GO

IF Exists (Select name From SysObjects Where name = 'FE_Consecut') 
	DROP FUNCTION FE_Consecut
GO
CREATE FUNCTION FE_Consecut
(
     @pIdEmp   nVarchar(3)
	,@pCodcto  nvarchar(3)
	,@pCodTran nchar(2)
	,@pAñoTran decimal(4,0)
	,@pMes     nVarchar(15)
	,@pSw      bit = 0 )
RETURNS int
AS
BEGIN
   Declare @mConsecut int, @mCad nvarchar(70), @mSql nVarchar(180),
           @mTiptran int 
   Set @mConsecut =0
   Set @mTiptran = 0
      
   select @mTipTran=tiptran from glb_transaccion where codtran=@pCodTran 
   
   If @mTiptran = 1 
   Begin 
      Select @mConsecut=contran 
      From   glb_unica 
      Where  idemp= @pIdEmp  and codcto=@pCodcto and codtran = @pCodTran 
   End 
   
   If @mTiptran = 2 
   Begin 
      Select @mConsecut=@pMes 
      From   glb_mensual  
      Where  idemp=@pIdEmp and codcto=@pCodcto and codtran=@pCodTran and añotran=@pAñoTran             
   End     
   
   Return @mConsecut 
END

GO

-------------------------------------------------------------------------------------------------------------
IF Exists (Select name From SysObjects Where name = 'Fe_CtaTransAnul') 	DROP FUNCTION Fe_CtaTransAnul
GO
CREATE FUNCTION Fe_CtaTransAnul (@pCodtran nvarchar(2))
RETURNS nvarchar(2)
AS
BEGIN
	DECLARE @Result nvarchar(2)

	SELECT @Result = anultran From Glb_Transaccion Where codtran=@pCodtran

	RETURN ISNULL(@Result,'')
END
GO

-----------------------------------------------------------------------------------------
IF Exists (Select name From SysObjects Where name = 'FE_EliminarArticulos') 
	DROP FUNCTION FE_EliminarArticulos 
GO
CREATE FUNCTION FE_EliminarArticulos
(
	@pCodart nvarchar(15)
)
RETURNS bit
AS
BEGIN
    Declare @mRt bit 
    Set @mRt = 1 
	If exists(Select codart From alm_kardex where codart =@pCodart and modificadoc = 0)
	   Set @mRt = 0 
	   
   Return @mRt 
END
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF Exists (Select name From SysObjects Where name = 'FE_FiltroCodcc') 
	DROP FUNCTION FE_FiltroCodcc 
GO
CREATE FUNCTION FE_FiltroCodcc
(
   @pCCosto nvarchar(12)	
)
RETURNS nvarchar(70)
AS
BEGIN
   declare @mLen    int,
           @mCad    nvarchar(70)
   Set @mLen=0

   Set @mLen = Len(ltrim(rtrim(@pCCosto)))
    
   select @mCad=
   case @mLen
           
      When 3  Then 'idemp='''+LEFT(@pCCosto,3)+''''
      
      When 6  Then 'idemp='''+LEFT(@pCCosto,3)+''' and '+ 
                   'codalm='''+substring(@pCCosto,4,3)+''''
      
      When 9  Then 'idemp='''+LEFT(@pCCosto,3)+''' and  '+
                   'codalm='''+substring(@pCCosto,4,3)+''' and '+
                   'codcen='''+substring(@pCCosto,7,3)+''''
                     
      When 12 Then 'idemp='''+LEFT(@pCCosto,3)+''' and '+
                   'codalm='''+substring(@pCCosto,4,3)+''' and '+ 
                   'codcen='''+substring(@pCCosto,7,3)+''' and '+
                   'codcto='''+substring(@pCCosto,10,3)+''''
                                               
   Else
      'idemp='''+LEFT(@pCCosto,3)+''''   
   End 
   RETURN lTrim(rtrim(@mCad))

END
GO


IF Exists (Select name From SysObjects Where name = 'FE_GenerarClave') 
	DROP FUNCTION FE_GenerarClave 
GO
CREATE FUNCTION FE_GenerarClave
(   
    @mUsu   nVarchar(18),
    @mClave nVARCHAR(27)
    
)
RETURNS nvarchar(max)
AS
BEGIN 
    DECLARE @pass AS nvarchar(max)
    DECLARE @mCodigo as nvarchar(45)
    SET @mCodigo =ltrim(rtrim(@mUsu))+LTRIM(RTRIM(@mClave))
    SET @pass = convert(varchar(max), ENCRYPTBYPASSPHRASE(@mCodigo, @mClave) ,1)
--DECLARE @passSTR as  varchar(max)
--	set @passSTR = convert(varchar(max), @pass, 1)
    return @pass
END
Go


IF Exists (Select name From SysObjects Where name = 'FE_LetraCapital') 
	DROP FUNCTION FE_LetraCapital 
GO
CREATE FUNCTION FE_LetraCapital
(@INPUT AS VARCHAR(190))
RETURNS VARCHAR(190)
AS
BEGIN
	DECLARE @I AS INT
	DECLARE @LENGTH AS INT
	DECLARE @FLAG AS BIT
	DECLARE @OUTPUT AS VARCHAR(190)

	SET @I = 0;
	SET @INPUT = LOWER(@INPUT);
    SET @LENGTH = LEN(@INPUT);
    SET @FLAG = 1;
    SET @OUTPUT = '';

	WHILE (@I <= @LENGTH)
	BEGIN
		IF (@FLAG = 1)
			BEGIN
				SET @OUTPUT = @OUTPUT + UPPER(SUBSTRING(@INPUT, @I, 1));
				SET @FLAG = 0;
			END
		ELSE 
			SET @OUTPUT = @OUTPUT + SUBSTRING(@INPUT, @I, 1);

        IF (SUBSTRING(@INPUT, @I, 1) IN (' ', ',', ';', '.', ':', '!', '?', '_', '-', '/', '&', '''', '(', ')'))
            SET @FLAG = 1;

		SET @I = @I + 1;
	END -- WHILE
 
    RETURN LTRIM(RTRIM(@OUTPUT))
END
GO


IF Exists (Select name From SysObjects Where name = 'FE_SaldoAñoCtoCta')	DROP FUNCTION FE_SaldoAñoCtoCta
GO
CREATE FUNCTION FE_SaldoAñoCtoCta
(	@nAño		Numeric(4),
	@nMes		Numeric(2),
	@cCodCto	nVarchar(3),
	@cCodCue	nVarchar(8)
)
RETURNS Decimal(20,2)
AS
BEGIN
	Declare @SaldoAnt	Decimal(20,2),
			@nMeses		Numeric(2)=0,
			@nNroMes	Numeric(2)=1,
			@cDeb		nVarChar(6)='',
			@cCre		nVarChar(6)='',
			@cCadena	nVarchar(Max)='',
			@nSanCue	Decimal(20,2)=0,
			@nNatCue	Char(1)='',
			@nD01 Decimal(20,2)=0, @nC01 Decimal(20,2)=0, @nD02 Decimal(20,2)=0, @nC02 Decimal(20,2)=0, @nD03 Decimal(20,2)=0, @nC03 Decimal(20,2)=0,
			@nD04 Decimal(20,2)=0, @nC04 Decimal(20,2)=0, @nD05 Decimal(20,2)=0, @nC05 Decimal(20,2)=0, @nD06 Decimal(20,2)=0, @nC06 Decimal(20,2)=0,
			@nD07 Decimal(20,2)=0, @nC07 Decimal(20,2)=0, @nD08 Decimal(20,2)=0, @nC08 Decimal(20,2)=0, @nD09 Decimal(20,2)=0, @nC09 Decimal(20,2)=0,
			@nD10 Decimal(20,2)=0, @nC10 Decimal(20,2)=0, @nD11 Decimal(20,2)=0, @nC11 Decimal(20,2)=0, @nD12 Decimal(20,2)=0, @nC12 Decimal(20,2)=0

	Declare cur_Ctas Cursor For Select	natcue, sancue,
										d01cue,c01cue,d02cue,c02cue,d03cue,c03cue,d04cue,c04cue,d05cue,c05cue,d06cue,c06cue,
										d07cue,c07cue,d08cue,c08cue,d09cue,c09cue,d10cue,c10cue,d11cue,c11cue,d12cue,c12cue
								From Con_CtaCenCostos Where año=@nAño AND codcto=@cCodCto AND codcue=@cCodCue
								Order By idemp,año,codcto,codcue
	Open cur_Ctas
	Fetch cur_Ctas Into @nNatCue, @nSanCue, @nD01,@nC01,@nD02,@nC02,@nD03,@nC03,@nD04,@nC04,@nD05,@nC05,@nD06,@nC06,
											@nD07,@nC07,@nD08,@nC08,@nD09,@nC09,@nD10,@nC10,@nD11,@nC11,@nD12,@nC12
	While @@FETCH_STATUS = 0
	begin
		Set @SaldoAnt = @nSanCue

		Set @nMeses = Case When @nMes=1 Then 0 Else @nMes-1 End
		WHILE @nNroMes <= @nMeses
			begin
				If @nNatCue = 'D'
					begin
						If @nNroMes = 1  Set @SaldoAnt = @SaldoAnt + @nD01 - @nC01
						If @nNroMes = 2  Set @SaldoAnt = @SaldoAnt + @nD02 - @nC02
						If @nNroMes = 3  Set @SaldoAnt = @SaldoAnt + @nD03 - @nC03
						If @nNroMes = 4  Set @SaldoAnt = @SaldoAnt + @nD04 - @nC04
						If @nNroMes = 5  Set @SaldoAnt = @SaldoAnt + @nD05 - @nC05
						If @nNroMes = 6  Set @SaldoAnt = @SaldoAnt + @nD06 - @nC06
						If @nNroMes = 7  Set @SaldoAnt = @SaldoAnt + @nD07 - @nC07
						If @nNroMes = 8  Set @SaldoAnt = @SaldoAnt + @nD08 - @nC08
						If @nNroMes = 9  Set @SaldoAnt = @SaldoAnt + @nD09 - @nC09
						If @nNroMes = 10 Set @SaldoAnt = @SaldoAnt + @nD10 - @nC10
						If @nNroMes = 11 Set @SaldoAnt = @SaldoAnt + @nD11 - @nC11
						If @nNroMes = 12 Set @SaldoAnt = @SaldoAnt + @nD12 - @nC12
					End
				Else
					begin
						If @nNroMes = 1  Set @SaldoAnt = @SaldoAnt - @nD01 + @nC01
						If @nNroMes = 2  Set @SaldoAnt = @SaldoAnt - @nD02 + @nC02
						If @nNroMes = 3  Set @SaldoAnt = @SaldoAnt - @nD03 + @nC03
						If @nNroMes = 4  Set @SaldoAnt = @SaldoAnt - @nD04 + @nC04
						If @nNroMes = 5  Set @SaldoAnt = @SaldoAnt - @nD05 + @nC05
						If @nNroMes = 6  Set @SaldoAnt = @SaldoAnt - @nD06 + @nC06
						If @nNroMes = 7  Set @SaldoAnt = @SaldoAnt - @nD07 + @nC07
						If @nNroMes = 8  Set @SaldoAnt = @SaldoAnt - @nD08 + @nC08
						If @nNroMes = 9  Set @SaldoAnt = @SaldoAnt - @nD09 + @nC09
						If @nNroMes = 10 Set @SaldoAnt = @SaldoAnt - @nD10 + @nC10
						If @nNroMes = 11 Set @SaldoAnt = @SaldoAnt - @nD11 + @nC11
						If @nNroMes = 12 Set @SaldoAnt = @SaldoAnt - @nD12 + @nC12
					End

				SET @nNroMes = @nNroMes + 1
			end
		Fetch cur_Ctas Into @nNatCue, @nSanCue, @nD01,@nC01,@nD02,@nC02,@nD03,@nC03,@nD04,@nC04,@nD05,@nC05,@nD06,@nC06,
												@nD07,@nC07,@nD08,@nC08,@nD09,@nC09,@nD10,@nC10,@nD11,@nC11,@nD12,@nC12
	end
	Close cur_Ctas
	Deallocate cur_Ctas

    RETURN @SaldoAnt
END
GO



IF Exists (Select name From SysObjects Where name = 'FE_SaldoAñoCtoCta_NIIF')	DROP FUNCTION FE_SaldoAñoCtoCta_NIIF
GO
CREATE FUNCTION FE_SaldoAñoCtoCta_NIIF
(	@nAño		Numeric(4),
	@nMes		Numeric(2),
	@cCodCto	nVarchar(3),
	@cCodCue	nVarchar(8)
)
RETURNS Decimal(20,2)
AS
BEGIN
	Declare @SaldoAnt	Decimal(20,2),
			@nMeses		Numeric(2)=0,
			@nNroMes	Numeric(2)=1,
			@cDeb		nVarChar(6)='',
			@cCre		nVarChar(6)='',
			@cCadena	nVarchar(Max)='',
			@nSanCue	Decimal(20,2)=0,
			@nNatCue	Char(1)='',
			@nD01 Decimal(20,2)=0, @nC01 Decimal(20,2)=0, @nD02 Decimal(20,2)=0, @nC02 Decimal(20,2)=0, @nD03 Decimal(20,2)=0, @nC03 Decimal(20,2)=0,
			@nD04 Decimal(20,2)=0, @nC04 Decimal(20,2)=0, @nD05 Decimal(20,2)=0, @nC05 Decimal(20,2)=0, @nD06 Decimal(20,2)=0, @nC06 Decimal(20,2)=0,
			@nD07 Decimal(20,2)=0, @nC07 Decimal(20,2)=0, @nD08 Decimal(20,2)=0, @nC08 Decimal(20,2)=0, @nD09 Decimal(20,2)=0, @nC09 Decimal(20,2)=0,
			@nD10 Decimal(20,2)=0, @nC10 Decimal(20,2)=0, @nD11 Decimal(20,2)=0, @nC11 Decimal(20,2)=0, @nD12 Decimal(20,2)=0, @nC12 Decimal(20,2)=0

	Declare cur_Ctas Cursor For Select	natcue, sancue,
										d01cue,c01cue,d02cue,c02cue,d03cue,c03cue,d04cue,c04cue,d05cue,c05cue,d06cue,c06cue,
										d07cue,c07cue,d08cue,c08cue,d09cue,c09cue,d10cue,c10cue,d11cue,c11cue,d12cue,c12cue
								From Con_CtaCtoNIIF Where año=@nAño AND codcto=@cCodCto AND codcue=@cCodCue
								Order By idemp,año,codcto,codcue
	Open cur_Ctas
	Fetch cur_Ctas Into @nNatCue, @nSanCue, @nD01,@nC01,@nD02,@nC02,@nD03,@nC03,@nD04,@nC04,@nD05,@nC05,@nD06,@nC06,
											@nD07,@nC07,@nD08,@nC08,@nD09,@nC09,@nD10,@nC10,@nD11,@nC11,@nD12,@nC12
	While @@FETCH_STATUS = 0
	begin
		Set @SaldoAnt = @nSanCue

		Set @nMeses = Case When @nMes=1 Then 0 Else @nMes-1 End
		WHILE @nNroMes <= @nMeses
			begin
				If @nNatCue = 'D'
					begin
						If @nNroMes = 1  Set @SaldoAnt = @SaldoAnt + @nD01 - @nC01
						If @nNroMes = 2  Set @SaldoAnt = @SaldoAnt + @nD02 - @nC02
						If @nNroMes = 3  Set @SaldoAnt = @SaldoAnt + @nD03 - @nC03
						If @nNroMes = 4  Set @SaldoAnt = @SaldoAnt + @nD04 - @nC04
						If @nNroMes = 5  Set @SaldoAnt = @SaldoAnt + @nD05 - @nC05
						If @nNroMes = 6  Set @SaldoAnt = @SaldoAnt + @nD06 - @nC06
						If @nNroMes = 7  Set @SaldoAnt = @SaldoAnt + @nD07 - @nC07
						If @nNroMes = 8  Set @SaldoAnt = @SaldoAnt + @nD08 - @nC08
						If @nNroMes = 9  Set @SaldoAnt = @SaldoAnt + @nD09 - @nC09
						If @nNroMes = 10 Set @SaldoAnt = @SaldoAnt + @nD10 - @nC10
						If @nNroMes = 11 Set @SaldoAnt = @SaldoAnt + @nD11 - @nC11
						If @nNroMes = 12 Set @SaldoAnt = @SaldoAnt + @nD12 - @nC12
					End
				Else
					begin
						If @nNroMes = 1  Set @SaldoAnt = @SaldoAnt - @nD01 + @nC01
						If @nNroMes = 2  Set @SaldoAnt = @SaldoAnt - @nD02 + @nC02
						If @nNroMes = 3  Set @SaldoAnt = @SaldoAnt - @nD03 + @nC03
						If @nNroMes = 4  Set @SaldoAnt = @SaldoAnt - @nD04 + @nC04
						If @nNroMes = 5  Set @SaldoAnt = @SaldoAnt - @nD05 + @nC05
						If @nNroMes = 6  Set @SaldoAnt = @SaldoAnt - @nD06 + @nC06
						If @nNroMes = 7  Set @SaldoAnt = @SaldoAnt - @nD07 + @nC07
						If @nNroMes = 8  Set @SaldoAnt = @SaldoAnt - @nD08 + @nC08
						If @nNroMes = 9  Set @SaldoAnt = @SaldoAnt - @nD09 + @nC09
						If @nNroMes = 10 Set @SaldoAnt = @SaldoAnt - @nD10 + @nC10
						If @nNroMes = 11 Set @SaldoAnt = @SaldoAnt - @nD11 + @nC11
						If @nNroMes = 12 Set @SaldoAnt = @SaldoAnt - @nD12 + @nC12
					End

				SET @nNroMes = @nNroMes + 1
			end
		Fetch cur_Ctas Into @nNatCue, @nSanCue, @nD01,@nC01,@nD02,@nC02,@nD03,@nC03,@nD04,@nC04,@nD05,@nC05,@nD06,@nC06,
												@nD07,@nC07,@nD08,@nC08,@nD09,@nC09,@nD10,@nC10,@nD11,@nC11,@nD12,@nC12
	end
	Close cur_Ctas
	Deallocate cur_Ctas

    RETURN @SaldoAnt
END
GO

IF Exists (Select name From SysObjects Where name = 'FT_Com_comprobante_ValidaComp')   ---Ing. Lissette Sept 15 2015
	DROP FUNCTION FT_Com_comprobante_ValidaComp
GO

CREATE FUNCTION FT_Com_comprobante_ValidaComp
(
	 @strIdEmp   nVarchar(3)=''
	,@strCodCto  nVarchar(3)=''
	,@dFecdoc	 date =getdate 	
)
RETURNS TABLE 
AS
	return(
			SELECT 	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					'Comprobante Descuadrado' AS Concepto, space(15) as nitter, space(8) as codcue  
			FROM 	Con_Comprobante
			WHERE 	idEmp=@strIdEmp and FecDoc<=@dFecDoc and EstComp!='A' and docdelete = 0
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc 
					having Sum(Debito)-Sum(Credito)!=0
			
			UNION ALL 
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					'Fuente Vacía' AS Concepto, space(15) as nitter, space(8) as codcue   
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND CodTran='' AND FecDoc<=@dFecdoc 			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc 

			UNION ALL 
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					IIF(NitTer='','Tercero Vacio','Tercero No Existe') AS Concepto, nitter, space(8) as codcue  
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND nitter not in 
					(SELECT nitter FROM Glb_Terceros)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,nitter 

			UNION ALL 
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					IIF(CodCue='','Cuenta Vacia','Cuenta No Existe') AS Concepto, space(15) as nitter, codcue 
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND codcue not in 
					(SELECT codcue FROM con_puc)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,codcue  

			UNION ALL 
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					'Centro de Costo No Existe' AS Concepto, space(15) as nitter, codcue 
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND codcto not in 
					(SELECT codcto FROM con_cencostos)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,codcue  

			UNION ALL 
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					'Centro de Costo No Existe' AS Concepto, space(15) as nitter, codcue 
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND codctodet not in 
					(SELECT codcto FROM con_cencostos)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,codcue  

			UNION ALL    -- niverles superiors nivel 1
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					concat(codcue,' No Tiene Niveles Superiores 1') AS Concepto, space(15) as nitter, codcue 
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND substring(CodCue,1,1) not in 
					(SELECT codcue FROM con_puc)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,codcue  

			UNION ALL    -- niverles superiors nivel 2
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					concat(codcue,' No Tiene Niveles Superiores 2') AS Concepto, space(15) as nitter, codcue 
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND substring(CodCue,1,2) not in 
					(SELECT codcue FROM con_puc)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,codcue  

			UNION ALL    -- niverles superiors nivel 3
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					concat(codcue,' No Tiene Niveles Superiores 3') AS Concepto, space(15) as nitter, codcue 
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND substring(CodCue,1,4) not in 
					(SELECT codcue FROM con_puc)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,codcue  

			UNION ALL    -- niverles superiors nivel 4
			SELECT	IdEmp, Codcto, Codtran, Consec, FecDoc, SUM(Debito) AS Debito, SUM(Credito) AS Credito, 
					concat(codcue,' No Tiene Niveles Superiores 4') AS Concepto, space(15) as nitter, codcue 
			FROM	Con_Comprobante
			WHERE	idEmp=@strIdEmp and Estcomp!='A' and docdelete = 0 AND FecDoc<=@dFecdoc  AND substring(CodCue,1,6) not in 
					(SELECT codcue FROM con_puc)			
					GROUP BY IdEmp,Codcto,Codtran,Consec,FecDoc,codcue  
			
		
		);
GO


--Ing. Lissette Abril 14 de 2016
IF Exists (Select name From SysObjects Where name = 'Fe_Itemkar') 
	DROP FUNCTION Fe_Itemkar
GO

CREATE FUNCTION Fe_Itemkar
(	@pIdEMp   nVarChar(3)
	,@pConCto  nVarchar(3)
	,@pCodtran nvarchar(2)
	,@pConsec  nVarChar(16)
)
RETURNS Numeric(6)
AS
BEGIN
	Declare @mItemDoc Numeric(6)

	Select	@mItemDoc = Max(itemfac) + 1
	From	Alm_kardex
	Where	idemp=@pidEmp AND modificadoc = 0 and codcto=@pConCto AND codcon=@pCodtran AND numcon=@pConsec and modificadoc = 0

	RETURN @mItemDoc 
END
go  
-------
IF Exists (Select name From SysObjects Where name = 'Fe_ItemComprasAnul')	
	DROP FUNCTION Fe_ItemComprasAnul
GO
CREATE FUNCTION Fe_ItemComprasAnul
(	@pIdEMp   nVarChar(3)
	,@pConCto  nVarchar(3)
	,@pCodtran nvarchar(2)
	,@pConsec  nVarChar(16)
)

RETURNS Numeric(6)
AS
BEGIN
	Declare @mItemDoc Numeric(5)

	Select	@mItemDoc = Max(modificadoc) + 1
	From	com_facturas
	Where	idemp=@pidEmp AND codcto=@pConCto AND tipfac=@pCodtran AND numfac=@pConsec 

	RETURN @mItemDoc 
END
Go 
-----
IF Exists (Select name From SysObjects Where name = 'Fe_ItemKardexAnul')	
	DROP FUNCTION Fe_ItemKardexAnul
GO
CREATE FUNCTION Fe_ItemKardexAnul
(	@pIdEMp   nVarChar(3)
	,@pConCto  nVarchar(3)
	,@pCodtran nvarchar(2)
	,@pConsec  nVarChar(16)
)

RETURNS Numeric(6)
AS
BEGIN
	Declare @mItemDoc Numeric(5)

	Select	@mItemDoc = Max(modificadoc) + 1
	From	alm_kardex
	Where	idemp=@pidEmp AND codcto=@pConCto AND CodCon=@pCodtran AND numcon=@pConsec 

	RETURN @mItemDoc 
END
Go 

-----
IF Exists (Select name From SysObjects Where name = 'Fe_ItemFacVtaAnul')	
	DROP FUNCTION Fe_ItemFacVtaAnul
GO
CREATE FUNCTION Fe_ItemFacVtaAnul
(	@pIdEMp   nVarChar(3)
	,@pConCto  nVarchar(3)
	,@pCodtran nvarchar(2)
	,@pConsec  nVarChar(16)
)

RETURNS Numeric(6)
AS
BEGIN
	Declare @mItemDoc Numeric(5)

	Select	@mItemDoc = Max(modificadoc) + 1
	From	Ven_facturas
	Where	idemp=@pidEmp AND codcto=@pConCto AND Tipfac=@pCodtran AND numfac=@pConsec 

	RETURN @mItemDoc 
END
Go 

IF Exists (Select name From SysObjects Where name = 'Fe_ItemFacKardex')	
	DROP FUNCTION Fe_ItemFacKardex
GO
CREATE FUNCTION Fe_ItemFacKardex
(	@pIdEMp   nVarChar(3)
	,@pConCto  nVarchar(3)
	,@pCodcon  nvarchar(2)
	,@pNumcon  nVarChar(8)
)

RETURNS Numeric(6)
AS
BEGIN
	Declare @mItemDoc Numeric(5)

	Select	@mItemDoc = Max(itemfac) + 1
	From	alm_kardex
	Where	idemp=@pidEmp AND codcto=@pConCto AND Numcon=@pCodCon AND numcon=@pNumcon 

	RETURN @mItemDoc 
END
Go 
IF Exists (Select name From SysObjects Where name = 'fnColocaClave')	
	DROP FUNCTION fnColocaClave
GO
CREATE FUNCTION [dbo].[fnColocaClave] 
(
    @clave VARCHAR(25)
)
RETURNS VarBinary(8000)
AS
BEGIN
    
    
    DECLARE @pass AS VarBinary(8000)
    ------------------------------------
    ------------------------------------
    SET @pass = ENCRYPTBYPASSPHRASE('dbCurso09',@clave)--dbCurso09 es la llave para cifrar el campo.
    ------------------------------------
    ------------------------------------    
    RETURN @pass

END
GO

IF Exists (Select name From SysObjects Where name = 'fnLeeClave')	
	DROP FUNCTION fnLeeClave
GO
CREATE FUNCTION fnLeeClave 
(
    @clave VARBINARY(8000)
)
RETURNS VARCHAR(25)
AS
BEGIN
    
    
    DECLARE @pass AS VARCHAR(25)
    ------------------------------------
    ------------------------------------
    --Se descifra el campo aplicandole la misma llave con la que se cifro dbCurso09
    SET @pass = DECRYPTBYPASSPHRASE('dbCurso09',@clave)
    ------------------------------------
    ------------------------------------    
    RETURN @pass

END
GO

IF Exists (Select name From SysObjects Where name = 'GFE_ExisteCotizacion')	
	DROP FUNCTION GFE_ExisteCotizacion
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================
-- Author:		<Author,Luis Dominguez>
-- Create date: <Create, 2019-03-18>
-- Description:	<Verifica la existencia de una cotización>
-- ===============================================================
CREATE FUNCTION [dbo].[GFE_ExisteCotizacion] 
(
	-- Add the parameters for the function here
	@pIdemp char(3), @pCodcto char(3), @pTipfac char(2), @pNumfac nvarchar(8)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @nExiste int=0

	if exists(select Idemp,codcto,tipfac,numfac from Ven_pedidos where Idemp=@pIdemp and codcto=@pCodcto and tipfac= @pTipfac and numfac=@pNumfac)
		Set @nExiste =	1
	
	-- Return the result of the function
	RETURN @nExiste

END
GO 

