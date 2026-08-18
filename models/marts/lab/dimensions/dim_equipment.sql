SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS sk_equipment,
    id AS nk_equipment,

    name AS equipment_name,
    ip_address,
    status AS equipment_status

FROM {{ source('replica', 'laboratory_equipements') }}