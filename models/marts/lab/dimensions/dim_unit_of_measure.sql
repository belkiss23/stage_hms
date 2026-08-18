SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_unit_of_measure,
    id AS nk_unit_of_measure,

    code AS unit_code,
    name AS unit_name

FROM {{ source('replica', 'acs_lab_test_uom') }}