SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_laboratory,
    id AS nk_laboratory,

    is_collection_center,
    active AS is_active

FROM {{ source('replica', 'acs_laboratory') }}