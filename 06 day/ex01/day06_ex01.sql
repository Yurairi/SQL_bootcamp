WITH he_he_table AS (
    SELECT person_order.person_id,
           m.pizzeria_id,
           COUNT(person_id) AS person_count,
           CASE
               WHEN COUNT(person_id) = 1 THEN 10.5
               WHEN COUNT(person_id) = 2 THEN 22
               ELSE 30
               END             discount
    FROM person_order
             JOIN menu m ON person_order.menu_id = m.id
             JOIN pizzeria p ON p.id = m.pizzeria_id
    GROUP BY person_order.person_id, m.pizzeria_id)

INSERT
INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER ( ) AS id,
       he_he_table.person_id,
       he_he_table.pizzeria_id,
       he_he_table.discount
FROM he_he_table;

SELECT *
FROM person_discounts;


--DROP TABLE person_discounts;