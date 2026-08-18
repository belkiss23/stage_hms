WITH source_versions AS (

    SELECT
        nk_storage_location,
        fk_warehouse,

        region,
        city,
        zone,
        aisle,
        shelf_section,
        shelf,

        _airbyte_raw_id,
        _airbyte_extracted_at AS valid_from,

        {{ dbt_utils.generate_surrogate_key([
            'fk_warehouse',
            'region',
            'city',
            'zone',
            'aisle',
            'shelf_section',
            'shelf'
        ]) }} AS row_hash

    FROM {{ source('replica', 'storage_location') }}

),

detected_changes AS (

    SELECT
        *,
        LAG(row_hash) OVER (
            PARTITION BY nk_storage_location
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
            PARTITION BY nk_storage_location
            ORDER BY valid_from
        ) AS valid_to
    FROM changed_versions

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'nk_storage_location',
        'valid_from'
    ]) }} AS sk_storage_location,

    nk_storage_location,
    fk_warehouse,

    region,
    city,
    zone,
    aisle,
    shelf_section,
    shelf,

    valid_from,
    valid_to,
    valid_to IS NULL AS is_current

FROM historized