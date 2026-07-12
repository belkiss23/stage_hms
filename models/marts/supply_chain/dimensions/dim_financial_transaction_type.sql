SELECT
    nk_financial_transaction_type,

    transaction_name,
    cash_flow_direction

FROM {{ source('replica', 'financial_transaction_type') }}