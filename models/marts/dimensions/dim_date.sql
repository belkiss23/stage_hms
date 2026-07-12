SELECT
    sk_date,
    
    date_value,
    day_number,
    day_name,
    week_number,
    month_number,
    month_name,
    quarter_number,
    year_number,
    is_weekend

FROM {{ source('replica', 'date') }}