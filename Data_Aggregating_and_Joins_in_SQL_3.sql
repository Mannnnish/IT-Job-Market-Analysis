use job_analysis;

Select * from main;
select * from main_data_analytics_science_data;

-- Total count of job openings
select count(*) from main;

-- Total count of job openings since 2024
Select *, count(*) over() as Count from main where year(Post_Date) >= "2024";

-- Total no. of job openings for data analyst since 2023
Select count(*) from (
	Select Job_Role from main where year(Post_Date) >= "2023"
    union all
    Select Job_Role from main_data_analytics_science_data where year(Post_Date) >= "2023"
)combined ;

-- Average Salary of Data Analyst since 2021
With Combined as (
	Select Company, Location, Post_Date, Job_Role, Salary from main
    union all
	Select Company, Location, Post_Date, Job_Role, null as Salary from main
)
Select avg(Salary) from combined;
-- Total no. of Data Analyst job openings of Data analyst in Bangalore since 2023
Select count(*) from combined where Job_Role = "Data Analyst" and year(Post_Date) >=2023;



Create Table Tools_and_Languages (Tools_Languages varchar(100), Job_Count int, Avg_Sal float);
-- Most in-demand skills 

Insert into Tools_and_Languages
With Combined as (
	Select Skills, null as Salary from main_data_analytics_science_data
    union all
    Select Skills, Salary from main
) 
Select 'Python' as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%python%"
union all
Select 'C++' as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%c++%"
union all
Select 'Java' as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%java%"
union all
Select 'SQL' as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%sql%"
union all
Select "Tableau" as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%tableau%"
union all
Select "PowerBI" as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%powerbi%" or lower(Skills) like "power bi"
union all
Select "Excel" as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%excel%"
union all
Select "AWS" as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%aws%"
union all
Select "Javascript" as Skills,count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%javascript%"
union all
Select "MongoDB" as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%mongo db%" or lower(Skills) like "%mongodb%"
union all
Select "Wordpress" as Skills, count(*) as count_, round(avg(Salary),2) as Avg_Sal from combined where lower(Skills) like "%wordpress%" order by count_ desc;

Select * from tools_and_languages;
select * from main_data_analytics_science_data order by Job_Role;
select Job_Role, Count(*) from main_data_analytics_science_data group by Job_Role having Job_Role = "Data Analyst" or Job_Role = "Data Scientist" or Job_Role = "AI Engineer";
select Job_Role, Count(*) from main group by Job_Role having Job_Role = "Data Analyst" or Job_Role = "Data Scientist" or Job_Role = "AI Engineer";

-- Update main
-- set Job_Role = "AI Engineer"
-- where Job_Role = "AI_Engineer";

-- Most in demand job roles with avg salaries 
select Job_Role, Count(*) as count_, round(avg(Salary),2) as avg_sal from main group by Job_Role order by count_ desc;

-- Demand upon time 
Select Year(Post_Date) as Year_, count(*), avg(Salary) from main group by Year_;

-- Exporting via export tool in result grid
select * from main limit 52000;
select * from tools_and_languages;

