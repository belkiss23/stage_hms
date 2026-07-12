WITH inventory_agg AS (

    SELECT
        id_date,
        id_produit,
        id_entrepot,
        id_emplacement,

        SUM(stock_initial) AS total_opening_stock,
        SUM(stock_final) AS total_closing_stock,
        SUM(quantite) AS total_stock_movement,

        AVG((stock_initial + stock_final) / 2.0) AS average_inventory

    FROM {{ ref('fact_inventory') }}

    GROUP BY
        id_date,
        id_produit,
        id_entrepot,
        id_emplacement
)

SELECT
    *,

    -- Stock Variation Ratio
    (total_closing_stock - total_opening_stock)
        / NULLIF(total_opening_stock, 0)
        AS stock_variation_ratio,

    -- Inventory Turnover Ratio
    total_stock_movement
        / NULLIF(average_inventory, 0)
        AS inventory_turnover_ratio,

    -- Stock Availability Ratio
    CASE
        WHEN total_closing_stock > 0 THEN 1.0
        ELSE 0.0
    END AS stock_availability_ratio,

    -- Stockout Ratio
    CASE
        WHEN total_closing_stock = 0 THEN 1.0
        ELSE 0.0
    END AS stockout_ratio

FROM inventory_agg