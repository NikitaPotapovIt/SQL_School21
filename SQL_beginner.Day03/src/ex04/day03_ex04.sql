WITH female_only AS (
    SELECT DISTINCT 
        pz.name AS pizzeria_name
    FROM 
        person_order po
    JOIN 
        person p ON po.person_id = p.id
    JOIN 
        menu m ON po.menu_id = m.id
    JOIN 
        pizzeria pz ON m.pizzeria_id = pz.id
    WHERE 
        p.gender = 'female'
    EXCEPT
    SELECT DISTINCT 
        pz.name AS pizzeria_name
    FROM 
        person_order po
    JOIN 
        person p ON po.person_id = p.id
    JOIN 
        menu m ON po.menu_id = m.id
    JOIN 
        pizzeria pz ON m.pizzeria_id = pz.id
    WHERE 
        p.gender = 'male'
),
male_only AS (
    SELECT DISTINCT 
        pz.name AS pizzeria_name
    FROM 
        person_order po
    JOIN 
        person p ON po.person_id = p.id
    JOIN 
        menu m ON po.menu_id = m.id
    JOIN 
        pizzeria pz ON m.pizzeria_id = pz.id
    WHERE 
        p.gender = 'male'
    EXCEPT
    SELECT DISTINCT 
        pz.name AS pizzeria_name
    FROM 
        person_order po
    JOIN 
        person p ON po.person_id = p.id
    JOIN 
        menu m ON po.menu_id = m.id
    JOIN 
        pizzeria pz ON m.pizzeria_id = pz.id
    WHERE 
        p.gender = 'female'
)
SELECT 
    pizzeria_name
FROM 
    female_only

UNION

SELECT 
    pizzeria_name
FROM 
    male_only

ORDER BY 
    pizzeria_name ASC;
