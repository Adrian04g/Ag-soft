/****** Object:  Table [dbo].[ven_rppi_categoriavariantes]    Script Date: 01/03/2022 10:47:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ven_rppi_categoriavariantes](
	[codcat] [int] IDENTITY(1,1) NOT NULL,
	[nomcat] [nvarchar](200) NULL,
 CONSTRAINT [PK_ven_rppi_categoriavariantes] PRIMARY KEY CLUSTERED 
(
	[codcat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ven_rppi_encabezado]    Script Date: 01/03/2022 10:48:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ven_rppi_encabezado](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[fecorden] [date] NOT NULL,
	[order_id] [nvarchar](20) NOT NULL,
	[created_at] [date] NOT NULL,
	[cooking_time] [numeric](18, 4) NOT NULL,
	[min_cooking_time] [numeric](18, 4) NOT NULL,
	[max_cooking_time] [numeric](18, 4) NOT NULL,
	[delivery_method] [nvarchar](20) NOT NULL,
	[payment_method] [nvarchar](5) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[billing_type] [nvarchar](20) NOT NULL,
	[document_number] [nvarchar](30) NOT NULL,
	[document_type] [nvarchar](5) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](40) NOT NULL,
	[total_products_with_discount] [numeric](18, 4) NOT NULL,
	[total_products_without_discount] [numeric](18, 4) NOT NULL,
	[total_other_discounts] [numeric](18, 4) NOT NULL,
	[total_order] [numeric](18, 4) NOT NULL,
	[total_to_pay] [numeric](18, 4) NOT NULL,
	[shipping] [numeric](18, 4) NOT NULL,
	[service_fee] [numeric](18, 4) NOT NULL,
	[tip] [numeric](18, 4) NOT NULL,
	[total_rappi_pay] [numeric](18, 4) NOT NULL,
	[total_rappi_credits] [numeric](18, 4) NOT NULL,
	[total_percentage_discount] [numeric](18, 4) NOT NULL,
	[total_value_discount] [numeric](18, 4) NOT NULL,
	[first_name] [nvarchar](60) NOT NULL,
	[last_name] [nvarchar](60) NOT NULL,
	[phone_number] [nvarchar](60) NOT NULL,
	[user_type] [nvarchar](20) NOT NULL,
	[internal_id] [nvarchar](30) NOT NULL,
	[external_id] [nvarchar](30) NOT NULL,
	[secondary_street_quadran] [nvarchar](40) NOT NULL,
	[complete_direction] [nvarchar](100) NOT NULL,
	[city] [nvarchar](60) NOT NULL,
	[meter] [nvarchar](60) NOT NULL,
	[secondary_street_number] [nvarchar](60) NOT NULL,
	[neighborhood] [nvarchar](60) NOT NULL,
	[main_street_type] [nvarchar](40) NOT NULL,
	[postal_code] [nvarchar](40) NOT NULL,
	[main_street_quadrant] [nvarchar](40) NOT NULL,
	[main_street_number] [nvarchar](40) NOT NULL,
	[venprefactura] [nvarchar](8) NULL,
	[state] [nvarchar](60) NULL,
	[ubic] [nvarchar](30) NULL,
	[fecsys] [datetime] NOT NULL,
 CONSTRAINT [PK_ven_rppi_encabezado] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[fecorden] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [cooking_time]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [min_cooking_time]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [max_cooking_time]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [delivery_method]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [payment_method]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [address]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [billing_type]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [document_number]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [document_type]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [email]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [name]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [phone]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_products_with_discount]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_products_without_discount]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_other_discounts]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_order]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_to_pay]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [shipping]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [service_fee]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [tip]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_rappi_pay]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_rappi_credits]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_percentage_discount]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [total_value_discount]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [first_name]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [last_name]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [phone_number]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [internal_id]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [external_id]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [secondary_street_quadran]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [complete_direction]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [city]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [meter]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [secondary_street_number]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [neighborhood]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [main_street_type]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [postal_code]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [main_street_quadrant]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [main_street_number]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [venprefactura]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [state]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT ('') FOR [ubic]
GO

ALTER TABLE [dbo].[ven_rppi_encabezado] ADD  DEFAULT (getdate()) FOR [fecsys]
GO


/****** Object:  Table [dbo].[ven_rppi_items]    Script Date: 01/03/2022 10:49:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ven_rppi_items](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[fecorden] [date] NOT NULL,
	[order_id] [nvarchar](20) NOT NULL,
	[item] [numeric](10, 0) NOT NULL,
	[created_at] [date] NOT NULL,
	[sku] [nvarchar](10) NOT NULL,
	[id] [nvarchar](20) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[type] [nvarchar](60) NOT NULL,
	[comments] [nvarchar](300) NOT NULL,
	[unit_price_with_discount] [numeric](18, 4) NOT NULL,
	[unit_price_without_discount] [numeric](18, 4) NOT NULL,
	[percentage_discount] [numeric](18, 4) NOT NULL,
	[quantity] [numeric](18, 4) NOT NULL,
 CONSTRAINT [PK_ven_rppi_items] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[fecorden] ASC,
	[order_id] ASC,
	[item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ('') FOR [sku]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ('') FOR [id]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ('') FOR [name]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ('') FOR [type]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ('') FOR [comments]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ((0)) FOR [unit_price_with_discount]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ((0)) FOR [unit_price_without_discount]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ((0)) FOR [percentage_discount]
GO

ALTER TABLE [dbo].[ven_rppi_items] ADD  DEFAULT ((0)) FOR [quantity]
GO



/****** Object:  Table [dbo].[ven_rppi_subitems]    Script Date: 01/03/2022 10:50:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ven_rppi_subitems](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[fecorden] [date] NOT NULL,
	[order_id] [nvarchar](20) NOT NULL,
	[item] [numeric](10, 0) NOT NULL,
	[subitem] [numeric](10, 0) NOT NULL,
	[created_at] [date] NOT NULL,
	[sku] [nvarchar](10) NOT NULL,
	[id] [nvarchar](20) NOT NULL,
	[type] [nvarchar](60) NOT NULL,
	[unit_price_with_discount] [numeric](18, 4) NOT NULL,
	[unit_price_without_discount] [numeric](18, 4) NOT NULL,
	[percentage_discount] [numeric](18, 4) NOT NULL,
	[quantity] [numeric](18, 4) NOT NULL,
 CONSTRAINT [PK_ven_rppi_subitems] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[fecorden] ASC,
	[order_id] ASC,
	[item] ASC,
	[subitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ven_rppi_subitems] ADD  DEFAULT ('') FOR [sku]
GO

ALTER TABLE [dbo].[ven_rppi_subitems] ADD  DEFAULT ('') FOR [id]
GO

ALTER TABLE [dbo].[ven_rppi_subitems] ADD  DEFAULT ('') FOR [type]
GO

ALTER TABLE [dbo].[ven_rppi_subitems] ADD  DEFAULT ((0)) FOR [unit_price_with_discount]
GO

ALTER TABLE [dbo].[ven_rppi_subitems] ADD  DEFAULT ((0)) FOR [unit_price_without_discount]
GO

ALTER TABLE [dbo].[ven_rppi_subitems] ADD  DEFAULT ((0)) FOR [percentage_discount]
GO

ALTER TABLE [dbo].[ven_rppi_subitems] ADD  DEFAULT ((0)) FOR [quantity]
GO

/****** Object:  Table [dbo].[ven_rppi_webhook]    Script Date: 01/03/2022 10:50:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ven_rppi_webhook](
	[idemp] [nvarchar](3) NOT NULL,
	[codalm] [nvarchar](3) NOT NULL,
	[storageId] [nvarchar](20) NOT NULL,
	[evento] [nvarchar](50) NOT NULL,
	[endpoint] [nvarchar](200) NOT NULL,
	[secret] [nvarchar](200) NOT NULL,
	[fechaconfig] [datetime] NOT NULL,
 CONSTRAINT [PK_ven_rppi_webhook] PRIMARY KEY CLUSTERED 
(
	[idemp] ASC,
	[codalm] ASC,
	[storageId] ASC,
	[evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





