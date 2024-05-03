USE kids_shop;

#ADDING THE REDUNDANT COLUMNS
ALTER TABLE category ADD COLUMN total_sale DOUBLE NOT NULL DEFAULT 0;
ALTER TABLE category ADD COLUMN average_rating DOUBLE NOT NULL DEFAULT 0;

ALTER TABLE product ADD COLUMN sale_count INT NOT NULL DEFAULT 0;

ALTER TABLE sale ADD COLUMN category_id INT NOT NULL REFERENCES category(id);
ALTER TABLE sale ADD COLUMN Datetime DATETIME NOT NULL DEFAULT NOW();
ALTER TABLE sale ADD COLUMN employee_id INT NOT NULL REFERENCES employee(employee_id);

ALTER TABLE invoice ADD COLUMN total_price DOUBLE NOT NULL DEFAULT 0;




-- Adding invoice data  for the customer
INSERT INTO invoice (customer_id, employee_id, total_price) VALUES (2, 4, 15000);
INSERT INTO invoice (customer_id, employee_id, total_price) VALUES (3, 2, 12000);
INSERT INTO invoice (customer_id, employee_id, total_price) VALUES (4, 3, 8000);
INSERT INTO invoice (customer_id, employee_id, total_price) VALUES (5, 4, 20000);


-- Adding  sale data
INSERT INTO sale (invoice_id, product_id, quantity, unit_price, category_id, Datetime, employee_id)
VALUES (3, 3, 1, 8000, 3, NOW(), 2);
INSERT INTO sale (invoice_id, product_id, quantity, unit_price, category_id, Datetime, employee_id)
VALUES (4, 1, 3, 9000, 1, NOW(), 4);
INSERT INTO sale (invoice_id, product_id, quantity, unit_price, category_id, Datetime, employee_id)
VALUES (5, 4, 2, 10000, 2, NOW(), 2);
INSERT INTO sale (invoice_id, product_id, quantity, unit_price, category_id, Datetime, employee_id)
VALUES (6, 3, 1, 6000, 3, NOW(), 4);




#PROCEDURE : GET SALE PER CATEGORY

DELIMITER //

CREATE PROCEDURE GET_SALE_PER_CATEGORY(IN EMPLOYEE_ID INT)
BEGIN
    SELECT C.ID, C.NAME, SUM(S.QUANTITY) AS TOTAL_SALES
    FROM SALE S
    JOIN CATEGORY C ON S.CATEGORY_ID = C.ID
    WHERE S.EMPLOYEE_ID = EMPLOYEE_ID
    GROUP BY C.ID;
END //

DELIMITER ;


CALL GET_SALE_PER_CATEGORY(2);



#PROCEDURE : SET SELL PER CATEGORY

DELIMITER //

CREATE PROCEDURE SET_SELL_PER_CATEGORY(IN PRODUCT_ID INT, IN CATEGORY_ID INT)
BEGIN
    UPDATE PRODUCT
    SET CATEGORY_ID = CATEGORY_ID
    WHERE ID = PRODUCT_ID;
END //

DELIMITER ;
CALL SET_SELL_PER_CATEGORY(3, 1);

INSERT INTO change_log (created_by, script_name, script_details) VALUES ('MAHDIN MUKIT', '003_B2_SALE_CATEGORY.sql', 'COMPLETION OF THE B2 TASK');