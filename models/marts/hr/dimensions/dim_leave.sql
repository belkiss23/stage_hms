SELECT
    nk_leave,

    leave_type,
    request_status

FROM {{ source('replica', 'leave') }}