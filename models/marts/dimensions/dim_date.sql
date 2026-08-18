WITH all_dates AS (

    SELECT date::date AS date_value
    FROM {{ source('replica', 'acs_laboratory_request') }}
    WHERE date IS NOT NULL

    UNION ALL

    SELECT date_requested::date
    FROM {{ source('replica', 'patient_laboratory_test') }}
    WHERE date_requested IS NOT NULL

    UNION ALL

    SELECT date_analysis::date
    FROM {{ source('replica', 'patient_laboratory_test') }}
    WHERE date_analysis IS NOT NULL

    UNION ALL

    SELECT date::date
    FROM {{ source('replica', 'acs_patient_laboratory_sample') }}
    WHERE date IS NOT NULL

),

date_bounds AS (

    SELECT
        MIN(date_value) AS min_date,
        GREATEST(
            MAX(date_value),
            CURRENT_DATE + INTERVAL '5 years'
        )::date AS max_date
    FROM all_dates

),

date_spine AS (

    SELECT
        generate_series(
            min_date,
            max_date,
            INTERVAL '1 day'
        )::date AS date_value
    FROM date_bounds

)

SELECT
    {{ dbt_utils.generate_surrogate_key(['date_value']) }} AS sk_date,

    date_value,

    EXTRACT(DAY FROM date_value)::INTEGER AS day_number,
    TRIM(TO_CHAR(date_value, 'Day')) AS day_name,

    EXTRACT(WEEK FROM date_value)::INTEGER AS week_number,

    EXTRACT(MONTH FROM date_value)::INTEGER AS month_number,
    TRIM(TO_CHAR(date_value, 'Month')) AS month_name,

    EXTRACT(QUARTER FROM date_value)::INTEGER AS quarter_number,
    EXTRACT(YEAR FROM date_value)::INTEGER AS year_number,

    CASE
        WHEN EXTRACT(ISODOW FROM date_value) IN (6, 7)
        THEN TRUE
        ELSE FALSE
    END AS is_weekend

FROM date_spine