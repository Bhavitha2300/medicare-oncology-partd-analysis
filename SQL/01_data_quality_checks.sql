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

--- Manufacturer Analysis --- 
SELECT
    Mftr_Name,
    COUNT(DISTINCT Brnd_Name) AS unique_brand_count,
    SUM(Tot_Spndng_2023) AS total_spending_2023
FROM oncology_drug_data
GROUP BY Mftr_Name
ORDER BY total_spending_2023 DESC;

SELECT DISTINCT Brnd_Name 
FROM oncology_drug_data
ORDER BY Brnd_Name;


--- Data Filtering for Oncology Drugs---
SELECT *
FROM oncology_drug_data
WHERE Brnd_Name IN (
    'Abraxane',
    'Afinitor',
    'Afinitor Disperz',
    'Alecensa',
    'Alimta',
    'Alunbrig',
    'Arimidex',
    'Aromasin',
    'Avastin',
    'Azacitidine',
    'Bendamustine',
    'Bendeka',
    'Bicalutamide',
    'Bosulif',
    'Bortezomib',
    'Cabometyx',
    'Calquence',
    'Caprelsa',
    'Carboplatin',
    'Casodex',
    'Cisplatin',
    'Copiktra',
    'Cyramza',
    'Darzalex',
    'Decitabine',
    'Docetaxel',
    'Doxorubicin HCl',
    'Doxorubicin HCl Liposome',
    'Erbitux',
    'Erleada',
    'Erlotinib HCl',
    'Etoposide',
    'Everolimus',
    'Exemestane',
    'Faslodex',
    'Femara',
    'Fluorouracil',
    'Fulvestrant',
    'Gazyva',
    'Gemcitabine HCl',
    'Gleevec'
)
OR Gnrc_Name IN (
    'Abiraterone Acetate',
    'Azacitidine',
    'Bendamustine',
    'Bicalutamide',
    'Bortezomib',
    'Cabozantinib',
    'Calquence',
    'Carboplatin',
    'Cisplatin',
    'Cyclophosphamide',
    'Cytarabine',
    'Decitabine',
    'Docetaxel',
    'Doxorubicin HCl',
    'Erlotinib',
    'Etoposide',
    'Everolimus',
    'Exemestane',
    'Fluorouracil',
    'Fulvestrant',
    'Gemcitabine',
    'Imatinib'
);

--- Summarize Spending by Drug ---
SELECT
    Brnd_Name,
    Gnrc_Name,
    SUM(Tot_Spndng_2019) AS total_spending_2019,
    SUM(Tot_Spndng_2020) AS total_spending_2020,
    SUM(Tot_Spndng_2021) AS total_spending_2021,
    SUM(Tot_Spndng_2022) AS total_spending_2022,
    SUM(Tot_Spndng_2023) AS total_spending_2023,
    SUM(
        Tot_Spndng_2019 +
        Tot_Spndng_2020 +
        Tot_Spndng_2021 +
        Tot_Spndng_2022 +
        Tot_Spndng_2023
    ) AS total_spending_all_years
FROM oncology_drug_data
GROUP BY Brnd_Name, Gnrc_Name
ORDER BY total_spending_all_years DESC;

--- Summarize Spending by Manufacturer + Drug ---
SELECT
    Mftr_Name,
    Brnd_Name,
    Gnrc_Name,
    SUM(Tot_Spndng_2019) AS total_spending_2019,
    SUM(Tot_Spndng_2020) AS total_spending_2020,
    SUM(Tot_Spndng_2021) AS total_spending_2021,
    SUM(Tot_Spndng_2022) AS total_spending_2022,
    SUM(Tot_Spndng_2023) AS total_spending_2023,
    SUM(
        Tot_Spndng_2019 +
        Tot_Spndng_2020 +
        Tot_Spndng_2021 +
        Tot_Spndng_2022 +
        Tot_Spndng_2023
    ) AS total_spending_all_years
FROM oncology_drug_data
GROUP BY Mftr_Name, Brnd_Name, Gnrc_Name
ORDER BY total_spending_all_years DESC;

