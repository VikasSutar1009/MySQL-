CREATE DATABASE HackerRankPractice_1;

USE HackerRankPractice_1;

CREATE TABLE Categories(
CategoryID int primary key,
CategoryName varchar(50)
);

INSERT INTO Categories values
(1,'Furniture'), (2, 'Office Supplies'), (3, 'Technology');

select * from categories;

CREATE TABLE Products (
ProductID int primary key,
ProductName varchar(100),
CategoryID int,
UnitPrice decimal(10,2),
FOREIGN KEY (CategoryID) references categories(CategoryID)
);

INSERT INTO Products values
(101, 'Office Chair', 1, 2500),
(102, 'Desk', 1, 5000),
(103, 'Pen', 2, 20),
(104, 'Notebook', 2, 50),
(105, 'Laptop', 3, 60000),
(106, 'Headphones', 3, 3000);

select * from Products;

CREATE TABLE Customers (
CustomerID int primary key,
CustomerName varchar(100),
City varchar(50),
Region varchar(50)
);

INSERT INTO Customers values
(1,'Ravi Sharma', 'Delhi', 'North'),
(2,'Sneha Patil', 'Mumbai', 'West'),
(3,'Amit Varma', 'Kolkata', 'East'),
(4,'Priya Rao', 'Bengalore', 'South');

select * from Customers;

CREATE TABLE Orders (
OrderID int primary key,
CustomerID int,
OrderDate date,
Region varchar(50),
FOREIGN KEY (CustomerID) references Customers(CustomerID)
);

INSERT INTO Orders values
(1001, 1, '2024-04-10', 'North'),
(1002, 2, '2024-04-11', 'West'),
(1003, 3, '2024-04-12', 'East'),
(1004, 4, '2024-04-13', 'South'),
(1005, 1, '2024-04-14', 'North');

select * from Orders;

CREATE TABLE OrderDetails (
OrderDetailID int primary key,
OrderID int,
ProductID int,
Quantity int,
Discount decimal(10,2),
foreign key (OrderID) references Orders(OrderID),
foreign key (ProductID) references Products(ProductID)
);

INSERT INTO OrderDetails values
(1, 1001, 101, 2, 0.05),
(2, 1001, 103, 10, 0),
(3, 1002, 105, 1, 0.1),
(4, 1003, 104, 5, 0),
(5, 1004, 106, 2, 0.2),
(6, 1005, 102, 1, 0);

select * from OrderDetails;

-- Show all customers and their cities. 
select CustomerName, City from Customers;

-- List all product names and their prices.
select ProductName, UnitPrice from Products;

-- Display all orders placed in April 2024.
select * from Orders where OrderDate between '2024-04-01' and '2024-04-30';
SELECT * FROM Orders
WHERE MONTH(OrderDate) = 4 AND YEAR(OrderDate) = 2024;

-- Count total number of customers.
select count(CustomerID) as total_customers from Customers;

-- Find all unique regions in the Customers table.
select distinct Region from Customers;

-- Show products priced above ₹1000.
Select * from Products where UnitPrice > 1000;

-- Display all products with their category names.
SELECT p.ProductName,c.CategoryName
FROM Products  p
JOIN Categories  c 
ON p.CategoryID = c.CategoryID;

-- INTERMEDIATE

-- Show customer name, order ID, and order date.
select c.CustomerName, o.OrderID, o.OrderDate
from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID;

-- Display all products purchased by Ravi Sharma.
select p.ProductName
from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where c.CustomerName = 'Ravi Sharma';

-- Find total quantity of products sold in each order.
select OrderId, sum(Quantity) as total_quantity from OrderDetails group by OrderID;
select o.OrderID, sum(od.Quantity) as total_quantity  from Orders o 
join OrderDetails od on o.OrderID = od.OrderID
group by o.OrderID;

-- Calculate revenue for each order (Quantity × UnitPrice × (1-Discount)).
select o.OrderID , 
round(sum(p.UnitPrice* od.Quantity *(1- od.Discount)), 2) as revenue
from Orders o
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
group by o.OrderID;

-- List categories and count of products in each.
select c.CategoryName, count(p.ProductID) as ProductCount
from Categories c
join Products p on c.CategoryID = p.CategoryID
group by c.CategoryName;

-- Find customers who placed more than one order.
select c.CustomerName, count(o.OrderID) as ordercount
from Customers c
join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerName
having count(o.OrderID) > 1;

-- Show total sales amount for each region.
select o.Region, 
round(sum(od.Quantity * p.UnitPrice * (1 - od.Discount)), 2) as TotalSales
from Orders o
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductId
group by o.Region;

-- Find the most expensive product in each category.
select c.CategoryName, p.ProductName, p.UnitPrice
from Products p
join Categories c on p.CategoryID = c.CategoryID
where p.UnitPrice = (
			select max(p2.UnitPrice)
            from Products p2
            where p2.CategoryID = p.CategoryID
);

-- Display top 3 products by total revenue.
select p.ProductName, 
round(sum(od.Quantity * p.UnitPrice * (1- od.Discount)), 2) as revenue
from OrderDetails od
join Products p on od.ProductID = p.ProductID
group by p.ProductName
order by Revenue desc
limit 3;


-- Find all orders containing products from more than one category.
select o.OrderId
from Orders o
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = od.ProductID
group by o.OrderID
having count(distinct p.CategoryID) > 1;