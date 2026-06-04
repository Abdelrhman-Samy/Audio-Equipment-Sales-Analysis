use product_sales;
SELECT DISTINCT
    Discount_Band,
    Discount
FROM discount_data
ORDER BY Discount_Band;
-- 1- What are the top-selling products, from highest to lowest?
select pd.Product ,sum (ps.Units_Sold * pd.Sale_Price) as "Total Sales"
from Product_data pd 
join product_sales ps
on pd.Product_ID=ps.Product 
group by pd.Product
order by "Total Sales" desc ;

-- 2- Which products have the highest profit ?
select pd.Product ,sum( (pd.Sale_Price-pd.Cost_Price) * ps.Units_Sold )as "Total Profit"
from Product_data pd 
join product_sales ps
on pd.Product_ID = ps.Product
group by pd.Product 
order by "Total Profit" desc;

-- 3- What is the hiest category oredered ?
select pd.Category , count(ps.Product)as "Orders"
from Product_data pd 
join product_sales ps on pd.Product_ID = ps.Product
group by pd.Category 
order by "Orders";

-- 4- What is the most product ordered ?
select pd.product ,sum(ps.Units_Sold) as [Total units sold]
from Product_data pd 
join product_sales ps 
on pd.Product_ID = ps.Product
group by pd.product 
order by [Total units sold];

-- 5- Do higherpriced products sell more or less?
select pd.Product , pd.Sale_price , sum(ps.Units_Sold) as "Number_of Units"
from Product_data pd 
join product_sales ps
on pd.Product_ID = ps.Product
group by pd.Product , pd.Sale_price
order by pd.Sale_price desc;

-- 6- How many orders of each product per country?
select  ps.Country,pd.Product  ,count(ps.Product) as " Total Orders"
from Product_data pd 
join product_sales ps on pd.Product_ID = ps.Product 
group by ps.Country, pd.Product
order by " Total Orders" desc;

-- 7- Which countries generated the highest Sales for us?
select ps.Country,sum(pd.Sale_Price*ps.Units_Sold) as"Total Sales"
from Product_data pd
join product_sales ps
on pd.Product_ID = ps.Product
group by ps.Country 
order by "Total Sales";

-- 8- Which countries generated the highest profits for us?
select ps.Country,sum((pd.Sale_Price-pd.Cost_Price)*ps.Units_Sold) as"Total Profit"
from Product_data pd
join product_sales ps
on pd.Product_ID = ps.Product
group by ps.Country 
order by "Total Profit";

-- 9- What is the highest countries sold units?
select Country , Sum(Units_Sold) as [Total Units]
from product_sales
group by Country 
order by [Total Units];

-- 10- What is the hights product in each country ?
WITH product_rank AS
(
    SELECT
        ps.Country,
        pd.Product,
        SUM(ps.Units_Sold) AS [Units Sold],
        RANK() OVER
        (
            PARTITION BY ps.Country
            ORDER BY SUM(ps.Units_Sold) DESC
        ) AS rn
    FROM Product_data pd
    JOIN product_sales ps
        ON pd.Product_ID = ps.Product
    GROUP BY
        ps.Country,
        pd.Product
)
SELECT *
FROM product_rank
WHERE rn = 1;

-- 11- What is customer type that buied hights ?
select Customer_Type , sum(Units_Sold) as [unit sold]
from product_sales
group by Customer_Type
order by [unit sold];

-- What is the customer type who return hight revenue ?
select ps.Customer_Type , sum((pd.Sale_Price - Cost_Price)*ps.Units_Sold) as [Revenue]
from Product_data pd join product_sales ps 
on pd.Product_ID = ps.Product
group by ps.Customer_Type
order by Revenue;

-- 12- what is the best product for eatch customer type ?
with customer_prefere as(
select ps.Customer_Type , pd.Product , sum(ps.Units_Sold) as units ,
rank () over (partition by ps.Customer_Type order by sum(ps.Units_Sold) desc ) as rn
from Product_data pd join product_sales ps 
on pd.Product_ID = ps.Product
group by ps.Customer_Type, pd.Product 
)
select * from customer_prefere
where rn=1;

-- 13- Do discounts increase sales?
SELECT
    dd.Discount_Band,
    dd.Discount,
    SUM(ps.Units_Sold) AS Total_Units
FROM product_sales ps
JOIN discount_data dd
    ON ps.Discount_Band = dd.Discount_Band
GROUP BY
    dd.Discount_Band,
    dd.Discount
ORDER BY dd.Discount desc;

-- 14- Do discounts affect profits?
select ps.Discount_Band ,SUM(ps.Units_Sold) as units, sum((pd.Sale_Price - Cost_Price - dd.Discount)*ps.Units_Sold) as profit
from Product_data pd 
join product_sales ps 
on pd.Product_ID = ps.Product
join discount_data dd
on ps.Discount_Band = dd.Discount_Band
group by ps.Discount_Band 
order by profit;

-- 15- Were the discounts applied to all products?
SELECT
    ps.Discount_Band,
    pd.Product,
    SUM(ps.Units_Sold) AS Total_Units
FROM Product_data pd
JOIN product_sales ps
    ON pd.Product_ID = ps.Product
GROUP BY
    ps.Discount_Band,
    pd.Product
ORDER BY
    pd.Product,
    ps.Discount_Band;

	