SELECT
    leave_request.id AS nk_leave_request,

    start_date_dim.sk_date AS fk_start_date,
    end_date_dim.sk_date AS fk_end_date,

    leave_dim.nk_leave AS fk_leave,
    employee_dim.sk_employee AS fk_employee,
    department_dim.sk_department AS fk_department,
    position_dim.sk_position AS fk_position,

    leave_request.leave_days_count

FROM {{ source('replica', 'leave_request') }} AS leave_request

LEFT JOIN {{ ref('dim_date') }} AS start_date_dim
    ON leave_request.fk_start_date = start_date_dim.date_value

LEFT JOIN {{ ref('dim_date') }} AS end_date_dim
    ON leave_request.fk_end_date = end_date_dim.date_value

LEFT JOIN {{ ref('dim_leave') }} AS leave_dim
    ON leave_request.fk_leave = leave_dim.nk_leave

LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON leave_request.fk_employee = employee_dim.nk_employee
    AND leave_request.fk_start_date >= employee_dim.valid_from::date
    AND leave_request.fk_start_date < COALESCE(employee_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON leave_request.fk_department = department_dim.nk_department
    AND leave_request.fk_start_date >= department_dim.valid_from::date
    AND leave_request.fk_start_date < COALESCE(department_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON leave_request.fk_position = position_dim.nk_position
    AND leave_request.fk_start_date >= position_dim.valid_from::date
    AND leave_request.fk_start_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')