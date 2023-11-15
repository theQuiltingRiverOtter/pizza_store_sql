CREATE TABLE stores(
    id SERIAL PRIMARY KEY,
    location VARCHAR
);

CREATE TABLE drivers(
    id SERIAL PRIMARY KEY,
    store_id INT REFERENCES stores(id),
    full_name VARCHAR
);

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    street VARCHAR,
    city VARCHAR,
    zip CHAR(7),
    COUNTRY CHAR(2)
);

CREATE TABLE available_pizzas(
    id SERIAL PRIMARY KEY,
    pizza_type VARCHAR,
    cost DECIMAL(8,2)
);

CREATE TABLE available_toppings(
    id SERIAL PRIMARY KEY,
    topping_name VARCHAR,
    cost_per_pizza DECIMAL(8,2)
);

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    ordered_date DATE,
    pizza_type_id INT REFERENCES available_pizzas(id),
    store_id INT REFERENCES stores(id),
    customer_id INT REFERENCES customers(id)

);

CREATE TABLE order_toppings(
    id SERIAL PRIMARY KEY,
    topping_id INT REFERENCES available_toppings(id),
    order_id INT REFERENCES orders(order_id)
);

CREATE TABLE deliveries(
    id SERIAL PRIMARY KEY,
    driver_id INT REFERENCES drivers(id),
    order_id INT REFERENCES orders(order_id),
    started_delivery TIME,
    completed_delivery TIME
);