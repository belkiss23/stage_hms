SELECT
    fk_date,
    fk_customer,
    fk_payment_method,
    fk_financial_transaction_type,

    cash_in_amount,
    cash_out_amount,
    opening_cash_balance,
    closing_cash_balance,
    cash_transaction_count,

FROM {{ source('replica', 'cash') }}