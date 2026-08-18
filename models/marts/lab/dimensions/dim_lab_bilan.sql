SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_lab_report,
    id AS nk_lab_report,
    
    name AS report_name,
    report_header

FROM {{ source('replica', 'lab_bilan') }}