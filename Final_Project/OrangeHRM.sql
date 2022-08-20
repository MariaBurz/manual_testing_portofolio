/* The difference between DDL, DML si DQL
DDL (Data Definition Language) - define the database - create databases, tables or modify the structure of a table, add columns;
DML (Data Manipulation Language) - manipulate the database - manage the information from the database with the INSERT, UPDATE, DELETE functions;
DQL (Data Query Language) - query the database - extract information from the database - includes a subset of instructions.
*/

-- creating the orangeHRM database and the "users", "job" and "grade" tables
create database orangeHRM;  
CREATE TABLE users (
    username VARCHAR(25) NOT NULL,
    userRole VARCHAR(25) NOT NULL,
    employeeName varchar (50) not null,
    status varchar (25) not null
    );
    
-- creating primary key 
-- ALTER modify the structure of a table by adding the userid column as a primary key with auto-increment and integer (numeric) properties
alter table users add column userid int primary key auto_increment; 
-- We modify the "userid" column by placing it first in the table, assigning it the integer property again, otherwise it would be lost
alter table users modify column userid int auto_increment first; 

select * from users; -- extracting information from the "users" table
desc users; -- downloading the properties of the "users" table

/* We execute the INSERT function in the "jobtitle" table and fill in the related "username", "userRole", "employeeName" and "status" fields, 
inserting multiple data */
insert into users (username, userRole, employeeName, status)
values ('popioana', 'Admin', 'Pop Ioana', 'enabled'), ('popescuion', 'ESS', 'Popescu Ion', 'enabled'), ('popicaioan', 'ESS', 'Popica Ioan', 'enabled'),
('popailie', 'ESS', 'Popa Ilie', 'enabled'), ('ionescupaul', 'ESS', 'Ionescu Paul', 'enabled'), ('iovanovicipetra', 'ESS', 'Iovanovici Paula', 'enabled'),
('androneirina', 'ESS', 'Androne Irina', 'enabled'), ('andronescuirimie', 'ESS', 'Andronescu Irimie', 'disabled'), ('andrasiulia', 'ESS', 'Andras Iulia', 'disabled'),
('anduiulian', 'ESS', 'Andu Iulian', 'disabled');
    
 CREATE TABLE job (
    jobTitle VARCHAR(25) NOT NULL,
    jobDescription VARCHAR(50) NULL,
    note varchar(60) null
    ); 

-- creating a primary key and adding the column related to the secondary key
alter table job add column jobid int primary key auto_increment;
alter table job modify column jobid int auto_increment first; 
-- we assign a column for "userid" which becomes a secondary key, having the properties of integer (numeric) and not null (meaning mandatory field)
alter table job add column userid int not null; 
alter table job add column (
constraint fk_job_users foreign key (userid) references users (userid)
);

-- We execute the INSERT function to the "job" table and fill in the related fields "jobtitle", "jobdescription", "notes" and "userid"
insert into job (jobtitle, jobDescription, note, userid)
values ('QA Tester', 'Jira, API Testing, SQL', 'no previous experience necessary', 4), ('Software Developer', 'C#', 'previous experience required', 3), 
('Business Analyst', 'Power BI', 'previous experience required', 2);

-- We execute the INSERT function in the "jobtitle" table and fill in the related fields: "jobtitle" and "userid"
insert into job (jobtitle, userid)
values ('Web Designer', 5), ('Scrum Master', 6), ('Team Manager', 1), ('Consultant', 7), ('Security Specialist', 8), 
('Front-End Developer', 9), ('Database Administrator', 10);

-- The UPDATE function - we enter new information in the "jobtitle" table
update job set note = 'at least 1 year of experience' where jobtitle = 'Web Designer';
update job set note = 'previous experience required' where jobtitle = 'Scrum Master';
update job set jobDescription = 'HTML, CSS, JavaScript', note = '2 years of experience' where jobtitle = 'Front-End Developer'; 
    
