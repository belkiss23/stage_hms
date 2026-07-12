SELECT
    fk_date,
    fk_customer,
    fk_product,
    fk_payment_method,

    total_amount,
    amount_excluding_tax,
    profit_margin,
    profit_margin_percentage,
    unit_selling_price,
    quantity_sold

FROM {{ source('replica', 'sales') }}