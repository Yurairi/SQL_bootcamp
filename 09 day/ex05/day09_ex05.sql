--DROP FUNCTION fnc_persons_male;
--DROP FUNCTION fnc_persons_female;

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender VARCHAR DEFAULT 'female')
    RETURNS TABLE
            (
                id      BIGINT,
                name    VARCHAR,
                age     INTEGER,
                gender  VARCHAR,
                address VARCHAR
            )
AS
$$
SELECT *
FROM person
WHERE gender = pgender;
$$
    LANGUAGE sql;


SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();