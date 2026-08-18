SELECT
    training_participation.id AS nk_training_participation,

    start_date_dim.sk_date AS fk_start_date,
    end_date_dim.sk_date AS fk_end_date,

    training_dim.nk_training AS fk_training,
    employee_dim.sk_employee AS fk_employee,
    department_dim.sk_department AS fk_department,
    position_dim.sk_position AS fk_position,

    training_participation.training_cost,
    training_participation.training_days_count

FROM {{ source('replica', 'training_participation') }} AS training_participation

LEFT JOIN {{ ref('dim_date') }} AS start_date_dim
    ON training_participation.fk_start_date = start_date_dim.date_value

LEFT JOIN {{ ref('dim_date') }} AS end_date_dim
    ON training_participation.fk_end_date = end_date_dim.date_value

LEFT JOIN {{ ref('dim_training') }} AS training_dim
    ON training_participation.fk_training = training_dim.nk_training

LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON training_participation.fk_employee = employee_dim.nk_employee
    AND training_participation.fk_start_date >= employee_dim.valid_from::date
    AND training_participation.fk_start_date < COALESCE(employee_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON training_participation.fk_department = department_dim.nk_department
    AND training_participation.fk_start_date >= department_dim.valid_from::date
    AND training_participation.fk_start_date < COALESCE(department_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON training_participation.fk_position = position_dim.nk_position
    AND training_participation.fk_start_date >= position_dim.valid_from::date
    AND training_participation.fk_start_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')