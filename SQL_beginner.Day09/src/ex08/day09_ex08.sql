CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fib_number INTEGER) AS $$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    temp INTEGER;
BEGIN
    fib_number := a; -- Первое число Фибоначчи
    RETURN NEXT;

    WHILE b < pstop LOOP
        fib_number := b; -- Возвращаем текущее число
        RETURN NEXT;

        -- Генерация следующего числа Фибоначчи
        temp := a + b;
        a := b;
        b := temp;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(20);
