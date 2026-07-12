SELECT
    nk_method,

    method_name

FROM {{ source('replica', 'method')}}