--- Trend Analysis by Drug ---
SELECT
    Brnd_Name,
    Gnrc_Name,
    SUM(Tot_Spndng_2019) AS total_spending_2019,
    SUM(Tot_Spndng_2020) AS total_spending_2020,
    SUM(Tot_Spndng_2021) AS total_spending_2021,
    SUM(Tot_Spndng_2022) AS total_spending_2022,
    SUM(Tot_Spndng_2023) AS total_spending_2023
FROM oncology_drug_data
GROUP BY Brnd_Name, Gnrc_Name
ORDER BY total_spending_2023 DESC;

--- Identify High-Price Drugs ---
SELECT
    Brnd_Name,
    Gnrc_Name,
    AVG(Avg_Spnd_Per_Bene_2019) AS avg_price_per_patient_2019,
    AVG(Avg_Spnd_Per_Bene_2020) AS avg_price_per_patient_2020,
    AVG(Avg_Spnd_Per_Bene_2021) AS avg_price_per_patient_2021,
    AVG(Avg_Spnd_Per_Bene_2022) AS avg_price_per_patient_2022,
    AVG(Avg_Spnd_Per_Bene_2023) AS avg_price_per_patient_2023
FROM oncology_drug_data
GROUP BY Brnd_Name, Gnrc_Name
ORDER BY avg_price_per_patient_2023 DESC;

--- Manufacturer Market Share ---
SELECT
    Mftr_Name,
    SUM(Tot_Spndng_2019) AS total_spending_2019,
    SUM(Tot_Spndng_2020) AS total_spending_2020,
    SUM(Tot_Spndng_2021) AS total_spending_2021,
    SUM(Tot_Spndng_2022) AS total_spending_2022,
    SUM(Tot_Spndng_2023) AS total_spending_2023,
    SUM(
        Tot_Spndng_2019 +
        Tot_Spndng_2020 +
        Tot_Spndng_2021 +
        Tot_Spndng_2022 +
        Tot_Spndng_2023
    ) AS total_spending_all_years,
    SUM(
        Tot_Spndng_2019 +
        Tot_Spndng_2020 +
        Tot_Spndng_2021 +
        Tot_Spndng_2022 +
        Tot_Spndng_2023
    ) * 100.0 / 
    (
        SELECT SUM(
            Tot_Spndng_2019 +
            Tot_Spndng_2020 +
            Tot_Spndng_2021 +
            Tot_Spndng_2022 +
            Tot_Spndng_2023
        )
        FROM oncology_drug_data
    ) AS pct_share_all_years
FROM oncology_drug_data
GROUP BY Mftr_Name
ORDER BY total_spending_all_years DESC;

--- Clean Up Brand = Generic Duplicates ---
CREATE OR REPLACE VIEW oncology_drug_data_clean AS
SELECT *
FROM oncology_drug_data
WHERE Brnd_Name <> Gnrc_Name
  AND Mftr_Name <> 'Overall';

--- Remove zero-spending drugs ---
CREATE OR REPLACE VIEW oncology_drug_data_nonzero AS
SELECT *
FROM oncology_drug_data_clean
WHERE 
    COALESCE(Tot_Spndng_2019,0) +
    COALESCE(Tot_Spndng_2020,0) +
    COALESCE(Tot_Spndng_2021,0) +
    COALESCE(Tot_Spndng_2022,0) +
    COALESCE(Tot_Spndng_2023,0) > 0;
    
SELECT COUNT(*) FROM oncology_drug_data_nonzero;


--- long-format table ---
CREATE OR REPLACE VIEW oncology_drug_data_long AS
SELECT
    id,
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    2019 AS Year,
    Tot_Spndng_2019 AS Tot_Spndng,
    Tot_Dsg_Unts_2019 AS Tot_Dsg_Unts,
    Tot_Clms_2019 AS Tot_Clms,
    Tot_Benes_2019 AS Tot_Benes,
    Avg_Spnd_Per_Dsg_Unt_Wghtd_2019 AS Avg_Spnd_Per_Dsg_Unt_Wghtd,
    Avg_Spnd_Per_Clm_2019 AS Avg_Spnd_Per_Clm,
    Avg_Spnd_Per_Bene_2019 AS Avg_Spnd_Per_Bene,
    Outlier_Flag_2019 AS Outlier_Flag
FROM oncology_drug_data_nonzero

UNION ALL

