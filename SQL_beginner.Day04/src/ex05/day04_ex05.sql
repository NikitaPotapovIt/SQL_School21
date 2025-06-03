CREATE OR REPLACE VIEW v_price_with_discount AS
SELECT 
    p.name AS person_name,
    m.pizza_name,
    m.price AS actual_price,
    FLOOR(m.price - m.price * 0.1) AS discount_price
FROM 
    person_order po
JOIN 
    person p ON po.person_id = p.id
JOIN 
    menu m ON po.menu_id = m.id
ORDER BY 
    p.name ASC, 
    m.pizza_name ASC;


SELECT * FROM v_price_with_discount;

DROP VIEW IF EXISTS v_price_with_discount;
