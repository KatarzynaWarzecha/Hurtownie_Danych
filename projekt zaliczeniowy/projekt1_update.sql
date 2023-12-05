update carrier
set 
      carrier.[carrier_id] = [carrier_update].[carrier_id]
	  ,carrier.[carrier_name] = [carrier_update].[carrier_name]
      ,carrier.[address] = [carrier_update].[address]
      ,carrier.[tax_id] = [carrier_update].[tax_id]
      ,carrier.[contact_person] = [carrier_update].[contact_person]
     
  FROM [projekt_staging].[dbo].[carrier] carrier
  INNER JOIN [projekt_staging].[dbo].[carrier_update]  on carrier.carrier_id = [carrier_update].carrier_id;


  truncate table [projekt_staging].[dbo].[carrier_update];

  update customers
set 
      customers.[id] = [customers_update].[id]
	  ,customers.[first_name] = [customers_update].[first_name]
      ,customers.[last_name] = [customers_update].[last_name]
      ,customers.[street] = [customers_update].[street]
      ,customers.[city] = [customers_update].[city]
	  ,customers.[state] = [customers_update].[state]
      ,customers.[country] = [customers_update].[country]
      ,customers.[phone] = [customers_update].[phone]
      ,customers.[email] = [customers_update].[email]
     
  FROM [projekt_staging].[dbo].[customers] customers
  INNER JOIN [projekt_staging].[dbo].[customers_update]  on customers.id = [customers_update].id;

  truncate table [projekt_staging].[dbo].[customers_update];


    update sales
set 
      sales.[transactionID] = [sales_update].[transactionID]
	  ,sales.[carrierID] = [sales_update].[carrierID]
      ,sales.[customerID] = [sales_update].[customerID]
      ,sales.[amount] = [sales_update].[amount]
      ,sales.[date] = [sales_update].[date]
	       
  FROM [projekt_staging].[dbo].[sales] sales
  INNER JOIN [projekt_staging].[dbo].[sales_update]  on sales.transactionID = [sales_update].transactionID;

  truncate table [projekt_staging].[dbo].[sales_update];

  truncate table [projekt_staging].[dbo].[FactSales_update];
