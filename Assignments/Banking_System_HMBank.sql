create database TechShop;
use TechShop;

create table Customers(
	CustomerID int primary key,
	FirstName varchar(20),
	LastName varchar(20),
	email varchar(50) unique,
	phone varchar(15),
	Address varchar(50));

create table Products(
	ProductID int primary key,
	ProductName varchar(20),
	Description varchar(50),
	Price decimal(10,2));

create table Orders(
	OrderID int primary key,
	CustomerID int,
	OrderDate datetime,
	TotalAmount decimal(10,2),
	foreign key (CustomerID) references Customers(CustomerID));

create table OrderDetails(
	OrderDetailID int primary key,
	OrderID int,
	ProductID int,
	Quantity int,
	foreign key (OrderID) references Orders(OrderID),
	foreign key (ProductID) references Products(ProductID));

create table Inventory(
	InventoryID int primary key,
	ProductID int,
	QuantityInStock int,
	LastStockUpdate datetime,
	foreign key (ProductID) references Products(ProductID));

insert into Customers (CustomerID, FirstName, LastName, email, Phone, Address) values
(1, 'Alice', 'Johnson', 'alice.john@example.com', '9876543210', '123 Elm Street'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '8765432109', '456 Pine Avenue'),
(3, 'Charlie', 'Brown', 'charlie.b@example.com', '7654321098', '789 Oak Lane'),
(4, 'David', 'Williams', 'david.w@example.com', '6543210987', '101 Maple Road'),
(5, 'Eve', 'Taylor', 'eve.t@example.com', '5432109876', '202 Birch Street'),
(6, 'Frank', 'Miller', 'frank.m@example.com', '4321098765', '303 Cedar Avenue'),
(7, 'Grace', 'Lee', 'grace.lee@example.com', '3210987654', '404 Spruce Drive'),
(8, 'Henry', 'Wilson', 'henry.w@example.com', '2109876543', '505 Oakwood Lane'),
(9, 'Ivy', 'Anderson', 'ivy.a@example.com', '1098765432', '606 Redwood Street'),
(10, 'Jack', 'Thomas', 'jack.t@example.com', '1987654321', '707 Maple Grove');

insert into Products (ProductID, ProductName, Description, Price) values
(1, 'Laptop', '15-inch gaming laptop', 1200.99),
(2, 'Smartphone', 'Latest Android phone', 699.49),
(3, 'Headphones', 'Noise-canceling headphones', 149.99),
(4, 'Keyboard', 'Mechanical RGB keyboard', 89.99),
(5, 'Mouse', 'Wireless gaming mouse', 59.99),
(6, 'Monitor', '27-inch 4K monitor', 329.99),
(7, 'Tablet', '10-inch tablet with stylus', 449.99),
(8, 'Smartwatch', 'Fitness tracking smartwatch', 199.99),
(9, 'Printer', 'All-in-one color printer', 179.99),
(10, 'External SSD', '1TB high-speed external SSD', 129.99);

insert into Orders (OrderID, CustomerID, OrderDate, TotalAmount) values
(1, 1, '2024-04-01 10:15:00', 1200.99),
(2, 2, '2024-04-02 14:30:00', 789.48),
(3, 3, '2024-04-03 16:45:00', 239.98),
(4, 4, '2024-04-04 18:00:00', 89.99),
(5, 5, '2024-04-05 19:20:00', 59.99),
(6, 6, '2024-04-06 11:10:00', 129.99),
(7, 7, '2024-04-07 13:45:00', 699.49),
(8, 8, '2024-04-08 15:30:00', 179.99),
(9, 9, '2024-04-09 17:25:00', 449.99),
(10, 10, '2024-04-10 20:40:00', 329.99);

insert into OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) values
(1, 1, 1, 2),   
(2, 2, 2, 1),   
(3, 2, 3, 3),  
(4, 3, 3, 1),   
(5, 3, 4, 2),   
(6, 4, 4, 4),   
(7, 5, 5, 1),   
(8, 6, 10, 1),  
(9, 7, 2, 2),   
(10, 8, 9, 5);  

