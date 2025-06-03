WITH filtered_visits AS (
    SELECT 
        pv.person_id,
        pv.pizzeria_id,
        pv.visit_date
    FROM 
        person_visits pv
    WHERE 
        pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
),
combined_data AS (
    SELECT 
        COALESCE(p.name, '-') AS person_name,
        COALESCE(TO_CHAR(fv.visit_date, 'YYYY-MM-DD'), 'null') AS visit_date,
        COALESCE(pz.name, '-') AS pizzeria_name
    FROM 
        person p
    FULL JOIN 
        filtered_visits fv ON p.id = fv.person_id
    FULL JOIN 
        pizzeria pz ON fv.pizzeria_id = pz.id

    UNION

    SELECT 
        '-', 
        'null', 
        pz.name
    FROM 
        pizzeria pz
    WHERE 
        pz.id NOT IN (
            SELECT DISTINCT pizzeria_id 
            FROM person_visits
            WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
        )
)
SELECT *
FROM combined_data
ORDER BY 
    person_name ASC, 
    visit_date ASC, 
    pizzeria_name ASC;
