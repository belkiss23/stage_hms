SELECT
    nk_test_parameter,
    fk_test,

    parameter_name,
    unit,
    normal_min_value,
    normal_max_value

FROM {{ source('replica', 'test_parameter') }}