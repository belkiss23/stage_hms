SELECT
    sk_employee,
    nk_employee,

    name_employee ,
    birth_date,
    address,
    email,
    phone_number,
    marital_status,
    social_security_number,
    ccp,
    hire_date,
    cv,
    
    valid_from,
    valid_to,
    is_current

FROM {{ source('replica', 'employee') }}