SELECT
    nk_inventory_transaction_type,

    transaction_category

FROM {{ source('replica', 'inventory_transaction_type') }}