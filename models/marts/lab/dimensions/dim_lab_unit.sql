SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_lab_unit,
    id AS nk_lab_unit,

    code AS lab_unit_code,
    name AS lab_unit_name,
    col_name,
    col_result

FROM {{ source('replica', 'lab_unit') }}