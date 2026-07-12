SELECT
    nk_payment_method,

    payment_terms,
    online_payment,
    online_signature
    
FROM {{ source('replica', 'payment_method') }}