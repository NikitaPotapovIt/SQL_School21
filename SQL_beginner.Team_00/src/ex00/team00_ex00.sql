WITH RECURSIVE tours AS (
    SELECT 
        ARRAY[point1]::TEXT[] AS tour,
        point1 AS current_point,
        0 AS total_cost
    FROM roads
    WHERE point1 = 'a'

    UNION

    SELECT 
        (t.tour || r.point2)::TEXT[] AS tour,
        r.point2 AS current_point,
        t.total_cost + r.cost AS total_cost
    FROM tours t
    JOIN roads r 
        ON t.current_point = r.point1
    WHERE NOT (r.point2 = ANY(t.tour))
)

SELECT 
    total_cost + r.cost AS total_cost,
    '{' || array_to_string(tour || ARRAY['a']::TEXT[], ',') || '}' AS tour
FROM tours t
JOIN roads r 
    ON t.current_point = r.point1 AND r.point2 = 'a'
WHERE array_length(tour, 1) = 4
  AND total_cost + r.cost = (
      SELECT MIN(total_cost + r2.cost)
      FROM tours t2
      JOIN roads r2 
          ON t2.current_point = r2.point1 AND r2.point2 = 'a'
      WHERE array_length(t2.tour, 1) = 4
  )
ORDER BY total_cost ASC, tour ASC;
