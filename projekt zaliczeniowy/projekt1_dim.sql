USE [projekt]
GO

/****** Object:  Table [dbo].[carrier]    Script Date: 04.12.2023 22:36:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_carrier](
	[CarrierKey] INT IDENTITY (1,1),
	[carrier_id] [int] NULL,
	[carrier_name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[tax_id] [int] NULL,
	[contact_person] [varchar](50) NULL,
	[start_date] date,
	[end_date] date
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[customers]    Script Date: 04.12.2023 22:38:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_customers](
	[CustomerKey] INT IDENTITY (1,1),
	[id] [int] NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[street] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[start_date] date,
	[end_date] date
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sales]    Script Date: 05.12.2023 18:20:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_sales](
	[SalesKey] INT IDENTITY (1,1),
	[transactionID] [bigint] NULL,
	[carrierID] [bigint] NULL,
	[customerID] [bigint] NULL,
	[amount] [varchar](5) NULL,
	[date] [datetime] NULL,
	[start_date] date,
	[end_date] date
) ON [PRIMARY]
GO

CREATE TABLE DIM_Date (
    DateKey INT PRIMARY KEY,
    [Date] DATE,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT,
    DayOfWeek INT,
    DayOfYear INT,
    IsWeekend BIT,
    IsHoliday BIT, -- You may want to add holiday information
    -- Add more attributes as needed
);
 
-- Populate the Date Dimension table
DECLARE @StartDate DATE = '2000-01-01';
DECLARE @EndDate DATE = '2030-12-31';
 
-- You can adjust the start and end dates as needed
 
WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO DIM_Date (
        DateKey,
        [Date],
        Year,
        Quarter,
        Month,
        Week,
        Day,
        DayOfWeek,
        DayOfYear,
        IsWeekend
    )
    VALUES (
        CONVERT(INT, CONVERT(CHAR(8), @StartDate, 112)),
        @StartDate,
        YEAR(@StartDate),
        DATEPART(QUARTER, @StartDate),
        MONTH(@StartDate),
        DATEPART(WEEK, @StartDate),
        DAY(@StartDate),
        DATEPART(WEEKDAY, @StartDate),
        DATEPART(DAYOFYEAR, @StartDate),
        CASE WHEN DATEPART(WEEKDAY, @StartDate) IN (1, 7) THEN 1 ELSE 0 END
    );
 
    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;