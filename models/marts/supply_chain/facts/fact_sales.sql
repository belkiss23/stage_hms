SELECT
    sales.id AS nk_sales,

    date_dim.sk_date AS fk_date,

    customer_dim.sk_customer AS fk_customer,
    product_dim.sk_product AS fk_product,

    payment_method_dim.nk_payment_method AS fk_payment_method,

    sales.total_amount,
    sales.amount_excluding_tax,
    sales.profit_margin,
    sales.profit_margin_percentage,
    sales.unit_selling_price,
    sales.quantity_sold

FROM {{ source('replica', 'sales') }} AS sales

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON sales.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_customer') }} AS customer_dim
    ON sales.fk_customer = customer_dim.nk_customer
    AND sales.fk_date >= customer_dim.valid_from::date
    AND sales.fk_date < COALESCE(customer_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_product') }} AS product_dim
    ON sales.fk_product = product_dim.nk_product
    AND sales.fk_date >= product_dim.valid_from::date
    AND sales.fk_date < COALESCE(product_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_payment_method') }} AS payment_method_dim
    ON sales.fk_payment_method = payment_method_dim.nk_payment_method