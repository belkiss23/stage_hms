SELECT
    sk_supplier,
    nk_supplier,
    
    name,
    address,
    email,
    phone_number,

    valid_from,
    valid_to,
    is_current
    
FROM {{ source('replica', 'supplier') }}