insert into Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) values
(1, 1, 50, '2024-04-01 08:00:00'),
(2, 2, 100, '2024-04-02 09:30:00'),
(3, 3, 75, '2024-04-03 10:45:00'),
(4, 4, 60, '2024-04-04 12:00:00'),
(5, 5, 80, '2024-04-05 13:20:00'),
(6, 6, 40, '2024-04-06 14:35:00'),
(7, 7, 30, '2024-04-07 15:50:00'),
(8, 8, 90, '2024-04-08 16:10:00'),
(9, 9, 55, '2024-04-09 17:30:00'),
(10, 10, 65, '2024-04-10 18:45:00');


--TASK 2 ---
--1QS  Write an SQL query to retrieve the names and emails of all customers --
select CustomerID,FirstName,LastName,email from Customers;

--2QS Write an SQL query to list all orders with their order dates and corresponding customer names--
select OrderID, OrderDate, 
    (select FirstName from Customers where Customers.CustomerID = Orders.CustomerID) as FirstName, 
    (select LastName from Customers where Customers.CustomerID = Orders.CustomerID) as LastName
from Orders;

--3Qs Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address--
insert into Customers (CustomerID, FirstName, LastName, email, Phone, Address) values (11,'Vin','Venture','vin.venture@example.com',8970645312,'103 final empire');

--4QS Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
update Products 
set Price = Price * 1.10 
where ProductName in ('Laptop', 'Smartphone', 'Headphones', 'Keyboard', 'Mouse', 'Monitor', 'Tablet', 'Smartwatch', 'Printer', 'External SSD');

--5QS Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
delete from OrderDetails where OrderID = 7;
delete from Orders where OrderID = 7;

--6QS Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.  
insert into Orders (OrderID, CustomerID, OrderDate, TotalAmount)  
values (11, 3, '2024-04-11 12:45:00', 500.00);  

--7QS Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.  
update Customers  
set email = 'new.email@example.com', Address = 'New Address Street'  
where CustomerID = 3; 

--8QS Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.  
update Orders  
set TotalAmount = (  
    select sum(Products.Price * OrderDetails.Quantity)  
    from OrderDetails  
    join Products on OrderDetails.ProductID = Products.ProductID  
    where OrderDetails.OrderID = Orders.OrderID  
) where exists (select 1 from OrderDetails where OrderDetails.OrderID = Orders.OrderID);  

--9QS Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.  
delete from OrderDetails  
where OrderID in (select OrderID from Orders where CustomerID = 4);  
delete from Orders  
where CustomerID = 4;  

--10QS Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.  
insert into Products (ProductID, ProductName, Description, Price)  
values (11, 'Wireless Earbuds', 'Bluetooth noise-canceling earbuds', 99.99);  


--11QS Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.  
alter table Orders add Status varchar(20) default 'Pending';  
update Orders  
set Status = 'Shipped'  
where OrderID = 5;  

--12QS Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.  
alter table Customers add OrderCount int default 0;  
update Customers  
set OrderCount = (select count(*) from Orders where Orders.CustomerID = Customers.CustomerID);


--TASK 3--
-- 1. Get all orders along with customer details (name, ID, order date, and total amount)
select o.OrderID, c.CustomerID, c.FirstName,c.LastName, o.OrderDate, o.TotalAmount  
from Orders o  
left join Customers c on o.CustomerID = c.CustomerID;  

-- 2. Find total revenue for each electronic gadget (based on quantity sold and price)
select p.ProductName, sum(od.Quantity * p.Price) as TotalRevenue  
from OrderDetails od  
inner join Products p on od.ProductID = p.ProductID  
group by p.ProductName 
order by TotalRevenue desc;  

-- 3. Get all customers who have made at least one purchase
select distinct c.CustomerID, c.FirstName, c.LastName, c.Email, c.Address  
from Customers c  
inner join Orders o on c.CustomerID = o.CustomerID; 

-- 4. Find the most popular electronic gadget (by total quantity ordered)
select top 1 p.ProductName, sum(od.Quantity) as TotalQuantityOrdered  
from OrderDetails od  
inner join Products p on od.ProductID = p.ProductID  
group by p.ProductName  
order by TotalQuantityOrdered desc;  

