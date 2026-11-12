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