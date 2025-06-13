CREATE INDEX idx_person_order_person_id ON person_order (person_id);
CREATE INDEX idx_person_order_menu_id ON person_order (menu_id);

CREATE INDEX idx_person_visits_person_id ON person_visits (person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits (pizzeria_id);

CREATE INDEX idx_menu_pizzeria_id ON menu (pizzeria_id);


SELECT indexname, tablename 
FROM pg_indexes
WHERE schemaname = 'public'
  AND indexname IN (
    'idx_person_order_person_id',
    'idx_person_order_menu_id',
    'idx_person_visits_person_id',
    'idx_person_visits_pizzeria_id',
    'idx_menu_pizzeria_id'
  );

DROP INDEX IF EXISTS {idx_person_order_person_id};
DROP INDEX IF EXISTS {idx_person_order_menu_id};
DROP INDEX IF EXISTS {idx_person_visits_person_id};
DROP INDEX IF EXISTS {idx_person_visits_pizzeria_id};
DROP INDEX IF EXISTS {idx_menu_pizzeria_id};
