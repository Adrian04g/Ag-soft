USE [PALENQUESERVER]
GO
/****** Object:  StoredProcedure [dbo].[db_SP_SYN_DATOSTRANSACCION_ObtenerdatosSERVER]    Script Date: 06/07/2017 1:55:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[db_SP_SYN_DATOSTRANSACCION_ObtenerdatosSERVER]
	 @cd_TBL_NAME VARCHAR(20), @cd_BD_ORIG VARCHAR(3000),@am_VersionAct numeric(20,0), @am_LOG_TRAN numeric(20,0)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ds_Datos VARCHAR(MAX)
	DECLARE @ds_Datos2 VARCHAR(MAX)
	DECLARE @ds_Datos3 VARCHAR(MAX)
	DECLARE @am_VersionDB NUMERIC(20)		
	SELECT @am_VersionDB = CHANGE_TRACKING_CURRENT_VERSION()
	DECLARE @tipoOperacion VARCHAR(2)
	print 'ABC'
	PRINT CAST(@am_LOG_TRAN AS VARCHAR(20))
	PRINT dbo.db_FC_SYN_DATOSTRANSACCION_EnviarcolumnasSERVER(@cd_TBL_NAME)
	SET @ds_Datos ='
	DECLARE @hdoc INT
	DECLARE @xmlDataVenta XML
	DECLARE @tipoOperacion VARCHAR(2)
	DECLARE curDatos CURSOR 
	FOR SELECT D.cd_TIP_TRAN, D.xm_DAT_TRAN
		FROM dbo.SYN_DATOSTRANSACCION D, dbo.SYN_TABLASPUBLICACION T
		WHERE D.cd_TBL_NAME = T.CODTABLA AND D.cd_LOG_STAT= ''P'' AND D.am_LOG_TRAN = ''' + CAST(@am_LOG_TRAN AS VARCHAR(20))+ ''' and D.cd_BD_ORIG <> ''' + @cd_BD_ORIG + '''
				ANd D.cd_TBL_NAME='''+@cd_TBL_NAME+''' --AND T.CODPUBLICACION =''Maestros''
	CREATE TABLE #tblTemp(cd_TIP_TRAN VARCHAR(02),' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviaresquemaSERVER(@cd_TBL_NAME) + ',cd_BD_ORIG varchar(300),am_LOG_TRAN numeric(20, 0))'
	SET @ds_Datos2 = '
	OPEN curDatos 
	FETCH NEXT FROm curDatos INTO @tipoOperacion, @xmlDataVenta
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @xmlDataVenta 
		INSERT INTO #tblTemp(cd_TIP_TRAN,' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviarcolumnasSERVER(@cd_TBL_NAME) + ',cd_BD_ORIG,am_LOG_TRAN)
		SELECT @tipoOperacion,' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviarcolumnasSERVER(@cd_TBL_NAME) + ',cd_BD_ORIG,am_LOG_TRAN   FROM OPENXML(@hdoc,''//reg'',2)'
	SET @ds_Datos3 = '
		WITH (' + dbo.db_FC_SYN_DATOSTRANSACCION_EnviaresquemaSERVER(@cd_TBL_NAME) +',cd_BD_ORIG varchar(300),am_LOG_TRAN numeric(20, 0));
		FETCH NEXT FROM curDatos INTO @tipoOperacion, @xmlDataVenta   
	END
	CLOSE curDatos
	DEALLOCATE curdatos
	SELECT cd_TIP_TRAN AS SYS_CHANGE_OPERATION, * FROM #tblTemp  TABLA
	DROP TABLE #tblTemp'
	--SELECT @ds_Datos
	EXEC (@ds_Datos + @ds_Datos2 + @ds_Datos3 )
	PRINT (@ds_Datos + @ds_Datos2 + @ds_Datos3 )
	--update syn_datostransaccion set cd_LOG_STAT ='E' where cd_LOG_STAT ='P' and cd_TBL_NAME = @cd_TBL_NAME
END	