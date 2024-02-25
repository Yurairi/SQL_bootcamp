CREATE SEQUENCE seq_person_discounts START 1;
SELECT SETVAL('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');



INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (8, 6, 22);


-- DROP SEQUENCE  seq_person_discounts;
-- DROP TABLE person_discounts;