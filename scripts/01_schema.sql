DROP TABLE IF EXISTS order_item_products;
DROP TABLE IF EXISTS order_item_menus;
DROP TABLE IF EXISTS ingredient_products;
DROP TABLE IF EXISTS product_menus;
DROP TABLE IF EXISTS menus;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS order_ingredients;
DROP TABLE IF EXISTS supplier_orders;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS ingredients;

CREATE TABLE ingredients (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE suppliers (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	tax_id VARCHAR(255) NOT NULL
);

CREATE TABLE supplier_orders (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	order_date DATETIME NOT NULL,
	arrival_date DATETIME,
	supplier_id INT NOT NULL,
	FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);

CREATE TABLE order_ingredients (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	quantity INT NOT NULL,
	ingredient_id INT NOT NULL,
	supplier_order_id INT NOT NULL,
	FOREIGN KEY (ingredient_id) REFERENCES ingredients (id) ON DELETE CASCADE,
	FOREIGN KEY (supplier_order_id) REFERENCES supplier_orders (id) ON DELETE CASCADE,
	CONSTRAINT check_quantity CHECK (quantity > 0)
);

CREATE TABLE customers (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	phone VARCHAR(255) NOT NULL
);

CREATE TABLE reservations (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	created_at DATETIME NOT NULL,
	reservation_date DATETIME NOT NULL,
	number_of_people INT NOT NULL,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE SET NULL,
	CONSTRAINT check_number_of_people CHECK (number_of_people > 0)
);

CREATE TABLE orders (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	order_date DATETIME NOT NULL,
	reservation_id INT NOT NULL,
	FOREIGN KEY (reservation_id) REFERENCES reservations (id)
);

CREATE TABLE categories (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	preparation_time INT NOT NULL DEFAULT 10,
	category_id INT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories (id),
	CONSTRAINT check_preparation_time CHECK (preparation_time >= 0),
	CONSTRAINT check_price CHECK (price >= 0)	
);

CREATE TABLE menus (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	CONSTRAINT check_price CHECK (price >= 0)	
);

CREATE TABLE product_menus (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	product_id INT NOT NULL,
	menu_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES products (id),
	FOREIGN KEY (menu_id) REFERENCES menus (id) ON DELETE CASCADE,
	UNIQUE (product_id, menu_id)
);

CREATE TABLE ingredient_products (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	quantity INT NOT NULL,
	ingredient_id INT NOT NULL,
	product_id INT NOT NULL,
	FOREIGN KEY (ingredient_id) REFERENCES ingredients (id),
	FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
	CONSTRAINT check_quantity CHECK (quantity > 0)
);

CREATE TABLE order_item_menus (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	price DECIMAL(10, 2) NOT NULL,
	quantity INT NOT NULL,
	order_id INT NOT NULL,
	menu_id INT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
	FOREIGN KEY (menu_id) REFERENCES menus (id),
	UNIQUE (order_id, menu_id),
	CONSTRAINT check_price CHECK (price >= 0),
	CONSTRAINT check_quantity CHECK (quantity > 0)
);

CREATE TABLE order_item_products (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	price DECIMAL(10, 2) NOT NULL,
	quantity INT NOT NULL,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	is_from_menu BOOLEAN NOT NULL DEFAULT FALSE,
	FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (id),
	UNIQUE (order_id, product_id, is_from_menu),
	CONSTRAINT check_price CHECK (price >= 0),
	CONSTRAINT check_quantity CHECK (quantity > 0)
);
