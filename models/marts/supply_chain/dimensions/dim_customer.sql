SELECT
    sk_customer,
    nk_customer,

    name,
    address,
    phone_number,
    email,
    bank_account,

    valid_from,
    valid_to,
    is_current
    
FROM {{ source('replica', 'customer') }}