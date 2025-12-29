-- Insert a product order item
DELIMITER //
CREATE OR REPLACE PROCEDURE insert_order_item_product(
    IN order_id INT,
    IN product_id INT,
    IN quantity INT,
    IN is_from_menu BOOLEAN
)
BEGIN

    DECLARE price DECIMAL(10, 2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting product order item';
    END;

    START TRANSACTION;

    -- BR 10 Price of order items
    IF is_from_menu THEN
        SET price = 0;
    ELSE
        SELECT p.price INTO price
        FROM products p
        WHERE p.id = product_id;
    END IF;

    -- BR 11 Quantity of order items
    IF EXISTS (
        SELECT 1
        FROM order_item_products oip
        WHERE order_id = oip.order_id 
          AND product_id = oip.product_id 
          AND is_from_menu = oip.is_from_menu
    )
    THEN
        UPDATE order_item_products oip
        SET quantity = oip.quantity + quantity
        WHERE order_id = oip.order_id 
          AND product_id = oip.product_id 
          AND is_from_menu = oip.is_from_menu;
    ELSE
        INSERT INTO order_item_products(price, quantity, order_id, product_id, is_from_menu)
        VALUES (price, quantity, order_id, product_id, is_from_menu);
    END IF;

END //
DELIMITER ;

-- Insert a menu order item
DELIMITER //
CREATE OR REPLACE PROCEDURE insert_order_item_menu(
    IN order_id INT,
    IN menu_id INT,
    IN quantity INT,
    IN drink_id INT -- NULL if no drink is requested
)
BEGIN

    DECLARE price DECIMAL(10, 2);
    DECLARE first_course_id INT;
    DECLARE second_course_id INT;
    DECLARE dessert_id INT;
    DECLARE error_invalid_drink BOOLEAN;

    START TRANSACTION;

    -- BR 10 Price of order items
    SELECT m.price INTO price
    FROM menus m
    WHERE m.id = menu_id;

    SET first_course_id = get_product_by_category_in_menu(menu_id, 'First Course');
    SET second_course_id = get_product_by_category_in_menu(menu_id, 'Second Course');
    SET dessert_id = get_product_by_category_in_menu(menu_id, 'Dessert');

    -- BR 11 Quantity of order items
    IF drink_id IS NULL OR 
       (SELECT p.category_id FROM products p WHERE p.id = drink_id) = 
       (SELECT c.id FROM categories c WHERE c.name = 'Drink') 
    THEN

        IF EXISTS (
            SELECT 1 
            FROM order_item_menus oim 
            WHERE order_id = oim.order_id 
              AND menu_id = oim.menu_id
        ) THEN
            UPDATE order_item_menus oim
            SET quantity = oim.quantity + quantity
            WHERE order_id = oim.order_id 
              AND menu_id = oim.menu_id;
        ELSE
            INSERT INTO order_item_menus(price, order_id, menu_id, quantity)
            VALUES (price, order_id, menu_id, quantity);
        END IF;

        -- BR 08 Orders with menus
        CALL insert_order_item_product(order_id, first_course_id, quantity, TRUE);
        CALL insert_order_item_product(order_id, second_course_id, quantity, TRUE);
        CALL insert_order_item_product(order_id, dessert_id, quantity, TRUE);

        IF drink_id IS NOT NULL THEN
            CALL insert_order_item_product(order_id, drink_id, quantity, TRUE);
        END IF;

    ELSE
        SET error_invalid_drink = TRUE;
    END IF;

    IF error_invalid_drink THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot include a non-drink product in a menu';
    ELSE
        COMMIT;
    END IF;

END //
DELIMITER ;

-- BR 04 Walk-in customers
DELIMITER //
CREATE OR REPLACE PROCEDURE insert_walkin(IN num_people INT)
BEGIN

    INSERT INTO reservations(created_at, reservation_date, number_of_people)
    VALUES (NOW(), NOW(), num_people);

END//
DELIMITER ;