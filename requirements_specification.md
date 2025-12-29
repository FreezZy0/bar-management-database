# Requirements Specification

This document details the functional, informational and business requirements of the [**bar management system**](./README.md).. It also includes traceability matrices linking the requirements to the elements of the conceptual model, ensuring consistency and completeness throughout the system design.

## System Overview

### General Requirements

#### G.R.01. Ingredient Management

As the bar manager\
I want to manage the ingredients in the inventory\
So that I can have control over the available stock.

#### G.R.02. Supplier Order Management

As the bar manager\
I want to manage supplier orders\
To ensure the bar is properly stocked.

#### G.R.03. Reservation Management

As the bar manager\
I want to manage all reservations made during the day\
To avoid exceeding the maximum capacity and ensure a satisfactory experience.

#### G.R.04. Order Management

As the bar manager\
I want to manage all customer orders placed during the day\
To prevent any errors with them.

#### G.R.05. Product Management

As the bar manager\
I want to manage the products offered to customers\
To ensure a varied menu that meets customer demands.

#### G.R.06. Menu Management

As the bar manager\
I want to manage the menus offered to customers\
To organize the different products in diverse ways.

### System Users
The system users will be:
- Administrator: Manages the database, having full control over it and its contents.
- Bar Manager: Oversees the daily operations of the bar.
- Manager: Handles long-term business opportunities.
- Waiter: Bar staff who takes customer orders and delivers products.
- Cashier: Staff managing customer payments for their orders.

## Requirements Catalog

#### Functional Requirements

##### F.R.01.1 Ingredient Creation
As the bar manager\
I want to create new ingredients\
To ensure all ingredients are recorded.

**Acceptance Test**
- An ingredient cannot be created without a name.

##### F.R.01.2 Ingredient Editing
As the bar manager\
I want to edit saved ingredients\
To keep their information up to date.

**Acceptance Test**
- The ingredient name can be edited. Editing an ingredient does not affect products or orders containing it.
- The name cannot be nullified.

##### F.R.01.3 Ingredient Deletion
As the bar manager\
I want to delete saved ingredients\
To remove ingredients that should not be kept.

**Acceptance Test**
- Deleting an ingredient must remove its relation with products containing it and any orders where it appeared.

##### F.R.02.1 Supplier Order Creation
As the bar manager\
I want to create new supplier orders\
To ensure all orders are recorded.

**Acceptance Test**
- Orders cannot be created without a date or without a supplier.

##### F.R.02.2 Supplier Order Editing
As the bar manager\
I want to edit saved supplier orders\
To keep the information up to date.

**Acceptance Test**
- Order date, delivery date, and supplier can be edited. Editing an order does not affect the ingredients or supplier referenced.
- Order date and supplier cannot be nullified.

##### F.R.02.3 Supplier Order Deletion
As the bar manager\
I want to delete saved supplier orders\
To remove orders that should not be kept.

**Acceptance Test**
- Deleting an order must remove its relation with the ingredients requested.

##### F.R.03.1 Reservation Creation
As the bar manager\
I want to create new reservations\
To ensure all reservations are recorded.

**Acceptance Test**
- A reservation cannot be created without creation date, reservation date, or number of people.
- The number of people must be greater than 0.
- Business Rule R.B.01 must be enforced.

##### F.R.03.2 Reservation Editing
As the bar manager\
I want to edit saved reservations\
To keep their information up to date.

**Acceptance Test**
- Creation date, reservation date, and number of people can be edited. Editing a reservation does not affect orders where it appears.
- Dates and number of people cannot be nullified.
- Number of people must be greater than 0.
- Business Rules R.B.01 and R.B.02 must be enforced.

##### F.R.03.3 Reservation Deletion
As the bar manager\
I want to delete saved reservations\
To remove reservations that should not be kept.

**Acceptance Test**
- Deleting a reservation does not affect orders where it appeared.

##### F.R.04.1 Order Creation
As the bar manager\
I want to create new orders\
To ensure all customer orders are recorded.

**Acceptance Test**
- An order cannot be created without a date or without a reservation.

