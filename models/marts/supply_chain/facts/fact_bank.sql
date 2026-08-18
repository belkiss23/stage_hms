SELECT
    bank.id AS nk_bank,

    date_dim.sk_date AS fk_date,
    customer_dim.sk_customer AS fk_customer,
    supplier_dim.sk_supplier AS fk_supplier,

    payment_method_dim.nk_payment_method AS fk_payment_method,
    financial_transaction_type_dim.nk_financial_transaction_type AS fk_financial_transaction_type,

    bank.cash_in_amount,
    bank.cash_out_amount,
    bank.opening_bank_balance,
    bank.closing_bank_balance,
    bank.bank_fees,
    bank.transaction_count

FROM {{ source('replica', 'bank') }} AS bank

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON bank.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_customer') }} AS customer_dim
    ON bank.fk_customer = customer_dim.nk_customer
    AND bank.fk_date >= customer_dim.valid_from::date
    AND bank.fk_date < COALESCE(customer_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_supplier') }} AS supplier_dim
    ON bank.fk_supplier = supplier_dim.nk_supplier
    AND bank.fk_date >= supplier_dim.valid_from::date
    AND bank.fk_date < COALESCE(supplier_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_payment_method') }} AS payment_method_dim
    ON bank.fk_payment_method = payment_method_dim.nk_payment_method

LEFT JOIN {{ ref('dim_financial_transaction_type') }} AS financial_transaction_type_dim
    ON bank.fk_financial_transaction_type =
       financial_transaction_type_dim.nk_financial_transaction_type