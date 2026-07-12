SELECT
    nk_loan_status,

    loan_status,
    loan_repayment_status

FROM {{ source('replica', 'loan_status') }}