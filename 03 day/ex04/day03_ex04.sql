WITH male AS (SELECT p.name AS pizzeria_name
              FROM person_order
                       JOIN person ON person_order.person_id = person.id AND gender = 'male'
                       JOIN menu ON menu.id = person_order.menu_id
                       JOIN pizzeria p ON menu.pizzeria_id = p.id),
     female AS (SELECT p.name AS pizzeria_name
                FROM person_order
                         JOIN person ON person_order.person_id = person.id AND gender = 'female'
                         JOIN menu ON menu.id = person_order.menu_id
                         JOIN pizzeria p ON menu.pizzeria_id = p.id)
    (SELECT pizzeria_name
     FROM male
     EXCEPT
     SELECT pizzeria_name
     FROM female)
UNION
(SELECT pizzeria_name
 FROM female
 EXCEPT
 SELECT pizzeria_name
 FROM male)
ORDER BY pizzeria_name ASC;