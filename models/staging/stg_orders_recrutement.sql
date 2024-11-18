{{
    config(
        materialized = 'table',
        enabled = true,
        persist_docs={"relation": true, "columns": true}
    )
}}

SELECT 
      {{ dbt_utils.generate_surrogate_key(['date_date', 'customers_id', 'orders_id']) }} AS surrogate_key
    , date_date
    , customers_id
    , orders_id
    , CA_ht
FROM {{ ref('orders_recrutement') }}





