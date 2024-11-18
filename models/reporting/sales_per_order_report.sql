{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

SELECT  
      date_date
    , customers_id
    , orders_id
    , CA_ht
    , qty_product
FROM {{ ref('int_sales_per_order') }}
