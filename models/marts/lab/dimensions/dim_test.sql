SELECT
    nk_test,

    name_test,
    category_test,
    type_result
    
FROM {{ source('replica', 'test') }}