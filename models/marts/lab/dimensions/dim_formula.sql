SELECT
    nk_formula,

    formula_name,
    formula_expression

FROM {{ source('replica', 'formula') }}