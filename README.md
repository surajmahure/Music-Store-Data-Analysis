## Music Store Data Analysis 

This repository contains the SQL code for a music store database project. The database includes tables for customers, invoices, invoice lines, tracks, albums, artists, and genres.

## Project Overview

This project aims to analyze and visualize customer purchasing patterns and music preferences within a fictional music store. The SQL code provides solutions to various business questions, such as identifying the senior most employee, determining the most popular countries for invoices, and finding the best customer based on spending.

**Query Set 1: Employee and Invoice Analysis**

1. **Q1: Identify the senior most employee based on job title.**

The query selects the employee with the highest `levels` value, indicating their seniority level.

2. **Q2: Determine the countries with the most invoices.**

The query groups invoices by `billing_country` and orders by the count of invoices, revealing the countries with the most sales.

3. **Q3: Identify the top 3 invoice totals.**

The query orders invoices by `total` in descending order and limits the result to the top 3, highlighting the highest invoice amounts.

4. **Q4: Find the city with the highest total invoice amount.**

The query aggregates invoice totals by `billing_city` and orders by the sum, identifying the city with the most revenue generated from invoices.

5. **Q5: Identify the best customer based on spending.**

The query joins customer and invoice tables to determine the customer with the highest total spending, revealing the most valuable customer.

**Query Set 2: Music Preferences Analysis**

1. **Q1: Retrieve email, first name, last name, and genre for all rock music listeners.**

The query joins multiple tables to identify rock music listeners and orders the results alphabetically by email.

2. **Q2: Identify the top 10 rock bands based on the number of tracks.**

The query groups tracks by artist and genre, filtering for rock genre, and orders by the count of tracks, revealing the most prolific rock bands.

3. **Q3: Identify tracks with longer durations than the average song length.**

The query compares track lengths to the average length, selects tracks with longer durations, and orders by `milliseconds`, revealing the longest songs.

**Query Set 3: Customer Spending and Genre Analysis**

1. **Q1: Determine the amount spent by each customer on each artist.**

The query joins multiple tables to calculate customer spending per artist, providing insights into customer preferences.

2. **Q2: Identify the most popular music genre for each country.**

The query utilizes a CTE to calculate genre purchases and identifies the most popular genre per country, revealing genre preferences across countries.

3. **Q3: Identify the customer who has spent the most on music for each country.**

The query groups invoices by country and customer, calculating total spending per customer, and identifying the top-spending customer per country.

## Conclusion

This SQL code demonstrates the power of data analysis in understanding customer behavior and music preferences within a music store setting. The queries provide valuable insights for decision-making and marketing strategies.
