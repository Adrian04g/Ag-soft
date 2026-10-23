IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_accesorio')
begin 
CREATE TABLE [dbo].[alm_accesorio](
	[codac] [nvarchar](2) NOT NULL Default '',
	[nomac] [nvarchar](40) NOT NULL Default '',
-- CONSTRAINT [PK_alm_accesorio] PRIMARY KEY CLUSTERED 
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_alimfisico')
begin 
CREATE TABLE [dbo].[alm_alimfisico](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NULL,
	[anoinv] [decimal](4, 0) NULL,
	[mesinv] [decimal](2, 0) NULL,
	[codart] [nvarchar](10) NULL,
	[qty] [decimal](12, 2) NULL,
	[fecinv] [datetime] NULL
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_articulos')
begin 
CREATE TABLE [dbo].[alm_articulos](
	[codart] [nvarchar](10) NOT NULL,
	[nomart] [nvarchar](80) NOT NULL,
	[codgru] [nvarchar](3) NOT NULL,
	[codlin] [nvarchar](4) NOT NULL,
	[undart] [nvarchar](15) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[ruta] [nvarchar](254) NOT NULL,
	[comart] [bit] NOT NULL,
	[detart] [nvarchar](252) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[nompro] [nvarchar](50) NOT NULL,
	[codreg] [decimal](9, 0) NOT NULL,
	[codter] [nvarchar](15) NOT NULL,
	[codbar] [nvarchar](25) NOT NULL,
	[preart] [decimal](14, 2) NOT NULL,
	[refart] [nvarchar](30) NOT NULL,
	[impart] [decimal](6, 2) NOT NULL,
	[codcol] [nvarchar](3) NOT NULL,
	[masa] [nvarchar](2) NOT NULL,
	[acabado] [nvarchar](1) NOT NULL,
	[codac] [nvarchar](2) NOT NULL,
	[genero] [nvarchar](2) NOT NULL,
	[codmat] [nvarchar](2) NOT NULL,
	[extimg] [nvarchar](4) NOT NULL,
	[imgart] [nvarchar](max) NOT NULL,
	[tallas] [bit] NOT NULL,
	[ucompra] [datetime] NOT NULL,
	[porcom] [decimal](4, 3) NOT NULL,
	[ubic] [nvarchar](3) NOT NULL,
	[desperdicio] [decimal](10, 2) NOT NULL,
	[codmar] [nvarchar](3) NOT NULL,
	[inactivo] [bit] NOT NULL,
	[porutil] [decimal](8, 2) NOT NULL,
	[peso] [bit] NOT NULL,
	[unumfac] [nvarchar](10) NOT NULL,
	[codtalla] [nvarchar](2) NOT NULL,
	[calcivainclu] [decimal](1, 0) NOT NULL,
	[activo] [bit] NOT NULL,
	[promxcant] [bit] NOT NULL,
	[codrel] [nvarchar](10) NOT NULL,
	[planilla] [bit] NOT NULL,
	[precio] [decimal](14, 2) NOT NULL,
	[preciocos] [decimal](14, 2) NOT NULL,
	[preciocuc] [decimal](14, 2) NOT NULL,
	[pesocodbar] [bit] NOT NULL,
	[alquila] [bit] NOT NULL,
	[areac] [decimal](10, 0) NOT NULL,
	[areat] [decimal](10, 0) NOT NULL,
	[calle] [nvarchar](5) NOT NULL,
	[carrera] [nvarchar](5) NOT NULL,
	[codbarrio] [nvarchar](3) NOT NULL,
	[codciu] [nvarchar](3) NOT NULL,
	[coddpto] [nvarchar](3) NOT NULL,
	[codtipo] [nvarchar](2) NOT NULL,
	[estado] [decimal](1, 0) NOT NULL,
	[estrato] [nvarchar](1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fondo] [decimal](10, 0) NOT NULL,
	[frente] [decimal](10, 0) NOT NULL,
	[nitarren] [nvarchar](15) NOT NULL,
	[permuta] [bit] NOT NULL,
	[propietario] [nvarchar](15) NOT NULL,
	[vende] [bit] NOT NULL,
	[propio] [bit] NOT NULL,
	[comercial] [bit] NOT NULL,
	[cfm] [decimal](14, 2) NOT NULL,
	[clasificacion] [decimal](1, 0) NOT NULL,
	[clausulas] [decimal](2, 0) NOT NULL,
	[tipo] [decimal](1, 0) NOT NULL,
	[tipo2] [decimal](1, 0) NOT NULL,
	[up] [bit] NOT NULL,
	[nocomision] [bit] NOT NULL,
	[vlrcomision] [decimal](14, 2) NOT NULL,
	[variante] [bit] NOT NULL,
	[porimpo] [decimal](10, 2) NOT NULL,
	[valimpo] [decimal](14, 2) NOT NULL,
	[repo] [bit] NOT NULL,
	[ivacmp] [decimal](6, 2) NOT NULL,
	[dctoart] [decimal](6, 2) NOT NULL,
	[ivacero] [decimal](1, 0) NOT NULL,
	[cambiapre] [bit] NOT NULL
	) 
end 
GO 

IF NOT EXISTS (Select * From dbo.sysobjects Where name='alm_codbarras')
begin 
CREATE TABLE [dbo].[alm_codbarras](
	[codbarra] [nvarchar](25) NOT NULL,
	[codart] [nvarchar](10) NOT NULL
) 
end 
GO

IF NOT EXISTS (Select * From dbo.sysobjects Where name='alm_color')
begin 
CREATE TABLE [dbo].[alm_color](
	[color] [nvarchar](3) NULL,
	[nomcol] [nvarchar](30) NULL,
	[codcol] [nvarchar](3) NOT NULL

)
end 
GO

IF NOT EXISTS (Select * From dbo.sysobjects Where name='alm_conteoinv')
begin 
CREATE TABLE [dbo].[alm_conteoinv](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numcont] [nvarchar](8) NOT NULL,
	[fecha] [date] NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[qtyart] [decimal](14, 2) NULL,
	[estcont] [nvarchar](1) NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_costos')
begin 
CREATE TABLE [dbo].[alm_costos](
	[idemp] [nvarchar](3) NOT NULL,
	[codcosd] [numeric](20) NOT NULL,
	[nomcosd] [nvarchar](60) NOT NULL,
	[codcuec] [nvarchar](12) NOT NULL,
	[codcued] [nvarchar](12) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_detarifas')
begin 
CREATE TABLE [dbo].[alm_detarifas](
	[codalm] [nvarchar](3) NULL,
	[codins] [nvarchar](8) NULL,
	[valvta] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_detinvfisicos')
begin 
CREATE TABLE [dbo].[alm_detinvfisicos](
	[idinvfisicos] [int] NOT NULL,
	[codart] [nvarchar](10) NULL,
	[refart] [nvarchar](25) NULL,
	[nomart] [nvarchar](60) NULL,
	[qtysis] [decimal](14, 2) NULL,
	[valsis] [decimal](14, 2) NULL,
	[cosart] [decimal](14, 2) NULL,
	[qtyfis] [decimal](14, 2) NULL,
	[valfis] [decimal](14, 2) NULL,
	[qtydif] [decimal](8, 2) NULL,
	[valdif] [decimal](14, 2) NULL,
	[ok] [bit] NOT NULL,
	[codcue] [nvarchar](8) NULL,
	[motivo] [nvarchar](60) NULL,
	[codgru] [nvarchar](3) NULL,
	[nomgru] [nvarchar](60) NULL,
	[codlin] [nvarchar](3) NULL,
	[nomlin] [nvarchar](40) NULL,
	[codmar] [nvarchar](3) NULL,
	[nommar] [nvarchar](40) NULL,
	[codter] [nvarchar](12) NULL,
	[nompro] [nvarchar](60) NULL,
	[tiporeg] [decimal](1, 0) NULL,
	[qtyserial] [decimal](14, 2) NULL,
	[consigna] [bit] NOT NULL,
	[undart] [nvarchar](4) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_genero')
begin 
CREATE TABLE [dbo].[alm_genero](
		[codgen] [nvarchar](2) NOT NULL,
	[nomgen] [nvarchar](60) NULL,
	[genero] [nvarchar](1) NULL

)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_grupos')
begin 
CREATE TABLE [dbo].[alm_grupos](
	[codgru] [nvarchar](3) NOT NULL,
	[nomgru] [nvarchar](50) NOT NULL,
	[tipgru] [decimal](1, 0) NOT NULL,
	[ctacosto] [nvarchar](8) NOT NULL,
	[ctavta] [nvarchar](8) NOT NULL,
	[ctaret] [nvarchar](8) NOT NULL,
	[ctacmp] [nvarchar](8) NOT NULL,
	[tirbar] [bit] NOT NULL,
	[promocion] [bit] NOT NULL,
	[clasificacion] [nvarchar](1) NOT NULL,
	[rutaimp] [nvarchar](60) NOT NULL,
	[imagen] [nvarchar](20) NOT NULL,
	[consigna] [bit] NOT NULL,
	[inmuebles] [bit] NOT NULL,
	[codserial] [bit] NOT NULL,
	[planes] [bit] NOT NULL,
	[sincomision] [bit] NOT NULL,
	[longitud] [decimal](2, 0) NOT NULL,
	[horaini] [nvarchar](5) NOT NULL,
	[horafin] [nvarchar](5) NOT NULL,
	[dia1] [bit] NOT NULL,
	[dia2] [bit] NOT NULL,
	[dia3] [bit] NOT NULL,
	[dia4] [bit] NOT NULL,
	[dia5] [bit] NOT NULL,
	[dia6] [bit] NOT NULL,
	[dia7] [bit] NOT NULL,
	[ctacmpvta] [nvarchar](8) NOT NULL,
	[ctacmpdev] [nvarchar](8) NOT NULL,
	[ayudaingre] [bit] NOT NULL,
	[tipoplato] [bit] NOT NULL,
	[impdefault] [bit] NOT NULL
	
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_inventario')
begin 
CREATE TABLE [dbo].[alm_inventario](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[caninv] [float] NOT NULL,
	[valprom] [decimal](14, 2) NOT NULL,
	[ucoart] [decimal](14, 2) NOT NULL,
	[pvdart] [decimal](14, 2) NOT NULL,
	[pveart] [decimal](14, 2) NOT NULL,
	[pvmart] [decimal](14, 2) NOT NULL,
	[pvcart] [decimal](14, 2) NOT NULL,
	[pvaart] [decimal](14, 2) NOT NULL,
	[pvbart] [decimal](14, 2) NOT NULL,
	[minart] [decimal](14, 0) NOT NULL,
	[maxart] [decimal](14, 0) NOT NULL,
	[utcart] [decimal](10, 3) NOT NULL,
	[utdart] [decimal](10, 3) NOT NULL,
	[uteart] [decimal](10, 3) NOT NULL,
	[frainv] [decimal](12, 2) NOT NULL,
	[qtyfra] [decimal](12, 2) NOT NULL,
	[ucompra] [date] NOT NULL,
	[unumfac] [nvarchar](10) NOT NULL,
	[maxdcto] [decimal](14, 2) NOT NULL,
	[diascmp] [decimal](5, 0) NOT NULL,
	[diaseguri] [decimal](4, 0) NOT NULL,
	[fecordcmp] [date] NOT NULL,
	[tiemped] [nvarchar](4) NOT NULL,
	[invdia] [bit] NOT NULL,
	[invmes] [bit] NOT NULL,
	[frecuped] [numeric](2, 0) NOT NULL,
	[otrgas] [numeric](14, 2) NOT NULL,
	[artlogistic] [bit] NOT NULL,
	[artpromo] [bit] NOT NULL
	
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_inventario01')
begin 
CREATE TABLE [dbo].[alm_inventario01](
	[codalm] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[caninv] [float] NULL,
	[valprom] [decimal](14, 2) NULL,
	[ucoart] [decimal](14, 2) NULL,
	[pvdart] [decimal](14, 2) NULL,
	[pveart] [decimal](14, 2) NULL,
	[pvmart] [decimal](14, 2) NULL,
	[pvcart] [decimal](14, 2) NULL,
	[pvaart] [decimal](14, 2) NULL,
	[pvbart] [decimal](14, 2) NULL,
	[minart] [decimal](14, 0) NULL,
	[maxart] [decimal](14, 0) NULL,
	[utcart] [decimal](10, 3) NULL,
	[utdart] [decimal](10, 3) NULL,
	[uteart] [decimal](10, 3) NULL,
	[frainv] [decimal](12, 2) NULL,
	[qtyfra] [decimal](12, 2) NULL,
	[ucompra] [datetime] NULL,
	[unumfac] [nvarchar](10) NULL,
	[maxdcto] [decimal](14, 2) NULL,
	[diascmp] [decimal](5, 0) NULL,
	[diaseguri] [decimal](4, 0) NULL,
	[fecordcmp] [datetime] NULL,
	[tiemped] [nvarchar](4) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_invfisicos')
begin 
CREATE TABLE [dbo].[alm_invfisicos](
	[idinvfisicos] [int] IDENTITY(1,1) NOT NULL,
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[fecinv] [date] NULL,
	[mesinv] [decimal](2, 0) NULL,
	[añoinv] [decimal](4, 0) NULL,
	[detinv] [nvarchar](150) NULL,
	[procinv] [bit] NOT NULL,
	[idusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[detinvtalla] [nvarchar](150) NULL,
	[codgru] [nvarchar](3) NULL,
	[codter] [nvarchar](15) NULL,
	[codlin] [nvarchar](4) NULL,
	[codmar] [nvarchar](3) NULL,
	[tipo] [decimal](1, 0) NULL,
	[detserial] [nvarchar](150) NULL

) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_invfisicos01')
begin 
CREATE TABLE [dbo].[alm_invfisicos01](
	[codalm] [nvarchar](3) NULL,
	[fecinv] [datetime] NULL,
	[mesinv] [decimal](2, 0) NULL,
	[añoinv] [decimal](4, 0) NULL,
	[detinv] [nvarchar](max) NULL,
	[procinv] [bit] NOT NULL,
	[idusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[detinvtalla] [nvarchar](max) NULL,
	[codgru] [nvarchar](3) NULL,
	[codlin] [nvarchar](4) NULL,
	[codmar] [nvarchar](3) NULL,
	[codter] [nvarchar](15) NULL,
	[tipo] [decimal](1, 0) NULL,
	[detserial] [nvarchar](max) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_invtallas')
begin 
CREATE TABLE [dbo].[alm_invtallas](
	[codalm] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[a0] [decimal](12, 2) NULL,
	[a1] [decimal](12, 2) NULL,
	[a2] [decimal](12, 2) NULL,
	[a3] [decimal](12, 2) NULL,
	[a4] [decimal](12, 2) NULL,
	[a5] [decimal](12, 2) NULL,
	[a6] [decimal](12, 2) NULL,
	[a7] [decimal](12, 2) NULL,
	[a8] [decimal](12, 2) NULL,
	[a9] [decimal](12, 2) NULL,
	[b0] [decimal](12, 2) NULL,
	[b1] [decimal](12, 2) NULL,
	[b2] [decimal](12, 2) NULL,
	[b3] [decimal](12, 2) NULL,
	[b4] [decimal](12, 2) NULL,
	[b5] [decimal](12, 2) NULL,
	[b6] [decimal](12, 2) NULL,
	[b7] [decimal](12, 2) NULL,
	[b8] [decimal](12, 2) NULL,
	[b9] [decimal](12, 2) NULL,
	[c0] [decimal](12, 2) NULL,
	[c1] [decimal](12, 2) NULL,
	[c2] [decimal](12, 2) NULL,
	[c3] [decimal](12, 2) NULL,
	[c4] [decimal](12, 2) NULL,
	[c5] [decimal](12, 2) NULL,
	[c6] [decimal](12, 2) NULL,
	[c7] [decimal](12, 2) NULL,
	[c8] [decimal](12, 2) NULL,
	[c9] [decimal](12, 2) NULL,
	[d0] [decimal](12, 2) NULL,
	[d1] [decimal](12, 2) NULL,
	[d2] [decimal](12, 2) NULL,
	[d3] [decimal](12, 2) NULL,
	[d4] [decimal](12, 2) NULL,
	[d5] [decimal](12, 2) NULL,
	[d6] [decimal](12, 2) NULL,
	[d7] [decimal](12, 2) NULL,
	[d8] [decimal](12, 2) NULL,
	[d9] [decimal](12, 2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_kardex')
begin 
CREATE TABLE [dbo].[alm_kardex](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[fecmov] [date] NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[qtyart] [decimal](14, 2) NOT NULL,
	[cosart] [decimal](14, 2) NOT NULL,
	[valart] [decimal](14, 2) NOT NULL,
	[ivaart] [decimal](14, 2) NOT NULL,
	[totart] [decimal](14, 2) NOT NULL,
	[netart] [decimal](14, 2) NOT NULL,
	[traalm] [nvarchar](3) NOT NULL,
	[centra] [nvarchar](3) NOT NULL,
	[contra] [nvarchar](8) NOT NULL,
	[consec] [nvarchar](16) NOT NULL,
	[nitter] [nvarchar](15) NOT NULL,
	[observa] [nvarchar](80) NOT NULL,
	[estkar] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[qtypro] [decimal](14, 2) NOT NULL,
	[qtyfac] [decimal](14, 2) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[estord] [bit] NOT NULL,
	[despacho] [nvarchar](8) NOT NULL,
	[cendespach] [nvarchar](3) NOT NULL,
	[estserial] [nvarchar](1) NOT NULL,
	[codartrel] [nvarchar](10) NOT NULL,
	[docfac] [nvarchar](10) NOT NULL,
	[fecvence] [date] NOT NULL,
	[itemprefac] [decimal](3, 0) NOT NULL,
	[codprod] [nvarchar](10) NOT NULL,
	[valimpo] [decimal](14, 2) NOT NULL,
	[itemfac] [decimal](3, 0) NOT NULL,
	[porimpo] [numeric](6, 2) NOT NULL,
	[devpro] [numeric](10, 2) NOT NULL,
	[estexist] [nchar](1) NOT NULL,
	[regiserv] [nchar](1) NOT NULL,
	[usuconftra] [nvarchar](8) NOT NULL,
	[fecsysconftra] [datetime] NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_kardextemp')
begin 
CREATE TABLE [dbo].[alm_kardextemp](
	[idemp] [nchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[fecmov] [datetime] NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[qtyart] [decimal](14, 2) NOT NULL,
	[cosart] [decimal](14, 2) NOT NULL,
	[valart] [decimal](14, 2) NOT NULL,
	[ivaart] [decimal](14, 2) NOT NULL,
	[totart] [decimal](14, 2) NOT NULL,
	[netart] [decimal](14, 2) NOT NULL,
	[traalm] [nvarchar](3) NOT NULL,
	[centra] [nvarchar](3) NOT NULL,
	[contra] [nvarchar](8) NOT NULL,
	[consec] [nvarchar](16) NOT NULL,
	[nitter] [nvarchar](12) NOT NULL,
	[observa] [nvarchar](80) NOT NULL,
	[estkar] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](6) NOT NULL,
	[qtypro] [decimal](14, 2) NOT NULL,
	[qtyfac] [decimal](14, 2) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[numsal] [nvarchar](10) NOT NULL,
	[nument] [nvarchar](10) NOT NULL,
	[usuconftra] [nvarchar](8) NOT NULL,
	[fecsysconftra] [datetime] NOT NULL,
	[itemfac] [decimal](3, 0) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_karref')
begin 
CREATE TABLE [dbo].[alm_karref](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[fecmov] [date] NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[serial] [nvarchar](20) NOT NULL,
	[sim] [nvarchar](20) NOT NULL,
	[existencia] [bit] NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[comie] [decimal](14, 2) NOT NULL,
	[comision] [decimal](14, 2) NOT NULL,
	[iva] [decimal](14, 2) NOT NULL,
	[valart] [decimal](14, 2) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_karreftemp')
begin 
CREATE TABLE [dbo].[alm_karreftemp](
	[codalm] [nvarchar](3) NULL,
	[codcen] [nvarchar](3) NULL,
	[codcon] [nvarchar](2) NULL,
	[numcon] [nvarchar](8) NULL,
	[fecmov] [datetime] NULL,
	[codart] [nvarchar](10) NULL,
	[serial] [nvarchar](20) NULL,
	[sim] [nvarchar](20) NULL,
	[existencia] [bit] NOT NULL,
	[fecsys] [datetime] NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_kartallas')
begin 
CREATE TABLE [dbo].[alm_kartallas](
	[codcon] [nvarchar](2) NULL,
	[numcon] [nvarchar](8) NULL,
	[codalm] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[a0] [decimal](12, 0) NULL,
	[a1] [decimal](12, 0) NULL,
	[a2] [decimal](12, 0) NULL,
	[a3] [decimal](12, 0) NULL,
	[a4] [decimal](12, 0) NULL,
	[a5] [decimal](12, 0) NULL,
	[a6] [decimal](12, 0) NULL,
	[a7] [decimal](12, 0) NULL,
	[a8] [decimal](12, 0) NULL,
	[a9] [decimal](12, 0) NULL,
	[b0] [decimal](12, 0) NULL,
	[b1] [decimal](12, 0) NULL,
	[b2] [decimal](12, 0) NULL,
	[b3] [decimal](12, 0) NULL,
	[b4] [decimal](12, 0) NULL,
	[b5] [decimal](12, 0) NULL,
	[b6] [decimal](12, 0) NULL,
	[b7] [decimal](12, 0) NULL,
	[b8] [decimal](12, 0) NULL,
	[b9] [decimal](12, 0) NULL,
	[c0] [decimal](12, 0) NULL,
	[c1] [decimal](12, 0) NULL,
	[c2] [decimal](12, 0) NULL,
	[c3] [decimal](12, 0) NULL,
	[c4] [decimal](12, 0) NULL,
	[c5] [decimal](12, 0) NULL,
	[c6] [decimal](12, 0) NULL,
	[c7] [decimal](12, 0) NULL,
	[c8] [decimal](12, 0) NULL,
	[c9] [decimal](12, 0) NULL,
	[d0] [decimal](12, 0) NULL,
	[d1] [decimal](12, 0) NULL,
	[d2] [decimal](12, 0) NULL,
	[d3] [decimal](12, 0) NULL,
	[d4] [decimal](12, 0) NULL,
	[d5] [decimal](12, 0) NULL,
	[d6] [decimal](12, 0) NULL,
	[d7] [decimal](12, 0) NULL,
	[d8] [decimal](12, 0) NULL,
	[d9] [decimal](12, 0) NULL,
	[numfac] [nvarchar](10) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_lineas')
begin 
CREATE TABLE [dbo].[alm_lineas](
	[codlin] [nvarchar](4) NOT NULL,
	[nomlin] [nvarchar](50) NOT NULL,
	[codgru] [nvarchar](3) NOT NULL,
	[tirbar] [bit] NOT NULL
	
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_marcas')
begin 
CREATE TABLE [dbo].[alm_marcas](
	[codmar] [nvarchar](4) NOT NULL,
	[nommar] [nvarchar](40) NOT NULL

)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_material')
begin 
CREATE TABLE [dbo].[alm_material](
	[codmat] [nvarchar](2) NULL,
	[nommat] [nvarchar](40) NULL,
	[material] [nvarchar](1) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_planes')
begin 
CREATE TABLE [dbo].[alm_planes](
	[codplan] [nvarchar](3) NULL,
	[nomplan] [nvarchar](50) NULL,
	[tipo] [decimal](1, 0) NULL,
	[codclasi] [decimal](1, 0) NULL,
	[tipomovil] [nvarchar](2) NULL,
	[clausula] [bit] NOT NULL,
	[cfm] [decimal](14, 2) NULL,
	[ivaplan] [decimal](14, 2) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_precios')
begin 
CREATE TABLE [dbo].[alm_precios](
	[codalm] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[prlista] [decimal](14, 2) NULL,
	[descto] [decimal](14, 2) NULL,
	[cosart] [decimal](14, 2) NULL,
	[flete] [decimal](14, 2) NULL,
	[utilidad] [decimal](14, 2) NULL,
	[pvcart] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_precund')
begin 
CREATE TABLE [dbo].[alm_precund](
	[codart] [nvarchar](10) NULL,
	[medida] [decimal](14, 2) NULL,
	[precio] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_promo')
begin 
CREATE TABLE [dbo].[alm_promo](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numero] [nvarchar](10) NOT NULL,
	[fecha1] [datetime] NOT NULL,
	[fecha2] [datetime] NOT NULL,
	[hor1] [decimal](2, 0) NOT NULL,
	[min1] [decimal](2, 0) NOT NULL,
	[jor1] [nvarchar](2) NOT NULL,
	[hor2] [decimal](2, 0) NOT NULL,
	[min2] [decimal](2, 0) NOT NULL,
	[jor2] [nvarchar](2) NOT NULL,
	[dcto] [decimal](6, 2) NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[dia] [decimal](1, 0) NOT NULL,
	[tipo] [decimal](1, 0) NOT NULL,
	[todo] [bit] NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_promodet')
begin 
CREATE TABLE [dbo].[alm_promodet](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numero] [nvarchar](10) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[vrdcto] [decimal](6, 2) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_propiedad')
begin 
CREATE TABLE [dbo].[alm_propiedad](
	[codprop] [nvarchar](2) NULL,
	[nomprop] [nvarchar](20) NULL,
	[propiedad] [nvarchar](2) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_referencia')
begin 
CREATE TABLE [dbo].[alm_referencia](
	[codref] [nvarchar](10) NULL,
	[nomref] [nvarchar](30) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_serialvence')
begin 
CREATE TABLE [dbo].[alm_serialvence](
	[codcen] [nvarchar](3) NULL,
	[codalm] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[serial] [nvarchar](20) NULL,
	[fecfac] [datetime] NULL,
	[fecven] [datetime] NULL,
	[activo] [bit] NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_tallas')
begin 
CREATE TABLE [dbo].[alm_tallas](
	[codalm] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[a1] [decimal](12, 0) NULL,
	[a2] [decimal](12, 0) NULL,
	[a3] [decimal](12, 0) NULL,
	[a4] [decimal](12, 0) NULL,
	[a5] [decimal](12, 0) NULL,
	[a6] [decimal](12, 0) NULL,
	[a7] [decimal](12, 0) NULL,
	[a8] [decimal](12, 0) NULL,
	[b1] [decimal](12, 0) NULL,
	[b2] [decimal](12, 0) NULL,
	[b3] [decimal](12, 0) NULL,
	[b4] [decimal](12, 0) NULL,
	[b5] [decimal](12, 0) NULL,
	[b6] [decimal](12, 0) NULL,
	[b7] [decimal](12, 0) NULL,
	[b8] [decimal](12, 0) NULL,
	[c1] [decimal](12, 0) NULL,
	[c2] [decimal](12, 0) NULL,
	[c3] [decimal](12, 0) NULL,
	[c4] [decimal](12, 0) NULL,
	[c5] [decimal](12, 0) NULL,
	[c6] [decimal](12, 0) NULL,
	[c7] [decimal](12, 0) NULL,
	[c8] [decimal](12, 0) NULL,
	[d1] [decimal](12, 0) NULL,
	[d2] [decimal](12, 0) NULL,
	[d3] [decimal](12, 0) NULL,
	[d4] [decimal](12, 0) NULL,
	[d5] [decimal](12, 0) NULL,
	[d6] [decimal](12, 0) NULL,
	[d7] [decimal](12, 0) NULL,
	[d8] [decimal](12, 0) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_tallasart')
begin 
CREATE TABLE [dbo].[alm_tallasart](
	[codigo] [nvarchar](4) NOT NULL,
	[nombre] [nvarchar](20) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_tarifas')
begin 
CREATE TABLE [dbo].[alm_tarifas](
	[codtar] [nvarchar](3) NULL,
	[nomtar] [nvarchar](20) NULL,
	[añotar] [decimal](4, 0) NULL,
	[ivatar] [decimal](6, 2) NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_tipoin')
begin 
CREATE TABLE [dbo].[alm_tipoin](
	[codtipo] [nvarchar](2) NOT NULL,
	[nomtipo] [nvarchar](30) NULL
 
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_tipoplato')
begin 
CREATE TABLE [dbo].[alm_tipoplato](
	[idemp] [nvarchar](3) NOT NULL,
	[codtipo] [nvarchar](2) NOT NULL,
	[nomtipo] [nvarchar](30) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_tips')
begin 
CREATE TABLE [dbo].[alm_tips](
	[idemp] [nvarchar](3) NULL,
	[codtips] [nvarchar](3) NOT NULL,
	[codgru] [nvarchar](3) NULL,
	[nomtips] [nvarchar](80) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_unidades')
begin 
CREATE TABLE [dbo].[alm_unidades](
	[undcon] [nvarchar](3) NOT NULL,
	[undnom] [nvarchar](20) NOT NULL,
	[tipo] [decimal](1, 0) NOT NULL,
	[constante] [decimal](10, 3) NOT NULL,
	[factor] [decimal](10, 3) NOT NULL,
	[conversion] [decimal](10, 3) NOT NULL,
	[undglb] [nvarchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_variantes')
begin 
CREATE TABLE [dbo].[alm_variantes](
	[codart] [nvarchar](10) NOT NULL,
	[citem] [nvarchar](1) NOT NULL,
	[nomvar] [nvarchar](20) NOT NULL,
	[codgru] [nvarchar](3) NOT NULL,
	[qtypor] [decimal](14, 6) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[idemp] [nvarchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_vence')
begin 
CREATE TABLE [dbo].[alm_vence](
	[codcen] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[qtyven] [decimal](12, 2) NULL,
	[qtyfra] [decimal](12, 2) NULL,
	[fecven] [datetime] NULL,
	[lote] [nvarchar](20) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_vlrequipos')
begin 
CREATE TABLE [dbo].[alm_vlrequipos](
	[codart] [nvarchar](10) NULL,
	[codplan] [nvarchar](10) NULL,
	[clausula1] [decimal](14, 2) NULL,
	[clausula2] [decimal](14, 2) NULL,
	[clausula3] [decimal](14, 2) NULL,
	[clausula4] [decimal](14, 2) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_cancela')
begin 
CREATE TABLE [dbo].[com_cancela](
	[codcon] [nvarchar](3) NULL,
	[nomcan] [nvarchar](24) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_color')
begin 
CREATE TABLE [dbo].[com_color](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](100) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_conceptos')
begin 
CREATE TABLE [dbo].[com_conceptos](
	[idemp] [nvarchar](3) NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[nomcon] [nvarchar](40) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_consulta')
begin 
CREATE TABLE [dbo].[com_consulta](
	[codigo] [nvarchar](15) NULL,
	[nombre] [nvarchar](100) NULL,
	[telefono] [nvarchar](15) NULL,
	[producto] [nvarchar](50) NULL,
	[tiempo] [datetime] NULL,
	[observacion] [nvarchar](245) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_declaracion')
begin 
CREATE TABLE [dbo].[com_declaracion](
	[codcen] [nvarchar](3) NULL,
	[nitpro] [nvarchar](15) NULL,
	[docfac] [nvarchar](10) NULL,
	[numdoc] [nvarchar](30) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_despiece')
begin 
CREATE TABLE [dbo].[com_despiece](
	[codart] [nvarchar](10) NULL,
	[qtyart] [decimal](12, 2) NULL,
	[numreq] [nvarchar](8) NULL,
	[fecha] [datetime] NULL,
	[usuario] [nvarchar](8) NULL,
	[fecsys] [datetime] NULL,
	[codprod] [nvarchar](10) NULL,
	[codcen] [nvarchar](3) NULL,
	[numord] [nvarchar](10) NULL,
	[colart] [nvarchar](3) NULL,
	[observa] [nvarchar](max) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_detrequi')
begin 
CREATE TABLE [dbo].[com_detrequi](
	[codcen] [nvarchar](3) NULL,
	[numreq] [nvarchar](8) NULL,
	[codart] [nvarchar](10) NULL,
	[undart] [nvarchar](3) NULL,
	[totart] [decimal](12, 2) NULL,
	[qtyart] [decimal](8, 0) NULL,
	[cosart] [decimal](12, 2) NULL,
	[descrip] [nvarchar](max) NULL,
	[numord] [nvarchar](8) NULL,
	[qtyped] [decimal](14, 2) NULL,
	[codest] [nvarchar](3) NULL,
	[fecini] [datetime] NULL,
	[fecfin] [datetime] NULL,
	[colorped] [nvarchar](3) NULL,
	[colorfor] [nvarchar](3) NULL,
	[colforb] [nvarchar](3) NULL,
	[marca] [nvarchar](3) NULL,
	[tipo] [nvarchar](3) NULL,
	[modelo] [nvarchar](3) NULL,
	[material] [nvarchar](3) NULL,
	[tipsup] [nvarchar](3) NULL,
	[colorpue] [nvarchar](3) NULL,
	[colorper] [nvarchar](3) NULL,
	[colorpan1] [nvarchar](3) NULL,
	[colorpan2] [nvarchar](3) NULL,
	[colorsill] [nvarchar](3) NULL,
	[matepan] [nvarchar](3) NULL,
	[matesill] [nvarchar](3) NULL,
	[vidrio] [decimal](1, 0) NULL,
	[tipoped] [nvarchar](3) NULL,
	[tipforpan] [nvarchar](3) NULL,
	[colfor1] [nvarchar](3) NULL,
	[colfor2] [nvarchar](3) NULL,
	[tippuer] [nvarchar](3) NULL,
	[colfal] [nvarchar](5) NULL,
	[colsup] [nvarchar](3) NULL,
	[ejecu] [decimal](1, 0) NULL,
	[tipfal] [nvarchar](3) NULL,
	[tipgru] [decimal](1, 0) NULL,
	[valor] [decimal](12, 0) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_estados')
begin 
CREATE TABLE [dbo].[com_estados](
	[numreq] [nvarchar](10) NULL,
	[codcen] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NULL,
	[observacion] [nvarchar](max) NULL,
	[fecha] [datetime] NULL,
	[usuario] [nvarchar](8) NULL,
	[tipo] [nvarchar](3) NULL,
	[fecfin] [datetime] NULL,
	[fecsys] [datetime] NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_facdescuentos')
begin 
CREATE TABLE [dbo].[com_facdescuentos](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[coddes] [nvarchar](3) NOT NULL,
	[base] [decimal](14, 2) NOT NULL,
	[pordes] [decimal](6, 2) NOT NULL,
	[valdes] [decimal](14, 2) NOT NULL,
	[tipdes] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_facdetalle')
begin 
CREATE TABLE [dbo].[com_facdetalle](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[totart] [decimal](12, 2) NOT NULL,
	[desart] [decimal](12, 2) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[impart] [decimal](6, 2) NOT NULL,
	[sia] [decimal](14, 2) NOT NULL,
	[qtyart] [float] NOT NULL,
	[devart] [float] NOT NULL,
	[cosart] [decimal](12, 2) NOT NULL,
	[descrip] [nvarchar](max) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codact] [nvarchar](10) NOT NULL,
	[tipord] [nvarchar](2) NOT NULL,
	[ivaartinf] [decimal](6, 2) NOT NULL,
	[item] [decimal](3, 0) NOT NULL,
	[ppublico] [decimal](14, 2) NOT NULL,
	[pordes] [decimal](18, 0) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_facdetremi')
begin 
CREATE TABLE [dbo].[com_facdetremi](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[qtyart] [decimal](12, 3) NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_facturas')
begin 
CREATE TABLE [dbo].[com_facturas](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[fecfac] [date] NOT NULL,
	[venfac] [date] NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[nitpro] [nvarchar](12) NOT NULL,
	[valfac] [decimal](12, 0) NOT NULL,
	[desfac] [decimal](12, 2) NOT NULL,
	[ivafac] [decimal](12, 0) NOT NULL,
	[impfac] [decimal](12, 0) NOT NULL,
	[poriva] [decimal](8, 3) NOT NULL,
	[retiva] [decimal](12, 2) NOT NULL,
	[devfac] [decimal](12, 0) NOT NULL,
	[abofac] [decimal](12, 0) NOT NULL,
	[netfac] [decimal](12, 0) NOT NULL,
	[estfac] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[docfac] [nvarchar](15) NOT NULL,
	[codcue2] [nvarchar](8) NOT NULL,
	[vrxser] [decimal](12, 2) NOT NULL,
	[despacho] [nvarchar](8) NOT NULL,
	[cendespach] [nvarchar](3) NOT NULL,
	[ivamayorvr] [decimal](14, 2) NOT NULL,
	[cambioFact] [nvarchar](14) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_gasdetalle')
begin 
CREATE TABLE [dbo].[com_gasdetalle](
	[codcen] [nvarchar](3) NULL,
	[tipdoc] [nvarchar](2) NULL,
	[numdoc] [nvarchar](8) NULL,
	[codcto] [nvarchar](3) NULL,
	[codconcep] [nvarchar](2) NULL,
	[descrip] [nvarchar](100) NULL,
	[codcue] [nvarchar](8) NULL,
	[valcon] [decimal](14, 2) NULL,
	[ivacon] [decimal](14, 2) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_gasimportacion')
begin 
CREATE TABLE [dbo].[com_gasimportacion](
	[codcen] [nvarchar](3) NULL,
	[nitpro] [nvarchar](15) NULL,
	[docfac] [nvarchar](10) NULL,
	[fecfac] [datetime] NULL,
	[tascam] [decimal](14, 2) NULL,
	[arancel] [decimal](10, 2) NULL,
	[gassia] [decimal](14, 2) NULL,
	[fledol] [decimal](14, 2) NULL,
	[flepes] [decimal](14, 2) NULL,
	[otrgas] [decimal](14, 2) NULL,
	[gastot] [decimal](14, 2) NULL,
	[observa] [nvarchar](max) NULL,
	[facsia] [nvarchar](10) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_gastos')
begin 
CREATE TABLE [dbo].[com_gastos](
	[codcen] [nvarchar](3) NULL,
	[tipdoc] [nvarchar](2) NULL,
	[numdoc] [nvarchar](8) NULL,
	[nitpro] [nvarchar](15) NULL,
	[fecdoc] [datetime] NULL,
	[fecven] [datetime] NULL,
	[codcue] [nvarchar](8) NULL,
	[vtafac] [decimal](14, 2) NULL,
	[ivafac] [decimal](14, 2) NULL,
	[totimp] [decimal](14, 2) NULL,
	[netfac] [decimal](14, 2) NULL,
	[estgas] [nvarchar](1) NULL,
	[detalle] [nvarchar](250) NULL,
	[docfac] [nvarchar](10) NULL,
	[codemp] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[fecsysest] [datetime] NULL,
	[fecsyscau] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[codusuest] [nvarchar](10) NULL,
	[codusucau] [nvarchar](10) NULL,
	[tipfac] [nvarchar](2) NULL,
	[numfac] [nvarchar](8) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_material')
begin 
CREATE TABLE [dbo].[com_material](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](100) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_medio')
begin 
CREATE TABLE [dbo].[com_medio](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](100) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_modelo')
begin 
CREATE TABLE [dbo].[com_modelo](
		[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](100) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_movpro')
begin 
CREATE TABLE [dbo].[com_movpro](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[doccom] [nvarchar](8) NOT NULL,
	[tipdoc] [nvarchar](2) NOT NULL,
	[feccom] [date] NOT NULL,
	[nitpro] [nvarchar](15) NOT NULL,
	[afecen] [nvarchar](3) NOT NULL,
	[afetip] [nvarchar](2) NOT NULL,
	[afedoc] [nvarchar](8) NOT NULL,
	[debcom] [decimal](14, 2) NOT NULL,
	[crecom] [decimal](14, 2) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[estmov] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_notas')
begin 
CREATE TABLE [dbo].[com_notas](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipnot] [nvarchar](2) NOT NULL,
	[numnot] [nvarchar](8) NOT NULL,
	[fecnot] [date] NOT NULL,
	[valnot] [decimal](14, 2) NOT NULL,
	[valiva] [decimal](14, 2) NOT NULL,
	[concepto] [nvarchar](max) NOT NULL,
	[afecen] [nvarchar](3) NOT NULL,
	[afetip] [nvarchar](2) NOT NULL,
	[afedoc] [nvarchar](8) NOT NULL,
	[devpro] [bit] NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[impnota] [decimal](14, 2) NOT NULL,
	[estnot] [nvarchar](1) NOT NULL,
	[abofact] [decimal](14, 2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_notastemp')
begin 
	CREATE TABLE [dbo].[com_notastemp](
		[idemp] [nvarchar](3) NOT NULL,
		[codcto] [nvarchar](3) NOT NULL,
		[tipnot] [nvarchar](2) NOT NULL,
		[numnot] [nvarchar](8) NOT NULL,
		[fecnot] [datetime] NOT NULL,
		[valnot] [decimal](14, 2) NOT NULL,
		[valiva] [decimal](14, 2) NOT NULL,
		[concepto] [nvarchar](2) NOT NULL,
		[afecen] [nvarchar](3) NOT NULL,
		[afetip] [nvarchar](2) NOT NULL,
		[observa] [nvarchar](100) NOT NULL,
		[estnota] [nvarchar](1) NOT NULL,
		[nitpro] [nvarchar](15) NOT NULL,
		[codusu] [nvarchar](10) NOT NULL,
		[fecsys] [datetime] NOT NULL,
		[codusucruce] [nvarchar](10) NOT NULL,
		[numnotcruce] [nvarchar](8) NOT NULL,
		[feccruce] [datetime] NOT NULL,
		[tipnotcruce] [nvarchar](2) NOT NULL,
		[afedoc] [nvarchar](8) NOT NULL,
		[valorcruce] [decimal](14, 2) NOT NULL,
		[codcencruce] [nvarchar](3) NOT NULL
	)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_orddetalle')
begin 
CREATE TABLE [dbo].[com_orddetalle](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[totart] [decimal](12, 2) NOT NULL,
	[desart] [decimal](12, 2) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[impart] [decimal](6, 2) NOT NULL,
	[sia] [decimal](14, 2) NOT NULL,
	[qtyart] [float] NOT NULL,
	[devart] [float] NOT NULL,
	[cosart] [decimal](12, 2) NOT NULL,
	[descrip] [nvarchar](max) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[qtyped] [decimal](14, 2) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[colart] [nvarchar](3) NOT NULL,
	[numreq] [nvarchar](8) NOT NULL,
	[pordes] [decimal](14, 2) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[ivaartinf] [decimal](6, 2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[itemfac] [decimal](5, 0) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_ordenes')
begin 
CREATE TABLE [dbo].[com_ordenes](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[fecfac] [date] NOT NULL,
	[venfac] [date] NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[nitpro] [nvarchar](12) NOT NULL,
	[valfac] [decimal](12, 0) NOT NULL,
	[desfac] [decimal](12, 2) NOT NULL,
	[ivafac] [decimal](12, 0) NOT NULL,
	[impfac] [decimal](12, 0) NOT NULL,
	[poriva] [decimal](8, 3) NOT NULL,
	[retiva] [decimal](12, 2) NOT NULL,
	[devfac] [decimal](12, 0) NOT NULL,
	[abofac] [decimal](12, 0) NOT NULL,
	[netfac] [decimal](12, 0) NOT NULL,
	[estfac] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[docfac] [nvarchar](10) NOT NULL,
	[fecdocfac] [date] NOT NULL,
	[tipdocfac] [nvarchar](3) NOT NULL,
	[fecent] [date] NOT NULL,
	[codcan] [nvarchar](2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL

) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_parametros')
begin 
CREATE TABLE [dbo].[com_parametros](
	[idemp] [nvarchar](3) NOT NULL,
	[ivainclu] [bit] NOT NULL,
	[unialm] [bit] NOT NULL,
	[invtran] [nvarchar](2) NOT NULL,
	[pordes] [bit] NOT NULL,
	[promcos] [bit] NOT NULL,
	[valorayuda] [decimal](1, 0) NOT NULL,
	[diasvenci] [decimal](10, 0) NOT NULL,
	[reemplazacos] [bit] NOT NULL,
	[noreversainv] [bit] NOT NULL,
	[noversaen] [bit] NOT NULL,
	[centroscomp] [bit] NOT NULL,
	[reversaen] [bit] NOT NULL,
	[entcomp] [nvarchar](2) NOT NULL,
	[desactplazo] [bit] NOT NULL,
	[variosivas] [bit] NOT NULL,
	[anticipo] [bit] NOT NULL,
	[ingserial] [bit] NOT NULL,
	[ctaant] [nvarchar](10) NOT NULL,
	[digitarvl] [bit] NOT NULL,
	[modiva] [bit] NOT NULL,
	[actprecios] [bit] NOT NULL,
	[poractprec] [decimal](10, 0) NOT NULL,
	[roundoc] [bit] NOT NULL,
	[blooptimp] [bit] NOT NULL,
	[valimp] [decimal](1, 0) NOT NULL,
	[ctaxegre] [bit] NOT NULL,
	[totinfcxp] [bit] NOT NULL,
	[repitem] [bit] NOT NULL,
	[ivainf] [bit] NOT NULL,
	[dcto100] [bit] NOT NULL,
	[ivaantdcto] [bit] NOT NULL,
	[valpromitem] [bit] NOT NULL,
	[actpredig] [bit] NOT NULL,
	[uniqtyart] [bit] NOT NULL,
	[actrete] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_pordes')
begin 
CREATE TABLE [dbo].[com_pordes](
	[idemp] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](10) NOT NULL,
	[pordes] [decimal](10, 2) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[vrdesc] [decimal](10, 2) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_requi')
begin 
CREATE TABLE [dbo].[com_requi](
	[codcen] [nvarchar](3) NULL,
	[numreq] [nvarchar](8) NULL,
	[fecfac] [datetime] NULL,
	[nitsol] [nvarchar](15) NULL,
	[estfac] [nvarchar](1) NULL,
	[observa] [nvarchar](max) NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](8) NULL,
	[nitcli] [nvarchar](15) NULL,
	[orden] [nvarchar](10) NULL,
	[cotiza] [nvarchar](10) NULL,
	[medio] [nvarchar](3) NULL,
	[plano] [nvarchar](10) NULL,
	[total] [decimal](12, 0) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_tipestados')
begin 
CREATE TABLE [dbo].[com_tipestados](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](100) NULL,
	[tipo] [bit] NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_tipos')
begin 
CREATE TABLE [dbo].[com_tipos](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](200) NULL,
	[silla] [bit] NOT NULL,
	[modelo] [bit] NOT NULL,
	[material] [bit] NOT NULL,
	[tela] [bit] NOT NULL,
	[formica] [bit] NOT NULL,
	[superficie] [bit] NOT NULL,
	[pedestal] [bit] NOT NULL,
	[perfil] [bit] NOT NULL,
	[puerta] [bit] NOT NULL,
	[falda] [bit] NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_tipotela')
begin 
CREATE TABLE [dbo].[com_tipotela](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](100) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_cargapuc')
begin 
CREATE TABLE [dbo].[con_cargapuc](
	[codcue] [nvarchar](8) NULL,
	[nomcue] [nvarchar](40) NULL,
	[auxcue] [bit] NOT NULL,
	[numche] [decimal](10, 0) NULL,
	[retcue] [bit] NOT NULL,
	[ajucue] [bit] NOT NULL,
	[porret] [decimal](5, 2) NULL,
	[monto] [decimal](14, 2) NULL,
	[ctajustd] [nvarchar](8) NULL,
	[ctajustc] [nvarchar](8) NULL,
	[depcue] [bit] NOT NULL,
	[añodep] [decimal](2, 0) NULL,
	[sancue] [decimal](15, 2) NULL,
	[d01cue] [decimal](15, 2) NULL,
	[c01cue] [decimal](15, 2) NULL,
	[d02cue] [decimal](15, 2) NULL,
	[c02cue] [decimal](15, 2) NULL,
	[d03cue] [decimal](15, 2) NULL,
	[c03cue] [decimal](15, 2) NULL,
	[d04cue] [decimal](15, 2) NULL,
	[c04cue] [decimal](15, 2) NULL,
	[d05cue] [decimal](15, 2) NULL,
	[c05cue] [decimal](15, 2) NULL,
	[d06cue] [decimal](15, 2) NULL,
	[c06cue] [decimal](15, 2) NULL,
	[d07cue] [decimal](15, 2) NULL,
	[c07cue] [decimal](15, 2) NULL,
	[d08cue] [decimal](15, 2) NULL,
	[c08cue] [decimal](15, 2) NULL,
	[d09cue] [decimal](15, 2) NULL,
	[c09cue] [decimal](15, 2) NULL,
	[d10cue] [decimal](15, 2) NULL,
	[c10cue] [decimal](15, 2) NULL,
	[d11cue] [decimal](15, 2) NULL,
	[c11cue] [decimal](15, 2) NULL,
	[d12cue] [decimal](15, 2) NULL,
	[c12cue] [decimal](15, 2) NULL,
	[natcue] [nvarchar](1) NULL,
	[nivcue] [decimal](1, 0) NULL,
	[centro] [bit] NOT NULL,
	[inf] [bit] NOT NULL,
	[tercero] [bit] NOT NULL,
	[formato] [nvarchar](60) NULL,
	[tipo] [nvarchar](60) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_cencostos')
begin 
CREATE TABLE [dbo].[con_cencostos](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[nomcto] [nvarchar](40) NULL,
	[codrel] [nvarchar](33) NOT NULL,
	[almfac] [nvarchar](3) NOT NULL,
	[domtran] [bit] NOT NULL,
	[ctacaj] [nvarchar](8) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_comprobante')
begin 
CREATE TABLE con_comprobante (
	[idemp]		[nvarchar](3) NULL,
	[codalm]	[nvarchar](3) NOT NULL,
	[codcen]	[nvarchar](3) NOT NULL,
	[codcto]	[nvarchar](3) NOT NULL,
	[codtran]	[nvarchar](2) NOT NULL,
	[consec]	[nvarchar](16) NOT NULL,
	[codctodet] [nvarchar](3) NOT NULL,
	[fecdoc]	[date]		  NOT NULL,
	[codcue]	[nvarchar](8) NOT NULL,
	[nitter]	[nvarchar](15) NOT NULL,
	[detalle]	[nvarchar](90) NOT NULL,
	[debito]	[decimal] (14,2) NOT NULL,
	[credito]	[decimal] (14,2) NOT NULL,
	[fecsys]	[datetime]	   NOT NULL,
	[codusu]	[nvarchar](8)  NOT NULL,
	[estcomp]	[nvarchar](1)  NOT NULL,
	[numche]	[nvarchar](10) NOT NULL,
	[codact]	[nvarchar](10) NOT NULL,
	[base]		[decimal] (14,2) NOT NULL,
	[turno]		[decimal] (10,0) NOT NULL,
	[estconcili] [nvarchar](1) NOT NULL,
	[codimp]	[nvarchar](3)  NOT NULL,
	[ctacomitar] [nvarchar](8) NOT NULL,
	[nitter2]	[nvarchar](15) NOT NULL,
	[saldoa]	[bit]		   NOT NULL,
	[ivamayvlr] [numeric] (14,2) NOT NULL,
	[rowguid]	[uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[itemdoc]	[numeric] (6) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_comprobtmp')
begin 
CREATE TABLE [dbo].[con_comprobtmp](
	[idemp] [nvarchar](3) NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[codtran] [nvarchar](2) NOT NULL,
	[consec] [nvarchar](16) NOT NULL,
	[codctodet] [nvarchar](3) NOT NULL,
	[fecdoc] [date] NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[nitter] [nvarchar](15) NOT NULL,
	[detalle] [nvarchar](90) NOT NULL,
	[debito] [decimal](14, 2) NOT NULL,
	[credito] [decimal](14, 2) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[estcomp] [nvarchar](1) NOT NULL,
	[numche] [nvarchar](10) NOT NULL,
	[codact] [nvarchar](10) NOT NULL,
	[base] [decimal](14, 2) NOT NULL,
	[turno] [decimal](10, 0) NOT NULL,
	[estconcili] [nvarchar](1) NOT NULL,
	[codimp] [nvarchar](3) NOT NULL,
	[ctacomitar] [nvarchar](8) NOT NULL,
	[nitter2] [nvarchar](15) NOT NULL,
	[saldoa] [bit] NOT NULL,
	[ident] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ivamayvlr] [numeric](14, 2) NOT NULL
) 
end 
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregada Junio 9 de 2015 - Éduar Álvarez
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS(Select * From dbo.sysobjects Where name='Con_ComproNIIF')
begin
CREATE TABLE Con_ComproNIIF (
	[idemp]		 nvarchar(3)	NOT NULL Default '',
	[codcen]	 nvarchar(3)	NOT NULL Default '',
	[codcto]	 nvarchar(3)	NOT NULL Default '',
	[codtran]	 nvarchar(2)	NOT NULL Default '',
	[consec]	 nvarchar(16)	NOT NULL Default '',
	[itemdoc]	 numeric (6)	NOT NULL Default 00,
	[codctodet]  nvarchar(3)	NOT NULL Default '',
	[fecdoc]	 date			NOT NULL Default GetDate(),
	[codcue]	 nvarchar(8)	NOT NULL Default '',
	[nitter]	 nvarchar(15)	NOT NULL Default '',
	[detalle]	 nvarchar(90)	NOT NULL Default '',
	[debito]	 decimal (14,2)	NOT NULL Default 00,
	[credito]	 decimal (14,2)	NOT NULL Default 00,
	[codusu]	 nvarchar(8)	NOT NULL Default '',
	[estcomp]	 nvarchar(1)	NOT NULL Default '',
	[numche]	 nvarchar(10)	NOT NULL Default '',
	[codact]	 nvarchar(10)	NOT NULL Default '',
	[base]		 decimal (14,2)	NOT NULL Default 00,
	[turno]		 decimal (10,0)	NOT NULL Default 00,
	[estconcili] nvarchar(1)	NOT NULL Default '',
	[codimp]	 nvarchar(3)	NOT NULL Default '',
	[ctacomitar] nvarchar(8)	NOT NULL Default '',
	[nitter2]	 nvarchar(15)	NOT NULL Default '',
	[saldoa]	 bit			NOT NULL Default 00,
	[ivamayvlr]  numeric (14,2)	NOT NULL Default 00,
	[contrato]	 nvarchar(10)	NOT NULL Default '',
	[codusumod]	 nvarchar(10)	NOT NULL Default '',
	[fecsys]	 datetime		NOT NULL Default GetDate(),
	[fecsysmod]	 datetime		NOT NULL Default GetDate(),
	[rowguid]	 uniqueidentifier RowGuidCol NOT NULL Default NewID()
)
end
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregada por Éduar Álvarez - Junio 12 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (Select * From dbo.sysobjects Where name='Con_PucNIIF')
begin
	CREATE TABLE con_pucniif (	 	
	[codcueNiif] nvarchar(8)	NOT NULL Default '',
	[nomcueNiif] nvarchar(40)	NOT NULL Default '',
	[auxcue]	 bit			NOT NULL Default 00,
	[numche]	 decimal(10,0)	NOT NULL Default 00,
	[retcue]	 bit			NOT NULL Default 00,
	[ajucue]	 bit			NOT NULL Default 00,
	[porret]	 decimal(5,2)	NOT NULL Default 00,
	[monto]		 decimal(14,2)	NOT NULL Default 00,
	[ctajustd]	 nvarchar(8)	NOT NULL Default '',
	[ctajustc]	 nvarchar(8)	NOT NULL Default '',
	[depcue]	 bit			NOT NULL Default 00,
	[añodep]	 decimal(2,0)	NOT NULL Default 00,
	[sancue]	 decimal(15,2)	NOT NULL Default 00,
	[natcue]	 nvarchar(1)	NOT NULL Default '',
	[nivcue]	 decimal(1, 0)	NOT NULL Default 00,
	[centro]	 bit			NOT NULL Default 00,
	[tercero]	 bit			NOT NULL Default 00,
	[inf]		 bit			NOT NULL Default 00,
	[formato]	 nvarchar(60)	NOT NULL Default '',
	[codadd]	 nvarchar(2)	NOT NULL Default '',
	[poriva]	 decimal(6, 2)	NOT NULL Default 00,
	[ivacue]	 bit			NOT NULL Default 00,
	[macentro]	 bit			NOT NULL Default 00,
	[manit]		 bit			NOT NULL Default 00,
	[manitbco]	 bit			NOT NULL Default 00,
	[nitbco]	 nvarchar(15)	NOT NULL Default '',
	[ctaegrcaj]  bit			NOT NULL Default 00,
	[tiprete]	 decimal(1, 0)	NOT NULL Default 00,
	[diferido]	 bit			NOT NULL Default 00,
	[ctagasdife] nvarchar(8)	NOT NULL Default '',
	[manactivo]  bit			NOT NULL Default 00,
	[ctaori]	 bit			NOT NULL Default 00
)
end
Go
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregada por Éduar Álvarez - Mayo 26 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (Select * From dbo.sysobjects Where name='Con_GrupoNIIF')
begin
	CREATE TABLE con_gruponiif ( codigo	[nVarChar](2)	NOT NULL DEFAULT ''
								,nombre	[nVarChar](50)	NOT NULL DEFAULT '')
end
Go
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregada por Éduar Álvarez - Junio 9 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (Select * From dbo.sysobjects Where name='Con_CtaCtoNIIF')
begin
	CREATE TABLE Con_CtaCtoNIIF (
		[idemp]		nvarchar(3)		NOT NULL Default '',
		[año]		Numeric (4)	    NOT NULL Default 00,
		[codcto]	nVarchar(3)	    NOT NULL Default '',
		[codcue]	nvarchar(8)	    NOT NULL Default '',
		[natcue]	nvarchar(1)     NOT NULL Default '',
		[sancue]	Decimal (16,2)  NOT NULL Default 00,
		[d01cue]	Decimal (16,2)  NOT NULL Default 00,
		[c01cue]	Decimal (16,2)  NOT NULL Default 00,
		[d02cue]	Decimal (16,2)  NOT NULL Default 00,
		[c02cue]	Decimal (16,2)  NOT NULL Default 00,
		[d03cue]	Decimal (16,2)  NOT NULL Default 00,
		[c03cue]	Decimal (16,2)  NOT NULL Default 00,
		[d04cue]	Decimal (16,2)  NOT NULL Default 00,
		[c04cue]	Decimal (16,2)  NOT NULL Default 00,
		[d05cue]	Decimal (16,2)  NOT NULL Default 00,
		[c05cue]	Decimal (16,2)  NOT NULL Default 00,
		[d06cue]	Decimal (16,2)  NOT NULL Default 00,
		[c06cue]	Decimal (16,2)  NOT NULL Default 00,
		[d07cue]	Decimal (16,2)  NOT NULL Default 00,
		[c07cue]	Decimal (16,2)  NOT NULL Default 00,
		[d08cue]	Decimal (16,2)  NOT NULL Default 00,
		[c08cue]	Decimal (16,2)  NOT NULL Default 00,
		[d09cue]	Decimal (16,2)  NOT NULL Default 00,
		[c09cue]	Decimal (16,2)  NOT NULL Default 00,
		[d10cue]	Decimal (16,2)  NOT NULL Default 00,
		[c10cue]	Decimal (16,2)  NOT NULL Default 00,
		[d11cue]	Decimal (16,2)  NOT NULL Default 00,
		[c11cue]	Decimal (16,2)  NOT NULL Default 00,
		[d12cue]	Decimal (16,2)  NOT NULL Default 00,
		[c12cue]	Decimal (16,2)  NOT NULL Default 00)

	end
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_conmedios')
begin 
CREATE TABLE [dbo].[con_conmedios](
	[idemp] [nvarchar](3) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[codcon] [nvarchar](4) NULL,
	[codmedio] [nvarchar](4) NULL,
	[tope] [decimal](12, 2) NULL,
	[nitter] [nvarchar](15) NULL,
	[numcolum] [nvarchar](2) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='Con_CtaCenCostos')
begin 
CREATE TABLE [dbo].[con_ctacencostos](
	[idemp]  [nvarchar](3) NOT NULL,
	[año]	 [Numeric](4)  NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[natcue] [nvarchar](1) NOT NULL,
	[sancue] [decimal](14, 2) NOT NULL,
	[d01cue] [decimal](14, 2) NOT NULL,
	[c01cue] [decimal](14, 2) NOT NULL,
	[d02cue] [decimal](14, 2) NOT NULL,
	[c02cue] [decimal](14, 2) NOT NULL,
	[d03cue] [decimal](14, 2) NOT NULL,
	[c03cue] [decimal](14, 2) NOT NULL,
	[d04cue] [decimal](14, 2) NOT NULL,
	[c04cue] [decimal](14, 2) NOT NULL,
	[d05cue] [decimal](14, 2) NOT NULL,
	[c05cue] [decimal](14, 2) NOT NULL,
	[d06cue] [decimal](14, 2) NOT NULL,
	[c06cue] [decimal](14, 2) NOT NULL,
	[d07cue] [decimal](14, 2) NOT NULL,
	[c07cue] [decimal](14, 2) NOT NULL,
	[d08cue] [decimal](14, 2) NOT NULL,
	[c08cue] [decimal](14, 2) NOT NULL,
	[d09cue] [decimal](14, 2) NOT NULL,
	[c09cue] [decimal](14, 2) NOT NULL,
	[d10cue] [decimal](14, 2) NOT NULL,
	[c10cue] [decimal](14, 2) NOT NULL,
	[d11cue] [decimal](14, 2) NOT NULL,
	[c11cue] [decimal](14, 2) NOT NULL,
	[d12cue] [decimal](14, 2) NOT NULL,
	[c12cue] [decimal](14, 2) NOT NULL)

end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_division')
begin 
CREATE TABLE [dbo].[con_division](
	[codigo] [nvarchar](3) NOT NULL,
	[nombre] [nvarchar](60) NOT NULL,
	[codrel] [nvarchar](33) NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_foldetalle')
begin 
CREATE TABLE [dbo].[con_foldetalle](
	[idemp] [nvarchar](3) NOT NULL,
	[codlib] [nvarchar](2) NOT NULL,
	[numcop] [int] NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_folios')
begin 
CREATE TABLE [dbo].[con_folios](
	[idemp] [nvarchar](3) NOT NULL,
	[codlib] [nvarchar](2) NOT NULL,
	[nomlib] [nvarchar](40) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_medios')
begin 
CREATE TABLE [dbo].[con_medios](
	[codigo] [nvarchar](4) NULL,
	[nombre] [nvarchar](200) NULL,
	[codmedio] [nvarchar](4) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_mescierre')
begin 
CREATE TABLE [dbo].[con_mescierre](
	[cerrar] [bit] NOT NULL,
	[idemp] [nvarchar](3) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[año] [decimal](4, 0) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_parametros')
begin 
CREATE TABLE [dbo].[con_parametros](
	[idemp] [nvarchar](3) NOT NULL,
	[añomayoriza] [decimal](4, 0) NOT NULL,
	[codcto] [nvarchar](10) NOT NULL,
	[ctauti] [nvarchar](8) NOT NULL,
	[ctaper] [nvarchar](8) NOT NULL,
	[ctaivacom] [nvarchar](8) NOT NULL,
	[ctaivavta] [nvarchar](8) NOT NULL,
	[ctaicacom] [nvarchar](8) NOT NULL,
	[ctaicavta] [nvarchar](8) NOT NULL,
	[ctaretcom] [nvarchar](8) NOT NULL,
	[ctaretvta] [nvarchar](8) NOT NULL,
	[ctaretiva] [nvarchar](8) NOT NULL,
	[ctarivacom] [nvarchar](8) NOT NULL,
	[ctacxp] [nvarchar](8) NOT NULL,
	[ctacxc] [nvarchar](8) NOT NULL,
	[ctadesc] [nvarchar](8) NOT NULL,
	[ctaing] [nvarchar](8) NOT NULL,
	[ctacaja] [nvarchar](8) NOT NULL,
	[ctacosto] [nvarchar](8) NOT NULL,
	[ctainv] [nvarchar](8) NOT NULL,
	[ctaped] [nvarchar](8) NOT NULL,
	[iva] [decimal](6, 2) NOT NULL,
	[ctapropd] [nvarchar](8) NOT NULL,
	[ctapropc] [nvarchar](8) NOT NULL,
	[ctaajpdb] [nvarchar](8) NOT NULL,
	[ctaajpcr] [nvarchar](8) NOT NULL,
	[ctaabono] [nvarchar](8) NOT NULL,
	[ctaingreso] [nvarchar](8) NOT NULL,
	[ctapropina] [nvarchar](8) NOT NULL,
	[porcentaje] [decimal](6, 2) NOT NULL,
	[descuento] [decimal](6, 2) NOT NULL,
	[ctacuota] [nvarchar](8) NOT NULL,
	[ctaobra] [nvarchar](8) NOT NULL,
	[ctaretserv] [nvarchar](8) NOT NULL,
	[nivelmay] [nvarchar](40) NOT NULL,
	[ctaimpcom] [nvarchar](8) NOT NULL,
	[cuecen] [nvarchar](3) NOT NULL,
	[cuenit] [nvarchar](15) NOT NULL,
	[ctaadmon] [nvarchar](8) NOT NULL,
	[ctaimprevisto] [nvarchar](8) NOT NULL,
	[ctautilidad] [nvarchar](8) NOT NULL,
	[formatoegre] [decimal](1, 0) NOT NULL,
	[noagrudepre] [bit] NOT NULL,
	[ivainclu] [bit] NOT NULL,
	[ctacomitar] [nvarchar](8) NOT NULL,
	[ctaint] [nvarchar](8) NOT NULL,
	[ctatransp] [nvarchar](8) NOT NULL,
	[coddepre] [nvarchar](2) NOT NULL,
	[ctadevol] [nvarchar](8) NOT NULL,
	[codtraneg] [nvarchar](2) NOT NULL,
	[ctaanticip] [nvarchar](8) NOT NULL,
	[ctagastos] [nvarchar](8) NOT NULL,
	[ctaivasimp] [nvarchar](8) NOT NULL,
	[ctareftesi] [nvarchar](8) NOT NULL,
	[ctaxpotr] [nvarchar](8) NOT NULL,
	[nit2] [nvarchar](15) NOT NULL,
	[ctaivacomdev] [nvarchar](8) NOT NULL,
	[ctaivavtadev] [nvarchar](8) NOT NULL,
	[ctaivagas] [nvarchar](8) NOT NULL,
	[ctaimpo] [nvarchar](8) NOT NULL,
	[autoretcre] [bit] NOT NULL,
	[ctacomitarj] [nvarchar](8) NOT NULL,
	[ctacreevta] [nvarchar](8) NOT NULL,
	[ctaivavtanul] [nvarchar](8) NOT NULL,
	[ctaivacomanul] [nvarchar](8) NOT NULL,
	[ctacreevtacr] [nvarchar](8) NOT NULL,
	[añoniif] [numeric](4, 0) NOT NULL,
	[nitdian] [nvarchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL 
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_porajust')
begin 
CREATE TABLE [dbo].[con_porajust](
	[mes] [nvarchar](2) NULL,
	[año] [decimal](4, 0) NULL,
	[porcaj] [decimal](6, 3) NULL,
	[depok] [bit] NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_puc')
begin 
CREATE TABLE [dbo].[con_puc](
	[codcue] [nvarchar](8) NOT NULL,
	[nomcue] [nvarchar](40) NOT NULL,
	[auxcue] [bit] NOT NULL,
	[numche] [decimal](10, 0) NOT NULL,
	[retcue] [bit] NOT NULL,
	[ajucue] [bit] NOT NULL,
	[porret] [decimal](5, 2) NOT NULL,
	[monto] [decimal](14, 2) NOT NULL,
	[ctajustd] [nvarchar](8) NOT NULL,
	[ctajustc] [nvarchar](8) NOT NULL,
	[depcue] [bit] NOT NULL,
	[añodep] [decimal](2, 0) NOT NULL,
	[sancue] [decimal](15, 2) NOT NULL,
	[d01cue] [decimal](15, 2) NOT NULL,
	[c01cue] [decimal](15, 2) NOT NULL,
	[d02cue] [decimal](15, 2) NOT NULL,
	[c02cue] [decimal](15, 2) NOT NULL,
	[d03cue] [decimal](15, 2) NOT NULL,
	[c03cue] [decimal](15, 2) NOT NULL,
	[d04cue] [decimal](15, 2) NOT NULL,
	[c04cue] [decimal](15, 2) NOT NULL,
	[d05cue] [decimal](15, 2) NOT NULL,
	[c05cue] [decimal](15, 2) NOT NULL,
	[d06cue] [decimal](15, 2) NOT NULL,
	[c06cue] [decimal](15, 2) NOT NULL,
	[d07cue] [decimal](15, 2) NOT NULL,
	[c07cue] [decimal](15, 2) NOT NULL,
	[d08cue] [decimal](15, 2) NOT NULL,
	[c08cue] [decimal](15, 2) NOT NULL,
	[d09cue] [decimal](15, 2) NOT NULL,
	[c09cue] [decimal](15, 2) NOT NULL,
	[d10cue] [decimal](15, 2) NOT NULL,
	[c10cue] [decimal](15, 2) NOT NULL,
	[d11cue] [decimal](15, 2) NOT NULL,
	[c11cue] [decimal](15, 2) NOT NULL,
	[d12cue] [decimal](15, 2) NOT NULL,
	[c12cue] [decimal](15, 2) NOT NULL,
	[natcue] [nvarchar](1) NOT NULL,
	[nivcue] [decimal](1, 0) NOT NULL,
	[centro] [bit] NOT NULL,
	[tercero] [bit] NOT NULL,
	[inf] [bit] NOT NULL,
	[formato] [nvarchar](60) NOT NULL,
	[codadd] [nvarchar](2) NOT NULL,
	[poriva] [decimal](6, 2) NOT NULL,
	[ivacue] [bit] NOT NULL,
	[macentro] [bit] NOT NULL,
	[manit] [bit] NOT NULL,
	[manitbco] [bit] NOT NULL,
	[nitbco] [nvarchar](15) NOT NULL,
	[ctaegrcaj] [bit] NOT NULL,
	[tiprete] [decimal](1, 0) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_resolclientes')
begin 
CREATE TABLE [dbo].[con_resolclientes](
	[consec] [decimal](5, 0) NULL,
	[nitcli] [nvarchar](15) NULL,
	[nroresol] [nvarchar](15) NULL,
	[rangoini] [nvarchar](15) NULL,
	[rangofin] [nvarchar](15) NULL,
	[fecha] [datetime] NULL,
	[tipfac] [nvarchar](2) NULL,
	[codcen] [nvarchar](3) NULL,
	[numfac] [nvarchar](8) NULL
) 
end 
GO
IF NOT EXISTS (Select * From dbo.sysobjects Where name='glb_accesos')
begin 
	CREATE TABLE [dbo].[glb_accesos](
		[idemp] [nvarchar](3) NULL,
		[codper] [nvarchar](3) NOT NULL,
		[nomfor] [nvarchar](60) NOT NULL,
		[accfor] [bit] NOT NULL,
		[nuefor] [bit] NOT NULL,
		[modfor] [bit] NOT NULL,
		[elifor] [bit] NOT NULL,
		[impfor] [bit] NOT NULL,
		[entinv] [bit] NOT NULL,
		[salinv] [bit] NOT NULL,
		[trasinv] [bit] NOT NULL
	) 
end
GO

IF NOT EXISTS (Select * From dbo.sysobjects Where name='glb_almacen')
begin 
CREATE TABLE [dbo].[glb_almacen](
	[idemp]  [nvarchar](3) NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[nomalm] [nvarchar](30) NOT NULL,
	[diralm] [nvarchar](30) NOT NULL,
	[telalm] [nvarchar](20) NOT NULL,
	[resalm] [nvarchar](20) NOT NULL,
	[entalm] [decimal](8, 0) NOT NULL,
	[salalm] [decimal](8, 0) NOT NULL,
	[ciualm] [nvarchar](30) NOT NULL,
	[prealm] [nvarchar](5) NOT NULL,
	[nota]	 [nvarchar](100) NOT NULL,
	[resol]  [nvarchar](max) NOT NULL,
	[facalm] [nvarchar](3) NOT NULL,
	[rangoi] [decimal](14, 0) NOT NULL,
	[rangof] [decimal](14, 0) NOT NULL,
	[comemp] [nvarchar](40) NOT NULL,
	[factura] [nvarchar](30) NOT NULL,
	[facturac] [nvarchar](30) NOT NULL,
	[tipimp] [decimal](1, 0) NOT NULL,
	[email] [nvarchar](150) NOT NULL,
	[tiremp] [nvarchar](50) NOT NULL,
	[divalm] [nvarchar](1) NOT NULL,
	[nitalm] [nvarchar](15) NOT NULL,
	[valife] [bit] NOT NULL,
	[abreviatura] [nvarchar](5) NOT NULL,
	[backtolog] [bit] NOT NULL,
	[clase] [decimal](10, 0) NOT NULL,
	[comanda] [bit] NOT NULL,
	[comfinal] [decimal](18, 0) NOT NULL,
	[comini] [decimal](18, 0) NOT NULL,
	[ctrlcierre] [bit] NOT NULL,
	[filtralin] [bit] NOT NULL,
	[impcocina] [bit] NOT NULL,
	[rutimpcocina] [nvarchar](80) NOT NULL,
	[printercoc] [nvarchar](60) NOT NULL,
	[exento] [bit] NOT NULL,
	[imptodo] [bit] NOT NULL,
	[consecocina] [decimal](10, 0) NOT NULL,
	[consecoc] [bit] NOT NULL,
	[diapromo] [bit] NOT NULL,
	[nomequipo] [nvarchar](60) NOT NULL,
	[logcerrarfac] [bit] NOT NULL,
	[separargru] [bit] NOT NULL,
	[impsolovtes] [bit] NOT NULL,
	[impsticker] [nvarchar](60) NOT NULL,
	[impespecial] [bit] NOT NULL,
	[anulatouch] [bit] NOT NULL,
	[passanulatouch] [bit] NOT NULL,
	[rutimpcocina1] [nvarchar](80) NOT NULL,
	[rutimpcocina2] [nvarchar](80) NOT NULL,
	[rutimpcocina3] [nvarchar](80) NOT NULL,
	[rutimpcocina4] [nvarchar](80) NOT NULL,
	[impprefactura] [nvarchar](80) NOT NULL,
	[impfactura] [nvarchar](80) NOT NULL,
	[preciovta] [bit] NOT NULL,
	[nopropina] [bit] NOT NULL,
	[mesabierta] [bit] NOT NULL,
	[vrsturnos] [bit] NOT NULL,
	[alerta] [decimal](14, 2) NOT NULL,
	[confpago] [bit] NOT NULL,
	[descripmesa] [decimal](1, 0) NOT NULL,
	[codzona] [nvarchar](4) NOT NULL,
	[dominf] [bit] NOT NULL,
	[valifec] [bit] NOT NULL,
	[fijarcc] [bit] NOT NULL,
	[ccfijo] [nvarchar](3) NOT NULL,
	[edformula] [bit] NOT NULL,
	[gruformula] [bit] NOT NULL,
	[ocupada] [bit] NOT NULL,
	[stickerlis] [nvarchar](max) NOT NULL,
	[rutaredeban] [nvarchar](40) NOT NULL,
	[tipoplato] [bit] NOT NULL,
	[obserdevol] [bit] NOT NULL,
	[bloqmesero] [bit] NOT NULL,
	[obseranul] [bit] NOT NULL,
	[dispropina] [bit] NOT NULL,
	[ctatrasalm] [bit] NOT NULL,
	[ctatras] [nvarchar](8) NOT NULL,
	[filubicmesa] [bit] NOT NULL,
	[dignroperso] [bit] NOT NULL,
	[impdomici] [nvarchar](80) NOT NULL,
	[horacierre] [numeric](3, 0) NOT NULL,
	[ordgrunom] [bit] NOT NULL,
	[copiasfact] [nchar](1) NOT NULL,
	[nrocolsti] [numeric](2, 0) NOT NULL,
	[invenxcto] [bit] NOT NULL,
	[impgenxcto] [bit] NOT NULL,
	[digiturno] [bit] NOT NULL,
	[copiasfact2] [bit] NOT NULL,
	[agruart] [bit] NOT NULL,
	[valcajero] [bit] NOT NULL,
	[impfacconf] [bit] NOT NULL,
	[cajon] [numeric](1) NOT NULL,
	[factdcto] [bit] NOT NULL,
	[addingyegr] [bit] NOT NULL,
	[domiexpres] [bit] NOT NULL,
	[forpagcoman] [bit] NOT NULL,
	[impcomdomi] [bit] NOT NULL,
	[domiciliario] [bit] NOT NULL,
	[ppublico] [nvarchar](8) NOT NULL,
	[resolN] [nvarchar](200) NOT NULL,
	[PrdctoIva] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_bancos')
begin 
CREATE TABLE [dbo].[glb_bancos](
	[codbco] [nvarchar](2) NOT NULL,
	[nombco] [nvarchar](30) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_barrio')
begin 
CREATE TABLE [dbo].[glb_barrio](
	[codbarr] [nvarchar](3) NOT NULL,
	[nombarr] [nvarchar](200) NOT NULL,
	[codzona] [nvarchar](4) NOT NULL,
	[codzona2] [nvarchar](4) NOT NULL,
	[horaini1] [nvarchar](5) NOT NULL,
	[horafin1] [nvarchar](5) NOT NULL,
	[horaini2] [nvarchar](5) NOT NULL,
	[horafin2] [nvarchar](5) NOT NULL,
	[valor1] [decimal](14, 0) NOT NULL,
	[valor2] [decimal](14, 0) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_caja')
begin 
CREATE TABLE [dbo].[glb_caja](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[codter] [nvarchar](15) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [nvarchar](5) NOT NULL,
	[jornada] [nvarchar](2) NOT NULL,
	[base] [decimal](14, 0) NOT NULL,
	[activo] [nvarchar](1) NOT NULL,
	[caja] [nvarchar](3) NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[codusuc] [nvarchar](8) NOT NULL,
	[faltante] [decimal](12, 0) NOT NULL,
	[feccierre] [datetime] NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[ipcaja] [nvarchar](15) NOT NULL,
	[numero] [decimal](10, 0) NOT NULL,
	[sobrante] [decimal](12, 0) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_cargos')
begin 
CREATE TABLE [dbo].[glb_cargos](
	[codi_cargo] [nvarchar](3) NOT NULL,
	[nomb_cargo] [nvarchar](30) NULL,
	[tipo] [nvarchar](1) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_cenconsumo')
begin 
CREATE TABLE glb_cenconsumo
(
	[idemp] [nvarchar](3) NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[nomcen] [nvarchar](25) NOT NULL,
	[ctacaj] [nvarchar](8) NOT NULL,
	[nitcen] [nvarchar](12) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_ciudad')
begin 
CREATE TABLE [dbo].[glb_ciudad](
	[coddpto] [nvarchar](3) NOT NULL,
	[codciu] [nvarchar](3) NOT NULL,
	[nomciu] [nvarchar](30) NOT NULL,
	[coddane] [nvarchar](10) NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_clasiven')
begin 
CREATE TABLE [dbo].[glb_clasiven](
	[codigo] [nvarchar](2) NOT NULL,
	[nombre] [nvarchar](40) NULL,
	[liqcom] [bit] NOT NULL,
	[comision] [decimal](1, 0) NULL,
	[porcomi] [decimal](6, 2) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_conceptoscli')
begin 
CREATE TABLE [dbo].[glb_conceptoscli](
	[codigo] [nvarchar](2) NULL,
	[nombre] [nvarchar](60) NULL
) ON [PRIMARY]

end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_contac')
begin 
CREATE TABLE [dbo].[glb_contac](
	[codigo] [nvarchar](3) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[contac] [bit] NOT NULL,
	[sector] [bit] NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_control')
begin 
CREATE TABLE [dbo].[glb_control](
	[codalm] [nvarchar](3) NULL,
	[fecha] [datetime] NULL,
	[fecind] [nvarchar](8) NULL,
	[ok] [bit] NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_descuentos')
begin 
CREATE TABLE [dbo].[glb_descuentos](
	[idemp] [nvarchar](3) NULL,
	[coddes] [nvarchar](3) NOT NULL,
	[nomdes] [nvarchar](30) NOT NULL,
	[pordes] [decimal](6, 2) NOT NULL,
	[tipdes] [nvarchar](1) NOT NULL,
	[ctavta] [nvarchar](8) NOT NULL,
	[ctacom] [nvarchar](8) NOT NULL,
	[aplicaser] [bit] NOT NULL,
	[montodes] [decimal](14, 2) NOT NULL,
	[autorete] [bit] NOT NULL,
	[retecree] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_divisiones')
begin 
CREATE TABLE [dbo].[glb_divisiones](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](60) NULL,
	[codrel] [nvarchar](33) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_dpto')
begin 
CREATE TABLE [dbo].[glb_dpto](
	[coddpto] [nvarchar](3) NOT NULL,
	[nomdpto] [nvarchar](30) NULL,
	[codpais] [nvarchar](3) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_empresa')
begin 
CREATE TABLE [dbo].[glb_empresa](
	[id]		[nvarchar](3) NULL,
	[nomemp]	[nvarchar](100) NOT NULL,
	[nitemp]	[nvarchar](15) NOT NULL,
	[divemp]	[nvarchar](1) NOT NULL,
	[diremp]	[nvarchar](30) NOT NULL,
	[telemp]	[nvarchar](20) NOT NULL,
	[ciuemp]	[nvarchar](20) NOT NULL,
	[geremp]	[nvarchar](30) NOT NULL,
	[conemp]	[nvarchar](30) NOT NULL,
	[tipemp]	[decimal](1, 0) NOT NULL,
	[facemp]	[nvarchar](30) NOT NULL,
	[resemp]	[nvarchar](max) NOT NULL,
	[egremp]	[nvarchar](30) NOT NULL,
	[cmpart]	[nvarchar](10) NOT NULL,
	[calcvta]	[bit] NOT NULL,
	[compref]	[nvarchar](40) NOT NULL,
	[comemp]	[nvarchar](60) NOT NULL,
	[tiremp]	[nvarchar](30) NOT NULL,
	[notemp]	[nvarchar](max) NOT NULL,
	[cotemp]	[nvarchar](30) NOT NULL,
	[delemp]	[bit] NOT NULL,
	[ruta]		[nvarchar](100) NOT NULL,
	[tipconse]	[decimal](1, 0) NOT NULL,
	[tipo]		[decimal](1, 0) NOT NULL,
	[valfecha]	[bit] NOT NULL,
	[revisor]	[nvarchar](30) NOT NULL,
	[email]		[nvarchar](50) NOT NULL,
	[web]		[nvarchar](50) NOT NULL,
	[codsuscriptor] [nvarchar](10) NOT NULL,
	[c0]		[nvarchar](1) NOT NULL,
	[c1]		[nvarchar](1) NOT NULL,
	[c2]		[nvarchar](1) NOT NULL,
	[c3]		[nvarchar](1) NOT NULL,
	[c4]		[nvarchar](1) NOT NULL,
	[c5]		[nvarchar](1) NOT NULL,
	[c6]		[nvarchar](1) NOT NULL,
	[c7]		[nvarchar](1) NOT NULL,
	[c8]		[nvarchar](1) NOT NULL,
	[c9]		[nvarchar](1) NOT NULL,
	[repsticker] [nvarchar](30) NOT NULL,
	[clapuc]	[decimal](1, 0) NOT NULL,
	[fecmovfin] [date] NOT NULL,
	[fecmovini] [date] NOT NULL,
	[repsalmateria] [nvarchar](30) NOT NULL,
	[touchnom]	 [bit] NOT NULL,
	[repconsumo] [nvarchar](30) NOT NULL,
	[codequipo]	[nvarchar](10) NOT NULL,
	[codsim]	[nvarchar](10) NOT NULL,
	[imppdf]	[nvarchar](60) NOT NULL,
	[f01]		[bit] NOT NULL,
	[f03] [bit] NOT NULL,
	[f05] [bit] NOT NULL,
	[f06] [bit] NOT NULL,
	[f07] [bit] NOT NULL,
	[f08] [bit] NOT NULL,
	[f09] [bit] NOT NULL,
	[f11] [bit] NOT NULL,
	[f12] [bit] NOT NULL,
	[f37] [bit] NOT NULL,
	[f47] [bit] NOT NULL,
	[sticvarios] [bit] NOT NULL,
	[sticlist] [nvarchar](max) NOT NULL,
	[empfact] [nvarchar](100) NOT NULL,
	[domtran] [numeric](2, 0) NOT NULL,
	[touch] [bit] NOT NULL,
	[licTouch] [nvarchar](90) NOT NULL,
	[terxcen] [bit] NOT NULL,
	[leyendapro] [nvarchar](240) NOT NULL,
	[consecxcen] [bit] NOT NULL,
	[cmpalm] [nvarchar](6) NOT NULL,
	[rutabdcand] [nvarchar](100) NOT NULL,
	[bdcanadian] [bit] NOT NULL,
	[gastoschuz] [bit] NOT NULL,
	[valizonalm] [bit] NOT NULL,
	[EstLlamada] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[regimpo] [bit] NOT NULL,
	[resempN] [nvarchar](200) NOT NULL,
	[filtroxcto] [bit] NOT NULL,
	[oculsfvta]	[bit] NOT NULL,
	[rutaped]	[bit] NOT NULL,
	)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_error')
begin 
CREATE TABLE [dbo].[glb_error](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](220) NULL,
	[detalle] [nvarchar](230) NULL,
	[Sug] [nvarchar](230) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_glb_error] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_estados')
begin 
CREATE TABLE [dbo].[glb_estados](
	[codest] [nvarchar](3) NOT NULL,
	[nomest] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_glb_estados] PRIMARY KEY CLUSTERED 
(
	[codest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_global')
begin 
CREATE TABLE [dbo].[glb_global](
	[Nombre] [nvarchar](30) NOT NULL,
	[valor] [nvarchar](90) NOT NULL,
	[tipo] [char](1) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_historial')
begin 
CREATE TABLE [dbo].[glb_historial](
	[fecsys] [datetime] NULL,
	[idusu] [nvarchar](10) NULL,
	[nomusu] [nvarchar](30) NULL,
	[detalle] [nvarchar](max) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_hobby')
begin 
CREATE TABLE [dbo].[glb_hobby](
	[codigo] [nvarchar](2) NOT NULL,
	[nombre] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_glb_hobby] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_idx')
begin 
CREATE TABLE [dbo].[glb_idx](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[tabla] [nchar](30) NOT NULL,
	[nomidx] [nchar](30) NOT NULL,
	[detidx] [nvarchar](180) NOT NULL,
	[compuesto] [bit] NOT NULL,
	[campos] [nvarchar](130) NULL,
 CONSTRAINT [PK_glb_idx] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_labores')
begin 
CREATE TABLE [dbo].[glb_labores](
	[codigo] [nvarchar](2) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_glb_labores] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_log')
begin 
CREATE TABLE [dbo].[glb_log](
	[idusu] [nvarchar](10) NULL,
	[nomusu] [nvarchar](30) NULL,
	[ipmaq] [nvarchar](15) NULL,
	[tabla] [nvarchar](50) NULL,
	[recno_] [decimal](10, 0) NULL,
	[fecsys] [datetime] NULL,
	[tipo] [nvarchar](6) NULL,
	[detalle] [nvarchar](max) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_mail')
begin 
CREATE TABLE [dbo].[glb_mail](
	[mail] [nvarchar](90) NOT NULL,
	[detalle] [nvarchar](240) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_mensaje')
begin 
CREATE TABLE [dbo].[glb_mensaje](
	[id] [nchar](3) NOT NULL,
	[Mensaje] [nvarchar](180) NOT NULL,
	[idmsg] [nchar](1) NULL,
 CONSTRAINT [PK_msgerror] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_mensual')
begin 
CREATE TABLE [dbo].[glb_mensual](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[codtran] [nvarchar](2) NOT NULL,
	[añotran] [decimal](4, 0) NOT NULL,
	[mes01] [decimal](8, 0) NOT NULL,
	[mes02] [decimal](8, 0) NOT NULL,
	[mes03] [decimal](8, 0) NOT NULL,
	[mes04] [decimal](8, 0) NOT NULL,
	[mes05] [decimal](8, 0) NOT NULL,
	[mes06] [decimal](8, 0) NOT NULL,
	[mes07] [decimal](8, 0) NOT NULL,
	[mes08] [decimal](8, 0) NOT NULL,
	[mes09] [decimal](8, 0) NOT NULL,
	[mes10] [decimal](8, 0) NOT NULL,
	[mes11] [decimal](8, 0) NOT NULL,
	[mes12] [decimal](8, 0) NOT NULL,
 CONSTRAINT [PK_glb_mensual] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[codtran] ASC,
	[añotran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_menu')
begin 
CREATE TABLE [dbo].[glb_menu](
	[nomfor] [nvarchar](40) NOT NULL,
	[modulo] [nvarchar](2) NOT NULL,
	[codigo] [decimal](3, 0) NOT NULL,
	[desopc] [nvarchar](60) NULL,
	[padre] [decimal](10, 0) NULL,
	[arcdll] [nvarchar](25) NULL,
	[tipopc] [decimal](1, 0) NULL,
	[ver] [bit] NOT NULL,
 CONSTRAINT [PK_glb_menu] PRIMARY KEY CLUSTERED 
(
	[nomfor] ASC,
	[modulo] ASC,
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_modulos')
begin 
CREATE TABLE [dbo].[glb_modulos](
	[codmod] [nvarchar](2) NOT NULL,
	[nommod] [nvarchar](30) NULL,
 CONSTRAINT [PK_glb_modulos] PRIMARY KEY CLUSTERED 
(
	[codmod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_niveles')
begin 
CREATE TABLE [dbo].[glb_niveles](
	[codigo] [nvarchar](2) NOT NULL,
	[nombre] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_glb_niveles] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)

Insert Into glb_niveles (codigo,nombre) Values ('01','BACHILLER')
Insert Into glb_niveles (codigo,nombre) Values ('02','TECNICO')
Insert Into glb_niveles (codigo,nombre) Values ('03','TECNOLOGO')
Insert Into glb_niveles (codigo,nombre) Values ('04','PROFESIONAL')

end 
GO



IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_opciones')
begin 
CREATE TABLE [dbo].[glb_opciones](
	[nomfor] [nvarchar](50) NULL,
	[desopc] [nvarchar](150) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_pais')
begin 
CREATE TABLE [dbo].[glb_pais](
	[codpais] [nvarchar](3) NOT NULL,
	[nompais] [nvarchar](30) NULL,
 CONSTRAINT [PK_glb_pais] PRIMARY KEY CLUSTERED 
(
	[codpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_pcs')
begin 
CREATE TABLE [dbo].[glb_pcs](
	[dirpc] [nvarchar](20) NULL,
	[nompc] [nvarchar](40) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_perfilcto')
begin 
CREATE TABLE [dbo].[glb_perfilcto](
	[codcto] [nchar](3) NOT NULL,
	[codper] [nchar](3) NOT NULL,
	[activo] [bit] NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_perfiles')
begin 
CREATE TABLE [dbo].[glb_perfiles](
	[codper] [nvarchar](3) NOT NULL,
	[nomper] [nvarchar](30) NOT NULL,
	[tipper] [decimal](9, 0) NOT NULL,
 CONSTRAINT [PK_glb_perfiles] PRIMARY KEY CLUSTERED 
(
	[codper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_profesion')
begin 
CREATE TABLE [dbo].[glb_profesion](
	[codi_prof] [nvarchar](2) NOT NULL,
	[titulo] [nvarchar](30) NULL,
	[nivel_educ] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_glb_profesion] PRIMARY KEY CLUSTERED 
(
	[codi_prof] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_reportes')
begin 
CREATE TABLE [dbo].[glb_reportes](
	[codcen] [nvarchar](3) NULL,
	[codtran] [nvarchar](2) NULL,
	[reporte] [nvarchar](30) NULL,
	[resol] [nvarchar](max) NULL,
	[tipimp] [decimal](1, 0) NULL,
	[cajon] [decimal](1, 0) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_terceros')
begin 
CREATE TABLE [dbo].[glb_terceros](
	[nitter] [nvarchar](15) NOT NULL,
	[nomter] [nvarchar](60) NOT NULL,
	[tipter] [decimal](1, 0) NOT NULL,
	[divter] [nvarchar](1) NOT NULL,
	[terotr] [bit] NOT NULL,
	[terven] [bit] NOT NULL,
	[teremp] [bit] NOT NULL,
	[terpro] [bit] NOT NULL,
	[tercli] [bit] NOT NULL,
	[tercob] [bit] NOT NULL,
	[telter] [decimal](15, 0) NOT NULL,
	[dirter] [nvarchar](60) NOT NULL,
	[dirter2] [nvarchar](60) NOT NULL,
	[ciuter] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[contacto] [nvarchar](60) NOT NULL,
	[celular] [nvarchar](20) NOT NULL,
	[fax] [decimal](15, 0) NOT NULL,
	[descrip] [nvarchar](max) NOT NULL,
	[codpro] [nvarchar](15) NOT NULL,
	[codigo] [nvarchar](15) NOT NULL,
	[fecnac] [date] NOT NULL,
	[mail] [nvarchar](60) NOT NULL,
	[sexo] [decimal](1, 0) NOT NULL,
	[web] [nvarchar](60) NOT NULL,
	[lista] [decimal](1, 0) NOT NULL,
	[arp] [bit] NOT NULL,
	[cesantia] [bit] NOT NULL,
	[codest] [nvarchar](3) NOT NULL,
	[conduc] [bit] NOT NULL,
	[eps] [bit] NOT NULL,
	[pension] [bit] NOT NULL,
	[barrio] [nvarchar](3) NOT NULL,
	[apellido1] [nvarchar](70) NOT NULL,
	[apellido2] [nvarchar](70) NOT NULL,
	[cupocre] [decimal](12, 0) NOT NULL,
	[diasvenc] [decimal](3, 0) NOT NULL,
	[dptoter] [nvarchar](2) NOT NULL,
	[nombre1] [nvarchar](70) NOT NULL,
	[otros] [nvarchar](70) NOT NULL,
	[tipid] [nvarchar](2) NOT NULL,
	[vendedor] [nvarchar](15) NOT NULL,
	[civil] [nvarchar](40) NOT NULL,
	[codtipo] [nvarchar](4) NOT NULL,
	[lugexp] [nvarchar](40) NOT NULL,
	[porcom] [decimal](6, 2) NOT NULL,
	[terprof] [bit] NOT NULL,
	[zona] [nvarchar](4) NOT NULL,
	[cedulafiad] [nvarchar](15) NOT NULL,
	[celfiad1] [nvarchar](15) NOT NULL,
	[celfiad2] [nvarchar](15) NOT NULL,
	[dirfiad1] [nvarchar](60) NOT NULL,
	[dirfiad2] [nvarchar](60) NOT NULL,
	[nombrefiad] [nvarchar](40) NOT NULL,
	[telfiad1] [decimal](20, 0) NOT NULL,
	[telfiad2] [decimal](20, 0) NOT NULL,
	[telter2] [decimal](15, 0) NOT NULL,
	[ucmvmcl] [decimal](14, 2) NOT NULL,
	[upgomcl] [date] NOT NULL,
	[cupo] [decimal](12, 0) NOT NULL,
	[diacobro1] [decimal](2, 0) NOT NULL,
	[diacobro2] [decimal](2, 0) NOT NULL,
	[fcobro] [date] NOT NULL,
	[finicial] [date] NOT NULL,
	[vrcuota] [decimal](14, 2) NOT NULL,
	[vrinicial] [decimal](14, 2) NOT NULL,
	[codcargo] [nvarchar](3) NOT NULL,
	[codhobby] [nvarchar](2) NOT NULL,
	[codprof] [nvarchar](2) NOT NULL,
	[empresa] [nvarchar](50) NOT NULL,
	[hijos] [decimal](2, 0) NOT NULL,
	[sueldo] [decimal](10, 0) NOT NULL,
	[celfiad3] [nvarchar](20) NOT NULL,
	[dirfiad3] [nvarchar](60) NOT NULL,
	[telfiad3] [nvarchar](20) NOT NULL,
	[act_eco] [nvarchar](2) NOT NULL,
	[ciiu] [decimal](4, 0) NOT NULL,
	[estrato] [decimal](1, 0) NOT NULL,
	[fec_exp] [date] NOT NULL,
	[inicio_labora] [date] NOT NULL,
	[nit_empresa] [nvarchar](15) NOT NULL,
	[niv_est] [nvarchar](2) NOT NULL,
	[per_cargo] [decimal](3, 0) NOT NULL,
	[tip_contrato] [nvarchar](2) NOT NULL,
	[tercon] [bit] NOT NULL,
	[ocultaremi] [bit] NOT NULL,
	[datacredito] [bit] NOT NULL,
	[diremp] [nvarchar](60) NOT NULL,
	[telemp] [nvarchar](20) NOT NULL,
	[contac] [nvarchar](60) NOT NULL,
	[clasiven] [nvarchar](2) NOT NULL,
	[guia] [nvarchar](16) NOT NULL,
	[codpais] [nvarchar](3) NOT NULL,
	[montorf] [decimal](14, 2) NOT NULL,
	[porrefte] [decimal](12, 4) NOT NULL,
	[porrica] [decimal](12, 4) NOT NULL,
	[porriva] [decimal](12, 4) NOT NULL,
	[rfuente] [bit] NOT NULL,
	[rica] [bit] NOT NULL,
	[riva] [bit] NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[nrotarjeta] [nvarchar](15) NOT NULL,
	[cmprfuente] [nvarchar](3) NOT NULL,
	[cmprica] [nvarchar](3) NOT NULL,
	[cmpriva] [nvarchar](3) NOT NULL,
	[nombrefiad2] [nvarchar](40) NOT NULL,
	[nombrefiad3] [nvarchar](60) NOT NULL,
	[cedulafiad2] [nvarchar](15) NOT NULL,
	[cedulafiad3] [nvarchar](15) NOT NULL,
	[datacredito1] [bit] NOT NULL,
	[datacredito2] [bit] NOT NULL,
	[comporta] [nvarchar](max) NOT NULL,
	[dctoter] [decimal](6, 2) NOT NULL,
	[diascart] [decimal](3, 0) NOT NULL,
	[cmpcree] [nvarchar](3) NOT NULL,
	[rcree] [bit] NOT NULL,
 CONSTRAINT [PK_glb_terceros] PRIMARY KEY CLUSTERED 
(
	[nitter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_tipid')
begin 
CREATE TABLE [dbo].[glb_tipid](
	[codigo] [nvarchar](2) NOT NULL,
	[nombre] [nvarchar](60) NOT NULL,
	[codcifin] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_glb_tipid] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_tiptercero')
begin 
CREATE TABLE [dbo].[glb_tiptercero](
	[codtipo] [nvarchar](4) NOT NULL,
	[nomtipo] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_glb_tiptercero] PRIMARY KEY CLUSTERED 
(
	[codtipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_transaccion')
begin 
CREATE TABLE [dbo].[glb_transaccion](
[codtran] [nvarchar](2) NOT NULL,
	[nomtran] [nvarchar](30) NOT NULL,
	[tiptran] [decimal](1, 0) NOT NULL,
	[fuesys] [bit] NOT NULL,
	[modulo] [bit] NOT NULL,
	[codmod] [nvarchar](2) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[tipcon] [nvarchar](1) NOT NULL,
	[codfue] [nvarchar](5) NOT NULL,
	[codmov] [nvarchar](3) NOT NULL,
	[codcod] [nvarchar](3) NOT NULL,
	[anultran] [nvarchar](2) NOT NULL,
	[tipven] [decimal](1, 0) NOT NULL,
	[doble] [bit] NOT NULL,
	[consec] [bit] NOT NULL,
	[activa] [bit] NOT NULL,
	[contable] [bit] NOT NULL,
	[devolprove] [bit] NOT NULL,
	[manejaiva] [bit] NOT NULL,
	[fiscdefaul] [bit] NOT NULL,
	[fuente] [nvarchar](2) NOT NULL,
	[exenta] [bit] NOT NULL,
	[consignacion] [bit] NOT NULL,
	[trancm] [nvarchar](2) NOT NULL,
	[trannd] [nvarchar](2) NOT NULL,
	[trancp] [nvarchar](2) NOT NULL,
	[noenvio] [bit] NOT NULL,
	[unificarcf] [bit] NOT NULL,
	[balaninv] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_glb_transaccion] PRIMARY KEY CLUSTERED 
(
	[codtran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_traslados')
begin 
CREATE TABLE [dbo].[glb_traslados](
	[numero] [int] NULL,
	[fecha] [datetime] NULL,
	[tipo] [nvarchar](30) NULL,
	[desde] [datetime] NULL,
	[hasta] [datetime] NULL,
	[codcen] [nvarchar](3) NULL,
	[modulo] [nvarchar](2) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_unica')
begin 
CREATE TABLE [dbo].[glb_unica](
	[idemp]		[nvarchar](3) NULL,
	[codcto]	[nvarchar](3) NOT NULL,
	[codtran]	[nvarchar](2) NOT NULL,
	[contran]	[decimal](8, 0) NOT NULL,
	[prefijo]	[nvarchar](5) NOT NULL,
	[facemp]	[nvarchar](60) NOT NULL,
	[tiremp]	[nvarchar](60) NOT NULL,
	[resemp]	[nvarchar](200) NOT NULL,
	[rowguid]	[uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[resemp2]	[nvarchar](200) NOT NULL,
	[resempN]	[nvarchar](200) NOT NULL,
	[estacionmod] [nvarchar](50) NOT NULL,
	[fecsysmod] [datetime] NOT NULL,
 CONSTRAINT [PK_glb_unica_1] PRIMARY KEY CLUSTERED 
(
	[codcto] ASC,
	[codtran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_usuarios')
begin 
CREATE TABLE [dbo].[glb_usuarios](
	[codusu] [nvarchar](8) NOT NULL,
	[nomusu] [nvarchar](50) NOT NULL,
	[codper] [nvarchar](3) NOT NULL,
	[clausu] [numeric](18, 0) NOT NULL,
	[codter] [nvarchar](12) NOT NULL,
	[centro] [nvarchar](3) NOT NULL,
	[valcos] [bit] NOT NULL,
	[entinv] [numeric](1, 0) NOT NULL,
	[salinv] [numeric](1, 0) NOT NULL,
	[trasinv] [numeric](1, 0) NOT NULL,
	[centinv] [numeric](1, 0) NOT NULL,
	[csalinv] [numeric](1, 0) NOT NULL,
	[ctrasinv] [numeric](1, 0) NOT NULL,
	[ppublico] [bit] NOT NULL,
	[pmayorista] [bit] NOT NULL,
	[pespecial] [bit] NOT NULL,
	[pespecial1] [bit] NOT NULL,
	[pespecial2] [bit] NOT NULL,
	[infcentro] [bit] NOT NULL,
	[formato] [nvarchar](60) NOT NULL,
	[formato2] [nvarchar](60) NOT NULL,
	[clasql] [nvarchar](200) NOT NULL,
	[inactivo] [bit] NOT NULL,
	[desdcto] [bit] NOT NULL,
	[clausunet] [nchar](100) NULL,
	[camfecegr] [bit] NOT NULL,
	[DesActPuc] [bit] NOT NULL,
	[DesActConse] [bit] NOT NULL,
	[nofactcred] [bit] NOT NULL,
	[actcupo] [bit] NOT NULL,
	[Destranegr] [bit] NOT NULL,
 CONSTRAINT [PK_glb_usuarios] PRIMARY KEY CLUSTERED 
(
	[codusu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_UsuxTran')
begin
CREATE TABLE [dbo].[Glb_UsuxTran](
	[CodUsu] [nvarchar](8) NOT NULL DEFAULT (''),
	[CodTran] [nvarchar](2) NOT NULL DEFAULT (''),
	[Activa] [bit] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
end
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_zonas')
begin 
CREATE TABLE [dbo].[glb_zonas](
	[codigo] [nvarchar](4) NOT NULL,
	[nombre] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_glb_zonas] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='mtmsg')
begin 
CREATE TABLE [dbo].[mtmsg](
	[id] [nchar](1) NOT NULL,
	[nombre] [nchar](90) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_actent')
begin 
CREATE TABLE [dbo].[nom_actent](
	[numact] [nvarchar](8) NULL,
	[codi_emprec] [nvarchar](4) NULL,
	[codi_empent] [nvarchar](4) NULL,
	[coddota] [nvarchar](2) NULL,
	[fecact] [datetime] NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[qtydota] [decimal](3, 0) NULL,
	[estact] [nvarchar](10) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_acumulado')
begin 
CREATE TABLE [dbo].[nom_acumulado](
	[codi_emple] [nvarchar](4) NULL,
	[codi_tran] [nvarchar](4) NULL,
	[fecha] [datetime] NULL,
	[qty] [decimal](10, 2) NULL,
	[valor] [decimal](15, 4) NULL,
	[modulo] [nvarchar](15) NULL,
	[qtyh] [decimal](10, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_aportes')
begin 
CREATE TABLE [dbo].[nom_aportes](
	[codemp] [nvarchar](4) NULL,
	[codsec] [nvarchar](3) NULL,
	[ano] [decimal](4, 0) NULL,
	[mes] [nvarchar](2) NULL,
	[valordev] [decimal](14, 2) NULL,
	[codeps] [nvarchar](4) NULL,
	[codpen] [nvarchar](4) NULL,
	[codarp] [nvarchar](4) NULL,
	[codcaj] [nvarchar](4) NULL,
	[codsen] [nvarchar](4) NULL,
	[codicb] [nvarchar](4) NULL,
	[total] [decimal](14, 2) NULL,
	[cesantias] [decimal](12, 2) NULL,
	[intces] [decimal](12, 2) NULL,
	[primas] [decimal](12, 2) NULL,
	[vacaciones] [decimal](12, 2) NULL,
	[pensionp] [decimal](12, 2) NULL,
	[saludp] [decimal](12, 2) NULL,
	[caja] [decimal](12, 2) NULL,
	[sena] [decimal](12, 2) NULL,
	[icbf] [decimal](12, 2) NULL,
	[arpx] [decimal](12, 2) NULL,
	[liqint] [bit] NOT NULL,
	[liqpri] [bit] NOT NULL,
	[solida] [decimal](12, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_auxilios')
begin 
CREATE TABLE [dbo].[nom_auxilios](
	[codi_auxi] [nvarchar](2) NULL,
	[nombre] [nvarchar](30) NULL,
	[valor] [decimal](15, 4) NULL,
	[prom_min] [decimal](5, 2) NULL,
	[frecuencia] [decimal](1, 0) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_bancos')
begin 
CREATE TABLE [dbo].[nom_bancos](
	[codigo] [nvarchar](2) NULL,
	[nombanco] [nvarchar](30) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_cargos')
begin 
CREATE TABLE [dbo].[nom_cargos](
		[codi_cargo] [nvarchar](3) NULL,
	[nomb_cargo] [nvarchar](30) NULL,
	[tipo] [nvarchar](1) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_carreras')
begin 
CREATE TABLE [dbo].[nom_carreras](
	[codi_curso] [nvarchar](4) NULL,
	[titulo] [nvarchar](30) NULL,
	[nivel_educ] [nvarchar](2) NULL,
	[periodo] [decimal](1, 0) NULL,
	[num_periodos] [decimal](2, 0) NULL,
	[costo_periodo] [decimal](15, 4) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_cartera')
begin 
CREATE TABLE [dbo].[nom_cartera](
	[nserie] [nvarchar](5) NOT NULL,
	[codi_emple] [nvarchar](4) NULL,
	[codi_tran] [nvarchar](4) NULL,
	[fecha_ptmo] [datetime] NULL,
	[fecha_ini] [datetime] NULL,
	[num_cuota] [decimal](3, 0) NULL,
	[vr_cuotas] [decimal](14, 2) NULL,
	[vr_ptmo] [decimal](14, 2) NULL,
	[periodo] [nvarchar](1) NULL,
	[num_pagada] [decimal](3, 0) NULL,
	[vr_pagado] [decimal](14, 2) NULL,
	[salpre] [decimal](14, 2) NULL,
	[codusu] [nvarchar](8) NULL,
	[fecsys] [datetime] NULL,
	[estado] [decimal](1, 0) NULL,
	[nroprest] [varchar](10) NULL,
	[idemp] [nvarchar](3) NULL,
 CONSTRAINT [PK_nom_cartera] PRIMARY KEY CLUSTERED 
(
	[nserie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_causales')
begin 
CREATE TABLE [dbo].[nom_causales](
	[codcau] [nvarchar](3) NULL,
	[nomcau] [nvarchar](25) NULL,
	[indem] [bit] NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_centros')
begin 
CREATE TABLE [dbo].[nom_centros](
	[codi_centr] [nvarchar](2) NULL,
	[nombre] [nvarchar](40) NULL,
	[codcto] [nvarchar](3) NULL,
	[codi_emple] [nvarchar](4) NULL,
	[porcen] [decimal](6, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_cesantias')
begin 
CREATE TABLE [dbo].[nom_cesantias](
	[codi_sec] [nvarchar](3) NULL,
	[numcesan] [nvarchar](8) NULL,
	[codi_emple] [nvarchar](4) NULL,
	[fecha] [datetime] NULL,
	[base] [decimal](14, 2) NULL,
	[dias] [decimal](5, 0) NULL,
	[subtotal] [decimal](14, 2) NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[sueldo] [decimal](1, 0) NULL,
	[ano] [decimal](4, 0) NULL,
	[fechault] [datetime] NULL,
	[intereses] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS (Select * From dbo.sysobjects Where name='nom_cierre')
begin 
CREATE TABLE [dbo].[nom_cierre](
	[codi_emple] [nvarchar](4) NULL,
	[periodo] [datetime] NULL,
	[proceso] [nvarchar](1) NULL
)
end 
GO

IF EXISTS (Select * From dbo.sysobjects Where name='nom_civil')		Drop Table nom_civil	-- Modificado Mayo 12 de 2015 por Éduar Álvarez.
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_contrato')
begin 
CREATE TABLE [dbo].[nom_contrato](
	[numcontra] [nvarchar](8) NULL,
	[fecha] [datetime] NULL,
	[empleadora] [nvarchar](4) NULL,
	[empleado] [nvarchar](4) NULL,
	[codi_cargo] [nvarchar](3) NULL,
	[codi_cont] [nvarchar](2) NULL,
	[salario] [decimal](14, 0) NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](10) NULL
)
end 
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_control')	DROP TABLE nom_control		-- Modificado Mayo 12 de 2015 - Éduar Álvarez.
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_controlcierre')
begin 
CREATE TABLE [dbo].[nom_controlcierre](
	[año] [decimal](4, 0) NULL,
	[mes] [nvarchar](2) NULL,
	[dev01] [bit] NOT NULL,
	[dev02] [bit] NOT NULL,
	[provision] [bit] NOT NULL,
	[aportes] [bit] NOT NULL,
	[qui01] [bit] NOT NULL,
	[qui02] [bit] NOT NULL,
	[codi_sec] [nvarchar](3) NULL,
	[idemp] [nchar](3) NULL
)
end 
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_dataemple')	Drop Table nom_dataemple	-- Modificado Mayo 12 de 2015 por Éduar Álvarez.
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_detacapa')	Drop Table nom_detacapa		-- Modificado Mayo 12 de 2015 por Éduar Álvarez.
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_detacartera')
begin 
CREATE TABLE [dbo].[nom_detacartera](
	[nserie] [nvarchar](6) NOT NULL,
	[codi_emple] [nvarchar](11) NULL,
	[feccuo] [datetime] NULL,
	[valcuo] [decimal](14, 2) NULL,
	[valabo] [decimal](14, 2) NULL,
	[valsal] [decimal](14, 2) NULL,
	[nomcuo] [nvarchar](25) NULL,
	[ncuota] [decimal](3, 0) NULL,
	[plazo] [decimal](3, 0) NULL,
	[porcen] [decimal](5, 2) NULL,
	[codusu] [nvarchar](8) NULL,
	[fecsys] [datetime] NULL,
	[ok] [bit] NOT NULL,
	[vrdebito] [decimal](14, 2) NULL,
	[idemp] [nvarchar](3) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_detcentros')
begin 
CREATE TABLE [dbo].[nom_detcentros](
	[codi_emple] [nvarchar](4) NULL,
	[codcto] [nvarchar](3) NULL,
	[porcen] [decimal](6, 2) NULL,
	[ano] [decimal](4, 0) NULL,
	[mes] [nvarchar](2) NULL,
	[periodo] [nvarchar](1) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_detliq')
begin 
CREATE TABLE [dbo].[nom_detliq](
	[codigo] [nvarchar](10) NULL,
	[tran_codi] [nvarchar](4) NULL,
	[cant] [decimal](10, 2) NULL,
	[devengado] [decimal](12, 2) NULL,
	[deducido] [decimal](12, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_devengos')
begin 
CREATE TABLE [dbo].[nom_devengos](
	[codi_emple] [nvarchar](4) NULL,
	[año] [decimal](4, 0) NULL,
	[vr_01] [decimal](14, 2) NULL,
	[vr_02] [decimal](14, 2) NULL,
	[vr_03] [decimal](14, 2) NULL,
	[vr_04] [decimal](14, 2) NULL,
	[vr_05] [decimal](14, 2) NULL,
	[vr_06] [decimal](14, 2) NULL,
	[vr_07] [decimal](14, 2) NULL,
	[vr_08] [decimal](14, 2) NULL,
	[vr_09] [decimal](14, 2) NULL,
	[vr_10] [decimal](14, 2) NULL,
	[vr_11] [decimal](14, 2) NULL,
	[vr_12] [decimal](14, 2) NULL,
	[dias_01] [decimal](2, 0) NULL,
	[dias_02] [decimal](2, 0) NULL,
	[dias_03] [decimal](2, 0) NULL,
	[dias_04] [decimal](2, 0) NULL,
	[dias_05] [decimal](2, 0) NULL,
	[dias_06] [decimal](2, 0) NULL,
	[dias_07] [decimal](2, 0) NULL,
	[dias_08] [decimal](2, 0) NULL,
	[dias_09] [decimal](2, 0) NULL,
	[dias_10] [decimal](2, 0) NULL,
	[dias_11] [decimal](2, 0) NULL,
	[dias_12] [decimal](2, 0) NULL,
	[sueldo_prom] [decimal](14, 2) NULL,
	[vr_acumula] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_dotacion')
begin 
CREATE TABLE [dbo].[nom_dotacion](
	[codigo] [nvarchar](2) NULL,
	[nombre] [nvarchar](20) NULL
)
end
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_empleado')
begin
CREATE TABLE nom_empleado (
		 codi_emple		[nvarchar](4)	NOT NULL DEFAULT ''
		,cedula			[nvarchar](15)	NOT NULL DEFAULT ''
		,lugexp			[nvarchar](25)	NOT NULL DEFAULT ''
		,nombres		[nvarchar](30)  NOT NULL DEFAULT ''
		,nombre2		[nvarchar](30)	NOT NULL DEFAULT ''
		,apellido_1		[nvarchar](25)  NOT NULL DEFAULT ''
		,apellido_2		[nvarchar](25)  NOT NULL DEFAULT ''
		,nombret		[nvarchar](120) NOT NULL DEFAULT ''		-- Se cambia longitud de 200 a 120 - Éduar - Febrero 26 de 2015.
		,codcen			[nvarchar](3)	NOT NULL DEFAULT ''
		,codi_suc		[nvarchar](2)	NOT NULL DEFAULT ''
		,codi_sec		[nvarchar](3)	NOT NULL DEFAULT ''
		,codi_obra		[nvarchar](3)	NOT NULL DEFAULT ''
		,direccion		[nvarchar](30)	NOT NULL DEFAULT ''
		,telefono		[nvarchar](10)	NOT NULL DEFAULT ''
		,celular		[nvarchar](10)	NOT NULL DEFAULT ''
		,ciudad			[nvarchar](15)	NOT NULL DEFAULT ''
		,codi_cargo		[nvarchar](3)	NOT NULL DEFAULT ''
		,codi_ctocosto	[nvarchar](3)	NOT NULL DEFAULT ''
		,codi_labor		[nvarchar](2)	NOT NULL DEFAULT ''
		,estado_civil	[decimal] (1,0) NOT NULL DEFAULT 0
		,num_hijos		[decimal] (2,0) NOT NULL DEFAULT 0
		,codi_estado	[nvarchar](2)	NOT NULL DEFAULT ''
		,fecha_nac		[datetime]		NOT NULL
		,fecha_ing		[datetime]		NOT NULL
		,fecha_vac		[datetime]		NOT NULL
		,fecha_sueldo	[datetime]		NOT NULL
		,fecha_ces		[datetime]		NOT NULL
		,fecha_int		[datetime]		NOT NULL
		,fecha_prima	[datetime]		NOT NULL
		,fecha_retiro	[datetime]		NOT NULL
		,codi_eps		[nvarchar](15)	NOT NULL DEFAULT ''
		,codi_cesan		[nvarchar](15)	NOT NULL DEFAULT ''
		,codi_pension	[nvarchar](15)	NOT NULL DEFAULT ''
		,codi_arp		[nvarchar](15)	NOT NULL DEFAULT ''
		,codi_ctopago	[nvarchar](4)	NOT NULL DEFAULT ''
		,codi_ctapago	[nvarchar](15)	NOT NULL DEFAULT ''
		,codi_nivel		[nvarchar](2)	NOT NULL DEFAULT ''
		,codi_prof		[nvarchar](2)	NOT NULL DEFAULT ''
		,codi_entidad	[nvarchar](4)	NOT NULL DEFAULT ''
		,fecha_grado	[datetime]		NOT NULL
		,codi_carrera	[nvarchar](4)	NOT NULL DEFAULT ''
		,num_grado		[decimal] (2,0) NOT NULL DEFAULT 0
		,talla_calza	[decimal] (2,0) NOT NULL DEFAULT 0
		,talla_camisa	[nvarchar](2)	NOT NULL DEFAULT ''
		,talla_panta	[decimal] (2,0) NOT NULL DEFAULT 0
		,talla_casco	[decimal] (2,0) NOT NULL DEFAULT 0
		,talla_guante	[decimal] (2,0) NOT NULL DEFAULT 0
		,sueldo			[decimal](14,2) NOT NULL DEFAULT 0
		,sindicato		[bit]			NOT NULL DEFAULT 0
		,subtrans		[bit]			NOT NULL DEFAULT 0
		,salintegral	[bit]			NOT NULL DEFAULT 0
		,obra			[bit]			NOT NULL DEFAULT 0
		,dedret			[decimal](12,2) NOT NULL DEFAULT 0
		,nocuoman		[bit]			NOT NULL DEFAULT 0
		,porret			[decimal](10,2) NOT NULL DEFAULT 0
		,jefe			[bit]			NOT NULL DEFAULT 0
		,acuprov		[bit]			NOT NULL DEFAULT 0
		,acuaporte		[bit]			NOT NULL DEFAULT 0
		,estado			[decimal] (1,0) NOT NULL DEFAULT 0
		,acueps			[bit]			NOT NULL DEFAULT 0
		,banco			[nvarchar](200) NOT NULL DEFAULT ''
		,acusoli		[bit]			NOT NULL DEFAULT 0
		,tipid			[nvarchar](2)	NOT NULL DEFAULT ''
		,smextras		[bit]			NOT NULL DEFAULT 0
		,tipcot			[nvarchar](2)	NOT NULL DEFAULT ''
		,aplsoi			[bit]			NOT NULL DEFAULT 0
		,codciu			[nvarchar](4)	NOT NULL DEFAULT ''
		,coddpto		[nvarchar](2)	NOT NULL DEFAULT ''
		,arpemp			[decimal] (5,3)	NOT NULL DEFAULT 0
		,email			[nvarchar](50)	NOT NULL DEFAULT ''
		,tallabota		[decimal] (9,0) NOT NULL DEFAULT 0
		,tallamalla		[decimal] (9,0) NOT NULL DEFAULT 0
		,tallatapab		[decimal] (9,0) NOT NULL DEFAULT 0
		,pproduc		[bit]			NOT NULL DEFAULT 0
		,acupen			[bit]			NOT NULL DEFAULT 0
		,sexo			[decimal] (1,0) NOT NULL DEFAULT 0
		,aportesdev		[bit]			NOT NULL DEFAULT 0
		,salario		[decimal] (1,0) NOT NULL DEFAULT 0
		,nomhijo1		[nvarchar](30)  NOT NULL DEFAULT ''
		,nomhijo2		[nvarchar](30)  NOT NULL DEFAULT ''
		,nomhijo3		[nvarchar](30)  NOT NULL DEFAULT ''
		,nomhijo4		[nvarchar](30)  NOT NULL DEFAULT ''
		,nomhijo5		[nvarchar](30)  NOT NULL DEFAULT ''
		,fechijo1		[datetime]		NOT NULL
		,fechijo2		[datetime]		NOT NULL
		,fechijo3		[datetime]		NOT NULL
		,fechijo4		[datetime]		NOT NULL
		,fechijo5		[datetime]		NOT NULL
		,nomconyuge		[nvarchar](30)  NOT NULL DEFAULT ''
		,fecconyuge		[datetime]		NOT NULL
		,ocuconyuge		[nvarchar](30)	NOT NULL DEFAULT ''
		,fecexpcc		[datetime]		NOT NULL
		,idemp			[nvarchar](3)	NOT NULL DEFAULT ''
		,imagen			[image]			NULL
		,foto			[text]			NOT NULL DEFAULT ''				-- Agregado por Éduar Álvarez - Febrero 20 de 2015.
		,HExtEsp		[bit]			NOT NULL DEFAULT 0				-- Agregué DEFAULT 0 - Éduar  - Febrero 26 de 2015.
		,tipdom			[nvarchar](2)	NOT NULL DEFAULT ''				-- Agregado por Éduar Álvarez - Febrero 18 de 2015.
		,ibc			[decimal](14,2)	NOT NULL DEFAULT 0				-- Agregado por Éduar Álvarez - Marzo 10 de 2015.
		,laborasab		[bit]			NOT NULL DEFAULT 0				-- 
		,acuepsemp		[bit]			NOT NULL DEFAULT 0				-- 
		,tipvin			[nvarchar](3)	NOT NULL DEFAULT ''				-- Fin Agregado Marzo 10 de 2015.

	CONSTRAINT [PK_nom_empleado] PRIMARY KEY CLUSTERED ([codi_emple] ASC)
	WITH (PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY=OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY])
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_entidad')
begin 
CREATE TABLE [dbo].[nom_entidad](
	[codi_enti] [nvarchar](2) NULL,
	[nombre] [nvarchar](40) NULL,
	[direccion] [nvarchar](30) NULL,
	[ciudad] [nvarchar](15) NULL,
	[telefono] [nvarchar](20) NULL,
	[num_aprob] [nvarchar](15) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_estados')
begin 
CREATE TABLE [dbo].[nom_estados](
		[codi_estado] [nvarchar](2) NULL,
	[nombre] [nvarchar](30) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_festivos')
begin 
CREATE TABLE [dbo].[nom_festivos](
	[fecha] [datetime] NOT NULL,
	[nombre] [nvarchar](30) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_fondos')
begin 
CREATE TABLE [dbo].[nom_fondos](
	[codi_fondo] [nvarchar](3) NULL,
	[nombre] [nvarchar](50) NULL,
	[nit_fondo] [nvarchar](10) NULL,
	[dv_fondo] [nvarchar](1) NULL,
	[eps] [bit] NOT NULL,
	[pension] [bit] NOT NULL,
	[cesan] [bit] NOT NULL,
	[arp] [bit] NOT NULL,
	[codi_fond1] [nvarchar](5) NULL,
	[codi_fond2] [nvarchar](5) NULL,
	[codi_fond3] [nvarchar](5) NULL,
	[codi_fond4] [nvarchar](5) NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_historia')
begin 
CREATE TABLE [dbo].[nom_historia](
	[codi_emple] [nvarchar](4) NULL,
	[tran_codi] [nvarchar](4) NULL,
	[qty] [decimal](8, 0) NULL,
	[vr_parcial] [decimal](12, 2) NULL,
	[valdeduc] [decimal](12, 2) NULL,
	[valdeven] [decimal](12, 2) NULL,
	[vr_total] [decimal](12, 2) NULL,
	[año] [decimal](4, 0) NULL,
	[mes] [nvarchar](2) NULL,
	[periodo] [nvarchar](1) NULL,
	[codi_sec] [nvarchar](3) NULL,
	[qtyh] [decimal](8, 2) NULL,
	[fecnov] [datetime] NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_hojpago')
begin 
CREATE TABLE [dbo].[nom_hojpago](
	[columna] [decimal](2, 0) NULL,
	[tran_codi] [nvarchar](4) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_horario')
begin 
CREATE TABLE [dbo].[nom_horario](
	[codi_emple] [nvarchar](4) NOT NULL,
	[codi_sec] [nvarchar](3) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[entrada] [decimal](6, 2) NOT NULL,
	[jornada] [nvarchar](2) NOT NULL,
	[salida] [decimal](6, 2) NOT NULL,
	[tothoras] [decimal](6, 2) NOT NULL,
	[normales] [decimal](6, 2) NOT NULL,
	[hediurna] [decimal](6, 2) NOT NULL,
	[henoc] [decimal](6, 2) NOT NULL,
	[rcnoc] [decimal](6, 2) NOT NULL,
	[festivas] [decimal](6, 2) NOT NULL,
	[rcnfes] [decimal](6, 2) NOT NULL,
	[hedfes] [decimal](6, 2) NOT NULL,
	[henfes] [decimal](6, 2) NOT NULL,
	[codi_secd] [nvarchar](3) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[idemp] [nvarchar](3) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_labores')
begin 
CREATE TABLE [dbo].[nom_labores](
	[codigo] [nvarchar](2) NULL,
	[nombre] [nvarchar](30) NULL,
	[tipo] [decimal](1, 0) NULL,
	[alarmbc] [decimal](18, 0) NULL,
	[alarmdias] [decimal](9, 0) NULL,
	[alarmfc] [decimal](18, 0) NULL,
	[alarmvence] [bit] NOT NULL,
	[diasvigen] [decimal](9, 0) NULL,
	[rutaplani] [nvarchar](100) NULL,
	[servicio] [bit] NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_liquidacion')
begin 
CREATE TABLE [dbo].[nom_liquidacion](
	[codigo]	    [decimal](1,0) NULL,
	[nombre]	    [nvarchar](30) NULL,
	[dias]		    [decimal](2,0) NULL,
	[codcau]	    [nvarchar](3)  NULL,
	[codi_emple]    [nvarchar](4)  NULL,
	[codusu]	    [nvarchar](10) NULL,
	[fecha]		    [datetime] NULL,
	[fecha_ces]	    [datetime] NULL,
	[fecha_ing]	    [datetime] NULL,
	[fecha_prima]   [datetime] NULL,
	[fecha_retiro]  [datetime] NULL,
	[fecha_vac]		[datetime] NULL,
	[sueldo]		[decimal](12,2) NULL,
	[vrliq]			[decimal](12,2) NULL
)
end
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_menu')		Drop Table nom_menu		-- Modificado Mayo 12 de 2015 - Éduar Álvarez.
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_meses')		Drop Table nom_meses	-- Modificado Mayo 12 de 2015 - Éduar Álvarez.
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_movperso')	Drop Table nom_movperso	-- Modificado Mayo 12 de 2015 - Éduar Álvarez.
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_niveles')
begin 
CREATE TABLE [dbo].[nom_niveles](
	[codigo] [nvarchar](2) NULL,
	[nombre] [nvarchar](15) NULL
) 
end 
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_novcartera')	Drop Table nom_novcartera	-- Modificado Mayo 12 de 2015 - Éduar Álvarez.
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_novedad')
begin 
CREATE TABLE [dbo].[nom_novedad](
	[codi_emple] [nvarchar](4) NULL,
	[tran_codi] [nvarchar](4) NULL,
	[qty] [decimal](8, 2) NULL,
	[vr_parcial] [decimal](12, 2) NULL,
	[valdeduc] [decimal](12, 2) NULL,
	[valdeven] [decimal](12, 2) NULL,
	[vr_total] [decimal](12, 2) NULL,
	[ano] [decimal](4, 0) NULL,
	[mes] [nvarchar](2) NULL,
	[periodo] [nvarchar](1) NULL,
	[fecnov] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[codi_sec] [nvarchar](3) NULL,
	[qtyh] [decimal](8, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_obra')
begin 
CREATE TABLE [dbo].[nom_obra](
	[obra_codi] [nvarchar](3) NULL,
	[obra_nomb] [nvarchar](60) NULL,
	[obra_enti] [nvarchar](30) NULL,
	[obra_cons] [nvarchar](30) NULL,
	[obra_dire] [nvarchar](30) NULL,
	[obra_tele] [nvarchar](20) NULL,
	[obra_inge] [nvarchar](30) NULL,
	[obra_resi] [nvarchar](30) NULL,
	[obra_lici] [nvarchar](15) NULL,
	[obra_pres] [datetime] NULL,
	[obra_admi] [decimal](5, 2) NULL,
	[obra_util] [decimal](5, 2) NULL,
	[obra_impr] [decimal](5, 2) NULL,
	[obra_iva] [decimal](5, 2) NULL,
	[obra_fech] [datetime] NULL,
	[obra_peri] [decimal](5, 0) NULL,
	[obra_peri_] [decimal](1, 0) NULL,
	[ciud_codi] [nvarchar](3) NULL
)
end 
GO

-- Modificado por Éduar Álvarez - Marzo 2 de 2015.
IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_otrdat')
begin 
	CREATE TABLE nom_otrdat (
		 [direccion]	[nvarchar](40) NULL
		,[telefono]		[nvarchar](15) NULL
		,[ciudad]		[nvarchar](30) NULL
		,[codprima]		[nvarchar](4) NULL
		,[codcesan]		[nvarchar](4) NULL
		,[codinter]		[nvarchar](4) NULL
		,[codvacac]		[nvarchar](4) NULL
		,[codiextras]	[nvarchar](4) NULL
		,[coddiat]		[nvarchar](4) NULL
		,[codsubt]		[nvarchar](4) NULL
		,[codpension]	[nvarchar](4) NULL
		,[codsalud]		[nvarchar](4) NULL
		,[codindem]		[nvarchar](4) NULL
		,[subtrans]		[decimal](12, 2) NULL
		,[anoproc]		[nvarchar](4) NULL
		,[codsancion]	[nvarchar](4) NULL
		,[codsolid]		[nvarchar](4) NULL
		,[codsindi]		[nvarchar](4) NULL
		,[salminimo]	[decimal](12, 2) NULL
		,[retesueldo]	[nvarchar](4) NULL
		,[embalim]		[nvarchar](4) NULL
		,[embcomer]		[nvarchar](4) NULL
		,[auxcuoman]	[decimal](10, 2) NULL
		,[ahofondo]		[nvarchar](4) NULL
		,[sena]			[decimal](5, 2) NULL
		,[icbf]			[decimal](5, 2) NULL
		,[jef_bien]		[nvarchar](40) NULL
		,[ctasueldo]	[nvarchar](8) NULL
		,[salude]		[decimal](5, 2) NULL
		,[saludp]		[decimal](5, 2) NULL
		,[pensione]		[decimal](5, 3) NULL
		,[pensionp]		[decimal](5, 3) NULL
		,[solie]		[decimal](5, 3) NULL
		,[solip]		[decimal](5, 3) NULL
		,[arp]			[decimal](5, 3) NULL
		,[nit]			[nvarchar](12) NULL
		,[comfamiliar]	[decimal](5, 2) NULL
		,[corte1]		[decimal](2, 0) NULL
		,[corte2]		[decimal](2, 0) NULL
		,[año]			[decimal](4, 0) NULL
		,[codincap]		[nvarchar](4) NULL
		,[tipocorte]	[decimal](1, 0) NULL
		,[cansub]		[decimal](1, 0) NULL
		,[repnom]		[nvarchar](50) NULL
		,[codarp]		[nvarchar](3) NULL
		,[codccf]		[nvarchar](3) NULL
		,[liqprima]		[bit] NOT NULL
		,[codfes]		[nvarchar](4) NULL
		,[codhed]		[nvarchar](4) NULL
		,[codhedf]		[nvarchar](4) NULL
		,[codhen]		[nvarchar](4) NULL
		,[codhenf]		[nvarchar](4) NULL
		,[codrec]		[nvarchar](4) NULL
		,[codrecf]		[nvarchar](4) NULL
		,[codinca]		[nvarchar](4) NULL
		,[codinca2]		[nvarchar](4) NULL
		,[repnom1]		[nvarchar](30) NULL
		,[codant]		[nvarchar](4) NULL
		,[reccant]		[bit] NOT NULL
		,[rutcontab]	[nvarchar](100) NULL
		,[manejadia]	[bit] NOT NULL
		,[nosalmini]	[bit] NOT NULL
		,[transfijas]	[bit] NOT NULL
		,[recalcular]	[bit] NOT NULL
		,[notaing]		[nvarchar](max) NULL
		,[consec]		[decimal](10, 0) NULL
		,[firmadoc]		[nvarchar](max) NULL
		,[leyenvaca]	[bit] Not Null
		,[recalprest]	[bit] Not Null
		,[cxppresta]	[bit] Not Null
		,[ctaxpagar]	[nvarchar](8) Null
		,[ctapresta]	[nvarchar](8) Null
		,[transpres]	[nvarchar](2) Null
		,[idemp]		[nvarchar](3) Null
		,[mesesprom]	[nchar](2) Null
		,[mesescesan]	[nchar](2) Null
		,[tipdocpres]	[nvarchar](2) Not Null Default ''	-- Éduar Álvarez - Marzo 2 de 2015.
		,[tipdocrc]		[nvarchar](2) Not Null Default ''
		,[tipdocxc]		[nvarchar](2) Not Null Default ''
		,[tipdocxp]		[nvarchar](2) Not Null Default ''
		,[pagparfis]	[bit] Not Null Default 0
		,[cajaxcen]		[bit] Not Null Default 0		-- ÉÁ
		,[VacLiqCon]	[bit] Not Null Default 0
	)
end 
GO



IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_pagos')
begin 
CREATE TABLE [dbo].[nom_pagos](
	[codi_emple] [nvarchar](4) NULL,
	[salnet] [decimal](14, 2) NULL,
	[periodo] [nvarchar](1) NULL,
	[mes] [nvarchar](2) NULL,
	[año] [decimal](4, 0) NULL,
	[detpag] [nvarchar](80) NULL,
	[tippag] [decimal](1, 0) NULL,
	[okpago] [bit] NOT NULL,
	[numegr] [nvarchar](12) NULL,
	[codi_fondo] [nvarchar](3) NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_prima')
begin 
CREATE TABLE [dbo].[nom_prima](
	[codi_sec] [nvarchar](3) NULL,
	[numprima] [nvarchar](8) NULL,
	[codi_emple] [nvarchar](4) NULL,
	[fecha] [datetime] NULL,
	[base] [decimal](14, 2) NULL,
	[dias] [decimal](3, 0) NULL,
	[subtotal] [decimal](14, 2) NULL,
	[deduccion] [decimal](14, 2) NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[periodo] [nvarchar](1) NULL,
	[sueldo] [decimal](1, 0) NULL,
	[ano] [decimal](4, 0) NULL,
	[fechaultp] [datetime] NULL,
	[promedio] [bit] NOT NULL,
	[sbase] [bit] NOT NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_profesion')
begin 
CREATE TABLE [dbo].[nom_profesion](
	[codi_prof] [nvarchar](2) NULL,
	[titulo] [nvarchar](30) NULL,
	[nivel_educ] [nvarchar](2) NULL
)
end 
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_pruebas')	Drop Table nom_pruebas		-- Modify Mayo 12 de 2015 by Éduar Álvarez.
GO

IF EXISTS(Select * From dbo.sysobjects Where name='nom_retencion')	Drop Table nom_retencion	-- Modify Mayo 12 de 2015 by Éduar Álvarez.
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_seccion')
begin
CREATE TABLE nom_seccion (
				 codi_sec		[nvarchar](3) NULL
				,nombre			[nvarchar](70) NULL
				,tasa_ces		[decimal](5,2) NULL
				,tasa_ints		[decimal](5,2) NULL
				,tasa_vac		[decimal](5,2) NULL
				,tasa_prima		[decimal](5,2) NULL
				,tasa_dotac		[decimal](5,2) NULL
				,tasa_arp		[decimal](5,3) NULL
				,tasa_fondo		[decimal](5,3) NULL
				,tasa_eps		[decimal](5,3) NULL
				,dias_base		[decimal](3,0) NULL
				,ctacesd		[nvarchar](8) NULL
				,ctacesc		[nvarchar](8) NULL
				,ctaintd		[nvarchar](8) NULL
				,ctaintc		[nvarchar](8) NULL
				,ctavacd		[nvarchar](8) NULL
				,ctavacc		[nvarchar](8) NULL
				,ctaprid		[nvarchar](8) NULL
				,ctapric		[nvarchar](8) NULL
				,ctaepsd		[nvarchar](8) NULL
				,ctaepsc		[nvarchar](8) NULL
				,ctafond		[nvarchar](8) NULL
				,ctafonc		[nvarchar](8) NULL
				,ctaarpd		[nvarchar](8) NULL
				,ctaarpc		[nvarchar](8) NULL
				,ctasena		[nvarchar](8) NULL
				,ctacaja		[nvarchar](8) NULL
				,ctaicbf		[nvarchar](8) NULL
				,ctaaporte		[nvarchar](8) NULL
				,ctavacacon		[nvarchar](8) NULL
				,ctaintcon		[nvarchar](8) NULL
				,ctacescon		[nvarchar](8) NULL
				,ctaprimcon		[nvarchar](8) NULL
				,tipliq			[decimal](1,0) NULL
				,corte1			[decimal](2,0) NULL
				,corte2			[decimal](2,0) NULL
				,perliq			[decimal](1,0) NULL
				,codenti		[nvarchar](15) NULL
				,tiponov		[nvarchar](4)  NULL
				,ctasueldo		[nvarchar](8)  NULL
				,nitcta			[nvarchar](1)  NULL
				,codicbf		[nvarchar](15) NULL
				,codccf			[nvarchar](15) NULL
				,nitcesantias	[decimal](1,0) NULL
				,niteps			[decimal](1,0) NULL
				,nitpension		[decimal](1,0) NULL
				,nitarp			[decimal](1,0) NULL
				,idemp			[nchar](3) NULL
				,nitarlcr		[nvarchar](1) NOT NULL DEFAULT '0'		-- Agregados por Éduar Álvarez.
				,nitarldb		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitcescr		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitcesdb		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitepscr		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitepsdb		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitpencr		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitpendb		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitprimcr		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitprimdb		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitvaccr		[nvarchar](1) NOT NULL DEFAULT '0'
				,nitvacdb		[nvarchar](1) NOT NULL DEFAULT '0'
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_sucursal')
begin 
CREATE TABLE [dbo].[nom_sucursal](
	[codi_suc] [nvarchar](2) NULL,
	[nombre] [nvarchar](20) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_tablacon')
begin 
CREATE TABLE [dbo].[nom_tablacon](
	[codi_sec]   [nvarchar] (03) NULL,
	[tran_codi]  [nvarchar] (04) NULL,
	[tipcue]     [nvarchar] (01) NULL,
	[codcued]    [nvarchar] (08) NULL,
	[codcuer]    [nvarchar] (08) NULL,
	[codnit]     [nvarchar] (01) NULL,
	[numnit]     [nvarchar] (15) NULL,
	[cxcCodcueD] [nvarchar] (08) NOT NULL,		-- Campos adicionados en Febrero 12 de 2015 por Éduar Álvarez.
	[cxcCodcueC] [nvarchar] (08) NOT NULL,
	[cxcNit]	 [nvarchar] (15) NOT NULL,
	[cxcCodCen]	 [nvarchar] (03) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_tarifas')
begin 
CREATE TABLE [dbo].[nom_tarifas](
	[tran_codi] [nvarchar](4) NULL,
	[codi_emple] [nvarchar](4) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_tipocotiz')
begin 
CREATE TABLE nom_tipocotiz (codigo [nchar](2) NOT NULL,
							nombre [nchar](200) NOT NULL)
end 
GO
-- Inserts Agregados por Éduar Álvarez - Febrero 18 de 2015.
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('01', 'Dependiente')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('02', 'Servicio Domestico')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('03', 'Independiente')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('04', 'Madre comunitaria')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('12', 'Aprendices del SENA en etapa lectiva')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('15', 'Desempleado con subsidio de Caja de Compensación Familiar')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('16', 'Independiente agremiado ó asociado')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('18', 'Funcionarios públicos sin tope máximo en el IBC')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('19', 'Aprendices del SENA en etapa productiva')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('20', 'Estudiantes (Régimen especial-Ley 789/2002)')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('21', 'Estudiantes de postgrado en salud (Decreto 190 de 1996)')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('22', 'Profesor de establecimiento particular')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('30', 'Dependiente Entidades o Universidades Públicas con régimen especial en Salud.')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('31', 'Cooperados o Precooperativas de trabajo asociado.')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('32', 'Cotizante miembro de la carrera diplomática o consular de un país extranjero o funcionario de organismo multilateral no sometido a la legislación colombiana.')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('33', 'Beneficiario del Fondo de Solidaridad Pensional')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('34', 'Concejal amparado por póliza de salud')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('40', 'Beneficiario UPC Adicional Lo suministra el aportante')
INSERT INTO nom_tipocotiz (codigo,nombre) VALUES ('46', 'Practicante')


IF NOT EXISTS(Select * From dbo.sysobjects Where name='Nom_Transaccion')
begin
CREATE TABLE Nom_Transaccion (
			 tran_codi		[nvarchar](4)	NOT NULL
			,tran_nomb		[nvarchar](50)	NOT NULL
			,camposai		[nvarchar](3)	NOT NULL
			,abrev			[nvarchar](10)	NOT NULL
			,tipo			[decimal](1, 0) NOT NULL
			,clase			[decimal](1, 0) NOT NULL
			,acumula		[bit]			NOT NULL
			,periodo		[decimal](1, 0) NOT NULL
			,formula		[nvarchar](254) NOT NULL
			,acprima		[bit]			NOT NULL
			,accesan		[bit]			NOT NULL
			,acinter		[bit]			NOT NULL
			,acvacac		[bit]			NOT NULL
			,acpension		[bit]			NOT NULL
			,acsalud		[bit]			NOT NULL
			,unidad			[nvarchar](1)	NOT NULL
			,acicbf			[bit]			NOT NULL
			,accomfa		[bit]			NOT NULL
			,acsena			[bit]			NOT NULL
			,acarp			[bit]			NOT NULL
			,extra			[bit]			NOT NULL
			,base			[nvarchar](1)	NOT NULL
			,opera			[nvarchar](1)	NOT NULL
			,vrfactor		[decimal](18,4) NOT NULL
			,acanticipo		[bit]			NOT NULL
			,acsoi			[bit]			NOT NULL
			,corte			[decimal](10,0) NOT NULL
			,dctodia		[bit]			NOT NULL
			,dctopensi		[bit]			NOT NULL
			,dctosalud		[bit]			NOT NULL
			,dctotransp		[bit]			NOT NULL
			,liqcomple		[bit]			NOT NULL
			,noaplivaca		[bit]			NOT NULL
			,otringreso		[bit]			NOT NULL
			,vlrinfo		[bit]			NOT NULL
			,orden			[Numeric](3)	NOT NULL DEFAULT 0		-- Agregados por Eduar Alvarez - Marzo 6 de 2015.
			,ctaxc			[Char](8)		NOT NULL DEFAULT ''
			,noaplitfija	[bit]			NOT NULL DEFAULT 0
			,prioridad		[Numeric](2)	NOT NULL DEFAULT 0
			,propordia		[bit]			NOT NULL DEFAULT 0
			,recargos		[bit]			NOT NULL DEFAULT 0
			,tranagru		[nvarchar](4)	NOT NULL DEFAULT ''
			,prodiainca		[bit]			NOT NULL DEFAULT 0
			,clasif			[nvarchar](2)	NOT NULL DEFAULT ''
			,gencxc			[bit]			NOT NULL DEFAULT 0
			,gencxp			[bit]			NOT NULL DEFAULT 0
			,genrc			[bit]			NOT NULL DEFAULT 0
			,retencion		[bit]			NOT NULL DEFAULT 0
			,tfijaformu		[bit]			NOT NULL DEFAULT 0
			,detalle		[bit]			NOT NULL DEFAULT 0		-- Fin.
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_vacaciones')
begin 
CREATE TABLE nom_vacaciones (
				[codi_emple] [nvarchar](4) NULL,
				[fecnov] [datetime] NULL,
				[ultper] [datetime] NULL,
				[diapag] [decimal](10, 0) NULL,
				[perini] [datetime] NULL,
				[regreso] [datetime] NULL,
				[valor] [decimal](12, 2) NULL,
				[consec] [nvarchar](8) NULL,
				[sueldo] [decimal](14, 0) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_vacadetalle')
begin 
CREATE TABLE [dbo].[nom_vacadetalle](
	[consec] [nvarchar](8) NULL,
	[tran_codi] [nvarchar](4) NULL,
	[qty] [decimal](5, 0) NULL,
	[vrparcial] [decimal](14, 2) NULL,
	[devengado] [decimal](14, 2) NULL,
	[deducido] [decimal](14, 2) NULL,
	[vrtotal] [decimal](14, 2) NULL,
	[codi_emple] [nvarchar](4) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ped_comprobante')
begin 
CREATE TABLE [dbo].[ped_comprobante](
	[codtran] [nvarchar](2) NULL,
	[consec] [nvarchar](16) NULL,
	[fecdoc] [datetime] NULL,
	[codcue] [nvarchar](8) NULL,
	[nitter] [nvarchar](12) NULL,
	[detalle] [nvarchar](90) NULL,
	[debito] [decimal](14, 2) NULL,
	[credito] [decimal](14, 2) NULL,
	[codcto] [nvarchar](3) NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[codcen] [nvarchar](3) NULL,
	[estcomp] [nvarchar](1) NULL,
	[numche] [nvarchar](10) NULL,
	[codact] [nvarchar](10) NULL,
	[base] [decimal](14, 2) NULL,
	[turno] [decimal](10, 0) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ped_facdetalle')
begin 
CREATE TABLE [dbo].[ped_facdetalle](
	[codcen] [nvarchar](3) NULL,
	[tipfac] [nvarchar](2) NULL,
	[numfac] [nvarchar](8) NULL,
	[codart] [nvarchar](10) NULL,
	[undart] [nvarchar](3) NULL,
	[qtyart] [decimal](10, 2) NULL,
	[devart] [decimal](10, 0) NULL,
	[cosins] [decimal](12, 2) NULL,
	[valart] [decimal](12, 2) NULL,
	[ivaart] [decimal](6, 2) NULL,
	[desart] [decimal](6, 2) NULL,
	[numcon] [nvarchar](8) NULL,
	[valdes] [decimal](12, 2) NULL,
	[valdev] [decimal](12, 2) NULL,
	[valtot] [decimal](12, 2) NULL,
	[valaju] [float] NULL,
	[descrip] [nvarchar](max) NULL,
	[codcto] [nvarchar](3) NULL,
	[docrel] [nvarchar](13) NULL,
	[titulo] [nvarchar](200) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ped_facturas')
begin 
CREATE TABLE [dbo].[ped_facturas](
		[codcen] [nvarchar](3) NULL,
	[tipfac] [nvarchar](2) NULL,
	[numfac] [nvarchar](8) NULL,
	[fecfac] [datetime] NULL,
	[venfac] [datetime] NULL,
	[codcue] [nvarchar](8) NULL,
	[nitcli] [nvarchar](12) NULL,
	[nitven] [nvarchar](12) NULL,
	[vtafac] [decimal](12, 0) NULL,
	[ivafac] [decimal](12, 0) NULL,
	[otrfac] [decimal](12, 2) NULL,
	[ajpfac] [decimal](12, 2) NULL,
	[antfac] [decimal](12, 2) NULL,
	[devfac] [decimal](12, 0) NULL,
	[abofac] [decimal](12, 0) NULL,
	[dctfac] [decimal](12, 0) NULL,
	[retfac] [decimal](12, 0) NULL,
	[ricfac] [decimal](12, 0) NULL,
	[rivfac] [decimal](12, 0) NULL,
	[netfac] [decimal](12, 0) NULL,
	[cosfac] [decimal](12, 0) NULL,
	[numcon] [nvarchar](8) NULL,
	[estfac] [nvarchar](1) NULL,
	[entrega] [decimal](14, 2) NULL,
	[cambio] [decimal](14, 2) NULL,
	[codusu] [nvarchar](8) NULL,
	[observa] [nvarchar](max) NULL,
	[ajuste] [bit] NOT NULL,
	[cosaju] [float] NULL,
	[pendiente] [bit] NOT NULL,
	[fecsys] [datetime] NULL,
	[cuofac] [decimal](12, 0) NULL,
	[inifac] [datetime] NULL,
	[estado] [nvarchar](10) NULL,
	[plaza] [nvarchar](40) NULL,
	[tipoventa] [nvarchar](10) NULL,
	[valini] [decimal](14, 2) NULL,
	[saldocli] [decimal](14, 2) NULL,
	[orden] [nvarchar](10) NULL,
	[docrel] [nvarchar](13) NULL,
	[estret] [nvarchar](1) NULL,
	[codturno] [decimal](10, 0) NULL,
	[cuoini] [decimal](10, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ped_kardex')
begin 
CREATE TABLE [dbo].[ped_kardex](
	
	[codalm] [nvarchar](3) NULL,
	[codcen] [nvarchar](3) NULL,
	[numcon] [nvarchar](8) NULL,
	[fecmov] [datetime] NULL,
	[codcon] [nvarchar](2) NULL,
	[codart] [nvarchar](10) NULL,
	[qtyart] [decimal](14, 2) NULL,
	[cosart] [decimal](14, 2) NULL,
	[valart] [decimal](14, 2) NULL,
	[ivaart] [decimal](14, 2) NULL,
	[totart] [decimal](14, 2) NULL,
	[netart] [decimal](14, 2) NULL,
	[traalm] [nvarchar](3) NULL,
	[centra] [nvarchar](3) NULL,
	[contra] [nvarchar](8) NULL,
	[consec] [nvarchar](16) NULL,
	[nitter] [nvarchar](12) NULL,
	[observa] [nvarchar](80) NULL,
	[estkar] [nvarchar](1) NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](6) NULL,
	[qtypro] [decimal](14, 2) NULL,
	[qtyfac] [decimal](14, 2) NULL,
	[undart] [nvarchar](3) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ped_pagdetalle')
begin 
CREATE TABLE [dbo].[ped_pagdetalle](
	[tippag] [nvarchar](2) NULL,
	[codcen] [nvarchar](3) NULL,
	[numdoc] [nvarchar](10) NULL,
	[forpag] [nvarchar](2) NULL,
	[valpag] [decimal](14, 2) NULL,
	[codban] [nvarchar](10) NULL,
	[afedoc] [nvarchar](15) NULL,
	[feccheq] [datetime] NULL,
	[estcheq] [nvarchar](1) NULL,
	[vrrtecom] [decimal](12, 3) NULL,
	[vrrtefte] [decimal](12, 3) NULL,
	[vrrteica] [decimal](12, 3) NULL,
	[vrrteiva] [decimal](12, 3) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ped_pagos')
begin 
CREATE TABLE [dbo].[ped_pagos](
	[tippag] [nvarchar](2) NULL,
	[codcen] [nvarchar](3) NULL,
	[numdoc] [nvarchar](8) NULL,
	[clapag] [nvarchar](1) NULL,
	[fecpag] [datetime] NULL,
	[nitcli] [nvarchar](12) NULL,
	[pagval] [decimal](14, 2) NULL,
	[netpag] [decimal](14, 2) NULL,
	[estpag] [nvarchar](1) NULL,
	[fecsys] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[detalle] [nvarchar](90) NULL,
	[cobrador] [nvarchar](60) NULL,
	[cambio] [decimal](12, 2) NULL,
	[recibo] [decimal](12, 2) NULL,
	[porcom] [decimal](6, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='PrbSistemas')
begin 
CREATE TABLE [dbo].[PrbSistemas](
	[id] [nvarchar](3) NOT NULL,
	[sexo] [bit] NOT NULL,
	[nombre] [datetime] NOT NULL,
	[nhijos] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[img] [image] NULL,
	[campomemo] [nvarchar](4000) NULL,
	[desdcto] [bit] NOT NULL,
 CONSTRAINT [PK_PrbSistemas] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_costos')
begin 
CREATE TABLE [dbo].[pro_costos](
	[idemp] [nchar](3) NOT NULL,
	[codcosd] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codprod] [nvarchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[valor] [decimal](14, 2) NOT NULL,
	[cencon] [nvarchar](3) NOT NULL,
	[codter] [nvarchar](15) NOT NULL,
	[detalle] [nvarchar](max) NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[numcon] [nvarchar](10) NOT NULL,
	[codusu] [nvarchar](6) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[qtyart] [decimal](12, 0) NOT NULL,
	[qtyrec] [decimal](12, 2) NOT NULL,
	[recibo] [bit] NOT NULL,
	[tipo] [decimal](1, 0) NOT NULL,
	[vrdesc] [decimal](12, 2) NOT NULL,
	[estcos] [nvarchar](1) NOT NULL,
	[tipcon] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](10) NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_ordenesdet')
begin 
CREATE TABLE pro_ordenesdet (
idemp varchar(3),
codcto varchar(3),
numord nvarchar(8),
item numeric(20),
codart nvarchar(10),
nomart nvarchar(60),
undart varchar(10),
caninv numeric(20),
qtyart numeric(20),
ucoart numeric(20),
total numeric(20),
codcue varchar(50),
nomcue varchar(3000),
minart numeric(20),
maxart numeric(20),
costmax numeric(20)
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_formulas')
begin 
CREATE TABLE [dbo].[pro_formulas](
	[codfor] [nvarchar](10) NOT NULL,
	[item] [numeric](2, 0) NOT NULL,
	[codins] [nvarchar](10) NOT NULL,
	[qtyart] [numeric](18, 4) NOT NULL,
	[qtydesp] [numeric](18, 4) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_pro_formulas_1] PRIMARY KEY CLUSTERED 
(
	[codfor] ASC,
	[codins] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_movcontrato')
begin 
CREATE TABLE [dbo].[pro_movcontrato](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[qtyart] [decimal](14, 2) NOT NULL,
	[tipo] [nvarchar](1) NOT NULL,
	[numfac] [nvarchar](10) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[numprod] [nvarchar](10) NOT NULL,
	[codprod] [nvarchar](10) NOT NULL,
	[valor] [decimal](14, 2) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](6) NOT NULL,
	[codter] [nvarchar](15) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_orddetalle')
begin 
CREATE TABLE [dbo].[pro_orddetalle](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codprod] [nvarchar](10) NOT NULL,
	[Codins] [nvarchar](10) NOT NULL,
	[qtyart] [numeric](16, 4) NOT NULL,
	[cosart] [numeric](14, 2) NOT NULL,
	[item] [numeric](18, 0) NOT NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_ordenes')
begin 
CREATE TABLE [dbo].[pro_ordenes](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codprod] [nvarchar](10) NOT NULL,
	[qtypro] [decimal](10, 2) NOT NULL,
	[fecord] [datetime] NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[detalle] [nvarchar](max) NOT NULL,
	[estord] [nvarchar](1) NOT NULL,
	[valor] [decimal](14, 2) NOT NULL,
	[otrcos] [decimal](14, 2) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[otrcosind] [decimal](14, 2) NOT NULL,
	[talla] [decimal](6, 1) NOT NULL,
	[actividad] [bit] NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[pvcart] [decimal](14, 2) NOT NULL,
	[qtyparc] [decimal](14, 2) NOT NULL,
	[utilidad] [decimal](10, 2) NOT NULL,
	[numpedido] [nvarchar](8) NOT NULL,
	[feccierre] [datetime] NOT NULL,
	[qtypro1] [decimal](14, 2) NOT NULL,
	[otrcosadd] [decimal](14, 2) NOT NULL,
	[otrcosindadd] [decimal](14, 2) NOT NULL,
	[valoradd] [decimal](14, 2) NOT NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_parametros')
begin 
CREATE TABLE [dbo].[pro_parametros](
	[idemp] [nvarchar](3) NOT NULL,
	[recibo] [bit] NOT NULL,
	[contab] [bit] NOT NULL,
	[conse] [decimal](1, 0) NOT NULL,
	[costadd] [bit] NOT NULL,
	[porcpro] [decimal](3, 0) NOT NULL,
	[cxpcontra] [bit] NOT NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_camestado')
begin 
CREATE TABLE [dbo].[ser_camestado](
	[numord] [nvarchar](10) NULL,
	[codestado] [nvarchar](3) NULL,
	[fecha] [datetime] NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_diagnos')
begin 
CREATE TABLE [dbo].[ser_diagnos](
	[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](50) NULL,
	[tipo] [decimal](1, 0) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_estados')
begin 
CREATE TABLE [dbo].[ser_estados](
	[codigo] [nvarchar](3) NULL,
	[estado] [nvarchar](40) NULL,
	[estcierre] [bit] NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_liqtec')
begin 
CREATE TABLE [dbo].[ser_liqtec](
	[numord] [nvarchar](10) NULL,
	[nittec] [nvarchar](15) NULL,
	[vrtotal] [decimal](14, 0) NULL,
	[vrliqui] [decimal](14, 0) NULL,
	[fecord] [datetime] NULL,
	[fecliq] [datetime] NULL,
	[codusu] [nvarchar](16) NULL,
	[fecsys] [datetime] NULL,
	[estliq] [nvarchar](1) NULL,
	[codcen] [nvarchar](3) NULL,
	[tipdoc] [nvarchar](2) NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_ordenrep')
begin 
CREATE TABLE [dbo].[ser_ordenrep](
	[numord] [nvarchar](10) NULL,
	[codart] [nvarchar](10) NULL,
	[codrep] [nvarchar](10) NULL,
	[cant] [decimal](3, 2) NULL,
	[vruni] [decimal](14, 2) NULL,
	[vrtotal] [decimal](14, 2) NULL,
	[codcen] [nvarchar](3) NULL,
	[vrcosto] [decimal](14, 2) NULL,
	[codalm] [nvarchar](3) NULL,
	[docsalida] [nvarchar](2) NULL,
	[numsalida] [nvarchar](8) NULL,
	[tipdoc] [nvarchar](2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_tipvehiculo')
begin 
CREATE TABLE [dbo].[ser_tipvehiculo](
	[codigo] [nvarchar](2) NOT NULL,
	[nombre] [nvarchar](40) NOT NULL
	CONSTRAINT [PK_SER_TIPVEHICULO] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)

end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Tec_Relacion')
begin 
CREATE TABLE [dbo].[Tec_Relacion](
		[tablapk] [nvarchar](50) NOT NULL,
	[tablafk] [nvarchar](50) NOT NULL,
	[Campofk] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tec_Relacion] PRIMARY KEY CLUSTERED 
(
	[tablapk] ASC,
	[tablafk] ASC,
	[Campofk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tes_conciliacion')
begin 
CREATE TABLE [dbo].[tes_conciliacion](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[tipcon] [nvarchar](2) NOT NULL,
	[totbco] [decimal](14, 2) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[ano] [decimal](4, 0) NOT NULL,
	[saldoant] [decimal](16, 2) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[fecon] [datetime] NOT NULL,
	[proces] [bit] NOT NULL,
	[tipdoc] [nvarchar](2) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tes_detconciliacion')
begin 
CREATE TABLE [dbo].[tes_detconciliacion](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[nomcli] [nvarchar](60) NOT NULL,
	[fecdoc] [datetime] NOT NULL,
	[numdoc] [nvarchar](20) NOT NULL,
	[valor] [decimal](14, 2) NOT NULL,
	[ok] [bit] NOT NULL,
	[tipcon] [nvarchar](2) NOT NULL,
	[tipimp] [nvarchar](1) NOT NULL,
	[totbco] [decimal](16, 2) NOT NULL,
	[codimp] [nvarchar](3) NOT NULL,
	[tipdoc] [nvarchar](2) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tes_egresos')
begin 
CREATE TABLE [dbo].[tes_egresos](
[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[consec] [nvarchar](16) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[fecegr] [datetime] NOT NULL,
	[nomben] [nvarchar](60) NOT NULL,
	[posfec] [datetime] NOT NULL,
	[numche] [decimal](10, 0) NOT NULL,
	[valegr] [decimal](14, 2) NOT NULL,
	[desegr] [decimal](14, 2) NOT NULL,
	[netegr] [decimal](14, 2) NOT NULL,
	[estegr] [nvarchar](1) NOT NULL,
	[tipo] [decimal](1, 0) NOT NULL,
	[observa] [nvarchar](100) NOT NULL,
	[idusu] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[observa2] [nvarchar](max) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tes_impuestos')
begin 
CREATE TABLE [dbo].[tes_impuestos](
		[idemp] [nvarchar](3) NOT NULL,
	[codimp] [nvarchar](3) NOT NULL,
	[nomimp] [nvarchar](40) NOT NULL,
	[comision] [decimal](14, 2) NOT NULL,
	[poriva] [decimal](10, 2) NOT NULL,
	[porimp] [decimal](10, 2) NOT NULL,
	[factor] [decimal](10, 0) NOT NULL,
	[timbre] [decimal](14, 0) NOT NULL,
	[cuecomi] [nvarchar](10) NOT NULL,
	[cueiva] [nvarchar](10) NOT NULL,
	[cueimp] [nvarchar](10) NOT NULL,
	[cueotros] [nvarchar](10) NOT NULL,
	[tipimp] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_tes_impuestos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codimp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tmo_Repeats')
begin 
CREATE TABLE [dbo].[tmo_Repeats](
	[codtran] [nvarchar](2) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[consec] [nvarchar](16) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[Row] [uniqueidentifier] NULL
) ON [PRIMARY]
end
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tmp_Repeats')
begin
CREATE TABLE [dbo].[tmp_Repeats](
	[codtran] [nvarchar](2) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[consec] [nvarchar](16) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[Row] [uniqueidentifier] NULL
) ON [PRIMARY]
end
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='touch_imagenes')
begin 
CREATE TABLE [dbo].[touch_imagenes](
	[imagen] [nvarchar](max) NOT NULL,
	[ruta] [nvarchar](15) NOT NULL,
	[tipo] [nvarchar](20) NOT NULL,
	[ajuste] [bit] NOT NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_busruta')
begin 
CREATE TABLE [dbo].[tra_busruta](
	[nitter] [nvarchar](10) NULL,
	[grupo] [nvarchar](2) NULL,
	[ruta] [nvarchar](2) NULL,
	[domingo] [bit] NOT NULL,
	[subgrupo] [bit] NOT NULL,
	[ubicacion] [bit] NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_carpagos')
begin 
CREATE TABLE [dbo].[tra_carpagos](
	[numcon] [nvarchar](10) NULL,
	[codcon] [nvarchar](3) NULL,
	[valcon] [decimal](12, 2) NULL,
	[nserie] [nvarchar](10) NULL,
	[ncuota] [decimal](10, 0) NULL,
	[contab] [bit] NOT NULL,
	[expok] [bit] NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_cartera')
begin 
CREATE TABLE [dbo].[tra_cartera](
	[nserie] [nvarchar](10) NULL,
	[nitter] [nvarchar](15) NULL,
	[fecha_ptmo] [datetime] NULL,
	[fecha_ini] [datetime] NULL,
	[vr_ptmo] [decimal](14, 0) NULL,
	[salpre] [decimal](14, 0) NULL,
	[num_cuota] [decimal](10, 0) NULL,
	[codi_tran] [nvarchar](3) NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[valcuota] [decimal](14, 0) NULL,
	[porint] [decimal](10, 2) NULL,
	[codplaca] [nvarchar](15) NULL,
	[nserie_rel] [nvarchar](10) NULL,
	[observa] [nvarchar](max) NULL,
	[codtran] [nvarchar](3) NULL,
	[numpla] [nvarchar](10) NULL,
	[codcue] [nvarchar](8) NULL,
	[prioridad] [decimal](2, 0) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_conceptos')
begin 
CREATE TABLE [dbo].[tra_conceptos](
	[codcon] [nvarchar](3) NULL,
	[nomcon] [nvarchar](50) NULL,
	[codgru] [nvarchar](2) NULL,
	[ctacon] [nvarchar](10) NULL,
	[ingreso] [bit] NOT NULL,
	[liquida] [bit] NOT NULL,
	[tipcon] [decimal](1, 0) NULL,
	[clacon] [bit] NOT NULL,
	[valcon] [decimal](14, 0) NULL,
	[obliga] [bit] NOT NULL,
	[porint] [decimal](6, 2) NULL,
	[excluy] [bit] NOT NULL,
	[ctacond] [nvarchar](10) NULL,
	[nitc] [decimal](1, 0) NULL,
	[nitd] [decimal](1, 0) NULL,
	[prioridad] [decimal](2, 0) NULL,
	[liquicredito] [bit] NOT NULL,
	[codtran] [nvarchar](2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_control')
begin 
CREATE TABLE [dbo].[tra_control](
	[nitter] [nvarchar](15) NULL,
	[fecha] [datetime] NULL,
	[ok] [bit] NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_desvincula')
begin 
CREATE TABLE [dbo].[tra_desvincula](
		[numero] [nvarchar](8) NULL,
	[nitter] [nvarchar](15) NULL,
	[inicio] [datetime] NULL,
	[fin] [datetime] NULL,
	[fecha] [datetime] NULL,
	[estado] [bit] NOT NULL,
	[usuario] [nvarchar](8) NULL,
	[observa] [nvarchar](200) NULL,
	[codplaca] [nvarchar](15) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_detacartera')
begin 
CREATE TABLE [dbo].[tra_detacartera](
	[nserie] [nvarchar](10) NULL,
	[nitter] [nvarchar](10) NULL,
	[feccuo] [datetime] NULL,
	[valcuo] [decimal](14, 0) NULL,
	[abocuo] [decimal](14, 0) NULL,
	[nomcuo] [nvarchar](50) NULL,
	[ncuota] [decimal](10, 0) NULL,
	[plazo] [decimal](10, 0) NULL,
	[porcen] [decimal](6, 2) NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[estado] [bit] NOT NULL,
	[codplaca] [nvarchar](15) NULL,
	[interes] [decimal](12, 2) NULL,
	[capital] [decimal](14, 2) NULL,
	[codtran] [nvarchar](3) NULL,
	[coditran] [nvarchar](2) NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_detplanilla')
begin 
CREATE TABLE [dbo].[tra_detplanilla](
	[numcon] [nvarchar](10) NULL,
	[fecha] [datetime] NULL,
	[codcon] [nvarchar](3) NULL,
	[valcon] [decimal](14, 0) NULL,
	[nitter] [nvarchar](15) NULL,
	[abono] [decimal](14, 0) NULL,
	[total] [decimal](14, 0) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_detrecaudo')
begin 
CREATE TABLE [dbo].[tra_detrecaudo](
	[nitter] [nvarchar](15) NULL,
	[valor] [decimal](12, 2) NULL,
	[fecha] [datetime] NULL,
	[numero] [nvarchar](10) NULL,
	[codcen] [nvarchar](3) NULL,
	[mes] [decimal](2, 0) NULL,
	[ano] [decimal](4, 0) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_factores')
begin 
CREATE TABLE [dbo].[tra_factores](
	[interes] [decimal](20, 10) NULL,
	[plazo] [decimal](2, 0) NULL,
	[factor] [decimal](20, 10) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_grupos')
begin 
CREATE TABLE [dbo].[tra_grupos](
	[codgru] [nvarchar](2) NULL,
	[nomgru] [nvarchar](40) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_grurutas')
begin 
CREATE TABLE [dbo].[tra_grurutas](
	[codigo] [nvarchar](2) NULL,
	[nombre] [nvarchar](50) NULL,
	[domingo] [decimal](1, 0) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_liquidacion')
begin 
CREATE TABLE [dbo].[tra_liquidacion](
	[año] [decimal](4, 0) NULL,
	[mes] [decimal](2, 0) NULL,
	[recaudo] [bit] NOT NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_liquidacion_cxc')
begin 
CREATE TABLE [dbo].[tra_liquidacion_cxc](
	[año] [decimal](4, 0) NULL,
	[mes] [decimal](2, 0) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_nomtransac')
begin 
CREATE TABLE [dbo].[tra_nomtransac](
		[codtran] [nvarchar](3) NULL,
	[nomtran] [nvarchar](50) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_parametros')
begin 
CREATE TABLE [dbo].[tra_parametros](
	[numdes] [decimal](10, 0) NULL,
	[codapt] [nvarchar](3) NULL,
	[codadm] [nvarchar](3) NULL,
	[vraporte] [decimal](14, 2) NULL,
	[codcre] [nvarchar](3) NULL,
	[numpla] [decimal](10, 0) NULL,
	[ctaaho] [nvarchar](10) NULL,
	[numcon] [decimal](8, 0) NULL,
	[numdesv] [decimal](10, 0) NULL,
	[tipcon] [decimal](1, 0) NULL,
	[ctace] [nvarchar](10) NULL,
	[ctacs] [nvarchar](10) NULL,
	[coditra] [nvarchar](3) NULL,
	[nitcxc] [nvarchar](15) NULL,
	[ctacxc] [nvarchar](10) NULL,
	[contref] [bit] NOT NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_patron')
begin 
CREATE TABLE [dbo].[tra_patron](
	[consec] [decimal](10, 0) NULL,
	[nitter] [nvarchar](15) NULL,
	[fecini] [datetime] NULL,
	[codpro] [nvarchar](15) NULL,
	[valor] [decimal](14, 2) NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[fecfin] [datetime] NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_planilla')
begin 
CREATE TABLE [dbo].[tra_planilla](
		[numcon] [nvarchar](10) NULL,
	[fecha] [datetime] NULL,
	[nitter] [nvarchar](15) NULL,
	[valtot] [decimal](14, 0) NULL,
	[valing] [decimal](14, 0) NULL,
	[valobl] [decimal](14, 0) NULL,
	[ahorro] [bit] NOT NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[fecpla] [datetime] NULL,
	[planilla] [bit] NOT NULL,
	[valaho] [decimal](14, 0) NULL,
	[planro] [decimal](8, 0) NULL,
	[valaju] [decimal](14, 0) NULL,
	[estado] [nvarchar](1) NULL,
	[codplaca] [nvarchar](15) NULL,
	[valabo] [decimal](14, 0) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_ruta')
begin 
CREATE TABLE [dbo].[tra_ruta](
		[codigo] [nvarchar](2) NULL,
	[nombre] [nvarchar](50) NULL,
	[abreviatura] [nvarchar](5) NULL,
	[codgru] [nvarchar](2) NULL,
	[hora] [nvarchar](5) NULL,
	[domingos] [decimal](2, 0) NULL,
	[frecuendf] [decimal](2, 0) NULL,
	[frecuenext] [decimal](2, 0) NULL,
	[frecuenls] [decimal](2, 0) NULL,
	[horadom] [nvarchar](5) NULL,
	[horaext] [nvarchar](5) NULL,
	[nrodespa] [decimal](2, 0) NULL,
	[nrodespaex] [decimal](2, 0) NULL,
	[rutaext] [bit] NOT NULL,
	[secuencia] [decimal](2, 0) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_acumulado')
begin 
CREATE TABLE [dbo].[ven_acumulado](
	[nitter] [nvarchar](15) NULL,
	[valvta] [decimal](14, 2) NULL,
	[valdev] [decimal](14, 2) NULL,
	[valneto] [decimal](14, 2) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_asistencia')
begin 
CREATE TABLE [dbo].[ven_asistencia](
	[codven] [nvarchar](15) NULL,
	[fecha] [datetime] NULL,
	[asistencia] [bit] NOT NULL,
	[refrigerio] [bit] NOT NULL,
	[coddpto] [nvarchar](2) NULL,
	[codciu] [nvarchar](10) NULL,
	[hora] [nvarchar](5) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_bonos')
begin 
CREATE TABLE [dbo].[ven_bonos](
	[idemp] [nvarchar](3) NULL,
	[codbono] [nvarchar](2) NULL,
	[nombono] [nvarchar](40) NULL,
	[aplica] [decimal](1, 0) NULL,
	[tabla] [decimal](2, 0) NULL,
	[campo] [nvarchar](10) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_cajas')
begin 
CREATE TABLE [dbo].[ven_cajas](
	[codigo] [nvarchar](3) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ven_cajas] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_clasicli')
begin 
CREATE TABLE [dbo].[ven_clasicli](
		[codigo] [nvarchar](3) NULL,
	[nombre] [nvarchar](50) NULL,
	[rango1] [decimal](3, 0) NULL,
	[rango2] [decimal](3, 0) NULL,
	[logo] [nvarchar](max) NULL,
	[parrafo] [nvarchar](max) NULL,
	[pie] [nvarchar](max) NULL,
	[titulo] [nvarchar](60) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_clasiven')
begin 
CREATE TABLE [dbo].[ven_clasiven](
	[codigo] [nvarchar](2) NULL,
	[nombre] [nvarchar](40) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_comdetliquida')
begin 
CREATE TABLE [dbo].[ven_comdetliquida](
	[id] [int] NULL,
	[nitven] [nvarchar](12) NULL,
	[porcom] [decimal](6, 2) NULL,
	[valcom] [decimal](14, 0) NULL,
	[codcen] [nvarchar](3) NULL,
	[consec] [nvarchar](18) NULL,
	[base] [decimal](14, 2) NULL,
	[numero] [nvarchar](10) NULL,
	[qtyvta] [decimal](10, 0) NULL,
	[valanti] [decimal](14, 0) NULL,
	[valpagar] [decimal](14, 0) NULL,
	[valpromo] [decimal](14, 0) NULL,
	[valtotal] [decimal](14, 0) NULL,
	[valviatico] [decimal](14, 0) NULL,
	[ok] [bit] NOT NULL,
	[qtyasis] [decimal](10, 0) NULL,
	[qtyrefri] [decimal](10, 0) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_comibonos')
begin 
CREATE TABLE [dbo].[ven_comibonos](
	[idemp] [nvarchar](3) NOT NULL,
		[codbono] [nvarchar](2) NULL,
	[item] [decimal](2, 0) NULL,
	[rangoi] [decimal](14, 2) NULL,
	[rangof] [decimal](14, 2) NULL,
	[valcomi] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_comiplanes')
begin 
CREATE TABLE [dbo].[ven_comiplanes](
	[codven] [nvarchar](2) NULL,
	[rangoi] [decimal](14, 2) NULL,
	[rangof] [decimal](14, 2) NULL,
	[clasificacion] [decimal](1, 0) NULL,
	[tipo] [decimal](1, 0) NULL,
	[valcomision] [decimal](14, 0) NULL,
	[valtotal] [decimal](14, 0) NULL,
	[cumpli1] [decimal](14, 2) NULL,
	[cumpli2] [decimal](14, 2) NULL,
	[cumpli3] [decimal](14, 2) NULL,
	[item] [decimal](2, 0) NULL,
	[valanticipo] [decimal](14, 2) NULL,
	[viaticos] [decimal](14, 2) NULL,
	[tipo2] [decimal](1, 0) NULL,
	[bono] [decimal](14, 2) NULL,
	[comibruta] [decimal](14, 2) NULL,
	[comineta] [decimal](14, 2) NULL,
	[comirepo] [decimal](14, 2) NULL,
	[cumpli4] [decimal](14, 0) NULL,
	[promo] [decimal](14, 0) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_comisiones')
begin 
CREATE TABLE [dbo].[ven_comisiones](
		[nitven] [nvarchar](12) NULL,
	[porcom] [decimal](6, 2) NULL,
	[codven] [nvarchar](2) NULL,
	[rangof] [decimal](14, 2) NULL,
	[rangoi] [decimal](14, 2) NULL,
	[valcomision] [decimal](14, 2) NULL,
	[item] [decimal](2, 0) NULL,
	[valanticipo] [decimal](14, 2) NULL,
	[valtotal] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_comliquida')
begin 
CREATE TABLE [dbo].[ven_comliquida](
	[id] [int] NULL,
	[fecliq] [datetime] NULL,
	[valliq] [decimal](14, 0) NULL,
	[porprov] [decimal](6, 2) NULL,
	[valprov] [decimal](14, 0) NULL,
	[valdif] [decimal](10, 0) NULL,
	[valcom] [decimal](10, 0) NULL,
	[fecini] [datetime] NULL,
	[fecfin] [datetime] NULL,
	[tipo] [nvarchar](2) NULL,
	[tipo2] [nvarchar](1) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_conceptos')
begin 
CREATE TABLE [dbo].[ven_conceptos](
		[idemp] [nvarchar](3) NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[nomcon] [nvarchar](40) NOT NULL,
	[codcue] [nvarchar](12) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ven_conceptos_1] PRIMARY KEY CLUSTERED 
(
	[codcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_cotidetalle')
begin 
CREATE TABLE [dbo].[ven_cotidetalle](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[qtyart] [decimal](10, 2) NOT NULL,
	[devart] [decimal](10, 0) NOT NULL,
	[cosins] [decimal](12, 2) NOT NULL,
	[valart] [decimal](12, 2) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[desart] [decimal](6, 2) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[valdes] [decimal](12, 2) NOT NULL,
	[valdev] [decimal](12, 2) NOT NULL,
	[valtot] [decimal](12, 2) NOT NULL,
	[valaju] [float] NOT NULL,
	[descrip] [nvarchar](100) NOT NULL,
	[nitven] [nvarchar](15) NOT NULL,
	[qtyfac] [decimal](10, 0) NOT NULL,
	[valiva] [decimal](12, 2) NOT NULL,
	[piezas] [decimal](14, 2) NOT NULL,
	[tipo] [decimal](1, 0) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_cotiproducto')
begin 
CREATE TABLE [dbo].[ven_cotiproducto](
	[codcen] [nvarchar](3) NULL,
	[tipfac] [nvarchar](2) NULL,
	[numfac] [nvarchar](8) NULL,
	[codart] [nvarchar](10) NULL,
	[qtycot] [decimal](8, 1) NULL,
	[mpa] [decimal](14, 2) NULL,
	[mpl] [decimal](14, 2) NULL,
	[qtyart] [decimal](8, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_cotizacion')
begin 
CREATE TABLE [dbo].[ven_cotizacion](
[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[fecfac] [datetime] NOT NULL,
	[venfac] [datetime] NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[nitcli] [nvarchar](12) NOT NULL,
	[nitven] [nvarchar](12) NOT NULL,
	[vtafac] [decimal](12, 0) NOT NULL,
	[ivafac] [decimal](12, 0) NOT NULL,
	[otrfac] [decimal](12, 2) NOT NULL,
	[antfac] [decimal](12, 2) NOT NULL,
	[devfac] [decimal](12, 0) NOT NULL,
	[abofac] [decimal](12, 0) NOT NULL,
	[dctfac] [decimal](12, 0) NOT NULL,
	[retfac] [decimal](12, 0) NOT NULL,
	[ricfac] [decimal](12, 0) NOT NULL,
	[rivfac] [decimal](12, 0) NOT NULL,
	[netfac] [decimal](12, 0) NOT NULL,
	[cosfac] [decimal](12, 0) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[estfac] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[ajuste] [bit] NOT NULL,
	[cosaju] [float] NOT NULL,
	[contacto] [nvarchar](60) NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[codmar] [nvarchar](3) NOT NULL,
	[docrel] [nvarchar](13) NOT NULL,
	[feccierre] [datetime] NOT NULL,
	[horom] [nvarchar](8) NOT NULL,
	[kilom] [nvarchar](8) NOT NULL,
	[placa] [nvarchar](8) NOT NULL,
	[tipo] [nvarchar](2) NOT NULL,
	[tiprel] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_ven_cotizacion] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[tipfac] ASC,
	[numfac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_cuadre')
begin 
CREATE TABLE [dbo].[ven_cuadre](
		[fecha] [datetime] NULL,
	[ingant] [decimal](16, 2) NULL,
	[faltante] [decimal](16, 2) NULL,
	[sobrante] [decimal](16, 2) NULL,
	[creant] [decimal](16, 2) NULL,
	[codcen] [nvarchar](3) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_despdetalle')
begin 
CREATE TABLE [dbo].[ven_despdetalle](
	[codceno] [nvarchar](3) NULL,
	[codtran] [nvarchar](2) NULL,
	[numdesp] [nvarchar](8) NULL,
	[codart] [nvarchar](10) NULL,
	[qtyart] [decimal](14, 2) NULL,
	[valart] [decimal](14, 2) NULL,
	[ivaart] [decimal](14, 2) NULL,
	[codcend] [nvarchar](3) NULL,
	[item] [decimal](3, 0) NULL,
	[fecdesp] [datetime] NULL,
	[codusu] [nvarchar](8) NULL,
	[fecsys] [datetime] NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_detconcep')
begin 
CREATE TABLE [dbo].[ven_detconcep](
	[idemp] [nvarchar](3) NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[nomcon] [nvarchar](40) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[valcon] [decimal](14, 2) NOT NULL
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_detgruase')
begin 
CREATE TABLE [dbo].[ven_detgruase](
	[numero] [nvarchar](10) NULL,
	[nitven] [nvarchar](15) NULL,
	[qtyvta] [decimal](10, 0) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_dolares')
begin 
CREATE TABLE [dbo].[ven_dolares](
		[codcen] [nvarchar](3) NULL,
	[tipfac] [nvarchar](2) NULL,
	[numfac] [nvarchar](8) NULL,
	[codart] [nvarchar](10) NULL,
	[undart] [nvarchar](3) NULL,
	[qtyart] [decimal](10, 2) NULL,
	[devart] [decimal](10, 0) NULL,
	[cosins] [decimal](12, 2) NULL,
	[valart] [decimal](12, 2) NULL,
	[ivaart] [decimal](6, 2) NULL,
	[desart] [decimal](6, 2) NULL,
	[numcon] [nvarchar](8) NULL,
	[valdes] [decimal](12, 2) NULL,
	[valdev] [decimal](12, 2) NULL,
	[valtot] [decimal](12, 2) NULL,
	[valaju] [float] NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_dproducto')
begin 
CREATE TABLE [dbo].[ven_dproducto](
		[codcen] [nvarchar](3) NULL,
	[tipfac] [nvarchar](2) NULL,
	[numfac] [nvarchar](8) NULL,
	[codart] [nvarchar](10) NULL,
	[qtycot] [decimal](8, 1) NULL,
	[mpa] [decimal](14, 2) NULL,
	[mpl] [decimal](14, 2) NULL,
	[qtyart] [decimal](8, 2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facbonos')
begin 
CREATE TABLE [dbo].[ven_facbonos](
		[codcen] [nvarchar](3) NULL,
	[numfac] [nvarchar](8) NULL,
	[codbono] [nvarchar](2) NULL,
	[valcomision] [decimal](14, 2) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facdepre')
begin 
CREATE TABLE [dbo].[ven_facdepre](
		[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[numpre] [nvarchar](8) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[qtyart] [decimal](10, 2) NOT NULL,
	[cortesia] [bit] NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[fecfac] [datetime] NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[nitven] [nvarchar](15) NOT NULL,
	[estco] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facdescuentos')
begin 
CREATE TABLE [dbo].[ven_facdescuentos](
	[idemp] [nvarchar](3) NULL,
	[coddes] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[base] [decimal](14, 2) NOT NULL,
	[pordes] [decimal](6, 2) NOT NULL,
	[valdes] [decimal](14, 2) NOT NULL,
	[tipdes] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facdetalle')
begin 
CREATE TABLE [dbo].[ven_facdetalle](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[qtyart] [decimal](10, 2) NOT NULL,
	[devart] [decimal](10, 3) NOT NULL,
	[cosins] [decimal](12, 2) NOT NULL,
	[valart] [decimal](12, 2) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[desart] [decimal](6, 2) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[valdes] [decimal](12, 2) NOT NULL,
	[valdev] [decimal](12, 2) NOT NULL,
	[valtot] [decimal](12, 2) NOT NULL,
	[valaju] [float] NOT NULL,
	[descrip] [nvarchar](max) NOT NULL,
	[docrel] [nvarchar](13) NOT NULL,
	[titulo] [nvarchar](200) NOT NULL,
	[valiva] [decimal](12, 2) NOT NULL,
	[piezas] [decimal](10, 0) NOT NULL,
	[valdolar] [decimal](14, 2) NOT NULL,
	[qtyvol] [decimal](14, 2) NOT NULL,
	[qtylibra] [decimal](14, 2) NOT NULL,
	[vrlibra] [decimal](14, 2) NOT NULL,
	[vrvol] [decimal](14, 2) NOT NULL,
	[wr] [nvarchar](10) NOT NULL,
	[qtyfac] [decimal](14, 2) NOT NULL,
	[porcom] [decimal](10, 2) NOT NULL,
	[comie] [decimal](14, 2) NOT NULL,
	[bono] [decimal](14, 2) NOT NULL,
	[anticipo] [decimal](14, 2) NOT NULL,
	[comision] [decimal](14, 2) NOT NULL,
	[equipo] [bit] NOT NULL,
	[item] [decimal](2, 0) NOT NULL,
	[obsequio] [bit] NOT NULL,
	[promo] [bit] NOT NULL,
	[qtyobsequi] [decimal](14, 2) NOT NULL,
	[serial] [nvarchar](20) NOT NULL,
	[simcard] [bit] NOT NULL,
	[bpromo] [decimal](14, 0) NOT NULL,
	[bviatico] [decimal](14, 0) NOT NULL,
	[aplcomi] [bit] NOT NULL,
	[valimpo] [decimal](14, 2) NOT NULL,
	[porimpo] [numeric](6, 2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)  
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facdetremi')
begin 
CREATE TABLE [dbo].[ven_facdetremi](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[qtyart] [decimal](12, 0) NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facturas')
begin 
CREATE TABLE [dbo].[ven_facturas](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[orden] [nvarchar](20) NOT NULL,
	[fecfac] [date] NOT NULL,
	[venfac] [date] NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[nitven] [nvarchar](15) NOT NULL,
	[vtafac] [decimal](12, 0) NOT NULL,
	[ivafac] [decimal](12, 0) NOT NULL,
	[otrfac] [decimal](12, 2) NOT NULL,
	[cuofac] [decimal](12, 0) NOT NULL,
	[ajpfac] [decimal](12, 2) NOT NULL,
	[antfac] [decimal](12, 2) NOT NULL,
	[devfac] [decimal](12, 0) NOT NULL,
	[abofac] [decimal](12, 0) NOT NULL,
	[dctfac] [decimal](12, 0) NOT NULL,
	[retfac] [decimal](12, 0) NOT NULL,
	[ricfac] [decimal](12, 0) NOT NULL,
	[rivfac] [decimal](12, 0) NOT NULL,
	[netfac] [decimal](12, 0) NOT NULL,
	[cosfac] [decimal](12, 0) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[estfac] [nvarchar](1) NOT NULL,
	[entrega] [decimal](14, 2) NOT NULL,
	[cambio] [decimal](14, 2) NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[ajuste] [bit] NOT NULL,
	[inifac] [date] NOT NULL,
	[cosaju] [float] NOT NULL,
	[pendiente] [bit] NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
	[estret] [nvarchar](1) NOT NULL,
	[plaza] [nvarchar](40) NOT NULL,
	[tipoventa] [nvarchar](10) NOT NULL,
	[valini] [decimal](14, 2) NOT NULL,
	[saldocli] [decimal](12, 2) NOT NULL,
	[docrel] [nvarchar](13) NOT NULL,
	[codturno] [decimal](10, 0) NOT NULL,
	[placa] [nvarchar](6) NOT NULL,
	[valadmon] [decimal](14, 2) NOT NULL,
	[valimprev] [decimal](14, 2) NOT NULL,
	[valutil] [decimal](14, 2) NOT NULL,
	[tipo] [nvarchar](4) NOT NULL,
	[trm] [decimal](14, 2) NOT NULL,
	[cuoini] [decimal](10, 2) NOT NULL,
	[lnentrega] [decimal](10, 0) NOT NULL,
	[lnvueltas] [decimal](10, 0) NOT NULL,
	[vuelo] [decimal](10, 0) NOT NULL,
	[porflete] [decimal](14, 2) NOT NULL,
	[porvol] [decimal](14, 2) NOT NULL,
	[valdolar] [decimal](14, 2) NOT NULL,
	[propina] [decimal](14, 2) NOT NULL,
	[despacho] [nvarchar](8) NOT NULL,
	[cendespach] [nvarchar](3) NOT NULL,
	[admon] [decimal](14, 2) NOT NULL,
	[intmora] [decimal](14, 2) NOT NULL,
	[cuotaext] [decimal](14, 2) NOT NULL,
	[transporte] [decimal](14, 2) NOT NULL,
	[arancel] [decimal](14, 2) NOT NULL,
	[impfac] [decimal](14, 2) NOT NULL,
	[comie] [decimal](14, 2) NOT NULL,
	[contrato] [nvarchar](10) NOT NULL,
	[valflete] [decimal](14, 2) NOT NULL,
	[confirmada] [bit] NOT NULL,
	[anticipo] [decimal](14, 2) NOT NULL,
	[comision] [decimal](14, 2) NOT NULL,
	[totbono] [decimal](14, 2) NOT NULL,
	[devretfac] [decimal](14, 2) NOT NULL,
	[devricfac] [decimal](14, 2) NOT NULL,
	[devrivfac] [decimal](14, 2) NOT NULL,
	[bpromo] [decimal](14, 0) NOT NULL,
	[bviatico] [decimal](14, 0) NOT NULL,
	[qtyper] [decimal](3, 0) NOT NULL,
	[domicilio] [bit] NOT NULL,
	[adultos] [decimal](10, 0) NOT NULL,
	[ninos] [decimal](10, 0) NOT NULL,
	[codguia] [nvarchar](15) NOT NULL,
	[impofac] [decimal](14, 2) NOT NULL,
	[crefac] [numeric](12, 2) NOT NULL,
	[devcrefac] [numeric](14, 2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ven_facturas_1] PRIMARY KEY CLUSTERED 
(
	[codcto] ASC,
	[tipfac] ASC,
	[numfac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facuopagos')
begin 
CREATE TABLE [dbo].[ven_facuopagos](
		[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[cenpag] [nvarchar](3) NOT NULL,
	[numpag] [nvarchar](8) NOT NULL,
	[numcuo] [decimal](2, 0) NOT NULL,
	[valpag] [decimal](14, 2) NOT NULL,
	[estpag] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO



IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facuota')
begin 
CREATE TABLE [dbo].[ven_facuota](
		[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[numcuo] [decimal](2, 0) NOT NULL,
	[feccuo] [date] NOT NULL,
	[porcuo] [decimal](5, 2) NOT NULL,
	[valcuo] [decimal](14, 2) NOT NULL,
	[estcuo] [nvarchar](1) NOT NULL,
	[capital] [decimal](14, 2) NOT NULL,
	[interes] [decimal](14, 2) NOT NULL,
	[valorig] [decimal](14, 2) NOT NULL,
	[vcto] [date] NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_formapago')
begin 
CREATE TABLE [dbo].[ven_formapago](
	[idemp] [nvarchar](3) NULL,
	[codfor] [nvarchar](2) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[nomfor] [nvarchar](20) NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[porcom] [decimal](6, 2) NOT NULL,
	[editcom] [bit] NOT NULL,
	[pagsys] [bit] NOT NULL,
	[rtefte] [decimal](10, 2) NOT NULL,
	[rteica] [decimal](10, 2) NOT NULL,
	[tarjeta] [bit] NOT NULL,
	[cuecom] [nvarchar](8) NOT NULL,
	[cuerfte] [nvarchar](8) NOT NULL,
	[cuerica] [nvarchar](8) NOT NULL,
	[cueriva] [nvarchar](8) NOT NULL,
	[efectivo] [bit] NOT NULL,
	[nitbco] [nvarchar](15) NOT NULL,
	[rtecom] [decimal](10, 3) NOT NULL,
	[rteiva] [decimal](10, 2) NOT NULL,
	[tipo] [nvarchar](20) NOT NULL,
	[poradic] [decimal](6, 2) NOT NULL,
	[ctacom] [nvarchar](8) NOT NULL,
	[saldo] [bit] NOT NULL,
	[cheque] [bit] NOT NULL,
	[pagoxcen] [bit] NOT NULL,
	[especial] [bit] NOT NULL,
	[detallar] [bit] NOT NULL,
	[listprecio] [nvarchar](6) NOT NULL,
	[Bloxperfil] [bit] NOT NULL,
	[rautoriza] [bit] not null
) 
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_gruasesor')
begin 
CREATE TABLE [dbo].[ven_gruasesor](
	[numero] [nvarchar](10) NULL,
	[fecini] [datetime] NULL,
	[fecfin] [datetime] NULL,
	[estado] [nvarchar](1) NULL,
	[qtytotal] [decimal](10, 0) NULL,
	[codusu] [nvarchar](10) NULL,
	[fecsys] [datetime] NULL,
	[bono] [bit] NOT NULL,
	[tipo] [decimal](1, 0) NULL,
	[dias] [decimal](2, 0) NULL,
	[qtyase] [decimal](5, 0) NULL,
	[region] [decimal](1, 0) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_grupocli')
begin 
CREATE TABLE [dbo].[ven_grupocli](
		[nitcli] [nvarchar](15) NULL,
	[nitsoc] [nvarchar](15) NULL,
	[activo] [bit] NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_grupos')
begin 
CREATE TABLE [dbo].[ven_grupos](
		[codgru] [nvarchar](3) NULL,
	[nomgru] [nvarchar](30) NULL,
	[porgru] [decimal](6, 2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_lineas')
begin 
CREATE TABLE [dbo].[ven_lineas](
	[codlin] [nvarchar](3) NULL,
	[nomlin] [nvarchar](50) NULL,
	[codmar] [nvarchar](2) NULL
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_liquidxven')
begin 
CREATE TABLE [dbo].[ven_liquidxven](
	[id] [nvarchar](10) NULL,
	[fecliq] [datetime] NULL,
	[fecini] [datetime] NULL,
	[fecfin] [datetime] NULL,
	[nitven] [nvarchar](15) NULL,
	[consec] [nvarchar](16) NULL,
	[valanti] [decimal](14, 2) NULL,
	[valtotal] [decimal](14, 2) NULL,
	[valpagar] [decimal](14, 2) NULL,
	[qtyvta] [decimal](14, 2) NULL,
	[valpromo] [decimal](14, 2) NULL,
	[valviatico] [decimal](14, 2) NULL,
	[qtyasis] [decimal](14, 0) NULL,
	[qtyrefri] [decimal](14, 0) NULL,
	[tipo] [nvarchar](2) NULL,
	[tipo2] [nvarchar](1) NULL,
	[id2] [nvarchar](10) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_marcas')
begin 
CREATE TABLE [dbo].[ven_marcas](
	[codmar] [nvarchar](2) NULL,
	[nommar] [nvarchar](50) NULL
)
end 
GO



IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_mesas')
begin 
CREATE TABLE [dbo].[ven_mesas](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[mesa] [nvarchar](10) NOT NULL,
	[ubica] [nvarchar](10) NOT NULL,
	[iconfile] [nvarchar](max) NOT NULL,
	[meseroid] [nvarchar](10) NOT NULL,
	[mesero] [nvarchar](50) NOT NULL,
	[prefijo] [nvarchar](3) NOT NULL,
	[ubicaimg] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[domicilio] [bit] NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[vlrdomi] [decimal](14, 0) NOT NULL,
	[qtyper] [decimal](3, 0) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[ocupada] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ven_mesas_1] PRIMARY KEY CLUSTERED 
(
	[codcto] ASC,
	[mesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_movcli')
begin 
CREATE TABLE [dbo].[ven_movcli](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[docven] [nvarchar](8) NOT NULL,
	[tipdoc] [nvarchar](2) NOT NULL,
	[fecven] [date] NOT NULL,
	[afecen] [nvarchar](3) NOT NULL,
	[afetip] [nvarchar](2) NOT NULL,
	[afedoc] [nvarchar](8) NOT NULL,
	[debven] [decimal](14, 2) NOT NULL,
	[creven] [decimal](14, 2) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[estmov] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_notas')
begin 
CREATE TABLE [dbo].[ven_notas](
		[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipnot] [nvarchar](2) NOT NULL,
	[numnot] [nvarchar](8) NOT NULL,
	[afecen] [nvarchar](3) NOT NULL,
	[afetip] [nvarchar](2) NOT NULL,
	[afedoc] [nvarchar](8) NOT NULL,
	[fecnot] [date] NOT NULL,
	[valnot] [decimal](14, 2) NOT NULL,
	[valiva] [decimal](14, 2) NOT NULL,
	[concepto] [nvarchar](230) NOT NULL,
	[devcli] [bit] NOT NULL,
	[observa] [nvarchar](200) NOT NULL,
	[codturno] [decimal](10, 0) NOT NULL,
	[estfac] [nvarchar](1) NOT NULL,
	[despacho] [nvarchar](8) NOT NULL,
	[cendespacho] [nvarchar](3) NOT NULL,
	[impnota] [decimal](14, 2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_olegraph')
begin 
CREATE TABLE [dbo].[ven_olegraph](
	[nomfor] [nvarchar](20) NULL,
	[codgraph] [int] NULL,
	[olegraph] [image] NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_ordcobro')
begin 
CREATE TABLE [dbo].[ven_ordcobro](
	[codcen] [nvarchar](3) NULL,
	[codord] [nvarchar](8) NULL,
	[nitemp] [nvarchar](12) NULL,
	[fecord] [datetime] NULL,
	[valord] [decimal](10, 0) NULL,
	[ivaord] [decimal](10, 0) NULL,
	[netord] [decimal](10, 0) NULL,
	[estord] [nvarchar](1) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_ordcobrodetalle')
begin 
CREATE TABLE [dbo].[ven_ordcobrodetalle](
	[codcen] [nvarchar](3) NULL,
	[codord] [nvarchar](8) NULL,
	[numpre] [nvarchar](8) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_organigrupo')
begin 
CREATE TABLE [dbo].[ven_organigrupo](
		[nitven] [nvarchar](15) NULL,
	[nitdis] [nvarchar](15) NULL,
	[nitlid] [nvarchar](15) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pagbonos')
begin 
CREATE TABLE [dbo].[ven_pagbonos](
	[idemp] [nvarchar](3) NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[nom_forma] [nvarchar](60) NOT NULL,
	[cantidad] [decimal](14, 2) NOT NULL,
	[fecha] [datetime] NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pagconceptos')
begin 
CREATE TABLE [dbo].[ven_pagconceptos](
	[tipdoc] [nvarchar](2) NULL,
	[codcto] [nvarchar](3) NULL,
	[numrec] [nvarchar](8) NULL,
	[clarec] [nvarchar](1) NULL,
	[codcon] [nvarchar](2) NULL,
	[numdoc] [nvarchar](8) NULL,
	[valpag] [decimal](14, 2) NULL,
	[codusu] [nvarchar](8) NULL,
	[fecsys] [datetime] NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pagdescuentos')
begin 
CREATE TABLE [dbo].[ven_pagdescuentos](
		[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[coddes] [nvarchar](3) NOT NULL,
	[pordes] [decimal](6, 2) NOT NULL,
	[valdes] [decimal](14, 2) NOT NULL,
	[tipdes] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pagdetalle')
begin 
CREATE TABLE [dbo].[ven_pagdetalle](
[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[forpag] [nvarchar](2) NOT NULL,
	[valpag] [decimal](14, 2) NOT NULL,
	[codban] [nvarchar](10) NOT NULL,
	[afedoc] [nvarchar](15) NOT NULL,
	[feccheq] [date] NOT NULL,
	[estcheq] [nvarchar](1) NOT NULL,
	[vrrtecom] [decimal](12, 3) NOT NULL,
	[vrrtefte] [decimal](12, 3) NOT NULL,
	[vrrteica] [decimal](12, 3) NOT NULL,
	[vrrteiva] [decimal](12, 3) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[turno] [decimal](10, 0) NOT NULL,
	[valpropina] [decimal](10, 0) NOT NULL,
	[numrec] [nvarchar](6) NOT NULL,
	[consig] [nvarchar](21) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pagos')
begin 
CREATE TABLE [dbo].[ven_pagos](
[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[clapag] [nvarchar](1) NOT NULL,
	[fecpag] [date] NOT NULL,
	[nitcli] [nvarchar](12) NOT NULL,
	[pagval] [decimal](14, 2) NOT NULL,
	[netpag] [decimal](14, 2) NOT NULL,
	[estpag] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[detalle] [nvarchar](90) NOT NULL,
	[cobrador] [nvarchar](60) NOT NULL,
	[cambio] [decimal](12, 2) NOT NULL,
	[recibo] [decimal](12, 2) NOT NULL,
	[porcom] [decimal](6, 2) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_parametros')
begin 
CREATE TABLE [dbo].[ven_parametros](
[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[comini] [decimal](8, 0) NOT NULL,
	[comfinal] [decimal](8, 0) NOT NULL,
	[codprop] [nvarchar](10) NOT NULL,
	[codser] [nvarchar](10) NOT NULL,
	[servidor] [nvarchar](50) NOT NULL,
	[bandeja] [nvarchar](50) NOT NULL,
	[desctira] [decimal](14, 2) NOT NULL,
	[valcuota] [decimal](14, 0) NOT NULL,
	[codcuota] [nvarchar](10) NOT NULL,
	[comanda] [bit] NOT NULL,
	[impcocina] [bit] NOT NULL,
	[cajon] [decimal](1, 0) NOT NULL,
	[formato] [decimal](1, 0) NOT NULL,
	[inventa] [bit] NOT NULL,
	[totimpuesto] [decimal](1, 0) NOT NULL,
	[turno] [decimal](12, 0) NOT NULL,
	[tipconse] [decimal](1, 0) NOT NULL,
	[abono] [bit] NOT NULL,
	[ajpeso] [bit] NOT NULL,
	[lineamod] [nvarchar](4) NOT NULL,
	[prtefte] [decimal](8, 3) NOT NULL,
	[prteica] [decimal](8, 3) NOT NULL,
	[prteiva] [decimal](8, 3) NOT NULL,
	[tdisplay] [bit] NOT NULL,
	[impgen] [bit] NOT NULL,
	[rutimpcocina] [nvarchar](100) NOT NULL,
	[ctafalta] [nvarchar](8) NOT NULL,
	[ctapue] [nvarchar](8) NOT NULL,
	[ctasobra] [nvarchar](8) NOT NULL,
	[impcorte] [bit] NOT NULL,
	[numaper] [decimal](10, 0) NOT NULL,
	[porinteres] [decimal](10, 2) NOT NULL,
	[serialpc] [nvarchar](10) NOT NULL,
	[repart] [bit] NOT NULL,
	[utlart] [bit] NOT NULL,
	[devinv] [bit] NOT NULL,
	[propina] [decimal](3, 0) NOT NULL,
	[repref] [bit] NOT NULL,
	[opcaja] [bit] NOT NULL,
	[forpazysal] [nvarchar](20) NOT NULL,
	[disiva] [bit] NOT NULL,
	[contabven] [bit] NOT NULL,
	[remipre] [bit] NOT NULL,
	[clase] [decimal](1, 0) NOT NULL,
	[ctatras] [nvarchar](8) NOT NULL,
	[otrgas] [bit] NOT NULL,
	[ctaotr] [nvarchar](8) NOT NULL,
	[codturn] [decimal](10, 0) NOT NULL,
	[impfis] [bit] NOT NULL,
	[ptadmon] [decimal](8, 2) NOT NULL,
	[ptimprevisto] [decimal](8, 2) NOT NULL,
	[ptutilidad] [decimal](8, 2) NOT NULL,
	[imprc] [bit] NOT NULL,
	[topenotas] [decimal](14, 2) NOT NULL,
	[cvtope] [nvarchar](40) NOT NULL,
	[utilprecio] [bit] NOT NULL,
	[devpedido] [bit] NOT NULL,
	[decimales] [decimal](1, 0) NOT NULL,
	[focus] [bit] NOT NULL,
	[porutil] [decimal](6, 2) NOT NULL,
	[diasvencidos] [bit] NOT NULL,
	[calcprecio] [bit] NOT NULL,
	[poriva] [decimal](10, 2) NOT NULL,
	[nodigprecio] [bit] NOT NULL,
	[horaentam] [nvarchar](5) NOT NULL,
	[horasalam] [nvarchar](5) NOT NULL,
	[horaenrpm] [nvarchar](5) NOT NULL,
	[horasalpm] [nvarchar](5) NOT NULL,
	[intervalo] [decimal](2, 0) NOT NULL,
	[deshabilitadcto] [bit] NOT NULL,
	[validakardex] [bit] NOT NULL,
	[porflete] [decimal](14, 2) NOT NULL,
	[porvol] [decimal](14, 2) NOT NULL,
	[validafecanula] [bit] NOT NULL,
	[editclicoti] [bit] NOT NULL,
	[noitemcoti] [bit] NOT NULL,
	[dctomax] [bit] NOT NULL,
	[dctomaxfac] [decimal](10, 2) NOT NULL,
	[numcopias] [nvarchar](1) NOT NULL,
	[nopropina] [bit] NOT NULL,
	[proprefac] [bit] NOT NULL,
	[blocosto] [bit] NOT NULL,
	[costocortesia] [bit] NOT NULL,
	[fectouch] [bit] NOT NULL,
	[retenfac] [decimal](1, 0) NOT NULL,
	[prefactura] [bit] NOT NULL,
	[pagocentro] [bit] NOT NULL,
	[desactpropina] [bit] NOT NULL,
	[desactingre] [bit] NOT NULL,
	[contabvta] [bit] NOT NULL,
	[ctoegreso] [bit] NOT NULL,
	[ctacajaegreso] [bit] NOT NULL,
	[retarjetouch] [bit] NOT NULL,
	[centrosinv] [bit] NOT NULL,
	[editprecios] [bit] NOT NULL,
	[passprecios] [bit] NOT NULL,
	[transvta] [nvarchar](2) NOT NULL,
	[nitpro] [nvarchar](15) NOT NULL,
	[transcomp] [nvarchar](2) NOT NULL,
	[impgen2] [bit] NOT NULL,
	[transdespacho] [nvarchar](2) NOT NULL,
	[transdevol] [nvarchar](2) NOT NULL,
	[roundprecio] [bit] NOT NULL,
	[invfcodbar] [bit] NOT NULL,
	[valpie] [decimal](14, 2) NOT NULL,
	[pagoxcen] [bit] NOT NULL,
	[transdevolp] [nvarchar](2) NOT NULL,
	[feckardex] [bit] NOT NULL,
	[fecsys] [bit] NOT NULL,
	[nnccxc] [bit] NOT NULL,
	[porvta] [decimal](10, 2) NOT NULL,
	[vlrdia] [decimal](14, 2) NOT NULL,
	[fecsysinv] [bit] NOT NULL,
	[pormerienda] [decimal](14, 2) NOT NULL,
	[ctaanulacion] [bit] NOT NULL,
	[impqty] [bit] NOT NULL,
	[noactart] [bit] NOT NULL,
	[retetarjetas] [bit] NOT NULL,
	[filtrocentro] [bit] NOT NULL,
	[invfac] [bit] NOT NULL,
	[actremision] [bit] NOT NULL,
	[factparcial] [bit] NOT NULL,
	[centroegre] [bit] NOT NULL,
	[facosto] [bit] NOT NULL,
	[invserial] [bit] NOT NULL,
	[modiva] [bit] NOT NULL,
	[cierreusu] [bit] NOT NULL,
	[ingserial] [bit] NOT NULL,
	[refactc] [bit] NOT NULL,
	[imppdf] [bit] NOT NULL,
	[invserialent] [bit] NOT NULL,
	[invserialsal] [bit] NOT NULL,
	[invserialtras] [bit] NOT NULL,
	[passcomi] [decimal](10, 0) NOT NULL,
	[codalim] [nvarchar](10) NOT NULL,
	[gridalim] [bit] NOT NULL,
	[stickersis] [bit] NOT NULL,
	[ingdcto] [bit] NOT NULL,
	[propres] [bit] NOT NULL,
	[codconrc] [nvarchar](2) NOT NULL,
	[codconrckit] [nvarchar](2) NOT NULL,
	[codtraneg] [nvarchar](2) NOT NULL,
	[codtranrc] [nvarchar](2) NOT NULL,
	[valab] [decimal](14, 2) NOT NULL,
	[valbonoguia] [decimal](14, 2) NOT NULL,
	[valmx] [decimal](14, 2) NOT NULL,
	[dctopor] [bit] NOT NULL,
	[dignroperso] [bit] NOT NULL,
	[qtybonom] [decimal](2, 0) NOT NULL,
	[cambio] [bit] NOT NULL,
	[nitvtactdo] [nvarchar](15) NOT NULL,
	[dctoiva] [bit] NOT NULL,
	[codartayu] [bit] NOT NULL,
	[qtymayor0] [bit] NOT NULL,
	[columitem] [bit] NOT NULL,
	[pminvta] [bit] NOT NULL,
	[relafpyce] [bit] NOT NULL,
	[cotiref] [bit] NOT NULL,
	[fecsysco] [bit] NOT NULL,
	[ctainvtran] [bit] NOT NULL,
	[eliminaitem] [bit] NOT NULL,
	[inftotvta] [bit] NOT NULL,
	[inftotforp] [bit] NOT NULL,
	[infforpdet] [bit] NOT NULL,
	[infhora] [bit] NOT NULL,
	[infubica] [bit] NOT NULL,
	[inftotprod] [bit] NOT NULL,
	[infdiaria] [bit] NOT NULL,
	[infprdtran] [bit] NOT NULL,
	[valimp] [decimal](1, 0) NOT NULL,
	[actimp] [bit] NOT NULL,
	[infhorares] [bit] NOT NULL,
	[noagruitem] [bit] NOT NULL,
	[vlruniremi] [nvarchar](10) NOT NULL,
	[modvalcoti] [bit] NOT NULL,
	[modrefe] [bit] NOT NULL,
	[propina2] [decimal](3, 0) NOT NULL,
	[plazo] [decimal](3, 0) NOT NULL,
	[filtronom] [bit] NOT NULL,
	[porfact] [decimal](12, 5) NOT NULL,
	[decimalvlr] [numeric](1, 0) NOT NULL,
	[diasvalfec] [numeric](2, 0) NOT NULL,
	[redvalprom] [bit] NOT NULL,
	[vlrxpago] [bit] NOT NULL,
	[rifa] [bit] NOT NULL,
	[valtrasinv] [bit] NOT NULL,
	[repitem] [bit] NOT NULL,
	[modinv] [bit] NOT NULL,
	[valmedele] [bit] NOT NULL,
	[infoxusu] [bit] NOT NULL,
	[valtipegr] [bit] NOT NULL,
	[fijarund] [bit] NOT NULL,
	[valmesa] [bit] NOT NULL,
	[limitemfac] [bit] NOT NULL,
	[dismpvta] [bit] NOT NULL,
	[editnomter] [bit] NOT NULL,
	[roundfact] [bit] NOT NULL,
	[facrete] [bit] NOT NULL,
	[artxtalla] [bit] NOT NULL,
	[cfvtacont] [bit] NOT NULL,
	[restaurante] [bit] NOT NULL,
	[limtefact] [bit] NOT NULL,
	[grupoxcto] [bit] NOT NULL,
	[sumqty] [bit] NOT NULL,
	[agrudpp] [bit] NOT NULL,
	[antcxc] [bit] NOT NULL,
	[domivta] [bit] NOT NULL,
	[antxcen] [bit] NOT NULL,
	[actrete] [bit] NOT NULL,
	[actpvctras] [bit] NOT NULL,
	[porcomiprd] [bit] NOT NULL,
	[actalerta] [bit] NOT NULL,
	[artxcen] [bit] NOT NULL,
	[filserprod] [bit] NOT NULL,
	[factordser] [bit] NOT NULL,
	[fiusuxtran] [bit] NOT NULL,
	[facvlrcero] [bit] NOT NULL,
	[saldorcotr] [bit] NOT NULL,
	[vtasxfecha] [bit] NOT NULL,
	[invxfecha] [bit] NOT NULL,
	[cominicial] [numeric](8, 0) NOT NULL,
	[copiacoti] [numeric](2, 0) NOT NULL,
	[itemfac] [numeric](2, 0) NOT NULL,
	[clasiven] [numeric](1, 0) NOT NULL,
	[vlrmacfac] [numeric](14, 0) NOT NULL,
	[qtychppost] [numeric](10, 0) NOT NULL,
	[poradic] [numeric](5, 2) NOT NULL,
	[pcree] [numeric](8, 2) NOT NULL,
	[optinv] [numeric](1, 0) NOT NULL,
	[baseriva] [numeric](10, 0) NOT NULL,
	[baserica] [numeric](10, 0) NOT NULL,
	[baserfte] [numeric](10, 0) NOT NULL,
	[basercree] [numeric](10, 0) NOT NULL,
	[pvtouch] [nvarchar](6) NOT NULL,
	[detrifa] [nvarchar](200) NOT NULL,
	[infsalsp] [bit] NOT NULL,
	[textdomi] [nvarchar](max) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_parcial')
begin 
CREATE TABLE [dbo].[ven_parcial](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[consec] [nvarchar](8) NOT NULL,
	[refart] [nvarchar](15) NOT NULL,
	[nomart] [nvarchar](60) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[qtyart] [decimal](14, 2) NOT NULL,
	[valart] [decimal](14, 2) NOT NULL,
	[valtot] [decimal](14, 0) NOT NULL,
	[valdes] [decimal](14, 2) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[valiva] [decimal](14, 2) NOT NULL,
	[valprom] [decimal](14, 0) NOT NULL,
	[ctacosto] [nvarchar](8) NOT NULL,
	[ctavta] [nvarchar](8) NOT NULL,
	[ctacmp] [nvarchar](8) NOT NULL,
	[codgru] [nvarchar](2) NOT NULL,
	[caninv] [decimal](6, 0) NOT NULL,
	[tipgru] [decimal](1, 0) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[desart] [decimal](10, 2) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pdetalle')
begin 
CREATE TABLE [dbo].[ven_pdetalle](
[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[qtyart] [decimal](10, 2) NOT NULL,
	[devart] [decimal](10, 0) NOT NULL,
	[cosins] [decimal](12, 2) NOT NULL,
	[valart] [decimal](12, 2) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[desart] [decimal](6, 2) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[valdes] [decimal](12, 2) NOT NULL,
	[valdev] [decimal](12, 2) NOT NULL,
	[valtot] [decimal](12, 2) NOT NULL,
	[valaju] [float] NOT NULL,
	[descrip] [nvarchar](max) NOT NULL,
	[nitven] [nvarchar](15) NOT NULL,
	[valiva] [decimal](12, 2) NOT NULL,
	[qtyfac] [decimal](10, 2) NOT NULL,
	[piezas] [decimal](10, 2) NOT NULL,
	[comision] [decimal](14, 2) NOT NULL,
	[item] [decimal](2, 0) NOT NULL,
	[totcomision] [decimal](14, 2) NOT NULL,
	[anticipo] [decimal](14, 2) NOT NULL,
	[equipo] [bit] NOT NULL,
	[promo] [bit] NOT NULL,
	[simcard] [bit] NOT NULL,
	[titulo] [nvarchar](200) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pedicoti')
begin 
CREATE TABLE [dbo].[ven_pedicoti](
	[tipfac] [nvarchar](2) NULL,
	[numfac] [nvarchar](8) NULL,
	[codcen] [nvarchar](3) NULL,
	[numcon] [nvarchar](8) NULL,
	[codcon] [nvarchar](2) NULL,
	[codart] [nvarchar](10) NULL,
	[qtyart] [decimal](10, 2) NULL,
	[estado] [nvarchar](1) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pedidos')
begin 
CREATE TABLE [dbo].[ven_pedidos](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[fecfac] [datetime] NOT NULL,
	[venfac] [datetime] NOT NULL,
	[codcue] [nvarchar](8) NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[nitven] [nvarchar](15) NOT NULL,
	[vtafac] [decimal](12, 0) NOT NULL,
	[ivafac] [decimal](12, 0) NOT NULL,
	[otrfac] [decimal](12, 2) NOT NULL,
	[antfac] [decimal](12, 2) NOT NULL,
	[devfac] [decimal](12, 0) NOT NULL,
	[abofac] [decimal](12, 0) NOT NULL,
	[dctfac] [decimal](12, 0) NOT NULL,
	[retfac] [decimal](12, 0) NOT NULL,
	[ricfac] [decimal](12, 0) NOT NULL,
	[rivfac] [decimal](12, 0) NOT NULL,
	[netfac] [decimal](12, 0) NOT NULL,
	[cosfac] [decimal](12, 0) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[estfac] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[ajuste] [bit] NOT NULL,
	[cosaju] [float] NOT NULL,
	[contacto] [nvarchar](60) NOT NULL,
	[docrel] [nvarchar](13) NOT NULL,
	[tiprel] [nvarchar](3) NOT NULL,
	[codmar] [nvarchar](3) NOT NULL,
	[horom] [nvarchar](8) NOT NULL,
	[kilom] [nvarchar](8) NOT NULL,
	[placa] [nvarchar](8) NOT NULL,
	[feccierre] [datetime] NOT NULL,
	[tipo] [nvarchar](2) NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[comision] [decimal](14, 2) NOT NULL,
	[contrato] [nvarchar](10) NOT NULL,
	[equipo] [bit] NOT NULL,
	[simcard] [bit] NOT NULL,
	[totcomision] [decimal](14, 2) NOT NULL,
	[anticipo] [decimal](14, 2) NOT NULL,
	[ImpFac] [decimal](14, 2) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_placas')
begin 
CREATE TABLE [dbo].[ven_placas](
	[codpla] [nvarchar](10) NULL,
	[codmar] [nvarchar](2) NULL,
	[codlin] [nvarchar](3) NULL,
	[nitter] [nvarchar](15) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pladetalle')
begin 
CREATE TABLE [dbo].[ven_pladetalle](
	[codceno] [nvarchar](3) NULL,
	[codcend] [nvarchar](3) NULL,
	[codtran] [nvarchar](2) NULL,
	[numpla] [nvarchar](8) NULL,
	[item] [decimal](3, 0) NULL,
	[codart] [nvarchar](10) NULL,
	[qtydevol] [decimal](14, 2) NULL,
	[qtytras] [decimal](14, 2) NULL,
	[centra] [nvarchar](3) NULL,
	[invfis] [decimal](14, 2) NULL,
	[qtyvta] [decimal](14, 2) NULL,
	[valart] [decimal](14, 2) NULL,
	[totval] [decimal](14, 2) NULL,
	[porcom] [decimal](14, 2) NULL,
	[valcom] [decimal](14, 2) NULL,
	[ivaart] [decimal](14, 2) NULL,
	[valiva] [decimal](14, 2) NULL,
	[codusu] [nvarchar](8) NULL,
	[fecsys] [datetime] NULL,
	[caninv] [decimal](14, 2) NULL,
	[qtyent] [decimal](14, 2) NULL,
	[ucoart] [decimal](14, 2) NULL,
	[qtydevolb] [decimal](14, 2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_planes')
begin 
CREATE TABLE [dbo].[ven_planes](
	[codplan] [nvarchar](3) NULL,
	[nomplan] [nvarchar](50) NULL,
	[tipo] [decimal](1, 0) NULL,
	[codclasi] [decimal](1, 0) NULL,
	[tipomovil] [nvarchar](2) NULL,
	[clausula] [bit] NOT NULL,
	[cfm] [decimal](14, 2) NULL,
	[ivaplan] [decimal](14, 2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_planilla')
begin 
CREATE TABLE [dbo].[ven_planilla](
	[codigo] [nvarchar](10) NOT NULL,
	[caninv] [decimal](10, 2) NOT NULL,
	[qtyent] [decimal](10, 2) NOT NULL,
	[qtydevol] [decimal](10, 2) NOT NULL,
	[qtytras] [decimal](10, 2) NOT NULL,
	[promosion] [decimal](10, 2) NOT NULL,
	[qtyfisico] [decimal](10, 2) NOT NULL,
	[qtyvta] [decimal](10, 0) NOT NULL,
	[preciovta] [decimal](14, 2) NOT NULL,
	[porcomi] [decimal](2, 0) NOT NULL,
	[vlcomi] [decimal](14, 2) NOT NULL,
	[codcend] [nvarchar](3) NOT NULL,
	[codceno] [nvarchar](3) NOT NULL,
	[codusudesp] [nvarchar](10) NOT NULL,
	[codusupla] [nvarchar](10) NOT NULL,
	[detalle] [bit] NOT NULL,
	[estdesp] [nvarchar](1) NOT NULL,
	[estplan] [nvarchar](1) NOT NULL,
	[fecdoc] [datetime] NOT NULL,
	[fecsysdesp] [datetime] NOT NULL,
	[fecsyspla] [datetime] NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[observa] [nvarchar](200) NOT NULL,
	[actividad] [decimal](14, 2) NOT NULL,
	[conteocaja] [decimal](14, 2) NOT NULL,
	[desccaja] [decimal](14, 2) NOT NULL,
	[descdevol] [decimal](14, 2) NOT NULL,
	[descentrega] [decimal](14, 2) NOT NULL,
	[descinv] [decimal](14, 2) NOT NULL,
	[gastosemp] [decimal](14, 2) NOT NULL,
	[gastosprest] [decimal](14, 2) NOT NULL,
	[merienda] [decimal](14, 2) NOT NULL,
	[pagoprest] [decimal](14, 2) NOT NULL,
	[prestamo] [decimal](14, 2) NOT NULL,
	[totcaja] [decimal](14, 2) NOT NULL,
	[totdesc] [decimal](14, 2) NOT NULL,
	[totentrega] [decimal](14, 2) NOT NULL,
	[totfueracaja] [decimal](14, 2) NOT NULL,
	[totvta] [decimal](14, 2) NOT NULL,
	[vtaplanilla] [decimal](14, 2) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_planomina')
begin 
CREATE TABLE [dbo].[ven_planomina](
	[nitter] [nvarchar](15) NULL,
	[tipo] [nvarchar](1) NULL,
	[valdia] [decimal](14, 2) NULL,
	[descinv] [decimal](14, 2) NULL,
	[descent] [decimal](14, 2) NULL,
	[desccaja] [decimal](14, 2) NULL,
	[prestamo] [decimal](14, 2) NULL,
	[otros] [decimal](14, 2) NULL,
	[valtdia] [decimal](14, 2) NULL,
	[descuadre] [bit] NOT NULL,
	[codcen] [nvarchar](3) NULL,
	[numpla] [nvarchar](10) NULL,
	[codusu] [nvarchar](5) NULL,
	[fecpla] [datetime] NULL,
	[fecsys] [datetime] NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_precdetalle')
begin 
CREATE TABLE [dbo].[ven_precdetalle](
	[codtar] [nvarchar](2) NULL,
	[codart] [nvarchar](8) NULL,
	[valart] [decimal](14, 2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_precios')
begin 
CREATE TABLE [dbo].[ven_precios](
	[codtar] [nvarchar](2) NULL,
	[nomtar] [nvarchar](60) NULL,
	[codalm] [nvarchar](3) NULL,
	[ivatar] [decimal](5, 2) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_prefacdetalle')
begin 
CREATE TABLE [dbo].[ven_prefacdetalle](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numpre] [nvarchar](8) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[qtyart] [decimal](10, 2) NOT NULL,
	[devart] [decimal](10, 0) NOT NULL,
	[cosins] [decimal](12, 2) NOT NULL,
	[valart] [decimal](12, 2) NOT NULL,
	[ivaart] [decimal](6, 2) NOT NULL,
	[numcom] [decimal](8, 0) NOT NULL,
	[valaju] [float] NOT NULL,
	[numimpcocina] [nvarchar](10) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[tipfac] [nvarchar](2) NOT NULL,
	[qtyfac] [decimal](10, 2) NOT NULL,
	[item] [decimal](5, 0) NOT NULL,
	[codtiplato] [nvarchar](2) NOT NULL,
	[observa] [nvarchar](100) NOT NULL,
	[confirmada] [char](1) NOT NULL,
	[porimpo] [numeric](6, 2) NOT NULL,
	[nitvendet] [varchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_prefactura')
begin 
CREATE TABLE [dbo].[ven_prefactura](
[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numpre] [nvarchar](8) NOT NULL,
	[nitcli] [nvarchar](15) NOT NULL,
	[nitven] [nvarchar](15) NOT NULL,
	[fecpre] [date] NOT NULL,
	[ubic] [nvarchar](10) NOT NULL,
	[desart] [decimal](6, 2) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[propina] [decimal](10, 0) NOT NULL,
	[estpre] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[cortesia] [bit] NOT NULL,
	[ajuste] [bit] NOT NULL,
	[descto] [decimal](14, 2) NOT NULL,
	[valpre] [decimal](14, 2) NOT NULL,
	[ivapre] [decimal](14, 2) NOT NULL,
	[netpre] [decimal](14, 2) NOT NULL,
	[nitemp] [nvarchar](12) NOT NULL,
	[costpre] [decimal](14, 2) NOT NULL,
	[estfac] [nvarchar](1) NOT NULL,
	[nroturno] [numeric](5, 0) NOT NULL,
	[formago] [numeric](1, 0) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_premios')
begin 
CREATE TABLE [dbo].[ven_premios](
	[numero] [nvarchar](10) NULL,
	[codart] [nvarchar](10) NULL,
	[fecper1] [datetime] NULL,
	[fecper2] [datetime] NULL,
	[pundes] [decimal](6, 0) NULL,
	[punhas] [decimal](8, 0) NULL,
	[nota] [nvarchar](150) NULL,
	[base] [decimal](10, 0) NULL,
	[puntos] [decimal](6, 0) NULL
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_retdetliquida')
begin 
CREATE TABLE [dbo].[ven_retdetliquida](
	[idemp] [nvarchar](3) NOT NULL,
	[id] [decimal](8, 0) NOT NULL,
	[codtar] [nvarchar](3) NOT NULL,
	[valvta] [decimal](14, 2) NOT NULL,
	[valcom] [decimal](14, 2) NOT NULL,
	[ivafac] [decimal](14, 2) NOT NULL,
	[retfac] [decimal](14, 2) NOT NULL,
	[ricfac] [decimal](14, 2) NOT NULL,
	[bco] [decimal](14, 2) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[consec] [nvarchar](15) NOT NULL,
	[rivfac] [decimal](14, 2) NOT NULL,
	[vlneto] [decimal](14, 2) NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_retliquida')
begin 
CREATE TABLE [dbo].[ven_retliquida](
	[idemp] [nvarchar](3) NOT NULL,
	[id] [decimal](8, 0) NOT NULL,
	[fecliq] [datetime] NOT NULL,
	[valvta] [decimal](14, 2) NOT NULL,
	[valcom] [decimal](14, 2) NOT NULL,
	[ivafac] [decimal](14, 2) NOT NULL,
	[retfac] [decimal](14, 2) NOT NULL,
	[ricfac] [decimal](14, 2) NOT NULL,
	[bco] [decimal](14, 2) NOT NULL,
	[fecini] [datetime] NOT NULL,
	[fecfin] [datetime] NOT NULL,
	[rivfac] [decimal](14, 2) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_segcartera')
begin 
CREATE TABLE [dbo].[ven_segcartera](
	[idemp] [nvarchar](3) NOT NULL,
	[numero] [nvarchar](10) NOT NULL,
	[nitter] [nvarchar](15) NOT NULL,
	[fecha] [date] NOT NULL,
	[observa] [nvarchar](max) NOT NULL,
	[fecaviso] [date] NOT NULL,
	[horaviso] [nvarchar](5) NOT NULL,
	[tiphora] [nvarchar](2) NOT NULL,
	[estado] [bit] NOT NULL,
	[usuario] [nvarchar](8) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[usufin] [nvarchar](8) NOT NULL,
	[fecfin] [date] NOT NULL,
	[horafin] [datetime] NOT NULL,
	[asunto] [nvarchar](100) NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_temporal')
begin 
CREATE TABLE [dbo].[ven_temporal](
	[mes] [nvarchar](2) NULL,
	[año] [nvarchar](4) NULL,
	[nitter] [nvarchar](15) NULL,
	[valor] [decimal](14, 2) NULL,
	[ok] [bit] NOT NULL
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_tipoveh')
begin 
CREATE TABLE [dbo].[ven_tipoveh](
	[codtip] [nvarchar](4) NULL,
	[nomtip] [nvarchar](4) NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_turnos')
begin 
CREATE TABLE [dbo].[ven_turnos](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[turno] [decimal](10, 0) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_variantes')
begin 
CREATE TABLE [dbo].[ven_variantes](
		[idemp] [nvarchar](3) NULL,
	[numpre] [nvarchar](8) NOT NULL,
	[numcom] [decimal](8, 0) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[codins] [nvarchar](10) NOT NULL,
	[numpor] [decimal](9, 0) NOT NULL,
	[codtips] [nvarchar](3) NOT NULL,
	[cambio] [nvarchar](2) NOT NULL,
	[numcon] [decimal](8, 0) NOT NULL,
	[qtyart] [decimal](14, 2) NOT NULL,
	[qtyorg] [decimal](14, 2) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](8) NOT NULL,
	[item] [decimal](3, 0) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_vehiculo')
begin 
CREATE TABLE [dbo].[ven_vehiculo](
	[placa] [nvarchar](7) NULL,
	[conductor] [nvarchar](150) NULL,
	[codcond] [nvarchar](20) NULL,
	[tipo] [nvarchar](50) NULL,
	[peso] [decimal](3, 2) NULL,
	[vrfru] [decimal](14, 2) NULL,
	[vrfle] [decimal](14, 2) NULL,
	[vrcar] [decimal](14, 2) NULL,
	[vremp] [decimal](14, 2) NULL,
	[vrdes] [decimal](14, 2) NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_saldosf')
begin 
	CREATE TABLE [dbo].[ven_saldosf](
		[idemp]  [nvarchar](3)		NOT NULL,
		[codcto] [nvarchar](3)		NOT NULL,
		[Nitter] [nvarchar](15)		NOT NULL,
		[Saldo]  [Decimal](14,2)	NOT NULL,
	)
end 
GO

-- Agregada por Éduar Álvarez - Febrero 18 de 2015.
IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_tipovincu')
	CREATE TABLE nom_tipovincu (codigo [nchar](2) NOT NULL, nombre [nchar](100) NOT NULL)
GO
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('01', 'Dependiente con Contrato laboral')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('02', 'Dependiente sin Contrato laboral')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('03', 'Dependiente Servicio Doméstico')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('04', 'Funcionarios Publicos')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('05', 'Independiente')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('06', 'Trabajador oficial')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('07', 'Aprendiz del Sena en etapa lectiva')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('08', 'Aprendiz del Sena en etapa productiva')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('09', 'Practicantes Universitarios')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('10', 'Profesor de establecimiento particular')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('11', 'Dependiente Entidades o Universidades Públicas')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('12', 'Independiente agremiado o asociado')
INSERT INTO nom_tipovincu (codigo,nombre) VALUES ('13', 'Cooperados o pre-cooperativas de trabajo asociado')



-- Agregada por Éduar Álvarez - Febrero 18 de 2015.
IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_tipodominio')
	CREATE TABLE nom_tipodominio (codigo [nchar](2) NOT NULL, nombre [nchar](200) NOT NULL)
GO
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('02', 'Servicio Domestico')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('04', 'Madre Comunitaria')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('18', 'Funcionarios públicos sin tope máximo en el IBC')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('20', 'Estudiantes (Régimen especial - Ley 789/2002)')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('21', 'Estudiantes de Postgrado en Salud (Resolución 190 de 1996)')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('30', 'Dependiente entidades o universidades públicas con régimen especial en salud')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('32', 'Cotizante miembro de la carrera diplomática o consular de un país extranjero o funcionario de organismo multilateral no sometido a la legislación colombiana')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('34', 'Concejal amparado por póliza de salud')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('41', 'Cotizante independiente sin ingresos con pago por tercero')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('42', 'Cotizante pago solo salud (Articulo 2 ley 1250 de 2008)')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('43', 'Cotizante independiente no obligado a cotizar pensiones con pago pot tercero (Literal e) del parágrafo 1 del Articulo 15 de la Ley 100 de 1993, modificada por el Articulo 3 de la Ley 797 de 2003')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('44', 'Cotizante dependiente de Empleo de Emergencia con duración mayor o igual a un mes')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('45', 'Cotizante dependiente de Empleo de Emergencia con duración menor a un mes')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('47', 'Trabajador dependiente de entidad beneficiaria de Sistema General de Participaciones-Aportes patronales')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('80', 'Dependiente pensionado por vejez activo')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('81', 'Independiente pensionado por vejez activo. Cotizante no obligado a cotización a pensión por edad')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('82', 'Cotizante no obligado a cotización a pensión por edad')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('83', 'Cotizante a requisitos cumplidos para pensión')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('84', 'Cotizante a quien se le ha reconocido indemnización sustitutiva o devolución de saldos')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('85', 'Cotizante perteneciente a un régimen exceptuando de pensiones o a entidades autorizadas para recibir aportes exclusivamente')
INSERT INTO nom_tipodominio (codigo,nombre) VALUES ('90', 'Cotizante a pensión de alto riesgo de acuerdo a lo dispuesto por el articulo 139 de la Ley 100 de 1993, la Resolución 1835 de 1994 y la Resolución 2090 de 2003')
GO

-- Agregada por Éduar Álvarez - Marzo 11 de 2015.
IF NOT EXISTS (Select * From dbo.sysobjects Where name='nom_incapacidad')
begin
	CREATE TABLE nom_incapacidad (citem			[Numeric](3) NOT NULL DEFAULT 00
								 ,codi_emple	[nchar](4)	 NOT NULL DEFAULT ''
								 ,codi_tran		[nchar](4)	 NOT NULL DEFAULT ''
								 ,fecini		[datetime]	 NOT NULL
								 ,fecfin		[datetime]	 NOT NULL
								 ,observa		[nchar](200) NOT NULL DEFAULT ''
								 ,fecsys		[datetime]	 NOT NULL
								 ,codusu		[nchar](10)	 NOT NULL DEFAULT ''
								 ,estinc		[nchar](1)	 NOT NULL DEFAULT '')
end
GO

-- Agregada por Éduar Álvarez - Marzo 12 de 2015.
IF NOT EXISTS (Select * From dbo.sysobjects Where name='nom_detnovedad')
begin
	CREATE TABLE Nom_DetNovedad ( codi_emple	[nchar](4)		NOT NULL DEFAULT ''
								 ,tran_codi		[nchar](4)		NOT NULL DEFAULT ''
								 ,qty			[numeric](8,2)	NOT NULL DEFAULT 0
								 ,vr_parcial	[numeric](12,2)	NOT NULL DEFAULT 0
								 ,valdeduc		[numeric](12,2)	NOT NULL DEFAULT 0
								 ,valdeven		[numeric](12,2)	NOT NULL DEFAULT 0
								 ,vr_total		[numeric](12,2)	NOT NULL DEFAULT 0
								 ,ano			[numeric](4)	NOT NULL DEFAULT 0
								 ,mes			[nchar](2)		NOT NULL DEFAULT ''
								 ,periodo		[nchar](1)		NOT NULL DEFAULT ''
								 ,fecnov		[datetime]		NULL
								 ,codusu		[nchar](10)		NOT NULL DEFAULT ''
								 ,codcen		[nchar](3)		NOT NULL DEFAULT '')
end
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregada por Éduar Álvarez - Junio 5 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (Select * From dbo.sysobjects Where name='Glb_Parametros')
begin
	CREATE TABLE Glb_Parametros (	 coincidayu		Bit	NOT NULL DEFAULT 0
									,salirvta		Bit	NOT NULL DEFAULT 0
									,impcontable	Bit	NOT NULL DEFAULT 0
									,gppais			nVarChar(3) NOT NULL DEFAULT ''
									,gpdpto			nVarChar(3) NOT NULL DEFAULT ''
									,gpciudad		nVarChar(3) NOT NULL DEFAULT '')
end
Go

IF NOT EXISTS (Select * From dbo.sysobjects Where name='Ven_Parametros2')   -- Ing. Lissette Julio 1 2015
begin
	CREATE TABLE [dbo].[ven_parametros2](
		[idemp] [nvarchar](3) NOT NULL,
		[efdefault]		[bit] NOT NULL,
		[nitdevol]		[bit] NOT NULL,
		[desacdcrip]	[bit] NOT NULL,
		[noveraiu]		[bit] NOT NULL,
		[nit2fact]		[bit] NOT NULL,
		[agrugenero]	[bit] NOT NULL
	) 
end 	
GO
/*
ALTER TABLE [dbo].[ven_parametros2] ADD  CONSTRAINT [DF_ven_parametros2_efdefault]  DEFAULT ((0)) FOR [efdefault]
GO
ALTER TABLE [dbo].[ven_parametros2] ADD  CONSTRAINT [DF_ven_parametros2_nitdevol]	DEFAULT ((0)) FOR [nitdevol]
GO
ALTER TABLE [dbo].[ven_parametros2] ADD  CONSTRAINT [DF_ven_parametros2_desacdcrip] DEFAULT ((0)) FOR [desacdcrip]
GO
ALTER TABLE [dbo].[ven_parametros2] ADD  CONSTRAINT [DF_ven_parametros2_noveraiu]	DEFAULT ((0)) FOR [noveraiu]
GO
ALTER TABLE [dbo].[ven_parametros2] ADD  CONSTRAINT [DF_ven_parametros2_nit2fact]	DEFAULT ((0)) FOR [nit2fact]
GO
ALTER TABLE [dbo].[ven_parametros2] ADD  CONSTRAINT [DF_ven_parametros2_agrugenero] DEFAULT ((0)) FOR [agrugenero]
GO
ALTER TABLE [dbo].[ven_parametros2] ADD  DEFAULT ('') FOR [idemp]
GO
*/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agregada por Éduar Álvarez - Junio 27 de 2015.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (Select * From dbo.sysobjects Where name='Ven_TipoVeh')
begin
	CREATE TABLE Ven_TipoVeh (codtip nVarChar(4) NOT NULL DEFAULT '',
							  nomtip nVarChar(4) NOT NULL DEFAULT '')
end
Go

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_EditFactura')  --Ing. Liss 15 feb. 2016 
begin 
CREATE TABLE [dbo].[Ven_EditFactura](
	[idemp]			[nvarchar](3)	not NULL Default '',
	[codcto]		[nvarchar](3)	NOT NULL Default '',
	[tipfac]		[nvarchar](2)	NOT NULL Default '',
	[numfac]		[nvarchar](8)	NOT NULL Default '',
	[NitCli]		[nvarchar](15)	NOT NULL Default '',
	[FecFac]		[date]			NOT NULL Default getdate(),
	[codart]		[nvarchar](10)	NOT NULL Default '',
	[qtyart]		[float]			NOT NULL Default 0,
	[cosart]		[decimal](18,4) NOT NULL Default 0,
	[valart]		[decimal](18,4)	NOT NULL Default 0,
	[ivaart]		[decimal](6,2)	NOT NULL Default 0,
	[desart]		[decimal](18,4) NOT NULL Default 0,
	[valdes]		[decimal](18,4) NOT NULL Default 0,
	[DevArt]		[decimal](18,4) NOT NULL Default 0,
	[porimpo]		[decimal](6, 2) NOT NULL Default 0,
	[codusu]		[nvarchar](10)	NOT NULL Default '',
	[fecsys]		[datetime]		NOT NULL Default getdate(),
	[codusuedit]	[nvarchar](10)	NOT NULL Default '',
	[fecsysedit]	[datetime]		NOT NULL Default getdate(),
	[codRel]		[nvarchar](15)	NOT NULL Default '',
	[ItemFac]		[int]			NOT NULL Default 0
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_target')
begin 
CREATE TABLE [dbo].alm_target(
	[codtar] [nvarchar](2)	NOT NULL,
	[nomtar] [nvarchar](60) NULL,

)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_temporada')
begin 
CREATE TABLE [dbo].alm_temporada(
	[codtemp] [nvarchar](4)	NOT NULL,
	[nomtemp] [nvarchar](60) NULL,

)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_movactivo')
begin 
CREATE TABLE [dbo].con_movactivo(
	[idemp]		[nvarchar]	(3)		NOT NULL default '',
	[codart]	[nvarchar]	(10)	NOT NULL default '',
	[citem]		[numeric]	(5)		not NULL default 0,
	[fecmov]	[date] 				not NULL default getdate(),
	[descrip]	[nvarchar] (200)	not NULL default '',
	[codusu]	[nvarchar] (10)		not NULL default '',
	[fecsys]	[datetime] 			not NULL default getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Glb_ImpxUsuario')  --Ing. Lissette Julio 8 de 2016  para registro de impresoras por usuario remoto
begin 
CREATE TABLE [dbo].Glb_ImpxUsuario(
	[idemp]			[nvarchar] (3)		NOT NULL default '',
	[CodCto]		[nvarchar] (3)		NOT NULL default '',
	[usuario]		[nvarchar] (30)		not NULL default '',
	[rutimpcocina1] [nvarchar] (80)		NOT NULL default '',
	[rutimpcocina2] [nvarchar] (80)		NOT NULL default '',
	[rutimpcocina3] [nvarchar] (80)		NOT NULL default '',
	[rutimpcocina4] [nvarchar] (80)		NOT NULL default ''
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_globalpuntos')
begin 
CREATE TABLE [dbo].[alm_globalpuntos](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NULL,
	[codigo] [numeric](15) NULL,
	[npuntos] [numeric](15) NULL,
	[valor] [numeric](15) NULL,
	[porcentaje] [numeric](15) NULL,
	[fecini] [datetime] NULL,
	[fecfin] [datetime] NULL
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_puntos')
begin 
CREATE TABLE [dbo].[alm_puntos](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NULL,
	[codigo] [numeric](15) NULL,
	[npuntos] [numeric](15) NULL,
	[valor] [numeric](15) NULL,
	[porcentaje] [numeric](15) NULL,
	[fecini] [datetime] NULL,
	[fecfin] [datetime] NULL,
	[estado] [nvarchar](1)
	)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_redepuntos')
begin 
CREATE TABLE [dbo].alm_redepuntos(
	[codigo] [numeric](20) NOT NULL,
	[puntaje] [numeric](20) NULL,
	[articulo] [varchar](30) NULL
	)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facpuntos')
begin 
CREATE TABLE [dbo].[ven_facpuntos](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NULL,
	[nitter] [nvarchar](15) NULL,
	[numfac] [nvarchar](8) NULL,
	[tipfac] [nvarchar](3) NULL,
	[netofac] [numeric](15) NULL,
	[puntos] [numeric] (15)NULL,
	[codigopuntos] [numeric] (15)NULL,
	[fecfac] [datetime] NULL,
	[fecvenci] [datetime] NULL
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_totalpuntos')
begin 
CREATE TABLE [dbo].ven_totalpuntos(
	[nitter] [nvarchar](15) NULL,
	[puntos] [numeric] (15)NULL
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_puntosredimidos')
begin 
CREATE TABLE [dbo].[ven_puntosredimidos](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NULL,
	[nitter] [nvarchar](15) NULL,
	[numfac] [nvarchar](8) NULL,
	[tipfac] [nvarchar](3) NULL,
	[netofac] [numeric](15) NULL,
	[puntos] [numeric] (15)NULL,
	[fecpun] [datetime] NULL
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_TarjetaCli')  --Ing. Lissette Julio 28 2016  registro de tipos de tarjetas para cliente 
begin 
CREATE TABLE [dbo].[glb_TarjetaCli](
	[codigo] [nvarchar](4)	NOT NULL,
	[nombre] [nvarchar](50) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_TarjexCli')  --Ing. Lissette Julio 28 2016  relacion de tarjetas y clientes 
begin 
CREATE TABLE [dbo].[glb_TarjexCli](
	[codigo] [nvarchar](4)	NOT NULL,
	[Nitter] [nvarchar](15)	NOT NULL,
	[NroTarjeta] [nvarchar](20)	NOT NULL

) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ALm_PromoTer')  --Ing. Lissette Agosto 04 2016  listado de terceros con promociones 
begin 
CREATE TABLE [dbo].[ALm_PromoTer](
	[IdEmp]		[nvarchar](3)	NOT NULL default '', 
	[Codcto]	[nvarchar](3)	NOT NULL default '',
	[Numero]	[nvarchar](10)	NOT NULL default '',
	[Item]		[numeric](10)	NOT NULL default 0,
	[Nitter]	[nvarchar](15)	NOT NULL default ''
) 
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_domicilio') -- Ing Jesus Pinto Agosto 31 del 2016 DOMICILIOS TOUCH
begin 
CREATE TABLE [dbo].ven_domicilio(
	[idemp] [nvarchar](3) NOT NULL,
	[nitcli] [nvarchar](20) NULL,
	[fecha] date NULL,
	[tipllamada] [nvarchar](20) NULL,
	[dircli] [nvarchar](50) NULL,
	[observa] [nvarchar](800) NULL,
	[telcli] [decimal](14) NULL,
	[codusu] [nvarchar](15) NULL
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_domicilioTemp')
begin 
CREATE TABLE [dbo].ven_domicilioTemp(
	[idemp]			[nvarchar](3)	not NULL default '',
	[codcto]		[nvarchar](3)	NOT NULL default '',
	[codtran]		[nvarchar](2)	NOT NULL default '',
	[numdomi]		[nvarchar](8)	NOT NULL default '',
	[itemprefac]	[numeric](10)	NOT NULL default 0,
	[codart]		[nvarchar](10)	NOT NULL default '',
	[qtyart]		[decimal](10,2) NOT NULL default 0,
	[NitCli]		[nvarchar](15)	NOT NULL default '',
	[NitVen]		[nvarchar](15)	NOT NULL default '',
	[VlrDomi]		[decimal](18,4)	NOT NULL default 0,
	[EstDomi]		[nvarchar](1)	NOT NULL default '',
	[fecsysDomi]	[datetime]		not NULL default getdate(),
	[fecsysPrefac]	[datetime],
	[numpre]		[nvarchar](8)	NOT NULL default '',
	[observa]		[nvarchar](200)	NOT NULL default '',
	[observadet]	[nvarchar](200)	NOT NULL default '',
	[codtiplato]	[nvarchar](2)	NOT NULL default '',
	[pordcto]		[decimal](14,2)	NOT NULL default 0,
	[qtydcto]		[decimal](14,2)	NOT NULL default 0,
	[coddcto]		[nvarchar](3)	NOT NULL default '',
	[ivaart]		[decimal](14,2)	NOT NULL default 0,
	[porimpo]		[decimal](14,2)	NOT NULL default 0,
	[ValArt]		[decimal](18,4)	NOT NULL default 0,

)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_Formuladomi')
begin 
CREATE TABLE [dbo].ven_Formuladomi(
	[idemp]			[nvarchar](3)	not NULL default '',
	[codcto]		[nvarchar](3)	NOT NULL default '',
	[codtran]		[nvarchar](2)	NOT NULL default '',
	[numdomi]		[nvarchar](8)	NOT NULL default '',
	[Itemdoc]		[numeric](10)	NOT NULL default 0,
	[itemprefac]	[numeric](10)	NOT NULL default 0,
	[codart]		[nvarchar](10)	NOT NULL default '',
	[qtyart]		[decimal](14,4) NOT NULL default 0,
	[codfor]		[nvarchar](10)	NOT NULL default '',
	[numpor]		[numeric](5)	NOT NULL default 0,
	[codTips]		[nvarchar](3)	NOT NULL default '',
	[cambio]		[nvarchar](2)	NOT NULL default '',
	[qtyorg]		[decimal](12,4) NOT NULL default 0,
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_sesion')
begin
CREATE TABLE glb_sesion (
	ID NUMERIC(14) NOT NULL DEFAULT 0,
	USUARIO NVARCHAR(200) NOT NULL DEFAULT '',
	EQUIPO NVARCHAR(200) NOT NULL DEFAULT '',
	HINICIO TIME ,
	HACTUALIZACION TIME
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_licencias')
begin
CREATE TABLE glb_licencias (
	ID NUMERIC(14) NOT NULL DEFAULT 0,
	CODCTO NVARCHAR(3) NOT NULL DEFAULT '001',
	ALMACEN NVARCHAR(200) NOT NULL DEFAULT '',
	KEYS NUMERIC(4) NOT NULL DEFAULT 0
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Glb_TouchImpresoras') -- Ing Lis 26/04/2017 impresoras para el touch 
begin 
CREATE TABLE [dbo].Glb_TouchImpresoras(
	[idemp]			[nvarchar](3) NOT NULL default '',
	[CodAlm]		[nvarchar](3) NOT NULL default '',
	[ItemImp]		[nvarchar](2) NOT NULL default '',
	[RutaImpCocina] [nvarchar](120) NOT NULL default '',
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Glb_Sucursal') -- Ing Lis 08/05/2017 para saber quien es sucursal
begin 
CREATE TABLE [dbo].Glb_Sucursal(
	[idemp]			[nvarchar](3) NOT NULL default '',
	[CodCto]		[nvarchar](3) NOT NULL default '',
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Nom_PagoPrestamos') -- Ing Lis 30/06/2017 para guardar los pagos de los prestamos en nomina 
begin 
CREATE TABLE [dbo].Nom_PagoPrestamos(
	[idemp]			[nvarchar](3) NOT NULL default '',
	[Codi_emple]	[nvarchar](4) NOT NULL default '',
	[año]			[decimal] (4,0) NOT NULL default 0,
	[mes]			[nvarchar](2) NOT NULL default '',
	[periodo]		[nvarchar](1) NOT NULL default '',
	[codi_Sec]		[nvarchar](3) NOT NULL default '',
	[nSerie]		[nvarchar](5) NOT NULL default '',
	[vlrcuota]		[decimal] (18,4) NOT NULL default 0,
	[nCuota]		[numeric](10) NOT NULL default 0,
	[Tran_Codi]		[nVarchar](4) NOT NULL default '',
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Con_Politicas') -- Ing Lis 11/07/2017 para guardar las politicas
begin 
CREATE TABLE [dbo].Con_Politicas(
	[idemp]		[nvarchar] (3)   NOT NULL default '',
	[item]		[numeric]  (10)  NOT NULL default 0,
	[titulo]	[nvarchar] (100) NOT NULL default '',
	[detalle]	[nvarchar] (max) NOT NULL default '',
	[fecsys]	[datetime] NOT NULL default getdate(),
	[codusu]	[nvarchar] (10) NOT NULL default ''
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_conceptos') -- Ing Jesus 11/07/2017 para guardar conceptos o tipos de cooperativas
begin 
CREATE TABLE [dbo].cop_conceptos(
	[codcon]	 [nvarchar] (4)   NOT NULL default '',
	[nomcon]	 [nvarchar] (100) NOT NULL default '',
	[abreviado]	 [nvarchar] (100) NOT NULL default '',
	[Ctadebito]	 [nvarchar] (8)   NOT NULL default '',
	[Ctacredito] [nvarchar] (8)   NOT NULL default '',
	[tipdes]	 [numeric]	(1)   NOT NULL default 0,
	[valdes]	 [numeric]  (14,4)NOT NULL default 0,
	[pordes]	 [numeric]  (14,4)NOT NULL default 0,
	[tipo]		 [numeric]  (1)   NOT NULL default 0
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_religion') -- Ing Jesus 15/07/2017 para guardar Religiones 
begin 
CREATE TABLE [dbo].glb_religion(
	[codre]		 [nvarchar] (3)   NOT NULL default '',
	[nomre]		[nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_vivienda') -- Ing Jesus 15/07/2017 para guardar Viviendas 
begin 
CREATE TABLE [dbo].glb_vivienda(
	[codvi]		 [nvarchar] (3)   NOT NULL default '',
	[nomvi]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_estadocivil') -- Ing Jesus 15/07/2017 para guardar Estados Civiles 
begin 
CREATE TABLE [dbo].glb_estadocivil(
	[codest]		 [nvarchar] (3)   NOT NULL default '',
	[nomest]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_nivel') -- Ing Jesus 15/07/2017 para guardar niveles de educacion
begin 
CREATE TABLE [dbo].glb_nivel(
	[codniv]		 [nvarchar] (3)   NOT NULL default '',
	[nomniv]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_Coticuota')
begin 
CREATE TABLE [dbo].[ven_Coticuota](
	[idemp]		[nvarchar](3)	NOT NULL default '',
	[codcto]	[nvarchar](3)	NOT NULL default '',
	[tipfac]	[nvarchar](2)	NOT NULL default '',
	[numfac]	[nvarchar](8)	NOT NULL default '',
	[numcuo]	[numeric](10)	NOT NULL default 0,
	[feccuo]	[date]			NOT NULL default getdate(),
	[porcuo]	[decimal](5, 2) NOT NULL default 0,
	[valcuo]	[decimal](18,4) NOT NULL default 0,
	[estcuo]	[nvarchar](1)	NOT NULL default '',
	[capital]	[decimal](18,4) NOT NULL default 0,
	[interes]	[decimal](18,4) NOT NULL default 0,
	[Aporte]	[decimal](18,4) NOT NULL default 0,
	[Saldo]		[decimal](18,4) NOT NULL default 0
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_Codeudor')
begin 
CREATE TABLE [dbo].[ven_Codeudor](
	[idemp]			[nvarchar](3)	NOT NULL default '',
	[codcto]		[nvarchar](3)	NOT NULL default '',
	[tipDocCoti]	[nvarchar](2)	NOT NULL default '',
	[numDocCoti]	[nvarchar](8)	NOT NULL default '',
	[Item]			[Numeric] (10)	NOT NULL default 0,
	[nitter]		[nvarchar](15)	NOT NULL default '',
	[TipDocFac]		[nvarchar](2)	NOT NULL default '',
	[NumDocFac]		[nvarchar](8)	NOT NULL default ''
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_modalidad') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].glb_modalidad(
	[codmod]		 [nvarchar] (3)   NOT NULL default '',
	[nommod]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_lineasc') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].glb_lineasc(
	[codli]		 [nvarchar] (3)   NOT NULL default '',
	[nomli]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_tempresas') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].glb_tempresas(
	[codemp]		 [nvarchar] (3)   NOT NULL default '',
	[nomemp]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_profesion') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].glb_profesion(
	[codpro]		 [nvarchar] (3)   NOT NULL default '',
	[nompro]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Cop_Parametros') -- Ing Lissette 19/07/2017 parametros para carteras - coopera
begin 
CREATE TABLE [dbo].Cop_Parametros(
	[IdEmp]		[nvarchar] (3)   NOT NULL default '',
	[PorSeguro]	[decimal] (10,5) NOT NULL default 0
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_departamentos') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].glb_departamentos(
	[coddep]		 [nvarchar] (3)   NOT NULL default '',
	[nomdep]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_seccion') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].glb_seccion(
	[codsec]		 [nvarchar] (3)   NOT NULL default '',
	[nomsec]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_ocupacion') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].glb_ocupacion(
	[codocu]		 [nvarchar] (3)   NOT NULL default '',
	[nomocu]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_retiros') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].cop_retiros(
	[codret]		 [numeric] (14)   NOT NULL default 0,
	[fecret]		 DATE,
	[motret]		 [nvarchar](100)  NOT NULL default '',
	[nitter]		 [nvarchar](20)   NOT NULL default ''
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_renovacion') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].cop_renovacion(
	[codren]		 [numeric] (14)   NOT NULL default 0,
	[fecren]		 DATE,
	[motren]		 [nvarchar](100)  NOT NULL default '',
	[nitter]		 [nvarchar](20)   NOT NULL default ''
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_familiares') 
begin 
CREATE TABLE [dbo].cop_familiares(
	[id]			[nvarchar] (100)   NOT NULL default '',
	[nombres]		[nvarchar](100)  NOT NULL default '',
	[fecnac]		DATE,
	[parentezco]	[nvarchar](100)   NOT NULL default '',
	[discapacidad]	[nvarchar](100)   NOT NULL default '',
	[ocupacion]		[nvarchar](200)   NOT NULL default '',
	[porben]		[Decimal](18,0)   NOT NULL default 0,
	[numper]		[Decimal](18,0)   NOT NULL default 0,
	[observacion]	[nvarchar](100)   NOT NULL default '',
	[nitter]		[nvarchar](100)   NOT NULL default ''
)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_empresas') 
begin 
CREATE TABLE [dbo].cop_empresas(
	[codemp]		 [nvarchar] (3)   NOT NULL default '',
	[nomemp]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_capacitacion') -- Ing Jesus 15/07/2017 para guardar modalidades de credito
begin 
CREATE TABLE [dbo].cop_capacitacion(
	[codca]			 [numeric] (14)   NOT NULL default 0,
	[fecca]			DATE,
	[nomca]			 [nvarchar](100)  NOT NULL default '',
	[nitter]		 [nvarchar](20)   NOT NULL default ''
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_grupos') 
begin 
CREATE TABLE [dbo].glb_grupos(
	[codgru]		 [nvarchar] (3)   NOT NULL default '',
	[nomgru]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_organismos') 
begin 
CREATE TABLE [dbo].glb_organismos(
	[codor]		 [nvarchar] (3)   NOT NULL default '',
	[nomor]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_tiposeps') 
begin 
CREATE TABLE [dbo].glb_tiposeps(
	[codeps]		 [nvarchar] (3)   NOT NULL default '',
	[nomeps]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_actividadeco') 
begin 
CREATE TABLE [dbo].glb_actividadeco(
	[codact]		 [nvarchar] (3)   NOT NULL default '',
	[nomact]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Cop_organo') 
begin 
CREATE TABLE [dbo].Cop_organo(
	[codorg]		 [nvarchar] (3)   NOT NULL default '',
	[nomorg]		 [nvarchar] (100) NOT NULL default '',
)
end 
go 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Cop_Liquida') 
begin 
CREATE TABLE [dbo].Cop_Liquida(
	[IdEmp]		[nvarchar]	(3)  NOT NULL default '',
	[año]		[numeric]	(4)  NOT NULL default 0,
	[mes]		[nvarchar]	(2)  NOT NULL default '',
	[Fecha]		[date]			 NOT NULL default '',
	[Interes]	[bit]			 NOT NULL default 0,
	[Aporte]	[bit]			 NOT NULL default 0,
	[Fecsys]	[datetime]		 NOT NULL default getdate(),
	[Codusu]	[nvarchar]	(15) NOT NULL default ''
)
end 
go 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_regimen') 
begin 
CREATE TABLE [dbo].glb_regimen(
	[codre]		 [nvarchar] (3)   NOT NULL default '',
	[nomre]		 [nvarchar] (100) NOT NULL default '',
)
end 
go

IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_acto') 
begin 
CREATE TABLE [dbo].glb_acto(
	[codact]		 [nvarchar] (3)   NOT NULL default '',
	[nomact]		 [nvarchar] (100) NOT NULL default '',
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_revaloriza') 
begin 
CREATE TABLE [dbo].cop_revaloriza(
	[IdEmp]		[nvarchar] (3)		NOT NULL default '',
	[Nitter]	[nvarchar] (15)		NOT NULL default '',
	[año]		[NUMERIC]  (4)		NOT NULL default 0,
	[valor]		[decimal]  (18,4)	NOT NULL default 0,
	[codusu]	[nvarchar] (10)		NOT NULL default '',
	[fecsys]	[datetime]			NOT NULL default getdate(),
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pre_presup') 
begin 
CREATE TABLE [dbo].pre_presup(
	[IdEmp]		[nvarchar] (3)		NOT NULL default '',
	[codcto]	[nvarchar] (3)		NOT NULL default '',
	[codprep]	[nvarchar]  (8)		NOT NULL default '',
	[codcue]	[nvarchar]  (8)		NOT NULL default '',
	[valprep]	[decimal]  (18,4)	NOT NULL default 0,
	[ene]		[decimal]  (18,4)	NOT NULL default 0,
	[feb]		[decimal]  (18,4)	NOT NULL default 0,
	[mar]		[decimal]  (18,4)	NOT NULL default 0,
	[abr]		[decimal]  (18,4)	NOT NULL default 0,
	[may]		[decimal]  (18,4)	NOT NULL default 0,
	[jun]		[decimal]  (18,4)	NOT NULL default 0,
	[jul]		[decimal]  (18,4)	NOT NULL default 0,
	[ago]		[decimal]  (18,4)	NOT NULL default 0,
	[sep]		[decimal]  (18,4)	NOT NULL default 0,
	[oct]		[decimal]  (18,4)	NOT NULL default 0,
	[nov]		[decimal]  (18,4)	NOT NULL default 0,
	[dic]		[decimal]  (18,4)	NOT NULL default 0
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pre_prepaño') 
begin 
CREATE TABLE [dbo].pre_prepaño(
	[codprep]	[nvarchar] (8)		NOT NULL default '',
	[nomprep]	[nvarchar] (28)		NOT NULL default '',
	[año]	    [numeric]  (4)		NOT NULL default 0,
	[porcent]	[numeric]  (4)		NOT NULL default 0,
	[codcto]	[nvarchar] (3)	NOT NULL default ''

)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pre_grafico') 
begin 
CREATE TABLE [dbo].pre_grafico(
	[olegraph]	[nvarchar] (100)		NOT NULL default '',
	[consulta]	[numeric] (1)		NOT NULL default 0


)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_movclitemp')
begin 
CREATE TABLE [dbo].[cop_movclitemp](
	[idemp] [nvarchar](3) NULL default '',
	[codcto] [nvarchar](3) NOT NULL default '',
	[nitcli] [nvarchar](15) NOT NULL default '',
	[docven] [nvarchar](8) NOT NULL default '',
	[tipdoc] [nvarchar](2) NOT NULL default '',
	[fecven] [date] NOT NULL default getdate(),
	[afecen] [nvarchar](3) NOT NULL default '',
	[afetip] [nvarchar](2) NOT NULL default '',
	[afedoc] [nvarchar](8) NOT NULL default '',
	[debven] [decimal](18,4) NOT NULL default 0,
	[creven] [decimal](18,4) NOT NULL default 0,
	[fecsys] [datetime] NOT NULL  default getdate(),
	[codusu] [nvarchar](8) NOT NULL default '',
	[estmov] [nvarchar](1) NOT NULL default '',
	[capital] [decimal](14,8) NOT NULL default 0,
	[Interes] [decimal](14,8) NOT NULL default 0,
	[Item] [numeric](14) NOT NULL default 0
	)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Cop_pagdesctoTemp')
begin 
CREATE TABLE [dbo].[Cop_pagdesctoTemp](
	[idemp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[coddes] [nvarchar](3) NOT NULL,
	[pordes] [decimal](6, 2) NOT NULL,
	[valdes] [decimal](14, 2) NOT NULL,
	[tipdes] [nvarchar](1) NOT NULL
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Cop_Servicio')
begin 
CREATE TABLE [dbo].[Cop_Servicio](
	[codigo] [nvarchar](3)	NOT NULL	default '',
	[Nombre] [nvarchar](100) NOT NULL	default '',
	[Tipo]	 [nvarchar](3)	NOT NULL	default '',
	[NitEmp] [nvarchar](20) NOT NULL	default '',
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Cop_Tipo_Mov')
begin 
CREATE TABLE [dbo].[Cop_Tipo_Mov](
	[codMov]	 [nvarchar](3)	 NOT NULL	default '',
	[NomMov]	 [nvarchar](100) NOT NULL	default '',
	[AbrevMov]	 [nvarchar](20)  NOT NULL	default '',
	[TipoMov]	 [numeric](1)	 NOT NULL	default 0,
	[CodTran]	 [nvarchar](2)	 NOT NULL	default '',
	[ClasiMov]	 [numeric](1)	 NOT NULL	default 0,
	[TerceroMov] [bit]			 NOT NULL	default 0,
	[Nitter]	 [nvarchar](20)  NOT NULL	default ''
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_convenios') 
begin 
CREATE TABLE [dbo].cop_convenios(
	[IdEmp]		[nvarchar] (3)		NOT NULL default '',
	[Nitter]	[nvarchar] (15)		NOT NULL default '',
	[vlrini]	[decimal]  (18,4)	NOT NULL default 0,
	[ingresos]	[decimal]  (18,4)	NOT NULL default 0,	
	[Egresos]	[decimal]  (18,4)	NOT NULL default 0,
	[tipopres]	[nvarchar] (3)		NOT NULL default ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_tarifas') 
begin 
CREATE TABLE [dbo].cop_tarifas(
	[IdEmp]			[nvarchar] (3)		NOT NULL default '',
	[Nitter]		[nvarchar] (15)		NOT NULL default '',
	[CodCon]		[nvarchar] (3)		NOT NULL default '',
	[vlrconcepto]	[decimal]  (18,4)	NOT NULL default 0,
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_ControlAnual') 
begin 
CREATE TABLE [dbo].cop_ControlAnual(
	[IdEmp]			[nvarchar] (3)	NOT NULL default '',
	[Año]			[numeric] (4)	NOT NULL default 0,
	[IniPerNatu]	[numeric] (14)	NOT NULL default 0,
	[IniPerJuri]	[numeric] (14)	NOT NULL default 0,
	[AOrdPerNatu]	[numeric] (14)	NOT NULL default 0,
	[AOrPerJuri]	[numeric] (14)	NOT NULL default 0,
	[AExtPerNatu]	[numeric] (14)	NOT NULL default 0,
	[AExtPerJuri]	[numeric] (14)	NOT NULL default 0
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_artxlote') 
begin 
CREATE TABLE [dbo].alm_artxlote(
	[IdEmp]		[nvarchar] (3)	NOT NULL default '',
	[codcto]	[nvarchar] (4)	NOT NULL default '',
	[tipdoc]	[nvarchar] (14)	NOT NULL default '',
	[numdoc]	[nvarchar] (14)	NOT NULL default '',
	[codart]	[nvarchar] (14)	NOT NULL default '',
	[lote]		[nvarchar] (20)	NOT NULL default '',
	[qtyart]	[decimal]  (18,4)	NOT NULL default 0,
	[qtyfra]	[decimal]  (18,4)	NOT NULL default 0,
	[undart]	[nvarchar] (3)	NOT NULL default '',
	[qtydev]	[decimal]  (18,4)	NOT NULL default 0,
	[qtydevfra]	[decimal]  (18,4)	NOT NULL default 0,
	[tipo]		[nvarchar]  (2)	NOT NULL default '',
	[item]		[numeric] (14)	NOT NULL default 0,
	[numord]	[nvarchar] (14)	NOT NULL default ''

)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Cop_detRetiro') 
begin 
CREATE TABLE [dbo].[Cop_detRetiro](
	[idemp]		[nvarchar](3) Not NULL DEFAULT (''),
	[codcto]	[nvarchar](3) NOT NULL DEFAULT (''),
	[tipdoc]	[nvarchar](2) NOT NULL DEFAULT (''),
	[numdoc]	[nvarchar](8) NOT NULL DEFAULT (''),
	[codcon]	[nvarchar](3) not NULL DEFAULT (''),
	[codcue]	[nvarchar](8) NOT NULL DEFAULT (''),
	[valcon]	[decimal](18, 4) not NULL DEFAULT ((0)),
	[fecsys]	[datetime] NOT NULL DEFAULT (getdate())
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Alm_TipoImpresora')
begin 
CREATE TABLE [dbo].Alm_TipoImpresora(
	[idemp]		[nvarchar]	(3) NOT NULL default '',
	[codigo]	[nvarchar]	(2) NOT NULL default '',
	[nombre]	[nvarchar]	(30) NOT NULL default '',
	[impresora] [nvarchar]	(100) NOT NULL default ''
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_formatos')
begin 
CREATE TABLE [dbo].cop_formatos(
	[id]		[decimal]	(14) NOT NULL default 0,
	[nombre]	[nvarchar]	(100) NOT NULL default '',
	[Tipo]		[nvarchar]	(1) NOT NULL default '',
	[Estado]	[nvarchar]	(1) NOT NULL default '1',
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_Detformatos')
begin 
CREATE TABLE [dbo].cop_Detformatos(
	[id]		[decimal]	(14) NOT NULL default 0,
	[detalle]	[nvarchar]	(MAX) NOT NULL default ''
) 
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_mescierreCtaBlce')
begin 
CREATE TABLE [dbo].[con_mescierreCtaBlce](
	[idemp]		[nvarchar](3) NOT NULL default '',
	[mes]		[nvarchar](2) NOT NULL default '' ,
	[año]		[nVarchar](4) NOT NULL default '',
	[CodUsu]	[nVarchar](10) NOT NULL default '',
	[fecsys]	[datetime] NOT NULL default getdate()
)
end 
GO
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_conexion')
begin 
CREATE TABLE [dbo].glb_conexion (
	[instancia] [nvarchar](200) NOT NULL Default '',
	[usuario] [nvarchar](200) NOT NULL Default '',
	[password] [nvarchar](200) NOT NULL Default '',
	[base] [nvarchar](200) NOT NULL Default ''
)

end 
GO 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_config')
begin 
CREATE TABLE [dbo].[glb_config](
	[api]    [nvarchar](300) NOT NULL DEFAULT '',
	[usuario] [nvarchar](100) NOT NULL DEFAULT '',
	[token]  [nvarchar](100) NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FECliente')
begin 
CREATE TABLE [dbo].[Ven_FECliente](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[apellido]				[nvarchar](50)	NOT NULL DEFAULT '',
	[ciudad]				[nvarchar](50)	NOT NULL DEFAULT '',
	[departamento]			[nvarchar](50)	NOT NULL DEFAULT '',
	[direccion]				[nvarchar](100) NOT NULL DEFAULT '',
	[email]					[nvarchar](200) NOT NULL DEFAULT '',
	[nombrerazonsocial]		[nvarchar](100) NOT NULL DEFAULT '',
	[notificar]				[nvarchar](2)	NOT NULL DEFAULT '',
	[numerodocumento]		[nvarchar](13)	NOT NULL DEFAULT '',
	[pais]					[nvarchar](3)	NOT NULL DEFAULT '',
	[referencia2]			[nvarchar](50)	NOT NULL DEFAULT '',
	[regimen]				[nvarchar](1)	NOT NULL DEFAULT '',
	[segundonombre]			[nvarchar](50)	NOT NULL DEFAULT '',
	[subdivision]			[nvarchar](50)	NOT NULL DEFAULT '',
	[telefono]				[nvarchar](50)	NOT NULL DEFAULT '',
	[tipoidentificacion]	[nvarchar](2)	NOT NULL DEFAULT '',
	[tipopersona]			[nvarchar](1)	NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FEFactura')
begin 
CREATE TABLE [dbo].[Ven_FEFactura](
	[IdEmp]								[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]							[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]								[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]							[nvarchar](10)	NOT NULL DEFAULT '',
	[consecutivodocumento]				[nvarchar](20)	NOT NULL DEFAULT '',
	[consecutivodocumentomodificado]	[nvarchar](20)	NOT NULL DEFAULT '',
	[EstadoPago]						[nvarchar](1)	NOT NULL DEFAULT '',
	[FechaEmision]						[nvarchar](19)	NOT NULL DEFAULT '',
	[FechaEmisiondocumentomodificado]	[nvarchar](19)	NOT NULL DEFAULT '',
	[Fechavencimiento]					[nvarchar](19)	NOT NULL DEFAULT '',
	[icoterms]							[nvarchar](3)	NOT NULL DEFAULT '',
	[importetotal]						[nvarchar](21)	NOT NULL DEFAULT '',
	[informacionadicional]				[nvarchar](max)	NOT NULL DEFAULT '',
	[mediopago]						[nvarchar](2)	NOT NULL DEFAULT '',
	[moneda]							[nvarchar](3)	NOT NULL DEFAULT '',
	[motivonota]						[nvarchar](1)	NOT NULL DEFAULT '',
	[propina]							[nvarchar](21)	NOT NULL DEFAULT '',
	[rangodenumeracion]					[nvarchar](21)	NOT NULL DEFAULT '',
	[tipodocumento]						[nvarchar](2)	NOT NULL DEFAULT '',
	[totaldescuentos]					[nvarchar](21)	NOT NULL DEFAULT '',
	[totalsinimpuestos]					[nvarchar](21)	NOT NULL DEFAULT '',
	[uuiddocumentomodificado]			[nvarchar](40)	NOT NULL DEFAULT '',
	[estado]							[nvarchar](1)	NOT NULL DEFAULT '',
	[fecsys]							[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FEFacturaImpuestos')
begin 
CREATE TABLE [dbo].[Ven_FEFacturaImpuestos](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[baseimponibletotalimp]	[nvarchar](21)	NOT NULL DEFAULT '',
	[codigototalimp]		[nvarchar](2)	NOT NULL DEFAULT '',
	[controlinterno]		[nvarchar](3)	NOT NULL DEFAULT '',
	[Porcentajetotalimp]	[nvarchar](5)	NOT NULL DEFAULT '',
	[valortotalimp]			[nvarchar](21)	NOT NULL DEFAULT '',
	[fecsys]				[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ven_FEFacturaDetalle')
begin 
CREATE TABLE [dbo].[Ven_FEFacturaDetalle](
	[IdEmp]						[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]					[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]						[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]					[nvarchar](10)	NOT NULL DEFAULT '',
	[cantidadunidades]			[nvarchar](14)	NOT NULL DEFAULT '',
	[codigoproducto]			[nvarchar](20)	NOT NULL DEFAULT '',
	[descripcion]				[nvarchar](100)	NOT NULL DEFAULT '',
	[descuento]					[nvarchar](21)	NOT NULL DEFAULT '',
	[detalleadicionalnombre]	[nvarchar](200)	NOT NULL DEFAULT '',
	[detalleadicionalvalor]		[nvarchar](200)	NOT NULL DEFAULT '',
	[baseimponibletotalimp]		[nvarchar](21)	NOT NULL DEFAULT '',
	[codigototalimp]			[nvarchar](2)	NOT NULL DEFAULT '',
	[controlinterno]			[nvarchar](3)	NOT NULL DEFAULT '',
	[porcentajetotalimp]		[nvarchar](5)	NOT NULL DEFAULT '',
	[valortotalimp]				[nvarchar](21)	NOT NULL DEFAULT '',
	[preciototal]				[nvarchar](21)	NOT NULL DEFAULT '',
	[preciototalsinimpuestos]	[nvarchar](21)	NOT NULL DEFAULT '',
	[precioventaunitario]		[nvarchar](21)	NOT NULL DEFAULT '',
	[seriales]					[nvarchar](max)	NOT NULL DEFAULT '',
	[unidadmedida]				[nvarchar](50)	NOT NULL DEFAULT '',
	[fecsys]					[datetime]		NOT NULL DEFAULT getdate()

)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Con_ParaFlujoEF')
begin 
CREATE TABLE [dbo].[Con_ParaFlujoEF](
	[IdEmp]			[nvarchar](3)	NOT NULL DEFAULT '',
	[Codigo]		[nvarchar](2)	NOT NULL DEFAULT '',
	[Tipo]			[nvarchar](1)	NOT NULL DEFAULT '',
	[Grupo]			[numeric] (5)	NOT NULL DEFAULT 0,
	[Subgrupo]		[numeric] (5)	NOT NULL DEFAULT 0,
	[Descripcion]	[nvarchar](60)	NOT NULL DEFAULT '',
	[codcue]		[nvarchar](8)	NOT NULL DEFAULT '',
	[Operacion]		[nvarchar](1)	NOT NULL DEFAULT '',
	[Item]			[numeric] (5)	NOT NULL DEFAULT 0,
	[Codusu]		[nvarchar](10)	NOT NULL DEFAULT '',
	[Fecsys]		[datetime]		NOT NULL DEFAULT getdate() 
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Glb_Equivalentes_FE')
begin 
CREATE TABLE [dbo].[Glb_Equivalentes_FE](
	[Codigo]		[nvarchar](10)	NOT NULL DEFAULT '',
	[nombre]		[nvarchar](200)	NOT NULL DEFAULT '',
	[origen]		[nVarchar] (5)	NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Glb_IsoPais')
begin 
CREATE TABLE [dbo].[Glb_IsoPais](
	[Codigo]		[nvarchar](3)	NOT NULL DEFAULT '',
	[nombre]		[nvarchar](60)	NOT NULL DEFAULT '',
	[dominio]		[nVarchar] (3)	NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Alm_UtilxUnidad')
begin 
CREATE TABLE [dbo].[Alm_UtilxUnidad](
	[IdEmp]			[nvarchar](3)	NOT NULL DEFAULT '',
	[Codcto]		[nvarchar](3)	NOT NULL DEFAULT '',
	[Codart]		[nVarchar] (10)	NOT NULL DEFAULT '',
	[Undart]		[nVarchar] (3)	NOT NULL DEFAULT '',
	[Utilidad]		[decimal] (8,4)	NOT NULL DEFAULT 0,
	[Codusu]		[nVarchar] (10)	NOT NULL DEFAULT '',
	[Fecsys]		[datetime]		NOT NULL DEFAULT getdate(),
	[Servidor]		[nVarchar] (60)	NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Alm_UtilxLista')
begin 
CREATE TABLE [dbo].[Alm_UtilxLista](
	[IdEmp]			[nvarchar](3)	NOT NULL DEFAULT '',
	[Codcto]		[nvarchar](3)	NOT NULL DEFAULT '',
	[Codart]		[nVarchar] (10)	NOT NULL DEFAULT '',
	[UtilPublic]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[UtilMayori]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[UtilEspeci]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[UtilEspeci1]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[UtilEspeci2]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[UtilEspeci3]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[UtilEspeci4]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[UtilEspeci5]	[decimal] (8,4)	NOT NULL DEFAULT 0,
	[Codusu]		[nVarchar] (10)	NOT NULL DEFAULT '',
	[Fecsys]		[datetime]		NOT NULL DEFAULT getdate(),
	[Servidor]		[nVarchar] (60)	NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_salariosmin')
begin 
CREATE TABLE [dbo].[nom_salariosmin](
	[año]			[numeric](4)		NOT NULL DEFAULT 0,
	[salario]		[decimal] (18,4)	NOT NULL DEFAULT 0,
	[subsidio]		[decimal] (18,4)	NOT NULL DEFAULT 0
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='pro_descuentos')
begin 
CREATE TABLE [dbo].[pro_descuentos](
	[Idemp]			[nvarchar]	(3)		NOT NULL DEFAULT '',
	[codcto]		[nvarchar]	(3)		NOT NULL DEFAULT '',
	[numcon]		[nvarchar]	(10)	NOT NULL DEFAULT '',
	[numord]		[nvarchar]	(8)		NOT NULL DEFAULT '',
	[tipcon]		[nvarchar]	(5)		NOT NULL DEFAULT '',
	[nomdes]		[nvarchar]	(50)	NOT NULL DEFAULT '',
	[basret]		[decimal]	(18,4)	NOT NULL DEFAULT 0,
	[pordes]		[decimal]	(18,4)	NOT NULL DEFAULT 0,
	[tipdes]		[nvarchar]	(1)		NOT NULL DEFAULT '',
	[valdes]		[decimal]	(18,4)	NOT NULL DEFAULT 0,
	[coddes]		[nvarchar]	(3)		NOT NULL DEFAULT '',
	[ctacom]		[nvarchar]	(8)		NOT NULL DEFAULT ''
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cop_clasicartera')
begin 
CREATE TABLE [dbo].[cop_clasicartera](
	[Idemp]			[nvarchar]	(3)		NOT NULL DEFAULT '',
	[codcto]		[nvarchar]	(3)		NOT NULL DEFAULT '',
	[tipo]			[nvarchar]	(1)		NOT NULL DEFAULT '',
	[mes]			[nvarchar]	(2)		NOT NULL DEFAULT '',
	[año]			[nvarchar]	(4)		NOT NULL DEFAULT '',
	[Clasifi]		[nvarchar]	(1)		NOT NULL DEFAULT '',
	[vlrcartera]	[decimal]	(18,4)	NOT NULL DEFAULT 0,
	[codcue]		[nvarchar]	(8)		NOT NULL DEFAULT '',
	[codusu]		[nvarchar]	(10)	NOT NULL DEFAULT '',
	[fecsys]		[datetime]			NOT NULL DEFAULT getdate()
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='esq_tablasdev')
begin 

CREATE TABLE [dbo].[esq_tablasdev](
	[NOMTABLA] [nvarchar](100) NOT NULL,
	[NOMCAMPO] [nvarchar](200) NOT NULL,
	[POSICION] [int] NOT NULL,
	[TIPODATO] [nvarchar](50) NOT NULL,
	[LONGITUD] [numeric](10, 0) NOT NULL,
	[POSDECIMAL] [numeric](10, 0) NOT NULL,
	[VLRDEFAULT] [nvarchar](50) NULL,
	[IDENTIDAD] [bit] NOT NULL DEFAULT ((0)),
	[NULLVALUES] [bit] NOT NULL DEFAULT ((0)),
	[PRIMARYKEY] [bit] NOT NULL DEFAULT ((0)),
	[CHECK_CONSTRAINT] [varchar](512) NOT NULL DEFAULT (''),
	[USUARIO] [nvarchar](100) NULL,
	[FECHACREACION] [datetime] NULL,
	[FECHAMODIFIC] [datetime] NULL,
	[ESTADO] [int] NOT NULL,
 CONSTRAINT [PK_ESQ_TABLASDEV] PRIMARY KEY CLUSTERED 
(
	[NOMTABLA] ASC,
	[NOMCAMPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='esq_tablasprd')
begin 

CREATE TABLE [dbo].[esq_tablasprd](
	[NOMTABLA] [nvarchar](100) NOT NULL,
	[NOMCAMPO] [nvarchar](200) NOT NULL,
	[POSICION] [int] NOT NULL,
	[TIPODATO] [nvarchar](50) NOT NULL,
	[LONGITUD] [numeric](10, 0) NOT NULL,
	[POSDECIMAL] [numeric](10, 0) NOT NULL,
	[VLRDEFAULT] [nvarchar](50) NULL,
	[IDENTIDAD] [bit] NOT NULL DEFAULT ((0)),
	[NULLVALUES] [bit] NOT NULL DEFAULT ((0)),
	[PRIMARYKEY] [bit] NOT NULL DEFAULT ((0)),
	[CHECK_CONSTRAINT] [varchar](512) NOT NULL DEFAULT (''),
	[USUARIO] [nvarchar](100) NULL,
	[FECHACREACION] [datetime] NULL,
	[FECHAMODIFIC] [datetime] NULL,
	[ESTADO] [int] NOT NULL,
 CONSTRAINT [PK_ESQ_TABLASPRD] PRIMARY KEY CLUSTERED 
(
	[NOMTABLA] ASC,
	[NOMCAMPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_estacion')
begin 
	CREATE TABLE [dbo].[ser_estacion](
		[CODIGO] [CHAR](4) NOT NULL,
		[NOMBRE] [nvarchar](50) NOT NULL,
	 CONSTRAINT [PK_SER_ESTACION] PRIMARY KEY CLUSTERED 
	(
		[CODIGO] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end 

GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_sigla')
begin 
	CREATE TABLE [dbo].[ser_sigla](
		[CODIGO] [CHAR](10) NOT NULL,
		[CODDEPEN] [nvarchar](2) NOT NULL,
		[CODESTACION] [nvarchar](4) NOT NULL,
	 CONSTRAINT [PK_SER_SIGLA] PRIMARY KEY CLUSTERED 
	(
		[CODIGO] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end 

GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ser_dependencia')
begin 
	CREATE TABLE [dbo].[ser_dependencia](
		[CODIGO] [CHAR](2) NOT NULL,
		[NOMBRE] [nvarchar](50) NOT NULL,
		[PRESUPUESTO] [NUMERIC](18,2) NOT NULL DEFAULT (0),
		[EJECUTADO] [NUMERIC](18,2) NOT NULL DEFAULT (0),
	 CONSTRAINT [PK_SER_DEPENDENCIA] PRIMARY KEY CLUSTERED 
	(
		[CODIGO] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end 

GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ser_Parametros')
begin 
	CREATE TABLE [dbo].[Ser_Parametros](
		[IdEmp] [nchar](3) NOT NULL,
		[pedirsigla] [bit] NOT NULL DEFAULT ((0)),
		[pedirplaca] [bit] NOT NULL DEFAULT ((0)),
		[pedirnrodoc] [bit] NOT NULL DEFAULT ((0)),
		[codtranpen] [char](2) NOT NULL,
		[manejapen] [bit] NOT NULL DEFAULT ((0)),
		[nocontab] [bit] NOT NULL DEFAULT ((0)),
		[ayudacli] [bit] NOT NULL DEFAULT ((0)),
		[editobserva] [bit] NOT NULL DEFAULT ((0)),
		[imporden] [bit] NOT NULL DEFAULT ((0)),
		[editcos] [bit] NOT NULL DEFAULT ((0)),
		[lprecios] [bit] NOT NULL DEFAULT ((0)),
		[sinart] [bit] NOT NULL  DEFAULT ((0))
    ) ON [PRIMARY]
end 

GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_relacionart')
begin 
CREATE TABLE [dbo].[alm_relacionart](
	[Idemp]			[nvarchar]	(3)		NOT NULL DEFAULT '',
	[codcto]		[nvarchar]	(3)		NOT NULL DEFAULT '',
	[Item]			[decimal]	(10)	NOT NULL DEFAULT 0,
	[CodartPadre]	[nvarchar]	(10)	NOT NULL DEFAULT '',
	[CodartHijo]	[nvarchar]	(10)	NOT NULL DEFAULT '',
	[Qtyart]		[decimal]	(18,4)	NOT NULL DEFAULT 0,
	[codusu]		[nvarchar]	(10)	NOT NULL DEFAULT '',
	[fecsys]		[datetime]			NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='Ser_Presupuesto')
begin 
CREATE TABLE [dbo].[Ser_Presupuesto](
	[codpresu]      [nvarchar]  (10)    NOT NULL,
	[nombre]		[nvarchar]  (60)    NOT NULL,
	[coddepen]		[char]		(2)		NOT NULL,
	[fecini]        [date]				NOT NULL,
	[fecfin]        [date]				NOT NULL,
	[valpresu]      [numeric]   (18,2)  NOT NULL DEFAULT 0,
CONSTRAINT [PK_Ser_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[codpresu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
END
GO

--Ing. Luis Dominguez 2019-03-22
 if NOT EXISTS ( select * from dbo.sysobjects where name = N'Ser_orden')
 Begin 
 CREATE TABLE [Ser_orden] (
[Idemp]			                   nvarchar(3)		NOT NULL,
[codcto]                           char(3)			NOT NULL , 
[tipdoc]                           char(2)			NOT NULL , 
[numord]                           Char(10)     	NOT NULL, 
[fecha]                            datetime 		NOT NULL Default GetDate(),
[codter]                           nvarchar(20) 	NOT NULL Default '', 
[codtec]                           nvarchar(20)		NOT NULL Default '', 
[feccierre]                        datetime			NOT NULL Default GetDate(), 
[vrtotal]                          numeric(14,2)	NOT NULL Default 0, 
[observa]                          nvarChar(max)	NOT NULL Default '', 
[abono]                            numeric(14,2)	NOT NULL Default 0, 
[usuario]                          nvarchar(8)		NOT NULL Default '', 
[fechasys]                         datetime			NOT NULL Default GetDate(), 
[codestado]                        char(3)			NOT NULL Default '', 
[liquidada]                        integer			NOT NULL Default 0, 
[codpro]                           nvarchar(20)		NOT NULL Default '', 
[lugar]                            integer			NOT NULL Default 0, 
[tipo]                             integer			NOT NULL Default 0, 
[tipservi]                         integer			NOT NULL Default 0, 
[tipser]                           integer			NOT NULL Default 0, 
[contacto]                         nvarchar(60)		NOT NULL Default '', 
[diradc]                           nvarchar(60)		NOT NULL Default '', 
[imagen]                           nvarchar(80)		NOT NULL Default '', 
[nrogaran]                         nvarchar(20)		NOT NULL Default '', 
[teladc]                           nvarchar(30)		NOT NULL Default '', 
[estord]                           char(1)			NOT NULL Default '', 
[feccomp]                          datetime			NOT NULL Default GetDate(), 
[horacomp]                         char(5)			NOT NULL Default '', 
[jornada]                          char(4)			NOT NULL Default '', 
[feccompra]                        datetime			NOT NULL Default GetDate(), 
[nrocomp]                          nvarchar(10)		NOT NULL Default '', 
[nrogaran2]                        nvarchar(20)		NOT NULL Default '', 
[lugcomp]                          nvarchar(60)		NOT NULL Default '', 
[vendedor]                         nvarchar(10)		NOT NULL Default '', 
[tipfac]                           char(2)			NOT NULL Default '', 
[cenfac]                           char(3)			NOT NULL Default '', 
[numfac]                           char(8)			NOT NULL Default '', 
[hora]                             char(8)			NOT NULL Default '', 
[nitcli]                           nvarchar(15)		NOT NULL Default '', 
[nitven]                           nvarchar(15)		NOT NULL Default '', 
[tipvehi]                          nvarchar(15)		NOT NULL Default '', 
[codmar]                           char(3)			NOT NULL Default '', 
[placa]                            nvarchar(8)		NOT NULL Default '', 
[codcolor]                         char(3)			NOT NULL Default '', 
[modelo]                           integer			NOT NULL Default 0, 
[numunit]                          nvarchar(13)		NOT NULL Default '', 
[horom]                            nvarchar(10)		NOT NULL Default '', 
[odomtr]                           nvarchar(10)		NOT NULL Default '', 
[fecfin]                           datetime			NOT NULL Default '', 
[horafin]                          nvarchar(8)		NOT NULL Default '', 
[codusu]                           nvarchar(10)		NOT NULL Default '', 
[fecsys]                           datetime			NOT NULL Default GetDate(), 
[estado]                           char(1)			NOT NULL Default '', 
[numcon]                           nvarchar(10)		NOT NULL Default '', 
[tipcon]                           char(3)			NOT NULL Default '', 
[entrega]                          nvarchar(60)		NOT NULL Default '', 
[recibe]                           nvarchar(60)		NOT NULL Default '', 
[netser]                           numeric(14,2)	NOT NULL Default 0, 
[omitido]                          bit				NOT NULL Default 0, 
[carano]                           integer			NOT NULL Default 0, 
[odomtrant]                        nvarchar(10)		NOT NULL Default '', 
[codfal]                           char(3)			NOT NULL Default '', 
[nitcierre]                        nvarchar(15)		NOT NULL Default '', 
[notacierre]                       nvarchar(max)	NOT NULL Default '', 
[otrsoporte]                       nvarchar(100)	NOT NULL Default '', 
[tipsoporte]                       char(2)			NOT NULL Default '', 
[numint]                           nvarchar(15)		NOT NULL Default '', 
[dependen]                         nvarchar(60)		NOT NULL Default '', 
[sigla]                            nvarchar(20)		NOT NULL Default '', 
[nrodoc]                           nvarchar(10)		NOT NULL Default '', 
[nroact]                           nvarchar(10)		NOT NULL Default '', 
[estfacrep]                        char(1)			NOT NULL Default '', 
[estfacser]                        char(1)			NOT NULL Default '', 
[estgaranti]                       nvarchar(60)		NOT NULL Default '', 
[ruta]                             nvarChar(100)	NOT NULL Default ''
CONSTRAINT [PK_Ser_orden] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[tipdoc] ASC,
	[numord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
END
GO

--Ing. Luis Dominguez 2019-03-22
if not exists ( select * from sys.tables where name = N'ser_ordendet')
 Begin 
 CREATE TABLE [ser_ordendet] (
[Idemp]			                   nvarchar(3)		NOT NULL,
[codcto]                           Char(3)			NOT NULL, 
[tipdoc]                           Char(3)			NOT NULL,
[numord]                           nvarchar(10)		NOT NULL, 
[codart]                           nvarchar(10)		NOT NULL,
[item]                             Numeric(10,0)	NOT NULL,  
[modelo]                           nvarchar(50)		NOT NULL Default '', 
[serie]                            nvarchar(50)		NOT NULL Default '', 
[coddiagnos]                       Char(3)			NOT NULL Default '', 
[codestado]                        Char(3)			NOT NULL Default '', 
[codfalla]                         Char(3)			NOT NULL Default '', 
[observa]                          nvarchar(max)	NOT NULL Default '', 
[marca]                            nvarchar(20)		NOT NULL Default '', 
[observatec]                       nvarchar(max)	NOT NULL Default '', 
[cambio]                           nvarchar(max)	NOT NULL Default '', 
[fecautoriz]                       DateTime			NOT NULL Default GetDate(), 
[tipser]                           Char(3)			NOT NULL Default '', 
[qtyart]                           Numeric(14,4)	NOT NULL Default 0, 
[undart]                           Char(3)			NOT NULL Default '', 
[caninv]                           Numeric(14,0)	NOT NULL Default 0, 
[ucoart]                           Numeric(14,0)	NOT NULL Default 0, 
[fecha]                            DateTime			NOT NULL Default GetDate(), 
[codusu]                           nvarchar(10)		NOT NULL Default '', 
[fecsys]                           DateTime			NOT NULL Default GetDate(), 
[descrip]                          nvarchar(max)	NOT NULL Default '', 
[cosart]                           Numeric(14,2)	NOT NULL Default 0, 
[estado]                           Char(1)			NOT NULL Default '', 
[qtypen]                           Numeric(14,4)	NOT NULL Default 0, 
[valart]                           Numeric(14,4)	NOT NULL Default 0
CONSTRAINT [PK_ser_ordendet] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[tipdoc] ASC,
	[numord] ASC,
	[codart] ASc,
	[item]	 asc
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
End 
GO

--Ing. Luis Dominguez 2019-03-27
if not exists ( select * from sys.tables where name = N'Ser_acta')
Begin 
	 CREATE TABLE [Ser_acta] (
	[idemp]							   char(3)			NOT NULL,
	[codcto]                           Char(3)			NOT NULL,
	[nroacta]                          nvarchar(10) 	NOT NULL,
	[orden]                            nvarchar(10)		NOT NULL,
	[codart]                           nvarchar(10) 	NOT NULL,  
	[item]							   numeric(10,0)	NOT NULL,
	[noracta]                          nvarchar(10)		NOT NULL DEFAULT '', 
	[fecha]                            DateTime			NOT NULL DEFAULT GETDATE(), 
	[observa]                          nvarchar(max)	NOT NULL DEFAULT '', 
	[cdoart]                           nvarchar(10)		NOT NULL DEFAULT '', 
	[qtyart]                           Numeric(14,4)	NOT NULL DEFAULT 0, 
	[valart]                           Numeric(14,4)	NOT NULL DEFAULT 0, 
	[fecsys]                           DateTime			NOT NULL DEFAULT GETDATE(), 
	[codusu]                           nvarchar(10)		NOT NULL DEFAULT '', 
	[estado]                           Char(1)			NOT NULL DEFAULT '', 
	CONSTRAINT [PK_Ser_acta] PRIMARY KEY CLUSTERED 
	(
	[idemp] ASC,
	[codcto] ASC,
	[nroacta] ASC,
	[orden] ASC,
	[codart] ASc,
	[item]	 asc
	
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] 
	)
End
GO 


IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_movcoti')
begin 
CREATE TABLE [dbo].[ven_movcoti](
	[idemp]		[nvarchar](3) NOT NULL default '',
	[codcto]	[nvarchar](3) NOT NULL default '',
	[nitcli]	[nvarchar](15) NOT NULL default '',
	[docven]	[nvarchar](8) NOT NULL default '',
	[tipdoc]	[nvarchar](2) NOT NULL default '',
	[fecven]	[date]		  NOT NULL default ''	,
	[afecen]	[nvarchar](3) NOT NULL default '',
	[afetip]	[nvarchar](2) NOT NULL default '',
	[afedoc]	[nvarchar](8) NOT NULL default '',
	[debven]	[decimal](14, 2) NOT NULL default 0,
	[creven]	[decimal](14, 2) NOT NULL default 0,
	[fecsys]	[datetime] NOT NULL default '',
	[codusu]	[nvarchar](8) NOT NULL default '',
	[estmov]	[nvarchar](1) NOT NULL default '',
	[item]		[numeric](10) NOT NULL default 0,
	[servidor]	[nvarchar](60) NOT NULL default '',
	[codusumod] [nvarchar](15) NOT NULL default '',
	[codusuanul] [nvarchar](15) NOT NULL default '',
	[fecsysanul] [datetime] NOT NULL default '1900-01-01'
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_factura')
begin 
CREATE TABLE [dbo].[fe_factura](
	[IdEmp]							[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]						[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]							[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]						[nvarchar](10)	NOT NULL DEFAULT '',
	[item]							[numeric](10)	NOT NULL DEFAULT 0,
	[contidaddecimales]				[nvarchar](1)	NOT NULL DEFAULT '',
	[consecutivodocumento]			[nvarchar](20)	NOT NULL DEFAULT '',
	[FechaEmision]					[nvarchar](19)	NOT NULL DEFAULT '',
	[Fechafinperiodofacturacion]	[nvarchar](19)	NOT NULL DEFAULT '',
	[Fechainicioperiodofacturacion]	[nvarchar](19)	NOT NULL DEFAULT '',
	[Fechavencimiento]				[nvarchar](19)	NOT NULL DEFAULT '',
	[informacionadicional]			[nvarchar](max)	NOT NULL DEFAULT '',
	[moneda]						[nvarchar](3)	NOT NULL DEFAULT '',
	[propina]						[nvarchar](21)	NOT NULL DEFAULT '',
	[rangodenumeracion]				[nvarchar](21)	NOT NULL DEFAULT '',
	[redondeoaplicado]				[nvarchar](21)	NOT NULL DEFAULT '',
	[tipodocumento]					[nvarchar](2)	NOT NULL DEFAULT '',
	[tipooperacion]					[nvarchar](4)	NOT NULL DEFAULT '',
	[totalbaseimponible]			[nvarchar](21)	NOT NULL DEFAULT '',
	[totalbrutoconimpuesto]			[nvarchar](21)	NOT NULL DEFAULT '',
	[totalcargosaplicados]			[nvarchar](21)	NOT NULL DEFAULT '',
	[totaldescuentos]				[nvarchar](21)	NOT NULL DEFAULT '',
	[totalmonto]					[nvarchar](21)	NOT NULL DEFAULT '',
	[totalproductos]				[nvarchar](5)	NOT NULL DEFAULT '',
	[totalsinimpuestos]				[nvarchar](21)	NOT NULL DEFAULT '',
	[estado]						[nvarchar](1)	NOT NULL DEFAULT '',
	[fecsys]						[datetime]		NOT NULL DEFAULT getdate(),
	[estelec]						[int]			NOT NULL DEFAULT 0,
	[docelec]						[nvarchar](20)	NOT NULL DEFAULT '',
	[cufe]							[nvarchar](100)	NOT NULL DEFAULT '',
	[fecelc]						[nvarchar](20)	NOT NULL DEFAULT '',
	[mensaje]						[nvarchar](max)	NOT NULL DEFAULT '',
	[resultado]						[nvarchar](max)	NOT NULL DEFAULT '',
	[xml]							[nvarchar](max)	NOT NULL DEFAULT '',
	[prefijo]						[nvarchar](10)	NOT NULL DEFAULT '',
	[Rangoini]						[nvarchar](10)	NOT NULL DEFAULT '',
	[qr]							[nvarchar](max)	NOT NULL DEFAULT '',
	[tipocufe]						[nvarchar](50)	NOT NULL DEFAULT ''
	
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_cargosdescuentos')
begin 
CREATE TABLE [dbo].[fe_cargosdescuentos](
	[IdEmp]			[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]		[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]			[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]		[nvarchar](10)	NOT NULL DEFAULT '',
	[item]			[numeric](10)	NOT NULL DEFAULT 0,
	[codigo]		[nvarchar](2)	NOT NULL DEFAULT '',
	[descripcion]	[nvarchar](max)	NOT NULL DEFAULT '',
	[indicador]		[nvarchar](1)	NOT NULL DEFAULT '',
	[monto]			[nvarchar](21)	NOT NULL DEFAULT '',
	[montobase]		[nvarchar](21)	NOT NULL DEFAULT '',
	[porcentaje]	[nvarchar](8)	NOT NULL DEFAULT '',
	[secuencia]		[nvarchar](3)	NOT NULL DEFAULT '',
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='FE_Cliente')
begin 
CREATE TABLE [dbo].[FE_Cliente](
	[IdEmp]						[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]					[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]						[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]					[nvarchar](10)	NOT NULL DEFAULT '',
	[item]						[numeric](10)	NOT NULL DEFAULT 0,
	[apellido]					[nvarchar](50)	NOT NULL DEFAULT '',
	[nombrecomercial]			[nvarchar](250) NOT NULL DEFAULT '',
	[nombrerazonsocial]			[nvarchar](250) NOT NULL DEFAULT '',
	[notificar]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numerodocumento]			[nvarchar](12)	NOT NULL DEFAULT '',
	[numeroidentificacionDV]	[nvarchar](2)	NOT NULL DEFAULT '',
	[segundonombre]				[nvarchar](50)	NOT NULL DEFAULT '',
	[telefono]					[nvarchar](20)	NOT NULL DEFAULT '',
	[telefax]					[nvarchar](20)	NOT NULL DEFAULT '',
	[tipoidentificacion]		[nvarchar](2)	NOT NULL DEFAULT '',
	[tipopersona]				[nvarchar](1)	NOT NULL DEFAULT '',
	[email]						[nvarchar](200)	NOT NULL DEFAULT ''
	
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='FE_FacturaDetalle')
begin 
CREATE TABLE [dbo].[FE_FacturaDetalle](
	[IdEmp]						[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]					[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]						[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]					[nvarchar](10)	NOT NULL DEFAULT '',
	[item]						[numeric](10)	NOT NULL DEFAULT 0,
	[cantidadreal]				[nvarchar](6)	NOT NULL DEFAULT '',
	[cantidadrealunidadmedida]	[nvarchar](6)	NOT NULL DEFAULT '',
	[cantidadunidades]			[nvarchar](6)	NOT NULL DEFAULT '',
	[codigoproducto]			[nvarchar](50)	NOT NULL DEFAULT '',
	[descripcion]				[nvarchar](250)	NOT NULL DEFAULT '',
	[estandarcodigo]			[nvarchar](3)	NOT NULL DEFAULT '',
	[estandarcodigoproducto]	[nvarchar](3)	NOT NULL DEFAULT '',
	[nota]						[nvarchar](100)	NOT NULL DEFAULT '',
	[preciototal]				[nvarchar](21)	NOT NULL DEFAULT '',
	[preciototalsinimpuestos]	[nvarchar](21)	NOT NULL DEFAULT '',
	[precioventaunitario]		[nvarchar](21)	NOT NULL DEFAULT '',
	[secuencia]					[nvarchar](4)	NOT NULL DEFAULT '',
	[unidadmedida]				[nvarchar](3)	NOT NULL DEFAULT '',
	[fecsys]					[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_destinatario')
begin 
CREATE TABLE [dbo].[fe_destinatario](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[item]					[numeric](10)	NOT NULL DEFAULT 0,
	[canaldeentrega]		[nvarchar](1)	NOT NULL DEFAULT '',
	[email]					[nvarchar](250)	NOT NULL DEFAULT '',
	[nitproveedorreceptor]	[nvarchar](6)	NOT NULL DEFAULT '',
	[telefono]				[nvarchar](20)	NOT NULL DEFAULT '',
	[fecsys]				[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_documentoreferenciado')
begin 
CREATE TABLE [dbo].[fe_documentoreferenciado](
	[IdEmp]						[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]					[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]						[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]					[nvarchar](10)	NOT NULL DEFAULT '',
	[item]						[numeric] (10)	NOT NULL DEFAULT 0,
	[codigoestatusdocumento]	[nvarchar](1)	NOT NULL DEFAULT '',
	[codigointerno]				[nvarchar](1)	NOT NULL DEFAULT '',
	[cufedocreferenciado]		[nvarchar](200)	NOT NULL DEFAULT '',
	[descripcion]				[nvarchar](250)	NOT NULL DEFAULT '',
	[fecha]						[nvarchar](10)	NOT NULL DEFAULT '',
	[numerodocumento]			[nvarchar](20)	NOT NULL DEFAULT '',
	[tipocufe]					[nvarchar](11)	NOT NULL DEFAULT '',
	[fecsys]					[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_facturaimpuestos')
begin 
CREATE TABLE [dbo].[fe_facturaimpuestos](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[item]					[numeric] (10)	NOT NULL DEFAULT 0,
	[baseimponibletotalimp]	[nvarchar](21)	NOT NULL DEFAULT '',
	[codigototalimp]		[nvarchar](5)	NOT NULL DEFAULT '',
	[controlinterno]		[nvarchar](1)	NOT NULL DEFAULT '',
	[porcentajetotalimp]	[nvarchar](5)	NOT NULL DEFAULT '',
	[unidadmedida]			[nvarchar](5)	NOT NULL DEFAULT '',
	[unidadmedidatributo]	[nvarchar](5)	NOT NULL DEFAULT '',
	[valortotalimp]			[nvarchar](21)	NOT NULL DEFAULT '',
	[valortritutounidad]	[nvarchar](21)	NOT NULL DEFAULT '',
	[fecsys]				[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_impustostotales')
begin 
CREATE TABLE [dbo].[fe_impustostotales](
	[IdEmp]				[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]			[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]				[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]			[nvarchar](10)	NOT NULL DEFAULT '',
	[item]				[numeric] (10)	NOT NULL DEFAULT 0,
	[codigototalimp]	[nvarchar](5)	NOT NULL DEFAULT '',
	[montototal]		[nvarchar](21)	NOT NULL DEFAULT '',
	[fechavencimiento]	[nvarchar](19)	NOT NULL DEFAULT '',
	[fecsys]			[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_mediopago')
begin 
CREATE TABLE [dbo].[fe_mediopago](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[item]					[numeric] (10)	NOT NULL DEFAULT 0,
	[fechavencimiento]		[nvarchar](19)	NOT NULL DEFAULT '',
	[mediodepago]			[nvarchar](2)	NOT NULL DEFAULT '',
	[metododepago]			[nvarchar](2)	NOT NULL DEFAULT '',
	[numerodereferencia]	[nvarchar](200)	NOT NULL DEFAULT '',
	[fecsys]				[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_direccion')
begin 
CREATE TABLE [dbo].[fe_direccion](
	[IdEmp]					[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]				[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]					[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]				[nvarchar](10)	NOT NULL DEFAULT '',
	[item]					[numeric] (10)	NOT NULL DEFAULT 0,
	[ciudad]				[nvarchar](50)	NOT NULL DEFAULT '',
	[codigodepartamento]	[nvarchar](5)	NOT NULL DEFAULT '',
	[departamento]			[nvarchar](50)	NOT NULL DEFAULT '',
	[direccion]				[nvarchar](100)	NOT NULL DEFAULT '',
	[lenguaje]				[nvarchar](2)	NOT NULL DEFAULT '',
	[municipio]				[nvarchar](50)	NOT NULL DEFAULT '',
	[pais]					[nvarchar](2)	NOT NULL DEFAULT '',
	[zonapostal]			[nvarchar](10)	NOT NULL DEFAULT '',
	[fecsys]				[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_informacionlegalcliente')
begin 
CREATE TABLE [dbo].[fe_informacionlegalcliente](
	[IdEmp]						[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]					[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]						[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]					[nvarchar](10)	NOT NULL DEFAULT '',
	[item]						[numeric] (10)	NOT NULL DEFAULT 0,
	[nombreregistrotrut]		[nvarchar](250)	NOT NULL DEFAULT '',
	[numeroidentificacion]		[nvarchar](15)	NOT NULL DEFAULT '',
	[numeroidentificaciondv]	[nvarchar](2)	NOT NULL DEFAULT '',
	[tipoidentificacion]		[nvarchar](2)	NOT NULL DEFAULT '',
	[fecsys]					[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_tributos')
begin 
CREATE TABLE [dbo].[fe_tributos](
	[IdEmp]				[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]			[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]				[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]			[nvarchar](10)	NOT NULL DEFAULT '',
	[item]				[numeric] (10)	NOT NULL DEFAULT 0,
	[codigoimpuesto]	[nvarchar](2)	NOT NULL DEFAULT '',
	[fecsys]			[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_obligaciones')
begin 
CREATE TABLE [dbo].[fe_obligaciones](
	[IdEmp]			[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]		[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]			[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]		[nvarchar](10)	NOT NULL DEFAULT '',
	[item]			[numeric] (10)	NOT NULL DEFAULT 0,
	[obligaciones]	[nvarchar](7)	NOT NULL DEFAULT '',
	[regimen]		[nvarchar](2)	NOT NULL DEFAULT '',
	[fecsys]		[datetime]		NOT NULL DEFAULT getdate()
)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='Glb_TasaInte')
begin 
CREATE TABLE [dbo].[Glb_TasaInte](
	[fecini]		[date],
	[fecfin]		[date],
	[tasa]			[decimal](8,2)	NOT NULL DEFAULT 0)
end 
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_asociado')
begin 
CREATE TABLE [dbo].[glb_asociado](
	[nitter]		[nvarchar](15)		NOT NULL,
	[nomter]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_nomter]  DEFAULT (''),
	[tipter]		[decimal](1, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_tipter]  DEFAULT ((0)),
	[divter]		[nvarchar](1)		NOT NULL CONSTRAINT [DF_glb_asociado_divter]  DEFAULT (''),
	[clater]		[decimal](1, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_clater]  DEFAULT ((0)),
	[terotr]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_terotr]  DEFAULT ((0)),
	[terven]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_terven]  DEFAULT ((0)),
	[teremp]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_teremp]  DEFAULT ((0)),
	[terpro]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_terpro]  DEFAULT ((0)),
	[tercli]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_tercli]  DEFAULT ((0)),
	[tercob]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_tercob]  DEFAULT ((0)),
	[telter]		[decimal](15, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_telter]  DEFAULT ((0)),
	[dirter]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_dirter]  DEFAULT (''),
	[dirter2]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_dirter2]  DEFAULT (''),
	[ciuter]		[nvarchar](20)		NULL CONSTRAINT [DF_glb_asociado_ciuter]  DEFAULT ('0'),
	[idusu]			[nvarchar](10)		NOT NULL CONSTRAINT [DF_glb_asociado_idusu]  DEFAULT (''),
	[fecsys]		[datetime]			NOT NULL CONSTRAINT [DF_glb_asociado_fecsys]  DEFAULT (getdate()),
	[iva]			[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_iva]  DEFAULT ((0)),
	[contacto]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_contacto]  DEFAULT (''),
	[celular]		[nvarchar](100)		NULL CONSTRAINT [DF_glb_asociado_celular]  DEFAULT (''),
	[fax]			[decimal](15, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_fax]  DEFAULT ((0)),
	[descrip]		[nvarchar](max)		NULL CONSTRAINT [DF_glb_asociado_descrip]  DEFAULT (''),
	[codpro]		[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_codpro]  DEFAULT (''),
	[rango]			[decimal](1, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_rango]  DEFAULT ((0)),
	[codgru]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_codgru]  DEFAULT (''),
	[codigo]		[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_codigo]  DEFAULT (''),
	[fecnac]		[date]				NOT NULL CONSTRAINT [DF_glb_asociado_fecnac]  DEFAULT (getdate()),
	[mail]			[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_mail]  DEFAULT (''),
	[sexo]			[decimal](1, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_sexo]  DEFAULT ((0)),
	[web]			[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_web]  DEFAULT (''),
	[lista]			[decimal](1, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_lista]  DEFAULT ((0)),
	[arp]			[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_arp]  DEFAULT ((0)),
	[cesantia]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_cesantia]  DEFAULT ((0)),
	[codest]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_codest]  DEFAULT (''),
	[conduc]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_conduc]  DEFAULT ((0)),
	[eps]			[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_eps]  DEFAULT ((0)),
	[pension]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_pension]  DEFAULT ((0)),
	[barrio]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_barrio]  DEFAULT (''),
	[ocupacion]		[nvarchar](150)		NOT NULL CONSTRAINT [DF_glb_asociado_ocupacion]  DEFAULT (''),
	[apellido1]		[nvarchar](100)		NULL CONSTRAINT [DF_glb_asociado_apellido1]  DEFAULT (''),
	[apellido2]		[nvarchar](100)		NULL CONSTRAINT [DF_glb_asociado_apellido2]  DEFAULT (''),
	[cupocre]		[decimal](12, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_cupocre]  DEFAULT ((0)),
	[diasvenc]		[decimal](3, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_diasvenc]  DEFAULT ((0)),
	[dptoter]		[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_dptoter]  DEFAULT (''),
	[nombre1]		[nvarchar](100)		NULL CONSTRAINT [DF_glb_asociado_nombre1]  DEFAULT (''),
	[otros]			[nvarchar](100)		NULL CONSTRAINT [DF_glb_asociado_otros]  DEFAULT (''),
	[sector]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_sector]  DEFAULT (''),
	[tipid]			[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_tipid]  DEFAULT (''),
	[vendedor]		[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_vendedor]  DEFAULT (''),
	[activo]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_activo]  DEFAULT ((0)),
	[civil]			[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_civil]  DEFAULT (''),
	[codbar]		[nvarchar](25)		NOT NULL CONSTRAINT [DF_glb_asociado_codbar]  DEFAULT (''),
	[codtipo]		[nvarchar](4)		NOT NULL CONSTRAINT [DF_glb_asociado_codtipo]  DEFAULT (''),
	[foto]			[nvarchar](254)		NOT NULL CONSTRAINT [DF_glb_asociado_foto]  DEFAULT (''),
	[lugexp]		[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_lugexp]  DEFAULT (''),
	[lugnac]		[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_lugnac]  DEFAULT (''),
	[otrosest]		[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_otrosest]  DEFAULT (''),
	[porcom]		[decimal](6, 2)		NOT NULL CONSTRAINT [DF_glb_asociado_porcom]  DEFAULT ((0)),
	[primaria]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_primaria]  DEFAULT ((0)),
	[secundaria]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_secundaria]  DEFAULT ((0)),
	[terprof]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_terprof]  DEFAULT ((0)),
	[zona]			[nvarchar](4)		NOT NULL CONSTRAINT [DF_glb_asociado_zona]  DEFAULT ('0'),
	[cedulafiad]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafiad]  DEFAULT (''),
	[cedulafia2]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafia2]  DEFAULT (''),
	[celfiad1]		[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_celfiad1]  DEFAULT (''),
	[celfiad2]		[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_celfiad2]  DEFAULT (''),
	[cuota]			[decimal](14, 2)	NOT NULL CONSTRAINT [DF_glb_asociado_cuota]  DEFAULT ((0)),
	[dirfiad1]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_dirfiad1]  DEFAULT (''),
	[dirfiad2]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_dirfiad2]  DEFAULT (''),
	[dirter3]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_dirter3]  DEFAULT (''),
	[nombrefiad]	[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefiad]  DEFAULT (''),
	[nombrefia2]	[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefia2]  DEFAULT (''),
	[telfiad1]		[decimal](20, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_telfiad1]  DEFAULT ((0)),
	[telfiad2]		[decimal](20, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_telfiad2]  DEFAULT ((0)),
	[telter2]		[decimal](15, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_telter2]  DEFAULT ((0)),
	[ucmpmcl]		[date]				NOT NULL CONSTRAINT [DF_glb_asociado_ucmpmcl]  DEFAULT (getdate()),
	[ucmvmcl]		[decimal](14, 2)	NOT NULL CONSTRAINT [DF_glb_asociado_ucmvmcl]  DEFAULT ((0)),
	[upgomcl]		[date]				NOT NULL CONSTRAINT [DF_glb_asociado_upgomcl]  DEFAULT (getdate()),
	[upgvmcl]		[decimal](14, 2)	NOT NULL CONSTRAINT [DF_glb_asociado_upgvmcl]  DEFAULT ((0)),
	[cupo]			[decimal](12, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_cupo]  DEFAULT ((0)),
	[cedulafia3]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafia3]  DEFAULT (''),
	[diacobro1]		[decimal](2, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_diacobro1]  DEFAULT ((0)),
	[diacobro2]		[decimal](2, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_diacobro2]  DEFAULT ((0)),
	[fcobro]		[date]				NOT NULL CONSTRAINT [DF_glb_asociado_fcobro]  DEFAULT (getdate()),
	[finicial]		[date]				NOT NULL CONSTRAINT [DF_glb_asociado_finicial]  DEFAULT (getdate()),
	[nombrefia3]	[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefia3]  DEFAULT (''),
	[periodo]		[decimal](1, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_periodo]  DEFAULT ((0)),
	[vrcuota]		[decimal](14, 2)	NOT NULL CONSTRAINT [DF_glb_asociado_vrcuota]  DEFAULT ((0)),
	[vrinicial]		[decimal](14, 2)	NOT NULL CONSTRAINT [DF_glb_asociado_vrinicial]  DEFAULT ((0)),
	[codcargo]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_codcargo]  DEFAULT ('0'),
	[codhobby]		[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_codhobby]  DEFAULT ('0'),
	[codprof]		[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_codprof]  DEFAULT ('0'),
	[empresa]		[nvarchar](250)		NULL CONSTRAINT [DF_glb_asociado_empresa]  DEFAULT (''),
	[hijos]			[decimal](2, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_hijos]  DEFAULT ((0)),
	[sueldo]		[decimal](10, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_sueldo]  DEFAULT ((0)),
	[fcobroseg]		[date]				NOT NULL CONSTRAINT [DF_glb_asociado_fcobroseg]  DEFAULT (getdate()),
	[cedulafia4]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafia4]  DEFAULT (''),
	[celfiad3]		[nvarchar](20)		NOT NULL CONSTRAINT [DF_glb_asociado_celfiad3]  DEFAULT (''),
	[dirfiad3]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_dirfiad3]  DEFAULT (''),
	[nombrefia4]	[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefia4]  DEFAULT (''),
	[telfiad3]		[nvarchar](20)		NOT NULL CONSTRAINT [DF_glb_asociado_telfiad3]  DEFAULT (''),
	[act_eco]		[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_act_eco]  DEFAULT (''),
	[ciiu]			[decimal](4, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_ciiu]  DEFAULT ((0)),
	[estrato]		[decimal](1, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_estrato]  DEFAULT ((0)),
	[fec_exp]		[date]				NOT NULL CONSTRAINT [DF_glb_asociado_fec_exp]  DEFAULT (getdate()),
	[inicio_labora] [date]				NOT NULL CONSTRAINT [DF_glb_asociado_inicio_labora]  DEFAULT (getdate()),
	[nit_empresa]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_nit_empresa]  DEFAULT (''),
	[niv_est]		[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_niv_est]  DEFAULT (''),
	[per_cargo]		[decimal](3, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_per_cargo]  DEFAULT ((0)),
	[tip_contrato]	[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_tip_contrato]  DEFAULT (''),
	[tercon]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_tercon]  DEFAULT ((0)),
	[ocultaremi]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_ocultaremi]  DEFAULT ((0)),
	[cedulafia5]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafia5]  DEFAULT (''),
	[cedulafia6]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafia6]  DEFAULT (''),
	[nombrefia5]	[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefia5]  DEFAULT (''),
	[nombrefia6]	[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefia6]  DEFAULT (''),
	[datacredito]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_datacredito]  DEFAULT ((0)),
	[datacredi2]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_datacredi2]  DEFAULT ((0)),
	[datacredi3]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_datacredi3]  DEFAULT ((0)),
	[diremp]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_diremp]  DEFAULT (''),
	[telemp]		[nvarchar](20)		NOT NULL CONSTRAINT [DF_glb_asociado_telemp]  DEFAULT (''),
	[contac]		[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_contac]  DEFAULT (''),
	[clasiven]		[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_clasiven]  DEFAULT ('0'),
	[codconcepto]	[nvarchar](2)		NOT NULL CONSTRAINT [DF_glb_asociado_codconcepto]  DEFAULT (''),
	[guia]			[nvarchar](16)		NOT NULL CONSTRAINT [DF_glb_asociado_guia]  DEFAULT (''),
	[codpais]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_codpais]  DEFAULT ('0'),
	[obsequio]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_obsequio]  DEFAULT ((0)),
	[qtyobsequi]	[decimal](14, 0)	NOT NULL CONSTRAINT [DF_glb_asociado_qtyobsequi]  DEFAULT ((0)),
	[montorf]		[decimal](14, 2)	NOT NULL CONSTRAINT [DF_glb_asociado_montorf]  DEFAULT ((0)),
	[porrefte]		[decimal](12, 4)	NOT NULL CONSTRAINT [DF_glb_asociado_porrefte]  DEFAULT ((0)),
	[porrica]		[decimal](12, 4)	NOT NULL CONSTRAINT [DF_glb_asociado_porrica]  DEFAULT ((0)),
	[porriva]		[decimal](12, 4)	NOT NULL CONSTRAINT [DF_glb_asociado_porriva]  DEFAULT ((0)),
	[rfuente]		[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_rfuente]  DEFAULT ((0)),
	[rica]			[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_rica]  DEFAULT ((0)),
	[riva]			[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_riva]  DEFAULT ((0)),
	[formato]		[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_formato]  DEFAULT (''),
	[estado]		[nvarchar](1)		NOT NULL CONSTRAINT [DF_glb_asociado_estado]  DEFAULT (''),
	[nrotarjeta]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_nrotarjeta]  DEFAULT (''),
	[cmprfuente]	[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_cmprfuente]  DEFAULT (''),
	[cmprica]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_cmprica]  DEFAULT (''),
	[cmpriva]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_cmpriva]  DEFAULT (''),
	[nombrefiad2]	[nvarchar](40)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefiad2]  DEFAULT (''),
	[nombrefiad3]	[nvarchar](60)		NOT NULL CONSTRAINT [DF_glb_asociado_nombrefiad3]  DEFAULT (''),
	[cedulafiad2]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafiad2]  DEFAULT (''),
	[cedulafiad3]	[nvarchar](15)		NOT NULL CONSTRAINT [DF_glb_asociado_cedulafiad3]  DEFAULT (''),
	[datacredito1]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_datacredito1]  DEFAULT ((0)),
	[datacredito2]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_datacredito2]  DEFAULT ((0)),
	[comporta]		[nvarchar](max)		NOT NULL CONSTRAINT [DF_glb_asociado_comporta]  DEFAULT (''),
	[dctoter]		[decimal](6, 2)		NOT NULL CONSTRAINT [DF_glb_asociado_dctoter]  DEFAULT ((0)),
	[diascart]		[decimal](3, 0)		NOT NULL CONSTRAINT [DF_glb_asociado_diascart]  DEFAULT ((0)),
	[cmpcree]		[nvarchar](3)		NOT NULL CONSTRAINT [DF_glb_asociado_cmpcree]  DEFAULT (''),
	[rcree]			[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_rcree]  DEFAULT ((0)),
	[Terinactivo]	[bit]				NOT NULL DEFAULT ((0)),
	[codctoter]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[terbloq]		[bit]				NOT NULL DEFAULT ((0)),
	[poliza]		[bit]				NOT NULL DEFAULT ((0)),
	[clasiven2]		[nvarchar](2)		NOT NULL DEFAULT (''),
	[clasiven3]		[nvarchar](2)		NOT NULL DEFAULT (''),
	[aplimercha]	[bit]				NOT NULL DEFAULT ((0)),
	[PorVtaCree]	[numeric](8, 0)		NOT NULL DEFAULT ((0)),
	[nomcom]		[nvarchar](100)		NULL DEFAULT (''),
	[Codeudor]		[bit]				NOT NULL DEFAULT ((0)),
	[asociado]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[rlegal]		[nvarchar](200)		NOT NULL DEFAULT (''),
	[fechaexp]		[date]				NOT NULL DEFAULT (getdate()),
	[lugarexp]		[nvarchar](100)		NOT NULL DEFAULT (''),
	[nombreemp]		[nvarchar](200)		NOT NULL DEFAULT (''),
	[diremp2]		[nvarchar](100)		NOT NULL DEFAULT (''),
	[mailemp]		[nvarchar](100)		NOT NULL DEFAULT (''),
	[telemp2]		[nvarchar](100)		NOT NULL DEFAULT (''),
	[dptoemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[ciuemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[paisemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[depemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[secemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[ocupaemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[profeemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[ingreemp]		[decimal](14, 4)	NOT NULL DEFAULT ((0)),
	[pagoemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[contraemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[nivelingemp]	[nvarchar](3)		NOT NULL DEFAULT (''),
	[foto2]			[nvarchar](300)		NOT NULL DEFAULT (''),
	[firma]			[nvarchar](200)		NOT NULL DEFAULT (''),
	[acta]			[nvarchar](50)		NOT NULL DEFAULT (''),
	[fecing]		[date]				NOT NULL DEFAULT (getdate()),
	[fecren]		[date]				NOT NULL DEFAULT (getdate()),
	[delegado]		[bit]				NOT NULL DEFAULT ((0)),
	[curso]			[bit]				NOT NULL DEFAULT ((0)),
	[grupo]			[nvarchar](6)		NULL DEFAULT (''),
	[organizmo]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[codemp]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[socio]			[bit]				NOT NULL DEFAULT ((0)),
	[servidor]		[nvarchar](60)		NOT NULL DEFAULT (''),
	[codusumod]		[nvarchar](15)		NOT NULL DEFAULT (''),
	[codusu]		[nvarchar](15)		NOT NULL DEFAULT (''),
	[docdelete]		[bit]				NOT NULL DEFAULT ((0)),
	[modificadoc]	[numeric](10, 0)	NOT NULL DEFAULT ((0)),
	[codre]			[nvarchar](3)		NULL DEFAULT (''),
	[ftitular]		[bit]				NOT NULL DEFAULT ((0)),
	[fconjuntas]	[bit]				NOT NULL DEFAULT ((0)),
	[falternas]		[bit]				NOT NULL DEFAULT ((0)),
	[fsellos]		[bit]				NOT NULL DEFAULT ((0)),
	[nomeps]		[nvarchar](50)		NOT NULL DEFAULT (''),
	[refid1]		[nvarchar](50)		NOT NULL DEFAULT (''),
	[refid2]		[nvarchar](50)		NOT NULL DEFAULT (''),
	[refid3]		[nvarchar](50)		NOT NULL DEFAULT (''),
	[ref1]			[nvarchar](50)		NOT NULL DEFAULT (''),
	[ref2]			[nvarchar](50)		NOT NULL DEFAULT (''),
	[ref3]			[nvarchar](50)		NOT NULL DEFAULT (''),
	[estaso]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[tipaso]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[tipoviv]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[nivedu]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[fecingemp]		[date]				NULL,
	[deteps]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[fecact]		[date]				NULL,
	[nitref]		[nvarchar](20)		NOT NULL DEFAULT (''),
	[nomref]		[nvarchar](50)		NOT NULL DEFAULT (''),
	[actividadeco]	[nvarchar](3)		NOT NULL DEFAULT (''),
	[nitrl]			[nvarchar](20)		NOT NULL DEFAULT (''),
	[dirrl]			[nvarchar](30)		NOT NULL DEFAULT (''),
	[telrl]			[nvarchar](30)		NOT NULL DEFAULT (''),
	[fecharl]		[date]				NOT NULL DEFAULT (''),
	[tesororl]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[actorl]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[regimen]		[nvarchar](3)		NOT NULL DEFAULT (''),
	[deporte]		[nvarchar](50)		NOT NULL DEFAULT (''),
	[declaracion]	[nvarchar](250)		NULL DEFAULT (''),
	[aprobacion]	[bit]				NOT NULL DEFAULT ((0)),
	[rtipid]		[varchar](100)		NOT NULL DEFAULT (''),
	[rNitTer]		[varchar](100)		NOT NULL DEFAULT (''),
	[rapellido1]	[varchar](100)		NOT NULL DEFAULT (''),
	[rApellido2]	[varchar](100)		NOT NULL DEFAULT (''),
	[rNombre1]		[varchar](100)		NOT NULL DEFAULT (''),
	[rotros]		[varchar](100)		NOT NULL DEFAULT (''),
	[rDirter]		[varchar](100)		NOT NULL DEFAULT (''),
	[rTelter]		[varchar](100)		NOT NULL DEFAULT (''),
	[porrecaudo]	[decimal](14, 2)	NOT NULL DEFAULT ((0)),
	[puntos]		[bit]				NOT NULL DEFAULT ((0)),
	[tipoper]		[bit]				NOT NULL DEFAULT ((0)),
	[enviarfac]		[bit]				NOT NULL DEFAULT ((0)),
	[mujerfamilia]	[bit]				NOT NULL DEFAULT ((0)),
	[observater]	[nvarchar](250)		NOT NULL CONSTRAINT [DF_glb_asociado_observater]  DEFAULT (''),
	[terregimpo]	[bit]				NOT NULL CONSTRAINT [DF_glb_asociado_terregimpo]  DEFAULT ((0)),
	[responsabilidad] [nvarchar](10)	NOT NULL CONSTRAINT [DF_glb_asociado_responsabilidad]  DEFAULT (''),
	[regimen_fe]	[nvarchar](20)		NOT NULL CONSTRAINT [DF_glb_asociado_regimen_fe]  DEFAULT (''),
	[zonapostal]	[nvarchar](10)		NOT NULL CONSTRAINT [DF_glb_asociado_zonapostal]  DEFAULT (''),
	[refid4]		[nvarchar](50)		NOT NULL DEFAULT (''),
	[ref4]			[nvarchar](50)		NOT NULL DEFAULT (''),
	[observafirma]	[nvarchar](250)		NOT NULL DEFAULT ('')
	)
end 
GO
------01-07-2020 Shirley Rojas B. Desarrollo Realizado por Arnold Sandoval
IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_Extras')
begin 
  CREATE TABLE [dbo].[fe_Extras](
	[IdEmp] [nvarchar](3) NULL,
	[codcto] [nvarchar](3) NULL,
	[tipo] [nvarchar](2) NULL,
	[numero] [nvarchar](10) NULL,	
	[controlInterno1] [varchar](100) NULL,
	[controlInterno2] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[pdf] [varchar](1) NULL,
	[valor] [varchar](50) NULL,
	[xml] [varchar](50) NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[fe_Extras] ADD  DEFAULT ('443') FOR [nombre]
ALTER TABLE [dbo].[fe_Extras] ADD  DEFAULT ('1') FOR [pdf]
ALTER TABLE [dbo].[fe_Extras] ADD  DEFAULT ('1') FOR [xml]
end
GO

SET ANSI_PADDING OFF
GO


------01-07-2020 Shirley Rojas B. Desarrollo Realizado por Arnold Sandoval
IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_ordenDeCompra')
begin 
CREATE TABLE [DBO].[fe_ordenDeCompra]
(
IdEmp NVARCHAR(3),
codcto NVARCHAR(3),
tipo NVARCHAR(2),
numero NVARCHAR(10),
codigoCliente VARCHAR(20),
fecha date,
numeroOrden VARCHAR(20),
numeroPedido VARCHAR(20),
tipoCUFE VARCHAR(20),
tipoOrden VARCHAR (20),
uuid VARCHAR(90),item varchar(10)
)
end
GO
------01-07-2020 Shirley Rojas B. Desarrollo Realizado por Arnold Sandoval
IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_LineaInformacionAdicional')
begin 
CREATE TABLE [DBO].[fe_LineaInformacionAdicional]
(
IdEmp NVARCHAR(3) DEFAULT (''),
codcto NVARCHAR(3) DEFAULT (''),
tipo NVARCHAR(2) DEFAULT (''),
numero NVARCHAR(10) DEFAULT (''),
codigoProducto NVARCHAR(50),
[cantidad] [nvarchar](5) NULL DEFAULT (''),
[codigo] [nvarchar](5) NULL DEFAULT (''),
[codigoInterno1] [nvarchar](100) NULL DEFAULT (''),
[codigoInterno2] [nvarchar](100) NULL DEFAULT (''),
[descripcion] [nvarchar](450) NULL DEFAULT (''),
[fechaFin] [nvarchar](10) NULL DEFAULT (''),
[fechaInicio] [nvarchar](10) NULL DEFAULT (''),
[nombre] [nvarchar](50) NULL DEFAULT (''),
[secuencia] [nvarchar](3) NULL DEFAULT (''),
[valor] [nvarchar](50) NULL DEFAULT (''),item varchar(10)
)
end
GO

------15-07-2020 Shirley Rojas B. Se crea para proceso de Ecommerce del touch autorizado Jennifer R
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_pagpedidos')
begin 
CREATE TABLE [dbo].[ven_pagpedidos](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tippag] [nvarchar](2) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[forpag] [nvarchar](2) NOT NULL,
	[valpag] [decimal](14, 2) NOT NULL,
	[codban] [nvarchar](10) NOT NULL,
	[afedoc] [nvarchar](15) NOT NULL,
	[feccheq] [date] NOT NULL,
	[estcheq] [nvarchar](1) NOT NULL,
	[vrrtecom] [decimal](12, 3) NOT NULL,
	[vrrtefte] [decimal](12, 3) NOT NULL,
	[vrrteica] [decimal](12, 3) NOT NULL,
	[vrrteiva] [decimal](12, 3) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[turno] [decimal](10, 0) NOT NULL,
	[valpropina] [decimal](10, 0) NOT NULL,
	[numrec] [nvarchar](6) NOT NULL,
	[consig] [nvarchar](21) NOT NULL,
        [rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL 
	
 CONSTRAINT [PK_ven_pagpedidos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[tippag] ASC,
	[numdoc] ASC,
        [forpag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end
GO
------16-07-2020 Shirley Rojas B. Se crea para proceso de Fenicio. solicitud Arnold Sandoval
IF NOT EXISTS(Select * From dbo.sysobjects Where name='glb_empmensajeria')
begin 
CREATE TABLE [dbo].[glb_empmensajeria](
[Codemp] [nvarchar](20) NOT NULL,
 [NomEmpresa] [nvarchar](60) NOT NULL,
 [rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 [fecsys] datetime not null DEFAULT getdate() -- Ing. Shirley R 16 Jul 2020 Para Ecommerce Fenicio
CONSTRAINT [PK_glb_empmensajeria] PRIMARY KEY CLUSTERED 
(
	[Codemp] ASC	
       
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
end 
GO
--
/****** Object:  Table [dbo].[ven_prefactpago]    Script Date: 28/07/2020 11:40:56 ******/
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_prefactpago')
begin 
CREATE TABLE [dbo].[ven_prefactpago](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[tipdoc] [nvarchar](2) NOT NULL,
	[numpre] [nvarchar](8) NOT NULL,	
	[item] [numeric](10, 0) NOT NULL,
	[forpag] [nvarchar](2) NOT NULL,
	[valpag] [decimal](14, 2) NOT NULL,
	[codban] [nvarchar](10) NOT NULL,
	[afedoc] [nvarchar](15) NOT NULL,
	[feccheq] [date] NOT NULL,
	[estcheq] [nvarchar](1) NOT NULL,
	[vrrtecom] [decimal](12, 3) NOT NULL,
	[vrrtefte] [decimal](12, 3) NOT NULL,
	[vrrteica] [decimal](12, 3) NOT NULL,
	[vrrteiva] [decimal](12, 3) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[turno] [decimal](10, 0) NOT NULL,
	[valpropina] [decimal](10, 0) NOT NULL,
	[numrec] [nvarchar](6) NOT NULL,
	[consig] [nvarchar](21) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ven_prefactpago] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[tipdoc] ASC,
	[numpre] ASC,	
	[item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
end
GO

------04-08-2020 Yaslen Andrade F. Se crea para proceso de usar varias impresoras para lineas de Produccion de Chicken autorizado Jennifer R
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_imparticulos')
begin 
CREATE TABLE [dbo].[alm_imparticulos](
[idemp] [nvarchar](3) NULL,
	[codart] [nvarchar](10) NOT NULL,
	[itemimp] [nvarchar](2) NOT NULL,
	
) 
end 
GO
---- 21-10-2020 Yaslen Andrade - Tabla creada para el envio de notas fe realizadas en el touch. Solicitado por Jennifer Rodriguez.

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_notdetalle')
begin 
CREATE TABLE [dbo].[ven_notdetalle](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[numcon] [nvarchar](8) NOT NULL,
	[fecmov] [date] NOT NULL,
	[codcon] [nvarchar](2) NOT NULL,
	[codart] [nvarchar](10) NOT NULL,
	[undart] [nvarchar](3) NOT NULL,
	[qtyart] [decimal](14, 2) NOT NULL,
	[cosart] [decimal](14, 2) NOT NULL,
	[valart] [decimal](14, 2) NOT NULL,
	[ivaart] [decimal](14, 2) NOT NULL,
	[totart] [decimal](14, 2) NOT NULL,
	[netart] [decimal](14, 2) NOT NULL,
	[nitter] [nvarchar](15) NOT NULL,
	[itemfac] [numeric](12, 0) NOT NULL,
	[codusu] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ven_notdetalle] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[numcon] ASC,
	[codcon] ASC,	
	[codart] ASC,
	[itemfac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) 
end
GO

--- 26-10-2020 Yaslen Andrade Tabla agregada para enviar valor de domicilio en la factura FE
IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_factcargosdescuentos')
begin 
CREATE TABLE [dbo].[fe_factcargosdescuentos](
	[IdEmp]			[nvarchar](3)	NOT NULL DEFAULT '',
	[codcto]		[nvarchar](3)	NOT NULL DEFAULT '',
	[tipo]			[nvarchar](2)	NOT NULL DEFAULT '',
	[numero]		[nvarchar](10)	NOT NULL DEFAULT '',
	[item]			[numeric](10)	NOT NULL DEFAULT 0,
	[codigo]		[nvarchar](2)	NOT NULL DEFAULT '',
	[descripcion]	[nvarchar](50)	NOT NULL DEFAULT '',
	[indicador]		[nvarchar](1)	NOT NULL DEFAULT '',
	[monto]			[nvarchar](21)	NOT NULL DEFAULT '',
	[montobase]		[nvarchar](21)	NOT NULL DEFAULT '',
	[porcentaje]	[nvarchar](8)	NOT NULL DEFAULT '',
	[secuencia]		[nvarchar](3)	NOT NULL DEFAULT '',
	[secuenciadet]	[nvarchar](4)	NOT NULL DEFAULT '',
)
end 
GO

/****** Object:  Table [dbo].[alm_invecommerce]    Script Date: 15/02/2021 4:32:57 p. m. Campo agregado por Arnold Sandoval para
consolidar el inventario de las tiendas que venden en el ecommerce Fenicio ******/
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_invecommerce')
begin 
CREATE TABLE [dbo].[alm_invecommerce](
	[idemp] [nvarchar](3) NULL,	
	[codart] [nvarchar](10) NOT NULL,
	[caninv] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_caninv]  DEFAULT ((0)),
	[valprom] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_valprom]  DEFAULT ((0)),
	[ucoart] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_ucoart]  DEFAULT ((0)),
	[pvdart] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_pvdart]  DEFAULT ((0)),
	[pveart] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_pveart]  DEFAULT ((0)),
	[pvmart] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_pvmart]  DEFAULT ((0)),
	[pvcart] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_pvcart]  DEFAULT ((0)),
	[pvaart] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_pvaart]  DEFAULT ((0)),
	[pvbart] [decimal](18, 4) NULL CONSTRAINT [DF_alm_invecommerce_pvbart]  DEFAULT ((0)),
	[minart] [decimal](14, 0) NOT NULL CONSTRAINT [DF_alm_invecommerce_minart]  DEFAULT ((0)),
	[maxart] [decimal](14, 0) NOT NULL CONSTRAINT [DF_alm_invecommerce_maxart]  DEFAULT ((0)),
	[utcart] [decimal](10, 3) NOT NULL CONSTRAINT [DF_alm_invecommerce_utcart]  DEFAULT ((0)),
	[utdart] [decimal](10, 3) NOT NULL CONSTRAINT [DF_alm_invecommerce_utdart]  DEFAULT ((0)),
	[uteart] [decimal](10, 3) NOT NULL CONSTRAINT [DF_alm_invecommerce_uteart]  DEFAULT ((0)),
	[frainv] [decimal](12, 2) NOT NULL CONSTRAINT [DF_alm_invecommerce_frainv]  DEFAULT ((0)),
	[qtyfra] [decimal](12, 2) NOT NULL CONSTRAINT [DF_alm_invecommerce_qtyfra]  DEFAULT ((0)),
	[ucompra] [date] NOT NULL CONSTRAINT [DF_alm_invecommerce_ucompra]  DEFAULT (''),
	[unumfac] [nvarchar](10) NOT NULL CONSTRAINT [DF_alm_invecommerce_unumfac]  DEFAULT (''),
	[maxdcto] [decimal](14, 2) NOT NULL CONSTRAINT [DF_alm_invecommerce_maxdcto]  DEFAULT ((0)),
	[diascmp] [decimal](5, 0) NOT NULL CONSTRAINT [DF_alm_invecommerce_diascmp]  DEFAULT ((0)),
	[diaseguri] [decimal](4, 0) NOT NULL CONSTRAINT [DF_alm_invecommerce_diaseguri]  DEFAULT ((0)),
	[fecordcmp] [date] NOT NULL CONSTRAINT [DF_alm_invecommerce_fecordcmp]  DEFAULT (''),
	[tiemped] [nvarchar](4) NOT NULL CONSTRAINT [DF_alm_invecommerce_tiemped]  DEFAULT (''),
	[invdia] [bit] NOT NULL CONSTRAINT [DF_alm_invecommerce_invdia]  DEFAULT ((0)),
	[invmes] [bit] NOT NULL CONSTRAINT [DF_alm_invecommerce_invmes]  DEFAULT ((0)),
	[frecuped] [numeric](2, 0) NOT NULL CONSTRAINT [DF_alm_invecommerce_frecuped]  DEFAULT ((0)),
	[otrgas] [numeric](14, 2) NOT NULL CONSTRAINT [DF_alm_invecommerce_otrgas]  DEFAULT ((0)),
	[artlogistic] [bit] NOT NULL CONSTRAINT [DF_alm_invecommerce_artlogistic]  DEFAULT ((0)),
	[artpromo] [bit] NOT NULL CONSTRAINT [DF_alm_invecommerce_artpromo]  DEFAULT ((0)),	
	[sinexis] [bit] NOT NULL CONSTRAINT [DF__alm_invenecommerce__sinex__250C9AF2]  DEFAULT ((0)),
	[NoApliDcto] [bit] NOT NULL CONSTRAINT [DF__alm_invenecommerce__NoApl__5BED5593]  DEFAULT ((0)),
	[IvaArtCto] [decimal](6, 2) NOT NULL CONSTRAINT [DF__alm_invenecommerce__IvaAr__2745B215]  DEFAULT ((0)),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),
	[codusumod] [nvarchar](15) NOT NULL DEFAULT (''),
	[codusu] [nvarchar](15) NOT NULL DEFAULT (''),
	[docdelete] [bit] NOT NULL DEFAULT ((0)),
	[modificadoc] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[UltQtyCmp] [decimal](18, 4) NOT NULL DEFAULT ((0)),
	[ucasilla] [nvarchar](3) NOT NULL DEFAULT (''),
	[uestante] [nvarchar](3) NOT NULL DEFAULT (''),
	[upasillo] [nvarchar](3) NOT NULL DEFAULT (''),
	[uzona] [nvarchar](3) NOT NULL DEFAULT (''),
	[pvfart] [decimal](18, 4) NOT NULL CONSTRAINT [DF_alm_invecommerce_pvfart]  DEFAULT ((0)),
	[pvgart] [decimal](18, 4) NOT NULL CONSTRAINT [DF_alm_invecommerce_pvgart]  DEFAULT ((0)),
	[pvhart] [decimal](18, 4) NOT NULL CONSTRAINT [DF_alm_invecommerce_pvhart]  DEFAULT ((0)),
	[invpto] [bit] NOT NULL CONSTRAINT [DF_alm_invecommerce_invpto]  DEFAULT ((0)),
	[artlogisti] [bit] NOT NULL CONSTRAINT [DF_alm_invecommerce_artlogisti]  DEFAULT ((0)),
 CONSTRAINT [PK_alm_invecommerce] PRIMARY KEY CLUSTERED 
(	
	[codart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

end
GO

------ 11-03-2021 Tabla Creada por la Ing Lissette Castro para desarrollo de Union temporal 
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_requisicion')
begin 
	CREATE TABLE [dbo].[com_requisicion](
		[idemp] [nvarchar](3) NOT NULL CONSTRAINT [DF_com_requisicion_idemp]  DEFAULT (''),
		[codcto] [nvarchar](3) NOT NULL CONSTRAINT [DF_com_requisicion_codcto]  DEFAULT (''),
		[tipfac] [nvarchar](2) NOT NULL CONSTRAINT [DF_com_requisicion_tipfac]  DEFAULT (''),
		[numfac] [nvarchar](8) NOT NULL CONSTRAINT [DF_com_requisicion_numfac]  DEFAULT (''),
		[fecfac] [date] NOT NULL CONSTRAINT [DF_com_requisicion_fecfac]  DEFAULT (getdate()),
		[valfac] [decimal](12, 0) NOT NULL CONSTRAINT [DF_com_requisicion_valfac]  DEFAULT ((0)),
		[ivafac] [decimal](12, 0) NOT NULL CONSTRAINT [DF_com_requisicion_ivafac]  DEFAULT ((0)),
		[netfac] [decimal](12, 0) NOT NULL CONSTRAINT [DF_com_requisicion_netfac]  DEFAULT ((0)),
		[estfac] [nvarchar](1) NOT NULL CONSTRAINT [DF_com_requisicion_estfac]  DEFAULT (''),
		[fecsys] [datetime] NOT NULL CONSTRAINT [DF_com_requisicion_fecsys]  DEFAULT (getdate()),
		[codusu] [nvarchar](8) NOT NULL CONSTRAINT [DF_com_requisicion_codusu]  DEFAULT (''),
		[observa] [nvarchar](max) NOT NULL CONSTRAINT [DF_com_requisicion_observa]  DEFAULT (''),
		[tipdocord] [nvarchar](3) NOT NULL CONSTRAINT [DF_com_requisicion_tipdocfac]  DEFAULT (''),
		[numfacord] [nvarchar](8) NOT NULL CONSTRAINT [DF_com_requisicion_codcan]  DEFAULT (''),
		[servidor] [nvarchar](60) NULL CONSTRAINT [DF_com_requisicion_servidor]  DEFAULT ('SERVER'),
		[codusumod] [nvarchar](15) NOT NULL DEFAULT (''),
	 CONSTRAINT [PK_com_requisicion] PRIMARY KEY CLUSTERED 
	(
		[idemp] ASC,
		[codcto] ASC,
		[tipfac] ASC,
		[numfac] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end 

GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_requisiciondet')
begin 

CREATE TABLE [dbo].[com_requisiciondet](
	[idemp] [nvarchar](3) NOT NULL CONSTRAINT [DF_com_requisiciondet_idemp]  DEFAULT (''),
	[codcto] [nvarchar](3) NOT NULL CONSTRAINT [DF_com_requisiciondet_codcto]  DEFAULT (''),
	[tipfac] [nvarchar](2) NOT NULL CONSTRAINT [DF_com_requisiciondet_tipfac]  DEFAULT (''),
	[numfac] [nvarchar](8) NOT NULL CONSTRAINT [DF_com_requisiciondet_numfac]  DEFAULT (''),
	[item] [numeric](10, 0) NOT NULL CONSTRAINT [DF_com_requisiciondet_item_DF]  DEFAULT ((0)),
	[codart] [nvarchar](10) NOT NULL CONSTRAINT [DF_com_requisiciondet_codart]  DEFAULT (''),
	[undart] [nvarchar](3) NOT NULL CONSTRAINT [DF_com_requisiciondet_undart]  DEFAULT (''),
	[totart] [decimal](12, 2) NOT NULL CONSTRAINT [DF_com_requisiciondet_totart]  DEFAULT ((0)),
	[ivaart] [decimal](6, 2) NOT NULL CONSTRAINT [DF_com_requisiciondet_ivaart]  DEFAULT ((0)),
	[qtyart] [decimal](20, 5) NULL CONSTRAINT [DF_com_requisiciondet_qtyart_DF]  DEFAULT ((0)),
	[cosart] [decimal](12, 2) NOT NULL CONSTRAINT [DF_com_requisiciondet_cosart]  DEFAULT ((0)),
	[descrip] [nvarchar](max) NOT NULL CONSTRAINT [DF_com_requisiciondet_descrip]  DEFAULT (''),
	[codter] [nvarchar](20) NOT NULL CONSTRAINT [DF_com_requisiciondet_codter]  DEFAULT (''),
	[numord] [nvarchar](8) NOT NULL CONSTRAINT [DF_com_requisiciondet_numord]  DEFAULT (''),
	[observa] [nvarchar](max) NOT NULL CONSTRAINT [DF_com_requisiciondet_observa]  DEFAULT (''),
	[servidor] [nvarchar](60) NULL CONSTRAINT [DF_com_requisiciondet_servidor]  DEFAULT ('SERVER'),
	[fecsys] [datetime] NOT NULL CONSTRAINT [DF__com_requisiciondet_fecsy]  DEFAULT (getdate()),
	[codusumod] [nvarchar](15) NOT NULL CONSTRAINT [DF_com_requisiciondet_codusumod]  DEFAULT (''),
	[codusu] [nvarchar](15) NOT NULL CONSTRAINT [DF_com_requisiciondet_codusu]  DEFAULT (''),
	[itemfor] [numeric](10, 0) NOT NULL CONSTRAINT [DF_com_requisiciondet_itemfor]  DEFAULT ((0)),
	[codartfor] [nvarchar](10) NOT NULL CONSTRAINT [DF_com_requisiciondet_codartfor]  DEFAULT (''),
	[qtyartfor] [decimal](20, 5) NULL CONSTRAINT [DF_com_requisiciondet_qtyartfor]  DEFAULT ((0)),

 CONSTRAINT [PK_com_requisiciondet] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC,
	[tipfac] ASC,
	[numfac] ASC,
	[item] ASC,
	[codart] ASC,
	[codartfor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end
GO
------ 26- 04-2021 Tabla agregada para el formato 2276 de exogena
IF NOT EXISTS(Select * From dbo.sysobjects Where name='con_entidadinformante')
begin 
CREATE TABLE [dbo].[con_entidadinformante](
	[Concepto]			[nvarchar](2)	NOT NULL DEFAULT '',
	[Descripcion]		[nvarchar](150)	NOT NULL DEFAULT '',
	)
end 
GO
---- tabla que se usa en el comanda web
if exists(select* from INFORMATION_SCHEMA.TABLES T WHERE T.TABLE_NAME = 'glb_menu_touch')
BEGIN
   DROP TABLE glb_menu_touch   
   CREATE TABLE [dbo].[glb_menu_touch](
	[nommen] [nvarchar](60) NOT NULL,
	[nomfor] [nvarchar](60) NOT NULL,
	[controlador] [nvarchar](20) NOT NULL DEFAULT (''),
	[accion] [nvarchar](20) NOT NULL DEFAULT (''),
	[item] [decimal](5, 0) NOT NULL CONSTRAINT [DF_glb_menu_touch_item]  DEFAULT ((0))
    ) ON [PRIMARY]
	print 'glb_menu_touch'
  INSERT INTO glb_menu_touch VALUES ('Anular prefactura','fr_touch_anulprefac','Cancel','Index','2')
  INSERT INTO glb_menu_touch VALUES ('Config. Mesas','FR_ACT_TOUCH_ MESAS','Mesas','Index','4')
  INSERT INTO glb_menu_touch VALUES ('Confirmar Pago','FR_TOUCH_CONFIRMAR','ConfirmarPago',	'ConfirmarPago','9')
  INSERT INTO glb_menu_touch VALUES ('Dev. Factura','fr_touch_utilvta','DevFactura','DevFactura','10')
  INSERT INTO glb_menu_touch VALUES ('Domicilio','fr_domicilio','Domicilios','Index','11')
  INSERT INTO glb_menu_touch VALUES ('Facturar','fr_touch_factura','Facturacion','Ubicaciones','3')
  INSERT INTO glb_menu_touch VALUES ('Mesas Ocupadas','fr_touch_ocupadas','Mesas','MesasOcupadas','5')
  INSERT INTO glb_menu_touch VALUES ('Reimprimir','fr_touch_reimprimir','Reimprimir','Index','6')
  INSERT INTO glb_menu_touch VALUES ('Turnos','fr_touch_apertura','Turno','Index','8')
  INSERT INTO glb_menu_touch VALUES ('Utilidades','fr_touch_utilfac','Home','Index','7')
  INSERT INTO glb_menu_touch VALUES ('KDS',	'fr_KTS','Kts',	'Index',	'1')
  INSERT INTO glb_menu_touch VALUES ('Estacion Cocina',	'fr_Pantalla',	'Kts',	'Pantalla',	'12')
  INSERT INTO glb_menu_touch VALUES ('Estadisticas',	'fr_estadisticas',	'Estadistica',	'Index','13')
END

GO

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'ven_variantes' AND T.column_name = 'numcom') 
begin
	Alter Table ven_variantes Add numcom decimal(8,0) not null default 0
	Print 'ven_variantes - numcom'
end 
else 
  DECLARE @tipo nvarchar(30),
          @long int

  select  @tipo = DATA_TYPE, @long =  ISNULL(NUMERIC_PRECISION, 0) from INFORMATION_SCHEMA.COLUMNS as T where T.TABLE_NAME = 'ven_variantes' and T.COLUMN_NAME = 'numcom'
   if (@tipo != 'decimal' and @long != 8)
    BEGIN
	  ALTER TABLE ven_variantes DISABLE CHANGE_TRACKING
	   alter table ven_variantes
	   DROP CONSTRAINT DF_ven_variantes_numcom 
	   
	   alter table ven_variantes alter column numcom decimal(8,0) NOT NULL 
	   ALTER TABLE [dbo].[ven_variantes] ADD  CONSTRAINT [PK_ven_variantes] PRIMARY KEY CLUSTERED 
          (
	        [idemp] ASC,
	        [numpre] ASC,
	        [numcom] ASC,
	        [codcto] ASC,
	        [codart] ASC,
	        [codins] ASC,
         	[item] ASC
          )
       ALTER TABLE ven_variantes ENABLE CHANGE_TRACKING
	END
GO
---- tablas creadas por Lissette Castro para desarrollo de creacion de sucursales de Manbu
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_sucursales')
begin 
CREATE TABLE [dbo].[ven_sucursales](
	[idemp] [nvarchar](3) NOT NULL Default '',
	[nitter] [nvarchar](15) NOT NULL Default '',
	[codigo] [nvarchar](10) NOT NULL Default '',
	[nombre] [nvarchar](50) NOT NULL Default '',
	[codciu] [nvarchar](10) NOT NULL Default '',
	[item]	 [nvarchar](5) NOT NULL Default '',

)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_cotiartxsucursal')
begin 
CREATE TABLE [dbo].[ven_cotiartxsucursal](
	[idemp]  [nvarchar](3) NOT NULL Default '',
	[codcto] [nvarchar](3) NOT NULL Default '',
	[tipfac] [nvarchar](2) NOT NULL Default '',
	[numfac] [nvarchar](8) NOT NULL Default '',
	[sucursal] [nvarchar](10) NOT NULL Default '',
	[item]	 [nvarchar](5) NOT NULL Default '',
	[codart] [nvarchar](10) NOT NULL Default '',
	[qtyart] [decimal](18,4) NOT NULL Default 0,
	[refart] [nvarchar](20) NOT NULL Default '',
	[refar2] [nvarchar](20) NOT NULL Default '',
	[numord] [nvarchar](20) NOT NULL Default '',
	[qtyartfac] [decimal](18,4) NOT NULL Default 0
	)
end 
GO 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_facartxsucursal')
begin 
CREATE TABLE [dbo].[ven_facartxsucursal](
	[idemp]  [nvarchar](3) NOT NULL Default '',
	[codcto] [nvarchar](3) NOT NULL Default '',
	[tipfac] [nvarchar](2) NOT NULL Default '',
	[numfac] [nvarchar](8) NOT NULL Default '',
	[sucursal] [nvarchar](10) NOT NULL Default '',
	[codart] [nvarchar](10) NOT NULL Default '',
	[qtyart] [decimal](18,4) NOT NULL Default 0,
	[tipcot] [nvarchar](2) NOT NULL Default '',
	[numcot] [nvarchar](8) NOT NULL Default '',

	)
end 
GO 
----- 21-06-2021 Tabla agregada por Lissette Castro para desarrollo de Surtipizza para la creación de rutas
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_ruta')
begin 
CREATE TABLE [dbo].[ven_ruta](
	[idemp]		[nvarchar](3) NOT NULL Default '',
	[numero]	[nvarchar](10) NOT NULL Default '',
	[fecha]		[date] NOT NULL Default '',
	[conductor]	[nvarchar](15) NOT NULL Default '',
	[descrip]	[nvarchar](50) NOT NULL Default '',
	[codcto]	[nvarchar](3) NOT NULL Default '',
	[tipfac]	[nvarchar](2) NOT NULL Default '',
	[numfac]	[nvarchar](8) NOT NULL Default '',
	[codart]	[nvarchar](10) NOT NULL Default '',
	[qtyart]	[decimal](18,2) NOT NULL Default '',
	[peso]		[decimal](18,2) NOT NULL Default '',
	[codusu]	[nvarchar](10) NOT NULL Default '',
	[codgru]	[nvarchar](3) NOT NULL Default '',
	[fecsys]	[datetime] NOT NULL Default getdate(),

)
end 
GO 
------ 06-07-2021 Tabla agregada para desarrollo de Gegasa, ingreso de observaciones en nomina.

IF NOT EXISTS(Select * From dbo.sysobjects Where name='nom_observa')
begin 
CREATE TABLE [dbo].[nom_observa](
	[consec]		[nchar](10) NOT NULL Default '',
	[codi_emple]	[nchar](10) NOT NULL Default '',
	[fecha]		[date] NOT NULL Default '',
	[observa]	[nvarchar](MAX) NOT NULL Default '',
	)
end 
GO 
---03-08-2021 tabla agregada para desarrollo de surtipizza con creación de rutas
IF NOT EXISTS(Select * From dbo.sysobjects Where name='ven_rutaxven')
begin 
CREATE TABLE [dbo].[ven_rutaxven](
	[idemp] [nvarchar](3) NOT NULL Default '',
	[codigo] [nvarchar](10) NOT NULL Default '',
	[item]	 [nvarchar](5) NOT NULL Default '',
	[nitter] [nvarchar](15) NOT NULL Default '',
	[nombre] [nvarchar](50) NOT NULL Default '',
	[vendedor] [nvarchar](15) NOT NULL Default '',
	[codusu] [nvarchar](10) NOT NULL Default '',
	[fecsys] [datetime] NOT NULL Default getdate()
	
)
end 
GO
-- 21-01-2022 Enuar Martinez Nueva tabla para guardar archivos que se van a adjuntar en Fe
IF NOT EXISTS(Select * From dbo.sysobjects Where name='fe_adjuntos')
begin 
CREATE TABLE [dbo].[fe_adjuntos]( 
    [codcto] [nvarchar](10) not null default '',
    [tipdoc] [nvarchar](10) not null default '', 
    [numdoc] [nvarchar](50) not null default '',
    [consec] [nvarchar] (10) not null default '',
    [urlAdjuntos] [nvarchar] (max) not null default '',
    [fecsys] [datetime] NOT NULL Default getdate()
)
print 'la tabla fe_adjuntos fue creada exitosamente.'
end 
GO
---- 23-06-2022 Agregado por Lissette Castro desarrollo de topping pantalla de conteo comparativo
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_invfisicoqty')
begin 
CREATE TABLE [dbo].[alm_invfisicoqty](
	[idinvfisicos] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL default '',
	[fecinv] [date] NULL,
	[fecsys] [datetime] NULL,
	[codgru] [nvarchar](3) not NULL default '',
	[codter] [nvarchar](15) not NULL default '',
	[codlin] [nvarchar](4) not NULL default '',
	[codmar] [nvarchar](4) not NULL default '',
	[tipo] [decimal](1, 0) not NULL default '',
	[estado] [char](1) NOT NULL default '',
	[servidor] [nvarchar](60) not NULL default '',
	[codusumod] [nvarchar](15) NOT NULL default '',
	[codusu] [nvarchar](15) NOT NULL default '',
	[modificadoc] [numeric](10, 0) NOT NULL default 0,
	[numinv] [nvarchar](8) NOT NULL default ''
	)
end 
go 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_invfisicoqtydet')
begin

CREATE TABLE [dbo].[alm_invfisicoqtydet](
	[idinvfisicos] [numeric](10, 0) NOT NULL default 0,
	[idemp] [nvarchar](3) NOT NULL default '',
	[codcto] [nvarchar](3) NOT NULL default '',
	[codart] [nvarchar](10) NOT NULL default '',
	[refart] [nvarchar](25) not NULL default '',
	[nomart] [nvarchar](60) not NULL default '',
	[qtysis] [decimal](14, 4) not NULL default 0,
	[qtyfis] [decimal](14, 2) not NULL default 0,
	[qtydif] [decimal](14, 4) not NULL default 0,
	[ok] [bit] NOT NULL default 0,
	[motivo] [nvarchar](60) not NULL default '',
	[codgru] [nvarchar](3) not NULL default '' ,
	[nomgru] [nvarchar](60) not NULL default '',
	[codlin] [varchar](4) not NULL default '',
	[nomlin] [nvarchar](40) not NULL default '',
	[codmar] [nvarchar](3) not NULL default '',
	[nommar] [nvarchar](40) not NULL default '',
	[codter] [nvarchar](12) not NULL default '',
	[nompro] [nvarchar](60) not NULL default '',
	[tiporeg] [decimal](1, 0) not NULL default 0,
	[undart] [nvarchar](4) not NULL default '',
	[fecsys] [datetime]  NULL ,
	[servidor] [nvarchar](60) NOT NULL default '',
	[codusumod] [nvarchar](15) NOT NULL default '',
	[codusu] [nvarchar](15) NOT NULL default '',
	[modificadoc] [numeric](10, 0) NOT NULL default 0,
	[numinv] [nvarchar](8) NOT NULL default 0,
 CONSTRAINT [PK_alm_invfisicoqtydet] PRIMARY KEY CLUSTERED 
(
	[idinvfisicos] ASC,
	[codart] ASC,
	[modificadoc] ASC,
	[codcto] ASC,
	[idemp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end 
GO
------------ 20-09-2022 tablas agregadas para la integración con recepcion
IF NOT EXISTS(Select * From dbo.sysobjects Where name='HK_Recepcion')
begin 
CREATE TABLE [dbo].[HK_Recepcion](
    [tipodocumento] [nvarchar](5) NOT NULL,
	[numerodocumento] [nvarchar](100) NOT NULL,
	[fechaemision] [date] NOT NULL,
	[fecharecepcion] [date] NOT NULL,
	[horaemision] [time](7) NOT NULL,
	[tipoidentidad] [nvarchar](5) NOT NULL,
	[numeroidentificacion] [int] NOT NULL,
	[razonsocial] [nvarchar](200) NOT NULL,
	[montototal] [decimal](14, 2) NOT NULL,
	[estado] [nvarchar](300) NOT NULL,
	[cufe] [text] NULL,
	[tipoemisor] [nvarchar](5) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	)
end
GO


IF NOT EXISTS(Select * From dbo.sysobjects Where name='HK_Recepcion_Historial_Estado')
begin 
CREATE TABLE [dbo].[HK_Recepcion_Historial_Estado](
    [tipodocumento] [nvarchar](5) NOT NULL,
	[numerodocumento] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](200) NOT NULL,
	[nombre] [nvarchar](200) NOT NULL,
	[numeroidentificacion] [int] NOT NULL,
	[dv] [nvarchar](10) NOT NULL,
	[tipoidentificacion] [nvarchar](5) NOT NULL,
	[nuevoestado] [nvarchar](300) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	)
end
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_importacion')
begin 
CREATE TABLE [dbo].[com_importacion](
	[idemp] [nvarchar](3) NOT NULL Default '',
	[codcto] [nvarchar](3) NOT NULL Default '',
	[tipdoc] [nvarchar](2) NOT NULL Default '',
	[numdoc] [nvarchar](8) NOT NULL Default '',
	[fecha] [date],
	[valor] [decimal](18,2) NOT NULL Default 0,
	[estado] [nvarchar](1) NOT NULL Default '',
	[codusu] [nvarchar](10) NOT NULL Default '',
	[fecsys] [datetime] NOT NULL Default getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_impor_gasto')
begin 
CREATE TABLE [dbo].[com_impor_gasto](
	[idemp] [nvarchar](3) NOT NULL Default '',
	[codcto] [nvarchar](3) NOT NULL Default '',
	[tipdoc] [nvarchar](2) NOT NULL Default '',
	[numdoc] [nvarchar](8) NOT NULL Default '',
	[nitpro] [nvarchar](25) NOT NULL Default '',
	[docfac] [nvarchar](20) NOT NULL Default '',
	[tipo] [nvarchar](1) NOT NULL Default '',
	[coddes] [nvarchar](5) NOT NULL Default '',
	[valdes] [decimal](18,2) NOT NULL Default 0,
	[codcta] [nvarchar](8) NOT NULL Default '',
	[tipdes] [nvarchar](1) NOT NULL Default '',
	[codusu] [nvarchar](10) NOT NULL Default '',
	[fecsys] [datetime] NOT NULL Default getdate()
)
end 
GO

IF NOT EXISTS(Select * From dbo.sysobjects Where name='tra_detliquida')
begin 
CREATE TABLE [dbo].[tra_detliquida](
	[año] [decimal](4,0) NOT NULL Default 0,
	[mes] [decimal](2,0) NOT NULL Default 0,
	[nitter]  [nvarchar](15) NOT NULL  Default '',
	[realizadas] [decimal](3,0) NOT NULL Default 0,
	[desvin]  [decimal](3,0) NOT NULL Default 0,
	[pendien] [decimal](3,0) NOT NULL Default 0,
	[totalpla] [decimal](14,0) NOT NULL Default 0,
	[fecha] [date] NOT NULL,
	[cuota] [decimal](14,0) NOT NULL Default 0,
    [fecsys] [datetime] NOT NULL Default getdate()
)
end 
GO
-- Agregado por Lissette Castro 29-08-2023 para facturas de compras con cuotas
IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_facuota')
begin 

	CREATE TABLE [dbo].[com_facuota](
		[idemp] [nvarchar](3) NOT NULL default '', 
		[codcto] [nvarchar](3) NOT NULL default '',
		[tipfac] [nvarchar](2) NOT NULL default '',
		[numfac] [nvarchar](8) NOT NULL default '',
		[numcuo] [decimal](2, 0) NOT NULL default 0,
		[feccuo] [date] NOT NULL default getdate(),
		[porcuo] [decimal](5, 2) NOT NULL default 0,
		[valcuo] [decimal](18, 4) NULL default 0,
		[estcuo] [nvarchar](1) NOT NULL default '',
		[item] [numeric](10, 0) NOT NULL default 0,
		[servidor] [nvarchar](60) NULL default '',
		[fecsys] [datetime] NOT NULL default getdate(),
		[codusu] [nvarchar](15) NOT NULL default '',
	 CONSTRAINT [PK_com_facuota] PRIMARY KEY CLUSTERED 
	(
		[idemp] ASC,
		[codcto] ASC,
		[tipfac] ASC,
		[numfac] ASC,
		[item] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

end 
go 

IF NOT EXISTS(Select * From dbo.sysobjects Where name='com_facuopagos')
begin 

	CREATE TABLE [dbo].[com_facuopagos](
	[idemp] [nvarchar](3) NOT NULL default '',
	[codcto] [nvarchar](3) NOT NULL default '' ,
	[tipfac] [nvarchar](2) NOT NULL default '',
	[numfac] [nvarchar](8) NOT NULL default '',
	[tippag] [nvarchar](2) NOT NULL default '',
	[cenpag] [nvarchar](3) NOT NULL default '',
	[numpag] [nvarchar](8) NOT NULL default '',
	[numcuo] [decimal](6,0) NOT NULL default 0,
	[valpag] [decimal](18, 2) NOT NULL default 0,
	[estpag] [nvarchar](1) NOT NULL default '',
	[item] [numeric](12, 0) NOT NULL default 0,
	[servidor] [nvarchar](60) NULL,
	[fecsys] [datetime] NOT NULL default getDate(),
	[codusu] [nvarchar](15) NOT NULL default '',
 CONSTRAINT [PK_com_facuopagos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[cenpag] ASC,
	[tippag] ASC,
	[numpag] ASC,
	[item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

end 
go 
----- 15-07-2024  agregado por Lissette Castro para guardar toma fisica por grupos
IF NOT EXISTS(Select * From dbo.sysobjects Where name='alm_invfisicos_grupo')
begin 
CREATE TABLE [dbo].[alm_invfisicos_grupo](
	[idinvfisicos] [int] NOT NULL,
	[codgru] [nvarchar](3) NULL

)
end 
GO 