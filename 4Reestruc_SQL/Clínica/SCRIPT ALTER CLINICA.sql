-- CREACION DE TABLAS

/*IF NOT EXISTS(Select * From dbo.sysobjects Where name='cli_pacdiagnostico')
begin 
CREATE TABLE cli_pacdiagnostico (
	conhis nvarchar (11) not null default (''),
	coddia nvarchar (4) not null default (''),
	item  numeric (18,0) not null default (0),
	fecsys datetime not null default (getdate()),
	codusu nvarchar (11) not null default ('')
);
end*/


/****** Object:  Default [UW_ZeroDefault]    Script Date: 30/03/2022 8:20:02 ******/
CREATE DEFAULT [dbo].[UW_ZeroDefault] 
AS
0
GO
/****** Object:  Table [dbo].[cit_detaresult]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cit_detaresult](
	[conhis] [nvarchar](11) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[codtop] [nvarchar](3) NOT NULL,
	[comenta] [text] NOT NULL,
	[resulta] [nvarchar](5) NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cit_grupos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cit_grupos](
	[codgru] [nvarchar](2) NOT NULL,
	[nomgru] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cit_topicos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cit_topicos](
	[codgru] [nvarchar](2) NOT NULL,
	[codtop] [nvarchar](3) NOT NULL,
	[nomtop] [nvarchar](85) NOT NULL,
	[cuantop] [bit] NOT NULL,
	[cualtop] [bit] NOT NULL,
	[subgrup] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_alergias]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_alergias](
	[codalerg] [nvarchar](3) NOT NULL,
	[nomalerg] [nvarchar](40) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_antecedentes]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_antecedentes](
	[codant] [nvarchar](4) NOT NULL,
	[nomant] [nvarchar](60) NOT NULL,
	[tipant] [nvarchar](1) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_apertura]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_apertura](
	[fecape] [datetime] NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[codant] [nvarchar](4) NOT NULL,
	[otrobs] [text] NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_causaexterna]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_causaexterna](
	[codcau] [nvarchar](2) NOT NULL,
	[nomcau] [nvarchar](45) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_certificado]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_certificado](
	[fecha] [datetime] NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[tipo] [numeric](1, 0) NOT NULL,
	[descrip] [text] NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[diasinc] [numeric](3, 0) NOT NULL,
	[fechai] [datetime] NOT NULL,
	[fechaf] [datetime] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_citologia]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_citologia](
	[feceva] [datetime] NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[ciclo] [nvarchar](6) NOT NULL,
	[fum] [datetime] NOT NULL,
	[gcon] [numeric](2, 0) NOT NULL,
	[pcon] [numeric](2, 0) NOT NULL,
	[acon] [numeric](2, 0) NOT NULL,
	[ccon] [numeric](2, 0) NOT NULL,
	[fuc] [nvarchar](20) NOT NULL,
	[ivs] [nvarchar](20) NOT NULL,
	[ivo] [nvarchar](20) NOT NULL,
	[fup] [nvarchar](20) NOT NULL,
	[otrobs] [text] NOT NULL,
	[aspcer] [text] NOT NULL,
	[estcon] [nvarchar](1) NOT NULL,
	[fljcon] [bit] NOT NULL,
	[esccon] [bit] NOT NULL,
	[hmgcon] [bit] NOT NULL,
	[impdiag] [text] NOT NULL,
	[codtec] [nvarchar](2) NOT NULL,
	[fecres] [datetime] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_conceptos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_conceptos](
	[codcon] [nvarchar](2) NOT NULL,
	[nomcon] [nvarchar](45) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_conhis]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cli_conhis](
	[añohis] [numeric](4, 0) NOT NULL,
	[conhis] [numeric](5, 0) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cli_consultas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_consultas](
	[codalm] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[codtar] [nvarchar](3) NOT NULL,
	[codser] [nvarchar](2) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[horacita] [nvarchar](5) NOT NULL,
	[jornada] [nvarchar](3) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL,
	[codcons] [nvarchar](2) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[motcon] [nvarchar](2) NOT NULL,
	[causaext] [nvarchar](2) NOT NULL,
	[coddiap] [nvarchar](4) NOT NULL,
	[coddiar1] [nvarchar](4) NOT NULL,
	[coddiar2] [nvarchar](4) NOT NULL,
	[coddiar3] [nvarchar](4) NOT NULL,
	[tipdiap] [numeric](1, 0) NOT NULL,
	[valcon] [numeric](11, 2) NOT NULL,
	[valiva] [numeric](5, 2) NOT NULL,
	[valdes] [numeric](5, 2) NOT NULL,
	[valtotal] [numeric](11, 2) NOT NULL,
	[valcopago] [numeric](11, 2) NOT NULL,
	[numautoriza] [nvarchar](15) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[estord] [nvarchar](1) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[numpag] [nvarchar](8) NOT NULL,
	[nitter] [nvarchar](15) NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[horafincita] [nvarchar](5) NOT NULL,
	[jornadafin] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_consultorios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_consultorios](
	[codcons] [nvarchar](2) NOT NULL,
	[nomcons] [nvarchar](30) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_copagos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_copagos](
	[codgru] [nvarchar](2) NOT NULL,
	[nomgru] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_departamentos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_departamentos](
	[coddep] [nvarchar](2) NOT NULL,
	[nomdep] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detadrogas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detadrogas](
	[conhis] [nvarchar](11) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[qtyent] [numeric](5, 0) NOT NULL,
	[qtyfac] [numeric](5, 0) NOT NULL,
	[cosins] [numeric](13, 2) NOT NULL,
	[valdro] [numeric](13, 2) NOT NULL,
	[valdes] [numeric](5, 2) NOT NULL,
	[ivains] [numeric](5, 2) NOT NULL,
	[valins] [numeric](13, 2) NOT NULL,
	[valtot] [numeric](13, 2) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[numautoriza] [nvarchar](15) NOT NULL,
	[medext] [nvarchar](2) NOT NULL,
	[tipord] [numeric](1, 0) NOT NULL,
	[cups] [nvarchar](6) NOT NULL,
	[valcopago] [numeric](13, 2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detanutric]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detanutric](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[coditem] [nvarchar](2) NOT NULL,
	[nutr01] [nvarchar](20) NOT NULL,
	[nutr02] [nvarchar](20) NOT NULL,
	[nutr03] [nvarchar](20) NOT NULL,
	[nutr04] [nvarchar](20) NOT NULL,
	[nutr05] [nvarchar](20) NOT NULL,
	[nutr06] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detaodonto]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detaodonto](
	[conhis] [nvarchar](11) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[numdte] [nvarchar](2) NOT NULL,
	[codproc] [nvarchar](8) NOT NULL,
	[fecproc] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detaorden]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detaorden](
	[conhis] [nvarchar](11) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](10) NOT NULL,
	[codest] [nvarchar](5) NOT NULL,
	[qtyest] [numeric](6, 0) NOT NULL,
	[qtyent] [numeric](6, 0) NOT NULL,
	[qtyfac] [numeric](6, 0) NOT NULL,
	[valcosto] [numeric](13, 2) NOT NULL,
	[valunit] [numeric](13, 2) NOT NULL,
	[resulta] [text] NOT NULL,
	[cups] [nvarchar](10) NOT NULL,
	[descrip] [text] NOT NULL,
	[miembro] [nvarchar](10) NOT NULL,
	[estord] [nvarchar](1) NOT NULL,
	[finproc] [numeric](1, 0) NOT NULL,
	[ambproc] [numeric](1, 0) NOT NULL,
	[numautoriza] [nvarchar](15) NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detaprecios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detaprecios](
	[codtar] [nvarchar](3) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[valins] [numeric](13, 2) NOT NULL,
	[ivains] [numeric](13, 2) NOT NULL,
	[codgru] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detaproc]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detaproc](
	[conhis] [nvarchar](11) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[qtyfac] [numeric](5, 0) NOT NULL,
	[qtyent] [numeric](5, 0) NOT NULL,
	[codproc] [nvarchar](8) NOT NULL,
	[tipproc] [nvarchar](1) NOT NULL,
	[finproc] [nvarchar](1) NOT NULL,
	[codper] [nvarchar](1) NOT NULL,
	[coddiap] [nvarchar](4) NOT NULL,
	[coddiar] [nvarchar](4) NOT NULL,
	[codcomp] [nvarchar](4) NOT NULL,
	[codrcir] [nvarchar](4) NOT NULL,
	[valins] [numeric](13, 2) NOT NULL,
	[ivains] [numeric](4, 2) NOT NULL,
	[valdes] [numeric](4, 2) NOT NULL,
	[valproc] [numeric](13, 2) NOT NULL,
	[valcopago] [numeric](13, 2) NOT NULL,
	[numautoriza] [nvarchar](20) NOT NULL,
	[tipord] [nvarchar](1) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[medext] [nvarchar](3) NOT NULL,
	[medproc] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detaservicios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detaservicios](
	[codcen] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[qtyfac] [numeric](5, 0) NOT NULL,
	[qtyent] [numeric](5, 0) NOT NULL,
	[codserv] [nvarchar](8) NOT NULL,
	[tiposer] [nvarchar](1) NOT NULL,
	[valins] [numeric](13, 2) NOT NULL,
	[ivains] [numeric](4, 2) NOT NULL,
	[valdes] [numeric](4, 2) NOT NULL,
	[valcopago] [numeric](13, 2) NOT NULL,
	[valproc] [numeric](13, 2) NOT NULL,
	[numautoriza] [nvarchar](20) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[medext] [nvarchar](3) NOT NULL,
	[medproc] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detasicologia]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detasicologia](
	[conhis] [nvarchar](11) NOT NULL,
	[codprg] [nvarchar](2) NOT NULL,
	[codres] [nvarchar](3) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_detaudiologia]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_detaudiologia](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[tipitem] [numeric](1, 0) NOT NULL,
	[hz125] [numeric](4, 0) NOT NULL,
	[hz250] [numeric](4, 0) NOT NULL,
	[hz500] [numeric](4, 0) NOT NULL,
	[hz750] [numeric](4, 0) NOT NULL,
	[hz1000] [numeric](4, 0) NOT NULL,
	[hz1500] [numeric](4, 0) NOT NULL,
	[hz2000] [numeric](4, 0) NOT NULL,
	[hz3000] [numeric](4, 0) NOT NULL,
	[hz4000] [numeric](4, 0) NOT NULL,
	[hz6000] [numeric](4, 0) NOT NULL,
	[hz8000] [numeric](4, 0) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_diagnosticos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_diagnosticos](
	[coddia] [nvarchar](4) NOT NULL,
	[nomdia] [nvarchar](80) NOT NULL,
	[cups] [nvarchar](8) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_drogas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_drogas](
	[coddro] [nvarchar](3) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[nomins] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_empcopagos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_empcopagos](
	[codemp] [nvarchar](5) NOT NULL,
	[codgru] [nvarchar](2) NOT NULL,
	[estrato1] [numeric](13, 2) NOT NULL,
	[porcen1] [numeric](5, 2) NOT NULL,
	[estrato2] [numeric](13, 2) NOT NULL,
	[porcen2] [numeric](5, 2) NOT NULL,
	[estrato3] [numeric](13, 2) NOT NULL,
	[porcen3] [numeric](5, 2) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[okcopago] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_empresas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_empresas](
	[codemp] [nvarchar](5) NOT NULL,
	[nomemp] [nvarchar](50) NOT NULL,
	[nitemp] [nvarchar](15) NOT NULL,
	[diremp] [nvarchar](30) NOT NULL,
	[telemp] [nvarchar](15) NOT NULL,
	[ciuemp] [nvarchar](20) NOT NULL,
	[codser] [nvarchar](2) NOT NULL,
	[padre] [nvarchar](6) NOT NULL,
	[desemp] [numeric](5, 2) NOT NULL,
	[codcue] [nvarchar](12) NOT NULL,
	[codrip] [nvarchar](10) NOT NULL,
	[tipusu] [numeric](1, 0) NOT NULL,
	[porcent] [numeric](5, 0) NOT NULL,
	[copago1] [numeric](13, 2) NOT NULL,
	[copago2] [numeric](13, 2) NOT NULL,
	[copago3] [numeric](13, 2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_enfermedad]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_enfermedad](
	[codenf] [nvarchar](3) NOT NULL,
	[nomenf] [nvarchar](40) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_especialidad]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_especialidad](
	[codesp] [nvarchar](2) NOT NULL,
	[nomesp] [nvarchar](40) NOT NULL,
	[porhon] [numeric](5, 2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_estudios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_estudios](
	[codest] [nvarchar](5) NOT NULL,
	[nomest] [nvarchar](60) NOT NULL,
	[claest] [nvarchar](2) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL,
	[tipest] [numeric](1, 0) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[cups] [nvarchar](10) NOT NULL,
	[codi_grupo] [nvarchar](4) NOT NULL,
	[valnormal] [nvarchar](10) NOT NULL,
	[miembro] [bit] NOT NULL,
	[tipins] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_evaluacion]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_evaluacion](
	[codalm] [nvarchar](3) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[feceva] [datetime] NOT NULL,
	[pespac] [numeric](5, 2) NOT NULL,
	[altpac] [numeric](5, 2) NOT NULL,
	[tempac] [numeric](5, 2) NOT NULL,
	[parpac] [nvarchar](7) NOT NULL,
	[respac] [numeric](3, 0) NOT NULL,
	[frcpac] [numeric](3, 0) NOT NULL,
	[impdiag] [text] NOT NULL,
	[datpos] [text] NOT NULL,
	[tratpac] [text] NOT NULL,
	[motcon] [text] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_finalidad]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_finalidad](
	[codfin] [nvarchar](2) NOT NULL,
	[nomfin] [nvarchar](45) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_fonoaudiologia]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_fonoaudiologia](
	[conhis] [nvarchar](11) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[feceva] [datetime] NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[motconsulta] [text] NOT NULL,
	[otrobs] [text] NOT NULL,
	[rempac] [nvarchar](20) NOT NULL,
	[diamed] [text] NOT NULL,
	[promod] [numeric](7, 2) NOT NULL,
	[promoi] [numeric](7, 2) NOT NULL,
	[umbrpod] [numeric](5, 2) NOT NULL,
	[umbrpoi] [numeric](5, 2) NOT NULL,
	[umbrcod] [numeric](5, 2) NOT NULL,
	[umbrcoi] [numeric](5, 2) NOT NULL,
	[discod] [numeric](5, 2) NOT NULL,
	[discoi] [numeric](5, 2) NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_formacirugia]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_formacirugia](
	[codforma] [nvarchar](1) NOT NULL,
	[detaforma] [nvarchar](60) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_grupos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_grupos](
	[codgru] [nvarchar](3) NOT NULL,
	[nomgru] [nvarchar](40) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_honorarios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_honorarios](
	[codmed] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codest] [nvarchar](3) NOT NULL,
	[abohon] [numeric](13, 2) NOT NULL,
	[canest] [numeric](5, 0) NOT NULL,
	[valest] [numeric](13, 2) NOT NULL,
	[tasa] [numeric](5, 2) NOT NULL,
	[valhon] [numeric](13, 2) NOT NULL,
	[esthon] [nvarchar](1) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_labgrupo]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_labgrupo](
	[codi_grupo] [nvarchar](4) NOT NULL,
	[desc_grupo] [nvarchar](40) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_listaprecios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_listaprecios](
	[codtar] [nvarchar](3) NOT NULL,
	[nomtar] [nvarchar](40) NOT NULL,
	[añotar] [numeric](4, 0) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_maeorden]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_maeorden](
	[codcen] [nvarchar](3) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[numord] [nvarchar](10) NOT NULL,
	[fecord] [datetime] NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[tipord] [nvarchar](1) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[numaut] [nvarchar](15) NOT NULL,
	[ambproc] [numeric](1, 0) NOT NULL,
	[finproc] [numeric](1, 0) NOT NULL,
	[estord] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_medespecial]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_medespecial](
	[codmed] [nvarchar](3) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL,
	[porhon] [numeric](4, 2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_medexterno]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_medexterno](
	[codmedext] [nvarchar](3) NOT NULL,
	[nommedext] [nvarchar](60) NOT NULL,
	[nitmedext] [nvarchar](15) NOT NULL,
	[indepen] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_medicos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_medicos](
	[codmed] [nvarchar](2) NOT NULL,
	[nommed] [nvarchar](40) NOT NULL,
	[cedmed] [nvarchar](15) NOT NULL,
	[codesp] [nvarchar](2) NOT NULL,
	[ciumed] [nvarchar](30) NOT NULL,
	[dirmed] [nvarchar](30) NOT NULL,
	[telmed] [nvarchar](15) NOT NULL,
	[dircon] [nvarchar](30) NOT NULL,
	[telcon] [nvarchar](15) NOT NULL,
	[celmed] [nvarchar](15) NOT NULL,
	[bepmed] [nvarchar](15) NOT NULL,
	[clamed] [nvarchar](10) NOT NULL,
	[tecnico] [numeric](1, 0) NOT NULL,
	[durcitas] [numeric](2, 0) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_motivos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_motivos](
	[codmot] [nvarchar](2) NOT NULL,
	[nommot] [nvarchar](50) NOT NULL,
	[cups] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_municipios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_municipios](
	[codmun] [nvarchar](3) NOT NULL,
	[nommun] [nvarchar](50) NOT NULL,
	[coddep] [nvarchar](2) NOT NULL,
	[codzon] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_nutricion]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_nutricion](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[feceva] [datetime] NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[altpac] [numeric](5, 2) NOT NULL,
	[pesact] [numeric](5, 2) NOT NULL,
	[peside] [numeric](5, 2) NOT NULL,
	[pesusu] [numeric](5, 2) NOT NULL,
	[parpac] [nvarchar](7) NOT NULL,
	[rempac] [nvarchar](20) NOT NULL,
	[motconsulta] [text] NOT NULL,
	[impdiag] [text] NOT NULL,
	[diamed] [text] NOT NULL,
	[complpac] [nvarchar](15) NOT NULL,
	[tratpac] [nvarchar](50) NOT NULL,
	[canprot] [numeric](2, 0) NOT NULL,
	[cangra] [numeric](2, 0) NOT NULL,
	[cancho] [numeric](2, 0) NOT NULL,
	[porprot] [numeric](6, 0) NOT NULL,
	[porgra] [numeric](6, 0) NOT NULL,
	[porcho] [numeric](6, 0) NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_odontologia]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_odontologia](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[feceva] [datetime] NOT NULL,
	[tipcon] [numeric](1, 0) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[initrat] [bit] NOT NULL,
	[tratok] [bit] NOT NULL,
	[otrobs] [text] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_ordenes]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_ordenes](
	[conhis] [nvarchar](11) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[fecord] [datetime] NOT NULL,
	[tippro] [nvarchar](2) NOT NULL,
	[tipord] [numeric](1, 0) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[codser] [nvarchar](2) NOT NULL,
	[codtar] [nvarchar](3) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[codtec] [nvarchar](2) NOT NULL,
	[numaut] [nvarchar](15) NOT NULL,
	[codcau] [nvarchar](2) NOT NULL,
	[finpro] [nvarchar](1) NOT NULL,
	[fincon] [nvarchar](2) NOT NULL,
	[ambpro] [nvarchar](1) NOT NULL,
	[actqui] [nvarchar](1) NOT NULL,
	[tipdia] [nvarchar](2) NOT NULL,
	[codmot] [nvarchar](2) NOT NULL,
	[coddiap] [nvarchar](4) NOT NULL,
	[coddiar1] [nvarchar](4) NOT NULL,
	[coddiar2] [nvarchar](4) NOT NULL,
	[coddiar3] [nvarchar](4) NOT NULL,
	[nomacom] [nvarchar](80) NOT NULL,
	[valord] [numeric](13, 2) NOT NULL,
	[abono] [numeric](13, 2) NOT NULL,
	[estord] [nvarchar](1) NOT NULL,
	[codusu] [nvarchar](6) NOT NULL,
	[fecsys] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_pacestudios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_pacestudios](
	[conhis] [nvarchar](11) NOT NULL,
	[codest] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_pacientes]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_pacientes](
	[conhis] [nvarchar](11) NOT NULL,
	[tipidu] [nvarchar](2) NOT NULL,
	[docpac] [nvarchar](50) NOT NULL,
	[ap1pac] [nvarchar](20) NOT NULL,
	[ap2pac] [nvarchar](20) NOT NULL,
	[nompac] [nvarchar](20) NOT NULL,
	[nompac2] [nvarchar](20) NOT NULL,
	[dirpac] [nvarchar](40) NOT NULL,
	[coddep] [nvarchar](2) NOT NULL,
	[codmun] [nvarchar](3) NOT NULL,
	[codzon] [nvarchar](1) NOT NULL,
	[telpac] [nvarchar](13) NOT NULL,
	[fecnac] [datetime] NOT NULL,
	[edapac] [numeric](3, 0) NOT NULL,
	[tipeda] [numeric](1, 0) NOT NULL,
	[sexpac] [nvarchar](1) NOT NULL,
	[estrpac] [numeric](1, 0) NOT NULL,
	[ecivil] [nvarchar](10) NOT NULL,
	[estpac] [numeric](3, 2) NOT NULL,
	[codser] [nvarchar](2) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[docemp] [nvarchar](12) NOT NULL,
	[fecing] [datetime] NOT NULL,
	[tipusu] [numeric](1, 0) NOT NULL,
	[codpariente] [nvarchar](2) NOT NULL,
	[beneficiario] [bit] NOT NULL,
	[conhistit] [nvarchar](11) NOT NULL,
	[codusu] [nvarchar](6) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[nombre] [nvarchar](80) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_pacmedicinas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_pacmedicinas](
	[conhis] [nvarchar](11) NOT NULL,
	[coddro] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_pacprotesis]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_pacprotesis](
	[conhis] [nvarchar](11) NOT NULL,
	[codprot] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_paczonas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_paczonas](
	[conhis] [nvarchar](11) NOT NULL,
	[codzon] [nvarchar](3) NOT NULL,
	[fecexp] [datetime] NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_pagos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_pagos](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[forpag] [nvarchar](2) NOT NULL,
	[codbco] [nvarchar](2) NOT NULL,
	[valpag] [numeric](13, 2) NOT NULL,
	[valdev] [numeric](13, 2) NOT NULL,
	[fecpag] [datetime] NOT NULL,
	[afedoc] [nvarchar](10) NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[tipord] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_parametros]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_parametros](
	[codpar] [nvarchar](2) NOT NULL,
	[codcre] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_parentescos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_parentescos](
	[codpar] [nvarchar](2) NOT NULL,
	[nompar] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_procedimientos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_procedimientos](
	[codcen] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[codser] [nvarchar](2) NOT NULL,
	[codtar] [nvarchar](3) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[fecord] [datetime] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[estord] [nvarchar](1) NOT NULL,
	[numpag] [nvarchar](8) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_protesis]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_protesis](
	[codprot] [nvarchar](3) NOT NULL,
	[nomprot] [nvarchar](40) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_reservas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_reservas](
	[codalm] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[feccita] [datetime] NOT NULL,
	[horacita] [nvarchar](5) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[turno] [nvarchar](3) NOT NULL,
	[estres] [nvarchar](1) NOT NULL,
	[codusu] [nvarchar](15) NOT NULL,
	[fecsys] [datetime] NOT NULL
	[citahis] [nvarchar](1) NOT NULL,
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_resultados]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_resultados](
	[conhis] [nvarchar](11) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codest] [nvarchar](3) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[fecres] [datetime] NOT NULL,
	[resultado] [text] NOT NULL,
	[codusu] [nvarchar](6) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_servicios]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_servicios](
	[codser] [nvarchar](2) NOT NULL,
	[nomser] [nvarchar](30) NOT NULL,
	[codtar] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_sicologia]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_sicologia](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numdoc] [nvarchar](8) NOT NULL,
	[feceva] [datetime] NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[codemp] [nvarchar](5) NOT NULL,
	[motconsulta] [text] NOT NULL,
	[otrobs] [text] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_tarifas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_tarifas](
	[codtar] [nvarchar](3) NOT NULL,
	[nomtar] [nvarchar](30) NOT NULL,
	[añotar] [numeric](4, 0) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_tipoestudio]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_tipoestudio](
	[codtip] [nvarchar](2) NOT NULL,
	[nomtip] [nvarchar](40) NOT NULL,
	[aplica] [bit] NOT NULL,
	[codcue] [nvarchar](8) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_turnos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_turnos](
	[codmed] [nvarchar](2) NOT NULL,
	[dia] [numeric](1, 0) NOT NULL,
	[horaentam] [nvarchar](5) NOT NULL,
	[horasalam] [nvarchar](5) NOT NULL,
	[horaentpm] [nvarchar](5) NOT NULL,
	[horasalpm] [nvarchar](5) NOT NULL,
	[codcons] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cli_zonas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cli_zonas](
	[codzon] [nvarchar](3) NOT NULL,
	[nomzon] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[far_receta]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[far_receta](
	[codcen] [nvarchar](3) NOT NULL,
	[conhis] [nvarchar](11) NOT NULL,
	[numord] [nvarchar](10) NOT NULL,
	[codins] [nvarchar](8) NOT NULL,
	[qtyins] [numeric](5, 0) NOT NULL,
	[qtyent] [numeric](5, 0) NOT NULL,
	[dosis] [text] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lab_detaresult]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lab_detaresult](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[codcen] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[codest] [nvarchar](5) NOT NULL,
	[codtop] [nvarchar](3) NOT NULL,
	[resultado] [nvarchar](150) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lab_otrasobs]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lab_otrasobs](
	[conhis] [nvarchar](11) NOT NULL,
	[fecres] [datetime] NOT NULL,
	[otrobs] [text] NOT NULL,
	[codusu] [nvarchar](10) NOT NULL,
	[fecsys] [datetime] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lab_resultados]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lab_resultados](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numfac] [nvarchar](8) NOT NULL,
	[codest] [nvarchar](5) NOT NULL,
	[qtyent] [numeric](5, 0) NOT NULL,
	[key_] [numeric](10, 0) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lab_topicos]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lab_topicos](
	[codtop] [nvarchar](3) NOT NULL,
	[nomtop] [nvarchar](30) NOT NULL,
	[codest] [nvarchar](5) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[odt_examen]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[odt_examen](
	[conhis] [nvarchar](11) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[numord] [nvarchar](8) NOT NULL,
	[numdte] [nvarchar](2) NOT NULL,
	[codpza] [numeric](1, 0) NOT NULL,
	[diaexa] [numeric](1, 0) NOT NULL,
	[diatrat] [numeric](1, 0) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[psi_acceso]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[psi_acceso](
	[conhis] [nvarchar](11) NOT NULL,
	[keyhis] [nvarchar](10) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[fecsys] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[psi_detalle]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[psi_detalle](
	[conhis] [nvarchar](11) NOT NULL,
	[codprg] [nvarchar](2) NOT NULL,
	[otrobs] [text] NOT NULL,
	[timestamp_column] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[psi_maestro]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[psi_maestro](
	[conhis] [nvarchar](11) NOT NULL,
	[nompadre] [nvarchar](40) NOT NULL,
	[edapadre] [numeric](3, 0) NOT NULL,
	[estpadre] [nvarchar](30) NOT NULL,
	[ocupadre] [nvarchar](15) NOT NULL,
	[nommadre] [nvarchar](40) NOT NULL,
	[edamadre] [numeric](3, 0) NOT NULL,
	[estmadre] [nvarchar](30) NOT NULL,
	[ocumadre] [nvarchar](15) NOT NULL,
	[codmed] [nvarchar](2) NOT NULL,
	[fecsys] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[psi_preguntas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[psi_preguntas](
	[codprg] [nvarchar](2) NOT NULL,
	[nomprg] [nvarchar](60) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[psi_respuestas]    Script Date: 30/03/2022 8:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[psi_respuestas](
	[codprg] [nvarchar](2) NOT NULL,
	[codres] [nvarchar](3) NOT NULL,
	[nomres] [nvarchar](25) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO



IF NOT EXISTS(Select * From dbo.sysobjects Where name='cli_pacantecedentes')
begin 
CREATE TABLE cli_pacantecedentes (
	conhis nvarchar (11) not null default (''),
	codant nvarchar (8) not null default (''),
	obsant nvarchar (max) not null default (''),
	fecsys datetime not null default (getdate()),
	codusu nvarchar (11) not null default ('')
);
end

IF NOT EXISTS(Select * From dbo.sysobjects Where name='cli_teo')
begin 
CREATE TABLE cli_teo (
	conhis nvarchar (11) not null default (''),
	antprenat nvarchar (max) not null default (''),
	antperinat nvarchar (max) not null default (''),
	antpostnat nvarchar (max) not null default (''),
	antmedreha nvarchar (max) not null default (''),
	antfamiliar nvarchar (max) not null default (''),
	fecsys datetime not null default (getdate()),
	codusu nvarchar (10) not null default ('')
);
end

/*IF NOT EXISTS(Select * From dbo.sysobjects Where name='cli_pacevaluacion')
begin 
CREATE TABLE cli_pacevaluacion (
	conhis nvarchar (11) not null default (''),
	codant nvarchar (8) not null default (''),
	valant bit not null default (0),
	observa nvarchar (max) not null default (''),
	fecsys datetime not null default (getdate()),
	codusu nvarchar (11) not null default ('')
);
end*/


