CREATE DATABASE healthcare;

USE healthcare;

show tables;

select * from heart_patient_healthcare_dataset;

-- BASIC SQL QUESTIONS
-- 1. Count the total number of patients.
select count(*) as total_patients from `heart_patient_healthcare_dataset`;

-- 2. Find the average age of patients.
select avg(age) as avg_age from `heart_patient_healthcare_dataset`;

-- 3. List all distinct chest pain types.
select distinct chest_pain_type from `heart_patient_healthcare_dataset`;

-- 4. Count how many male and female patients are there.
select gender, count(*) as total from `heart_patient_healthcare_dataset` group by gender;
SELECT 
    CASE 
        WHEN sex = 1 THEN 'Male'
        WHEN sex = 0 THEN 'Female'
    END AS gender,
    COUNT(*) AS total
FROM heart_patients
GROUP BY sex;

-- 5. Find patients older than 60 years.
select * from `heart_patient_healthcare_dataset` where age > 60;

-- 6. Count patients with heart disease.
select heart_disease, count(*) as patients from `heart_patient_healthcare_dataset` group by heart_disease;

-- 7. Retrieve patients with cholesterol level greater than 240.
select * from `heart_patient_healthcare_dataset` where cholesterol > 240;

-- 8. Show patients with fasting blood sugar > 120 mg/dl.
SELECT *
FROM heart_patient_healthcare_dataset
WHERE fasting_blood_sugar > 1;

-- 9. List patients who have exercise-induced angina.
select * from `heart_patient_healthcare_dataset` where exercise_induced_angina= 'yes';

-- 10. Find the minimum and maximum resting blood pressure.
select
min(resting_bp) as min_bp,
max(resting_bp) as max_bp
from `heart_patient_healthcare_dataset`;

-- MEDIUM LEVEL SQL QUESTIONS
-- Find the percentage of patients with heart disease.
select
(sum(case when heart_disease = 1 then 1 else 0 end) * 100.0/count(*))
as heart_disease_percentage
from heart_patient_healthcare_dataset;

-- Compare average cholesterol for patients with and without heart disease.
select 
cholesterol,
avg(cholesterol) as avg_cholesterol
from heart_patient_healthcare_dataset
group by  cholesterol;

-- Find age-wise distribution of heart disease cases.
select age, count(*) as heart_disease_cases from heart_patient_healthcare_dataset
where  heart_disease =1
group by age
order by age;

-- Identify chest pain types most associated with heart disease.
select 
chest_pain_type,
count(*) as heart_disease_cases
from heart_patient_healthcare_dataset
where heart_disease =1
group by chest_pain_type
order by heart_disease_cases desc;

-- Find patients who have:
-- Heart disease
-- Exercise-induced angina
-- Cholesterol > 250
select * from heart_patient_healthcare_dataset
where heart_disease = 1
and exercise_induced_angina =1
and cholesterol > 250;

-- Rank patients by maximum heart rate (use window functions).
select 
gender, 
count(case when heart_disease =1 then 1 end)*1.0 / count(*) as heart_disease_ratio
from heart_patient_healthcare_dataset
group by gender;

-- Find gender-wise heart disease ratio.



-- Determine which slope type has the highest heart disease cases.

-- Find patients whose resting BP is above the dataset average.

-- Create a view showing only high-risk patients (heart disease = 1 and age > 60).

-- INTERMEDIATE SQL QUESTIONS
-- Count heart disease cases grouped by gender.
select gender, count(heart_disease) as heart_diease from heart_patient_healthcare_dataset group by gender;

-- Find the average cholesterol level by chest pain type.
select chest_pain_type, avg(cholesterol) as avg_cholesterol from heart_patient_healthcare_dataset group by chest_pain_type;

-- List patients with heart disease and age above 55.
select * from heart_patient_healthcare_dataset where heart_disease = 1 and age > 55;

-- Count patients grouped by chest pain type.
select chest_pain_type , count(*) as patients from heart_patient_healthcare_dataset group by chest_pain_type;

-- Find the average max heart rate by gender.


-- Retrieve patients with normal ECG and no heart disease.

-- Count how many patients have 0 major vessels affected.

-- Find patients with oldpeak greater than 2.0.

-- Group patients by thalassemia and count cases.

-- Find the top 10 patients with the highest cholesterol.