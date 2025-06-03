WITH visits_count AS (
    -- Подсчет количества посещений для каждой пиццерии
    SELECT 
        pz.id AS pizzeria_id,
        pz.name AS pizzeria_name,
        COUNT(pv.id) AS visit_count
    FROM 
        pizzeria pz
    LEFT JOIN 
        person_visits pv ON pz.id = pv.pizzeria_id
    GROUP BY 
        pz.id, pz.name
),
orders_count AS (
    -- Подсчет количества заказов для каждой пиццерии
    SELECT 
        pz.id AS pizzeria_id,
        pz.name AS pizzeria_name,
        COUNT(po.id) AS order_count
    FROM 
        pizzeria pz
    LEFT JOIN 
        menu m ON pz.id = m.pizzeria_id
    LEFT JOIN 
        person_order po ON m.id = po.menu_id
    GROUP BY 
        pz.id, pz.name
),
combined_counts AS (
    -- Объединение данных о посещениях и заказах
    SELECT 
        COALESCE(v.pizzeria_id, o.pizzeria_id) AS pizzeria_id,
        COALESCE(v.pizzeria_name, o.pizzeria_name) AS pizzeria_name,
        COALESCE(v.visit_count, 0) AS visit_count,
        COALESCE(o.order_count, 0) AS order_count,
        COALESCE(v.visit_count, 0) + COALESCE(o.order_count, 0) AS total_count
    FROM 
        visits_count v
    FULL OUTER JOIN 
        orders_count o ON v.pizzeria_id = o.pizzeria_id
)
SELECT 
    pizzeria_name,
    total_count
FROM 
    combined_counts
ORDER BY 
    total_count DESC, -- Сначала по общему количеству в убывающем порядке
    pizzeria_name ASC; -- Затем по названию пиццерии в возрастающем порядке
    