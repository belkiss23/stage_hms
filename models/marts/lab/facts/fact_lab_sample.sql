SELECT
    fk_date,

    fk_patient,
    fk_sample_type,
    fk_request_status,
    fk_region,

    tube_count,
    collection_time_minutes,

    1 AS total_samples_count

FROM {{ source('replica', 'lab_sample') }}