-- 1. Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip FROM customers
JOIN addresses ON customers.id = addresses.customer_id
ORDER BY customers.last_name;

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT orders.id, line_items.quantity, products.description FROM orders
JOIN line_items ON orders.id = line_items.order_id
JOIN products ON products.id = line_items.product_id
ORDER BY orders.id;

-- 3. Which warehouses have cheetos?
SELECT warehouse, products.description FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.id = 5
ORDER BY warehouse.warehouse;

-- 4. Which warehouses have diet pepsi?
SELECT warehouse, products.description FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.id = 6
ORDER BY warehouse.warehouse;

-- 5. Get the number of orders for each customer.
SELECT customers.first_name, customers.last_name, COUNT(orders.address_id) from customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.first_name, customers.last_name;

-- 6. How many customers do we have?
SELECT COUNT(customers.id) FROM customers;

-- 7. How many products do we carry?
SELECT COUNT(products.id) FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand), products.description FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
WHERE products.id = 6
GROUP BY products.description;