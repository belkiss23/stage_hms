SELECT
    contract_fact.nk_contract AS nk_contract_fact,

    start_date_dim.sk_date AS fk_start_date,
    end_date_dim.sk_date AS fk_end_date,

    employee_dim.sk_employee AS fk_employee,
    position_dim.sk_position AS fk_position,
    contract_dim.sk_contract AS fk_contract,

    contract_fact.salary,
    contract_fact.contract_duration

FROM {{ source('replica', 'contract') }} AS contract_fact

LEFT JOIN {{ ref('dim_date') }} AS start_date_dim
    ON contract_fact.fk_start_date = start_date_dim.date_value

LEFT JOIN {{ ref('dim_date') }} AS end_date_dim
    ON contract_fact.fk_end_date = end_date_dim.date_value

LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON contract_fact.fk_employee = employee_dim.nk_employee
    AND contract_fact.fk_start_date >= employee_dim.valid_from::date
    AND contract_fact.fk_start_date < COALESCE(employee_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON contract_fact.fk_position = position_dim.nk_position
    AND contract_fact.fk_start_date >= position_dim.valid_from::date
    AND contract_fact.fk_start_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_contract') }} AS contract_dim
    ON contract_fact.fk_contract = contract_dim.nk_contract
    AND contract_fact.fk_start_date >= contract_dim.valid_from::date
    AND contract_fact.fk_start_date < COALESCE(contract_dim.valid_to::date, DATE '9999-12-31')