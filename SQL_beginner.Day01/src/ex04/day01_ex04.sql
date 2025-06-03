SELECT 
    po.person_id AS person_id
FROM 
    person_order po
LEFT JOIN 
    person_visits pv
ON 
    po.person_id = pv.person_id AND pv.visit_date = '2022-01-07'
WHERE 
    po.order_date = '2022-01-07' AND pv.person_id IS NULL;
