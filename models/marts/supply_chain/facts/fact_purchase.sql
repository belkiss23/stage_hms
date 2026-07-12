SELECT
    fk_date,
    fk_supplier,
    fk_product,
    fk_payment_method,

    total_amount,
    amount_excluding_tax,
    unit_purchase_price,
    ordered_quantity

FROM {{ source('replica', 'purchase') }}