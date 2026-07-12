SELECT
    sk_referral_partner,
    nk_referral_partner,

    name_partner,
    type_partner,
    contract_status
    
FROM {{ source('replica', 'referral_partner') }}