# medicare-oncology-partd-analysis

Analyzing Trends and Regional Variations in Oncology Drug Spending under Medicare Part D

---

## Interactive Dashboard

[View on Tableau Public](https://public.tableau.com/shared/8K47MHZHJ?:display_count=n&:origin=viz_share_link)

Explore interactive visualizations of:
- Total spending by year
- Average cost-per-unit trends
- Top oncology drugs by Medicare Part D spending
- Treemap showing drug-level spending distribution

---

## Project Overview

This repository contains analysis of oncology drug spending under Medicare Part D from 2019 to 2023. The project aims to identify trends, cost drivers, and potential variations in spending on cancer-related medications.

---

## Objectives

- Identify oncology drugs included in Medicare Part D
- Analyze spending trends over multiple years
- Calculate average cost per dose/unit and changes over time
- Visualize insights to support healthcare policy discussions and cost containment strategies

---

## Data Sources

- Medicare Part D Drug Spending Public Use File (CMS)
- Custom extracted dataset: oncology_drug_data_long_oncology.csv

---

## Methods

- Data loaded into a MySQL database
- Filtering of oncology drugs using brand and generic names
- Aggregation of spending data by drug and year
- Creation of long-format SQL view for year-over-year analysis
- Export of oncology-only dataset to CSV for Tableau visualization

---

## Preliminary Insights

- Total oncology drug spending under Medicare Part D increased from $X in 2019 to $Y in 2023.
- Top 5 oncology drugs account for approximately Z% of total oncology spending.
- Drug ABC showed a price increase of +123% from 2019 to 2023.
- Manufacturer DEF leads market share in oncology drug spending.

---

## Planned Visualizations

- Time trends for total oncology drug spending
- Top oncology drugs ranked by total spending
- Changes in average unit cost over time
- Treemaps or charts showing drug-level cost contributions

---

## Current Status

- Data imported into MySQL and cleaned  
- Oncology drug list curated from brand/generic names  
- Created long-format SQL view for year-over-year analysis  
- Exported oncology-only data to CSV for visualization  
- Built Tableau dashboard with key visualizations  

Next steps:

- Identify outlier drugs and cost drivers
- Summarize final insights
- Share with relevant audiences (e.g., health policy, data science)

---

## Repository Structure

/sql
Scripts for table creation, data import, and analysis queries

/tableau
Tableau workbook(s) for visualization

/notes
Documentation, planning notes, and intermediate outputs

/Dataset
Raw Medicare Part D file
Exported oncology_drug_data_long_oncology.csv


---

## Future Deliverables

- Cleaned and processed Medicare Part D oncology drug data
- SQL scripts for analysis
- Tableau dashboards published to Tableau Public:
  -[View on Tableau Public](https://public.tableau.com/shared/8K47MHZHJ?:display_count=n&:origin=viz_share_link)
- Summary of key findings  
