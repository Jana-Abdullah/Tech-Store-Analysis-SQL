# Tech Store Sales & Marketing Analytics – SQL Project

## Project Overview
This project is an end-to-end SQL analytics solution built on a **multi-table relational database** for a tech retail store.

It analyzes **sales performance**, **customer behavior**, **product trends**, and **marketing campaign ROI**, transforming transactional data into decision-ready business insights.

The project follows a real-world analytics workflow: reusable **views** are built as a reporting layer first, then structured analysis files answer specific business questions on top of them.

---

## Database Schema

The database consists of **5 related tables**:

| Table | Description |
|---|---|
| `Customers` | Customer profiles (city, gender, assigned campaign) |
| `Orders` | Order header data (date, payment method) |
| `OrderItems` | Order line items (quantity, price) |
| `Products` | Product catalog (name, category) |
| `MarketingCampaigns` | Campaign details (name, budget) |

---

## Project Structure

| File | Purpose |
|---|---|
| `Views_01.sql` | Reusable reporting views (`vw_SalesAnalysis`, `vw_MarketingCampaigns`, `vw_BudgetAnalysis`) |
| `Sales_Analysis_02.sql` | Sales trends by month/weekday, best & worst sellers, payment, city, and gender analysis |
| `Marketing_Analysis_03.sql` | Campaign performance, ROI calculation, and profit/loss classification |
| `KPI_Analysis_04.sql` | Top customers, Average Order Value (AOV), product performance summary |
| `Advanced_Analysis_05.sql` | Window functions: MoM growth (LAG), running totals, ranking per category, customer segmentation (NTILE) |
| `Assign_Customers_To_Campaigns.sql` | Data-quality fix: balanced customer-to-campaign assignment using modulo logic |

---

## Key Business Questions Answered

### Sales Performance
- How do sales trend month over month, and what is the growth rate?
- Which weekdays generate the highest revenue?
- Which products are the best and worst sellers?

### Customer Insights
- Who are the top customers by total spending and AOV?
- How do sales differ by city, gender, and payment method?
- How can customers be segmented into spending tiers (VIP → Low)?

### Marketing Insights
- Which campaigns generate the highest ROI?
- Which campaigns fail to cover their budget?
- How many customers does each campaign reach?

---

## SQL Concepts Used
- Multi-table `JOIN`s & relational data modeling
- `VIEW`s as a reporting layer
- `CTE (WITH)`
- Window Functions: `LAG()`, `RANK()`, `NTILE()`, `SUM() OVER()`
- `CASE` expressions for classification (Profit / Loss, customer tiers)
- Aggregations with `GROUP BY` / `HAVING`
- Date functions: `FORMAT()`, `DATENAME()`, `DATEPART()`
- Data-quality fixes with `UPDATE` + modulo logic

---

## Technologies Used
- SQL Server (T-SQL)
- SQL Server Management Studio (SSMS)
- Power BI (dashboard visualization)

---

## Dashboard Preview
<!-- Add your Power BI screenshot here:
![Tech Store Dashboard](images/dashboard.png)
-->

---

## Future Enhancements
- RFM customer segmentation
- Stored procedures for automated monthly reporting
- Time-series sales forecasting
- Customer churn analysis

---

## Author
**Jana Abdullah**
Computer Science Student | Aspiring Data Analyst
SQL • Data Analysis • Business Intelligence
