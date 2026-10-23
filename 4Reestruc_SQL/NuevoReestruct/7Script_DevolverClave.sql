/****** Object:  StoredProcedure [dbo].[SP_devolverclave]    Script Date: 07/11/2017 1:15:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_devolverclave]

@usuario nvarchar (50),
@clave	 nvarchar (30)

AS
begin
   declare @usuarioclave nvarchar(80)
   declare @clavenet varbinary(max)

   SET @clavenet = (SELECT Convert(varbinary(max), clausunet, 1) FROM glb_usuarios
   Where codusu = @usuario)

   SET @usuarioclave = @usuario + @clave  
   SELECT dbo.FE_ObtenerClave(@usuarioclave,@clavenet)
end
