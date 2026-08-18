SELECT
    payroll.id AS nk_payroll,

    date_dim.sk_date AS fk_date,

    employee_dim.sk_employee AS fk_employee,
    department_dim.sk_department AS fk_department,
    position_dim.sk_position AS fk_position,
    contract_dim.sk_contract AS fk_contract,
    loan_status_dim.nk_loan_status AS fk_loan_status,

    payroll.base_salary,
    payroll.bonus,
    payroll.allowances,
    payroll.deductions,
    payroll.net_salary

FROM {{ source('replica', 'payroll') }} AS payroll

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON payroll.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_employee') }} AS employee_dim
    ON payroll.fk_employee = employee_dim.nk_employee
    AND payroll.fk_date >= employee_dim.valid_from::date
    AND payroll.fk_date < COALESCE(employee_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_department') }} AS department_dim
    ON payroll.fk_department = department_dim.nk_department
    AND payroll.fk_date >= department_dim.valid_from::date
    AND payroll.fk_date < COALESCE(department_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_position') }} AS position_dim
    ON payroll.fk_position = position_dim.nk_position
    AND payroll.fk_date >= position_dim.valid_from::date
    AND payroll.fk_date < COALESCE(position_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_contract') }} AS contract_dim
    ON payroll.fk_contract = contract_dim.nk_contract
    AND payroll.fk_date >= contract_dim.valid_from::date
    AND payroll.fk_date < COALESCE(contract_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_loan_status') }} AS loan_status_dim
    ON payroll.fk_loan_status = loan_status_dim.nk_loan_status