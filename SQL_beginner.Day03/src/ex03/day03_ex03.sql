WITH female_visits AS (
    SELECT 
        pz.name AS pizzeria_name,
        COUNT(*) AS visit_count
    FROM 
        person_visits pv
    JOIN 
        person p ON pv.person_id = p.id
    JOIN 
        pizzeria pz ON pv.pizzeria_id = pz.id
    WHERE 
        p.gender = 'female'
    GROUP BY 
        pz.name
),
male_visits AS (
    SELECT 
        pz.name AS pizzeria_name,
        COUNT(*) AS visit_count
    FROM 
        person_visits pv
    JOIN 
        person p ON pv.person_id = p.id
    JOIN 
        pizzeria pz ON pv.pizzeria_id = pz.id
    WHERE 
        p.gender = 'male'
    GROUP BY 
        pz.name
),
more_female_visits AS (
    SELECT 
        f.pizzeria_name
    FROM 
        female_visits f
    LEFT JOIN 
        male_visits m ON f.pizzeria_name = m.pizzeria_name
    WHERE 
        f.visit_count > COALESCE(m.visit_count, 0)
),
more_male_visits AS (
    SELECT 
        m.pizzeria_name
    FROM 
        male_visits m
    LEFT JOIN 
        female_visits f ON m.pizzeria_name = f.pizzeria_name
    WHERE 
        m.visit_count > COALESCE(f.visit_count, 0)
)
SELECT 
    pizzeria_name
FROM 
    more_female_visits

UNION ALL

SELECT 
    pizzeria_name
FROM 
    more_male_visits

ORDER BY 
    pizzeria_name ASC;
