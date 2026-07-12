SELECT
    fk_start_date,
    fk_end_date,
    fk_employee,
    fk_position,
    fk_department,

    assignment_duration,
    assignment_rate

FROM {{ source('replica', 'employee_assignment') }}