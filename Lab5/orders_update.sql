update ord
set 
      ord.[date] = [orders_update].[date]
	  ,ord.[order_id] = [orders_update].[order_id]
      ,ord.[customer_id] = [orders_update].[customer_id]
      ,ord.[time] = [orders_update].[time]
      ,ord.[carrier_id] = [orders_update].[carrier_id]
     
  FROM [cw4_staging].[dbo].[orders] ord
  INNER JOIN [cw4_staging].[dbo].[orders_update]  on ord.order_id = [orders_update].order_id;


  truncate table [cw4_staging].[dbo].[orders_update];

  update ordfull
set 
      ordfull.[order_id] = [update_orders_full].[order_id]
      ,ordfull.[date] = [update_orders_full].[date]
      ,ordfull.[customer_id] = [update_orders_full].[customer_id] 
      ,ordfull.[time] = [update_orders_full].[time]
      ,ordfull.[carrier_id] = [update_orders_full].[carrier_id]
      ,ordfull.[order_details_id] = [update_orders_full].[order_details_id]
      ,ordfull.[pizza_id] = [update_orders_full].[pizza_id]
      ,ordfull.[quantity] = [update_orders_full].[quantity]
     
  FROM [cw4_staging].[dbo].[orders_full] ordfull
  INNER JOIN [cw4_staging].[dbo].[update_orders_full]  on ordfull.order_id = [update_orders_full].order_id;

  update carr
set 
      carr.[carrier_id] = [carrier_update].[carrier_id],
	carr.[carrier_name] = [carrier_update].[carrier_name],
	carr.[address] = [carrier_update].[address],
	carr.[tax_id] = [carrier_update].[tax_id],
	carr.[contact_person] = [carrier_update].[contact_person]
     
  FROM [cw4_staging].[dbo].[carrier] carr
  INNER JOIN [cw4_staging].[dbo].[carrier_update]  on carr.carrier_id = [carrier_update].[carrier_id];