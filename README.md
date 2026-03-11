# 🏢 Core Reporting Data Warehouse
 
---

## 📌 Project Overview

This project demonstrates the design and implementation of a **business-focused SQL Server data warehouse** to centralize operational data, automate reporting, and provide leadership with **consistent, reliable KPIs**.  

The main goal was to **solve real business problems, reduce manual reporting, and enable self-service analytics** for Finance, Operations, and Marketing teams.

---

## 🤔 Business Problem

Before this warehouse:

- Reports were built directly on raw CRM and ERP tables.  
- KPIs such as revenue, clients served, and services delivered often **showed conflicting numbers**.  
- Leadership relied on manual Excel exports to validate dashboards.  
- Trend analysis required custom SQL queries each time.  

**Result:** Data existed but **no single source of truth** for reliable analytics.

---

## 🎯 Business Questions Addressed

The warehouse was designed to answer questions like:

- How many clients are served by month and by facility?  
- Which services are growing or declining?  
- Are some facilities over- or under-utilized?  
- Can Finance and Operations use the same dashboard with consistent numbers?  

---

## 🛠️ Solution Approach

Designed using a **Medallion Architecture (Bronze → Silver → Gold)** to separate raw data, business logic, and analytics-ready tables:

- **Bronze Layer:** Stores raw CRM and ERP extracts for traceability.  
- **Silver Layer:** Cleans, standardizes, and validates data (dates, IDs, statuses, null handling).  
- **Gold Layer:** Applies business rules, calculates KPIs, and builds fact/dimension tables ready for dashboards.  

All KPIs are calculated in the **Gold layer**, ensuring dashboards **don’t redefine metrics inconsistently**.

---

## 🏗️ Architecture & Data Flow

**High-Level Data Flow:**

1. CRM / ERP source systems  
2. Bronze (raw ingestion)  
3. Silver (cleaned & standardized)  
4. Gold (dimensional models)  
5. Tableau & Power BI dashboards  

**Data Lineage & Traceability:**  
Clear lineage ensures stakeholders can **verify where every metric comes from**, improving trust in reporting.

---

## 📊 Key Achievements & Impact

- Reduced dashboard refresh times by **~50%**.  
- Eliminated KPI discrepancies across dashboards.  
- Leadership no longer relied on manual Excel reconciliations.  
- Analysts could answer ad hoc questions **without writing SQL**.  
- Enabled actionable insights such as identifying **overworked facilities** and optimizing staff allocation.  

---

## 💻 Repository Structure

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
