SELECT 
    p.name AS person_name,
    COUNT(*) AS count_visits
FROM 
    person_visits pv
JOIN 
    person p ON pv.person_id = p.id
GROUP BY 
    p.name
HAVING 
    COUNT(*) > 3
ORDER BY 
    count_visits DESC,
    person_name ASC;
