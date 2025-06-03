SELECT 
    pz.name AS pizzeria_name,
    pz.rating
FROM 
    pizzeria pz
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM person_visits pv
        WHERE pv.pizzeria_id = pz.id
    );

