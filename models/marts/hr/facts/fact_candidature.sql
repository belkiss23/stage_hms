SELECT

    fk_date,
    fk_position,
    fk_department,

    candidate,
    recruitment_status,
    hiring_decision,
    recruiter_name
    
FROM {{ source('replica', 'recruitment') }}