SELECT
    assignment.id AS nk_employee_assignment,

    start_date_dim.sk_date AS fk_start_date,
    end_date_dim.sk_date AS fk_end_date,

    employee_dim.sk_employee AS fk_employee,
    position_dim.sk_position AS fk_position,
    department_dim.sk_department AS fk_department,

    assignment.assignment_duration,
    assignment.assignment_rate

FROM {{ source('replica', 'employee_assignment') }} AS assignment

LEFT JOIN {{ ref('dim_date') }} AS start_date_dim
    ON assignment.fk_start_date = start_date_dim.date_value

LEFT JOIN {{ ref('dim_date') }} AS end_date_dim
    ON assignment.fk_end_date = end_date_dim.date_value

LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON assignment.fk_employee = employee_dim.nk_employee
    AND assignment.fk_start_date >= employee_dim.valid_from::date
    AND assignment.fk_start_date < COALESCE(employee_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON assignment.fk_position = position_dim.nk_position
    AND assignment.fk_start_date >= position_dim.valid_from::date
    AND assignment.fk_start_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON assignment.fk_department = department_dim.nk_department
    AND assignment.fk_start_date >= department_dim.valid_from::date
    AND assignment.fk_start_date < COALESCE(department_dim.valid_to::date, DATE '9999-12-31')