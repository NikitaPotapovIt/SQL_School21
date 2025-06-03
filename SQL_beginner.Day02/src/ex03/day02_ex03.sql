WITH all_dates AS (
    SELECT 
        generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS missing_date
),
visited_dates AS (
    SELECT DISTINCT 
        visit_date
    FROM 
        person_visits
    WHERE 
        person_id IN (1, 2)
)
SELECT 
    missing_date
FROM 
    all_dates

EXCEPT

SELECT 
    visit_date
FROM 
    visited_dates

ORDER BY 
    missing_date ASC;
