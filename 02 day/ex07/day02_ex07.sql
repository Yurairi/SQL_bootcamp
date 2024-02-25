SELECT pi.name
FROM person_visits
         JOIN (SELECT id, name FROM person WHERE name = 'Dmitriy') AS pe ON pe.id = person_visits.person_id
         JOIN (SELECT price, pizzeria_id FROM menu WHERE price < 800) AS me
              ON me.pizzeria_id = person_visits.pizzeria_id
         JOIN (SELECT name, id FROM pizzeria) AS pi ON pi.id = person_visits.pizzeria_id
WHERE person_visits.visit_date = '2022-01-08';
