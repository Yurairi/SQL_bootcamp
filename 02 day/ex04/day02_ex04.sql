SELECT pizza_name, pi.name, price
FROM menu
         JOIN pizzeria AS pi
              ON pi.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza'
   OR pizza_name = 'pepperoni pizza'
ORDER BY 1 ASC, 2 ASC;