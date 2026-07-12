SELECT
    nk_sample_type,

    sample_type_name
    
FROM {{ source('replica', 'sample_type') }}