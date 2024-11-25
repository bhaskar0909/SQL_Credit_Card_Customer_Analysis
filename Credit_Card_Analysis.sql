--- Credit Card Customers Analysis Project ---

SELECT *  FROM Credit_card
--1. Total Records in Table
  SELECT COUNT(*) AS Count_rows 
  FROM Credit_card

--2. Total Columns in the table
  SELECT COUNT(*) AS Columns_count 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Credit_card'

--3. Attrition Flag Count
  SELECT Attrition_Flag, COUNT(*) AS CNT 
  FROM  Credit_card
  GROUP BY Attrition_Flag

--4. Percentage of Attrition_Flag in Credit card table
  SELECT 
	Attrition_Flag,
  COUNT(*) AS Count,
  COUNT(*) * 100.0 /SUM(COUNT(*)) OVER () AS Percentage
  FROM Credit_card
  GROUP BY Attrition_Flag

--5. Gender rate 
  SELECT Attrition_flag,
	     Gender,
  COUNT(*) AS Count,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Gender) AS Percentage
  FROM Credit_card
  GROUP BY Attrition_Flag,Gender

-- 6.Education_level
 
  SELECT Attrition_flag,
	     Marital_Status,
  COUNT(*) AS Count,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Marital_Status) AS Percentage
  FROM Credit_card
  GROUP BY Attrition_Flag,Marital_Status

-- 7. Card_Category Percentage by Attrition rate
  SELECT Attrition_flag,
	    Card_Category,
  COUNT(*) AS Count,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Card_Category) AS Percentage
  FROM Credit_card
  GROUP BY Attrition_Flag,Card_Category

----- . Customer Demographics -----
-- 8. Maximum Customerr Age
  SELECT MAX(Customer_Age) AS Max_Customer_Age
  FROM Credit_card
--    Min Customer Age
  SELECT MIN(Customer_Age) AS Min_Customer_Age
  FROM Credit_card

-- 9. Calculate Gender Distribution
  SELECT * FROM Credit_card
  SELECT Gender,
  COUNT(*) AS COUNT,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS Percentage
  FROM Credit_card
  GROUP BY Gender;

---- . Credit Card Usage and Spending Patterns 
--- -- Calculate average credit limit
 -- MAX CREDIT LIMIT 
  SELECT Credit_Limit,
  COUNT(*) AS COUNT
  FROM Credit_card
  GROUP BY Credit_Limit
  ORDER BY COUNT DESC

  SELECT Credit_Limit,
  COUNT(*) AS COUNT
  FROM Credit_card
  GROUP BY Credit_Limit
  ORDER BY COUNT ASC

-----Top Card Categories
-- Find top card categories
----- DESC ORDER ---------
  SELECT Card_Category,
  COUNT(*) AS COUNT
  FROM Credit_card
  GROUP BY Card_Category
  ORDER BY COUNT DESC
----- ASC ORDER
  SELECT Card_Category,
  COUNT(*) AS COUNT
  FROM Credit_card
 GROUP BY Card_Category
  ORDER BY COUNT ASC

-- Calculate Max and Min Months inactive 
   SELECT MAX(Months_Inactive_12_mon) AS Max_Months_Inactive
   FROM credit_card

   SELECT MIN(Months_Inactive_12_mon) AS min_Months_Inactive
   FROM credit_card

-- Calculate Max total transaction amount
  SELECT MAX(Total_Trans_Amt) AS MAX_Total_Trans_Amt
  FROM credit_card
 