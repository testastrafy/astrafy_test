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
    , qty
    , CA_ht
from {{ ref('int_sales_per_order') }}
