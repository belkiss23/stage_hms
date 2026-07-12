SELECT
    sk_storage_location,
    nk_storage_location,
    fk_warehouse,

    region,
    city,
    zone,
    aisle,
    shelf_section,
    shelf,

    valid_from,
    valid_to,
    is_current

FROM {{ source('replica', 'storage_location') }}