SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['partner.id']) }}
        AS sk_referral_partner,

    partner.id AS nk_referral_partner,
    partner.name AS referral_partner_name

FROM {{ source('replica', 'res_partner') }} AS partner

INNER JOIN {{ source('replica', 'acs_laboratory_request') }} AS request
    ON partner.id = request.referring_hospital_id

WHERE request.referring_hospital_id IS NOT NULL