SELECT DISTINCT
    po.order_date AS action_date,
    po.person_id
FROM 
    person_order po
INNER JOIN 
    person_visits pv
ON 
    po.order_date = pv.visit_date AND po.person_id = pv.person_id
ORDER BY 
    action_date ASC, 
    po.person_id DESC;
