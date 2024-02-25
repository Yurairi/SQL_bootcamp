WITH TEMP AS (SELECT generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, INTERVAL '1 day')::date AS date)
SELECT date
FROM TEMP
         LEFT JOIN (SELECT person_id, visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS pi
                   ON date = pi.visit_date
WHERE pi.person_id IS NULL
ORDER BY 1 ASC;