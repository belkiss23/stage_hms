SELECT
    nk_training,
    
    training_title,
    location,
    training_type
    
FROM {{ source('replica', 'training') }}