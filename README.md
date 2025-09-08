# 📊 SQL_US_Regional_Sales
This project implements an end-to-end SQL-based ETL pipeline that ingests raw CSV files into an original schema, cleans and normalizes the data, enriches it with derived metrics and region mapping, and delivers a cleaned schema with analytics-ready tables designed for visualizationtools like Tableau

---

## 📁Repository Structure

<pre> 📁 SQL_US_Regional_Sales/
├── 📁 US_Regional_Sales/
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
├── 📁 docs/
│   ├── data_architecture.png
│   ├── data_integration.png
│   ├── student_ERD.png
│   ├── metadata_catalog.md
│   └── student_ERD_summary.pdf
│
└── README.md </pre> 


## 🔍 Dataset Source
This project uses the *US Regional Sales Data* (fictitious dataset created by Udit Kumar Chatterjee on data.world), which contains sales orders from **May 2018 to December 2020**, including information on products, customers, regions, store locations, sales teams, and sales channels: https://data.world/dataman-udit/us-regional-sales-data.


