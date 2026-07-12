SELECT
    sk_biologist,
    nk_biologist,

    name_biologist,
    speciality,
    email,
    phone_number

FROM {{ source('replica', 'biologist') }}