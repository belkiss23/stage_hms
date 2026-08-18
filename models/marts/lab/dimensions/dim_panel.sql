WITH source_versions AS (

    SELECT
        id,
        name,
        method,

        _airbyte_raw_id,
        _airbyte_extracted_at AS valid_from,

        {{ dbt_utils.generate_surrogate_key([
            'name',
            'method'
        ]) }} AS row_hash

    FROM {{ source('replica', 'laboratory_group') }}

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
    {{ dbt_utils.generate_surrogate_key(['id', 'valid_from']) }} AS sk_panel,
    id AS nk_panel,

    name AS panel_name,
    method AS panel_method,

    valid_from,
    valid_to,

    CASE
        WHEN valid_to IS NULL THEN TRUE
        ELSE FALSE
    END AS is_current

FROM historized