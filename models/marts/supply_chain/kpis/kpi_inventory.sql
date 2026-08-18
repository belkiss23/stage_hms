WITH inventory_agg AS (

    SELECT
        fk_date,
        fk_product,
        fk_warehouse,
        fk_storage_location,

        SUM(opening_stock) AS total_opening_stock,
        SUM(closing_stock) AS total_closing_stock,
        SUM(quantity) AS total_stock_movement,

        AVG((opening_stock + closing_stock) / 2.0) AS average_inventory

    FROM {{ ref('fact_inventory') }}

    GROUP BY
        fk_date,
        fk_product,
        fk_warehouse,
        fk_storage_location
)

SELECT
    *,

    (total_closing_stock - total_opening_stock)
        / NULLIF(total_opening_stock, 0)
        AS stock_variation_ratio,

    total_stock_movement
        / NULLIF(average_inventory, 0)
        AS inventory_turnover_ratio,

    CASE
        WHEN total_closing_stock > 0 THEN 1.0
        ELSE 0.0
    END AS stock_availability_ratio,

    CASE
        WHEN total_closing_stock = 0 THEN 1.0
        ELSE 0.0
    END AS stockout_ratio

FROM inventory_agg