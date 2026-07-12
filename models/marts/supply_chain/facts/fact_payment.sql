SELECT
    fk_date,
    fk_customer,
    fk_supplier,
    fk_payment_method,
    fk_financial_transaction_type,

    payment_amount,
    remaining_amount,
    discount_amount,
    penalty_amount,
    payment_status,
    payment_count,
    payment_delay_days

FROM {{ source('replica', 'payment') }}