SELECT
    payment.id AS nk_payment,

    date_dim.sk_date AS fk_date,

    customer_dim.sk_customer AS fk_customer,
    supplier_dim.sk_supplier AS fk_supplier,

    payment_method_dim.nk_payment_method AS fk_payment_method,
    financial_transaction_type_dim.nk_financial_transaction_type
        AS fk_financial_transaction_type,

    payment.payment_amount,
    payment.remaining_amount,
    payment.discount_amount,
    payment.penalty_amount,
    payment.payment_status,
    payment.payment_count,
    payment.payment_delay_days

FROM {{ source('replica', 'payment') }} AS payment

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON payment.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_customer') }} AS customer_dim
    ON payment.fk_customer = customer_dim.nk_customer
    AND payment.fk_date >= customer_dim.valid_from::date
    AND payment.fk_date < COALESCE(customer_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_supplier') }} AS supplier_dim
    ON payment.fk_supplier = supplier_dim.nk_supplier
    AND payment.fk_date >= supplier_dim.valid_from::date
    AND payment.fk_date < COALESCE(supplier_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_payment_method') }} AS payment_method_dim
    ON payment.fk_payment_method = payment_method_dim.nk_payment_method

LEFT JOIN {{ ref('dim_financial_transaction_type') }} AS financial_transaction_type_dim
    ON payment.fk_financial_transaction_type =
       financial_transaction_type_dim.nk_financial_transaction_type