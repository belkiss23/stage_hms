SELECT
    loan_assignment.id AS nk_loan_assignment,

    start_date_dim.sk_date AS fk_start_date,
    end_date_dim.sk_date AS fk_end_date,

    employee_dim.sk_employee AS fk_employee,
    department_dim.sk_department AS fk_department,
    position_dim.sk_position AS fk_position,
    loan_status_dim.nk_loan_status AS fk_loan_status,

    loan_assignment.total_loan_amount,
    loan_assignment.loan_duration,
    loan_assignment.monthly_payment_amount

FROM {{ source('replica', 'loan_assignment') }} AS loan_assignment

LEFT JOIN {{ ref('dim_date') }} AS start_date_dim
    ON loan_assignment.fk_start_date = start_date_dim.date_value

LEFT JOIN {{ ref('dim_date') }} AS end_date_dim
    ON loan_assignment.fk_end_date = end_date_dim.date_value

LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON loan_assignment.fk_employee = employee_dim.nk_employee
    AND loan_assignment.fk_start_date >= employee_dim.valid_from::date
    AND loan_assignment.fk_start_date < COALESCE(employee_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON loan_assignment.fk_department = department_dim.nk_department
    AND loan_assignment.fk_start_date >= department_dim.valid_from::date
    AND loan_assignment.fk_start_date < COALESCE(department_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON loan_assignment.fk_position = position_dim.nk_position
    AND loan_assignment.fk_start_date >= position_dim.valid_from::date
    AND loan_assignment.fk_start_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_loan_status') }} AS loan_status_dim
    ON loan_assignment.fk_loan_status = loan_status_dim.nk_loan_status