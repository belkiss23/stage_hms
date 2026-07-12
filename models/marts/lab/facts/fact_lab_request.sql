SELECT
    fk_date,
    fk_patient,
    fk_referring_doctor,
    fk_test,
    fk_request_status

FROM {{ source('replica', 'lab_request') }}