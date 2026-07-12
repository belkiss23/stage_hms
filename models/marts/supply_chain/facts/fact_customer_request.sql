SELECT
    fk_date,
    fk_customer,
    fk_product,
    fk_payment_method,

    requested_quantity,
    total_amount,
    amount_excluding_tax

FROM {{ source('replica', 'customer_request') }}