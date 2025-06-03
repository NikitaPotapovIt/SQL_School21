SELECT 
    p.name AS person_name
FROM 
    person_order po
JOIN 
    menu m ON po.menu_id = m.id
JOIN 
    person p ON po.person_id = p.id

UNION

SELECT 
    p.name AS person_name
FROM 
    person_visits pv
JOIN 
    person p ON pv.person_id = p.id
ORDER BY 
    person_name ASC;
    