##### F.R.04.2 Order Editing
As the bar manager\
I want to edit saved orders\
To keep their information up to date.

**Acceptance Test**
- Order date and reservation can be edited. Editing an order does not affect order lines where it appears.
- Date and reservation cannot be nullified.

##### F.R.04.3 Order Deletion
As the bar manager\
I want to delete saved orders\
To remove orders that should not be kept.

**Acceptance Test**
- Deleting an order deletes all its order lines.

##### F.R.05.1 Product Creation
As the bar manager\
I want to create new products\
To ensure all products are recorded.

**Acceptance Test**
- Products cannot be created without a name, price, or category.
- Price and preparation time cannot be negative.

##### F.R.05.2 Product Editing
As the bar manager\
I want to edit products\
To keep their information up to date.

**Acceptance Test**
- Name, price, preparation time, and category can be edited. Editing a product does not affect orders, menus, or ingredient relations.
- Name, price, or category cannot be nullified.
- Price and preparation time cannot be negative.

##### F.R.05.3 Product Deletion
As the bar manager\
I want to delete saved products\
To remove products that should not be kept.

**Acceptance Test**
- Deleting a product does not affect orders or menus where it appeared, and its ingredient relations must be removed.

##### F.R.06.1 Menu Creation
As the bar manager\
I want to create new menus\
To ensure all menus are recorded.

**Acceptance Test**
- A menu cannot be created without a name or price.
- Price cannot be negative.

##### F.R.06.2 Menu Editing
As the bar manager\
I want to edit menus\
To keep their information up to date.

**Acceptance Test**
- Name and price can be edited. Editing a menu does not affect its products or orders where it appears.
- Name and price cannot be nullified.
- Price cannot be negative.

##### F.R.06.3 Menu Deletion
As the bar manager\
I want to delete menus\
To remove menus that should not be kept.

**Acceptance Test**
- Deleting a menu does not affect orders where it appeared, and product relations must be removed.

#### Informational Requirements

##### I.R.01.1. Ingredient Information

As the bar manager\
I want to have information about the ingredients in stock, including the ingredient name, current available quantity, supplier, and acquisition date\
To ensure the inventory stays up to date and to avoid shortages or waste.

**Acceptance Test**
- The system displays a list of ingredients in stock, including the ingredient name, available quantity, supplier, and acquisition date.

##### I.R.02.1. Supplier Order Information
As the bar manager\
I want to have information about ingredient orders from suppliers, including the ingredients, the quantity requested, and the order status (requested or delivered)\
To keep the bar properly stocked.

**Acceptance Test**
- The system displays a list of supplier orders, including the ingredients, quantity requested, and order status.

##### I.R.03.1. Reservation Information
As the bar manager\
I want to have information about reservations, including the date, time, number of people, and the customer making the reservation, identified by name and phone number, as well as whether it was a walk-in\
To effectively manage customer flow and avoid overloading the facilities.

**Acceptance Test**
- The system displays a list of reservations made by customers, including date, time, number of people, and whether the reservation was a walk-in.

##### I.R.04.1. Customer Order Information
As a waiter\
I want to have information about customer orders, including the products requested, estimated preparation time, and total amount\
To provide efficient and error-free service to customers.

**Acceptance Test**
- The system displays a list of customer orders, including the products requested, estimated preparation time, and total amount.

##### I.R.05.1. Product Information
As the bar manager\
I want to have information about products, including name, ingredients, price, category, and preparation time (default 10 minutes)\
To ensure correct preparation and consistent pricing.

**Acceptance Test**
- The system displays a list of products, including the name, ingredients, price, category, and preparation time.

##### I.R.06.1. Bar Menu Information
As the bar manager\
I want to have information about the menus offered, including name, price, and products included in each menu\
To efficiently manage menus and provide a personalized experience to customers.

**Acceptance Test**
- The system displays a list of menus, including names, prices, and the products composing each menu.

#### Business Rules

##### B.R.01. Reservation Advance
As the bar manager\
I want customers to be able to make reservations at least 1 day and at most 30 days in advance (unless they are walk-ins)\
To allow proper planning for both the customer and the bar, avoiding last-minute bookings.

