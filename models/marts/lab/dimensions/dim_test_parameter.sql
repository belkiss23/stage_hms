SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_test_parameter,
    id AS nk_test_parameter,

    code AS parameter_code,
    name AS parameter_name,
    result_value_type,
    apply_range_to

FROM {{ source('replica', 'lab_test_criteria_template') }}