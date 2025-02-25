create database online_stores_inventory;
use online_stores_inventory;

--USERS TABLE-1(it stores users details securely for authentication and authorization)
    --In this table we gave unique identifier for each user.it automatically increments for each new user acts as the primary key.
    --users email should be not null and unique.
    --this unique constraints prevents duplicate entries.
    --it stores encrypted passwords instead of plain text.using hashed passwords improves security.
    
    CREATE TABLE users_table (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL 
   );
   
-- CATEGORIES TABLE-2(it categorize products based on fabric type,organizes inventory efficiently)
  -- unique identifier,automatically incre,acts as primary key
  -- not null(cannot be empty),unique(no duplicates)
  -- stores additional details about category,doesnt have not null(optional)
  -- stores types of fabric,not null,unique
  CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    fabric_types VARCHAR(50) NOT NULL UNIQUE
);
-- SUPPLIERS TABLE-3(it manages supplier information for inventory tracking,unique supplier names and email addresses,stores essential details)
  -- unique identifier,automatically incre,acts as primary key
  -- not null(cannot be empty),unique(no duplicates)
  -- unique(no duplicates),optional
  -- stores address,optional
CREATE TABLE suppliers (
    supplier_id  INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);
-- PRODUCTS TABLE-4(it manages inventory by storing product details,link products to categories and suppliers,tracks rpicing,stock levels and description)
   -- unique identifier,automatically incre,acts as primary key
   -- not null(cannot be empty),unique(no duplicates)
   -- it classify products,works as foreign key(even not defined)
   -- it provides the products,works as foreign key(even not defined)
   -- stores the product price with two decimal places,it must have a price(not null)
   -- stores the no.of available units in stocks,it must record stock count
   -- description of the product
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    description TEXT
);

-- INVENTORY TABLE-5(it tracks inventory status,it records stock levels,restocking details and supplier information)
  -- unique identifier,automatically incre,acts as primary key
  -- stores products id,product must be associated foreign key linking to products
  -- stores current quantity of the product in stock,must record stock levels
  -- records the date when the product was lat restocked
  -- stores the quantity added during the last restock
  -- stores suppliers id and it should be a foreign key linking to suppliers
  
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    stock_level INT NOT NULL,
    last_restocked DATE, 
    restock_quantity INT,
    supplier_id INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE SET NULL
);

-- ORDERS TABLE-6(tracks customers order,total price and status,it monitor order progress,user id links orders to specific customers)
  -- unique identifier,automatically incre,acts as primary key
  -- stores id of the user who placed the order,foreign key refere the users table
  -- records the date when the order as placed
  -- stores total cost of the order,accuratelt with decimal places
  -- it shows status of the order using predefined values,pending(order is waiting to be processed)

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date DATE,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'shipped', 'delivered', 'canceled') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users_table(user_id) ON DELETE CASCADE
);


-- ORDER ITEMS TABLE-7(it establishes a many to many relationship between orders and products,allows multiple products to be 
-- associated with a single order,computed column subtotal help in calculating order totals efficiently)
  -- unique identifier,automatically incre,acts as primary key
  -- foreign key linking to the orders table,representing which order his item belongs to
  -- foreign key linking to th products table,identifying the product in the order
  -- no.of units of this product in the order
  -- s tores the price per unit of the product at the time of purchase
  -- a computed column that automatically calculates the total price of this order item.
     -- FOREIGN KEY CONSTRAINTS
       -- ensures when order is deleted, all related order items are deleted automatically
       -- e nsures that when a product is deleted,all related order items are also removed
       
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (quantity * price) STORED,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- TABLE-1
INSERT INTO users_table (user_id, username, email, password_hash)VALUES
(1,'Toshika','toshika@mystore.com','toshi'),
(2,'Raahithys','raahith@mystore.com','raahit'),
(3,'Tanusri','tanusri@mystore.com','tanusri'),
(4,'Yathvik','yathvik@mystore.com','yathvik'),
(5,'Yogithsai','yogithsai@mystore.com','yogith');

-- TABLE-2
INSERT INTO categories (category_id, category_name, description, fabric_types)VALUES
(1,'Mens\'s T-shirts','crew-neck t-shirt in multiple colors','supima cotton'),
(2,'Womens\'s Jeans','high waisted skinny jeans','strech fabric'),
(3,'Hoodie Sweatshirt','hoodie with front pocket','fleece'),
(4,'Formal Blazer','classic slim-fit blazer for business or casual wear','linen'),
(5,'Summer Dress','Lightweight floral dress for warm weather','cotton');

-- TABLE-3
INSERT INTO suppliers ( supplier_id, supplier_name, email, phone, address)VALUES
(1,'Go Green','gogreen@gmail.com',7949554777,'Banglore'),
(2,'Reka','reka@gmail.com',8924563409,'Delhi'),
(3,'India','india@gmail.com',9828485868,'Surat'),
(4,'Lakshmipathi','lakshmipathi@gmail.com',7362396514,'Hyderabad'),
(5,'Rudraksh','rudraaksh@gmail.com',8946578214,'Mangalgiri');

