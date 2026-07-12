SELECT
    sk_product,
    nk_product,
    
    name_product,
    reference-product,
    description,
    cost_price,
    selling_price,
    unit_of_measure,
    packaging,
    category,
    product_type,
    purchase_unit_of_measure,
    tax_rate,

    valid_from,
    valid_to,
    is_current

FROM {{ source('replica', 'product') }}