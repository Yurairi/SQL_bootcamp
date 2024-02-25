SELECT name, SUM(COUNT)
FROM ((SELECT p.name AS name, COUNT(person_id) AS COUNT, 'visit' AS action_type
       FROM person_visits
           JOIN pizzeria p
       ON p.id = person_visits.pizzeria_id
       GROUP BY p.name)
      UNION ALL
      (SELECT p2.name AS name, COUNT(person_id) AS COUNT, 'order' AS action_type
       FROM person_order
           JOIN menu m
       ON m.id = person_order.menu_id
           JOIN pizzeria p2 ON p2.id = m.pizzeria_id
       GROUP BY p2.name)
      ORDER BY 3, 2 DESC) AS hell
GROUP BY name
ORDER BY 2 DESC, 1 ASC;