-- TABLE-4
INSERT INTO Products (name, category_id, supplier_id, price, stock_quantity, description) VALUES
('Men\'s T-Shirt', 2, 1, 14.99, 100, 'Cotton crew-neck t-shirt in multiple colors'),
('Women\'s Jeans', 2, 2, 39.99, 50, 'High-waisted skinny jeans with stretch fabric'),
('Hoodie Sweatshirt', 2, 3, 29.99, 75, 'Warm fleece hoodie with front pocket'),
('Formal Blazer', 2, 4, 59.99, 40, 'Classic slim-fit blazer for business or casual wear'),
('Summer Dress', 2, 5, 34.99, 60, 'Lightweight floral dress for warm weather');

-- TABLE-5
INSERT INTO Inventory (inventory_id, product_id, stock_level, last_restocked, restock_quantity, supplier_id) VALUES 
(1, 1, 100, '2024-01-15', 50, 1), 
(2, 2, 50, '2024-02-05', 30, 2), 
(3, 3, 75, '2024-01-25', 40, 3), 
(4, 4, 40, '2024-02-10', 20, 4), 
(5, 5, 60, '2024-02-12', 25, 5);

-- TABLE-6
INSERT INTO Orders (user_id, order_date, total_price, status) VALUES
(1, '2024-02-10', 89.99, 'pending'),
(2, '2024-02-12', 150.50, 'shipped'),
(3, '2024-02-14', 49.99, 'delivered'),
(4, '2024-02-15', 220.75, 'canceled'),
(5, '2024-02-18', 120.00, 'pending');
-- TABLE-7
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 2, 3, 19.99),                    -- Order #1, Product #2, 3 units at $19.99 each
(2, 4, 1, 49.99),                    -- Order #2, Product #4, 1 unit at $49.99
(3, 1, 2, 29.50),                    -- Order #3, Product #1, 2 units at $29.50 each
(4, 5, 4, 15.00),                    -- Order #4, Product #5, 4 units at $15.00 each
(5, 3, 2, 39.99);                    -- Order #5, Product #3, 2 units at $39.99 each



select * from suppliers
select * from categories
select * from users_table
select * from Products
select * from Orders
select * from Order_Items

Inventory Management: Track Low Stock Products
--Problem: Identifying products that need restocking.
--Solution: Find products with stock levels below a threshold 
 p.product_id, p.name → Product details.
i.stock_level, i.last_restocked → Inventory status.
s.supplier_name, s.email, s.phone → Supplier details for restocking.
Inventory i is joined with Products p using product_id to get product names.
Suppliers s is joined using supplier_id to get supplier contact details.
WHERE i.stock_level < 100 → Retrieves only products with stock below 100.
ORDER BY i.stock_level ASC → Lists products with the lowest stock first.
*/
SELECT 
    p.product_id, 
    p.name AS product_name, 
    i.stock_level, 
    i.last_restocked, 
    s.supplier_name, 
    s.email AS supplier_email, 
    s.phone AS supplier_phone
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
JOIN Suppliers s ON i.supplier_id = s.supplier_id
WHERE i.stock_level < 100 
ORDER BY i.stock_level ASC;

/* TO FIND TOTAL REVENUE
SUM(total_price): Adds up the total price of all orders.
AS total_revenue: Renames the output column as total_revenue.*/
SELECT SUM(total_price) AS total_revenue FROM Orders;

/*TO FIND HIGHEST SALES REVENUE
Calculates total revenue per product – Uses SUM(oi.subtotal) to compute the total revenue generated from each product.
Joins Products and Order_Items – This links the ordered products to their details.
Groups by product – Ensures that revenue is calculated per product.
Orders by revenue in descending order – To get the highest revenue product first.
Limits results to one row – Ensures only the top-selling product is retrieved.
*/
SELECT p.product_id, p.name, SUM(oi.subtotal) AS total_revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_revenue DESC
LIMIT 3;

/* TO FIND MOST ORDERED PRODUCTS
SUM(OI.quantity): Sums up the total quantity of each product ordered.
JOIN Products P ON OI.product_id = P.product_id: Links the Order_Items table with Products to get the product name.
GROUP BY P.name: Groups the result by product name.
ORDER BY total_quantity_ordered DESC: Sorts the products in descending order based on the total quantity ordered.
LIMIT 1: Retrieves only the top product with the highest quantity ordered.*/
SELECT P.name AS product_name, SUM(OI.quantity) AS total_quantity_ordered
FROM Order_Items OI
JOIN Products P ON OI.product_id = P.product_id
GROUP BY P.name
ORDER BY total_quantity_ordered DESC
LIMIT 1;

/* TO FIND THE SUPPLIER PROVIDING THE MOST PRODUCTS
COUNT(P.product_id): Counts the number of products each supplier provides.
JOIN Suppliers S ON P.supplier_id = S.supplier_id: Joins the Products table with Suppliers to get the supplier name.
GROUP BY S.supplier_name: Groups the result by supplier name.
ORDER BY total_products_supplied DESC: Sorts the results in descending order based on the number of products supplied.
LIMIT 1: Retrieves only the top supplier providing the most products.*/
SELECT S.supplier_name, COUNT(P.product_id) AS total_products_supplied
FROM Products P
JOIN Suppliers S ON P.supplier_id = S.supplier_id
GROUP BY S.supplier_name
ORDER BY total_products_supplied DESC
LIMIT 2;

