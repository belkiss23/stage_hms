WITH purchase_agg AS (

    SELECT
        fk_date,
        fk_product,
        fk_supplier,

        SUM(total_amount) AS total_purchase_amount,
        SUM(ordered_quantity) AS total_ordered_quantity,
        COUNT(*) AS purchase_count

    FROM {{ ref('fact_purchase') }}

    GROUP BY
        fk_date,
        fk_product,
        fk_supplier
)

SELECT
    *,

    total_purchase_amount
        / NULLIF(total_ordered_quantity, 0)
        AS average_purchase_price,

    total_purchase_amount
        / NULLIF(purchase_count, 0)
        AS average_purchase_order_value,

    total_purchase_amount
        / NULLIF(
            SUM(total_purchase_amount)
                OVER (PARTITION BY fk_date),
            0
        )
        AS supplier_contribution_ratio,

    (
        total_purchase_amount
        - LAG(total_purchase_amount)
            OVER (
                PARTITION BY fk_product
                ORDER BY fk_date
            )
    )
    /
    NULLIF(
        LAG(total_purchase_amount)
            OVER (
                PARTITION BY fk_product
                ORDER BY fk_date
            ),
        0
    )
    AS purchase_growth_rate

FROM purchase_agg