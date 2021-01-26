-- 1. Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip FROM customers
JOIN addresses ON customers.id = addresses.customer_id
ORDER BY customers.last_name;

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT orders.id, line_items.quantity, products.description FROM orders
JOIN line_items ON orders.id = line_items.order_id
JOIN products ON products.id = line_items.product_id
ORDER BY orders.id;

--3. Which warehouses have cheetos?
SELECT warehouse, products.description FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.id = 5
ORDER BY warehouse.warehouse;
