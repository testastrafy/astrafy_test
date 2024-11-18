{{
    config(
        materialized = 'table',
        enabled = true,
        persist_docs={"relation": true, "columns": true}
    )
}}

select 
      {{ dbt_utils.generate_surrogate_key(['date_date', 'customers_id', 'orders_id']) }} as surrogate_key
    , date_date
    , customers_id
    , orders_id
    , CA_ht
from {{ ref('orders_recrutement') }}





