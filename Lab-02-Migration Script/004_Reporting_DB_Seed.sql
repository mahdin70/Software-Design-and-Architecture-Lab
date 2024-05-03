create database report_sale;

use report_sale;

-- Dimension Tables
CREATE TABLE dim_category (
    category_id INT PRIMARY KEY,
    name VARCHAR(100),
    total_sale DOUBLE NOT NULL DEFAULT 0,
    average_rating decimal(3,2) NOT NULL DEFAULT 0
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT NOT NULL,
    average_rating DOUBLE NOT NULL DEFAULT 0,
    price DOUBLE NOT NULL,
    sale_count INT NOT NULL DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id)
);

CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE dim_employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    salary INT NOT NULL
);

CREATE TABLE DIM_INVOICE(
    INVOICE_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    EMPLOYEE_ID INT NOT NULL,
    INVOICE_TIMESTAMP TIMESTAMP NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES DIM_CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES DIM_EMPLOYEE(EMPLOYEE_ID)
);

CREATE TABLE DIM_SALE(
    SALE_ID INT AUTO_INCREMENT PRIMARY KEY,
    INVOICE_ID INT NOT NULL,
    PRODUCT_ID INT NOT NULL,
    QUANTITY INT NOT NULL,
    UNIT_PRICE INT NOT NULL,
    Datetime DATETIME NOT NULL,
    FOREIGN KEY (INVOICE_ID) REFERENCES DIM_INVOICE(INVOICE_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES DIM_product(PRODUCT_ID)
);

CREATE TABLE fact_sale (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price INT NOT NULL,
    category_id INT NOT NULL,
    Datetime DATETIME NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES DIM_SALE(SALE_ID),
    FOREIGN KEY (invoice_id) REFERENCES DIM_invoice(invoice_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
    FOREIGN KEY (employee_id) REFERENCES dim_employee(employee_id)
);

insert into kids_shop.change_log  (created_by, script_name, script_details) VALUES ('MAHDIN MUKIT', '004_REPORTING_DB_SEED.sql', 'reporting db');

