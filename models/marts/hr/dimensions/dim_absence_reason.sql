SELECT
    nk_absence_reason,

    absence_reason,
    supporting_document
    
FROM {{ source('replica', 'absence_reason') }}