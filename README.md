# 📊 SQL_US_Regional_Sales
An end-to-end SQL-based ETL pipeline that ingests raw CSV files into an original schema, cleans and normalizes the data, enriches it with derived metrics and region mapping, and delivers a cleaned schema with analytics-ready tables designed for visualization tools.

---

## 📌 Project Overview

This project demonstrates how to build a data warehouse pipeline in SQL for the [US Regional Sales Dataset](https://data.world/dataman-udit/us-regional-sales-dat)
The workflow follows an ETL (Extract, Transform, Load) pattern:
1. <b>Extract</b> → SQL scripts to BULK INSERT raw data into the original schema.
2. <b>Transform</b> & Clean → SQL scripts to normalize, trim, and enrich data by joining with region mappings, cleaning names, and calculating additional KPIs.
3. <b>Load</b> → SQL scripts to populate cleaned schema tables, which contain five ready-to-use tables optimized for BI tools such as Tableau.
4. <b>Data Exploration & Analysis</b> → SQL queries for KPI calculation and insights.
5. <b>Visualization</b> → Tableau dashboards built on top of cleaned schema.

--- 
## 📁Repository Structure

<pre> 📁 SQL_US_Regional_Sales/
├── 📁 US_Regional_Sales_Dataset/
│   ├── customers.csv
│   ├── orders.csv
│   ├── products.csv
│   ├── salesteam.csv
│   ├── storelocation.csv
│   └── region.csv
│
├── 📁 script/
│   ├── 01.Create Database.sql
│   ├── 02.Create Original Tables.sql
│   ├── 03.Procedure Load Original Tables.sql
│   ├── 03.Procedure Load Original Tables.sql
│   ├── 04.Quality Checks Original Tables.sql
│   ├── 05.Create Cleaned Tables.sql
│   ├── 06.Procedure Load Cleaned Tables.sql
│   ├── 07.Quality Checks Cleaned Tables.sql
│   └── 08.Data Exploration & Analysis.sql
│
└── README.md </pre> 

---

## 🔍 Dataset Source
This project utilizes the *US Regional Sales Data* (a fictitious dataset created by Udit Kumar Chatterjee on data.world), which contains sales orders from May 2018 to December 2020, including information on products, customers, regions, store locations, sales teams, and sales channels: [US Regional Sales Dataset](https://data.world/dataman-udit/us-regional-sales-dat).

---

## 📁 Data Loading Methodology

### Step 1: Raw Data Import
- Datasets were bulk-loaded into the **`original` schema** using `BULK INSERT`.  
- This schema represents the **raw source data** with no transformations.  

### Step 2: Data Cleaning & Transformation  
- Cleaned and standardized datasets were inserted into the **`cleaned` schema** using transformation logic:  
  - **String Cleaning** → Used `TRIM()` and `REPLACE()` to remove trailing spaces and unwanted characters.  
  - **Data Enrichment** → Joined **Regions** data with `StoreLocation` for regional classification.  
  - **Business Metrics Calculation** → Derived fields such as:  
    - `DiscountedPrice` = UnitPrice × (1 − DiscountApplied)  
    - `UnitProfit` = DiscountedPrice − UnitCost  
    - `Sales` = DiscountedPrice × OrderQuantity  
    - `Profit` = Sales − Cost  

These transformations ensured the data was **analysis-ready** for BI tools like Tableau.  

---

## 📊 Data Exploration

Once loaded into the `cleaned` schema, SQL scripts were used for **business exploration** and KPI generation:  

- **General Insights**
  - First and last order date, total time span in months.  
  - Total sales, profit, average unit price, and total quantity sold.  
  - Customer, product, and order counts.  

- **Business Performance**
  - Profitability by **customer**, **sales team**, and **region**.  
  - Best and worst performing **products**.  
  - Monthly/Yearly sales performance with running totals.  

- **Advanced Analysis**
  - Year-over-Year (YoY) growth of products.  
  - Profit contribution percentage by product.  
  - Identification of top and bottom performing customers and sales teams.  

---

## 📈 Key Insights  

- Clear variation exists across **regions** and **sales teams** in terms of profitability.  
- A small group of **top customers** contribute disproportionately to overall profit.  
- Certain **products consistently outperform**, while a few underperform year-over-year.  
- Profitability trends reveal periods of strong growth and periods of decline that can be further investigated.  

---

## 🎯 Project Objectives  

1. **Build a reliable SQL data pipeline** from raw → cleaned tables.  
2. **Ensure data consistency and analytical readiness** (proper keys, calculated fields, cleaned text).  
3. **Generate KPIs** that can drive decision-making:  
   - Revenue, Profit, Orders, Customers, Products.  
4. **Provide business insights** into customer performance, product profitability, and sales team efficiency.  
5. **Enable visualization in Tableau** for interactive dashboards.  

---

## 🔮 Next Steps (Tableau)  

With the cleaned dataset in place, Tableau will be used to:  
- Create **executive dashboards** with KPIs (Total Sales, Profit, Orders, profit margin, Best/Worst products, YoY growth, contribution analysis).  
- Build **customer analytics dashboards** (Top/Bottom customers, retention,...).  
- Provide **sales team performance dashboards** (drill-down by geography and sales channels).  
- Add **trend analysis** (monthly/yearly sales & profit with running totals).

  [link to Tableau Dashboards]

---

## 🛠 Tech Stack  
- **SQL Server** (Data pipeline, cleaning, transformations, analysis)  
- **Tableau** (Visualization, dashboards, storytelling)  

---

✅ With this pipeline, data is transformed from **raw CSVs → cleaned schema → Tableau dashboards**, enabling a robust analytics workflow that supports business decision-making.  
