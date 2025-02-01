select *
from layoffs_stagging2;

select max(total_laid_off)
from layoffs_stagging2;

select *
from layoffs_stagging2
where percentage_laid_off=1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from layoffs_stagging2
group by company
order by 2 desc;

select min(`date`) , max(`date`)
from layoffs_stagging2;

select industry, sum(total_laid_off)
from layoffs_stagging2
group by industry
order by 2 desc;


select country, sum(total_laid_off)
from layoffs_stagging2
group by country
order by 2 desc;

-- Identify outliers (e.g., total_laid_off > 3 standard deviations)
SELECT company, total_laid_off
FROM layoffs_stagging2
WHERE total_laid_off > (SELECT AVG(total_laid_off) + 3 * STDDEV(total_laid_off) FROM layoffs_stagging2);

UPDATE layoffs_stagging2
SET percentage_laid_off = REPLACE(percentage_laid_off, '%', '') * 0.01
WHERE percentage_laid_off IS NOT NULL;

select `date`, sum(total_laid_off)
from layoffs_stagging2
group by `date`
order by 2 desc;

select year(`date`), sum(total_laid_off)
from layoffs_stagging2
group by year(`date`)
order by 2 desc;

-- Number of layoffs per month/year
SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(total_laid_off) AS total_laid_off
FROM layoffs_stagging2
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;

-- Check correlation between total layoffs and funds raised
SELECT funds_raised_millions, SUM(total_laid_off) AS total_laid_off
FROM layoffs_stagging2
GROUP BY funds_raised_millions
ORDER BY funds_raised_millions;

-- Top 5 countries with the most layoffs
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_stagging2
GROUP BY country
ORDER BY total_laid_off DESC
LIMIT 5;

select substring(`date`,1,7) as MONTH, sum(total_laid_off)
from layoffs_stagging2
group by MONTH
order by 2 desc;


with rolling_total as
(
select substring(`date`,1,7) as MONTH, sum(total_laid_off) as total_off
from layoffs_stagging2
group by MONTH
order by 1 asc
)
select `month`, total_off, 
sum(total_off) over(order by `month`) as rolling_total
from rolling_total;
-- g

select company, year(`date`), sum(total_laid_off)
from layoffs_stagging2
group by  company, year(`date`)
order by 3 desc;

with company_year (company,years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_stagging2
group by  company, year(`date`)
),
company_year_rank as
(select *,
dense_rank() over (partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select* 
from company_year_rank
where ranking <=5
;

-- Number of layoffs per quarter
SELECT CONCAT(YEAR(date), '-Q', QUARTER(date)) AS quarter, SUM(total_laid_off) AS total_laid_off
FROM layoffs_stagging2
GROUP BY quarter
ORDER BY quarter;

WITH year_comparison AS (
    SELECT YEAR(date) AS year, SUM(total_laid_off) AS total_laid_off
    FROM layoffs_stagging2
    GROUP BY YEAR(date)
)
SELECT a.year, a.total_laid_off, 
       (a.total_laid_off - b.total_laid_off) / b.total_laid_off * 100 AS year_over_year_change
FROM year_comparison a
LEFT JOIN year_comparison b ON a.year = b.year + 1
ORDER BY a.year;









