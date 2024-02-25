WITH orders AS (SELECT p.name
    FROM person_order
    JOIN person ON person_order.person_id = person.id AND name='Andrey'
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria p ON menu.pizzeria_id = p.id),
    visited AS (SELECT p.name
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id AND name='Andrey'
    JOIN pizzeria p ON person_visits.pizzeria_id = p.id)
SELECT *
FROM visited
EXCEPT
SELECT *
FROM orders;