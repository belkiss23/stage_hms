SELECT
    purchase.id AS nk_purchase,

    date_dim.sk_date AS fk_date,

    supplier_dim.sk_supplier AS fk_supplier,
    product_dim.sk_product AS fk_product,

    payment_method_dim.nk_payment_method AS fk_payment_method,

    purchase.total_amount,
    purchase.amount_excluding_tax,
    purchase.unit_purchase_price,
    purchase.ordered_quantity

FROM {{ source('replica', 'purchase') }} AS purchase

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON purchase.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_supplier') }} AS supplier_dim
    ON purchase.fk_supplier = supplier_dim.nk_supplier
    AND purchase.fk_date >= supplier_dim.valid_from::date
    AND purchase.fk_date < COALESCE(supplier_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_product') }} AS product_dim
    ON purchase.fk_product = product_dim.nk_product
    AND purchase.fk_date >= product_dim.valid_from::date
    AND purchase.fk_date < COALESCE(product_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_payment_method') }} AS payment_method_dim
    ON purchase.fk_payment_method = payment_method_dim.nk_payment_method