SELECT
    inventory.id AS nk_inventory,

    date_dim.sk_date AS fk_date,
    product_dim.sk_product AS fk_product,
    warehouse_dim.sk_warehouse AS fk_warehouse,
    storage_location_dim.sk_storage_location AS fk_storage_location,

    inventory_transaction_type_dim.nk_inventory_transaction_type AS fk_inventory_transaction_type,

    inventory.quantity,
    inventory.opening_stock,
    inventory.closing_stock

FROM {{ source('replica', 'inventory') }} AS inventory

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON inventory.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_product') }} AS product_dim
    ON inventory.fk_product = product_dim.nk_product
    AND inventory.fk_date >= product_dim.valid_from::date
    AND inventory.fk_date < COALESCE(product_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_warehouse') }} AS warehouse_dim
    ON inventory.fk_warehouse = warehouse_dim.nk_warehouse
    AND inventory.fk_date >= warehouse_dim.valid_from::date
    AND inventory.fk_date < COALESCE(warehouse_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_storage_location') }} AS storage_location_dim
    ON inventory.fk_storage_location = storage_location_dim.nk_storage_location
    AND inventory.fk_date >= storage_location_dim.valid_from::date
    AND inventory.fk_date < COALESCE(storage_location_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_inventory_transaction_type') }} AS inventory_transaction_type_dim
    ON inventory.fk_inventory_transaction_type =
       inventory_transaction_type_dim.nk_inventory_transaction_type