SELECT
    nk_equipment,

    name_equipment,
    type_equipment,
    brand,
    location
    
FROM {{ source('replica', 'equipment') }}