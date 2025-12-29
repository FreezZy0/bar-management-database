# Bar Management System

This project is a management system for a bar or restaurant, implemented using SQL to handle all data operations. It allows for controlling ingredient inventory, managing supplier orders, organizing customer reservations, handling orders, and maintaining product and menu information in a centralized database.

## Glossary

- **Customer**: Person who makes a reservation and comes to the bar to consume products. They may be accompanied by other people.  
- **Inventory**: Set of all ingredients available in stock.  
- **Ingredient**: Element used to prepare products, part of the inventory.  
- **Menu**: Set of selected products offered by the bar. Multiple menus may exist.  
- **Order**: Request of products by customers to the waiter to be prepared.  
- **Product**: Prepared food made with various ingredients, ready to be consumed. Products can have different categories (first course, second course, drink, or dessert).  
- **Reservation**: Action in which a customer secures a table at the bar for a specific date and time.  
- **Stock**: Available quantity of an ingredient in the inventory.  
- **Supplier**: Company responsible for supplying ingredients to the bar.  
- **Supplier Order**: Request of ingredients from the bar to a supplier to be delivered.  
- **Walk-in**: Customer who arrives without a prior reservation, requesting a table immediately.

## Installation

1. Clone this repository:
```bash
git clone https://github.com/ivrugue/bar-management-database
cd bar-management-database
```

2. Set up the database:
- Make sure you have MySQL or MariaDB installed.
- Create a new database:
```sql
CREATE DATABASE bar_db;
```
- Import all SQL scripts to set up tables, functions, procedures, triggers and sample data:
```bash
mysql -u <your_user> -p bar_db < scripts/01_schema.sql
mysql -u <your_user> -p bar_db < scripts/02_functions.sql
mysql -u <your_user> -p bar_db < scripts/03_procedures.sql
mysql -u <your_user> -p bar_db < scripts/04_triggers.sql
mysql -u <your_user> -p bar_db < scripts/05_seed_data.sql
```

3. Use your preferred SQL client or a script to connect to the ```bar_db``` database.

4. Run sample queries (optional) :
```bash
mysql -u <your_user> -p bar_db < queries/sample_queries.sql
```

## Requirements Specification

All business rules, procedures and triggers for this database are detailed here: [**Requirements Specification**](./requirements_specification.md).


## Conceptual Model

### UML Class Diagram

<img src="./images/uml_modeling.svg" alt="UML Modeling" width="100%">

### Test Scenario

In this scenario, a reservation is made for three people, where two of them order a chicken fillet and the remaining one orders a menu, which includes a chicken fillet.
  
<img src="./images/test_scenario.svg" alt="Test Scenario" width="100%">

## Relational Model

```
- Ingredient(!id, name)
- Supplier(!id, name, tax_id)
- SupplierOrder(!id, order_date, arrival_date @supplier_id)
- OrderIngredient(!id, quantity, @ingredient_id, @supplier_order_id)
- Customer(!id, name, phone)
- Reservation(!id, created_at, reservation_date, number_of_people, @customer_id)
- Order(!id, order_date, @reservation_id)
- Category(!id, name)
- Product(!id, name, price, preparation_time, @category_id)
- Menu(!id, name, price)
- ProductMenu(!id, @product_id, @menu_id)
- IngredientProduct(!id, quantity, @ingredient_id, @product_id)
- OrderItemMenu(!id, price, quantity, #(@order_id, @menu_id))
- OrderItemProduct(!id, price, quantity, #(@order_id, @product_id, is_from_menu))
```