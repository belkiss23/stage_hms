SELECT
    sk_region,
    nk_region,

    country,
    city,
    region_name,
    municipality,

    postal_code

FROM {{ source('replica', 'region') }}