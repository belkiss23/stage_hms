SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_sample_type,
    id AS nk_sample_type,
    name AS sample_type_name

FROM {{ source('replica', 'acs_laboratory_sample_type') }}