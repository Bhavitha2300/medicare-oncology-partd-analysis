DESCRIBE oncology_drug_data;

SELECT * FROM oncology_drug_data LIMIT 10;

SELECT COUNT(*) FROM oncology_drug_data;

SELECT COUNT(DISTINCT Brnd_Name) as different_medications FROM oncology_drug_data;

SELECT COUNT(DISTINCT Gnrc_Name) as different_generic_med FROM oncology_drug_data;

SELECT Brnd_Name, Tot_Spndng_2023 FROM oncology_drug_data LIMIT 5;

SELECT *
FROM oncology_drug_data
WHERE Tot_Spndng_2019 IS NULL OR Tot_Spndng_2019 = 0
   OR Tot_Spndng_2020 IS NULL OR Tot_Spndng_2020 = 0
   OR Tot_Spndng_2021 IS NULL OR Tot_Spndng_2021 = 0
   OR Tot_Spndng_2022 IS NULL OR Tot_Spndng_2022 = 0
   OR Tot_Spndng_2023 IS NULL OR Tot_Spndng_2023 = 0;
   

SELECT Brnd_Name, Gnrc_Name, count(*) AS duplicate_drugs FROM oncology_drug_data GROUP BY Brnd_Name, Gnrc_Name HAVING COUNT(*) > 1;

--- Total Spending by Year --- 
SELECT SUM(Tot_Spndng_2019) AS total_amount_spent_in_2019, SUM(Tot_Spndng_2020) AS total_amount_spent_in_2020, SUM(Tot_Spndng_2021) AS total_amount_spent_in_2021, SUM(Tot_Spndng_2022) AS total_amount_spent_in_2022, SUM(Tot_Spndng_2023) AS total_amount_spent_in_2023 FROM oncology_drug_data;

--- Top 5 Drugs by Total Spending ---
SELECT Brnd_Name,Gnrc_Name,Mftr_Name,Tot_Spndng_2019 FROM oncology_drug_data ORDER BY Tot_Spndng_2019 DESC LIMIT 10;
SELECT Brnd_Name,Gnrc_Name,Mftr_Name,Tot_Spndng_2020 FROM oncology_drug_data ORDER BY Tot_Spndng_2020 DESC LIMIT 10;
SELECT Brnd_Name,Gnrc_Name,Mftr_Name,Tot_Spndng_2021 FROM oncology_drug_data ORDER BY Tot_Spndng_2021 DESC LIMIT 10;
SELECT Brnd_Name,Gnrc_Name,Mftr_Name,Tot_Spndng_2022 FROM oncology_drug_data ORDER BY Tot_Spndng_2022 DESC LIMIT 10;
SELECT Brnd_Name,Gnrc_Name,Mftr_Name,Tot_Spndng_2023 FROM oncology_drug_data ORDER BY Tot_Spndng_2023 DESC LIMIT 10;

---  Top 10 Drugs by Total Spending (2019–2023)---
SELECT
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    (IFNULL(Tot_Spndng_2019, 0) +
     IFNULL(Tot_Spndng_2020, 0) +
     IFNULL(Tot_Spndng_2021, 0) +
     IFNULL(Tot_Spndng_2022, 0) +
     IFNULL(Tot_Spndng_2023, 0)) AS Total_Spending_2019_2023
FROM oncology_drug_data
ORDER BY Total_Spending_2019_2023 DESC
LIMIT 10;

--- Average Cost-Per-Unit Change---
SELECT
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    Avg_Spnd_Per_Dsg_Unt_Wghtd_2019,
    Avg_Spnd_Per_Dsg_Unt_Wghtd_2023,
    CASE
        WHEN Avg_Spnd_Per_Dsg_Unt_Wghtd_2019 = 0 OR Avg_Spnd_Per_Dsg_Unt_Wghtd_2019 IS NULL THEN NULL
        ELSE 
            ((Avg_Spnd_Per_Dsg_Unt_Wghtd_2023 - Avg_Spnd_Per_Dsg_Unt_Wghtd_2019)
             / Avg_Spnd_Per_Dsg_Unt_Wghtd_2019) * 100
    END AS Percent_Change
FROM oncology_drug_data
ORDER BY Percent_Change DESC
LIMIT 10;

--- Drugs with High Outlier Flags--- 
SELECT
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name
FROM oncology_drug_data
WHERE Outlier_Flag_2019 = 1 OR Outlier_Flag_2020 = 1 OR Outlier_Flag_2021 = 1 OR Outlier_Flag_2022 = 1  OR Outlier_Flag_2023 = 1;

--- Drugs with Outlier Flags in Multiple Years---
SELECT
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    (IFNULL(Outlier_Flag_2019,0) +
     IFNULL(Outlier_Flag_2020,0) +
     IFNULL(Outlier_Flag_2021,0) +
     IFNULL(Outlier_Flag_2022,0) +
     IFNULL(Outlier_Flag_2023,0)
    ) AS num_years_outlier
FROM oncology_drug_data
WHERE
    (IFNULL(Outlier_Flag_2019,0) +
     IFNULL(Outlier_Flag_2020,0) +
     IFNULL(Outlier_Flag_2021,0) +
     IFNULL(Outlier_Flag_2022,0) +
     IFNULL(Outlier_Flag_2023,0)
    ) >= 2;



