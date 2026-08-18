WITH source_versions AS (

    SELECT
        partner.id,
        partner.name,

        partner._airbyte_raw_id,
        partner._airbyte_extracted_at AS valid_from,

        {{ dbt_utils.generate_surrogate_key([
            'partner.name'
        ]) }} AS row_hash

    FROM {{ source('replica', 'res_partner') }} AS partner

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

),

referring_doctors AS (

    SELECT DISTINCT referring_doctor_id
    FROM {{ source('replica', 'acs_laboratory_request') }}
    WHERE referring_doctor_id IS NOT NULL

)

SELECT
    {{ dbt_utils.generate_surrogate_key(['h.id', 'h.valid_from']) }}
        AS sk_referring_doctor,

    h.id AS nk_referring_doctor,
    h.name AS referring_doctor_name,

    h.valid_from,
    h.valid_to,
    h.valid_to IS NULL AS is_current

FROM historized h

INNER JOIN referring_doctors rd
    ON h.id = rd.referring_doctor_id