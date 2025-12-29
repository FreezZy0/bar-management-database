-- Ingredients
INSERT INTO ingredients (name) VALUES ('Potato');
INSERT INTO ingredients (name) VALUES ('Olive oil');
INSERT INTO ingredients (name) VALUES ('Egg');
INSERT INTO ingredients (name) VALUES ('Iberian ham');
INSERT INTO ingredients (name) VALUES ('Manchego cheese');
INSERT INTO ingredients (name) VALUES ('Tomato');
INSERT INTO ingredients (name) VALUES ('Bread');
INSERT INTO ingredients (name) VALUES ('Chorizo');
INSERT INTO ingredients (name) VALUES ('Octopus');
INSERT INTO ingredients (name) VALUES ('Prawns');
INSERT INTO ingredients (name) VALUES ('Peppers');
INSERT INTO ingredients (name) VALUES ('Chocolate');
INSERT INTO ingredients (name) VALUES ('Pastry cream');
INSERT INTO ingredients (name) VALUES ('Sugar');
INSERT INTO ingredients (name) VALUES ('Milk');
INSERT INTO ingredients (name) VALUES ('Red wine');
INSERT INTO ingredients (name) VALUES ('Beer');
INSERT INTO ingredients (name) VALUES ('Olives');
INSERT INTO ingredients (name) VALUES ('Garlic');
INSERT INTO ingredients (name) VALUES ('Lemon');
INSERT INTO ingredients (name) VALUES ('Butter');
INSERT INTO ingredients (name) VALUES ('Flour');
INSERT INTO ingredients (name) VALUES ('Salt');
INSERT INTO ingredients (name) VALUES ('Pepper');
INSERT INTO ingredients (name) VALUES ('Chicken');
INSERT INTO ingredients (name) VALUES ('Beef');
INSERT INTO ingredients (name) VALUES ('Cod');
INSERT INTO ingredients (name) VALUES ('Rice');
INSERT INTO ingredients (name) VALUES ('Basil');
INSERT INTO ingredients (name) VALUES ('Cream');
INSERT INTO ingredients (name) VALUES ('Coca Cola');
INSERT INTO ingredients (name) VALUES ('Mineral water');
INSERT INTO ingredients (name) VALUES ('Diamante Champagne');

-- Suppliers 
INSERT INTO suppliers (name, tax_id) VALUES ('Distribuciones García', 'A12345678');
INSERT INTO suppliers (name, tax_id) VALUES ('Suministros López', 'B87654321');
INSERT INTO suppliers (name, tax_id) VALUES ('Comercial Martínez', 'C23456789');
INSERT INTO suppliers (name, tax_id) VALUES ('Alimentación Ruiz', 'D34567890');
INSERT INTO suppliers (name, tax_id) VALUES ('Abastecedores Pérez', 'E45678901');

-- Supplier orders
INSERT INTO supplier_orders (order_date, arrival_date, supplier_id) VALUES ('2023-10-01 08:00:00', '2023-10-03 10:00:00', 1);
INSERT INTO supplier_orders (order_date, arrival_date, supplier_id) VALUES ('2023-11-15 11:00:00', '2023-11-17 14:00:00', 2);
INSERT INTO supplier_orders (order_date, arrival_date, supplier_id) VALUES ('2024-02-20 09:00:00', '2024-02-22 12:00:00', 3);
INSERT INTO supplier_orders (order_date, arrival_date, supplier_id) VALUES ('2024-04-05 13:00:00', '2024-04-27 12:00:00', 1);
INSERT INTO supplier_orders (order_date, arrival_date, supplier_id) VALUES ('2024-06-10 10:00:00', '2024-06-22 15:00:00', 4);
INSERT INTO supplier_orders (order_date, arrival_date, supplier_id) VALUES ('2024-08-01 08:00:00', NULL, 5);

-- Ingredients in orders  
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (5000, 1, 1); -- Potato
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 2, 1); -- Olive oil
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (3000, 3, 1); -- Egg
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (500, 4, 1); -- Iberian ham
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 5, 2); -- Manchego cheese
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (2000, 6, 2); -- Tomato
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1050, 7, 2); -- Bread
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 8, 6); -- Chorizo
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (4000, 9, 3); -- Octopus
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (3000, 10, 3); -- Prawns
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1500, 11, 4); -- Peppers
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 12, 4); -- Chocolate
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (2000, 13, 4); -- Pastry cream
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1500, 14, 5); -- Sugar
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (4000, 15, 5); -- Milk
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (500, 16, 5); -- Red wine
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (2000, 17, 1); -- Beer
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 18, 2); -- Olives
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (500, 19, 5); -- Garlic
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 20, 5); -- Lemon
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 21, 1); -- Butter
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (3000, 22, 2); -- Flour
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (500, 23, 2); -- Salt
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (200, 24, 6); -- Pepper
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (5000, 25, 3); -- Chicken
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (3000, 26, 2); -- Beef
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (2000, 27, 2); -- Cod
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (4000, 28, 2); -- Rice
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (200, 29, 6); -- Basil
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 30, 5); -- Cream
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (2000, 1, 3); -- Potato
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1500, 2, 3); -- Olive oil
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (2000, 3, 4); -- Egg
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (500, 4, 4); -- Iberian ham
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 5, 4); -- Manchego cheese
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1000, 6, 3); -- Tomato
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1050, 7, 3); -- Bread
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (500, 31, 2); -- Coca Cola
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (200, 32, 6); -- Mineral water
INSERT INTO order_ingredients (quantity, ingredient_id, supplier_order_id) VALUES (1, 33, 3); -- Diamante Champagne

