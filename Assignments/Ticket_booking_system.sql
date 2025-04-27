create database TBS;
use TBS;

create table Venue(
	venue_id int primary key,
	venue_name varchar(40),
	address varchar(40)
	);

create table Event(
	event_id int primary key,
	event_name varchar(30),
	event_date date,
	event_time time,
	venue_id int,
	total_seats int,
	available_seats int,
	ticket_price decimal(10,2),
	event_type varchar(20) check(event_type in('Movie','Sports','Concert')),
	booking_id int,
	foreign key (venue_id) references Venue(venue_id),
	
);

create table Customer(
	customer_id int primary key,
	customer_name varchar(20),
	email varchar(30) unique,
	phone_number varchar(10),
	booking_id int,

	);

create table Booking(
	booking_id int primary key,
	customer_id int,
	event_id int,
	num_tickets int,
	total_cost decimal(10,2),
	booking_date date,
	foreign key (customer_id) references Customer(customer_id),
	foreign key (event_id) references Event(event_id)
);
ALTER TABLE Customer
ADD CONSTRAINT fk_customer_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);


ALTER TABLE Event
ADD CONSTRAINT fk_event_booking
 FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);


INSERT INTO Venue VALUES
(1, 'Hall A', 'City Center'),
(2, 'Stadium X', 'Downtown'),
(3, 'Theatre Z', 'West End'),
(4, 'Arena Q', 'North Side'),
(5, 'Cinema Y', 'East Block'),
(6, 'Ground A', 'South Street'),
(7, 'Hall B', 'Green Park'),
(8, 'Theatre K', 'Main Street'),
(9, 'Venue 9', 'Uptown'),
(10, 'Venue 10', 'Suburbia');

INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id) VALUES
(1, 'Alice', 'alice@mail.com', '1234567890', NULL),
(2, 'Bob', 'bob@mail.com', '1234567891', NULL),
(3, 'Charlie', 'charlie@mail.com', '1234567892', NULL),
(4, 'David', 'david@mail.com', '1234567893', NULL),
(5, 'Eva', 'eva@mail.com', '1234567894', NULL),
(6, 'Frank', 'frank@mail.com', '1234567895', NULL),
(7, 'Grace', 'grace@mail.com', '1234567896', NULL),
(8, 'Hank', 'hank@mail.com', '1234567897', NULL),
(9, 'Ivy', 'ivy@mail.com', '1234567898', NULL),
(10, 'Jack', 'jack@mail.com', '1234567899', NULL);

INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) VALUES
(1, 'Movie Night', '2025-05-01', '18:00:00', 1, 100, 80, 250.00, 'Movie', NULL),
(2, 'Rock Concert', '2025-05-02', '19:30:00', 2, 500, 200, 1200.00, 'Concert', NULL),
(3, 'Football Match', '2025-05-03', '17:00:00', 3, 1000, 850, 1500.00, 'Sports', NULL),
(4, 'Jazz Night', '2025-05-04', '20:00:00', 4, 150, 100, 700.00, 'Concert', NULL),
(5, 'Cricket Match', '2025-05-05', '15:00:00', 5, 1200, 1000, 1800.00, 'Sports', NULL),
(6, 'Drama Show', '2025-05-06', '18:30:00', 6, 200, 150, 500.00, 'Movie', NULL),
(7, 'Dance Fest', '2025-05-07', '19:00:00', 7, 300, 270, 950.00, 'Concert', NULL),
(8, 'Basketball Game', '2025-05-08', '16:00:00', 8, 800, 600, 1300.00, 'Sports', NULL),
(9, 'Indie Film', '2025-05-09', '18:15:00', 9, 120, 100, 300.00, 'Movie', NULL),
(10, 'Pop Concert', '2025-05-10', '20:30:00', 10, 700, 500, 1100.00, 'Concert', NULL);

INSERT INTO Booking VALUES
(1, 1, 1, 2, 500.00, '2025-04-25'),
(2, 2, 2, 3, 3600.00, '2025-04-25'),
(3, 3, 3, 1, 1500.00, '2025-04-25'),
(4, 4, 4, 2, 1400.00, '2025-04-25'),
(5, 5, 5, 4, 7200.00, '2025-04-25'),
(6, 6, 6, 1, 500.00, '2025-04-25'),
(7, 7, 7, 2, 1900.00, '2025-04-25'),
(8, 8, 8, 3, 3900.00, '2025-04-25'),
(9, 9, 9, 1, 300.00, '2025-04-25'),
(10, 10, 10, 2, 2200.00, '2025-04-25');

UPDATE Customer SET booking_id = 1 WHERE customer_id = 1;
UPDATE Customer SET booking_id = 2 WHERE customer_id = 2;
UPDATE Customer SET booking_id = 3 WHERE customer_id = 3;
UPDATE Customer SET booking_id = 4 WHERE customer_id = 4;
UPDATE Customer SET booking_id = 5 WHERE customer_id = 5;
UPDATE Customer SET booking_id = 6 WHERE customer_id = 6;
UPDATE Customer SET booking_id = 7 WHERE customer_id = 7;
UPDATE Customer SET booking_id = 8 WHERE customer_id = 8;
UPDATE Customer SET booking_id = 9 WHERE customer_id = 9;
UPDATE Customer SET booking_id = 10 WHERE customer_id = 10;

