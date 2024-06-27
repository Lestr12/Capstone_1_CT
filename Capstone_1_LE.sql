




select *
from Project_1.dbo.Capstone_1_LE 

 -- Looking the main ojects for analysis
select Age, Gender,Medical_Condition, Admission_Type, Test_Results
from Project_1.dbo.Capstone_1_LE
order by 1,3


-- Number Of Cases

SELECT 
    Medical_condition, 
    COUNT(*) AS Num_Cases
FROM 
    Project_1.dbo.Capstone_1_LE
GROUP BY 
    Medical_condition
ORDER BY 
    Medical_condition;


--Number of Patients by Age and Gender 
SELECT Age, Gender, COUNT(*) AS NumOfPatientsByAgeGender
FROM Project_1.dbo.Capstone_1_LE
GROUP BY Age, Gender
ORDER BY Age, Gender;





-- Number of Patients by Medical conditions and Age

select Age, Medical_Condition, count(Age) as NumOfPatients_MedConditions
from Project_1.dbo.Capstone_1_LE
Group by Age , Medical_Condition
Order by  Age , Medical_Condition
SELECT 
    CASE 
        WHEN Age < 18 THEN '0-17'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 50 THEN '35-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END AS Age_Group,
    Medical_Condition,
    COUNT(*) AS NumOfPatients
FROM Project_1.dbo.Capstone_1_LE
GROUP BY 
    CASE 
        WHEN Age < 18 THEN '0-17'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 50 THEN '35-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END,
    Medical_Condition
ORDER BY Age_Group, NumOfPatients DESC;


-- Number of patients by their Age
select Age, count(Age) as NumberOfPatientsByAge from
Project_1.dbo.Capstone_1_LE
Group by Age 
Having Age < 35
order by Age
 SELECT 
    CASE 
        WHEN Age < 18 THEN '0-17'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 50 THEN '35-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END AS Age_Group,
    Medical_Condition,
    COUNT(*) AS NumOfPatients
FROM Project_1.dbo.Capstone_1_LE
GROUP BY 
    CASE 
        WHEN Age < 18 THEN '0-17'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 50 THEN '35-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END,
    Medical_Condition
ORDER BY Age_Group, NumOfPatients DESC;

 -- Average Billing Amount by Medical Conditions 
 SELECT Medical_Condition, AVG(Billing_Amount) AS AvgBillingAmount
FROM Project_1.dbo.Capstone_1_LE
GROUP BY Medical_Condition
ORDER BY Medical_Condition;


 --Number of O- blood patients
select Medical_condition, Blood_Type, Count(*) as O_blood_Patients
from  Project_1.dbo.Capstone_1_LE
where Blood_Type = 'O-'
Group by Medical_condition, Blood_Type
Order by Medical_condition



--Min and Max ages by Medical conditions
select  Medical_Condition, MIN(Age) as Min_Age, MAX(Age) as Max_Age
from Project_1.dbo.Capstone_1_LE
Group by   Medical_Condition
Order by   Medical_Condition



--Num of patients by Medical condition and admission type
select Medical_condition, Admission_Type, count(*) as PatientsbyAdmission
from Project_1.dbo.Capstone_1_LE
Group by  Medical_Condition, Admission_Type 
Order by Medical_Condition

--Number of Cancer cases
select Medical_condition, Admission_Type, count(*) as NumOFCancerCases
from Project_1.dbo.Capstone_1_LE
where Medical_condition = 'Cancer' and  Admission_Type = 'Emergency'
Group by  Medical_condition, Admission_Type 
Order by count(*) DESC

--Test results on the average Age
select Test_Results, AVG(Age) as Average_Age
from
Project_1.dbo.Capstone_1_LE
Group by Test_Results

--Frequencey of medical_condition

select Medical_condition , count(Medical_condition) as NuMOFMedicalCond
from
Project_1.dbo.Capstone_1_LE
Group by Medical_Condition
Order by count(Medical_condition) DESC


-- Insurance
select Insurance_Provider , sum(Billing_Amount) as AmountCoverage, count(Insurance_Provider) as Num_Coverage 
from Project_1.dbo.Capstone_1_LE
Group by  Insurance_Provider
Order by count(Insurance_Provider) DESC


-- Average Billing amount by Age Group and Gender 

SELECT 
    CASE 
        WHEN Age < 18 THEN '0-17'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 50 THEN '35-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END AS Age_Group,
    Gender,
    AVG(Billing_Amount) AS AvgBillingAmount
FROM Project_1.dbo.Capstone_1_LE
GROUP BY 
    CASE 
        WHEN Age < 18 THEN '0-17'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 50 THEN '35-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END,
    Gender
ORDER BY Age_Group, Gender;

--  Total Billinf Amount by Medical Condition and Insurance Provider 

SELECT Medical_Condition, Insurance_Provider, SUM(Billing_Amount) AS TotalBillingAmount
FROM Project_1.dbo.Capstone_1_LE
GROUP BY Medical_Condition, Insurance_Provider
ORDER BY TotalBillingAmount DESC;




















