SELECT
    fk_date,
    fk_employee,
    fk_department,
    fk_position,
    fk_absence_reason,

    check_in_time,
    check_out_time,
    worked_hours,
    overtime_hours

FROM {{ source('replica', 'attendance') }}