INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES 
    (
        (SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-24'
    ),
    (
        (SELECT COALESCE(MAX(id), 0) + 2 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-24'
    );

SELECT * FROM person_visits WHERE visit_date = '2022-02-24';


DELETE FROM person_visits
WHERE visit_date = '2022-02-24';
