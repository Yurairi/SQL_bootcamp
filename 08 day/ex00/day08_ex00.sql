-- S1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;

-- S2
SELECT * FROM pizzeria;

-- S1
COMMIT;

-- S2
SELECT * FROM pizzeria;