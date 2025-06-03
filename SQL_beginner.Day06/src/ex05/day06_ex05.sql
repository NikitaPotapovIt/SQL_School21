-- Комментарий к таблице person_discounts
COMMENT ON TABLE person_discounts IS 
'Таблица содержит информацию о персональных скидках для клиентов при заказе пиццы в конкретных пиццериях. 
Бизнес-цель: стимулировать лояльность клиентов, предоставляя им скидки на основе истории заказов.';

-- Комментарий к столбцу id
COMMENT ON COLUMN person_discounts.id IS 
'Уникальный идентификатор записи в таблице (первичный ключ).';

-- Комментарий к столбцу person_id
COMMENT ON COLUMN person_discounts.person_id IS 
'Идентификатор клиента (внешний ключ, ссылается на таблицу person). 
Указывает, кому предоставляется скидка.';

-- Комментарий к столбцу pizzeria_id
COMMENT ON COLUMN person_discounts.pizzeria_id IS 
'Идентификатор пиццерии (внешний ключ, ссылается на таблицу pizzeria). 
Указывает, в какой пиццерии действует скидка.';

-- Комментарий к столбцу discount
COMMENT ON COLUMN person_discounts.discount IS 
'Размер скидки в процентах (от 0 до 100). 
Определяется на основе количества заказов клиента в конкретной пиццерии.';


SELECT obj_description('person_discounts'::regclass);

SELECT column_name, pg_catalog.col_description('person_discounts'::regclass, ordinal_position)
FROM information_schema.columns
WHERE table_name = 'person_discounts';
