{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

SELECT  
      o.date_date
    , customers_id
    , orders_id
    , CA_ht
    , sum(total_products) AS qty_product
FROM {{ ref('stg_orders_recrutement') }} AS o 
LEFT JOIN  {{ ref('stg_sales_recrutement') }} AS s
    ON  o.orders_id = s.transaction_id 
GROUP BY 
      o.date_date
    , customers_id
    , orders_id
    , CA_ht

