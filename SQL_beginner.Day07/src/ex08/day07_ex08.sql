SELECT 
    p.address AS person_address,
    pz.name AS pizzeria_name,
    COUNT(po.id) AS order_count
FROM 
    person p
JOIN 
    person_order po ON p.id = po.person_id
JOIN 
    menu m ON po.menu_id = m.id
JOIN 
    pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY 
    p.address, pz.name
ORDER BY 
    p.address ASC,
    pz.name ASC;
