CREATE TABLE Hospital(
Hospital_Name VARCHAR(100) NOT NULL,
Location VARCHAR(100) NOT NULL,
Department VARCHAR(100) NOT NULL,
Doctors_Count INT,
Patients_Count INT,
Admission_Date DATE,
Discharge_Date DATE,
Medical_Expenses NUMERIC (10,2)
);

SELECT * FROM Hospital;


--1.Total Number of Patients

SELECT SUM(Patients_Count) AS Total_Patient
FROM Hospital;

--2.Average Number of Doctors per Hospital

SELECT ROUND(AVG(Doctors_Count), 0) AS Average_Doctors
FROM Hospital;

--3 Top 3 Departments with the Highest Number of Patients

SELECT department , MAX(Patients_Count) as Highest_Patient_Count
from Hospital
group by department
order by Highest_Patient_Count DESC
limit 3;

--4 Hospital with the Maximum Medical Expenses

SELECT Hospital_Name, sum(Medical_Expenses) as Highest_Expense 
FROM Hospital
GROUP BY Hospital_Name
order by Highest_Expense DESC
limit 3;

--5 Daily Average Medical Expenses

SELECT Hospital_Name , ROUND(AVG(Medical_Expenses),2) AS AVERAGE_EXPENSE
FROM Hospital
group by Hospital_Name
order by AVERAGE_EXPENSE DESC;


--6 Longest Hospital Stay

SELECT Hospital_Name , SUM(Discharge_Date - Admission_Date) AS LONGEST_STAY
from Hospital
GROUP BY Hospital_Name
ORDER BY LONGEST_STAY DESC;

--7 Total Patients Treated Per City

SELECT Location , SUM(Patients_Count) AS PATIENT_COUNT
from Hospital
GROUP BY Location
ORDER BY PATIENT_COUNT DESC;

--8 Average Length of Stay Per Department

SELECT Department , ROUND(AVG(Discharge_Date-Admission_Date),0) AS AVG_LENGHT_STAY
FROM Hospital
group by Department
order by AVG_LENGHT_STAY desc;

--9 Identify the Department with the Lowest Number of Patients
 
select department , sum(Patients_Count) as Minimum_patient
from hospital
group by Department
order by Minimum_patient ASC;

--10 Monthly Medical Expenses Report

SELECT TRIM(TO_CHAR(Admission_Date, 'Month')) AS Month_Name,
       SUM(Medical_Expenses) AS Total_Exp
FROM Hospital
GROUP BY TO_CHAR(Admission_Date, 'Month'), EXTRACT(MONTH FROM Admission_Date)
ORDER BY EXTRACT(MONTH FROM Admission_Date);






