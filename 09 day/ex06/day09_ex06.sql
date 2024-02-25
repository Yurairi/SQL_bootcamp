CREATE
    OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson
                                                               VARCHAR DEFAULT 'Dmitriy', IN pprice
                                                               NUMERIC DEFAULT 500, IN pdate
                                                               DATE DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                name VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY (select DISTINCT pizzeria.name
                  FROM pizzeria
                           JOIN menu m ON pizzeria.id = m.pizzeria_id
                           JOIN person_order po ON m.id = po.menu_id
                           JOIN person p ON p.id = po.person_id
                  WHERE p.name = pperson
                    AND m.price < pprice
                    AND po.order_date = pdate);
END;
$$
    LANGUAGE plpgsql;

--DROP FUNCTION fnc_person_visits_and_eats_on_date;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');