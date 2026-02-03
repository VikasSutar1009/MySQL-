CREATE DATABASE sales_ai;

USE sales_ai;

CREATE TABLE sales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product VARCHAR(50),
  amount DECIMAL(10,2),
  sale_date DATE
);

INSERT INTO sales (product, amount, sale_date) VALUES
('Laptop', 50000, '2025-01-05'),
('Mobile', 20000, '2025-01-10'),
('Laptop', 45000, '2025-02-02');

select * from sales;