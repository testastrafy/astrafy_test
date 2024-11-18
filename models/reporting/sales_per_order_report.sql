{{
    config(
        materialized = 'view',
        enabled = true
    )
}}

select  
      date_date
    , customers_id
    , orders_id
    , products_id
    , turnover
    , total_products
from {{ ref('int_sales_per_order') }}
