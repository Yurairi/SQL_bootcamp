CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
    RETURNS SETOF BIGINT AS
$$
WITH RECURSIVE fib(n, fib_n, fib_n_minus_1) AS (
    SELECT 1, 1, 0
    UNION ALL
    SELECT n + 1,
           fib_n + fib_n_minus_1,
           fib_n
    FROM fib
    WHERE fib_n + fib_n_minus_1 < pstop
)
SELECT fib_n
FROM fib;
$$ LANGUAGE SQL;


-- SELECT * FROM fnc_fibonacci(20);
-- DROP function fnc_fibonacci;


SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();