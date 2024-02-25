-- S1
BEGIN;

-- S2
BEGIN;

-- S1
UPDATE pizzeria SET rating = 2 WHERE name = 'Pizza Hut';

-- S2
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';

-- S1
UPDATE pizzeria SET rating = 1 WHERE name = 'Dominos';

-- S2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

-- S1
COMMIT;

-- S2
COMMIT;