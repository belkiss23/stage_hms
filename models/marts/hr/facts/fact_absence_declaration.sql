SELECT
    absence.id AS nk_absence_declaration,

    start_date_dim.sk_date AS fk_start_date,
    end_date_dim.sk_date AS fk_end_date,

    employee_dim.sk_employee AS fk_employee,
    department_dim.sk_department AS fk_department,
    position_dim.sk_position AS fk_position,

    absence_reason_dim.nk_absence_reason AS fk_absence_reason,

    absence.absent_days_count,
    absence.absent_hours_count

FROM {{ source('replica', 'absence_declaration') }} AS absence


LEFT JOIN {{ ref('dim_date') }} AS start_date_dim
    ON absence.fk_start_date = start_date_dim.date_value


LEFT JOIN {{ ref('dim_date') }} AS end_date_dim
    ON absence.fk_end_date = end_date_dim.date_value


LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON absence.fk_employee = employee_dim.nk_employee

    AND absence.fk_start_date >= employee_dim.valid_from::date

    AND absence.fk_start_date < COALESCE(
        employee_dim.valid_to::date,
        DATE '9999-12-31'
    )


LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON absence.fk_department = department_dim.nk_department

    AND absence.fk_start_date >= department_dim.valid_from::date

    AND absence.fk_start_date < COALESCE(
        department_dim.valid_to::date,
        DATE '9999-12-31'
    )


LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON absence.fk_position = position_dim.nk_position

    AND absence.fk_start_date >= position_dim.valid_from::date

    AND absence.fk_start_date < COALESCE(
        position_dim.valid_to::date,
        DATE '9999-12-31'
    )


LEFT JOIN {{ ref('dim_absence_reason') }} AS absence_reason_dim
    ON absence.fk_absence_reason =
       absence_reason_dim.nk_absence_reason