UPDATE Event SET booking_id = 1 WHERE event_id = 1;
UPDATE Event SET booking_id = 2 WHERE event_id = 2;
UPDATE Event SET booking_id = 3 WHERE event_id = 3;
UPDATE Event SET booking_id = 4 WHERE event_id = 4;
UPDATE Event SET booking_id = 5 WHERE event_id = 5;
UPDATE Event SET booking_id = 6 WHERE event_id = 6;
UPDATE Event SET booking_id = 7 WHERE event_id = 7;
UPDATE Event SET booking_id = 8 WHERE event_id = 8;
UPDATE Event SET booking_id = 9 WHERE event_id = 9;
UPDATE Event SET booking_id = 10 WHERE event_id = 10;


--TASK 2--
--1Qs--
select * from event;

--2Qs--
select * from event
where available_seats > 0;

--3Qs--
select * from event
where event_name like '%cup%';

--4Qs--
select * from event
where ticket_price between 1000 and 2500;

--5Qs--
select * from event
where event_date between '2025-01-01' and '2025-12-31';

--6Qs--
select * from event
where event_type = 'Concert' and available_seats > 0;

--7Qs--
select * from customer
order by customer_id
offset 5 rows fetch next 5 rows only;

--8Qs--
select * from booking
where num_tickets > 4;

--9Qs--
select * from customer
where phone_number like '%000';

--10Qs--
select * from event
where total_seats > 15000
order by total_seats desc;

--11Qs--
select * from event
where event_name not like 'x%' and event_name not like 'y%' and event_name not like 'z%';

--TASK 3--
--1Qs--
select event_name, avg(ticket_price) as avg_ticket_price
from event
group by event_name;

--2Qs--
select sum(total_cost) as total_revenue
from booking;

--3Qs--
select  top 1 event_name, sum(num_tickets * ticket_price) as ticket_sales
from event
join booking on event.event_id = booking.event_id
group by event_name
order by ticket_sales desc;

--4Qs--
select event_name, sum(num_tickets) as total_tickets_sold
from event
join booking on event.event_id = booking.event_id
group by event_name;

--5Qs--
select event_name
from event
left join booking on event.event_id = booking.event_id
group by event_name
having sum(num_tickets) = 0;

--6Qs--
select top 1 customer_name, sum(num_tickets) as total_tickets
from customer
join booking on customer.customer_id = booking.customer_id
group by customer_name
order by total_tickets desc;

--7Qs--
select event_name, sum(num_tickets) as total_tickets_sold, month(booking_date) as month
from event
join booking on event.event_id = booking.event_id
group by event_name, month(booking_date)
order by month;

--8Qs--
select venue_id, avg(ticket_price) as avg_ticket_price
from event
group by venue_id;

--9Qs--
select event_type, sum(num_tickets) as total_tickets_sold
from event
join booking on event.event_id = booking.event_id
group by event_type;

--10Qs--
select year(event_date) as year, sum(num_tickets * ticket_price) as total_revenue
from event
join booking on event.event_id = booking.event_id
group by year(event_date);

--11Qs--
select customer_name
from customer
join booking on customer.customer_id = booking.customer_id
group by customer_name
having count(distinct event_id) > 1;

--12Qs--
select customer_name, sum(num_tickets * ticket_price) as total_revenue
from customer
join booking on customer.customer_id = booking.customer_id
join event on event.event_id = booking.event_id
group by customer_name;

--13Qs---
select venue_id, event_type, avg(ticket_price) as avg_ticket_price
from event
group by venue_id, event_type;

--14Qs--
select customer_name, sum(num_tickets) as total_tickets_purchased
from customer
join booking on customer.customer_id = booking.customer_id
join event on event.event_id = booking.event_id
where booking_date >= current_date - interval 30 day
group by customer_name;

--TASK 4--
--1Qs--
select venue_id, (select avg(ticket_price) from event where event.venue_id = venue_id) as avg_ticket_price
from event
group by venue_id;

--2Qs--
select event_name
from event
where total_seats - available_seats > (select count(*) / 2 from booking where booking.event_id = event.event_id);

--3Qs--
select event_name, (select sum(num_tickets) from booking where booking.event_id = event.event_id) as total_tickets_sold
from event;

--4Qs--
select customer_name
from customer
where not exists (select 1 from booking where booking.customer_id = customer.customer_id);

--5Qs--
select event_name
from event
where event_id not in (select event_id from booking where num_tickets > 0);

--6Qs--
select event_name, (select sum(num_tickets) from booking where booking.event_id = event.event_id) as total_tickets_sold
from event;

--7Qs--
select event_name
from event
where ticket_price > (select avg(ticket_price) from event);

--8Qs--
select customer_name, (select sum(num_tickets * ticket_price) from booking join event on booking.event_id = event.event_id where booking.customer_id = customer.customer_id) as total_revenue
from customer;

--9Qs--
select customer_name
from customer
where customer_id in (select customer_id from booking join event on booking.event_id = event.event_id where venue_id = '1');

--10Qs--
select event_type, (select sum(num_tickets) from booking where booking.event_id = event.event_id) as total_tickets_sold
from event
group by event_type;

--11Qs--
select customer_name
from customer
where customer_id in (select customer_id from booking where month(booking_date) = month(current_date));

--12Qs--
select venue_id, (select avg(ticket_price) from event where event.venue_id = venue_id) as avg_ticket_price
from event;

