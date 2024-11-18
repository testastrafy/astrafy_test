{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

select 
  date_date,
  customers_id,
  orders_id,
  order_segmentation
from {{ ref('int_orders_segmentation_2023') }}

