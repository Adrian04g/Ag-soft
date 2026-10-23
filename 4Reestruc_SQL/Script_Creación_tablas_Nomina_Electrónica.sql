SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_anticiposNom_ded')
BEGIN

CREATE TABLE [dbo].[ne_anticiposNom_ded](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[anticipo] [decimal](18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_anticiposNom_ded] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_anticiposNom_ded'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_fondosPensiones')
BEGIN

CREATE TABLE [dbo].[ne_fondosPensiones](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[deduccion] [decimal](18,4) NOT NULL DEFAULT(0),
	[porcentaje] [decimal] (18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_anticipos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_fondosPensiones'  
END

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_fondosSP')
BEGIN

CREATE TABLE [dbo].[ne_fondosSP](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[deduccionSP] [decimal](18,4) NOT NULL DEFAULT(0),
	[deduccionSub] [decimal] (18,4) NOT NULL DEFAULT(0),
	[porcentaje] [decimal](18,4) NOT NULL DEFAULT(0),
	[porcentajeSub] [decimal] (18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_fondosSP] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_fondosSP'  
END

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_libranzas')
BEGIN

CREATE TABLE [dbo].[ne_libranzas](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[deduccion] [decimal](18,4) NOT NULL DEFAULT(0),
	[descripcion] [nvarchar](100) NOT NULL,
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_libranzas] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_libranzas'  
END

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_pagosTerceros')
BEGIN

CREATE TABLE [dbo].[ne_pagosTerceros](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[pagoTercero] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_pagosTerceros] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_pagosTerceros'  
END

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_otrasDeducciones')
BEGIN

CREATE TABLE [dbo].[ne_otrasDeducciones](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[montootraDeduccion] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_otrasDeducciones] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_otrasDeducciones'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_salud')
BEGIN

CREATE TABLE [dbo].[ne_salud](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[deduccion] [decimal](18,4) NOT NULL DEFAULT(0),
	[porcentaje] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_salud] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_salud'  
END

IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_sanciones')
BEGIN

CREATE TABLE [dbo].[ne_sanciones](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[sancionPublic] [decimal](18,4) NOT NULL DEFAULT(0),
	[sancionPriv] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_sanciones] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_sanciones'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_sindicatos')
BEGIN

CREATE TABLE [dbo].[ne_sindicatos](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[deduccion] [decimal](18,4) NOT NULL DEFAULT(0),
	[porcentaje] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_sindicatos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_sindicatos'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_deducciones')
BEGIN

CREATE TABLE [dbo].[ne_deducciones](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
    [afc] [decimal](18,4) NOT NULL DEFAULT(0),
	[cooperativa] [decimal](18,4) NOT NULL DEFAULT(0),
    [deuda] [decimal](18,4) NOT NULL DEFAULT(0),
	[educacion] [decimal](18,4) NOT NULL DEFAULT(0),
	[embargoFiscal] [decimal](18,4) NOT NULL DEFAULT(0),
	[pensionVoluntaria] [decimal](18,4) NOT NULL DEFAULT(0),
	[planComplementarios] [decimal](18,4) NOT NULL DEFAULT(0),
	[reintegro] [decimal](18,4) NOT NULL DEFAULT(0),
	[retencionFuente] [decimal](18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_deducciones] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_deducciones'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_anticiposNom_dev')
BEGIN

CREATE TABLE [dbo].[ne_anticiposNom_dev](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[montoanticipo] [decimal](18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_anticiposNom_dev] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_anticiposNom_dev'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_auxilios')
BEGIN

CREATE TABLE [dbo].[ne_auxilios](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[auxilioNS] [decimal](18,4) NOT NULL DEFAULT(0),
	[auxilioS] [decimal](18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_auxilios] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_auxilios'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_basico')
BEGIN

CREATE TABLE [dbo].[ne_basico](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[diasTrabajados] [decimal](18,4) NOT NULL DEFAULT(0),
	[sueldoTrabajado] [decimal](18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_basico] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_basico'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_bonificaciones')
BEGIN

CREATE TABLE [dbo].[ne_bonificaciones](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[bonificacionNS] [decimal](18,4) NOT NULL DEFAULT(0),
	[bonificacionS] [decimal](18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_bonificaciones] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_bonificaciones'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_cesantias')
BEGIN

CREATE TABLE [dbo].[ne_cesantias](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),
	[pagoIntereses] [decimal](18,4) NOT NULL DEFAULT(0),
	[porcentaje] [decimal](18,4) NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_cesantias] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_cesantias'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_comisiones')
BEGIN

CREATE TABLE [dbo].[ne_comisiones](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[montocomision] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_comisiones] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_comisiones'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_compensaciones')
BEGIN

CREATE TABLE [dbo].[ne_compensaciones](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[compensacionE] [decimal](18,4) NOT NULL DEFAULT(0),	
	[compensacionO] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_compensaciones] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_compensaciones'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_horasExtras')
BEGIN

