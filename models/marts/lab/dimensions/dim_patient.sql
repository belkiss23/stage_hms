WITH source_versions AS (

    SELECT
        id,
        first_name,
        last_name,
        birth_date,
        gender,
        address,
        mobile,
        email,

        _airbyte_extracted_at AS valid_from,

        {{ dbt_utils.generate_surrogate_key([
            'first_name',
            'last_name',
            'birth_date',
            'gender',
            'address',
            'mobile',
            'email'
        ]) }} AS row_hash

    FROM {{ source('replica', 'hms_patient') }}

),

detected_changes AS (

    SELECT
        *,

        LAG(row_hash) OVER (
            PARTITION BY id
            ORDER BY valid_from
        ) AS previous_row_hash

    FROM source_versions

),

changed_versions AS (

    SELECT *
    FROM detected_changes

    WHERE previous_row_hash IS NULL
       OR row_hash IS DISTINCT FROM previous_row_hash

),

versioned AS (

    SELECT
        *,

        CASE
            WHEN ROW_NUMBER() OVER (
                PARTITION BY id
                ORDER BY valid_from
            ) = 1
            THEN TIMESTAMP '1900-01-01'

            ELSE valid_from
        END AS effective_valid_from

    FROM changed_versions

),

historized AS (

    SELECT
        *,

        LEAD(effective_valid_from) OVER (
            PARTITION BY id
            ORDER BY effective_valid_from
        ) AS valid_to

    FROM versioned

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'id',
        'effective_valid_from'
    ]) }} AS sk_patient,

    id AS nk_patient,

    first_name,
    last_name,
    birth_date,
    gender,
    address,
    mobile,
    email,

    effective_valid_from AS valid_from,
    valid_to,

    CASE
        WHEN valid_to IS NULL THEN TRUE
        ELSE FALSE
    END AS is_current

FROM historized