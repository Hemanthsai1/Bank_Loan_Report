select *from Bank_loan;

select count(id) as Total_Loan_Applications from Bank_loan;

select count(id) as MTD_Total_Loan_Applications from Bank_loan
where month(issue_date) = 12 and YEAR(issue_date) = 2021;

select count(id) as PMTD_Total_Loan_Applications from Bank_loan
where month(issue_date) = 11 and YEAR(issue_date) = 2021;

select sum(loan_amount) as Total_funded_Amount from Bank_loan
where MONTH(issue_date) = 12 and year(issue_date) = 2021;

select sum(loan_amount) as Total_funded_Amount from Bank_loan
where MONTH(issue_date) = 11 and year(issue_date) = 2021;

---------------------------------------------------------------------------

select sum(total_payment) as Total_Amount_Received from Bank_loan
where month(issue_date) = 12 and year(issue_date)=2021;

select sum(total_payment) as MTD_Total_Amount_Received from Bank_loan
where month(issue_date) = 12 and year(issue_date)=2021;

select sum(total_payment) as PMTD_Total_Amount_Received from Bank_loan
where month(issue_date) = 11 and year(issue_date)=2021;

select round(avg(int_rate),4)*100 as MTD_Avg_Interest from Bank_loan
where month(issue_date) = 12 and year(issue_date)=2021;

select round(avg(int_rate),4)*100 as PMTD_Avg_Interest from Bank_loan
where month(issue_date) = 11 and year(issue_date)=2021;

----------------------------------------------------------------------

select AVG(dti)*100 as PMDT_Avg_DTI from Bank_loan
where month(issue_date)=11 and year(issue_date) = 2021;

select loan_status from Bank_loan;

select 
	(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)
	/
	count(id) as Good_loan_percentage from Bank_loan;

select count(id) as Good_Loan_Applications from Bank_loan
where loan_status = 'Fully Paid' or loan_status='Current';

select sum(loan_amount) as Good_Loan_Funded_Amount from Bank_loan
where loan_status = 'Fully Paid' or loan_status='Current';

select sum(total_payment) as Good_oan_Received_Amount from Bank_loan
where loan_status = 'Fully Paid' or loan_status='Current';
---------------------------------------------------------------------------------------
select 
	(count(case when loan_status = 'Charged off' then id end)*100.0)
	/
	count(id) as Bad_loan_percentage from Bank_loan;

select count(id) as Bad_Loan_Applications from Bank_loan
where loan_status = 'Charged off';

select sum(loan_amount) as Bad_Loan_Funded_Amount from Bank_loan
where loan_status = 'Charged off';

select sum(total_payment) as Bad_oan_Received_Amount from Bank_loan
where loan_status = 'Charged off';
-------------------------------------------------------------------------------
SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        Bank_loan
    GROUP BY
        loan_status

-----------------------------------------

SELECT
        loan_status,
        SUM(total_payment) AS MTD_Total_Amount_Received,
        SUM(loan_amount) AS MTD_Total_Funded_Amount
    FROM
		 Bank_loan
	where month(issue_date) =12
    GROUP BY
        loan_status

-----------------------------------------------------------------------------------------------------

SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

----------------------------------------------------------------------------
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan
GROUP BY address_state
ORDER BY count(id) desc

------------------------------------------------------------------------------------------
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan
GROUP BY term
ORDER BY term

---------------------------------------------------------------------------------------------
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan
GROUP BY emp_length
ORDER BY emp_length

------------------------------------------------------------------------------------------------

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan
GROUP BY purpose
ORDER BY purpose
----------------------------------------------------------------
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan
GROUP BY home_ownership
ORDER BY home_ownership
----------------------------------------------------------------------------

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose



