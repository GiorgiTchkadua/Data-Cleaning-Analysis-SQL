-- find out dublicates

select*
from layoffs_stagging;

with dublicate_cte as
(select *, row_number() over( partition by company, location, industry, total_laid_off, percentage_laid_off, 'data') as row_num
from layoffs_stagging)
select*
from dublicate_cte
where row_num >1;

select*
from layoffs_stagging
where company ='oyster';

-- delete

CREATE TABLE `layoffs_stagging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from layoffs_stagging2
where row_num >1;

insert into layoffs_stagging2
(select *, row_number() over( partition by company, location, industry, total_laid_off, percentage_laid_off, 'data') as row_num
from layoffs_stagging);

delete
from layoffs_stagging2
where row_num >1
limit 1000;


-- data alayze

select*
from layoffs_stagging2;


select company, trim(company)
from layoffs_stagging2;

update layoffs_stagging2
set company = trim(company);

-- standartize data

select  *
from layoffs_stagging2
where industry like'Crypto%';

update layoffs_stagging2
set industry = 'Crypto'
where industry  like 'crypto%';

select distinct country, trim(trailing '.' from country)
from layoffs_stagging2 
order by 1;

update layoffs_stagging2
set country = trim(trailing '.' from country)
where country like 'united states%';



select  *
from layoffs_stagging2;

select `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
from layoffs_stagging2;

update layoffs_stagging2
set `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

alter table layoffs_stagging2
modify column `date` DATE;

-- null and blanks

select*
from layoffs_stagging2
where industry is null
or industry = ' ';

select *
from layoffs_stagging2
where total_laid_off is null 
and percentage_laid_off is null;

update layoffs_stagging2
set industry = null
where industry = ' ';

select*
from layoffs_stagging3;

select t1.industry, t2.industry
from layoffs_stagging2 t1
join layoffs_stagging2 t2
	on t1.company=t2.company
where (t1.industry is null or t1.industry = ' ')
and t2.industry is not null;

update layoffs_stagging2 t1
join layoffs_stagging2 t2
	on t1.company=t2.company
set t1.industry = t2.industry
where (t1.industry is null or t1.industry = ' ')
and t2.industry is not null;


select *
from layoffs_stagging2
where total_laid_off is null 
and percentage_laid_off is null;

-- washlaa indos monaaacemebi

delete
from layoffs_stagging2
where total_laid_off is null 
and percentage_laid_off is null;


select *
from layoffs_stagging2;

-- columnis washla

alter table layoffs_stagging2
drop column row_num;











