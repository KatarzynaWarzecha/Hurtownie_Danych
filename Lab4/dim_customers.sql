USE [cw4]
GO

/****** Object:  Table [dbo].[customers]    Script Date: 17.11.2023 19:58:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_customers](
	[CustomersKey] INT IDENTITY (1,1),
	[id] [smallint] NULL,
	[first_name] [varchar](10) NULL,
	[last_name] [varchar](12) NULL,
	[street] [varchar](26) NULL,
	[city] [varchar](22) NULL,
	[state] [varchar](25) NULL,
	[country] [varchar](13) NULL,
	[phone] [varchar](12) NULL,
	[email] [varchar](35) NULL,
	[start_date] date,
	[end_date] date
) ON [PRIMARY]
GO