-- 5. Retrieve all electronic gadgets with their respective categories
select ProductID, ProductName, Description  
from Products;

-- 6. Calculate the average order value for each customer
select c.CustomerID, c.FirstName, c.LastName, avg(o.TotalAmount) as AverageOrderValue  
from Orders o  
left join Customers c on o.CustomerID = c.CustomerID  
group by c.CustomerID, c.FirstName, c.LastName
order by AverageOrderValue desc;  

-- 7. Find the order with the highest total revenue (includes customer info)
select top 1 o.OrderID, c.FirstName, c.LastName, o.TotalAmount  
from Orders o  
inner join Customers c on o.CustomerID = c.CustomerID  
order by o.TotalAmount desc;  

-- 8. List electronic gadgets and the number of times each product has been ordered
select p.ProductName, count(od.OrderID) as OrderCount  
from OrderDetails od  
left join Products p on od.ProductID = p.ProductID  
group by p.ProductName  
order by OrderCount desc;  

-- 9. Get customers who purchased a specific electronic gadget (dynamic product name)
select distinct c.CustomerID, c.FirstName, c.LastName, c.email  
from Customers c  
inner join Orders o on c.CustomerID = o.CustomerID  
inner join OrderDetails od on o.OrderID = od.OrderID  
inner join Products p on od.ProductID = p.ProductID  
where p.ProductName = 'Printer';  

-- 10. Calculate total revenue from orders within a given date range
select sum(TotalAmount) as TotalRevenue  
from Orders  
where OrderDate between '2024-04-01' and '2024-04-30';

--TASK 4--
--1QS  find out which customers have not placed any orders--
select FirstName, LastName  
from Customers  
where CustomerID not in (select distinct CustomerID from Orders);

--2QS find the total number of products available for sale--
select (select count(*) from Products) as total_products;

--3QS calculate the total revenue generated by TechShop.--
select (select sum(od.quantity * p.price)  
        from OrderDetails od  
        inner join Products p on od.ProductID = p.ProductID)  
       as total_revenue;

--4Qs  to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter--
select (select avg(quantity) 
        from OrderDetails 
        where ProductID in (select ProductID from Products where ProductID = 4)) 
       as avg_quantity_ordered;

--5QS query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter. 
select (select sum(od.quantity * p.price)  
        from OrderDetails od  
        join Products p on od.ProductID = p.ProductID 
        where od.OrderID in (select OrderID from Orders where CustomerID = 3))  
       as customer_revenue;
--6QS query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
select FirstName, LastName, total_orders  
from (select top 1 c.FirstName, c.LastName, count(o.OrderDate) as total_orders  
      from Customers c  
      inner join Orders o on c.CustomerID = o.CustomerID  
      group by c.CustomerID, c.FirstName, c.LastName  
      order by total_orders desc) as top_customer;

--7QS query to find the most popular product category, which is the one with the highest total quantity ordered across all orders. 
select ProductName 
from Products 
where ProductID = (select top 1 ProductID 
                   from OrderDetails 
                   group by ProductID 
                   order by sum(Quantity) desc);

--8QS query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending. 
select top 1 FirstName, LastName, total_spent
from (
    select c.FirstName, c.LastName, sum(o.TotalAmount) as total_spent
    from Customers c
    inner join Orders o on c.CustomerID = o.CustomerID
    where c.CustomerID in (
        select distinct o.CustomerID
        from Orders o
        inner join OrderDetails od on o.OrderID = od.OrderID
        inner join Products p on od.ProductID = p.ProductID
        where p.ProductName like '%Pr%'
    )
    group by c.CustomerID, c.FirstName, c.LastName
) as spender
order by total_spent desc;

--9QS query to calculate the average order value (total revenue divided by the number of orders) for all customers. 
select (select sum(TotalAmount) from Orders) / 
       (select count(OrderID) from Orders) 
       as avg_order_value;

--10QS query to find the total number of orders placed by each customer and list their names along with the order count. 
select FirstName, LastName, 
       (select count(OrderID) from Orders where CustomerID = c.CustomerID) 
       as total_orders
from Customers c;