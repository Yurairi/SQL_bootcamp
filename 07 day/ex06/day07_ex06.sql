SELECT p.name,
       COUNT(person_id)       AS count_of_orders,
       ROUND(AVG(m.price), 2) AS average_price,
       MAX(price)             AS max_price,
       MIN(price)             AS min_price
FROM person_order
         JOIN menu m ON m.id = person_order.menu_id
         JOIN pizzeria p ON m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY p.name ASC;