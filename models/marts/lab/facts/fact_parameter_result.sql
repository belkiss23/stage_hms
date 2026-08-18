SELECT
    parameter_result.id AS nk_parameter_result,

    parameter_result.patient_id AS nk_lab_result,
    parameter_result.request_id AS nk_lab_request,

    test_dim.sk_test AS fk_test,
    test_parameter_dim.sk_test_parameter AS fk_test_parameter,
    unit_dim.sk_unit_of_measure AS fk_unit_of_measure,

    parameter_result.name AS parameter_result_name,

    parameter_result.result AS result_value,
    parameter_result.num_result AS numeric_result_value,
    parameter_result.result_value_type,
    parameter_result.normal_range,
    parameter_result.remark,

    parameter_result.is_formule,
    parameter_result.printable,

    CASE
        WHEN LOWER(parameter_result.remark)
             IN ('critical', 'danger', 'high', 'low', 'abnormal')
        THEN 1
        ELSE 0
    END AS abnormal_results_count,

    1 AS total_parameter_results_count

FROM {{ source('replica', 'lab_test_critearea') }} AS parameter_result

LEFT JOIN {{ ref('dim_test') }} AS test_dim
    ON parameter_result.test_id =
       test_dim.nk_test

LEFT JOIN {{ ref('dim_test_parameter') }} AS test_parameter_dim
    ON parameter_result.test_criteria_template_id =
       test_parameter_dim.nk_test_parameter

LEFT JOIN {{ ref('dim_unit_of_measure') }} AS unit_dim
    ON parameter_result.lab_uom_id =
       unit_dim.nk_unit_of_measure

WHERE parameter_result.printable = TRUE