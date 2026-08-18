SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_test,
    id AS nk_test,

    code AS test_code,
    name AS test_name,
    result_value_type,
    acs_tat AS expected_turnaround_time,
    contains_formula

FROM {{ source('replica', 'acs_lab_test') }}