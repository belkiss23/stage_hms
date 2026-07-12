SELECT
    nk_parameter_result,

    fk_date,

    fk_patient,
    fk_test,
    fk_panel,
    fk_test_parameter,
    fk_equipment,
    fk_method,

    normal_range,
    result_value,

    CASE
        WHEN interpretation IN ('critical', 'danger', 'red') THEN 'Critical'
        WHEN interpretation IN ('warning', 'moderate', 'abnormal', 'orange') THEN 'Warning'
        ELSE 'Normal'
    END AS result_category,

    1 AS total_parameter_results_count

FROM {{ source('replica', 'parameter_result') }}