CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY, -- PRIMARY KEY means value cannot be null and must be unique 
    department_name VARCHAR(50) NOT NULL,
);

-- ! DDL (Data Definition Language)

-- INSERT INTO departments (department_name)
-- VALUES
-- ('Sales'),
-- ('Support'),
-- ('Warehouse');

-- SELECT * FROM departments;

-- INSERT INTO departments (department_id, department_name)
-- VALUES
-- (7, 'TECH');

-- SELECT * FROM departments;

-- --a table of department is created 
-- -- the table contains columnm, column is created like department_id, department_name
-- -- varchar means cariable character i.e., how many variable characters can be stored
-- -- serial update or increment the id by 1
-- -- only postgres uses SERIAL, whereas mysql uses AUTOINCREMENT
-- -- NOT NULL IS USED, so if there is a null value in department name there will be errror


CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY, --  cannot be NULL it is unique 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    bio TEXT,
    job_title VARCHAR(50) NOT NULL,
    salary INT NOT NULL CHECK (salary > 0), 
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    hire_date DATE NOT NULL,
    last_login  TIMESTAMP,
    employee_status VARCHAR(20) NOT NULL DEFAULT 'active', 
                    CHECK ( 
                        employee_status IN ('active', 'on_leave', 'terminated')
                    ),             --active, leave, terminated
                    created_at TIMESTAMP NOT NULL DEFAULT now(),
    department_id INT REFERENCES departments(department_id),
    manager_id INT REFERENCES employees(employee_id)
);

INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date)
VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, 1,    '2020-06-15'),
    ('Fake',   'Robert',    'robert.chen@techbazaar.com',     1, 'Rep',                  50000.00, 1,    '2024-01-01'),
    ('Marcus', 'Webb',      'marcus.webb@techbazaar.com',     1, 'Sales Representative', 58000.00, 1,    '2021-09-01'),
    ('Elena',  'Garcia',    'elena.garcia@techbazaar.com',    1, 'Senior Sales Rep',     68000.00, 1,    '2019-11-20'),
    ('James',  'Okafor',    'james.okafor@techbazaar.com',    2, 'Support Lead',         72000.00, NULL, '2018-05-10'),
    ('Lily',   'Zhang',     'lily.zhang@techbazaar.com',      2, 'Support Agent',        48000.00, 5,    '2022-02-14'),
    ('Diego',  'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent',        46000.00, 5,    '2023-01-09'),
    ('Sara',   'Osei',      'sara.osei@techbazaar.com',       5, 'Warehouse Lead',       55000.00, NULL, '2020-08-23');


SELECT * FROM employees;

SELECT * FROM departments;

INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date)
VALUES (NULL, 'NoFirstName', 'nofirstname.demo@exaample.com', 1, 'Rep', 50000.00, '2024-01-01');

INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date)
VALUES ('Fake', 'Robert', 'robert.chen@techbazaar.com', 1, 'Rep', 50000.00, '2024-01-01');


INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date)
VALUES ('Unpaid', 'Intern', 'unpaid.demo@example.com', 1, 'Intern', 0, '2024-01-01');

INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date, employee_status)
VALUES ('Bad', 'Status', 'badstatus.demo@example.com', 1, 'Rep', 50000.00, '2024-01-01', 'retired');





ALTER TABLE employees
ADD COLUMN internal_note VARCHAR(100) NOT NULL DEFAULT'N/A';

SELECT * FROM employees;

ALTER TABLE employees
RENAME COLUMN internal_note TO hr_note

ALTER TABLE employees
DROP COLUMN hr_note

-- ! INSERT < UPDATE < DELETE are called as DML - Data Manipulation Language

INSERT INTO customers
(
    first_name, 
    last_name, 
    email,
    phone,
    city,
    country
)
VALUES
(
    'John',
    'Doe',
    'john.doe@gmail.com',
    '9999999999',
    'Mumbai',
    'India'
);

SELECT * FROM customers

INSERT INTO categories
(
    category_name,
    description
)
VALUES
('Dairy', 'Dairy Products'),
('Gym', 'Gym Products'),
('Cold Drinks', 'Clothers description');

SELECT * FROM products;


UPDATE products
SET stock_quantity = 50  -- this will update stock_quantity all to 50
WHERE product_id = 1; -- this will help update stock_quantity with id = 1 only

UPDATE products 
SET is_active = FALSE;

UPDATE products
SET price = price + 100;

UPDATE products
SET price = price + 200
WHERE product_id = 3;

SELECT * FROM departments; 

DELETE FROM departments
WHERE department_id = 4;

SELECT * FROM orders;

-- order_item_id: 1, 2
SELECT * FROM order_items
WHERE order_id = 1;

DELETE FROM orders
WHERE order_id = 1;


-- ! DQL : DISTINCT, WHERE, >, <, =, AND, OR, IN, BETWEEN LIKE, AS, ORDER BY, LIMIT, OFFSET, ASC, DESC

SELECT * FROM products;
SELECT 
        product_id, 
        product_name AS "Product Name", 
        stock_quantity 
FROM products;



SELECT * FROM customers;

SELECT DISTINCT country FROM customers;

SELECT * 
FROM products 
WHERE price > 200;


-- Give me products having stock qty > 0 and price < 150

SELECT * FROM products
WHERE stock_quantity > 0 
    AND price > 150;

-- Give me products having 0 as stock_quantity or price < 150

SELECT * FROM products
WHERE stock_quantity = 0
    OR PRICE < 150;


-- Give me products which are not active

SELECT * FROM products
WHERE is_active = FALSE; -- or we can use WHERE NOT is_active

-- Give me product having price > 120 and price < 200

SELECT * FROM products
WHERE price > 120 AND price < 200;

SELECT * FROM products
WHERE price BETWEEN 120 AND 200;

SELECT * FROM categories;


SELECT * FROM products
WHERE category_id = 1 
OR category_id = 3
OR category_id = 4;

SELECT * FROM products
WHERE category_id IN (1, 3, 4, 5);


-- ! give me product having product name
-- ! starting with "wireless"
-- ! wireless headphones
-- ! wireless mouse


INSERT INTO products(product_name, price, stock_quantity, category_id)
VALUES
('Wireless keyboard', 100, 20, 1),
('Wireless light', 200, 0, 1),
('Wireless headphones', 150, 0, 1);

SELECT * FROM products
WHERE product_name LIKE 'Wireless M%'

SELECT * FROM products
WHERE product_name LIKE '%less%';

--! Give me customers who doesn't have phone number

SELECT * FROM customers

SELECT * FROM customers
WHERE phone IS NOT NULL;


SELECT 
    first_name,
    last_name,
    COALESCE(phone, 'Phone number unavailable') AS phone_num,
    COALESCE(city, 'No city') AS city_name
FROM customers;

-- ! Give me products from cheapest to expensive order

SELECT * FROM products
ORDER BY price ASC; --- ASC : ascending order, DESC : Descending Order 

-- ! Give me product from cheap to exp price for each category

SELECT * FROM products
ORDER BY category_id DESC, price ASC;


-- ! Give me top 5 most exprensive products

SELECT * FROM products
ORDER by price DESC
LIMIT 5;

-- ! PAGENATION

SELECT * FROM products
ORDER BY product_id
LIMIT 10
OFFSET 20; -- OFFSET: How many  rows to be  skipped


FE: page: 1, 2, 3

p: 1: OFFSET: 0 
p: 2: OFFSET: 10 
p: 3: OFFSET: 10 + 10: 20

offset = (page - 1) * LIMIT

