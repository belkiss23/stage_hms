SELECT
    fk_date,

    fk_patient,
    fk_test,
    fk_panel,

    fk_referral_partner,
    fk_region,

    outsourced_test_count,

    total_outsourcing_cost,
    total_outsourcing_price,

    total_outsourcing_price - total_outsourcing_cost
        AS total_outsourcing_margin,

    outsourcing_delay_days

FROM {{ source('replica', 'outsourcing') }}