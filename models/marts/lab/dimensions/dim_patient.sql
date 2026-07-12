SELECT
    sk_patient,
    nk_patient,

    first_name,
    last_name,
    birth_date,
    age,
    gender,
    address,
    mobile,
    email,
    
    valid_from,
    valid_to,
    is_current
    
FROM {{ source('replica', 'patient') }}