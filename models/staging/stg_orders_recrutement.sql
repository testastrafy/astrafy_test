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
    , CA_ht
from {{ ref('orders_recrutement') }}