##### B.R.02. Reservation Changes
As the bar manager\
I want customers to be able to modify their reservations up to 6 hours before the scheduled time\
To provide flexibility and improve the customer experience.

##### B.R.03. Total Order Amount
As the bar manager\
I want the total amount of an order to be calculated as the sum of the prices of its order lines\
To keep track of generated revenue.

##### B.R.04. Walk-in Customers
As the bar manager\
I want a reservation to be created for a walk-in customer at the moment they arrive\
To track all orders, even if there was no prior reservation.

##### B.R.05. Menu Composition
As the bar manager\
I want menus to consist of a fixed first course, second course, and dessert, with an optional drink\
To ensure all menus have a consistent structure.

##### B.R.06. Order Status
As the bar manager\
I want order status to change from requested to delivered when the delivery time is added\
To maintain control of order shipments.

##### B.R.07. Order Preparation Time
As the bar manager\
I want the preparation time of an order to equal the maximum preparation time among all its products\
To track kitchen efficiency.

##### B.R.08. Orders with Menus
As the bar manager\
I want a menu added to an order to include all products in the menu, ignoring individual product prices and considering only the menu price\
To simplify adding products and menus to orders.

##### B.R.09. Ingredient Stock
As the bar manager\
I want the stock of an ingredient to be calculated as the total quantity ordered from suppliers minus the total used for order preparation\
To control available quantities accurately.

##### B.R.10. Order Line Prices
As the bar manager\
I want the price of a product or menu in an order line to reflect the current price at the time the order is placed\
To ensure correct pricing in the system.

##### B.R.11. Order Line Quantity
As the bar manager\
I want adding an already existing order line for a product or menu to automatically sum the quantity\
To easily update orders and avoid unnecessary duplicates.

##### B.R.12. Insufficient Stock
As the bar manager\
I want to add or modify order lines only if there is sufficient stock of all ingredients\
To prevent inventory issues and inform customers promptly.




## Traceability Matrices

- Traceability matrix between elements of the conceptual model and the requirements.

|          | Ingredient | SupplierOrder | OrderIngredient | Supplier | Product | IngredientProduct | Category | Menu | Order | OrderItemProduct | Reservation | Customer | OrderItemMenu |
|:---------|:-----------|:-----------|:-------------------|:-----------|:-----------|:---------------------|:-----------|:-----------|:-----------|:----------------------|:-----------|:-----------|:---------------|
| IR-01.1  |X           |X           |X                   |            |            |                      |            |            |            |                       |            |            |                |
| IR-02.1  |X           |X           |X                   |X           |            |                      |            |            |            |                       |            |            |                |
| IR-03.1  |            |            |                    |            |            |                      |            |            |            |                       |X           |X           |                |
| IR-04.1  |            |            |                    |            |X           |                      |            |X           |X           |X                      |            |            |X               |
| IR-05.1  |X           |            |                    |            |X           |X                     |X           |            |            |                       |            |            |                |
| IR-06.1  |            |            |                    |            |X           |                      |            |X           |            |                       |            |            |                |
| FR-01.1  |X           |            |                    |            |            |                      |            |            |            |                       |            |            |                |
| FR-01.2  |X           |            |                    |            |            |                      |            |            |            |                       |            |            |                |
| FR-01.3  |X           |            |                    |            |            |                      |            |            |            |                       |            |            |                |
| FR-02.1  |            |X           |                    |X           |            |                      |            |            |            |                       |            |            |                |
| FR-02.2  |            |X           |                    |X           |            |                      |            |            |            |                       |            |            |                |
| FR-02.3  |            |X           |                    |X           |            |                      |            |            |            |                       |            |            |                |
| FR-03.1  |            |            |                    |            |            |                      |            |            |            |                       |X           |            |                |
| FR-03.2  |            |            |                    |            |            |                      |            |            |            |                       |X           |            |                |
| FR-03.3  |            |            |                    |            |            |                      |            |            |            |                       |X           |            |                |
| FR-04.1  |            |            |                    |            |            |                      |            |            |X           |                       |            |            |                |
| FR-04.2  |            |            |                    |            |            |                      |            |            |X           |                       |            |            |                |
| FR-04.3  |            |            |                    |            |            |                      |            |            |X           |                       |            |            |                |
| FR-05.1  |            |            |                    |            |X           |                      |            |            |            |                       |            |            |                |
| FR-05.2  |            |            |                    |            |X           |                      |            |            |            |                       |            |            |                |
| FR-05.3  |            |            |                    |            |X           |                      |            |            |            |                       |            |            |                |
| FR-06.1  |            |            |                    |            |            |                      |            |X           |            |                       |            |            |                |
| FR-06.2  |            |            |                    |            |            |                      |            |X           |            |                       |            |            |                |
| FR-06.3  |            |            |                    |            |            |                      |            |X           |            |                       |            |            |                |
| BR-01    |            |            |                    |            |            |                      |            |            |            |                       |X           |            |                |
| BR-02    |            |            |                    |            |            |                      |            |            |            |                       |X           |            |                |
| BR-03    |            |            |                    |            |            |                      |            |            |X           |X                      |            |            |X               |
| BR-04    |            |            |                    |            |            |                      |            |            |            |                       |X           |            |                |
| BR-05    |            |            |                    |            |            |                      |            |X           |            |                       |            |            |                |
| BR-06    |            |X           |                    |            |            |                      |            |            |            |                       |            |            |                |
| BR-07    |            |            |                    |            |            |                      |            |            |X           |                       |            |            |                |
| BR-08    |            |            |                    |            |            |                      |            |            |            |X                      |            |            |X               |
| BR-09    |X           |            |X                   |            |            |X                     |            |            |            |                       |            |            |                |
| BR-10    |            |            |                    |            |            |                      |            |            |            |X                      |            |            |X               |
| BR-11    |            |            |                    |            |            |                      |            |            |            |X                      |            |            |X               |
| BR-12    |            |            |                    |            |            |                      |            |            |            |X                      |            |            |                |



