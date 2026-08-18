SELECT
    sample.id AS nk_lab_sample,
    sample.request_id AS nk_lab_request,

    date_dim.sk_date AS fk_date,

    patient_dim.sk_patient AS fk_patient,
    sample_type_dim.sk_sample_type AS fk_sample_type,

    sample.name AS sample_reference,
    sample.state AS sample_status,
    sample.container_name,

    1 AS total_samples_count

FROM {{ source('replica', 'acs_patient_laboratory_sample') }} AS sample

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON sample.date::date = date_dim.date_value

LEFT JOIN {{ ref('dim_patient') }} AS patient_dim
    ON sample.patient_id = patient_dim.nk_patient
   AND sample.date >= patient_dim.valid_from
   AND sample.date < COALESCE(
        patient_dim.valid_to,
        TIMESTAMP '9999-12-31'
   )

LEFT JOIN {{ ref('dim_sample_type') }} AS sample_type_dim
    ON sample.sample_type_id =
       sample_type_dim.nk_sample_type