SELECT
    fk_start_date,
    fk_end_date,
    fk_employee,
    fk_department,
    fk_position,
    fk_loan_status,

    total_loan_amount,
    loan_duration,
    monthly_payment_amount

FROM {{ source('replica', 'loan_assignment') }}