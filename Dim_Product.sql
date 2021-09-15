-- Cleansed DimProduct table --
SELECT 
	p.[ProductKey]
      ,p.[ProductAlternateKey] AS ProducItemCode
			--,[ProductSubcategoryKey]
			--,[WeightUnitMeasureCode]
			--,[SizeUnitMeasureCode]
      ,p.[EnglishProductName] AS EnglishProductName
	  ,ps.[EnglishProductSubCategoryName] AS SubCategory
	  ,pc.[EnglishProductCategoryName] AS [Product Category]
			--,[SpanishProductName]
			--,[FrenchProductName]
			--,[StandardCost]
			--,[FinishedGoodsFlag]
      ,p. [Color] AS [Product Color]
			--,[SafetyStockLevel]
			--,[ReorderPoint]
			--,[ListPrice]
      ,p.[Size] AS [Product Size]
			--,[SizeRange]
			--,[Weight]
			--,[DaysToManufacture]
      ,p.[ProductLine] AS [Product Line]
			--,[DealerPrice]
			--,[Class]
			--,[Style]
      ,p.[ModelName] AS [Product Model Name]
			--,[LargePhoto]
      ,p.[EnglishDescription] AS [Product Description]
			/*
			,[FrenchDescription]
			 ,[ChineseDescription]
			  ,[ArabicDescription]
			,[HebrewDescription]
			,[ThaiDescription]
			,[GermanDescription]
			,[JapaneseDescription]
			,[TurkishDescription]
			,[StartDate]
			,[EndDate]
		*/
	  ,ISNULL(p.[Status], 'Outdated') AS [Product Status]
  FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] as p
  LEFT JOIN DimProductSubcategory as ps
  ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  LEFT JOIN DimProductCategory as pc
  ON pc.ProductCategoryAlternateKey = ps.ProductCategoryKey 
  ORDER BY 
  p.ProductKey ASC