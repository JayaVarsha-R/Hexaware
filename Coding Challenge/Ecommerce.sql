create database Ecom;
use Ecom;

create table Customers(
	customerID int primary key,
	firstName varchar(15),
	lastName varchar(15),
	email varchar(30) unique,
	address varchar(30));

create table Products(
	productID int primary key,
	name varchar(20),
	description varchar(30),
	price decimal(10,2),
	stockQuantity int);

create table Carts(
	cartID int primary key,
	customerID int,
	productID int,
	quantity int,
	foreign key (customerID) references Customers(customerID),
	foreign key (productID) references Products(productID));

create table Orders(
	orderID int primary key,
	customerID int,
	orderDate date,
	totalPrice decimal(10,2),
	shippingAddress varchar(30),
	foreign key (customerID) references Customers(customerID));

create table OrderItems(
	orderItemID int primary key,
	orderID int,
	productID int,
	quantity int,
	itemAmount decimal(10,2),
	foreign key (orderID) references Orders(orderID),
	foreign key (productID) references Products(productID));

insert into Customers(customerID,firstName,lastName,email,address) values 
(1,'John','Doe','johndoe@example.com','123 Main St, City'),
(2,'Jane','Smith','janesmith@example.com','456 Elm St, Town'),
(3,'Robert','Johnson','robert@example.com','789 Oak St Village'),
(4,'Sarah','Brown','sarah@example.com','101 Pine St, Suburb'),
(5,'David','Lee','david@example.com','234 Cedar St, District'),
(6,'Laura','Hall','laura@example.com','567 Birch St, County'),
(7,'Michael','Davis','michael@example.com','890 Maple St, State'),
(8,'Emma','Wilson','emma@example.com','321 Redwood St, Country'),
(9,'William','Taylor','william@example.com','432 Spruce St, Province'),
(10,'Olivia','Adams','olivia@example.com','765 Fir St, Territory');

insert into Products(productID,name,description,price,stockQuantity) values
(1,'Laptop','High-performance laptop', 800.00, 10),
(2,'Smartphone','Latest smartphone', 600.00, 15),
(3,'Tablet','Portable tablet', 300.00, 20),
(4,'Headphones', 'Noise-canceling', 150.00, 30),
(5,'TV','4K Smart TV', 900.00, 5),
(6,'Coffee Maker','Automatic coffee maker', 50.00, 25),
(7,'Refrigerator','Energy-efficient', 700.00, 10),
(8, 'Microwave Oven','Countertop microwave', 80.00, 15),
(9,'Blender','High-speed blender', 70.00, 20),
(10,'Vacuum', 'Cleaner Bagless vacuum cleaner', 120.00, 10);

insert into Carts(cartID,customerID,productID,quantity) values
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

insert into Orders(orderID,customerID,orderDate,totalPrice,shippingAddress) values
(1, 1, '2023-01-05', 1200.00,'135 River St, City'),
(2, 2, '2023-02-10', 900.00,'467 Walnut St, Town'),
(3, 3, '2023-03-15', 300.00,'798 Willow St, Village'),
(4, 4, '2023-04-20', 150.00,'112 Aspen St, Suburb'),
(5, 5, '2023-05-25', 1800.00,'245 Chestnut St, District'),
(6, 6, '2023-06-30', 400.00,'579 Sycamore St, County'),
(7, 7, '2023-07-05', 700.00,'902 Poplar St, State'),
(8, 8, '2023-08-10', 160.00,'333 Palm St, Country'),
(9, 9, '2023-09-15', 140.00, '454 Magnolia St, Province'),
(10, 10, '2023-10-20', 1400.00,'777 Juniper St, Territory');


insert into OrderItems(orderItemID,orderID,productID,quantity,itemAmount) values
(1, 1, 1, 2, 1600.00),
(2, 1, 3, 1, 300.00),
(3, 2, 2, 3, 1800.00),
(4, 3, 5, 2, 1800.00),
(5, 4, 4, 4, 600.00),
(6, 4, 6, 1, 50.00),
(7, 5, 1, 1, 800.00),
(8, 5, 2, 2, 1200.00),
(9, 6, 10, 2, 240.00),
(10, 6, 9, 3, 210.00);

--1QS Update refrigerator product price to 800.
update Products
set price=800.00
where name ='Refrigerator';

--2Qs Remove all cart items for a specific customer.
delete from Carts
where customerID='10';

--3Qs Retrieve Products Priced Below $100.
select * from Products
where price<100;

--4Qs Find Products with Stock Quantity Greater Than 5.
select * from Products
where stockQuantity > 5;

--5Qs Retrieve Orders with Total Amount Between $500 and $1000.
select * from Orders
where totalPrice between 500 and 1000;

--6Qs Find Products which name end with letter ‘r’.
select productID,name from Products 
where name like '%r';

--7Qs Retrieve Cart Items for Customer 5---
select * from Carts
where cartID =5;

--8Qs Find Customers Who Placed Orders in 2023--
select c.customerID,c.firstName,c.lastName,o.orderDate
from Customers c
inner join Orders o on c.customerID=o.customerID
where year(o.orderDate) = 2023;

--9Qs Determine the Minimum Stock Quantity for Each Product Category--
select productID,name,min(stockQuantity) from Products
group by productID,name;

--10Qs Calculate the Total Amount Spent by Each Customer--
select c.customerID,c.firstName,c.lastName,sum(o.totalPrice) as totalAmount
from Customers c
inner join Orders o on c.customerID=o.customerID
group by c.customerID,c.firstName,c.lastName;

--11Qs Find the Average Order Amount for Each Customer--
select c.customerID,c.firstName,c.lastName,avg(o.totalPrice) as avgAmount
from Customers c
inner join Orders o on c.customerID=o.customerID
group by c.customerID,c.firstName,c.lastName;

--12Qs Count the Number of Orders Placed by Each Customer --
select c.customerID,c.firstName,c.lastName,count(o.orderID) as totalOrders
from Customers c
inner join Orders o on c.customerID=o.customerID
group by c.customerID,c.firstName,c.lastName;

--13Qs Find the Maximum Order Amount for Each Customer--
select customerID, max(totalPrice) as max_order_amount 
from Orders 
group by customerID;

--14Qs Get Customers Who Placed Orders Totaling Over $1000--
select c.customerID,c.firstName,c.lastName 
from Customers c
inner join Orders o on c.customerID=o.customerID
group by c.customerID,c.firstName,c.lastName
having sum(o.totalPrice)>1000;

--15Qs Subquery to Find Products Not in the Cart--
select * from Products
where productID not in(select distinct productId from Carts);

--16Qs Subquery to Find Customers Who Haven't Placed Orders--
select * from Customers
where customerID not in(select distinct customerID from Orders);

--17Qs Subquery to Calculate the Percentage of Total Revenue for a Product--
select p.productID, p.name, 
       (sum(oi.itemAmount) / (select sum(totalPrice) from Orders)) * 100 as revenue_percentage 
from OrderItems oi 
inner join Products p on oi.productID = p.productID 
group by p.productID, p.name;


--18Qs Subquery to Find Products with Low Stock--
select * from products 
where stockQuantity=(select min(stockQuantity) from Products);

--19Qs Subquery to Find Customers Who Placed High-Value Orders--
select * from Customers 
where customerID in (select distinct customerID from Orders where totalPrice > 1000);
