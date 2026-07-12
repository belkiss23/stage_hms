SELECT
    fk_date,
    fk_customer,
    fk_product,
    fk_warehouse,
    fk_storage_location,

    delivered_quantity,
    remaining_quantity

FROM {{ source('replica', 'delivery') }}