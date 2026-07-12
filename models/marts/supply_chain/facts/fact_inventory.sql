SELECT
    fk_date,
    fk_product,
    fk_warehouse,
    fk_storage_location,
    fk_inventory_transaction_type,

    quantity,
    opening_stock,
    closing_stock

FROM {{ source('replica', 'inventory') }}