WITH combined_actions AS (
    -- Посещения (visits)
    SELECT 
        pz.name AS pizzeria_name,
        COUNT(*) AS count,
        'visit' AS action_type
    FROM 
        person_visits pv
    JOIN 
        pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY 
        pz.name

    UNION ALL

    -- Заказы (orders)
    SELECT 
        pz.name AS pizzeria_name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM 
        person_order po
    JOIN 
        menu m ON po.menu_id = m.id
    JOIN 
        pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY 
        pz.name
),
ranked_actions AS (
    SELECT 
        pizzeria_name,
        count,
        action_type,
        ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY count DESC, pizzeria_name ASC) AS rank
    FROM 
        combined_actions
)
SELECT 
    pizzeria_name,
    count,
    action_type
FROM 
    ranked_actions
WHERE 
    rank <= 3
ORDER BY 
    action_type ASC,
    count DESC;
    