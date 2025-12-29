-- BR 05 Each menu must have one product of each category (first, second, dessert)
DELIMITER //
CREATE OR REPLACE TRIGGER one_product_per_category_in_menu 
BEFORE INSERT ON product_menus 
FOR EACH ROW
BEGIN
    DECLARE inserted_product ROW TYPE OF products;
    DECLARE inserting_menu ROW TYPE OF menus;
    DECLARE category_count INT;

    -- Identify the product being inserted
    SELECT * INTO inserted_product 
    FROM products
    WHERE NEW.product_id = products.id;

    -- Identify the menu where the product is inserted
    SELECT * INTO inserting_menu
    FROM menus
    WHERE NEW.menu_id = menus.id;

    -- Count products of the same category already in the menu
    SELECT COALESCE(COUNT(*), 0) INTO category_count
    FROM product_menus pm
    JOIN products p ON pm.product_id = p.id
    WHERE inserted_product.category_id = p.category_id 
      AND pm.menu_id = inserting_menu.id;

    -- Ensure no other product of the same category exists in the menu
    IF category_count > 0 THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "A product of this category already exists in the menu";
    END IF;

    -- Ensure no fixed drinks are inserted in a menu
    IF inserted_product.category_id = (SELECT c.id FROM categories c WHERE c.name = 'Drink') THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Fixed drinks cannot be inserted in a menu";
    END IF;
END //
DELIMITER ;

-- BR 02 Changes in reservations
DELIMITER //
CREATE OR REPLACE TRIGGER reservation_update_check 
BEFORE UPDATE ON reservations
FOR EACH ROW
BEGIN
    DECLARE hours_remaining INT;

    -- Calculate remaining time in hours
    SELECT TIMESTAMPDIFF(HOUR, NOW(), OLD.reservation_date) INTO hours_remaining;

    -- Prevent modification if less than 6 hours remain
    IF hours_remaining < 6 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation cannot be modified with less than 6 hours remaining';
    END IF;
END //
DELIMITER ;

-- BR 01 Advance notice for reservations
DELIMITER //
CREATE OR REPLACE TRIGGER reservation_advance_notice 
BEFORE INSERT ON reservations 
FOR EACH ROW
BEGIN
    DECLARE warning_text TEXT;
    DECLARE can_insert BOOL DEFAULT TRUE;

    IF NEW.customer_id IS NOT NULL THEN
        IF TIMESTAMPDIFF(DAY, NEW.created_at, NEW.reservation_date) < 1 THEN
            SET warning_text = 'Minimum notice for a reservation is 1 day';
            SET can_insert = FALSE;
        END IF;
        IF TIMESTAMPDIFF(DAY, NEW.created_at, NEW.reservation_date) > 30 THEN
            SET warning_text = 'Maximum advance for a reservation is 30 days';
            SET can_insert = FALSE;
        END IF;
    END IF;

    IF can_insert IS FALSE THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = warning_text;
    END IF;
END //
DELIMITER ;

-- BR 12 Insufficient stock on insert
DELIMITER //
CREATE OR REPLACE TRIGGER check_insufficient_stock_insert 
BEFORE INSERT ON order_item_products
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM ingredients i
        JOIN ingredient_products ip ON i.id = ip.ingredient_id
        WHERE ip.quantity * NEW.quantity > get_ingredient_stock(i.id) 
          AND ip.product_id = NEW.product_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for some ingredients of this product';
    END IF;
END //
DELIMITER ;

-- BR 12 Insufficient stock on update
DELIMITER //
CREATE OR REPLACE TRIGGER check_insufficient_stock_update 
BEFORE UPDATE ON order_item_products
FOR EACH ROW
BEGIN
    IF NEW.quantity > OLD.quantity AND EXISTS (
        SELECT 1
        FROM ingredients i
        JOIN ingredient_products ip ON i.id = ip.ingredient_id
        WHERE ip.quantity * (NEW.quantity - OLD.quantity) > get_ingredient_stock(i.id) 
          AND ip.product_id = NEW.product_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for some ingredients of this product';
    END IF;
END //
DELIMITER ;