CREATE TABLE [dbo].[ne_horasExtras](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[porcentaje] [decimal](18,4) NOT NULL DEFAULT(0),	
	[tipoHorasExtra] [nvarchar](20) NOT NULL DEFAULT(''),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_horasExtras] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_horasExtras'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_huelgasLegales')
BEGIN

CREATE TABLE [dbo].[ne_huelgasLegales](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),		
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_huelgasLegales] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_huelgasLegales'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_incapacidades')
BEGIN

CREATE TABLE [dbo].[ne_incapacidades](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),		
	[tipo] [nvarchar](1) NOT NULL DEFAULT (''),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_incapacidades] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_incapacidades'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_licenciaMP')
BEGIN

CREATE TABLE [dbo].[ne_licenciaMP](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_licenciaMP] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_licenciaMP'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_licenciaNR')
BEGIN

CREATE TABLE [dbo].[ne_licenciaNR](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_licenciaNR] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_licenciaNR'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_licenciaR')
BEGIN

CREATE TABLE [dbo].[ne_licenciaR](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_licenciaR] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_licenciaR'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_licenciaR')
BEGIN

CREATE TABLE [dbo].[ne_licenciaR](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_licenciaR] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_licenciaR'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_otrosConceptos')
BEGIN

CREATE TABLE [dbo].[ne_otrosConceptos](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[conceptoNS] [decimal](18,4) NOT NULL DEFAULT(0),	
	[conceptoS] [decimal](18,4) NOT NULL DEFAULT(0),	
	[descripcionConcepto] [nvarchar](200) NOT NULL DEFAULT(''),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_otrosConceptos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_otrosConceptos'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_primas')
BEGIN

CREATE TABLE [dbo].[ne_primas](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[pagoNS] [decimal](18,4) NOT NULL DEFAULT(''),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_primas] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_primas'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_transporte')
BEGIN

CREATE TABLE [dbo].[ne_transporte](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[auxilioTransporte] [decimal](18,4) NOT NULL DEFAULT(0),	
	[sueldoTrabajado] [decimal](18,4) NOT NULL DEFAULT(0),	
	[viaticoManuAlojNS] [decimal](18,4) NOT NULL DEFAULT(''),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_transporte] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_transporte'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_vacacionesComunes')
BEGIN

CREATE TABLE [dbo].[ne_vacacionesComunes](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_vacacionesComunes] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_vacacionesComunes'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_vacacionesCompensadas')
BEGIN

CREATE TABLE [dbo].[ne_vacacionesCompensadas](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cantidad] [decimal](18,4) NOT NULL DEFAULT(0),	
	[horaInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[horaFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[pago] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_vacacionesCompensadas] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_vacacionesCompensadas'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_devengados')
BEGIN

CREATE TABLE [dbo].[ne_devengados](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[apoyoSost] [decimal](18,4) NOT NULL DEFAULT(0),
	[bonifRetiro] [decimal](18,4) NOT NULL DEFAULT(0),	
	[dotacion] [decimal](18,4) NOT NULL DEFAULT(0),	
	[indemnizacion] [decimal](18,4) NOT NULL DEFAULT(0),	
	[reintegro] [decimal](18,4) NOT NULL DEFAULT(0),
	[teletrabajo] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_devengados] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_devengados'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_documentosReferenciados')
BEGIN

CREATE TABLE [dbo].[ne_documentosReferenciados](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cunePred] [nvarchar](200) NOT NULL DEFAULT(''),
	[fechaGenPred] [datetime] NOT NULL DEFAULT('19000101'),	
	[numeroPred] [nvarchar](200) NOT NULL DEFAULT(''),		
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_documentosReferenciados] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_documentosReferenciados'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_notas')
BEGIN

CREATE TABLE [dbo].[ne_notas](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[cunePred] [nvarchar](200) NOT NULL DEFAULT(''),
	[fechaGenPred] [datetime] NOT NULL DEFAULT('19000101'),	
	[numeroPred] [nvarchar](200) NOT NULL DEFAULT(''),		
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_notas] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_notas'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_fechasPagos')
BEGIN

CREATE TABLE [dbo].[ne_fechasPagos](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,
	[item1] [int] NOT NULL,
	[fechasPagos] [datetime] NOT NULL DEFAULT('19000101'),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_fechasPagos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[item1] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_fechasPagos'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_pagos')
BEGIN

CREATE TABLE [dbo].[ne_pagos](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,	
	[fechapagonomina] [datetime] NOT NULL DEFAULT('19000101'),	
	[metodoDePago] [nvarchar](1) NOT NULL DEFAULT(''),	
	[medioPago] [nvarchar](3) NOT NULL DEFAULT(''),	
	[nombreBanco] [nvarchar](50) NOT NULL DEFAULT(''),	
	[tipoCuenta] [nvarchar](50) NOT NULL DEFAULT(''),	
	[numeroCuenta] [nvarchar](50) NOT NULL DEFAULT(''),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_pagos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_pagos'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_periodos')
