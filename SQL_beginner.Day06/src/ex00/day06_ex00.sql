CREATE TABLE person_discounts (
    id SERIAL PRIMARY KEY, -- Первичный ключ с автоматическим увеличением
    person_id INT NOT NULL, -- Внешний ключ для таблицы person
    pizzeria_id INT NOT NULL, -- Внешний ключ для таблицы pizzeria
    discount NUMERIC(4, 2) NOT NULL, -- Скидка в процентах (например, 10.50)
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id), -- Ограничение внешнего ключа для person_id
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id) -- Ограничение внешнего ключа для pizzeria_id
);


DROP TABLE IF EXISTS person_discounts;
