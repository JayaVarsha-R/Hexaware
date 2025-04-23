create database SIS;
use SIS;

create table Students(
	student_id int primary key,
	first_name varchar(15),
	last_name varchar(15),
	date_of_birth date,
	email varchar(30) unique,
	phone_number varchar(10)
);
create table Courses(
	course_id int primary key,
	course_name varchar(20),
	credits int,
	teacher_id int,
	foreign key (teacher_id) references Teacher(teacher_id)
);
create table Enrollments(
	enrollment_id int primary key,
	student_id int,
	course_id int,
	enrollment_date date,
	foreign key (student_id) references Students(student_id),
	foreign key (course_id) references Courses(course_id)
);
create table Teacher(
	teacher_id int primary key,
	first_name varchar(15),
	last_name varchar(15),
	email varchar(30) unique
);

create table Payments(
	payment_id int primary key,
	student_id int,
	amount decimal(10,2),
	payment_date date,
	foreign key (student_id) references Students(student_id)
);

insert into Students values 
(1, 'Alice', 'Johnson', '2002-03-15', 'alice.j@example.com', '9876543210'),
(2, 'Bob', 'Smith', '2001-07-22', 'bob.s@example.com', '9876543211'),
(3, 'Charlie', 'Brown', '2002-11-10', 'charlie.b@example.com', '9876543212'),
(4, 'Daisy', 'Miller', '2003-01-05', 'daisy.m@example.com', '9876543213'),
(5, 'Ethan', 'Clark', '2000-09-30', 'ethan.c@example.com', '9876543214'),
(6, 'Fiona', 'Lee', '2001-06-12', 'fiona.l@example.com', '9876543215'),
(7, 'George', 'Martin', '2002-12-25', 'george.m@example.com', '9876543216'),
(8, 'Hannah', 'Wright', '2003-02-14', 'hannah.w@example.com', '9876543217'),
(9, 'Ian', 'Scott', '2001-04-09', 'ian.s@example.com', '9876543218'),
(10, 'Jenny', 'Lopez', '2000-08-18', 'jenny.l@example.com', '9876543219');


insert into Teacher values
(1, 'Laura', 'Baker', 'laura.b@example.com'),
(2, 'Mark', 'Davis', 'mark.d@example.com'),
(3, 'Rachel', 'Green', 'rachel.g@example.com'),
(4, 'Tom', 'Holland', 'tom.h@example.com'),
(5, 'Sophie', 'King', 'sophie.k@example.com'),
(6, 'Victor', 'Stone', 'victor.s@example.com'),
(7, 'Nina', 'Hart', 'nina.h@example.com'),
(8, 'Paul', 'Walker', 'paul.w@example.com'),
(9, 'Olivia', 'Taylor', 'olivia.t@example.com'),
(10, 'Chris', 'Evans', 'chris.e@example.com');


insert into Courses values
(101, 'Mathematics', 4, 1),
(102, 'Physics', 3, 2),
(103, 'Chemistry', 4, 3),
(104, 'Biology', 3, 4),
(105, 'English', 2, 5),
(106, 'History', 3, 6),
(107, 'Geography', 2, 7),
(108, 'Computer Sci', 5, 8),
(109, 'Economics', 3, 9),
(110, 'Philosophy', 2, 10);


insert into Enrollments values
(1, 1, 101, '2024-06-01'),
(2, 2, 102, '2024-06-02'),
(3, 3, 103, '2024-06-03'),
(4, 4, 104, '2024-06-04'),
(5, 5, 105, '2024-06-05'),
(6, 6, 106, '2024-06-06'),
(7, 7, 107, '2024-06-07'),
(8, 8, 108, '2024-06-08'),
(9, 9, 109, '2024-06-09'),
(10, 10, 110, '2024-06-10');


insert into Payments values 
(1, 1, 1500.00, '2024-07-01'),
(2, 2, 1450.50, '2024-07-02'),
(3, 3, 1600.75, '2024-07-03'),
(4, 4, 1300.25, '2024-07-04'),
(5, 5, 1700.00, '2024-07-05'),
(6, 6, 1250.00, '2024-07-06'),
(7, 7, 1350.60, '2024-07-07'),
(8, 8, 1400.40, '2024-07-08'),
(9, 9, 1550.00, '2024-07-09'),
(10, 10, 1650.90, '2024-07-10');


--TASK 2--
--1 QS--
insert into Students(first_name,last_name,date_of_birth,email,phone_number) values ('John','Doe','1995-08-15','john.doe@example.com','1234567890');

