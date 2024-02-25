WITH male AS (SELECT p.name AS pizzeria_name
              FROM person_visits
                       JOIN person ON person_visits.person_id = person.id AND gender = 'male'
                       JOIN pizzeria p ON person_visits.pizzeria_id = p.id),
     female AS (SELECT p.name AS pizzeria_name
                FROM person_visits
                         JOIN person ON person_visits.person_id = person.id AND gender = 'female'
                         JOIN pizzeria p ON person_visits.pizzeria_id = p.id)
    (SELECT pizzeria_name
     FROM male
     EXCEPT ALL
     SELECT pizzeria_name
     FROM female)
UNION
(SELECT pizzeria_name
 FROM female
 EXCEPT ALL
 SELECT pizzeria_name
 FROM male)
ORDER BY pizzeria_name ASC;