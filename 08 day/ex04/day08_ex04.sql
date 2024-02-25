--S1 && S2
SHOW TRANSACTION ISOLATION LEVEL;

-- S2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- S1
BEGIN;

-- S2
BEGIN;

-- S1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- S2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- S1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- S2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';