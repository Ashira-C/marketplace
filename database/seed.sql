use marketplace;

INSERT INTO users (name, email, password)
VALUES ('Peak', 'peak@test.com', 1234);
INSERT INTO products (name, price, stock)
VALUES ('iPhone', 30000, 10), ('AirPods', 5000, 20);

SELECT * FROM users;
SELECT * FROM products;

START TRANSACTION;

INSERT INTO orders (user_id, status, total_price)
VALUES (1, 'PENDING', 0);

SELECT LAST_INSERT_ID();

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 30000);
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (1, 2, 2, 5000);

UPDATE products
SET stock = stock - 1
WHERE id = 1;
UPDATE products
SET stock = stock - 2
WHERE id = 2;

SELECT SUM(quantity * price) AS total
FROM order_items
WHERE order_id = 1;

UPDATE orders
SET total_price = 40000
WHERE id = 1;

COMMIT;

START TRANSACTION;

UPDATE products
SET stock = stock - 100
WHERE id = 1;

SELECT * FROM products;

ROLLBACK;

SELECT * FROM products;