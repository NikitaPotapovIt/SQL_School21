INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER () AS id, -- Генерация уникального идентификатора
    po.person_id,               -- Идентификатор человека
    m.pizzeria_id,              -- Идентификатор пиццерии из таблицы menu
    CASE 
        WHEN COUNT(*) = 1 THEN 10.50 -- Если количество заказов = 1
        WHEN COUNT(*) = 2 THEN 22.00 -- Если количество заказов = 2
        ELSE 30.00                   -- Если количество заказов > 2
    END AS discount              -- Расчет скидки
FROM 
    person_order po
JOIN 
    menu m ON po.menu_id = m.id -- Соединение с таблицей menu для получения pizzeria_id
GROUP BY 
    po.person_id, m.pizzeria_id; -- Агрегация по person_id и pizzeria_id
    
    
    SELECT * FROM person_discounts;
    