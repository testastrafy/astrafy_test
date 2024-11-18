{{
    config(
        materialized = 'table',
        enabled = true,
        persist_docs={"relation": true, "columns": true}
    )
}}

select 
      {{ dbt_utils.generate_surrogate_key(['date_date', 'transaction_id', 'products_id']) }} as surrogate_key
    , date_date
    , client_id
    , transaction_id
    , products_id
    , turnover
    , qty               AS total_products
from {{ ref('sales_recrutement') }}
