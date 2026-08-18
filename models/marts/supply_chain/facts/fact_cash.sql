SELECT
    cash.id AS nk_cash,

    date_dim.sk_date AS fk_date,
    customer_dim.sk_customer AS fk_customer,

    payment_method_dim.nk_payment_method AS fk_payment_method,
    financial_transaction_type_dim.nk_financial_transaction_type AS fk_financial_transaction_type,

    cash.cash_in_amount,
    cash.cash_out_amount,
    cash.opening_cash_balance,
    cash.closing_cash_balance,
    cash.cash_transaction_count

FROM {{ source('replica', 'cash') }} AS cash

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON cash.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_customer') }} AS customer_dim
    ON cash.fk_customer = customer_dim.nk_customer
    AND cash.fk_date >= customer_dim.valid_from::date
    AND cash.fk_date < COALESCE(customer_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_payment_method') }} AS payment_method_dim
    ON cash.fk_payment_method = payment_method_dim.nk_payment_method

LEFT JOIN {{ ref('dim_financial_transaction_type') }} AS financial_transaction_type_dim
    ON cash.fk_financial_transaction_type =
       financial_transaction_type_dim.nk_financial_transaction_type