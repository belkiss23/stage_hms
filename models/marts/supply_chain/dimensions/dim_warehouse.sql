SELECT
    sk_warehouse,
    nk_warehouse,

    name_warehouse
    number_warehouse,
    address,

    valid_from,
    valid_to,
    is_current
    
FROM {{ source('replica', 'warehouse') }}