select * from job; -- we extract information from the "job" table
delete from job; -- we delete all the information contained in the job table

create table grade (
gradeid int not null auto_increment,
gradename varchar (25) not null,
currency varchar (25) not null,
minsalary int not null,
maxsalary int not null,
jobid int not null,
userid int not null,
primary key (gradeid),
constraint fk_grade_users foreign key (userid) references users (userid)
);

select * from grade; -- we extract the information from the "grade" table
desc grade; -- downloading the "grade" table properties
delete from grade; -- we delete all the information from the "grade" table

-- inserting data into the "grade" table
insert into grade (gradename, currency, minsalary, maxsalary, jobid, userid)
values ('Grade 1', 'USD', 40000, 50000, 1, 4), ('Grade 2', 'USD', 50000, 60000, 7, 7), ('Grade 3', 'USD', 60000, 70000, 10, 10), 
('Grade 4', 'USD', 70000, 80000, 2, 3),('Grade 5', 'USD', 80000, 90000, 6, 1), ('Grade 2', 'USD', 50000, 60000, 3, 2), 
('Grade 3', 'USD', 60000, 70000, 9, 9), ('Grade 4', 'USD', 70000, 80000, 5, 6), ('Grade 1', 'USD', 40000, 50000, 4, 5), 
('Grade 2', 'USD', 50000, 60000, 8, 8);

create table shift (
shiftName varchar (25) not null,
hours int
);

insert into shift (shiftName, hours)
values ("24 hours", 24), ("day shift", 8), ("night shift", 8);

select * from shift;

delete from shift where shiftName = "24 hours"; -- deleting rows by assigning a condition, with the reproduction of the affected rows in the output
truncate table shift; -- deleting rows from a table without using any condition and without counting the affected rows
drop table shift; -- permanent table deletion


-- Aggregate functions
select min(salary) from grade; -- displaying the minimum salary from the "grade" table
select max(maxsalary) from grade; -- displaying the maximum salary from the "grade" table
select avg(minsalary) from grade; -- displaying the average minimum wages from the "grade" table 

select * from job
where jobDescription is null; -- displaying the fields from "job" table of the "jobDescription" column that is empty

select * from grade
where minsalary = 50000; -- displaying the fields from "grade" table of the "minsalary" column that is equal to 50000

-- The LIKE operator
select * from users
where employeeName like 'io%'; -- displaying the fields from "users" table of the "employeeName" column that begins with "io"

-- JOIN function 
select * from users inner join job on users.userid = job.userid; -- brings data from both tables
select * from users inner join job on users.userid = job.userid inner join grade on users.userid = grade.userid;
SELECT * FROM users left JOIN job ON users.userid = job.userid WHERE note IS NULL; -- brings the data that doesn't have complete the "notes" field
SELECT * FROM users right JOIN job ON users.userid = job.userid WHERE jobDescription IS NULL; -- brings the data that doesn't have complete the "jobDescription" field

select u.userid, g.gradename, count(gradeid)
from users u inner join grade g on u.userid = g.userid
group by g.gradename
having count(gradeid) > 2; -- displaying more than 2 inputs that a grade is counting according to "userid" 

select u.userid, u.employeeName, g.minsalary, g.maxsalary -- showing in the results the specified columns
from users u inner join grade g on g.userid = u.userid -- displaying the fields from "users" and "grade" tables using primary key as "userid" column
where (g.minsalary like 50000
or g.maxsalary like 60000) -- where minimum or maximum salary is 50000 or 60000
and u.employeeName like 'A%'; -- and all names from "employeeName" column starts with "A"

-- simple INSERT function - we enter data on a single line
insert into users (username, userRole, employeeName, status)
values ('antonescuamalia', 'ESS', 'Antonescu Amalia', 'enabled');

-- simple INSERT function - we enter data on a single line
insert into job (jobtitle, userid)
values ('Designer', 11);

-- the delete function - deletes information from the selected table using a condition
delete from job where jobTitle = 'Designer' and jobid = 11;
