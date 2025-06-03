SELECT
    po.order_date AS order_date,
    p.name || ' (возраст:' || p.age || ')' AS person_info
FROM 
    person_order po
INNER JOIN 
    person p
ON 
    po.person_id = p.id
ORDER BY 
    order_date ASC, 
    person_info ASC;
