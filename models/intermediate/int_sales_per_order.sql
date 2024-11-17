{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

select  
      o.date_date
    , customers_id
    , orders_id
    , products_id
    , turnover
    , qty
    , CA_ht
from {{ ref('stg_orders_recrutement') }} as o 
left join {{ ref('stg_sales_recrutement') }} as s 
    on o.orders_id = s.transaction_id
