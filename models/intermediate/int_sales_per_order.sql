{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

select  
      s.date_date
    , customers_id
    , orders_id
    , products_id
    , turnover
    , total_products
from {{ ref('stg_sales_recrutement') }} as s 
left join {{ ref('stg_orders_recrutement') }} as o 
    on  s.transaction_id = o.orders_id 
