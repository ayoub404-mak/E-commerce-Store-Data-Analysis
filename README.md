# 📊 USA Regional Sales Analysis

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-MySQL-orange)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Complete-success)]()

> A comprehensive exploratory data analysis (EDA) of Acme Co.'s USA sales dataset spanning 2014-2018, containing **64,104 transactions** across 49 states. This project demonstrates advanced SQL data engineering and Python visualization techniques to uncover actionable business insights.


## 🎯 Project Overview

This project performs an in-depth exploratory data analysis on **64,104 sales transactions** from Acme Co. (2014-2018) to identify revenue drivers, seasonal trends, and strategic opportunities across products, channels, and geographic regions.

### Problem Statement

Analyze Acme Co.'s multi-year sales data to:
- Identify key revenue and profit drivers across products, channels, and regions
- Uncover seasonal trends and anomalies for optimized planning
- Spot pricing and margin risks from outlier transactions
- Inform pricing, promotion, and market expansion strategies
- Reduce geographic and customer concentration risk

### Business Impact

- 📈 **\$1.21B** in total revenue analyzed
- 🌎 **49 states** covered across 4 US regions
- 🏢 **175 customers** and **30 products** evaluated
- 💰 Average profit margin: **37.5%** across all channels

---
<img width="615" height="342" alt="image" src="https://github.com/user-attachments/assets/c3ea3ac7-d42b-4c5d-8177-0cd7f6b9f83c" />


## ✨ Key Features

### 🗄️ Advanced SQL Data Engineering
- Complex multi-table joins across 6 data sources
- Feature engineering with calculated metrics (profit, margins, temporal features)
- Data quality validation and integrity checks
- Outlier detection using IQR statistical methods
- Performance optimization with strategic indexing
- Handles **64K+ rows** efficiently

### 📊 Python-Powered Visualizations
- 15+ professional visualizations using Matplotlib, Seaborn, and Plotly
- Interactive choropleth maps for geographic analysis
- Time-series trend analysis with seasonal decomposition
- Customer segmentation and product performance dashboards

### 📄 Professional LaTeX Report
- Comprehensive technical documentation
- Publication-ready formatting with tables and figures
- Reproducible code snippets
- Strategic recommendations and action items

---

## 📦 Dataset Description

### Data Scale
- **Total Records**: 64,104 sales transactions
- **Time Period**: January 2014 - February 2018
- **Geographic Coverage**: 49 US states across 4 regions
- **Business Entities**: 175 customers, 30 products

### Data Sources

| Dataset | Records | Description |
|---------|---------|-------------|
| **Sales Orders** | 64,104 | Transactional data with order details, pricing, quantities |
| **Customers** | 175 | Customer master data and names |
| **Products** | 30 | Product catalog with descriptions |
| **Regions** | 994 | Geographic regions with demographics (population, income) |
| **State Regions** | 49 | US state to region mapping |
| **2017 Budgets** | 30 | Budget targets by product for 2017 |

### Key Metrics Analyzed

- **Revenue**: Line-level and aggregate revenue across dimensions
- **Profit**: Calculated from revenue and cost data
- **Profit Margin %**: Performance indicator by product/channel/region
- **Order Quantity**: Volume metrics for demand analysis
- **Unit Price**: Pricing analysis and outlier detection
- **Geographic**: State, region, lat/long coordinates

---

## 🛠 Technologies Used

### Data Engineering & Analysis
![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=flat&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat&logo=mysql&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat&logo=numpy&logoColor=white)

