select COALESCE(person.name, '-') as person_name,
       COALESCE(visit_date, null) as visit_date,
       COALESCE(Pi.name, '-')     as pizzeria_name
FROM person
         FULL OUTER JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pe
                         ON person.id = pe.person_id
         FULL OUTER JOIN (SELECT name, id FROM pizzeria) AS pi
                         ON pi.id = pe.pizzeria_id
ORDER BY 1 ASC, 2 ASC, 3 ASC;
