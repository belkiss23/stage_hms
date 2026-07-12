SELECT
    fk_start_date,
    fk_end_date,
    fk_employee,
    fk_department,
    fk_position,
    fk_absence_reason,

    absent_days_count,
    absent_hours_count

FROM {{ source('replica', 'absence_declaration') }}