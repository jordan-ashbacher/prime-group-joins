-- 1. Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip FROM customers
JOIN addresses ON customers.id = addresses.customer_id
ORDER BY customers.last_name;