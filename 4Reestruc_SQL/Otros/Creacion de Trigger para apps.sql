GO
/****** Object:  Trigger [dbo].[marcar_isenviado_alm_articulos_Inv]    Script Date: 23/09/2020 8:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists (select* from sys.triggers WHERE NAME = 'marcar_isenviado_alm_articulos_Inv')
  BEGIN
    drop trigger [dbo].[marcar_isenviado_alm_articulos_Inv]
	END
GO
CREATE TRIGGER [dbo].[marcar_isenviado_alm_articulos_Inv]
ON [dbo].[alm_inventario]
AFTER INSERT, UPDATE
AS
declare @codctopar varchar(03) = (select ctodomicilio from glb_parametros)
declare @codcto varchar(03) = (select TOP(1) codcto from deleted)
IF (@codcto = @codctopar)
   BEGIN
      update a  set a.isenviado = '0' FROM alm_articulos a INNER JOIN deleted d ON (a.codart = d.codart) 
   END


GO
/****** Object:  Trigger [dbo].[marcar_isenviado_alm_articulos_art]    Script Date: 23/09/2020 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
if exists (select* from sys.triggers WHERE NAME = 'marcar_isenviado_alm_articulos_art')
  BEGIN
    drop trigger [dbo].marcar_isenviado_alm_articulos_art
	END
GO
CREATE TRIGGER [dbo].[marcar_isenviado_alm_articulos_art]
ON [dbo].[alm_articulos]
AFTER UPDATE
AS
if NOT update(isenviado)
   BEGIN 
         update  a set a.isenviado = '0' from alm_articulos a inner join deleted d on (a.codart = d.codart)              
   END