{{
    config(
        materialized = 'table',
        enabled = true
    )
}}

select 
      date_date
    , client_id
    , transaction_id
    , products_id
    , turnover
    , qty
from {{ ref('sales_recrutement') }}
