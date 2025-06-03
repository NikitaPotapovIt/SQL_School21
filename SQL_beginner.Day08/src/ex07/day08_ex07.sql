-- Session 1
begin;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 5 WHERE name = 'Dominos';
commit;

-- Session 2
begin;
UPDATE pizzeria SET rating = 5 WHERE name = 'Dominos';
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
commit;