--2QS--
insert into Enrollments(enrollment_id, student_id, course_id, enrollment_date)  
values (1, 1, 1, '2025-04-23');  

--3QS--
update Teacher set email = 'updated.email@example.com' where teacher_id = 1;

--4QS--
delete from Enrollments where student_id = 1 and course_id = 1;

--5QS--
update Courses set teacher_id = 1 where course_id = 1;

--6QS--
delete from Enrollments where student_id = 1;  
delete from Students where student_id = 1;

--7QS--
update Payments set amount = 5000.00 where payment_id = 1;

--TASK 3--
--1QS--
select s.student_id, s.first_name, sum(p.amount) as total_payment  
from Students s  
join Payments p on s.student_id = p.student_id  
where s.student_id = 1  
group by s.student_id, s.first_name;

--2QS--
select c.course_name, count(e.student_id) as student_count  
from Courses c  
left join Enrollments e on c.course_id = e.course_id  
group by c.course_name;

--3QS--
select s.first_name, s.last_name  
from Students s  
left join Enrollments e on s.student_id = e.student_id  
where e.enrollment_id is null;

--4QS--
select s.first_name, s.last_name, c.course_name  
from Students s  
join Enrollments e on s.student_id = e.student_id  
join Courses c on e.course_id = c.course_id;

--5QS--
select t.first_name, t.last_name, c.course_name  
from Teacher t  
left join Courses c on t.teacher_id = c.teacher_id;

--6QS--
select s.first_name, s.last_name, e.enrollment_date  
from Students s  
join Enrollments e on s.student_id = e.student_id  
where e.course_id = 1;

--7QS--
select s.first_name, s.last_name  
from Students s  
left join Payments p on s.student_id = p.student_id  
where p.payment_id is null;

--8QS--
select c.course_name  
from Courses c  
left join Enrollments e on c.course_id = e.course_id  
where e.enrollment_id is null;

--9QS--
select s.first_name, s.last_name  
from Students s  
join Enrollments e on s.student_id = e.student_id  
group by s.student_id  
having count(e.course_id) > 1;

--10QS--
select t.first_name, t.last_name  
from Teacher t  
left join Courses c on t.teacher_id = c.teacher_id  
where c.course_id is null;

--TASK 4--
--1QS--
select avg(student_count) as avg_enrollment  
from (  
  select course_id, count(student_id) as student_count  
  from Enrollments  
  group by course_id  
) as course_counts;

--2QS--
select s.first_name, s.last_name  
from Students s  
join Payments p on s.student_id = p.student_id  
where p.amount = (select max(amount) from Payments);

--3QS--
select c.course_name  
from Courses c  
join Enrollments e on c.course_id = e.course_id  
group by c.course_id  
having count(e.student_id) = (  
  select max(student_count)  
  from (  
    select course_id, count(student_id) as student_count  
    from Enrollments  
    group by course_id  
  ) as counts  
);

--4QS--
select t.first_name, t.last_name, sum(p.amount) as total_payment  
from Teacher t  
join Courses c on t.teacher_id = c.teacher_id  
join Enrollments e on c.course_id = e.course_id  
join Payments p on e.student_id = p.student_id  
group by t.teacher_id;

--5QS--
select s.student_id, s.first_name, s.last_name  
from Students s  
where (  
  select count(*) from Enrollments e where e.student_id = s.student_id  
) = (select count(*) from Courses);

--6QS--
select first_name, last_name  
from Teacher  
where teacher_id not in (select teacher_id from Courses where teacher_id is not null);

--7QS--
--7QS--
select round(avg(timestampdiff(year, date_of_birth, curdate())), 2) as avg_age  
from Students;

--8QS--
select course_name  
from Courses  
where course_id not in (select distinct course_id from Enrollments);

--9QS--
select s.student_id, c.course_id, sum(p.amount) as total_payment  
from Students s  
join Enrollments e on s.student_id = e.student_id  
join Courses c on e.course_id = c.course_id  
join Payments p on s.student_id = p.student_id  
group by s.student_id, c.course_id;

--10QS--
select s.first_name, s.last_name  
from Students s  
where s.student_id in (  
  select student_id from Payments  
  group by student_id  
  having count(*) > 1  
);

--11QS--
select s.student_id, s.first_name, sum(p.amount) as total_payments  
from Students s  
join Payments p on s.student_id = p.student_id  
group by s.student_id;

--12QS--
select c.course_name, count(e.student_id) as student_count  
from Courses c  
join Enrollments e on c.course_id = e.course_id  
group by c.course_name;

--13QS--
select avg(p.amount) as avg_payment  
from Students s  
join Payments p on s.student_id = p.student_id;
