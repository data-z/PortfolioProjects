/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/


USE PortfolioProject;

Select *
From CovidDeaths
Where continent is not null 
order by 3,4



-- Select Data that we are going to be using.

Select Location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Where continent is not null
order by 1,2

-- Looking at Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contract covid in your country

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From CovidDeaths
Where location like '%states%' AND
continent is not null
order by 1,2

-- Looking at the Total Cases vs Population
-- Shows what percentage of population has gotten covid.

Select Location, date,population, total_cases, (total_cases/population)*100 as PercentofPopulationInfected
From CovidDeaths
--Where location like '%states%' AND
order by 1,2


-- Looking at countries with highest infection rate compared to population

Select Location,population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentofPopulationInfected
From CovidDeaths
Where continent is not null
Group by location, population
order by PercentofPopulationInfected Desc


-- Showing the Countries with the Highest Death Count per Population

Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From CovidDeaths
Where continent is not null
Group by location
order by TotalDeathCount Desc

-- LET'S BREAK THINGS DOWN BY CONTINENT

-- Showing continent with the highest death count per population


Select location, MAX(Convert(int,total_deaths)) as TotalDeathCount
From CovidDeaths
Where continent is null
Group by location
order by TotalDeathCount Desc


-- GLOBAL NUMBERS


Select SUM(new_cases)as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths,SUM(cast(new_deaths as int))/ SUM(new_cases)*100 as DeathPercentage
From CovidDeaths
--Where location like '%states%'
where continent is not null
--Group by date
order by 1,2



-- Looking at Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location AND
	dea.date = vac.date
where dea.continent is not null
order by 2,3
	

-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location AND
	dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/population)*100
From PopvsVac


-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)


Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location AND
	dea.date = vac.date
where dea.continent is not null
--order by 2,3


Select *, (RollingPeopleVaccinated/population)*100
From #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

DROP View if exists PercentPopulationVaccinated

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location AND
	dea.date = vac.date
where dea.continent is not null
--order by 2,3


Select *
From PercentPopulationVaccinated