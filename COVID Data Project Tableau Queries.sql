/*
COVID 19 Data Exploration Project Tableau Queries 
*/

-- Table 1.

SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS death_percentage
FROM [Portfolio Project]..CovidDeaths
--WHERE location LIKE 'United States'
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1,2;


-- Table 2. 

SELECT location, SUM(CAST(new_deaths AS INT)) AS total_death_count
FROM [Portfolio Project]..CovidDeaths
--WHERE location LIKE 'United States'
WHERE continent IS NULL 
    AND location NOT IN ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location
ORDER BY total_death_count DESC;


-- Table 3.

SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS percent_population_infected
FROM [Portfolio Project]..CovidDeaths
-- WHERE location LIKE 'United States'
GROUP BY location, population
ORDER BY percent_population_infected DESC;


-- Table 4.

SELECT location, population, date, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS percent_population_infected
FROM [Portfolio Project]..CovidDeaths
-- WHERE location LIKE 'United States'
GROUP BY location, population, date 
ORDER BY percent_population_infected DESC;

