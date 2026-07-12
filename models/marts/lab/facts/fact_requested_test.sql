SELECT
    fk_date,

    fk_patient,
    fk_test,
    fk_panel,

    fk_referring_doctor,
    fk_referral_partner,
    fk_region,

    requested_test_count

FROM {{ source('replica', 'requested_test') }}