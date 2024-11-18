{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

select  
      date_date
    , customers_id
    , orders_id
    , qty_product
from {{ ref('int_sales_per_order') }}
