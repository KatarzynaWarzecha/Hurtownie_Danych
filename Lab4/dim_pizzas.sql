USE [cw4]
GO

/****** Object:  Table [dbo].[pizzas_staging]    Script Date: 17.11.2023 19:30:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Pizzas](
	[PizzaKey] INT IDENTITY (1,1),
	[pizza_id] [varchar](14) NULL,
	[pizza_type_id] [varchar](12) NULL,
	[size] [varchar](3) NULL,
	[price] [varchar](5) NULL,
	[name] [varchar](42) NULL,
	[category] [varchar](7) NULL,
	[ingredients] [varchar](97) NULL,
	[start_date] date,
	[end_date] date
) ON [PRIMARY]
GO


