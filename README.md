# Medicare Part D Oncology Drug Spending Analysis (2019–2023)

Analyzing Trends, Costs, and Outliers in Oncology Drug Spending under Medicare Part D using SQL + Tableau

---

## 📊 Interactive Dashboard

➡️ **[View Tableau Public Dashboard](https://public.tableau.com/shared/8K47MHZHJ?:display_count=n&:origin=viz_share_link)**

Explore:
- Year-over-year total oncology drug spending
- Average unit cost trends (2019–2023)
- Top drugs by cost, usage, and growth
- Outlier detection and cost driver identification

---

## 🧠 Project Summary

This project analyzes **Medicare Part D** drug spending data (CMS) to uncover trends in oncology drug costs between 2019 and 2023. By leveraging SQL for data preparation and Tableau for visualization, we identify key cost drivers, drug-level outliers, and usage patterns in cancer treatment under Medicare.

---

## 🎯 Objectives

- Identify oncology drugs from the Part D dataset using brand/generic names
- Analyze cost and usage trends from 2019 to 2023
- Detect outliers in spending per unit and per claim
- Visualize market concentration, top-spending drugs, and usage intensity

---

## 🗃️ Data Sources

- [CMS Medicare Part D Drug Spending PUF](https://data.cms.gov/provider-summary-by-type-of-service/medicare-part-d-prescribers/part-d-drug-spending)
- Custom filtered and transformed dataset: `oncology_drug_data_long_oncology.csv`

---

## 🛠️ Methods & Tools

- **SQL (MySQL):**
  - Ingested and joined drug-level data
  - Filtered for oncology-specific drugs
  - Created long-format views for year-wise comparison
- **Tableau:**
  - Built 10+ visualizations
  - Combined wide and long format tables
  - Designed multi-sheet interactive dashboard
- **VS Code & Git:** Project version control and commit tracking

---

## 📌 Key Insights

- **+X%** increase in total oncology drug spending from 2019 to 2023
- Top **5 drugs account for ~Z%** of total Medicare Part D oncology costs
- **Drug ABC** showed the highest CAGR in unit spending (+123%)
- Outliers detected based on per-unit spending spikes
- Spending vs. claims scatter plots identify costly but low-use drugs

> 📈 _These insights can guide healthcare cost containment and formulary decisions._

---

## 🖼️ Visualizations

| Visualization | Description |
|---------------|-------------|
| **Total Spending by Year** | Line chart showing overall oncology drug cost trends |
| **Cost vs Utilization Bubble Chart** | Maps cost vs. claims to reveal high-cost/low-utilization drugs |
| **Top Drugs by % Increase (2019–2023)** | Ranks fastest-growing oncology drugs |
| **Cost-per-Unit Trend** | Line chart of average unit cost changes by drug |
| **Treemap of Drug Spending** | Proportional view of spending per drug |
| **Box Plot: Spending per Drug (w/ Outliers)** | Visualizes spread + highlights flagged outliers |
| **Outlier Flag Heatmap (2019–2023)** | Tracks outlier occurrence across years |
| **Spending vs. Claims Scatter (2023)** | Trendlines help pinpoint inefficiencies |
| **Manufacturer Market Share (2023)** | Pie/bar chart showing share of major pharma companies |

Screenshots stored under `/Images/` with descriptive names.

---

## Repository Structure

├── Dataset/
│ └── oncology_drug_data_long_oncology.csv
├── Images/
│ └── *.png (all Tableau screenshots)
├── Notes/
│ └── planning.md, questions, insights, etc.
├── SQL/
│ └── schema.sql, queries.sql, long_view.sql
├── Tableau/
│ └── Medicare Oncology Part D Spending Analysis.twbx
├── README.md
└── .gitignore

---