### Visualization
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557c?style=flat&logo=python&logoColor=white)
![Seaborn](https://img.shields.io/badge/Seaborn-3776AB?style=flat&logo=python&logoColor=white)
![Plotly](https://img.shields.io/badge/Plotly-3F4F75?style=flat&logo=plotly&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-11557c?style=flat&logo=powerbi&logoColor=white)


### Documentation
![LaTeX](https://img.shields.io/badge/LaTeX-008080?style=flat&logo=latex&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white)

### Database
- **MySQL 8.0+**: Primary database for data storage and processing
- **SQLAlchemy**: Python-SQL connectivity
-**CVS**: svc file
---

## 📈 Analysis Highlights

### 1️⃣ Temporal Analysis
- **Monthly revenue cycles** between $24M-$26M with clear seasonality
- **Peak seasons**: May-June consistently show highest sales
- **Trough periods**: January shows lowest performance
- **Anomaly detected**: Early 2017 revenue drop requires investigation

### 2️⃣ Product Performance
- **Top performers**: Products 26 ($118M) and 25 ($110M)
- **Margin leaders**: Products 18 and 28 (avg $8K+ profit/transaction)
- **Opportunity zone**: Mid-tier products at $68-75M range
- **Total products analyzed**: 30 SKUs across portfolio

### 3️⃣ Geographic Distribution
- **West region dominance**: $360M (35% of total)
- **California concentration**: $230M (highest single state)
- **Growth opportunity**: Northeast region at $210M (20%)
- **Coverage**: All 49 continental US states

### 4️⃣ Channel Analysis
- **Wholesale**: 54% of sales (concentration risk)
- **Distributor**: 31% of sales
- **Export**: 15% of sales (highest margin at 37.93%)
- **Margin consistency**: <1% variance across channels

### 5️⃣ Customer Segmentation
- **Top customer**: Aibox Company ($12.5M)
- **Top 10 range**: $10-12M (tight clustering)
- **Bottom 10 range**: $4-5M (growth opportunity)
- **Total customers**: 175 across all regions

---

## 🔍 Key Findings

### Revenue Insights 💰
- Total revenue analyzed: **$1.21 billion** (2014-2018)
- Average order value: **$18,873**
- Consistent monthly performance with predictable seasonality
- Strong correlation between order count and revenue by state

### Profitability Analysis 📊
- Overall profit margin: **37.5%** (very healthy)
- Minimal variance across channels (37.09% - 37.93%)
- No correlation between unit price and profit margin
- Outlier transactions identified for margin optimization

### Risk Assessment ⚠️
- **Geographic concentration**: California = 35% of revenue
- **Customer concentration**: Top 10 customers = significant portion
- **Channel concentration**: Wholesale = 54% of sales
- **Recommendation**: Diversification strategy required

### Growth Opportunities 🚀
1. **Export expansion**: Highest margins, lowest volume
2. **Northeast region**: Underserved market ($210M)
3. **Mid-tier products**: Optimization potential
4. **Lower-tier customers**: Elevation programs

---

## 📊 Visualizations

### Sample Visualizations Included

1. **Time Series Analysis**
   - Monthly sales trend (2014-2018)
   - Seasonal pattern analysis
   - Year-over-year comparison

2. **Product Analytics**
   - Top 10 products by revenue
   - Profit margin comparison
   - Price distribution boxplots

3. **Geographic Analysis**
   - US choropleth map (state-level sales)
   - Regional bar charts
   - Top states performance

4. **Customer Insights**
   - Top/Bottom 10 customer comparison
   - Revenue segmentation
   - Order value distribution

5. **Pricing Analysis**
   - Unit price vs profit margin scatter
   - Average order value histogram
   - Channel profitability comparison

## 🗄️ SQL Workflow


### Performance Optimization

- **Indexes created** on frequently queried columns (date, customer, product, region)
- **View materialization** for complex joins
- **Efficient aggregation** using GROUP BY with indexes
- **Query execution time**: <2 seconds for most analytical queries on 64K rows

---

## 📄 Technical Report

A comprehensive **LaTeX technical report** is included in `reports/technical_report.pdf` featuring:

- **Executive Summary**: High-level findings and KPIs
- **Methodology**: Detailed SQL and Python workflows
- **Results**: 15+ analyses with visualizations
- **Recommendations**: Strategic action items (immediate, short-term, long-term)
- **Technical Appendix**: SQL schemas, Python code, data dictionary

### Compiling the Report

`
---

## 🔮 Future Enhancements

### Planned Features

- [ ] **Machine Learning Models**
  - Revenue forecasting using time series models (ARIMA, Prophet)
  - Customer churn prediction
  - Product recommendation engine

- [ ] **Advanced Analytics**
  - Market basket analysis for product bundling
  - Customer lifetime value (CLV) calculation
  - Price elasticity analysis
  - Cohort analysis

- [ ] **Dashboard Development**
  - Interactive Power BI dashboard
  - Real-time Tableau visualizations
  - Streamlit web application

- [ ] **Data Pipeline Automation**
  - Apache Airflow ETL pipeline
  - Automated data refresh from source
  - Scheduled report generation

- [ ] **Extended Analysis**
  - Competitor benchmarking
  - External market data integration
  - Sentiment analysis from customer feedback

---

---

## 🙏 Acknowledgments

- Dataset inspired by real-world sales analytics scenarios
- Visualization techniques from Python data science community
- SQL optimization strategies from database engineering best practices
- LaTeX template adapted from academic research standards

---

## 📚 Additional Resources

### Documentation
- [Python Pandas Documentation](https://pandas.pydata.org/docs/)
- [MySQL Reference Manual](https://dev.mysql.com/doc/)
- [Matplotlib Tutorials](https://matplotlib.org/stable/tutorials/index.html)
- [Seaborn Gallery](https://seaborn.pydata.org/examples/index.html)

### Related Projects
- [Sales Dashboard Template](https://github.com/example/sales-dashboard)
- [SQL Analytics Toolkit](https://github.com/example/sql-analytics)
- [EDA Best Practices](https://github.com/example/eda-guide)

---

<div align="center">

### ⭐ If you found this project helpful, please consider giving it a star!

**Made with ❤️ and ☕ by Ayoub**

</div>
