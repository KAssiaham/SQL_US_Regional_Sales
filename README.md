# 📊 SQL/Tableau_US_Regional_Sales
Built a SQL database for the US Regional Sales Dataset, implementing an ETL workflow to deliver clean, analytics-ready tables. Designed interactive Tableau dashboards to monitor sales growth, year-over-year trends, customer retention, and top-performing products, customers, teams, and regions

##### Author: Assiaham Gnama-Lada  
##### Tools: SQL | Tableau 

---

## 📌 Project Overview

This project demonstrates how to build a database in SQL and design interactive dashboards for the [US Regional Sales Dataset](https://data.world/dataman-udit/us-regional-sales-dat).
The workflow follows an ETL (Extract, Transform, Load) pattern:
1. <b>Extract</b> → SQL scripts to BULK INSERT raw data into the original schema.
2. <b>Transform</b> & Clean → SQL scripts to normalize, trim, and enrich data by joining with region mappings, cleaning names, and calculating additional KPIs.
3. <b>Load</b> → SQL scripts to populate cleaned schema tables, which contain five ready-to-use tables optimized for BI tools such as Tableau.
4. <b>Data Exploration & Analysis</b> → SQL queries for KPI calculation and insights.
5. <b>Visualization</b> → Tableau dashboards built on top of cleaned schema.

The goal is to uncover actionable insights about **sales, customers, and sales team performance** across four U.S. regions (West, South, Midwest, Northeast).

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
├── dashboards/ # Tableau workbook and images
|
├── Analysis_Presentation
|
└── README.md </pre> 

--

## 🎯 Business Task
> Analyze national sales data to understand performance trends, regional profitability, and customer behavior between 2018 and 2020.

**Key Questions:**
1. How did sales and profits perform YoY?  
2. Which regions, products, and customers contributed most to revenue growth?  
3. How can sales team performance be optimized?  
4. What business actions can increase profitability in 2021?

---

## 🔍 Dataset Source
This project utilizes the *US Regional Sales Data* (a fictitious dataset created by Udit Kumar Chatterjee on data.world), which contains sales orders from May 2018 to December 2020, including information on products, customers, regions, store locations, sales teams, and sales channels: [US Regional Sales Dataset](https://data.world/dataman-udit/us-regional-sales-dat).

- **Raw Data:** CSV files (Sales, Customers, Products, Sales Team).  
- **Database:** SQL Server (for ETL and data cleaning).  
- **Visualization:** Tableau Dashboards.

---

## 📁 Data Loading Methodology

### Step 1: Raw Data Import
- Datasets were bulk-loaded into the **`original` schema** using `BULK INSERT`.  
- This schema represents the **raw source data** with no transformations.  

### Step 2: Data Cleaning 
Cleaned and standardized datasets were inserted into the **`cleaned` schema** using transformation logic:
  - Removed duplicates and null values.  
  - Converted text to proper data types.  
  - String Cleaning → Used `TRIM()` and `REPLACE()` to remove trailing spaces and unwanted characters.  
 
### Step 3: Data Transformation:
Joined datasets on key identifiers and created calculated derived fields:
  - `DiscountedPrice` = UnitPrice × (1 − DiscountApplied)  
  - `UnitProfit` = DiscountedPrice − UnitCost  
  - `Sales` = DiscountedPrice × OrderQuantity  
  - `Profit` = Sales − Cost.  
    
### Step 4: Validation:
Performed quality checks to ensure data consistency.

### Step 5:Export:
Clean tables used in Tableau dashboards.
 

---

## 📊 Data Exploration in SQL

Once loaded into the `cleaned` schema, SQL scripts were used for **business exploration** and KPI generation.
Applied joins, CTEs, and window functions to derive actionable insights on regional profit drivers and product performance.

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

## 📊 Dashboards
  [Link to Tableau Public: UsRegionalSales-Sales, Customers, SaleTeam Interactive Dashboards](https://public.tableau.com/app/profile/assiaham.gnama.lada/viz/UsRegionalSales-SalesCustomersSalesTeamInteractiveDashboards/SalesDashboard)

### 1. **Sales Dashboard**
- Total Sales: **\$28M (+1.2% vs 2019)**  
- Total Profit: **\$8M (+0.2%)**  
- Highlights sales by region, product, and week.
- 
<img width="1290" height="793" alt="Sales Dashboard" src="https://github.com/user-attachments/assets/80acae6a-d5ed-4dc7-a422-f36b652a041f" />



### 2. **Customers Dashboard**
- Total Customers: **50**  
- Avg Sales per Customer: **\$564K (+1.2%)**  
- Top 10 customers and regional/customer distribution.
- 
<img width="1301" height="800" alt="Customers Dashboard" src="https://github.com/user-attachments/assets/f768ed65-2081-4228-a7c5-0856e56e89a0" />



### 3. **Sales Team Dashboard**
- Sales Team: **28 members**  
- Avg Sales per Salesperson: **\$1M (+1.2%)**  
- Performance by channel, region, and individual contributor.

<img width="1290" height="791" alt="SalesTeam Dashboard" src="https://github.com/user-attachments/assets/f848dffb-1f96-460a-b357-f634a9ebdfa7" />



---

## 📈 Key Findings

- **West region** achieved the highest revenue (\$10M).  
- **South region** showed strong growth potential.  
- **Northeast region** underperformed and needs strategic focus.  
- Top products: *Wall Frames*, *Furniture Cushions*, *Collectibles*.  
- *Patrick Graham* and *Jerry Green* led in profit contribution.  
- *Medline* was the most profitable customer.

---

## 💬 Recommendations
1. Increase marketing efforts in the **Northeast region**.  
2. Focus on **medium-tier customers** to raise average order value.  
3. Share best practices among top sales representatives.  
4. Review **discount policies** to protect margins.  
5. Expand **online and distributor channels** for broader coverage.


---

## 🛠 Tech Stack  
- **SQL Server** (Data pipeline, cleaning, transformations, analysis)  
- **Tableau** (Visualization, dashboards, storytelling) 

---

## 🧠 Skills Demonstrated
- Data Cleaning and ETL (SQL)
- Exploratory Data Analysis (Excel)
- Data Visualization (Tableau)
- Business Insights & Recommendations
- Data Storytelling

---

✅ With this pipeline, data is transformed from **raw CSVs → cleaned schema → Tableau dashboards**, enabling a robust analytics workflow that supports business decision-making.  
