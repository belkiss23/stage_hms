SELECT
    fk_start_date,
    fk_end_date,
    fk_training,
    fk_employee,
    fk_department,
    fk_position,

    training_cost,
    training_days_count

FROM {{ source('replica', 'training_participation') }}