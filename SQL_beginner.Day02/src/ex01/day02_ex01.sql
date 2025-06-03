SELECT 
    missing_date
FROM (
    SELECT 
        generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS missing_date

    EXCEPT

    SELECT 
        visit_date
    FROM 
        person_visits
    WHERE 
        person_id IN (1, 2)
) AS subquery
ORDER BY 
    missing_date ASC;
