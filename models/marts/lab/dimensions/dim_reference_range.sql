SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_referance_range,
    id AS nk_reference_range,

    age_min,
    age_max,
    age_unit,
    gender,

    normal_range AS reference_range,
    is_formule AS is_formula_based

FROM {{ source('replica', 'lab_test_normal_range') }}