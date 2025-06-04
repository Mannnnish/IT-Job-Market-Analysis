-- create database job_analysis;
use job_analysis;

CREATE TABLE Tech_Jobs_Market (
    Job_Title VARCHAR(300) ,
    Location2 VARCHAR(50),
    Salary INT,
    Locality VARCHAR(100),
    Location VARCHAR(100),
    State VARCHAR(100),
    Job_Role VARCHAR(100)
);

CREATE TABLE indeed_30K_Tech_jobs_data_2 (
    Job_Title VARCHAR(100),
    Category VARCHAR(50),
    Location VARCHAR(50),
    Post_Date varchar(50),
    Skills VARCHAR(300),
    Job_Role VARCHAR(100)
);

select * from indeed_30K_Tech_jobs_data_2;
drop table indeed_30K_Tech_jobs_data_2;

select count(*) from indeed_30k_tech_jobs_data_2;
select count(*) from india_job_market_dataset_last_1_year;
select count(*) from tech_job_market_2;
select count(*) from tech_jobs_market;

create table Top_IT_Jobs (
	Job_Title Text,
    Company Text,
    Location varchar(100),
    Experience varchar(50),
    Salary float,
    Job_Description Text,
    Skills Text,
    Job_Role varchar(100)
);

create table main_data_analytics_science_data(
	Job_Title text,
    Company text,
    Location varchar(100),
    Skills text,
    Post_date date,
    Job_role varchar(100)
);

Update main_data_analytics_science_data 
set Skills = null
where Skills = "";


UPDATE indeed_30k_tech_jobs_data_2
SET Post_Date = STR_TO_DATE(Post_Date, '%m/%d/%Y')
WHERE Post_Date IS NOT NULL;

Alter table indeed_30k_tech_jobs_data_2
modify Post_Date date;
select * from indeed_30k_tech_jobs_data_2;


Select Location, avg(Salary) as avg_sal from india_job_market_dataset_last_1_year group by Location order by avg_sal desc;
Select Location, round(avg(Salary),2) as avg_sal from tech_job_market_2 group by Location order by avg_sal desc;

select Location, round(avg(Salary),2) as avg_sal from 
(
select Location, Salary from india_job_market_dataset_last_1_year
union all
select Location, Salary from tech_job_market_2
) as combined
group by Location
order by avg_sal desc;



create table Main (
	Job_Role Text,
    Company Text,
	Salary float,
	Post_Date Date,
    Location Text,
    Job_Title Text,
    Skills Text,
    Experience Text,
    File_Name text
);

Insert into Main (Job_Role, Company, Salary, Post_Date, Location, Job_Title, Skills, Experience, File_Name)
Select Job_Role, null as Company, null as Salary, Post_Date, Location, Job_Title, null as Skills, null as Experience, 'indeed_30k_tech_jobs_data_2' as File_Name from indeed_30k_tech_jobs_data_2
union all
Select Job_Role, Company, Salary, Post_Date, Location, null as Job_Title, Skills, Experience, 'india_job_market_dataset_last_1_year' as File_Name from india_job_market_dataset_last_1_year
union all 
Select Job_Role, Company, Salary, null as Post_Date, Location, Job_Title, null as Skills, null as Experience, 'tech_job_market_2' as File_Name from tech_job_market_2
union all
Select Job_Role, null as Company, Salary, null as Post_Date, Location, Job_Title, null as Skills, null as Experience, 'tech_jobs_market' as File_Name from tech_jobs_market
union all
Select Job_Role, Company, Salary, null as Post_Date, Location, Job_Title, Skills, Experience, 'top_it_jobs' as File_Name from top_it_jobs;

-- select * from main where company is not null;
-- select count(*) from main;
drop table Main;

select Location, round(avg(Salary),2) as avg_sal from main group by Location order by avg_sal desc;

select * from main where Location = 'Alwal';
select * from indeed_30k_tech_jobs_data_2 where Location = 'Alwal';
select * from main where Salary is not null and File_Name = "top_it_jobs" order by Salary;
select count(*) from main where Experience is null;






