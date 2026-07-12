SELECT
    fk_date,
    fk_employee,
    fk_department,
    fk_position,
    fk_contract,
    fk_loan_status,

    base_salary,
    bonus,
    allowances,
    deductions,
    net_salary

FROM {{ source('replica', 'payroll') }}