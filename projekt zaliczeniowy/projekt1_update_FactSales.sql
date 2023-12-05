USE [projekt_staging]
GO

/****** Object:  Table [dbo].[sales]    Script Date: 05.12.2023 18:20:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sales](
	[transactionID] [bigint] NULL,
	[carrierID] [bigint] NULL,
	[customerID] [bigint] NULL,
	[amount] [varchar](5) NULL,
	[date] [datetime] NULL
) ON [PRIMARY]
GO


 update FactSales
set 
       FactSales.[date] = [FactSales_update].[date]
	  ,FactSales.[amount] = [FactSales_update].[amount]
      ,FactSales.[DateKey] = [FactSales_update].[DateKey]
	       
  FROM [dbo].[FactSales] FactSales
  INNER JOIN [dbo].[FactSales_update]  on FactSales.transactionID = [FactSales_update].transactionID;

