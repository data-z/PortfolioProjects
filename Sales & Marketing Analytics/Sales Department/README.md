
# Plant Co. Sales Performance 2024

## Overview
This Power BI project showcases year-to-date (YTD) sales performance of Plant Co., comparing it to the previous year's performance (PYTD). The report highlights gross profit, sales trends by month and country, and account profitability segmentation. This portfolio demonstrates Power BI skills in transforming data, creating visualizations, and applying DAX measures to derive key insights.

## Table of Contents
- [Dataset](#dataset)
- [Power BI Report](#power-bi-report)
- [DAX Measures](#dax-measures)
- [How to Use](#how-to-use)
- [Conclusion and Future Improvements](#conclusion-and-future-improvements)
- [Data Model Overview](#data-model-overview)

## Dataset
The dataset used includes detailed sales and gross profit figures, segmented by country, product type, and month. Key metrics include:
- **Sales YTD**: Current year-to-date sales.
- **Sales PYTD**: Previous year-to-date sales for comparison.
- **Gross Profit Percentage (GP%)**: The percentage of sales retained as profit.
- **Countries**: Canada, Colombia, Germany, and other countries with significant sales figures.

## Power BI Report
![Power BI Dashboard](https://github.com/data-z/PortfolioProjects/blob/main/Sales%20%26%20Marketing%20Analytics/Sales%20Department/performance%20report.pdf)

The Power BI report includes:
- **Sales performance by month**: Visualizing trends from January to April 2024, comparing YTD vs PYTD sales.
- **Bottom 10 countries**: Highlights the countries with significant declines in sales, such as Canada and Colombia.
- **Account profitability segmentation**: Displays GP% and sales for different account categories, identifying potential for improvement.

## Insights and Visualizations

### Sales YTD vs PYTD by Month
![Sales YTD vs PYTD](https://github.com/data-z/PortfolioProjects/blob/main/Sales%20%26%20Marketing%20Analytics/Sales%20Department/Sales%20YTD%20vs%20PYTD%20by%20Month.PNG)

YTD sales of **3.57M** compared to PYTD sales of **3.71M** reveal a **-135.89K** decline. Key observations:
- **February** saw a positive trend with an increase of **+0.34M**.
- **March** and **April** experienced declines of **-0.15M** and **-0.24M**, respectively.

### Gross Profit and Sales by Product Type
<p align="center">
  <img src="https://github.com/data-z/PortfolioProjects/blob/main/Sales%20%26%20Marketing%20Analytics/Sales%20Department/Product%20type.PNG" alt="GP% by Product Type" width="45%" />
  <img src="https://github.com/data-z/PortfolioProjects/blob/main/Sales%20%26%20Marketing%20Analytics/Sales%20Department/Product%20type%20GP.PNG" alt="Product Type GP%" width="45%" />
</p>
- **Indoor** products led the market in terms of sales and GP%.
- **Landscape** and **Outdoor** products also performed well, though GP% varied by region.

### Bottom 10 Countries by YTD vs PYTD Performance
![Bottom 10 Countries](https://github.com/data-z/PortfolioProjects/blob/main/Sales%20%26%20Marketing%20Analytics/Sales%20Department/Bottom%2010.PNG)

The bottom 10 countries (e.g., **Canada** and **Colombia**) saw significant sales declines:
- **Canada**: Sales declined by **-73.71K**.
- **Colombia**: Experienced a drop of **-61.12K**.

## DAX Measures

Several key DAX measures were used to create this Power BI report:

1. **Sales**:
   ```DAX
   Sales = SUM(Fact_Sales[Sales_USD])
   ```

2. **Quantity**:
   ```DAX
   Quantity = SUM(Fact_Sales[quantity])
   ```

3. **Cost of Goods Sold (COG)**:
   ```DAX
   COG = SUM(Fact_Sales[COGS_USD])
   ```

4. **Gross Profit**:
   ```DAX
   Gross Profit = [Sales] - [COG]
   ```

5. **PYTD Sales**:
   ```DAX
   PYTD_Sales = CALCULATE([Sales], SAMEPERIODLASTYEAR(Dim_Date[Date]))
   ```

These measures enabled precise calculations for revenue, gross profit, and historical comparisons. The use of **SAMEPERIODLASTYEAR** helped create comparisons between YTD and PYTD sales, providing valuable insights into performance.

## How to Use
1. **Download** the Power BI report file from [here](https://github.com/data-z/PortfolioProjects/blob/main/Sales%20%26%20Marketing%20Analytics/Sales%20Department/Performance%20Report.pbix)
2. **Download** the Excel Dataset from [here](https://github.com/data-z/PortfolioProjects/blob/main/Sales%20%26%20Marketing%20Analytics/Sales%20Department/Plant_DTS.xls)
3. Open the Power BI file in **Power BI Desktop**.
4. Connect your dataset using the "Data Source" tab, and refresh to see updated insights.
5. Explore interactive visuals to dive deeper into sales performance, GP%, and country-level data.

## Conclusion and Future Improvements
This Power BI project provides a comprehensive view of Plant Co.'s sales performance for 2024, identifying underperforming regions and product categories. Future improvements could include:
- **Predictive Analytics**: Using Power BI's AI tools for sales forecasting.
- **Deeper Regional Analysis**: Adding more granular segmentation to uncover trends within regions.

## Data Model Overview

This Power BI report is built upon a structured data model comprising fact and dimension tables:

### Fact Table
- **Fact_Sales**: Contains transactional sales data:
  - `Account_id`: Unique identifier for accounts.
  - `COGS_USD`: Cost of goods sold.
  - `Date_Time`: Date and time of each transaction.
  - `Product_id`: Unique product identifier.
  - `Quantity`: Number of products sold.
  - `Sales_USD`: Total sales in USD.

### Dimension Tables
- **Dim_Account**: Stores account information including `country`, `latitude`, `longitude`.
- **Dim_Product**: Contains product details such as `Product_Family`, `Product_Group`, `Product_Type`.
- **Dim_Date**: Supports time-based analyses with fields like `Date`.

### Measures
The project uses calculated measures for core business metrics, such as **Sales**, **Gross Profit**, and **PYTD Sales**, enhancing the report’s analytical capabilities.

By integrating this data model, the report ensures effective cross-referencing of sales, product, and account data, allowing for deep analysis and actionable insights.
