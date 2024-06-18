SELECT
  date,
  location,
  total_cases,
  new_cases,
  total_deaths,
  population
FROM
  CovidDeath;
-- Gathering information
SELECT
  date,
  location,
  total_cases,
  total_deaths,
  (total_deaths / total_cases) * 100 as DeathPercentage
FROM
  CovidDeath
WHERE
  location LIKE '%states%';
-- Looking at total cases vs total deaths 
-- Percentage of cases to deaths in the US
SELECT
  location,
  MAX(total_cases) AS HighestInfectionCount,
  population,
  MAX((total_cases / population)) * 100 AS PercentInfected
FROM
  CovidDeath
GROUP BY
  location,
  population
ORDER BY
  PercentInfected DESC;
-- Percentage of population infected from highest to least infected
SELECT
  location,
  MAX(total_deaths) AS Totaldeathcount,
  population
FROM
  CovidDeath
WHERE
  continent IS NOT null
GROUP BY
  location,
  population
ORDER BY
  totaldeathcount DESC -- Countries with highest death count per population
  -- Limited information to exclude data by continent
SELECT
  continent,
  MAX(total_deaths) AS Totaldeathcount
FROM
  CovidDeath
WHERE
  continent IS NOT null
GROUP BY
  continent
ORDER BY
  totaldeathcount DESC -- Pulled deaths by continent from highest to lowest
SELECT
  SUM(new_cases) AS total_cases,
  SUM(new_deaths) AS total_deaths,
  SUM(new_deaths) / SUM(new_cases) * 100 AS deathpercentage
FROM
  CovidDeath
WHERE
  continent is not null;
-- Global numbers
SELECT
  CovidDeath.continent,
  CovidDeath.location,
  CovidDeath.date,
  CovidDeath.population,
  Covidvaccinations.new_vaccinations,
  SUM(Covidvaccinations.new_vaccinations) OVER (
    PARTITION BY CovidDeath.location
    ORDER BY
      CovidDeath.location,
      CovidDeath.date
  ) AS rolling_vaccinations
FROM
  CovidDeath
  JOIN Covidvaccinations ON CovidDeath.location = Covidvaccinations.location
  AND CovidDeath.date = Covidvaccinations.date
WHERE
  coviddeath.continent IS NOT null
ORDER BY
  2,
  3;
-- New vaccinations by region with Rolling vaccinations of countries