BEGIN

CREATE TABLE [dbo].[ne_periodos](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[item] [int] NOT NULL,	
	[fechaIngreso] [datetime] NOT NULL DEFAULT('19000101'),	
	[fechaLiquidacionInicio] [datetime] NOT NULL DEFAULT('19000101'),	
	[fechaLiquidacionFin] [datetime] NOT NULL DEFAULT('19000101'),	
	[fechaRetiro] [datetime] NOT NULL DEFAULT('19000101'),	
	[tiempoLaborado] [decimal](18,4) NOT NULL DEFAULT(0),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_periodos] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[item] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_periodos'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_lugarGeneracionXML')
BEGIN

CREATE TABLE [dbo].[ne_lugarGeneracionXML](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,	
	[departamentoEstado] [nvarchar](2) NOT NULL DEFAULT(''),	
	[idioma] [nvarchar](2) NOT NULL DEFAULT(''),	
	[municipioCiudad] [nvarchar](5) NOT NULL DEFAULT(''),	
	[pais] [nvarchar](2) NOT NULL DEFAULT(''),	
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_lugarGeneracionXML] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_lugarGeneracionXML'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_trabajador')
BEGIN

CREATE TABLE [dbo].[ne_trabajador](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[altoRiesgoPension] [nvarchar](1) NOT NULL DEFAULT(''),
	[codigoTrabajador] [nvarchar](2) NOT NULL DEFAULT(''),
	[subTipoTrabajador] [nvarchar](2) NOT NULL DEFAULT(''), 
	[salarioIntegral] [nvarchar](1) NOT NULL DEFAULT(''),
	[tipoContrato] [nvarchar](1) NOT NULL DEFAULT(''), 
	[tipoTrabajador] [nvarchar](2) NOT NULL DEFAULT(''), 
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
 CONSTRAINT [PK_ne_trabajador] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_trabajador'  
END
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'ne_objNomina')
BEGIN

CREATE TABLE [dbo].[ne_objNomina](
	[idemp] [nvarchar](3) NOT NULL,
	[año] [nvarchar](4) NOT NULL,
	[mes] [nvarchar](2) NOT NULL,
	[cod_emple] [nvarchar](4) NOT NULL,
	[consecutivoDocumentoNom] [nvarchar](20) NOT NULL DEFAULT(''),
	[fechaEmisionNom] [datetime] NOT NULL DEFAULT('19000101'),
	[novedad] [nvarchar](1) NOT NULL DEFAULT(''),
	[novedadCUNE] [nvarchar](96) NOT NULL DEFAULT(''),
	[periodoNomina] [nvarchar](1) NOT NULL DEFAULT(''),
	[rangoNumeracionNom] [nvarchar](20) NOT NULL DEFAULT(''),
	[redondeo] [decimal](18,4) NOT NULL DEFAULT(0),
	[tipoDocumentoNom] [nvarchar](3) NOT NULL DEFAULT(''),
	[tipoMonedaNom] [nvarchar](3) NOT NULL DEFAULT(''),
	[tipoNota] [nvarchar](1) NOT NULL DEFAULT(''),
	[totalComprobante] [decimal](18,4) NOT NULL DEFAULT(0),
	[totalDeducciones] [decimal](18,4) NOT NULL DEFAULT(0),
	[totalDevengados] [decimal](18,4) NOT NULL DEFAULT(0),
	[trm] [decimal](18,4) NOT NULL DEFAULT(0),
	[estado] [bit] NOT NULL DEFAULT(0),
	[fecsys] [datetime] NOT NULL DEFAULT (GETDATE()),
	[servidor] [nvarchar](60) NOT NULL DEFAULT (''),	
	[codigo] [nvarchar](3) NOT NULL DEFAULT(''),
	[mensaje] [nvarchar](200) NOT NULL DEFAULT(''),
	[resultado] [nvarchar](20) NOT NULL DEFAULT(''),
	[cune] [nvarchar](100) NOT NULL DEFAULT(''),
	[trackId] [nvarchar](100) NOT NULL DEFAULT(''),
	[qr] [nvarchar](max) NOT NULL DEFAULT(''),
	[esvalidoDIAN] [bit] NOT NULL DEFAULT(0),
	[json] [nvarchar](max) NOT NULL DEFAULT (''),
	[reglasNotificacionesTFHKA][nvarchar](max) NOT NULL DEFAULT (''),
	[reglasNotificacionesDIAN][nvarchar](max) NOT NULL DEFAULT (''),
	[reglasRechazoTFHKA][nvarchar](max) NOT NULL DEFAULT (''),
	[reglasRechazoDIAN][nvarchar](max) NOT NULL DEFAULT ('')
 CONSTRAINT [PK_ne_objNomina] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[año] ASC,
	[mes] ASC,
	[cod_emple] ASC,
	[fecsys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Print 'ne_objNomina'  
END


