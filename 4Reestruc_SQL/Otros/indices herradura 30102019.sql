/*
Faltan detalles del índice de SQLQuery2.sql - SERVIDORGLB\GLOBALSOFT.Herradura (sa (65))
El procesador de consultas estima que la implementación del siguiente índice podría mejorar el costo de la consulta en un 99.7722%.
*/


USE [Herradura]
GO
CREATE NONCLUSTERED INDEX [<idx_ven_prefacdetalle_codcto_numpre>]
ON [dbo].[ven_prefacdetalle] ([codcto],[numpre])

GO

USE [Herradura]
GO
CREATE NONCLUSTERED INDEX [idx_ven_facdepre_cto_tip_num_numpre_codart]
ON [dbo].[ven_facdepre] ([idemp],[codcto],[tipfac],[numfac],[numpre],[codart])

GO

USE [Herradura]
GO
CREATE NONCLUSTERED INDEX [idx_ven_facturas_cto_fecfac_confiramda]
ON [dbo].[ven_facturas] ([idemp],[codcto],[fecfac],[confirmada])
INCLUDE ([tipfac],[numfac],[numcon])
GO