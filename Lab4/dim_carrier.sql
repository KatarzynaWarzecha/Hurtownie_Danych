USE [cw4]
GO

/****** Object:  Table [dbo].[carrier]    Script Date: 17.11.2023 19:47:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_carrier](
	[CarrierKey] INT IDENTITY (1,1),
	[carrier_id] [varchar](50) NULL,
	[carrier_name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[tax_id] [varchar](50) NULL,
	[contact_person] [varchar](50) NULL,
	[start_date] date,
	[end_date] date
) ON [PRIMARY]
GO


