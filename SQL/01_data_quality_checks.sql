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
   


