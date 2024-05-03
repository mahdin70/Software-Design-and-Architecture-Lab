USE kids_shop;

INSERT INTO report_sale.dim_category (category_id, name)
SELECT id, name
FROM category;

INSERT INTO report_sale.dim_product (product_id, name, category_id, average_rating, price, sale_count)
SELECT id, name, category_id, average_rating, price, sale_count
FROM product;

INSERT INTO report_sale.dim_customer (customer_id, name)
SELECT CUSTOMER_ID, NAME
FROM CUSTOMER;


INSERT INTO report_sale.dim_employee (employee_id, name, salary)
SELECT EMPLOYEE_ID, NAME, SALARY
FROM EMPLOYEE;

INSERT INTO report_sale.DIM_INVOICE (INVOICE_ID, CUSTOMER_ID, EMPLOYEE_ID, INVOICE_TIMESTAMP)
SELECT INVOICE_ID, CUSTOMER_ID, EMPLOYEE_ID, INVOICE_TIMESTAMP
FROM INVOICE;


INSERT INTO report_sale.DIM_SALE (SALE_ID, INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, Datetime)
SELECT SALE_ID, INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, Datetime
FROM SALE;

INSERT INTO report_sale.fact_sale (sale_id, invoice_id, product_id, quantity, unit_price, category_id, Datetime, employee_id)
SELECT sale_id, invoice_id, product_id, quantity, unit_price, category_id, Datetime, employee_id
FROM SALE;

insert into change_log  (created_by, script_name, script_details) VALUES ('MAHDIN MUKIT', '005_REPORTING_DB_Populate.sql', 'reporting db populate');


UPDATE report_sale.dim_category
SET total_sale = (
    SELECT COALESCE(SUM(quantity * unit_price), 0)
    FROM report_sale.fact_sale
    WHERE dim_category.category_id = fact_sale.category_id
);

UPDATE report_sale.dim_category
SET average_rating = (
    SELECT AVG(average_rating)
    FROM report_sale.dim_product
    WHERE dim_category.category_id = dim_product.category_id
);

ALTER TABLE report_sale.fact_sale
ADD COLUMN average_rating DOUBLE NOT NULL DEFAULT 0;

UPDATE report_sale.fact_sale fs
SET fs.average_rating = (
    SELECT dp.average_rating
    FROM report_sale.dim_product dp
    WHERE fs.product_id = dp.product_id
);
