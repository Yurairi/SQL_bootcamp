--S1 && S2
SHOW TRANSACTION ISOLATION LEVEL;

-- S1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- S2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- S1
BEGIN;

-- S2
BEGIN;

-- S1
SELECT SUM(rating) FROM pizzeria;

-- S2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

-- S1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- S2
SELECT SUM(rating) FROM pizzeria;