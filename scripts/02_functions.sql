-- BR 06 Order status
DELIMITER //
CREATE OR REPLACE FUNCTION get_order_status(supplier_order_id INT)
RETURNS VARCHAR(50)
BEGIN
    DECLARE status VARCHAR(50);

    IF (SELECT arrival_date FROM supplier_orders WHERE id = supplier_order_id) IS NOT NULL THEN
        SET status = 'Delivered';
    ELSE
        SET status = 'Requested';
    END IF;

    RETURN status;
END //
DELIMITER ;

-- BR 09 Ingredient stock
DELIMITER //
CREATE OR REPLACE FUNCTION get_ingredient_stock(ingredient_id INT) 
RETURNS INT
BEGIN
    DECLARE ordered_quantity INT;
    DECLARE used_quantity INT;
    
    SELECT COALESCE(SUM(oi.quantity), 0) INTO ordered_quantity
    FROM order_ingredients oi
    JOIN ingredients i ON oi.ingredient_id = i.id
    WHERE i.id = ingredient_id
      AND get_order_status(oi.supplier_order_id) = 'Delivered'
      COLLATE UTF8MB4_GENERAL_CI;
    
    SELECT COALESCE(SUM(oip.quantity * ip.quantity), 0) INTO used_quantity
    FROM order_item_products oip
    JOIN ingredient_products ip ON oip.product_id = ip.product_id
    JOIN ingredients i ON ip.ingredient_id = i.id
    WHERE i.id = ingredient_id;
    
    RETURN ordered_quantity - used_quantity;      
END //
DELIMITER ;

-- BR 07 Order preparation time
DELIMITER //
CREATE OR REPLACE FUNCTION get_order_preparation_time(order_id INT) 
RETURNS INT
BEGIN
    DECLARE max_time INT;
    
    SELECT MAX(p.preparation_time) INTO max_time
    FROM order_item_products oip
    JOIN orders o ON oip.order_id = o.id
    JOIN products p ON oip.product_id = p.id
    WHERE o.id = order_id;
    
    RETURN max_time;
END//
DELIMITER ;

-- BR 03 Total order amount
DELIMITER //
CREATE OR REPLACE FUNCTION get_order_total_amount(order_id INT) 
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total_products DECIMAL(10,2);
    DECLARE total_menus DECIMAL(10,2);
    
    SELECT COALESCE(SUM(oip.price * oip.quantity), 0)
    INTO total_products
    FROM order_item_products oip
    WHERE oip.order_id = order_id;
    
    SELECT COALESCE(SUM(oim.price * oim.quantity), 0)
    INTO total_menus
    FROM order_item_menus oim
    WHERE oim.order_id = order_id;
    
    RETURN total_products + total_menus;
END//
DELIMITER ;

-- Helper function to identify a product category inside a menu, used in insert_order_item_menu
DELIMITER //
CREATE OR REPLACE FUNCTION get_product_by_category_in_menu(
    menu_id INT,
    category_name VARCHAR(255)
) 
RETURNS INT 
BEGIN
    RETURN (
        SELECT pm.product_id
        FROM product_menus pm
        JOIN products p ON pm.product_id = p.id
        JOIN categories c ON p.category_id = c.id
        WHERE pm.menu_id = menu_id
          AND c.name = category_name
    );
END//
DELIMITER ;
