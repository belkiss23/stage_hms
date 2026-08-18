SELECT
    result.id AS nk_lab_result,
    result.request_id AS nk_lab_request,

    requested_date_dim.sk_date AS fk_requested_date,
    analysis_date_dim.sk_date AS fk_analysis_date,

    patient_dim.sk_patient AS fk_patient,
    test_dim.sk_test AS fk_test,
    physician_dim.sk_physician AS fk_physician,

    equipment_dim.sk_equipment AS fk_equipment,
    lab_unit_dim.sk_lab_unit AS fk_lab_unit,

    laboratory_dim.sk_laboratory AS fk_laboratory,
    collection_center_dim.sk_laboratory AS fk_collection_center,

    result.name AS result_reference,
    result.state AS result_status,

    result.diagnosis,
    result.report,

    CASE
        WHEN result.state = 'done' THEN 1
        ELSE 0
    END AS completed_results_count,

    CASE
        WHEN result.state = 'cancel' THEN 1
        ELSE 0
    END AS cancelled_results_count,

    1 AS total_results_count

FROM {{ source('replica', 'patient_laboratory_test') }} AS result

LEFT JOIN {{ ref('dim_date') }} AS requested_date_dim
    ON result.date_requested::date =
       requested_date_dim.date_value

LEFT JOIN {{ ref('dim_date') }} AS analysis_date_dim
    ON result.date_analysis::date =
       analysis_date_dim.date_value

LEFT JOIN {{ ref('dim_patient') }} AS patient_dim
    ON result.patient_id = patient_dim.nk_patient
   AND result.date_analysis >= patient_dim.valid_from
   AND result.date_analysis < COALESCE(
        patient_dim.valid_to,
        TIMESTAMP '9999-12-31'
   )

LEFT JOIN {{ ref('dim_test') }} AS test_dim
    ON result.test_id = test_dim.nk_test

LEFT JOIN {{ ref('dim_physician') }} AS physician_dim
    ON result.physician_id = physician_dim.nk_physician
   AND result.date_analysis >= physician_dim.valid_from
   AND result.date_analysis < COALESCE(
        physician_dim.valid_to,
        TIMESTAMP '9999-12-31'
   )

LEFT JOIN {{ ref('dim_equipment') }} AS equipment_dim
    ON result.equipement = equipment_dim.nk_equipment

LEFT JOIN {{ ref('dim_lab_unit') }} AS lab_unit_dim
    ON result.main_unit_id = lab_unit_dim.nk_lab_unit

LEFT JOIN {{ ref('dim_laboratory') }} AS laboratory_dim
    ON result.laboratory_id =
       laboratory_dim.nk_laboratory

LEFT JOIN {{ ref('dim_laboratory') }} AS collection_center_dim
    ON result.collection_center_id =
       collection_center_dim.nk_laboratory