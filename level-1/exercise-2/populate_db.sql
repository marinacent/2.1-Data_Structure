USE pizzeria;

INSERT INTO provinces (name) VALUES 
('Barcelona'), 
('Girona');

INSERT INTO municipalities (name, province) VALUES 
('Barcelona', 1), 
('Badalona', 1), 
('Girona', 2);

INSERT INTO customers (name, surnames, address, postal_code, municipality, phone_number) VALUES
('Laura', 'Gomez', 'Carrer de Balmes 10', '08007', 1, '600123456'),
('Carlos', 'Martinez', 'Carrer de Gracia 20', '08012', 1, '600654321'),
('Anna', 'Lopez', 'Avinguda Catalunya 5', '17001', 3, '650987654');


INSERT INTO pizza_categories (name) VALUES
('Vegetarian'),
('Meat'),
('Margherita');

INSERT INTO products (name, description, type, price) VALUES
('Margherita', 'Classic tomato and cheese', 'pizza', 7.5),
('Pepperoni', 'Spicy pepperoni with cheese', 'pizza', 9.0),
('Coca Cola', 'Soft drink 330ml', 'drink', 2.0),
('Cheeseburger', 'Beef burger with cheese', 'burger', 5.5);

INSERT INTO pizzas (product_id, category_id) VALUES
(1, 3),
(2, 2);

INSERT INTO stores (address, postal_code, municipality) VALUES
('Carrer de Pelai 15', '08001', 1),
('Avinguda Jaume I 3', '17001', 3);

INSERT INTO employees (name, surnames, nif, phone_number, type) VALUES
('Miguel', 'Hernandez', '12345678A', '600111222', 'cook'),
('Sofia', 'Ramirez', '87654321B', '600333444', 'delivery');

INSERT INTO orders (type, total_price, store_id) VALUES
('delivery', 11.5, 1),
('pickup', 9.0, 1),
('delivery', 7.5, 2);

INSERT INTO deliveries (order_id, delivery_person_id) VALUES
(1, 2),
(3, 2);

INSERT INTO product_orders (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 1, 1);

