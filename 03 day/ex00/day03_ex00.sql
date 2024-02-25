SELECT me.pizza_name, me.price, pi.name, person_visits.visit_date
FROM person_visits
         JOIN (SELECT * FROM person WHERE name = 'Kate') pe ON pe.id = person_visits.person_id
         JOIN (SELECT * FROM menu WHERE price BETWEEN 800 AND 1000) me ON me.pizzeria_id = person_visits.pizzeria_id
         JOIN (SELECT * FROM pizzeria) pi ON pi.id = me.pizzeria_id
ORDER BY me.pizza_name ASC, me.price ASC, pi.name ASC;

