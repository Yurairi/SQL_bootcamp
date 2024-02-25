SELECT name,
       pizza_name,
       price,
       price - ((price * discount) / 100) AS discount_price,
       pizzeria_name
FROM (SELECT pizza_name,
             price,
             p.name,
             pd.discount,
             p2.name AS pizzeria_name
      FROM menu m
               JOIN person_order po ON m.id = po.menu_id
               JOIN person p ON p.id = po.person_id
               JOIN pizzeria p2 ON p2.id = m.pizzeria_id
               JOIN person_discounts pd ON (p.id = pd.person_id AND pd.pizzeria_id = p2.id)
     ) AS he_he
ORDER BY 1 ASC, 2 ASC;