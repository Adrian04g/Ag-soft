IF NOT EXISTS (SELECT * FROM sysdatabases WHERE (name = 'GlobalSoftLogin')) 
BEGIN
CREATE DATABASE [GlobalSoftLogin]
END
GO
USE [GlobalSoftLogin]
GO

/****** Object:  Table [dbo].[centros]    Script Date: 23/03/2021 2:21:43 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'centros')
begin 
CREATE TABLE [dbo].[centros](
	[idemp] [nvarchar](3) NOT NULL,
	[codcto] [nvarchar](3) NOT NULL,
	[descri] [nvarchar](100) NOT NULL,
	[idemp_equiv] [nvarchar](3) NOT NULL,
	[codcto_equiv] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_centros] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codcto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO


/****** Object:  Table [dbo].[empresas]    Script Date: 23/03/2021 2:22:17 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (Select * From Information_Schema.Columns AS T Where T.Table_Name = 'empresas')
begin 

CREATE TABLE [dbo].[empresas](
	[codigo] [nvarchar](20) NOT NULL,
	[nitemp] [nvarchar](20) NOT NULL,
	[razonsocial] [nvarchar](100) NOT NULL,
	[estado] [bit] NOT NULL,
	[servidor] [nvarchar](100) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[clave] [nvarchar](50) NOT NULL,
	[basededatos] [nvarchar](20) NOT NULL,
	[fechavencimiento] [smalldatetime] NOT NULL,
	[codempresa] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_empresas] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO
--- 21- 07-2021 tabla Agregada por Enuar para control de acceso
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'emp_parametros' )
CREATE TABLE emp_parametros (
    par_id INT PRIMARY KEY IDENTITY (1, 1),
    generallog BIT NOT NULL DEFAULT(0),
    --last_name VARCHAR (50) NOT NULL,
    FOREIGN KEY (par_id) REFERENCES emp_parametros (par_id)
);
GO
INSERT INTO emp_parametros(generallog)
VALUES (0);