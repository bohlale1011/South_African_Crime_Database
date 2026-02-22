use [SA_Criminal_Database.dbo] 
SELECT TOP (1000) [RecordID]
      ,[FirstName]
      ,[LastName]
      ,[FullName]
      ,[Age]
      ,[Gender]
      ,[Country]
      ,[Province]
      ,[SouthAfricanID]
      ,[CaseNumber]
      ,[CrimeType]
      ,[FinancialScore]
      ,[EstimatedFraudAmount_ZAR]
      ,[RiskLevel]
      ,[CaseStatus]
      ,[BankInvolved]
      ,[PreviousOffenses]
      ,[Arrested]
      ,[CrimeDate]
      ,[CourtDate]
      ,[InvestigatingOfficer]
      ,[StationCode]
  FROM [SA_Criminal_Database.dbo].[dbo].[south_africa_criminal_database]



  South Africa Criminal Database - 30 SQL Questions (Questions Only)



--1. Display all records from the CriminalCases table.

select * 
from [south_africa_criminal_database]

--2. Count the total number of cases in the table.

select count (*) as total_number_of_cases 
from [south_africa_criminal_database]

--3. Count the number of cases in each province.

select [Province], count (*) as number_of_cases
from [south_africa_criminal_database]
group by province


--4. Retrieve all cases where the crime type is Fraud.

select  *
from [south_africa_criminal_database]
where crimetype = 'Fraud'


--5. Count the number of cases for each crime type.

select  crimetype, Count(*) as CrimeType_Count
from [south_africa_criminal_database]
group by crimetype

--6. Display all cases classified as High or Critical risk.

select * 
from [south_africa_criminal_database]
where RiskLevel IN ('High','Critical')
ORDER BY RiskLevel

--7. Calculate the average Financial Score of all suspects.

select AVG(FinancialScore) as Average_FScore
from [south_africa_criminal_database]



--8. Find the highest Estimated Fraud Amount recorded.

SELECT MAX(EstimatedFraudAmount_ZAR) as Max_Amount
FROM [south_africa_criminal_database]

--9. Retrieve the top 10 cases with the highest Estimated Fraud Amount.

SELECT TOP 10 CrimeType ,MAX(EstimatedFraudAmount_ZAR) as Max_Amount
FROM [south_africa_criminal_database]
GROUP BY CrimeType
ORDER BY 2 DESC

--10. Display all cases where the suspect was arrested.

SELECT *
FROM [south_africa_criminal_database]
WHERE CaseStatus = 'Convicted'

--11. Count how many suspects were arrested versus not arrested.

SELECT 'Convicted cases' CaseGroup, COUNT(*) as conviction_number
FROM [south_africa_criminal_database]
WHERE CaseStatus = 'Convicted'
UNION ALL
SELECT 'Non Convicted cases' CaseGroup, COUNT(*) as conviction_number
FROM [south_africa_criminal_database]
WHERE CaseStatus <> 'Convicted'

--12. Count the number of cases associated with each bank.

select BankInvolved, count(*) as number_of_cases 
from [south_africa_criminal_database]
group by BankInvolved

--13. Calculate the total Estimated Fraud Amount per province.

select Province,SUM(EstimatedFraudAmount_ZAR) as total_estimated_amount_in_Rands
from [south_africa_criminal_database]
group by Province

--14. Retrieve all suspects older than 50 years.

SELECT * FROM [south_africa_criminal_database]
WHERE Age > 50 

--15. Calculate the average age of suspects per province.

SELECT PROVINCE,AVG(age) as average_age
from [south_africa_criminal_database]
group by PROVINCE

--16. Display all cases recorded from 2020 onwards.

SELECT * FROM [south_africa_criminal_database]
WHERE CrimeDate >= ('2020-01-01') 
ORDER BY CrimeDate ASC

--17. Count how many cases resulted in a Convicted status.

SELECT COUNT(*) as No_of_convicted_cases
from [south_africa_criminal_database]
where CaseStatus = 'convicted'

--18. Retrieve all suspects with more than three previous offenses.

select * 
from [south_africa_criminal_database]
where PreviousOffenses > 3


--19. Show the distribution of cases by Risk Level.

select risklevel, count(risklevel) as number_of_cases_by_Risk_Level
from [south_africa_criminal_database]
group by RiskLevel 

--20. Calculate the total Estimated Fraud Amount across all cases.

select CrimeType,SUM (EstimatedFraudAmount_ZAR) as total_fraud_estimated_amount
from [south_africa_criminal_database]
group by CrimeType

--21. Identify the province with the highest number of cases.
--select * from [south_africa_criminal_database]

select top 1 province,COUNT(province) as no_of_cases
from [south_africa_criminal_database]
group by Province
order by COUNT(province) desc

--22. Retrieve the youngest suspect in the dataset.

select top 1 * 
from [south_africa_criminal_database]
order by age

--23. Retrieve the oldest suspect in the dataset.

select top 1 * 
from [south_africa_criminal_database]
order by age desc 

--24. Count the number of cases handled by each investigating officer.

SELECT investigatingofficer, COUNT(*) as number_of_cases
FROM [south_africa_criminal_database]
group by investigatingofficer


--25. Calculate the average Estimated Fraud Amount per crime type.

select crimetype, avg(EstimatedFraudAmount_ZAR) as average_estimated_fraud_amount
from [south_africa_criminal_database]
group by crimetype

--26. Display all cases occurring in Gauteng province.

select * from [south_africa_criminal_database]
where Province = 'gauteng'
 

--27. Retrieve all Fraud cases classified as High risk.

select *
from [south_africa_criminal_database]
where CrimeType = 'fraud' and RiskLevel = 'high'

--28. Count the number of cases per year based on CrimeDate

select year(CrimeDate) as year,COUNT(year(crimedate)) as number_of_cases
from [south_africa_criminal_database]
group by year(crimedate)


--29. Display all suspects with a Financial Score below 500.

select *
from [south_africa_criminal_database]
where FinancialScore < 500

--30. Identify the most common Crime Type in the dataset.

select top 1 crimetype, COUNT(crimetype) as number
from [south_africa_criminal_database]
group by crimetype
order by crimetype
