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
  , order_segmentation
FROM {{ ref('int_orders_segmentation_2023') }}

