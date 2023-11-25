--ALTER TABLE [dbo].[orders_full] ALTER COLUMN [customer_id] [smallint];
--ALTER TABLE [dbo].[DIM_Date] ALTER COLUMN [Date] [varchar](50);
--USE cw4;

--USE cw4_staging
--ALTER TABLE [dbo].[customers] ALTER COLUMN [id] [smallint];
--ALTER TABLE [dbo].[customers] DROP COLUMN [city];

--create view FactSalesCustomersView
--with schemabinding
--AS
--select [dbo].[FactSales].[OrderKey],[dbo].[FactSales].[order_id], [dbo].[FactSales].[date], [dbo].[DIM_customers].CustomersKey from [dbo].[FactSales]  
--inner join [dbo].[DIM_customers] on [dbo].[DIM_customers].CustomersKey = [dbo].[FactSales].CustomersKey;

--Zad 4
create unique clustered index IX_SalesCustomer 
on [dbo].[FactSalesCustomersView] ([OrderKey], [order_id], [date], [CustomersKey]);

