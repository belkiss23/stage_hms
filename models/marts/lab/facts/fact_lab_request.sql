SELECT
    request.id AS nk_lab_request,

    date_dim.sk_date AS fk_date,

    patient_dim.sk_patient AS fk_patient,
    physician_dim.sk_physician AS fk_physician,
    referring_doctor_dim.sk_referring_doctor AS fk_referring_doctor,
    referral_partner_dim.sk_referral_partner AS fk_referral_partner,

    laboratory_dim.sk_laboratory AS fk_laboratory,
    collection_center_dim.sk_laboratory AS fk_collection_center,

    request.name AS request_reference,
    request.payment_state,
    request.urgent,

    request.total_price,
    request.total_tat,

    CASE
        WHEN request.urgent = TRUE THEN 1
        ELSE 0
    END AS urgent_requests_count,

    CASE
        WHEN request.payment_state = 'paid' THEN 1
        ELSE 0
    END AS paid_requests_count,

    1 AS total_requests_count

FROM {{ source('replica', 'acs_laboratory_request') }} AS request

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON request.date::date = date_dim.date_value

LEFT JOIN {{ ref('dim_patient') }} AS patient_dim
    ON request.patient_id = patient_dim.nk_patient
   AND request.date >= patient_dim.valid_from
   AND request.date < COALESCE(
        patient_dim.valid_to,
        TIMESTAMP '9999-12-31'
   )

LEFT JOIN {{ ref('dim_physician') }} AS physician_dim
    ON request.physician_id = physician_dim.nk_physician
   AND request.date >= physician_dim.valid_from
   AND request.date < COALESCE(
        physician_dim.valid_to,
        TIMESTAMP '9999-12-31'
   )

LEFT JOIN {{ ref('dim_referring_doctor') }} AS referring_doctor_dim
    ON request.referring_doctor_id =
       referring_doctor_dim.nk_referring_doctor
   AND request.date >= referring_doctor_dim.valid_from
   AND request.date < COALESCE(
        referring_doctor_dim.valid_to,
        TIMESTAMP '9999-12-31'
   )

LEFT JOIN {{ ref('dim_referral_partner') }} AS referral_partner_dim
    ON request.referring_hospital_id =
       referral_partner_dim.nk_referral_partner

LEFT JOIN {{ ref('dim_laboratory') }} AS laboratory_dim
    ON request.laboratory_id =
       laboratory_dim.nk_laboratory

LEFT JOIN {{ ref('dim_laboratory') }} AS collection_center_dim
    ON request.collection_center_id =
       collection_center_dim.nk_laboratory