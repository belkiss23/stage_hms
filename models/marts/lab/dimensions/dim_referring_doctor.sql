SELECT
    sk_referring_doctor,
    nk_referring_doctor,

    name_doctor,
    specialty,
    phone_number,
    email,
    
    valid_from,
    valid_to,
    is_current

FROM {{ source('replica', 'referring_doctor') }}