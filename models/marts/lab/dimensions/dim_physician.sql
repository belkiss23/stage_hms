WITH source_versions AS (

    SELECT
        id,
        name_physician,
        specialty,
        email,
        phone_number,

        _airbyte_raw_id,
        _airbyte_extracted_at AS valid_from,

        {{ dbt_utils.generate_surrogate_key([
            'name_physician',
            'specialty',
            'email',
            'phone_number'
        ]) }} AS row_hash

    FROM {{ source('replica', 'hms_physician') }}

),

detected_changes AS (

    SELECT
        *,
        LAG(row_hash) OVER (
            PARTITION BY id
            ORDER BY valid_from, _airbyte_raw_id
        ) AS previous_row_hash

    FROM source_versions

),

changed_versions AS (

    SELECT *
    FROM detected_changes
    WHERE previous_row_hash IS NULL
       OR row_hash IS DISTINCT FROM previous_row_hash

),

historized AS (

    SELECT
        *,
        LEAD(valid_from) OVER (
            PARTITION BY id
            ORDER BY valid_from
        ) AS valid_to

    FROM changed_versions

)

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'valid_from']) }} AS sk_physician,
    id AS nk_physician,

    name_physician,
    specialty,
    email,
    phone_number,

    valid_from,
    valid_to,

    CASE
        WHEN valid_to IS NULL THEN TRUE
        ELSE FALSE
    END AS is_current

FROM historized