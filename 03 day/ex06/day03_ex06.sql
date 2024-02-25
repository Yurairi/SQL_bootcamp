SELECT menu.pizza_name, p.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, menu.price
FROM menu
         JOIN menu AS me2 ON menu.pizza_name = me2.pizza_name AND menu.id > me2.id AND menu.price = me2.price
         JOIN pizzeria AS p ON p.id = menu.pizzeria_id
         JOIN pizzeria AS p2 ON p2.id = me2.pizzeria_id
ORDER BY pizza_name;