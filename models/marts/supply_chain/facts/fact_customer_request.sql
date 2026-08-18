SELECT
    customer_request.id AS nk_customer_request,

    date_dim.sk_date AS fk_date,
    customer_dim.sk_customer AS fk_customer,
    product_dim.sk_product AS fk_product,

    payment_method_dim.nk_payment_method AS fk_payment_method,

    customer_request.requested_quantity,
    customer_request.total_amount,
    customer_request.amount_excluding_tax

FROM {{ source('replica', 'customer_request') }} AS customer_request

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON customer_request.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_customer') }} AS customer_dim
    ON customer_request.fk_customer = customer_dim.nk_customer
    AND customer_request.fk_date >= customer_dim.valid_from::date
    AND customer_request.fk_date < COALESCE(customer_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_product') }} AS product_dim
    ON customer_request.fk_product = product_dim.nk_product
    AND customer_request.fk_date >= product_dim.valid_from::date
    AND customer_request.fk_date < COALESCE(product_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_payment_method') }} AS payment_method_dim
    ON customer_request.fk_payment_method = payment_method_dim.nk_payment_method