SELECT
    fk_start_date,
    fk_end_date,
    fk_leave,
    fk_employee,
    fk_department,
    fk_position,

    leave_days_count

FROM {{ source('replica', 'leave_request') }}