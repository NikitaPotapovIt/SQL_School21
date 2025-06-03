SELECT 
    m.pizza_name,
    m.price,
    pz.name AS pizzeria_name
FROM 
    menu m
JOIN 
    pizzeria pz ON m.pizzeria_id = pz.id
LEFT JOIN 
    person_order po ON m.id = po.menu_id
WHERE 
    po.menu_id IS NULL
ORDER BY 
    m.pizza_name ASC, 
    m.price ASC;