SELECT
    id,
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    2020 AS Year,
    Tot_Spndng_2020,
    Tot_Dsg_Unts_2020,
    Tot_Clms_2020,
    Tot_Benes_2020,
    Avg_Spnd_Per_Dsg_Unt_Wghtd_2020,
    Avg_Spnd_Per_Clm_2020,
    Avg_Spnd_Per_Bene_2020,
    Outlier_Flag_2020
FROM oncology_drug_data_nonzero

UNION ALL

SELECT
    id,
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    2021,
    Tot_Spndng_2021,
    Tot_Dsg_Unts_2021,
    Tot_Clms_2021,
    Tot_Benes_2021,
    Avg_Spnd_Per_Dsg_Unt_Wghtd_2021,
    Avg_Spnd_Per_Clm_2021,
    Avg_Spnd_Per_Bene_2021,
    Outlier_Flag_2021
FROM oncology_drug_data_nonzero

UNION ALL

SELECT
    id,
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    2022,
    Tot_Spndng_2022,
    Tot_Dsg_Unts_2022,
    Tot_Clms_2022,
    Tot_Benes_2022,
    Avg_Spnd_Per_Dsg_Unt_Wghtd_2022,
    Avg_Spnd_Per_Clm_2022,
    Avg_Spnd_Per_Bene_2022,
    Outlier_Flag_2022
FROM oncology_drug_data_nonzero

UNION ALL

SELECT
    id,
    Brnd_Name,
    Gnrc_Name,
    Mftr_Name,
    2023,
    Tot_Spndng_2023,
    Tot_Dsg_Unts_2023,
    Tot_Clms_2023,
    Tot_Benes_2023,
    Avg_Spnd_Per_Dsg_Unt_Wghtd_2023,
    Avg_Spnd_Per_Clm_2023,
    Avg_Spnd_Per_Bene_2023,
    Outlier_Flag_2023
FROM oncology_drug_data_nonzero;

SELECT * FROM oncology_drug_data_long LIMIT 20;

CREATE OR REPLACE VIEW oncology_drug_data_long_oncology AS
SELECT *
FROM oncology_drug_data_long
WHERE Brnd_Name IN (
    'Abraxane',
    'Afinitor',
    'Afinitor Disperz',
    'Alecensa',
    'Alimta',
    'Alunbrig',
    'Arimidex',
    'Aromasin',
    'Avastin',
    'Azacitidine',
    'Bendamustine',
    'Bendeka',
    'Bicalutamide',
    'Bosulif',
    'Bortezomib',
    'Cabometyx',
    'Calquence',
    'Caprelsa',
    'Carboplatin',
    'Casodex',
    'Cisplatin',
    'Copiktra',
    'Cyramza',
    'Darzalex',
    'Decitabine',
    'Docetaxel',
    'Doxorubicin HCl',
    'Doxorubicin HCl Liposome',
    'Erbitux',
    'Erleada',
    'Erlotinib HCl',
    'Etoposide',
    'Everolimus',
    'Exemestane',
    'Faslodex',
    'Femara',
    'Fluorouracil',
    'Fulvestrant',
    'Gazyva',
    'Gemcitabine HCl',
    'Gleevec'
)
OR Gnrc_Name IN (
    'Abiraterone Acetate',
    'Azacitidine',
    'Bendamustine',
    'Bicalutamide',
    'Bortezomib',
    'Cabozantinib',
    'Calquence',
    'Carboplatin',
    'Cisplatin',
    'Cyclophosphamide',
    'Cytarabine',
    'Decitabine',
    'Docetaxel',
    'Doxorubicin HCl',
    'Erlotinib',
    'Etoposide',
    'Everolimus',
    'Exemestane',
    'Fluorouracil',
    'Fulvestrant',
    'Gemcitabine',
    'Imatinib'
);

SELECT * FROM oncology_drug_data_long_oncology LIMIT 20;

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT * FROM oncology_drug_data_long_oncology;


--- Export the Cleaned Oncology Data---
SELECT *
INTO OUTFILE '/Users/bhavithaasam/Desktop/Projects/Medicare Part D Spending/Medicare Part D Spending by Drug/Dataset/DSD_PTD_RY25_P04_V10_DY23_BGM.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM oncology_drug_data_long_oncology;


