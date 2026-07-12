SELECT
    sk_department,
    nk_department,

    name_department,
    description,
    manager_department,
    location,

    valid_from,
    valid_to,
    is_current
    
FROM {{ source('replica', 'department') }}