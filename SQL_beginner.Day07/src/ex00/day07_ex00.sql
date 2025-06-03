SELECT 
    person_id, 
    COUNT(*) AS count_visits
FROM 
    person_visits
GROUP BY 
    person_id
ORDER BY 
    count_visits DESC,
    person_id ASC;
