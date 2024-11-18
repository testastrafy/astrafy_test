{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

SELECT  
      s.date_date
    , customers_id
    , orders_id
    , CA_ht
    , sum(total_products) AS qty_product
FROM {{ ref('stg_sales_recrutement') }} AS s 
LEFT JOIN  {{ ref('stg_orders_recrutement') }} AS o 
    ON  s.transaction_id = o.orders_id 
GROUP BY 
      s.date_date
    , customers_id
    , orders_id
    , CA_ht

