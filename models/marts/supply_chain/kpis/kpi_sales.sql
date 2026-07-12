WITH sales_agg AS (

    SELECT
        id_date,
        id_produit,
        id_client,

        SUM(montant_total) AS total_sales_amount,
        SUM(quantite_vendue) AS total_quantity_sold,
        SUM(marge) AS total_profit_margin,
        COUNT(*) AS sales_count

    FROM {{ ref('fact_sales') }}

    GROUP BY
        id_date,
        id_produit,
        id_client
)

SELECT
    *,

    total_sales_amount
        / NULLIF(total_quantity_sold, 0)
        AS average_selling_price,

    total_profit_margin
        / NULLIF(total_sales_amount, 0)
        AS profit_margin_ratio,

    total_sales_amount
        / NULLIF(sales_count, 0)
        AS average_order_value,

    total_sales_amount
        / NULLIF(
            SUM(total_sales_amount)
                OVER (PARTITION BY id_date),
            0
        )
        AS product_contribution_ratio,

    (
        total_sales_amount
        - LAG(total_sales_amount)
            OVER (
                PARTITION BY id_produit
                ORDER BY id_date
            )
    )
    /
    NULLIF(
        LAG(total_sales_amount)
            OVER (
                PARTITION BY id_produit
                ORDER BY id_date
            ),
        0
    )
    AS sales_growth_rate

FROM sales_agg