-- Customers
INSERT INTO customers (name, phone) VALUES ('Juan Pérez', '600123456');
INSERT INTO customers (name, phone) VALUES ('María López', '601789012');
INSERT INTO customers (name, phone) VALUES ('Carlos García', '602345678');

-- Reservations
INSERT INTO reservations (created_at, reservation_date, number_of_people, customer_id) VALUES ('2023-10-10 14:00:00', '2023-10-15 20:00:00', 2, 1);
INSERT INTO reservations (created_at, reservation_date, number_of_people, customer_id) VALUES ('2024-02-05 12:00:00', '2024-02-10 19:00:00', 5, 2);
INSERT INTO reservations (created_at, reservation_date, number_of_people, customer_id) VALUES ('2024-05-20 10:00:00', '2024-05-25 14:00:00', 3, 3);
INSERT INTO reservations (created_at, reservation_date, number_of_people) VALUES ('2024-07-01 09:00:00', '2024-07-01 09:00:00', 4);
INSERT INTO reservations (created_at, reservation_date, number_of_people, customer_id) VALUES ('2024-09-15 11:00:00', '2024-09-20 21:00:00', 6, 1);
CALL insert_walkin(4);
INSERT INTO reservations (created_at, reservation_date, number_of_people) VALUES ('2024-02-29 23:00:00', '2024-02-29 23:00:00', 1);

-- Orders
INSERT INTO orders (order_date, reservation_id) VALUES ('2023-10-15 20:30:00', 1);
INSERT INTO orders (order_date, reservation_id) VALUES ('2024-02-10 19:30:00', 2);
INSERT INTO orders (order_date, reservation_id) VALUES ('2024-05-25 14:30:00', 3);
INSERT INTO orders (order_date, reservation_id) VALUES ('2024-07-06 09:45:00', 4);
INSERT INTO orders (order_date, reservation_id) VALUES ('2024-09-20 21:30:00', 5);
INSERT INTO orders (order_date, reservation_id) VALUES (NOW(), 6);
INSERT INTO orders (order_date, reservation_id) VALUES ('2024-02-29 23:05:00', 7);

-- Categories 
INSERT INTO categories (name) VALUES ('First Course');
INSERT INTO categories (name) VALUES ('Second Course');
INSERT INTO categories (name) VALUES ('Dessert');
INSERT INTO categories (name) VALUES ('Drink');

-- Products 
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Paella', 12.00, 30, 1);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Gazpacho', 6.00, 15, 1);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Seafood soup', 8.00, 20, 1);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Mixed salad', 5.00, 10, 1);

INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Galician-style octopus', 15.00, 20, 2);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Grilled sirloin', 18.00, 25, 2);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Cod pil-pil', 16.00, 25, 2);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Garlic chicken', 12.00, 20, 2);

INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Flan', 4.00, 5, 3);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Cheesecake', 5.00, 10, 3);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Ice cream', 3.50, 5, 3);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Brownie', 6.00, 15, 3);

INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Beer', 2.50, 1, 4);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Red wine', 5.00, 1, 4);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Coca Cola', 2.00, 1, 4);
INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Mineral water', 1.50, 1, 4);

INSERT INTO products (name, price, preparation_time, category_id) VALUES ('Diamante Champagne', 14999, 1, 4);

-- Menus
INSERT INTO menus (name, price) VALUES ('Daily Menu', 15.00);
INSERT INTO menus (name, price) VALUES ('Special Menu', 20.00);

-- Products in menus
INSERT INTO product_menus (product_id, menu_id) VALUES (1, 1); -- Paella in Daily Menu
INSERT INTO product_menus (product_id, menu_id) VALUES (5, 1); -- Galician-style octopus in Daily Menu
INSERT INTO product_menus (product_id, menu_id) VALUES (9, 1); -- Flan in Daily Menu
INSERT INTO product_menus (product_id, menu_id) VALUES (1, 2); -- Paella in Special Menu
INSERT INTO product_menus (product_id, menu_id) VALUES (6, 2); -- Grilled sirloin in Special Menu
INSERT INTO product_menus (product_id, menu_id) VALUES (10, 2); -- Cheesecake in Special Menu

