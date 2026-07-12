SELECT
    fk_date,

    fk_patient,
    fk_test,
    fk_panel,

    fk_biologist,
    fk_equipment,

    fk_referring_doctor,
    fk_referral_partner,
    fk_region,

    fk_request_status,

    result_category,

    analysis_time_minutes,

    CASE
        WHEN validation_status = 'validated' THEN 1
        ELSE 0
    END AS valid_results_count,

    1 AS total_results_count

FROM {{ source('replica', 'lab_result') }}