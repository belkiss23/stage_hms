SELECT
    nk_request_status,

    status_name,
    status_order
    
FROM {{ source('replica', 'request_status') }}