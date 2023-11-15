/* Stage 1 queries */

/* Number of drivers - 10 */
SELECT COUNT(*) as number_drivers FROM drivers; 

/* how many deliveries per store */
SELECT COUNT(deliveries.id), drivers.store_id FROM deliveries
JOIN drivers ON drivers.id=deliveries.driver_id
GROUP BY drivers.store_id;



/*How many deliveries has each driver made */
SELECT drivers.full_name, COUNT(deliveries.id) as deliveries_made FROM deliveries
JOIN drivers ON drivers.id=deliveries.driver_id
GROUP BY drivers.full_name;

/* Which driver had the shortest delivery time :: 4 - way tie*/
SELECT drivers.full_name, MIN(deliveries.completed_delivery - deliveries.started_delivery) as delivery_time
FROM drivers
JOIN deliveries ON drivers.id=deliveries.driver_id
GROUP BY drivers.full_name;

/* WHICH driver had the longest delivery time :: Thaddeus Quillshank*/
SELECT drivers.full_name, MAX(deliveries.completed_delivery - deliveries.started_delivery) as delivery_time
FROM drivers
JOIN deliveries ON drivers.id=deliveries.driver_id
GROUP BY drivers.full_name;


/* Stage 2  queries */

/* How much money was made on each order */
SELECT orders.order_id, (available_pizzas.cost + SUM(available_toppings.cost_per_pizza)) as order_cost FROM orders
JOIN available_pizzas ON available_pizzas.id=orders.pizza_type_id
JOIN order_toppings ON order_toppings.order_id=orders.order_id
JOIN available_toppings ON available_toppings.id=order_toppings.topping_id
GROUP BY orders.order_id, available_pizzas.cost
ORDER BY orders.order_id ASC;


/* Which store made the most money - 3 made 2960.00 */
SELECT stores.id as store_id, (SUM(available_pizzas.cost) + SUM(available_toppings.cost_per_pizza)) as order_cost FROM orders
JOIN stores ON stores.id=orders.store_id
JOIN available_pizzas ON available_pizzas.id=orders.pizza_type_id
JOIN order_toppings ON order_toppings.order_id=orders.order_id
JOIN available_toppings ON available_toppings.id=order_toppings.topping_id
GROUP BY stores.id
ORDER BY order_cost ASC;


/* Which customer spent the most 3 2960  - looks like the same data, but the customers_id and store_id was the same on all orders */
SELECT customers.id as customer_id, (SUM(available_pizzas.cost) + SUM(available_toppings.cost_per_pizza)) as order_cost 
FROM orders
JOIN customers ON orders.customer_id=customers.id
JOIN available_pizzas ON available_pizzas.id=orders.pizza_type_id
JOIN order_toppings ON order_toppings.order_id=orders.order_id
JOIN available_toppings ON available_toppings.id=order_toppings.topping_id
GROUP BY customers.id
ORDER BY order_cost ASC;

/* How much did they make each month */
SELECT DATE_TRUNC('month',orders.ordered_date) as month, (SUM(available_pizzas.cost) + SUM(available_toppings.cost_per_pizza)) as order_cost FROM orders
JOIN available_pizzas ON available_pizzas.id=orders.pizza_type_id
JOIN order_toppings ON order_toppings.order_id=orders.order_id
JOIN available_toppings ON available_toppings.id=order_toppings.topping_id
GROUP BY month
ORDER BY month ASC;


/* stage 3 */


/*Which driver takes the longest and shortest avereage times */
SELECT drivers.full_name, AVG(deliveries.completed_delivery - deliveries.started_delivery) as delivery_time_avg
FROM drivers
JOIN deliveries ON drivers.id=deliveries.driver_id
GROUP BY drivers.full_name
ORDER BY delivery_time_avg ASC;