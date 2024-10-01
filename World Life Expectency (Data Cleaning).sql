# World Life Expectency Project (Data Cleaning)

SELECT * 
FROM World_Life_Expectancy.world_life_expectancy
;


---- Identifying Duplicates & Dublicate ROW_IDs
SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year))
FROM World_Life_Expectancy.world_life_expectancy
Group BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1
;

SELECT *
FROM(
SELECT ROW_ID, 
	CONCAT(Country, Year),
Row_Number() OVER(Partition BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS ROW_NUM
FROM World_Life_Expectancy.world_life_expectancy
) AS ROW_TABLE
WHERE ROW_NUM >1
;

DELETE FROM World_Life_Expectancy.world_life_expectancy
WHERE
	ROW_ID IN (
   SELECT ROW_ID
FROM(
SELECT ROW_ID, 
	CONCAT(Country, Year),
	Row_Number() OVER(Partition BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS ROW_NUM
	FROM World_Life_Expectancy.world_life_expectancy
	) AS ROW_TABLE
WHERE ROW_NUM >1
)
;

---- Identifying/Correcting Null Values
SELECT * 
FROM World_Life_Expectancy.world_life_expectancy;

SELECT * 
FROM World_Life_Expectancy.world_life_expectancy
Where STATUS = ''
;

SELECT Distinct(Status) 
FROM World_Life_Expectancy.world_life_expectancy
Where STATUS <> ''
;


SELECT Distinct(Country) 
FROM World_Life_Expectancy.world_life_expectancy
Where STATUS = 'Developing'
;

UPDATE World_Life_Expectancy.world_life_expectancy t1
Join World_Life_Expectancy.world_life_expectancy t2
	on t1.Country = t2.Country
Set t1.Status = 'Developing'
Where t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developing'
;

UPDATE World_Life_Expectancy.world_life_expectancy t1
Join World_Life_Expectancy.world_life_expectancy t2
	on t1.Country = t2.Country
Set t1.Status = 'Developed'
Where t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developed'
;


SELECT * 
FROM World_Life_Expectancy.world_life_expectancy
Where STATUS = ''
;

SELECT Country, Year, `Life Expectancy`
FROM World_Life_Expectancy.world_life_expectancy
#Where `Life Expectancy` = ''
;


SELECT t1.Country, t1.Year, t1.`Life Expectancy`, 
t2.Country, t2.Year, t2.`Life Expectancy`,
t3.Country, t3.Year, t3.`Life Expectancy`,
Round((t2.`Life Expectancy` + t3.`Life Expectancy`)/2,1)
FROM World_Life_Expectancy.world_life_expectancy t1
Join World_Life_Expectancy.world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year -1
Join World_Life_Expectancy.world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year +1
 Where t1. `Life Expectancy` = ''   
;


Update World_Life_Expectancy.world_life_expectancy t1
Join World_Life_Expectancy.world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year -1
Join World_Life_Expectancy.world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year +1
SET t1.`Life Expectancy` = Round((t2.`Life Expectancy` + t3.`Life Expectancy`)/2,1)
Where t1.`Life Expectancy` = ''
;

SELECT *
FROM World_Life_Expectancy.world_life_expectancy
;
