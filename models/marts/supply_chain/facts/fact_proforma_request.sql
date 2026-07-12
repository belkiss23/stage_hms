SELECT
    fk_date,
    fk_supplier,
    fk_product,

    requested_quantity,
    total_amount,
    amount_excluding_tax
    
FROM {{ source('replica', 'proforma_request') }}