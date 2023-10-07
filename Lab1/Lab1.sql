use [Pizza]
select * from [dbo].[pizza_sales];

--zad 1
with suma_zamowienia as (
select order_id, sum(total_price) as suma from [dbo].[pizza_sales] where order_date='2015-02-18' group by order_id
)
select avg(suma) as srednia from suma_zamowienia;

--zad 2
with bez_ananasa as (
select * from [dbo].[pizza_sales] where left(order_date,7) = '2015-03' and not pizza_ingredients like '%Pineapple%'
)
select order_date, string_agg(order_id,',') as lista_id from bez_ananasa group by order_date;

--zad 3
with suma_zamowienia2 as (
select order_id, sum(total_price) as suma from [dbo].[pizza_sales] where left(order_date,7) = '2015-02' group by order_id
)
select top (10) 
rank() over (
order by suma desc
) ranking,
order_id, suma from suma_zamowienia2;

--zad 4
select order_id,  sum(total_price) as kwota, avg(total_price) as srednia, month(order_date) miesiac from [dbo].[pizza_sales]  group by order_id, month(order_date);

--zad 5
with godziny as (
select quantity, order_date, order_time, DATEADD(HOUR, DATEDIFF(HOUR, 0, order_time), 0) as zaokraglenie from [dbo].[pizza_sales] where order_date = '2015-01-01'
)
select sum(quantity) as zamowienia,order_date, DATEPART(HOUR, zaokraglenie) as godzina from godziny group by zaokraglenie, order_date;

--zad 6
with popularnosc as (
select pizza_category,pizza_name, count(pizza_name) as liczba from [dbo].[pizza_sales] where left(order_date,7) = '2015-01'  group by pizza_category, pizza_name
)
select * from popularnosc order by liczba desc;

--zad 7
with suma_rozmiarow as (
select pizza_size, sum(quantity) as liczba from [dbo].[pizza_sales] where left(order_date,7) = '2015-02' or left(order_date,7) = '2015-03'  group by pizza_size
)
select * from suma_rozmiarow;



