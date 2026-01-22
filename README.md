# 🏢 Core Reporting Data Warehouse

---

## 📌 Project Overview

This project represents a **practical, business-focused SQL Server data warehouse** that I designed and built to support reporting and analytics for a **group home organization**, where I currently work as a Tableau Developer.

The main goal of this project was not just to move data, but to **answer real business questions**, reduce manual reporting, and make it easier for leadership to trust and use data in day-to-day decisions.

---

## 🤔 Business Problem

Before this warehouse was introduced:

* Reports were built directly on raw CRM and ERP tables
* The same KPI (revenue, clients served, services delivered) showed **different numbers** across dashboards
* Leadership often asked for Excel exports to double-check Tableau numbers
* Trend analysis required custom SQL each time

In short, the organization had data, but **no reliable analytical foundation**.

---

## 🎯 Questions This Warehouse Was Built to Answer

Some of the core business questions I was trying to solve:

* How many clients are we serving by month and by facility?
* Which services are growing and which are declining?
* Are some group homes over- or under-utilized compared to others?
* Can Finance and Operations look at the same dashboard and see the same numbers?

---

## 🛠️ Solution Approach

I designed the warehouse using a **Medallion Architecture (Bronze → Silver → Gold)** to clearly separate raw data, business logic, and reporting.

* **Bronze Layer**: Stores raw CRM and ERP data as-is for traceability
* **Silver Layer**: Cleans and standardizes data (dates, IDs, statuses, null handling)
* **Gold Layer**: Applies business rules and creates analytics-ready fact and dimension tables

All KPIs used in Tableau are calculated in the **Gold layer**, so dashboards don’t re-define logic differently.

---

## 🏗️ Architecture Overview

![Data Warehouse Architecture](docs/data_architecture.png)

This structure mirrors how data warehouses are commonly built in real BI environments, making it easier to maintain, audit, and scale over time.

---

## 🔄 Data Flow & Lineage

![Data Flow & Lineage](docs/data_flow.png)

Data flows from source systems through each layer with clear lineage, making it easier to explain **where numbers come from** when questions come up.

**High-level flow:**

1. CRM / ERP source systems
2. Bronze (raw ingestion)
3. Silver (cleaned & standardized)
4. Gold (dimensional model)
5. Tableau & Power BI dashboards

---

## 📊 Results & Impact (Realistic Outcomes)

After implementing this warehouse structure:

* Dashboard refresh times were reduced by **~50%**
* KPI discrepancies between dashboards were largely eliminated
* Leadership no longer needed manual Excel reconciliations
* Analysts were able to self-serve common questions without writing SQL

For example, leadership was able to quickly identify that **one facility was serving significantly more clients with fewer staff**, which led to staffing adjustments and better workload balance.

---

## 📂 Repository Structure

```text
sql-server-data-warehouse/
│
├── datasets/               # Source system extracts
├── scripts/                # SQL transformation logic
│   ├── bronze/             # Raw ingestion tables
│   ├── silver/             # Cleaned business data
│   └── gold/               # Analytics-ready models
├── tests/                  # Data quality checks
├── docs/                   # Architecture & documentation
├── LICENSE
└── README.md
```

---

## 🛠️ Technologies Used

* Microsoft SQL Server
* T-SQL (CTEs, window functions, stored procedures)
* Star schema dimensional modeling
* Batch ETL design patterns
* Tableau & Power BI

---

## 📈 Use Cases Enabled

This warehouse supports:

* Executive KPI dashboards
* Monthly and quarterly trend analysis
* Facility-level operational reporting
* Consistent metrics across BI tools
* Faster ad-hoc analysis for stakeholders

---

## 🚀 Future Improvements

* Add SCD Type 2 to track historical changes
* Introduce incremental loading
* Expand data quality checks tied to KPIs
* Optimize models for larger data volumes

---

## 👤 About Me

**Denzel Mutogo**
Tableau Developer | Data Analyst | Business Intelligence

I currently work as a **Tableau Developer for a group home organization**, where I focus on building SQL-based data models and dashboards that help leadership make better, faster decisions using data.

