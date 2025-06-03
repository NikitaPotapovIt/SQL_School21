SELECT DISTINCT 
    p.name
FROM 
    person_order po
JOIN 
    menu m ON po.menu_id = m.id
JOIN 
    person p ON po.person_id = p.id
WHERE 
    p.gender = 'female'
    AND m.pizza_name IN ('pepperoni pizza', 'cheese pizza')
GROUP BY 
    p.name
HAVING 
    COUNT(DISTINCT m.pizza_name) = 2
ORDER BY 
    p.name ASC;
