WITH source_versions AS (

    SELECT
        nk_customer,

        name,
        address,
        phone_number,
        email,
        bank_account,

        _airbyte_raw_id,
        _airbyte_extracted_at AS cdc_valid_from,

        {{ dbt_utils.generate_surrogate_key([
            'name',
            'address',
            'phone_number',
            'email',
            'bank_account'
        ]) }} AS row_hash

    FROM {{ source('replica', 'customer') }}

),

detected_changes AS (

    SELECT
        *,

        LAG(row_hash) OVER (
            PARTITION BY nk_customer
            ORDER BY cdc_valid_from, _airbyte_raw_id
        ) AS previous_row_hash

    FROM source_versions

),

changed_versions AS (

    SELECT *
    FROM detected_changes

    WHERE previous_row_hash IS NULL
       OR row_hash IS DISTINCT FROM previous_row_hash

),

effective_versions AS (

    SELECT
        *,

        CASE
            WHEN ROW_NUMBER() OVER (
                PARTITION BY nk_customer
                ORDER BY cdc_valid_from, _airbyte_raw_id
            ) = 1
            THEN TIMESTAMP '1900-01-01'

            ELSE cdc_valid_from
        END AS valid_from

    FROM changed_versions

),

historized AS (

    SELECT
        *,

        LEAD(valid_from) OVER (
            PARTITION BY nk_customer
            ORDER BY valid_from
        ) AS valid_to

    FROM effective_versions

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'nk_customer',
        'valid_from'
    ]) }} AS sk_customer,

    nk_customer,

    name,
    address,
    phone_number,
    email,
    bank_account,

    valid_from,
    valid_to,
    valid_to IS NULL AS is_current

FROM historized