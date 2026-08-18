SELECT
    proforma.id AS nk_proforma_request,

    date_dim.sk_date AS fk_date,

    supplier_dim.sk_supplier AS fk_supplier,
    product_dim.sk_product AS fk_product,

    proforma.requested_quantity,
    proforma.total_amount,
    proforma.amount_excluding_tax

FROM {{ source('replica', 'proforma_request') }} AS proforma

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON proforma.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_supplier') }} AS supplier_dim
    ON proforma.fk_supplier = supplier_dim.nk_supplier
    AND proforma.fk_date >= supplier_dim.valid_from::date
    AND proforma.fk_date < COALESCE(supplier_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_product') }} AS product_dim
    ON proforma.fk_product = product_dim.nk_product
    AND proforma.fk_date >= product_dim.valid_from::date
    AND proforma.fk_date < COALESCE(product_dim.valid_to::date, DATE '9999-12-31')