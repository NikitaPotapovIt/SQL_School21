CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT 
    pizzeria.name AS pizzeria_name
FROM 
    person_visits pv
JOIN 
    person p ON pv.person_id = p.id
JOIN 
    pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN 
    menu m ON pizzeria.id = m.pizzeria_id
WHERE 
    p.name = 'Dmitriy' 
    AND pv.visit_date = '2022-01-08'
    AND m.price < 800;


SELECT * FROM mv_dmitriy_visits_and_eats;

DROP MATERIALIZED VIEW IF EXISTS mv_dmitriy_visits_and_eats;
