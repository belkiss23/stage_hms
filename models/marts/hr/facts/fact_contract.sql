SELECT
    fk_start_date,
    fk_end_date,
    fk_employee,
    fk_position,
    fk_contract,

    salary,
    contract_duration

FROM {{ source('replica', 'contract') }}