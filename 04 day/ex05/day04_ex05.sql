CREATE VIEW v_price_with_discount AS
SELECT *
FROM (SELECT name, pizza_name, price, (price * 0.9) ::integer AS discount_price
      FROM person_order
               JOIN person p ON p.id = person_order.person_id
               JOIN menu m ON person_order.menu_id = m.id
     ) AS v_symmetric_union
ORDER BY name, pizza_name;