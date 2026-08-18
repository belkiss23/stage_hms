SELECT
    receipt.id AS nk_receipt,

    date_dim.sk_date AS fk_date,

    supplier_dim.sk_supplier AS fk_supplier,
    product_dim.sk_product AS fk_product,
    warehouse_dim.sk_warehouse AS fk_warehouse,
    storage_location_dim.sk_storage_location AS fk_storage_location,

    receipt.received_quantity

FROM {{ source('replica', 'receipt') }} AS receipt

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON receipt.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_supplier') }} AS supplier_dim
    ON receipt.fk_supplier = supplier_dim.nk_supplier
    AND receipt.fk_date >= supplier_dim.valid_from::date
    AND receipt.fk_date < COALESCE(supplier_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_product') }} AS product_dim
    ON receipt.fk_product = product_dim.nk_product
    AND receipt.fk_date >= product_dim.valid_from::date
    AND receipt.fk_date < COALESCE(product_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_warehouse') }} AS warehouse_dim
    ON receipt.fk_warehouse = warehouse_dim.nk_warehouse
    AND receipt.fk_date >= warehouse_dim.valid_from::date
    AND receipt.fk_date < COALESCE(warehouse_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_storage_location') }} AS storage_location_dim
    ON receipt.fk_storage_location = storage_location_dim.nk_storage_location
    AND receipt.fk_date >= storage_location_dim.valid_from::date
    AND receipt.fk_date < COALESCE(storage_location_dim.valid_to::date, DATE '9999-12-31')