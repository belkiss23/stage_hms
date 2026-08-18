SELECT
    panel_test.id AS nk_panel_test,

    panel_dim.sk_panel AS fk_panel,
    test_dim.sk_test AS fk_test,

    panel_test.sale_price,
    panel_test.instruction

FROM {{ source('replica', 'laboratory_group_line') }} AS panel_test

LEFT JOIN {{ ref('dim_panel') }} AS panel_dim
    ON panel_test.panel_id = panel_dim.nk_panel
   AND panel_dim.is_current = TRUE

LEFT JOIN {{ ref('dim_test') }} AS test_dim
    ON panel_test.test_id = test_dim.nk_test