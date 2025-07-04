# medicare-oncology-partd-analysis

Analyzing Trends and Regional Variations in Oncology Drug Spending under Medicare Part D

---

## Project Overview

This repository contains work in progress for a data analysis project exploring oncology drug spending under Medicare Part D from 2019 to 2023. The project aims to identify trends, cost drivers, and potential regional variations in spending on cancer-related medications.

---

## Objectives

- Identify oncology drugs included in Medicare Part D
- Analyze spending trends over multiple years
- Calculate average cost per dose/unit and changes over time
- Explore possible regional differences in spending (if geographic data is available)
- Visualize insights to support healthcare policy discussions and cost containment strategies

---

## Data Sources

- Medicare Part D Drug Spending Public Use File (CMS)
- Optional: FDA drug indications data for oncology-specific mapping

---

## Methods

- Data loaded into a MySQL database
- Filtering of oncology drugs using keyword searches (e.g. carcinoma, leukemia, lymphoma, melanoma, neoplasm, oncology)
- Aggregation of spending data by drug and year
- Calculation of average costs per dosage unit and growth rates
- Preparation of summary tables for visualization in Tableau

---

## Planned Visualizations

- Time trends for total oncology drug spending
- Top oncology drugs ranked by total spending
- Changes in average unit cost over time
- Regional heatmaps of spending (if data allows)
- Treemaps or charts showing drug-level cost contributions

---

## Current Status

This project is currently in progress. Work completed so far:

- Data imported into MySQL
- Table structure defined
- Data successfully loaded via MySQL Workbench Import Wizard

Next steps:

- Write SQL queries for aggregations and metrics
- Filter and identify oncology-specific drugs
- Export data for visualization
- Build Tableau dashboards
- Summarize insights

---

## Repository Structure

/sql  
    Scripts for table creation, data import, and analysis queries

/tableau  
    Tableau workbook(s) for visualization

/notes  
    Documentation, planning notes, and intermediate outputs

README.md

---

## Future Deliverables

- Cleaned and processed Medicare Part D oncology drug data
- SQL scripts for analysis
- Tableau dashboards published to Tableau Public
- Summary of key findings


