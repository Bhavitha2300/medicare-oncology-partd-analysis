# Medicare Part D Oncology Drug Spending Analysis (2019–2023)

Comprehensive data exploration of Medicare Part D oncology drug costs using SQL and Tableau. This project highlights inefficiencies, cost drivers, outliers, and usage patterns to inform data-driven healthcare decisions.

---

## 📊 Interactive Dashboard

🔗 **[View Dashboard on Tableau Public](https://public.tableau.com/app/profile/bhavitha.asam6391/vizzes)**

The Tableau dashboard features a custom interactive navigation page that allows users to explore insights across six core areas:

- 🧾 **Project Overview**  
- 📌 **Key Findings**  
- 💡 **Strategic Insights**  
- 🚨 **Outlier Monitor**  
- 🌍 **Market Landscape**  
- 📈 **Utilization Trends**  
- 📊 **Key KPIs**

---

## 🧠 Project Summary

This project examines **Medicare Part D oncology drug spending** trends from 2019–2023 using data from CMS. Through SQL preprocessing and Tableau visualization, it identifies key cost drivers, outlier behavior, and strategic insights to aid policymakers and analysts.

---

## 🎯 Objectives

- Detect top oncology drugs by spend and growth
- Evaluate unit cost, utilization, and beneficiary trends
- Identify drugs with outlier pricing or usage
- Highlight manufacturers with high cost concentration
- Offer actionable insights for drug cost optimization

---

## 🗃️ Data Sources

- 📂 [CMS Medicare Part D Drug Spending PUF](https://data.cms.gov/summary-statistics-on-use-and-payments/medicare-medicaid-spending-by-drug/medicare-part-d-spending-by-drug)
- 🧪 Preprocessed dataset: `oncology_drug_data_long_oncology.csv`

---

## 🛠️ Tools & Methods

- **SQL (MySQL)**  
  - Data ingestion, filtering, transformation to long format
- **Tableau Desktop Public Edition**  
  - Navigation page with multi-dashboard drilldowns
  - 10+ integrated visualizations
- **Git + VS Code**  
  - Version control, collaboration & documentation

---

## 📌 Key Insights

- **15.1% increase** in oncology spending from $2.53B → $2.91B (2019–2023)
- Just **5 drugs** account for **50%+** of total spend
- **Pantoprazole Sodium** had a **+1345.7% CAGR** in unit price
- **Fluorouracil** identified as low-cost but extremely high-usage (bulk opportunity)
- **70% of market** controlled by just **2 manufacturers**
- Notable YoY decrease in 2023 spending (**-18.79%** from 2022)

---

## 📈 Dashboard Sections Overview

| Section | Description |
|--------|-------------|
| **Navigation Page** | Interactive landing page with buttons to all sections
| **Project Overview** | Objectives, data sources, key questions |
| **Key Findings** | High-level trends in total spending, outlier costs, and growth drivers |
| **Strategic Insights** | Optimization ideas: cost outlier flags, prescriber behavior, procurement risks |
| **Outlier Monitor** | Box plots, CAGR charts, and heatmaps to identify pricing anomalies |
| **Market Landscape** | Manufacturer market share and year-wise spend distribution |
| **Utilization Trends** | Unit cost, claims, and cost-per-beneficiary trends |
| **Key KPIs** | 2023 spend, YoY change, top drug by spend, and highest cost increase |

---

## 📂 Repository Structure

📁 Dataset/
└── oncology_drug_data_long_oncology.csv

📁 Images/
└── *.png (dashboard screenshots)

📁 Notes/
└── planning.md, insights, drafts

📁 SQL/
└── schema.sql, filter_queries.sql, long_view.sql

📁 Tableau/
└── Medicare Oncology Part D Spending Analysis.twbx

📄 README.md
📝 .gitignore


---

## 👩‍⚕️ Audience

Designed for:
- Healthcare policy makers
- Cost control analysts
- CMS researchers & stakeholders

---

> 📢 _This analysis supports transparency and smarter spending in oncology drug reimbursement under Medicare._

---

## 📣 Author

**Bhavitha Asam**  
[LinkedIn Profile](www.linkedin.com/in/bhavitha-asam-38300b278)  
_Git-powered Tableau storyteller and SQL wrangler._

---