--ADICIONAR CAMPOS

/*IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_motivos' AND T.column_name = 'conhis') 
begin
ALTER TABLE cli_motivos add conhis nvarchar (11) not null default ('')
end 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_motivos' AND T.column_name = 'numord') 
begin
ALTER TABLE cli_motivos add numord nvarchar (8) not null default ('')
end*/

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'observa') 
begin
ALTER TABLE cli_consultas add observa nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'formulacion') 
begin
ALTER TABLE cli_consultas add formulacion nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'analisis') 
begin
ALTER TABLE cli_consultas add analisis nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'feciniformula') 
begin
ALTER TABLE cli_consultas add feciniformula datetime not null default (getdate())
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'antocupacion') 
begin
ALTER TABLE cli_teo add antocupacion nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'comunicacion') 
begin
ALTER TABLE cli_teo add comunicacion nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'movilidad') 
begin
ALTER TABLE cli_teo add movilidad nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'cuidpersonal') 
begin
ALTER TABLE cli_teo add cuidpersonal nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'viddomestica') 
begin
ALTER TABLE cli_teo add viddomestica nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item1') 
begin
ALTER TABLE cli_teo add item1 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item2') 
begin
ALTER TABLE cli_teo add item2 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item3') 
begin
ALTER TABLE cli_teo add item3 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item3') 
begin
ALTER TABLE cli_teo add item3 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item4') 
begin
ALTER TABLE cli_teo add item4 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item5') 
begin
ALTER TABLE cli_teo add item5 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item6') 
begin
ALTER TABLE cli_teo add item6 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item7') 
begin
ALTER TABLE cli_teo add item7 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item8') 
begin
ALTER TABLE cli_teo add item8 decimal(1,0) not null default (0)
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item1observa') 
begin
ALTER TABLE cli_teo add item1observa nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item2observa') 
begin
ALTER TABLE cli_teo add item2observa nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item3observa') 
begin
ALTER TABLE cli_teo add item3observa nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item4observa') 
begin
ALTER TABLE cli_teo add item4observa nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item5observa') 
begin
ALTER TABLE cli_teo add item5observa nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item6observa') 
begin
ALTER TABLE cli_teo add item6observa nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item7observa') 
begin
ALTER TABLE cli_teo add item7observa nvarchar(max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_teo' AND T.column_name = 'item8observa') 
begin
ALTER TABLE cli_teo add item8observa nvarchar(max) not null default ('')
end

-- AMPLIAR CAMPOS
/*
IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_motivos' AND T.column_name = 'nommot' and t.CHARACTER_MAXIMUM_LENGTH!=200)
begin
ALTER TABLE cli_motivos ALTER COLUMN nommot nvarchar (max) not null 
end

IF  EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_motivos' AND T.column_name = 'codmot' and t.CHARACTER_MAXIMUM_LENGTH!=10)
begin
ALTER TABLE cli_motivos ALTER COLUMN codmot nvarchar (10) not null
end
*/




IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'autocontrol') 
begin
alter table cli_consultas add autocontrol nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'autoregulacion') 
begin
alter table cli_consultas add autoregulacion nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'cognitivas') 
begin
alter table cli_consultas add cognitivas nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'compocupacion') 
begin
alter table cli_consultas add compocupacion nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'fecfinformula') 
begin
alter table cli_consultas add fecfinformula datetime not null default (getdate())
end 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'habmotorbasicas') 
begin
alter table cli_consultas add habmotorbasicas nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'habmotorfinas') 
begin
alter table cli_consultas add habmotorfinas nvarchar (max) not null default ('')
end 

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'habmotorgruesa') 
begin
alter table cli_consultas add habmotorgruesa nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'habvestibular') 
begin
alter table cli_consultas add habvestibular nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'habvisual') 
begin
alter table cli_consultas add habvisual nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'hitodesar') 
begin
alter table cli_consultas add hitodesar nvarchar (max) not null default ('')
end

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.table_name = 'cli_consultas' AND T.column_name = 'visomotriz') 
begin
alter table cli_consultas add visomotriz nvarchar (max) not null default ('')
Print 'cli_consultas - visomotriz'
end

