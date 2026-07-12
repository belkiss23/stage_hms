SELECT
    sk_contract,
    nk_contract,

    type_contract,
    probation_period,
    status_contract,
    working_hours,
    
    valid_from,
    valid_to,
    is_current

FROM {{ source('replica', 'contract') }}