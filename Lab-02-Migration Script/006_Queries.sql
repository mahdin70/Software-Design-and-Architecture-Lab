use report_sale;

# Task - A
DELIMITER //
CREATE PROCEDURE get_top_3_products()
BEGIN
    SELECT *
    FROM dim_product
    ORDER BY average_rating DESC
    LIMIT 3;
END //
DELIMITER ;

CALL get_top_3_products();


# Task - B
DELIMITER //
CREATE PROCEDURE get_top_2_categories()
BEGIN
    SELECT *
    FROM dim_category
    ORDER BY total_sale DESC
    LIMIT 2;
END //
DELIMITER ;

CALL get_top_2_categories();


# Task - C
DELIMITER //
CREATE PROCEDURE get_top_product_by_duration(IN start_date DATETIME, IN end_date DATETIME)
BEGIN
    SELECT dp.*
    FROM dim_product dp
    JOIN (
        SELECT fs.product_id
        FROM fact_sale fs
        WHERE fs.Datetime BETWEEN start_date AND end_date
        GROUP BY fs.product_id
        ORDER BY MAX(fs.average_rating) DESC
        LIMIT 1
    ) AS subquery ON dp.product_id = subquery.product_id;
END //
DELIMITER ;

CALL get_top_product_by_duration('2024-02-04 00:00:00', '2024-02-07 23:59:59');


# Task - D
DELIMITER //
CREATE PROCEDURE get_top_product_by_category(IN cat_id INT)
BEGIN
    SELECT *
    FROM dim_product
    WHERE cat_id = category_id
    ORDER BY average_rating DESC
    LIMIT 1;
END //
DELIMITER ;

CALL get_top_product_by_category(3);

# Task - E
DELIMITER //
CREATE PROCEDURE get_top_employee_by_duration(IN start_date DATETIME, IN end_date DATETIME)
BEGIN
    SELECT e.*
    FROM dim_employee e
    JOIN (
        SELECT employee_id
        FROM fact_sale
        WHERE Datetime BETWEEN start_date AND end_date
        GROUP BY employee_id
        ORDER BY SUM(quantity * unit_price) DESC
        LIMIT 1
    ) fs ON e.employee_id = fs.employee_id;
END //
DELIMITER ;

CALL get_top_employee_by_duration('2024-02-04 00:00:00', '2024-02-07 23:59:59');
