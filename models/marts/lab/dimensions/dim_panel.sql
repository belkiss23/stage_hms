SELECT
    sk_panel,
    nk_panel,

    panel_name,
    panel_category,
    panel_description,
    included_tests

FROM {{ source('replica', 'panel') }}