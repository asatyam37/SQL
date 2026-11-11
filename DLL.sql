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

