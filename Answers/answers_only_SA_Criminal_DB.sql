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

select * from [south_africa_criminal_database]

--2. Count the total number of cases in the table.

select count (*) as total_number_of_cases from [south_africa_criminal_database]

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
--Option 1

SELECT 'Convicted cases' CaseGroup, COUNT(*) as conviction_number
FROM [south_africa_criminal_database]
WHERE CaseStatus = 'Convicted'
UNION ALL
SELECT 'Non Convicted cases' CaseGroup, COUNT(*) as conviction_number
FROM [south_africa_criminal_database]
WHERE CaseStatus <> 'Convicted'

--Option 2

SELECT CASE 
            WHEN CaseStatus = 'Convicted' THEN 'Convicted Cases' 
                ELSE 'Non Convinted' 
        END AS  CaseGroup, COUNT(*)
FROM [south_africa_criminal_database]
GROUP BY CASE 
            WHEN CaseStatus = 'Convicted' THEN 'Convicted Cases' 
                ELSE 'Non Convinted' 
        END 


--12. Count the number of cases associated with each bank.

select BankInvolved, count(*) as number_of_cases 
from [south_africa_criminal_database]
group by BankInvolved

--13. Calculate the total Estimated Fraud Amount per province.
select * from [south_africa_criminal_database]

select estimated_fraud_amount_ZAR,SUM


--14. Retrieve all suspects older than 50 years.

--15. Calculate the average age of suspects per province.

--16. Display all cases recorded from 2020 onwards.

--17. Count how many cases resulted in a Convicted status.

--18. Retrieve all suspects with more than three previous offenses.

--19. Show the distribution of cases by Risk Level.

--20. Calculate the total Estimated Fraud Amount across all cases.

--21. Identify the province with the highest number of cases.

--22. Retrieve the youngest suspect in the dataset.

--23. Retrieve the oldest suspect in the dataset.

--24. Count the number of cases handled by each investigating officer.

--25. Calculate the average Estimated Fraud Amount per crime type.

--26. Display all cases occurring in Gauteng province.

--27. Retrieve all Fraud cases classified as High risk.

--28. Count the number of cases per year based on CrimeDate.

--29. Display all suspects with a Financial Score below 500.

--30. Identify the most common Crime Type in the dataset.