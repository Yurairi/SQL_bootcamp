SELECT name
FROM person
         JOIN (SELECT person_id, count(*) AS count
               FROM person_order
                        JOIN menu
                             ON person_order.menu_id = menu.id
               WHERE pizza_name = 'pepperoni pizza'
               GROUP BY person_id) AS temp_table
               ON person.id = person_id
WHERE gender = 'female' AND temp_table.count > 0
INTERSECT
SELECT name
FROM person
         JOIN (SELECT person_id, count(*) AS count
               FROM person_order
                        JOIN menu
                             ON person_order.menu_id = menu.id
               WHERE pizza_name = 'cheese pizza'
               GROUP BY person_id) AS temp_table
               ON person.id = person_id
WHERE gender = 'female' AND temp_table.count > 0
ORDER BY name ASC;