- Traceability matrix between functions/procedures/triggers and business rules.

#### Functions
|                               | BR-1   | BR-2   | BR-3   | BR-4   | BR-5   | BR-6   | BR-7   | BR-8   | BR-9   | BR-10   | BR-11   | BR-12   |
|:------------------------------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:--------|:--------|:--------|
| get_order_status                 |        |        |        |        |        |X       |        |        |        |         |         |         |
| get_ingredient_stock             |        |        |        |        |        |        |        |        |X       |         |         |         |
| get_order_preparation_time |        |        |        |        |        |        |X       |        |        |         |         |         |
| get_order_total_amount               |        |        |X       |        |        |        |        |        |        |         |         |         |
| get_product_by_category_in_menu |        |        |        |        |        |        |        |X       |        |         |         |         |

#### Procedures
|                                 | BR-1   | BR-2   | BR-3   | BR-4   | BR-5   | BR-6   | BR-7   | BR-8   | BR-9   | BR-10   | BR-11   | BR-12   |
|:--------------------------------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:--------|:--------|:--------|
| insert_order_item_product |        |        |        |        |        |        |        |        |        |X        |X        |         |
| insert_order_item_menu     |        |        |        |        |        |        |        |X       |        |X        |X        |         |
| insert_walkin                 |        |        |        |X       |        |        |        |        |        |         |         |         |

#### Triggers
|                             | BR-1   | BR-2   | BR-3   | BR-4   | BR-5   | BR-6   | BR-7   | BR-8   | BR-9   | BR-10   | BR-11   | BR-12   |
|:----------------------------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:--------|:--------|:--------|
| one_product_per_category_in_menu |        |        |        |        |X       |        |        |        |        |         |         |         |
| reservation_update_check            |        |X       |        |        |        |        |        |        |        |         |         |         |
| reservation_advance_notice        |X       |        |        |        |        |        |        |        |        |         |         |         |
| check_insufficient_stock_insert   |        |        |        |        |        |        |        |        |        |         |         |X        |
| check_insufficient_stock_update   |        |        |        |        |        |        |        |        |        |         |         |X        |



