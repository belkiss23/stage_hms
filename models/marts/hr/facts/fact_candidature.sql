SELECT
    candidature.id AS nk_candidature,

    date_dim.sk_date AS fk_date,
    position_dim.sk_position AS fk_position,
    department_dim.sk_department AS fk_department,

    candidature.candidate,
    candidature.hiring_status,
    candidature.hiring_decision,
    candidature.recruiter_name

FROM {{ source('replica', 'candidature') }} AS candidature

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON candidature.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON candidature.fk_position = position_dim.nk_position
    AND candidature.fk_date >= position_dim.valid_from::date
    AND candidature.fk_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON candidature.fk_department = department_dim.nk_department
    AND candidature.fk_date >= department_dim.valid_from::date
    AND candidature.fk_date < COALESCE(department_dim.valid_to::date, DATE '9999-12-31')