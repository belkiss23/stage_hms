SELECT
    fk_date,
    fk_supplier,
    fk_product,
    fk_warehouse,
    fk_storage_location,

    received_quantity

FROM {{ source('replica', 'receipt') }}