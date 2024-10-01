The World Life Expectancy Project focuses on cleaning and analyzing a dataset that contains life expectancy data across various countries over several years. Below is a summary of the key steps involved in this project:

**1. Data Cleaning**
Duplicate Handling:

Identified and removed duplicate entries based on a combination of Country and Year.
Utilized SQL queries to check for duplicates and deleted records with matching Country and Year values that appeared more than once, ensuring a clean dataset.
Handling Null Values:

Checked for missing or incomplete data, particularly in the Status (Developing/Developed) and Life Expectancy columns.
Updated missing Status values by referencing countries with known Developed or Developing statuses. This was done through self-joins and pattern matching.
For rows with missing Life Expectancy, a method was used to estimate values based on the average life expectancy of adjacent years (Year - 1 and Year + 1) for the same country.


**2. Exploratory Data Analysis (EDA)**
Life Expectancy Trends:

Analyzed changes in life expectancy over time for different countries. By calculating the minimum and maximum life expectancy for each country, the increase in life expectancy over a 15-year period was determined and ordered from least to greatest.
Global Average Life Expectancy:

Calculated the global average life expectancy for each year, observing trends and shifts in life expectancy over time, while excluding zero values.
Correlation Between GDP and Life Expectancy:

Explored the relationship between a country’s GDP and its life expectancy, grouping countries by average life expectancy and GDP.
Performed analyses that sorted countries by high and low GDP and compared the average life expectancy in these two groups.
Calculated average life expectancy for countries with GDP greater than and less than 1500, revealing the disparity between economic status and life expectancy.
Correlation Between Country Status and Life Expectancy:

Grouped countries by their Status (Developed or Developing) and computed the average life expectancy for each group.
Compared life expectancy and the number of distinct countries under each status, providing insight into how economic development influences longevity.
Correlation Between BMI and Life Expectancy:

Investigated the relationship between the average Body Mass Index (BMI) of countries and their life expectancy.
Sorted countries by BMI, analyzing how higher or lower BMI averages correspond to life expectancy outcomes.


**3. Rolling Totals and Mortality Analysis**
Rolling Total of Adult Mortality:
Analyzed adult mortality trends over time by calculating the cumulative sum of adult mortality rates for countries such as the United States.
Provided a rolling total of adult mortality, which offers insight into how mortality rates have evolved over the years within specific regions.
This project highlights the importance of data cleaning and exploration to uncover meaningful insights regarding life expectancy trends and their correlation with various factors like GDP, BMI, and a country’s developmental status.
