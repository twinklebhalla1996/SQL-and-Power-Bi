-- Cleansed DimCustomer table --
SELECT 
	c.CustomerKey AS CustomerKey
			--,[GeographyKey]
			--,[CustomerAlternateKey]
			--,[Title]
      ,c.FirstName AS [First Name]
			-- ,[MiddleName]
      ,c.[LastName] AS [Last Name]
      ,c.FirstName + ' ' + LastName AS FullName
			--,[NameStyle]
			--,[BirthDate]
			--,[MaritalStatus]
			--,[Suffix]
      , CASE c.Gender WHEN 'M' then 'Male' WHEN 'F' THEN 'Female' END AS Gender
			/*
			,[EmailAddress]
			 ,[YearlyIncome]
			,[TotalChildren]
			,[NumberChildrenAtHome]
			,[EnglishEducation]
			,[SpanishEducation]
			,[FrenchEducation]
			,[EnglishOccupation]
			,[SpanishOccupation]
			,[FrenchOccupation]
			,[HouseOwnerFlag]
			,[NumberCarsOwned]
			,[AddressLine1]
			,[AddressLine2]
			,[Phone]
			*/  
	  ,c.[DateFirstPurchase] AS DateFirstPurchase
			--,[CommuteDistance]
	  ,g.city as [Customer City]	-- joined Customer City from Geography table
  FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] as c
  LEFT JOIN DimGeography AS g
  ON c.GeographyKey = g.GeographyKey
  ORDER BY 
  CustomerKey ASC	-- Ordered list by CustomerKey
