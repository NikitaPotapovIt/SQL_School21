-- Session 1
begin transaction isolation level REPEATABLE READ;
SELECT SUM(rating) AS total_rating FROM pizzeria;
SELECT SUM(rating) AS total_rating FROM pizzeria;
commit;
SELECT SUM(rating) AS total_rating FROM pizzeria;

-- Session 2
begin transaction isolation level REPEATABLE READ;
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
commit;
SELECT SUM(rating) AS total_rating FROM pizzeria;
