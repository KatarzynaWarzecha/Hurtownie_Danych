/*USE [projekt]
GO

/****** Object:  Table [dbo].[FactSales]    Script Date: 05.12.2023 20:15:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactSales](
	[transactionID] [bigint] NULL,
	[amount] [varchar](5) NULL,
	[date] [datetime] NULL,
	[CarrierKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[DateKey] [int] NULL
) ON [PRIMARY]
GO
*/

select * from [dbo].[FactSales];

/*ranking kwot*/
SELECT 
    transactionID,
    CustomerKey,
	amount,
    RANK() OVER (PARTITION BY CarrierKey ORDER BY amount) AS ranking
FROM 
    [dbo].[FactSales];

/*procent dla ka¿dego CustomerKey*/
SELECT 
    transactionID,
    CustomerKey,
	amount,
    PERCENT_RANK() OVER (PARTITION BY CustomerKey ORDER BY amount) AS ranking_procentowy
FROM 
    [dbo].[FactSales];

/*dense rank*/
SELECT 
    transactionID,
    CustomerKey,
	amount,
    DENSE_RANK() OVER (PARTITION BY CustomerKey ORDER BY amount) AS dense_ranking
FROM 
    [dbo].[FactSales];



