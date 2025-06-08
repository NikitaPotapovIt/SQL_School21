WITH LatestCurrencyRates AS (
    -- Находим последний курс для каждой валюты
    SELECT
        id AS currency_id,
        name AS currency_name,
        rate_to_usd,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) AS rn
    FROM currency
),
AggregatedBalances AS (
    -- Агрегируем данные по пользователю и типу баланса
    SELECT
        u.id AS user_id,
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        b.type AS balance_type,
        SUM(b.money) AS total_volume,
        b.currency_id
    FROM balance b
    LEFT JOIN "user" u ON b.user_id = u.id
    GROUP BY u.id, u.name, u.lastname, b.type, b.currency_id
)
SELECT
    ab.name,
    ab.lastname,
    ab.balance_type AS type,
    ab.total_volume AS volume,
    COALESCE(lcr.currency_name, 'not defined') AS currency_name,
    COALESCE(lcr.rate_to_usd, 1) AS last_rate_to_usd,
    ab.total_volume * COALESCE(lcr.rate_to_usd, 1) AS total_volume_in_usd
FROM AggregatedBalances ab
LEFT JOIN LatestCurrencyRates lcr
    ON ab.currency_id = lcr.currency_id AND lcr.rn = 1
ORDER BY
    ab.name DESC,
    ab.lastname ASC,
    ab.balance_type ASC;