-- Ingredients in products
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (300, 28, 1); -- Rice for Paella
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (100, 3, 1); -- Egg for Paella
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 4, 1); -- Iberian ham for Paella
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 10, 1); -- Prawns for Paella

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (500, 6, 2); -- Tomato for Gazpacho
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (10, 2, 2); -- Olive oil for Gazpacho

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (200, 10, 3); -- Prawns for Seafood soup
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (100, 9, 3); -- Octopus for Seafood soup
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 2, 3); -- Olive oil for Seafood soup

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (100, 6, 4); -- Tomato for Mixed salad
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 11, 4); -- Peppers for Mixed salad
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 18, 4); -- Olives for Mixed salad

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (500, 9, 5); -- Octopus for Galician-style octopus
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (20, 2, 5); -- Olive oil for Galician-style octopus
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (5, 23, 5); -- Salt for Galician-style octopus

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (300, 26, 6); -- Beef for Grilled sirloin
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (20, 2, 6); -- Olive oil for Grilled sirloin
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (5, 23, 6); -- Salt for Grilled sirloin

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (300, 27, 7); -- Cod for Cod pil-pil
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (20, 19, 7); -- Garlic for Cod pil-pil
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 2, 7); -- Olive oil for Cod pil-pil

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (500, 25, 8); -- Chicken for Garlic chicken
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (10, 19, 8); -- Garlic for Garlic chicken
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 2, 8); -- Olive oil for Garlic chicken

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (100, 15, 9); -- Milk for Flan
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 14, 9); -- Sugar for Flan
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (20, 3, 9); -- Egg for Flan

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (200, 15, 10); -- Milk for Cheesecake
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (100, 14, 10); -- Sugar for Cheesecake
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 5, 10); -- Manchego cheese for Cheesecake

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 12, 11); -- Chocolate for Ice cream
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 15, 11); -- Milk for Ice cream
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (20, 14, 11); -- Sugar for Ice cream

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (100, 12, 12); -- Chocolate for Brownie
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 14, 12); -- Sugar for Brownie
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (50, 22, 12); -- Butter for Brownie

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (1, 17, 13); -- Beer for Beer
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (1, 16, 14); -- Red wine for Red wine
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (1, 31, 15); -- Coca Cola for Coca Cola
INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (1, 32, 16); -- Mineral water for Mineral water

INSERT INTO ingredient_products (quantity, ingredient_id, product_id) VALUES (1, 33, 17); -- Diamante Champagne for Diamante Champagne

-- Menu order items
CALL insert_order_item_menu(1, 1, 2, 13); -- Two Daily Menus with Beer
CALL insert_order_item_menu(2, 2, 1, NULL); -- One Special Menu without drink
CALL insert_order_item_menu(3, 1, 3, 14); -- Three Daily Menus with Red wine
CALL insert_order_item_menu(3, 2, 1, 15); -- Three Special Menus with Coca Cola

-- Product order items
CALL insert_order_item_product(4, 1, 2, FALSE); -- Two Paellas
CALL insert_order_item_product(5, 8, 1, FALSE); -- One Garlic chicken
CALL insert_order_item_product(6, 12, 3, FALSE); -- Three Cheesecakes
CALL insert_order_item_product(2, 13, 4, FALSE); -- Four Beers
CALL insert_order_item_product(3, 6, 2, FALSE); -- Two Grilled sirloins
CALL insert_order_item_product(1, 4, 3, FALSE); -- Three Mixed salads
CALL insert_order_item_product(5, 10, 1, FALSE); -- One Flan
CALL insert_order_item_product(3, 7, 2, FALSE); -- Two Cod pil-pil
CALL insert_order_item_product(2, 15, 6, FALSE); -- Six Red wines
CALL insert_order_item_product(4, 2, 1, FALSE); -- One Gazpacho
CALL insert_order_item_product(6, 5, 1, FALSE); -- One Brownie
CALL insert_order_item_product(1, 14, 3, FALSE); -- Three Coca Colas
CALL insert_order_item_product(3, 3, 2, FALSE); -- Two Seafood soups
CALL insert_order_item_product(5, 11, 4, FALSE); -- Four Ice creams
CALL insert_order_item_product(2, 8, 1, FALSE); -- One Garlic chicken
CALL insert_order_item_product(4, 6, 2, FALSE); -- Two Grilled sirloins
CALL insert_order_item_product(6, 1, 1, FALSE); -- One Paella
CALL insert_order_item_product(3, 13, 5, FALSE); -- Five Beers
CALL insert_order_item_product(5, 12, 2, FALSE); -- Two Cheesecakes
CALL insert_order_item_product(1, 4, 1, FALSE); -- One Mixed salad
CALL insert_order_item_product(2, 9, 1, FALSE); -- One Galician-style octopus
CALL insert_order_item_product(3, 2, 3, FALSE); -- Three Gazpachos
CALL insert_order_item_product(4, 15, 6, FALSE); -- Six Red wines
CALL insert_order_item_product(5, 10, 2, FALSE); -- Two Flans
CALL insert_order_item_product(2, 14, 4, FALSE); -- Four Coca Colas
CALL insert_order_item_product(4, 11, 3, FALSE); -- Three Ice creams
CALL insert_order_item_product(7, 17, 1, FALSE); -- One Diamante Champagne