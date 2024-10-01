# World Life Expectency Project (Exploratory Data Analysis)

Select *
FROM World_Life_Expectancy.world_life_expectancy
;


Select Country, 
Min(`Life expectancy`), 
MAX(`Life expectancy`), 
ROUND(MAX(`Life expectancy`) - Min(`Life expectancy`), 1) AS Life_Increase_15_Years
FROM World_Life_Expectancy.world_life_expectancy
Group By Country
HAVING Min(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0		
Order By Life_Increase_15_Years ASC
;



Select Year, Round(Avg(`Life expectancy`),2)
FROM World_Life_Expectancy.world_life_expectancy
WHERE `Life expectancy` <> 0
AND `Life expectancy` <> 0
Group By Year	
Order By Year
;

--- Correlation between a countries GDP and life expectancy 

Select Country, Round(Avg(`Life expectancy`),1) AS Life_Exp, Round(AVG(GDP),1) AS GDP
FROM World_Life_Expectancy.world_life_expectancy
Group By Country
Having Life_Exp > 0
AND GDP > 0
Order BY GDP ASC
;


Select Country, Round(Avg(`Life expectancy`),1) AS Life_Exp, Round(AVG(GDP),1) AS GDP
FROM World_Life_Expectancy.world_life_expectancy
Group By Country
Having Life_Exp > 0
AND GDP > 0
Order BY GDP DESC
;

Select 
Sum(Case When GDP >= 1500 Then 1 Else 0 End) High_GDP_Count, 
AVG(Case When GDP >= 1500 Then `Life expectancy` Else NULL End) High_GDP_Life_Expectancy,
Sum(Case When GDP <= 1500 Then 1 Else 0 End) Low_GDP_Count, 
AVG(Case When GDP <= 1500 Then `Life expectancy` Else NULL End) Low_GDP_Life_Expectancy
FROM World_Life_Expectancy.world_life_expectancy
;


---- Correlation between a countries status and life expectency

Select Status, ROUND(AVG(`Life expectancy`),1)
FROM World_Life_Expectancy.world_life_expectancy
Group BY Status
;


SELECT 
    Status,
    COUNT(DISTINCT Country),
    ROUND(AVG(`Life expectancy`), 1)
FROM
    World_Life_Expectancy.world_life_expectancy
GROUP BY Status
;


---- Correlation between a countries BMI and life expectency

Select Country, Round(Avg(`Life expectancy`),1) AS Life_Exp, Round(AVG(BMI),1) AS BMI
FROM World_Life_Expectancy.world_life_expectancy
Group By Country
Having Life_Exp > 0
AND BMI > 0
Order BY BMI DESC
;

Select Country, Round(Avg(`Life expectancy`),1) AS Life_Exp, Round(AVG(BMI),1) AS BMI
FROM World_Life_Expectancy.world_life_expectancy
Group By Country
Having Life_Exp > 0
AND BMI > 0
Order BY BMI ASC
;


--- Rolling total

Select Country, 
Year, 
`Life expectancy`, 
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM World_Life_Expectancy.world_life_expectancy
Where Country LIKE '%United%'
;
