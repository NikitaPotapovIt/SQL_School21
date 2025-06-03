SELECT 
    po.order_date AS order_date,
    p.name || ' (возраст:' || p.age || ')' AS person_info
FROM 
    person_order po
NATURAL JOIN 
    (SELECT id AS person_id, name, age FROM person) p
ORDER BY 
    order_date ASC, 
    person_info ASC;
