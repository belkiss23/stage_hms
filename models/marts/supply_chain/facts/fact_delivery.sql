SELECT
    delivery.id AS nk_delivery,

    date_dim.sk_date AS fk_date,
    customer_dim.sk_customer AS fk_customer,
    product_dim.sk_product AS fk_product,
    warehouse_dim.sk_warehouse AS fk_warehouse,
    storage_location_dim.sk_storage_location AS fk_storage_location,

    delivery.delivered_quantity,
    delivery.remaining_quantity

FROM {{ source('replica', 'delivery') }} AS delivery

LEFT JOIN {{ ref('dim_date') }} AS date_dim
    ON delivery.fk_date = date_dim.date_value

LEFT JOIN {{ ref('dim_customer') }} AS customer_dim
    ON delivery.fk_customer = customer_dim.nk_customer
    AND delivery.fk_date >= customer_dim.valid_from::date
    AND delivery.fk_date < COALESCE(customer_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_product') }} AS product_dim
    ON delivery.fk_product = product_dim.nk_product
    AND delivery.fk_date >= product_dim.valid_from::date
    AND delivery.fk_date < COALESCE(product_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_warehouse') }} AS warehouse_dim
    ON delivery.fk_warehouse = warehouse_dim.nk_warehouse
    AND delivery.fk_date >= warehouse_dim.valid_from::date
    AND delivery.fk_date < COALESCE(warehouse_dim.valid_to::date, DATE '9999-12-31')

LEFT JOIN {{ ref('dim_storage_location') }} AS storage_location_dim
    ON delivery.fk_storage_location = storage_location_dim.nk_storage_location
    AND delivery.fk_date >= storage_location_dim.valid_from::date
    AND delivery.fk_date < COALESCE(storage_location_dim.valid_to::date, DATE '9999-12-31')