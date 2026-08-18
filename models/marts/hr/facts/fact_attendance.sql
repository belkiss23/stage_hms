SELECT
    attendance.id AS nk_attendance,

    date_dim.sk_date AS fk_date,

    employee_dim.sk_employee AS fk_employee,
    department_dim.sk_department AS fk_department,
    position_dim.sk_position AS fk_position,

    absence_reason_dim.nk_absence_reason AS fk_absence_reason,

    attendance.check_in_time,
    attendance.check_out_time,
    attendance.worked_hours,
    attendance.overtime_hours

FROM {{ source('replica', 'attendance') }} AS attendance

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON attendance.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON attendance.fk_employee = employee_dim.nk_employee
    AND attendance.fk_date >= employee_dim.valid_from::date
    AND attendance.fk_date < COALESCE(employee_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON attendance.fk_department = department_dim.nk_department
    AND attendance.fk_date >= department_dim.valid_from::date
    AND attendance.fk_date < COALESCE(department_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON attendance.fk_position = position_dim.nk_position
    AND attendance.fk_date >= position_dim.valid_from::date
    AND attendance.fk_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_absence_reason') }} AS absence_reason_dim
    ON attendance.fk_absence_reason = absence_reason_dim.nk_absence_reason