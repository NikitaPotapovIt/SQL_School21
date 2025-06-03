WITH RECURSIVE tours AS (
    SELECT 
        ARRAY[point1]::TEXT[] AS visited_points,
        point1 AS current_point,
        0 AS total_cost
    FROM roads
    WHERE point1 = 'a'

    UNION

    SELECT 
        t.visited_points || r.point2::TEXT AS visited_points,
        r.point2 AS current_point,
        t.total_cost + r.cost AS total_cost
    FROM tours t
    JOIN roads r 
        ON t.current_point = r.point1
    WHERE NOT (r.point2 = ANY(t.visited_points))
)

SELECT
    total_cost + r.cost AS total_cost,
    '{' || array_to_string(visited_points || ARRAY['a']::TEXT[], ',') || '}' AS tour
FROM tours t
JOIN roads r 
    ON t.current_point = r.point1 AND r.point2 = 'a' 
WHERE array_length(visited_points, 1) = 4
ORDER BY total_cost ASC, tour ASC;
