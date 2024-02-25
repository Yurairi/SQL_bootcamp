SELECT pe.name
FROM person_order
         JOIN (SElECT id, name, address, gender
               FROM person
               WHERE gender = 'male'
                 AND (address = 'Moscow' OR address= 'Samara')) AS pe ON pe.id = person_order.person_id
         JOIN (SELECT pizza_name, id
               FROM menu
               WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AS me
              ON me.id = person_order.menu_id
ORDEr BY 1 DESC;
