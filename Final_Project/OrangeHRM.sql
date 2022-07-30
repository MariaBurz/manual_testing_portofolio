/* Diferenta dintre DDL, DML si DQL
DDL (Data Definition Language) - definim baza de date - cream baze de date, tabele sau modificam structura unei tabele, adaugam coloane;
DML (Data Manipulation Language) - manipulam baza de date - gestionam informatia din baza de date cu functiile INSERT, UPDATE, DELETE;
DQL (Data Query Language) - interogam baza de date - extragem informatii din baza de date - cuprinde un subset de instructiuni.
*/

-- crearea bazei de date orangeHRM si a tabelelor "users", "job" si "grade"
create database orangeHRM;  
CREATE TABLE users (
    username VARCHAR(25) NOT NULL,
    userRole VARCHAR(25) NOT NULL,
    employeeName varchar (50) not null,
    status varchar (25) not null
    );
    
-- creare cheie primara - 
-- ALTER modifica structura unei tabele adaugand coloana userid ca si cheie primara cu proprietatile auto-increment si integer (numeric)
alter table users add column userid int primary key auto_increment; 
-- Modificam coloana userid pozitionand-o prima in tabela, atribuindu-i din nou calitatea integer, altfel s-ar pierde
alter table users modify column userid int auto_increment first; 

select * from users; -- extragem informatii din tabela users
desc users; -- descarcam proprietatile tabelei users

-- Executam functia de INSERT in tabela jobtitle si umplem campurile aferente username, userRole, employeeName si status, inserand mai multe date
insert into users (username, userRole, employeeName, status)
values ('popioana', 'Admin', 'Pop Ioana', 'enabled'), ('popescuion', 'ESS', 'Popescu Ion', 'enabled'), ('popicaioan', 'ESS', 'Popica Ioan', 'enabled'),
('popailie', 'ESS', 'Popa Ilie', 'enabled'), ('ionescupaul', 'ESS', 'Ionescu Paul', 'enabled'), ('iovanovicipetra', 'ESS', 'Iovanovici Paula', 'enabled'),
('androneirina', 'ESS', 'Androne Irina', 'enabled'), ('andronescuirimie', 'ESS', 'Andronescu Irimie', 'disabled'), ('andrasiulia', 'ESS', 'Andras Iulia', 'disabled'),
('anduiulian', 'ESS', 'Andu Iulian', 'disabled');
    
 CREATE TABLE job (
    jobTitle VARCHAR(25) NOT NULL,
    jobDescription VARCHAR(50) NULL, -- jobSpecification varchar (50) null,
    note varchar(60) null
    ); 

-- creare cheie primara si adaugarea colonei aferente cheii secundare
alter table job add column jobid int primary key auto_increment;
alter table job modify column jobid int auto_increment first; 
-- atribuim o coloana pentru userid care devine cheie secundara, avand proprietatile de integer (numeric) si not null (camp obligatoriu)
alter table job add column userid int not null; 
alter table job add column (
constraint fk_job_users foreign key (userid) references users (userid)
);

-- Executam functia de INSERT in tabela job si umplem campurile aferente jobtitle, jobdescription, note si userid
insert into job (jobtitle, jobDescription, note, userid)
values ('QA Tester', 'Jira, API Testing, SQL', 'no previous experience necessary', 4), ('Software Developer', 'C#', 'previous experience required', 3), 
('Business Analyst', 'Power BI', 'previous experience required', 2);

-- Executam functia de INSERT in tabela jobtitle si umplem campurile aferente jobtitle, si userid
insert into job (jobtitle, userid)
values ('Web Designer', 5), ('Scrum Master', 6), ('Team Manager', 1), ('Consultant', 7), ('Security Specialist', 8), 
('Front-End Developer', 9), ('Database Administrator', 10);

-- Instructiunea de UPDATE - introducem informatii noi in tabela jobtitle
update job set note = 'at least 1 year of experience' where jobtitle = 'Web Designer';
update job set note = 'previous experience required' where jobtitle = 'Scrum Master';
update job set jobDescription = 'HTML, CSS, JavaScript', note = '2 years of experience' where jobtitle = 'Front-End Developer'; 
    
select * from job; -- extragem informatii din tabela job
delete from job; -- stergem toate informatiile ce sunt cuprinse in tabela job

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

select * from grade; -- extragem informatiile din tabela grade
desc grade; -- descarcam proprietatile tabelei grade
delete from grade; -- stergem toate informatiile din tabela grade

-- inserarea de date in tabela Grade
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

delete from shift where shiftName = "24 hours"; -- putem sa stergem randuri atribuind o conditie, cu redarea in output a randurilor afectate
truncate table shift; -- stergerea randurilor dintr-o tabela fara a folosi vreo conditie si fara a numara randurile afectate
drop table shift; -- stergerea definitiva a tabelei


-- Functii agregate
select * from job
where jobDescription is null;

select * from grade
where minsalary = 50000;

-- Operatorul LIKE
select * from users
where employeeName like 'io%';

-- Instructiunea de JOIN 
select * from users inner join job on users.userid = job.userid; -- aduce date din ambele tabele
select * from users inner join job on users.userid = job.userid inner join grade on users.userid = grade.userid;
SELECT * FROM users left JOIN job ON users.userid = job.userid WHERE note IS NULL; -- aduce datele care nu au completat campul de "note"
SELECT * FROM users right JOIN job ON users.userid = job.userid WHERE jobDescription IS NULL; -- aduce datele care nu au completat campul de "jobDescription"

select u.userid, g.gradename, count(gradeid)
from users u inner join grade g on u.userid = g.userid
group by g.gradename
having count(gradeid) > 2;

-- functia de INSERT simplu - introducem date pe un singur rand
insert into users (username, userRole, employeeName, status)
values ('antonescuamalia', 'ESS', 'Antonescu Amalia', 'enabled');

insert into job (jobtitle, userid)
values ('Designer', 11);

-- functia de delete - sterge o informatie din tabela aleasa folosind o conditie
delete from job where jobTitle = 'Designer' and jobid = 11;

select max(maxsalary) from grade; -- redarea salariului maxim din tabela grade
select avg(minsalary) from grade; -- redarea mediei salariilor minime din tabela grade

select u.userid, u.employeeName, g.minsalary, g.maxsalary from users u, grade g
where (g.minsalary like 50000
or g.maxsalary like 60000)
and u.employeeName like 'A%';
