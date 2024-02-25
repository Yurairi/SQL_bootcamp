SELECT p.name, COUNT(pizzeria_id) AS count_of_visits
FROM person_visits
JOIN person p ON person_visits.person_id = p.id
GROUP BY p.name
HAVING COUNT(pizzeria_id) > 3
ORDER BY 2 DESC, 1 ASC;