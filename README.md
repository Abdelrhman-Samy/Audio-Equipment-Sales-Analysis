# Audio Equipment Sales Analysis

## Overview

This project analyzes sales performance of audio equipment products using SQL Server and Power BI.

The analysis focuses on product performance, customer behavior, geographic sales trends, profitability, and the effectiveness of discount strategies.

## Business Objectives

* Identify top-performing products.
* Measure profitability across products and countries.
* Understand customer purchasing behavior.
* Evaluate the impact of discounts on sales and profit.
* Support data-driven business decisions.

## Dataset

The project consists of three related datasets:

### Product Data

Product information including:

* Product ID
* Product Name
* Category
* Brand
* Cost Price
* Sale Price

### Sales Data

Transaction-level sales information:

* Date
* Country
* Customer Type
* Product
* Discount Band
* Units Sold

### Discount Data

Monthly discount information:

* Month
* Discount Band
* Discount Value

## SQL Analysis

Business questions answered include:

* Top-selling products by revenue
* Most profitable products
* Best-selling products by country
* Customer segment performance
* Revenue and profit by country
* Product preferences by customer type
* Discount impact on sales
* Discount impact on profitability

### SQL Techniques Used

* INNER JOIN
* Aggregate Functions
* GROUP BY
* CTEs
* Window Functions (RANK)
* KPI Calculations

## Power BI Dashboard
# Modeling
A new column was created to include the discount and the month, in order to avoid the many to many problem 

<img width="1160" height="688" alt="Modeling" src="https://github.com/user-attachments/assets/e80a3034-5d4c-4fb2-bea4-ffd2c343047b" />

# Dashbords 

<img width="1310" height="747" alt="Dashbord1" src="https://github.com/user-attachments/assets/58a234c8-5d9e-47c8-affc-1856f978261b" />

<img width="1315" height="705" alt="Dashbord2" src="https://github.com/user-attachments/assets/92a09cbe-6eb5-4b51-a9b5-a5315d7f604a" />


Dashboard features include:

* Revenue Analysis
* Profit Analysis
* Product Performance
* Country Performance
* Customer Type Analysis
* Brand Analysis
* Discount Analysis

## Key Insights

* Higher discount levels increased unit sales.
* Products sold without discounts generated the highest profit.
* Customer preferences varied across segments.
* Geographic markets showed different purchasing patterns.
* Profitability varied significantly between products and countries.

## Skills Demonstrated

* SQL Server
* Power BI
* DAX
* Data Modeling
* Data Analysis
* Data Visualization
* Business Intelligence


README.md