-- Script Modificaciones Modulo Clinico

IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'alm_articulos' and COLUMN_NAME = 'codesp' )
BEGIN 
	ALTER TABLE alm_articulos ADD codesp nvarchar(2) not null default ('')
	Print 'alm_articulos - codesp'
END

IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'cli_reservas' and COLUMN_NAME = 'codser' )
BEGIN 
	ALTER TABLE cli_reservas ADD codser nvarchar(10) not null default ('')
	Print 'cli_reservas - codser'
END

IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'alm_articulos' and COLUMN_NAME = 'copago' )
BEGIN 
	ALTER TABLE alm_articulos ADD copago nvarchar(4) not null default ('')
	Print 'alm_articulos - copago'
END


-- TABLA CUPS

	CREATE TABLE [dbo].[cli_cups](
	[codpunto] [nvarchar](30) NOT NULL DEFAULT (''),
	[codcups] [nvarchar](30) NOT NULL DEFAULT (''),
	[descups] [nvarchar](max) NOT NULL DEFAULT (''),
	[fecsys] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


-- ALTER TABLA CLI_FINALIDAD
IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'cli_finalidad' and COLUMN_NAME = 'nomfin' )
BEGIN 
    ALTER TABLE cli_finalidad alter column nomfin nvarchar(200)
	Print 'cli_finalidad - nomfin'
END
GO
IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'cli_consultas' and COLUMN_NAME = 'codcups' )
BEGIN 
    ALTER TABLE cli_consultas ADD codcups nvarchar(20) not null default ('')
	Print 'cli_consultas - codcups'
END
GO
IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'cli_consultas' and COLUMN_NAME = 'codfin' )
BEGIN 
    ALTER TABLE cli_consultas ADD codfin nvarchar(8) not null default ('')
	Print 'cli_consultas - codfin'
END
GO
--Agregado el 29-01-2024 si esta en 1 agarra el turno en el medico y en 0 en los servicios
IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Glb_parametros' and COLUMN_NAME = 'turnomed' )
BEGIN 
    ALTER TABLE Glb_parametros  ADD turnomed bit not null default (1)
	Print 'Glb_parametros  - turnomed'
END
GO
-- Agregado el 29-01-2024 Duraciòn de la consulta cuando turnomed=1
IF NOT EXISTS(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Alm_articulos' and COLUMN_NAME = 'Durservicio' )
BEGIN 
    ALTER TABLE Alm_articulos  ADD Durservicio decimal(10,0) not null default (0)
	Print 'Alm_articulos  - Durservicio'
END
GO
