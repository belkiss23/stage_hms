SELECT
    fk_date,
    fk_customer,
    fk_supplier,
    fk_payment_method,
    fk_financial_transaction_type,

    cash_in_amount,
    cash_out_amount,
    opening_bank_balance,
    cloqing_bank_balance,
    bank_fees,
    transaction_count

FROM {{ source('replica', 'bank') }}