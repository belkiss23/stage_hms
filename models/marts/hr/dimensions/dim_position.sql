SELECT
    sk_position,
    nk_position,
    fk_department,

    position_title,
    description,
    hierarchy_level,
    base_salary,

    valid_from,
    valid_to,
    is_current

FROM {{ source('replica', 'position') }}