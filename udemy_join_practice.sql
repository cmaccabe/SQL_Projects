CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50)
);
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_date DATE,
  amount DECIMAL (8, 2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
-- created tables to work through joining multiple tables
-- added reference between table with primary and foregin keys
INSERT INTO
  customers (first_name, last_name, email)
VALUES
  ('Boy', 'George', 'george@gmail.com'),
  ('George', 'Michael', 'gm@gmail.com'),
  ('David', 'Bowie', 'david@gmail.com'),
  ('Blue', 'Steele', 'blue@gmail.com'),
  ('Bette', 'Davis', 'bette@gmail.com');
INSERT INTO
  orders (order_date, amount, customer_id)
VALUES
  ('2016-02-10', 99.99, 1),
  ('2017-11-11', 35.50, 1),
  ('2014-12-12', 800.67, 2),
  ('2015-01-03', 12.50, 2),
  ('1999-04-11', 450.25, 5);
-- inserted table values to work through commands
SELECT
  first_name,
  last_name,
  order_date,
  amount
FROM
  customers
  JOIN orders ON customers.id = orders.customer_id;
-- inner join of tables to get customer order information
SELECT
  first_name,
  last_name,
  SUM(amount) AS total
FROM
  customers
  JOIN orders ON orders.customer_id = customers.id
GROUP BY
  first_name,
  last_name
ORDER BY
  total;
-- pulled some of orders for each customer 
SELECT
  first_name,
  last_name,
  IFNULL(SUM(amount), 0) AS money_spent
FROM
  customers
  LEFT JOIN orders ON orders.customer_id = customers.id
GROUP BY
  first_name,
  last_name;
-- left join to see which customers have never placed orders
-- Made null values read as 0 if present