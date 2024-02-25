SELECT me.pizza_name, pi.name FROM
person_order
JOIN (SELECT name, id FROM person WHERE name = 'Denis' OR name = 'Anna') as na
ON na.id = person_order.person_id
JOIN (SELECT pizza_name, id, pizzeria_id FROM menu) as me
ON me.id = person_order.menu_id
JOIN (SELECT name, id FROM pizzeria) as pi
ON pi.id = me.pizzeria_id
ORDER BY 1 ASC, 2 ASC;