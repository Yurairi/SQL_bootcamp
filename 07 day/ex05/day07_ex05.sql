SELECT p.name
FROM person_order
         JOIN person p ON person_order.person_id = p.id
GROUP BY p.name
ORDER BY 1 ASC;