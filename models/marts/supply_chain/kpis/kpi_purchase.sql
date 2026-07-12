WITH purchase_agg AS (

    SELECT
        id_date,
        id_produit,
        id_fournisseur,

        SUM(montant_total) AS total_purchase_amount,
        SUM(quantite_commandee) AS total_ordered_quantity,
        COUNT(*) AS purchase_count

    FROM {{ ref('fact_purchase') }}

    GROUP BY
        id_date,
        id_produit,
        id_fournisseur
)

SELECT
    *,

    -- Average Purchase Price
    total_purchase_amount
        / NULLIF(total_ordered_quantity, 0)
        AS average_purchase_price,

    -- Average Purchase Order Value
    total_purchase_amount
        / NULLIF(purchase_count, 0)
        AS average_purchase_order_value,

    -- Supplier Contribution Ratio
    total_purchase_amount
        / NULLIF(
            SUM(total_purchase_amount)
                OVER (PARTITION BY id_date),
            0
        )
        AS supplier_contribution_ratio,

    -- Purchase Growth Rate
    (
        total_purchase_amount
        - LAG(total_purchase_amount)
            OVER (
                PARTITION BY id_produit
                ORDER BY id_date
            )
    )
    /
    NULLIF(
        LAG(total_purchase_amount)
            OVER (
                PARTITION BY id_produit
                ORDER BY id_date
            ),
        0
    )
    AS purchase_growth_rate

FROM purchase_agg