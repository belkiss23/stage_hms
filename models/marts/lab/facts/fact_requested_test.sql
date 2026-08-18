SELECT
    request_line.id AS nk_requested_test,
    request_line.request_id AS nk_lab_request,

    test_dim.sk_test AS fk_test,

    request_line.quantity,
    request_line.sale_price,
    request_line.amount_total,
    request_line.instruction

FROM {{ source('replica', 'laboratory_request_line') }} AS request_line

LEFT JOIN {{ ref('dim_test') }} AS test_dim
    ON request_line.test_id =
       test_dim.nk_test